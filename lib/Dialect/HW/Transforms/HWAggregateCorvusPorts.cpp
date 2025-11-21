//===- HWAggregateCorvusPorts.cpp - Bundle corvus partition IO -------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This pass finds one-to-one connections between matching `corvus_seq_P*`
// and `corvus_comb_P*` modules inside `corvus_top` and aggregates them into
// wide bundle ports. It reduces the number of tiny cross-partition ports by
// concatenating the signals on the producer side and extracting them on the
// consumer side. The resulting aggregated ports are appended to the module
// interfaces and the `corvus_top` instances are rewritten to keep the design
// functionally equivalent.
//
//===----------------------------------------------------------------------===//

#include "circt/Dialect/Comb/CombOps.h"
#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "circt/Dialect/HW/HWTypes.h"
#include "circt/Support/BackedgeBuilder.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/ImplicitLocOpBuilder.h"
#include "mlir/IR/SymbolTable.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/Hashing.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"
#include <algorithm>
#include <limits>
#include <optional>
#include <string>

namespace circt {
namespace hw {
#define GEN_PASS_DEF_HWAGGREGATECORVUSPORTS
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

using namespace mlir;
using namespace circt;
using namespace hw;

namespace {

constexpr unsigned kInvalidIndex = std::numeric_limits<unsigned>::max();

enum class BundleKind { CombToSeq, SeqToComb };

struct CombToSeqSignal {
  unsigned combOutputIdx = 0;
  unsigned seqInputIdx = 0;
  Type type;
};

struct SeqToCombSignal {
  unsigned seqOutputIdx = 0;
  unsigned combInputIdx = 0;
  Type type;
};

struct Partition {
  unsigned id = 0;
  hw::HWModuleOp combModule;
  hw::HWModuleOp seqModule;
  hw::InstanceOp combInstance;
  hw::InstanceOp seqInstance;
};

struct DiscoveredPartitions {
  SmallVector<Partition> partitions;
  DenseMap<unsigned, unsigned> idToIndex;
  DenseMap<Operation *, unsigned> combInstanceToId;
  DenseMap<Operation *, unsigned> seqInstanceToId;
};

struct PartitionPairKey {
  unsigned combId = 0;
  unsigned seqId = 0;

  bool operator==(const PartitionPairKey &rhs) const {
    return combId == rhs.combId && seqId == rhs.seqId;
  }
};

struct PartitionPairInfo {
  PartitionPairKey key;
  SmallVector<CombToSeqSignal> combToSeq;
  SmallVector<SeqToCombSignal> seqToComb;
  StringAttr combToSeqBundleName;
  StringAttr seqToCombBundleName;
};

struct BundleEndpoint {
  BundleKind kind;
  unsigned combId = 0;
  unsigned seqId = 0;
  StringAttr name;
  Type type;
};

struct BundleChunkSpec {
  SmallVector<unsigned> producerPorts;
  SmallVector<unsigned> consumerPorts;
  SmallVector<Type> elementTypes;
};

struct InputBundleSpec {
  BundleEndpoint endpoint;
  SmallVector<unsigned> portIndices;
};

struct OutputBundleSpec {
  BundleEndpoint endpoint;
  SmallVector<unsigned> portIndices;
};

struct ModuleBundlePlan {
  SmallVector<InputBundleSpec> inputs;
  SmallVector<OutputBundleSpec> outputs;
};

struct AppendedPortInfo {
  BundleKind kind;
  unsigned combId = 0;
  unsigned seqId = 0;
  StringAttr name;
  Type type;
  StringAttr bundleName;
};

struct ModuleAggregationResult {
  hw::HWModuleOp module;
  unsigned originalInputCount = 0;
  unsigned originalOutputCount = 0;
  SmallVector<unsigned> removedInputs;
  SmallVector<unsigned> removedOutputs;
  SmallVector<unsigned> oldInputToNew;
  SmallVector<unsigned> oldOutputToNew;
  SmallVector<AppendedPortInfo> appendedInputs;
  SmallVector<AppendedPortInfo> appendedOutputs;
};

static StringAttr makeBundleName(MLIRContext *ctx, BundleKind kind,
                                 unsigned combId, unsigned seqId) {
  std::string buffer;
  llvm::raw_string_ostream os(buffer);
  if (kind == BundleKind::CombToSeq)
    os << "CP" << combId << "_to_SP" << seqId;
  else
    os << "SP" << seqId << "_to_CP" << combId;
  return StringAttr::get(ctx, os.str());
}

static const Partition &
getPartition(const DiscoveredPartitions &parts, unsigned id) {
  auto it = parts.idToIndex.find(id);
  assert(it != parts.idToIndex.end() && "unknown partition id");
  return parts.partitions[it->second];
}

struct BundleKey {
  unsigned combId = 0;
  unsigned seqId = 0;
  BundleKind kind = BundleKind::CombToSeq;
  StringAttr bundleName;

  bool operator==(const BundleKey &rhs) const {
    return combId == rhs.combId && seqId == rhs.seqId && kind == rhs.kind &&
           bundleName == rhs.bundleName;
  }
};

} // namespace

namespace llvm {
template <> struct DenseMapInfo<PartitionPairKey> {
  static inline PartitionPairKey getEmptyKey() { return {~0u, ~0u}; }
  static inline PartitionPairKey getTombstoneKey() { return {~0u - 1, ~0u - 1}; }
  static unsigned getHashValue(const PartitionPairKey &key) {
    return hash_combine(key.combId, key.seqId);
  }
  static bool isEqual(const PartitionPairKey &lhs,
                      const PartitionPairKey &rhs) {
    return lhs == rhs;
  }
};

template <> struct DenseMapInfo<BundleKey> {
  static inline BundleKey getEmptyKey() {
    return {~0u, ~0u, BundleKind::CombToSeq, StringAttr()};
  }
  static inline BundleKey getTombstoneKey() {
    return {~0u - 1, ~0u - 1, BundleKind::CombToSeq, StringAttr()};
  }
  static unsigned getHashValue(const BundleKey &key) {
    return hash_combine(key.combId, key.seqId,
                        static_cast<unsigned>(key.kind), key.bundleName);
  }
  static bool isEqual(const BundleKey &lhs, const BundleKey &rhs) {
    return lhs == rhs;
  }
};
} // namespace llvm

namespace {

static std::optional<unsigned> parsePartitionId(StringRef name,
                                                StringRef prefix) {
  if (!name.starts_with(prefix))
    return std::nullopt;
  StringRef suffix = name.drop_front(prefix.size());
  if (suffix.empty())
    return std::nullopt;
  unsigned value = 0;
  if (suffix.consumeInteger(10, value) || !suffix.empty())
    return std::nullopt;
  return value;
}

static FailureOr<Type> buildBundleType(Location loc, ArrayRef<Type> types,
                                       OpBuilder &builder) {
  int64_t totalWidth = 0;
  for (Type type : types) {
    int64_t width = hw::getBitWidth(type);
    if (width <= 0)
      return emitError(loc) << "cannot determine bitwidth for type " << type;
    totalWidth += width;
  }
  if (totalWidth <= 0)
    return emitError(loc) << "bundle width must be greater than zero";
  if (totalWidth > std::numeric_limits<int32_t>::max())
    return emitError(loc) << "bundle width " << totalWidth
                          << " exceeds supported limit";
  return builder.getIntegerType(static_cast<unsigned>(totalWidth));
}

static SmallVector<unsigned>
computeOldToNewMapping(unsigned oldCount, ArrayRef<unsigned> removed) {
  SmallVector<unsigned> mapping(oldCount, kInvalidIndex);
  unsigned removedSoFar = 0;
  size_t idx = 0;
  for (unsigned oldIdx = 0; oldIdx < oldCount; ++oldIdx) {
    bool isRemoved = idx < removed.size() && removed[idx] == oldIdx;
    if (isRemoved) {
      mapping[oldIdx] = kInvalidIndex;
      ++removedSoFar;
      ++idx;
    } else {
      mapping[oldIdx] = oldIdx - removedSoFar;
    }
  }
  return mapping;
}

template <typename SignalT, typename ProducerGetter, typename ConsumerGetter>
static LogicalResult
buildBundleChunks(ArrayRef<SignalT> signals, bool enforceLimit,
                  int64_t widthLimit, Location loc,
                  ProducerGetter &&getProducerIdx,
                  ConsumerGetter &&getConsumerIdx,
                  SmallVectorImpl<BundleChunkSpec> &chunks) {
  chunks.clear();
  if (signals.empty())
    return success();

  BundleChunkSpec current;
  int64_t currentWidth = 0;
  auto flush = [&]() {
    if (current.elementTypes.empty())
      return;
    chunks.push_back(std::move(current));
    current = BundleChunkSpec();
    currentWidth = 0;
  };

  for (const auto &signal : signals) {
    int64_t width = hw::getBitWidth(signal.type);
    if (width <= 0)
      return emitError(loc) << "cannot determine bitwidth for type "
                            << signal.type;
    if (enforceLimit && currentWidth != 0 &&
        currentWidth + width > widthLimit)
      flush();
    current.producerPorts.push_back(getProducerIdx(signal));
    current.consumerPorts.push_back(getConsumerIdx(signal));
    current.elementTypes.push_back(signal.type);
    currentWidth += width;
    if (enforceLimit && currentWidth >= widthLimit)
      flush();
  }

  flush();
  return success();
}

static FailureOr<Value>
packValues(Location loc, OpBuilder &builder, ArrayRef<Value> values,
           ArrayRef<Type> originalTypes) {
  SmallVector<Value> intValues;
  intValues.reserve(values.size());
  for (auto [val, type] : llvm::zip(values, originalTypes)) {
    int64_t width = hw::getBitWidth(type);
    if (width <= 0)
      return emitError(loc) << "cannot determine bitwidth for type " << type;
    Type intType = builder.getIntegerType(static_cast<unsigned>(width));
    Value casted = val;
    if (val.getType() != intType)
      casted = builder.createOrFold<hw::BitcastOp>(loc, intType, val);
    intValues.push_back(casted);
  }

  if (intValues.empty())
    return Value();
  if (intValues.size() == 1)
    return intValues.front();

  SmallVector<Value> msbFirst(intValues.rbegin(), intValues.rend());
  return builder.create<comb::ConcatOp>(loc, msbFirst).getResult();
}

static FailureOr<Value> extractSlice(Location loc, OpBuilder &builder,
                                     Value aggregate, Type targetType,
                                     int64_t lowBit) {
  int64_t width = hw::getBitWidth(targetType);
  if (width <= 0)
    return emitError(loc) << "cannot determine bitwidth for type "
                          << targetType;
  if (width > std::numeric_limits<int32_t>::max() ||
      lowBit > std::numeric_limits<int32_t>::max())
    return emitError(loc) << "slice offset/width exceeds supported limit";
  Value slice =
      builder.create<comb::ExtractOp>(loc, aggregate,
                                      static_cast<int32_t>(lowBit),
                                      static_cast<int32_t>(width));
  if (slice.getType() != targetType)
    slice = builder.createOrFold<hw::BitcastOp>(loc, targetType, slice);
  return slice;
}

static void eraseArguments(Block *body, ArrayRef<unsigned> indices) {
  SmallVector<unsigned> sorted(indices.begin(), indices.end());
  llvm::sort(sorted, std::greater<unsigned>());
  for (unsigned idx : sorted)
    body->eraseArgument(idx);
}

static void eraseOperands(Operation *op, ArrayRef<unsigned> indices) {
  SmallVector<unsigned> sorted(indices.begin(), indices.end());
  llvm::sort(sorted, std::greater<unsigned>());
  for (unsigned idx : sorted)
    op->eraseOperand(idx);
}

struct HWAggregateCorvusPortsPass
    : hw::impl::HWAggregateCorvusPortsBase<
          HWAggregateCorvusPortsPass> {
  using Base::Base;

  void runOnOperation() override;

private:
  LogicalResult discoverPartitions(ModuleOp module, hw::HWModuleOp topModule,
                                   DiscoveredPartitions &partitions);
  LogicalResult
  collectPartitionPairs(const DiscoveredPartitions &partitions,
                        SmallVectorImpl<PartitionPairInfo> &pairs);
  LogicalResult
  buildModulePlans(const DiscoveredPartitions &partitions,
                   ArrayRef<PartitionPairInfo> pairs,
                   DenseMap<hw::HWModuleOp, ModuleBundlePlan> &plans);
  LogicalResult rewriteModule(hw::HWModuleOp module,
                              const ModuleBundlePlan &plan,
                              ModuleAggregationResult &result);
  LogicalResult
  rewriteTopInstances(hw::HWModuleOp topModule,
                      const DiscoveredPartitions &partitions,
                      DenseMap<hw::HWModuleOp, ModuleAggregationResult> &results);
};

} // namespace

void HWAggregateCorvusPortsPass::runOnOperation() {
  ModuleOp module = getOperation();
  SymbolTable symbolTable(module);

  if (topModuleName.empty())
    return;

  auto topModule =
      symbolTable.lookup<hw::HWModuleOp>(StringAttr::get(module.getContext(),
                                                         topModuleName));
  if (!topModule)
    return;

  DiscoveredPartitions partitions;
  if (failed(discoverPartitions(module, topModule, partitions))) {
    signalPassFailure();
    return;
  }

  if (partitions.partitions.empty())
    return;

  SmallVector<PartitionPairInfo> pairs;
  if (failed(collectPartitionPairs(partitions, pairs))) {
    signalPassFailure();
    return;
  }
  if (pairs.empty())
    return;

  DenseMap<hw::HWModuleOp, ModuleBundlePlan> plans;
  if (failed(buildModulePlans(partitions, pairs, plans))) {
    signalPassFailure();
    return;
  }
  if (plans.empty())
    return;

  DenseMap<hw::HWModuleOp, ModuleAggregationResult> moduleResults;
  for (auto &plan : plans) {
    ModuleAggregationResult result;
    if (failed(rewriteModule(plan.first, plan.second, result))) {
      signalPassFailure();
      return;
    }
    moduleResults.try_emplace(plan.first, std::move(result));
  }

  if (moduleResults.empty())
    return;

  if (failed(rewriteTopInstances(topModule, partitions, moduleResults)))
    signalPassFailure();
}

LogicalResult HWAggregateCorvusPortsPass::discoverPartitions(
    ModuleOp module, hw::HWModuleOp topModule,
    DiscoveredPartitions &partitions) {
  StringRef combPrefix = combPartitionPrefix.empty()
                             ? "corvus_comb_P"
                             : StringRef(combPartitionPrefix);
  StringRef seqPrefix = seqPartitionPrefix.empty()
                            ? "corvus_seq_P"
                            : StringRef(seqPartitionPrefix);

  DenseMap<unsigned, hw::HWModuleOp> combModules;
  DenseMap<unsigned, hw::HWModuleOp> seqModules;
  for (hw::HWModuleOp mod : module.getOps<hw::HWModuleOp>()) {
    StringRef name = mod.getModuleName();
    if (auto combId = parsePartitionId(name, combPrefix)) {
      if (!combModules.try_emplace(*combId, mod).second)
        return mod.emitOpError("duplicate corvus_comb partition id ")
               << *combId;
      continue;
    }
    if (auto seqId = parsePartitionId(name, seqPrefix)) {
      if (!seqModules.try_emplace(*seqId, mod).second)
        return mod.emitOpError("duplicate corvus_seq partition id ")
               << *seqId;
    }
  }

  DenseMap<unsigned, hw::InstanceOp> combInstances;
  DenseMap<unsigned, hw::InstanceOp> seqInstances;
  for (Operation &op : topModule.getBodyBlock()->without_terminator()) {
    auto inst = dyn_cast<hw::InstanceOp>(&op);
    if (!inst)
      continue;
    StringRef target = inst.getReferencedModuleName();
    if (auto combId = parsePartitionId(target, combPrefix)) {
      if (!combInstances.try_emplace(*combId, inst).second)
        return inst.emitOpError("duplicated corvus_comb instance for id ")
               << *combId;
      continue;
    }
    if (auto seqId = parsePartitionId(target, seqPrefix)) {
      if (!seqInstances.try_emplace(*seqId, inst).second)
        return inst.emitOpError("duplicated corvus_seq instance for id ")
               << *seqId;
    }
  }

  for (auto &it : combInstances)
    if (!combModules.contains(it.first))
      return it.second.emitOpError(
          "referenced corvus_comb module not found for partition id ")
             << it.first;
  for (auto &it : seqInstances)
    if (!seqModules.contains(it.first))
      return it.second.emitOpError(
          "referenced corvus_seq module not found for partition id ")
             << it.first;

  for (auto &it : combModules)
    if (!seqModules.contains(it.first))
      return it.second.emitOpError(
                 "missing corvus_seq module for partition id ")
             << it.first;
  for (auto &it : seqModules)
    if (!combModules.contains(it.first))
      return it.second.emitOpError(
                 "missing corvus_comb module for partition id ")
             << it.first;

  for (auto &it : combModules)
    if (!combInstances.contains(it.first))
      return topModule.emitOpError("missing corvus_comb instance for id ")
             << it.first;
  for (auto &it : seqModules)
    if (!seqInstances.contains(it.first))
      return topModule.emitOpError("missing corvus_seq instance for id ")
             << it.first;

  SmallVector<unsigned> ids;
  ids.reserve(combModules.size());
  for (auto &pair : combModules)
    ids.push_back(pair.first);
  llvm::sort(ids);

  for (unsigned id : ids) {
    Partition entry;
    entry.id = id;
    entry.combModule = combModules.lookup(id);
    entry.seqModule = seqModules.lookup(id);
    entry.combInstance = combInstances.lookup(id);
    entry.seqInstance = seqInstances.lookup(id);
    partitions.idToIndex.try_emplace(id, partitions.partitions.size());
    partitions.partitions.push_back(entry);
    partitions.combInstanceToId[entry.combInstance.getOperation()] = id;
    partitions.seqInstanceToId[entry.seqInstance.getOperation()] = id;
  }
  return success();
}

LogicalResult HWAggregateCorvusPortsPass::collectPartitionPairs(
    const DiscoveredPartitions &partitions,
    SmallVectorImpl<PartitionPairInfo> &pairs) {
  pairs.clear();
  if (partitions.partitions.empty())
    return success();

  hw::HWModuleOp sampleModule = partitions.partitions.front().combModule;
  MLIRContext *ctx = sampleModule.getContext();
  DenseMap<PartitionPairKey, PartitionPairInfo> pairMap;

  auto getPair = [&](unsigned combId,
                     unsigned seqId) -> PartitionPairInfo & {
    PartitionPairKey key{combId, seqId};
    auto [it, inserted] = pairMap.try_emplace(key);
    if (inserted) {
      it->second.key = key;
      it->second.combToSeqBundleName =
          makeBundleName(ctx, BundleKind::CombToSeq, combId, seqId);
      it->second.seqToCombBundleName =
          makeBundleName(ctx, BundleKind::SeqToComb, combId, seqId);
    }
    return it->second;
  };

  for (const Partition &part : partitions.partitions) {
    unsigned combId = part.id;
    hw::InstanceOp combInst = part.combInstance;
    for (auto [idx, result] : llvm::enumerate(combInst.getResults())) {
      if (!result.hasOneUse())
        continue;
      OpOperand &use = *result.use_begin();
      auto consumerInst = dyn_cast<hw::InstanceOp>(use.getOwner());
      if (!consumerInst)
        continue;
      auto seqIt =
          partitions.seqInstanceToId.find(consumerInst.getOperation());
      if (seqIt == partitions.seqInstanceToId.end())
        continue;
      unsigned seqId = seqIt->second;
      auto &info = getPair(combId, seqId);
      info.combToSeq.push_back(
          CombToSeqSignal{static_cast<unsigned>(idx),
                          static_cast<unsigned>(use.getOperandNumber()),
                          result.getType()});
    }
  }

  for (const Partition &part : partitions.partitions) {
    unsigned seqId = part.id;
    hw::InstanceOp seqInst = part.seqInstance;
    for (auto [idx, result] : llvm::enumerate(seqInst.getResults())) {
      if (!result.hasOneUse())
        continue;
      OpOperand &use = *result.use_begin();
      auto consumerInst = dyn_cast<hw::InstanceOp>(use.getOwner());
      if (!consumerInst)
        continue;
      auto combIt =
          partitions.combInstanceToId.find(consumerInst.getOperation());
      if (combIt == partitions.combInstanceToId.end())
        continue;
      unsigned combId = combIt->second;
      auto &info = getPair(combId, seqId);
      info.seqToComb.push_back(
          SeqToCombSignal{static_cast<unsigned>(idx),
                          static_cast<unsigned>(use.getOperandNumber()),
                          result.getType()});
    }
  }

  for (auto &it : pairMap) {
    PartitionPairInfo &info = it.second;
    if (info.combToSeq.empty() && info.seqToComb.empty())
      continue;

    if (!info.combToSeq.empty()) {
      llvm::sort(info.combToSeq,
                 [](const CombToSeqSignal &a, const CombToSeqSignal &b) {
                   return a.combOutputIdx < b.combOutputIdx;
                 });
    }

    if (!info.seqToComb.empty()) {
      llvm::sort(info.seqToComb,
                 [](const SeqToCombSignal &a, const SeqToCombSignal &b) {
                   return a.seqOutputIdx < b.seqOutputIdx;
                 });
    }

    pairs.push_back(info);
  }

  return success();
}

LogicalResult HWAggregateCorvusPortsPass::buildModulePlans(
    const DiscoveredPartitions &partitions,
    ArrayRef<PartitionPairInfo> pairs,
    DenseMap<hw::HWModuleOp, ModuleBundlePlan> &plans) {
  plans.clear();
  if (pairs.empty())
    return success();
  if (partitions.partitions.empty())
    return success();

  auto sortSpecs = [](auto &specs) {
    llvm::sort(specs, [](const auto &lhs, const auto &rhs) {
      if (lhs.endpoint.combId != rhs.endpoint.combId)
        return lhs.endpoint.combId < rhs.endpoint.combId;
      if (lhs.endpoint.seqId != rhs.endpoint.seqId)
        return lhs.endpoint.seqId < rhs.endpoint.seqId;
      if (lhs.endpoint.kind != rhs.endpoint.kind)
        return static_cast<unsigned>(lhs.endpoint.kind) <
               static_cast<unsigned>(rhs.endpoint.kind);
      return lhs.endpoint.name.getValue() < rhs.endpoint.name.getValue();
    });
  };

  bool enforceLimit = maxBundleBitWidth != 0;
  int64_t widthLimit =
      enforceLimit ? static_cast<int64_t>(maxBundleBitWidth) : 0;

  hw::HWModuleOp sampleModule = partitions.partitions.front().combModule;
  MLIRContext *ctx = sampleModule.getContext();
  OpBuilder typeBuilder(ctx);
  auto makeChunkName = [&](StringAttr base, unsigned idx,
                           unsigned total) -> StringAttr {
    if (total <= 1)
      return base;
    std::string buffer = base.getValue().str();
    buffer.push_back('_');
    buffer += std::to_string(idx);
    return StringAttr::get(ctx, buffer);
  };

  for (const PartitionPairInfo &info : pairs) {
    const Partition &combPart = getPartition(partitions, info.key.combId);
    const Partition &seqPart = getPartition(partitions, info.key.seqId);
    hw::HWModuleOp combModule = combPart.combModule;
    hw::HWModuleOp seqModule = seqPart.seqModule;
    auto &combPlan = plans[combModule];
    auto &seqPlan = plans[seqModule];

    if (!info.combToSeq.empty()) {
      SmallVector<BundleChunkSpec> chunks;
      if (failed(buildBundleChunks(ArrayRef<CombToSeqSignal>(info.combToSeq),
                                   enforceLimit, widthLimit,
                                   combModule.getLoc(),
                                   [](const CombToSeqSignal &signal) {
                                     return signal.combOutputIdx;
                                   },
                                   [](const CombToSeqSignal &signal) {
                                     return signal.seqInputIdx;
                                   },
                                   chunks)))
        return failure();
      unsigned chunkCount = chunks.size();
      for (auto [chunkIdx, chunk] : llvm::enumerate(chunks)) {
        auto typeOr = buildBundleType(combModule.getLoc(),
                                      chunk.elementTypes, typeBuilder);
        if (failed(typeOr))
          return failure();
        BundleEndpoint endpoint{BundleKind::CombToSeq, info.key.combId,
                                info.key.seqId,
                                makeChunkName(info.combToSeqBundleName,
                                              chunkIdx, chunkCount),
                                *typeOr};

        OutputBundleSpec combOutput{endpoint};
        combOutput.portIndices = chunk.producerPorts;
        combPlan.outputs.push_back(std::move(combOutput));

        InputBundleSpec seqInput{endpoint};
        seqInput.portIndices = chunk.consumerPorts;
        seqPlan.inputs.push_back(std::move(seqInput));
      }
    }

    if (!info.seqToComb.empty()) {
      SmallVector<BundleChunkSpec> chunks;
      if (failed(buildBundleChunks(ArrayRef<SeqToCombSignal>(info.seqToComb),
                                   enforceLimit, widthLimit,
                                   seqModule.getLoc(),
                                   [](const SeqToCombSignal &signal) {
                                     return signal.seqOutputIdx;
                                   },
                                   [](const SeqToCombSignal &signal) {
                                     return signal.combInputIdx;
                                   },
                                   chunks)))
        return failure();
      unsigned chunkCount = chunks.size();
      for (auto [chunkIdx, chunk] : llvm::enumerate(chunks)) {
        auto typeOr = buildBundleType(seqModule.getLoc(),
                                      chunk.elementTypes, typeBuilder);
        if (failed(typeOr))
          return failure();
        BundleEndpoint endpoint{BundleKind::SeqToComb, info.key.combId,
                                info.key.seqId,
                                makeChunkName(info.seqToCombBundleName,
                                              chunkIdx, chunkCount),
                                *typeOr};

        OutputBundleSpec seqOutput{endpoint};
        seqOutput.portIndices = chunk.producerPorts;
        seqPlan.outputs.push_back(std::move(seqOutput));

        InputBundleSpec combInput{endpoint};
        combInput.portIndices = chunk.consumerPorts;
        combPlan.inputs.push_back(std::move(combInput));
      }
    }
  }

  for (auto &entry : plans) {
    sortSpecs(entry.second.inputs);
    sortSpecs(entry.second.outputs);
  }
  return success();
}

LogicalResult HWAggregateCorvusPortsPass::rewriteModule(
    hw::HWModuleOp module, const ModuleBundlePlan &plan,
    ModuleAggregationResult &result) {
  if (plan.inputs.empty() && plan.outputs.empty())
    return success();

  Block *body = module.getBodyBlock();
  auto outputOp = cast<hw::OutputOp>(body->getTerminator());
  OpBuilder builder(module.getContext());

  result.module = module;
  result.originalInputCount = module.getNumInputPorts();
  result.originalOutputCount = module.getNumOutputPorts();

  SmallVector<unsigned> inputsToErase;
  SmallVector<unsigned> outputsToErase;

  if (!plan.outputs.empty()) {
    builder.setInsertionPoint(outputOp);
    for (const auto &spec : plan.outputs) {
      unsigned insertIndex = module.getNumOutputPorts();
      SmallVector<Value> values;
      SmallVector<Type> types;
      values.reserve(spec.portIndices.size());
      types.reserve(spec.portIndices.size());
      for (unsigned idx : spec.portIndices) {
        Value val = outputOp.getOperand(idx);
        values.push_back(val);
        types.push_back(val.getType());
      }
      auto packedOr = packValues(module.getLoc(), builder, values, types);
      if (failed(packedOr))
        return failure();
      module.appendOutputs({{spec.endpoint.name, *packedOr}});
      StringAttr actualName = StringAttr::get(
          module.getContext(), module.getOutputName(insertIndex));
      outputsToErase.append(spec.portIndices.begin(), spec.portIndices.end());
      result.appendedOutputs.push_back(
          {spec.endpoint.kind, spec.endpoint.combId, spec.endpoint.seqId,
           actualName, spec.endpoint.type, spec.endpoint.name});
    }
  }

  if (!plan.inputs.empty()) {
    for (const auto &spec : plan.inputs) {
      auto inserted = module.insertInputs(module.getNumInputPorts(),
                                          {{spec.endpoint.name,
                                            spec.endpoint.type}});
      Value aggregate = inserted.front().second;
      StringAttr actualName = inserted.front().first;
      builder.setInsertionPointToStart(body);
      int64_t offset = 0;
      for (unsigned idx : spec.portIndices) {
        BlockArgument arg = body->getArgument(idx);
        auto sliceOr =
            extractSlice(module.getLoc(), builder, aggregate, arg.getType(),
                         offset);
        if (failed(sliceOr))
          return failure();
        arg.replaceAllUsesWith(*sliceOr);
        int64_t width = hw::getBitWidth(arg.getType());
        if (width <= 0) {
          module.emitOpError("cannot determine bitwidth for type ")
              << arg.getType();
          return failure();
        }
        offset += width;
      }
      inputsToErase.append(spec.portIndices.begin(), spec.portIndices.end());
      result.appendedInputs.push_back(
          {spec.endpoint.kind, spec.endpoint.combId, spec.endpoint.seqId,
           actualName, spec.endpoint.type, spec.endpoint.name});
    }
  }

  auto dedupSort = [](SmallVector<unsigned> &values) {
    llvm::sort(values);
    values.erase(std::unique(values.begin(), values.end()), values.end());
  };
  dedupSort(inputsToErase);
  dedupSort(outputsToErase);

  module.modifyPorts({}, {}, inputsToErase, outputsToErase);
  eraseArguments(body, inputsToErase);
  eraseOperands(outputOp, outputsToErase);

  result.removedInputs = inputsToErase;
  result.removedOutputs = outputsToErase;
  result.oldInputToNew =
      computeOldToNewMapping(result.originalInputCount, inputsToErase);
  result.oldOutputToNew =
      computeOldToNewMapping(result.originalOutputCount, outputsToErase);
  return success();
}

LogicalResult HWAggregateCorvusPortsPass::rewriteTopInstances(
    hw::HWModuleOp topModule, const DiscoveredPartitions &partitions,
    DenseMap<hw::HWModuleOp, ModuleAggregationResult> &results) {
  if (results.empty())
    return success();

  OpBuilder edgeOpBuilder(topModule.getBodyBlock(),
                          topModule.getBodyBlock()->begin());
  BackedgeBuilder edgeBuilder(edgeOpBuilder, topModule.getLoc());

  DenseMap<BundleKey, Value> producedBundles;
  DenseMap<BundleKey, SmallVector<Backedge>> pendingBundles;

  auto getOperand = [&](const AppendedPortInfo &endpoint) -> Value {
    if (!endpoint.type)
      llvm::report_fatal_error("bundle endpoint missing type");
    if (!endpoint.bundleName)
      llvm::report_fatal_error("bundle endpoint missing identifier");
    BundleKey key{endpoint.combId, endpoint.seqId, endpoint.kind,
                  endpoint.bundleName};
    if (auto it = producedBundles.find(key); it != producedBundles.end())
      return it->second;
    edgeOpBuilder.setInsertionPointToStart(topModule.getBodyBlock());
    Backedge edge = edgeBuilder.get(endpoint.type);
    pendingBundles[key].push_back(edge);
    return edge;
  };

  auto recordOutput = [&](const AppendedPortInfo &endpoint, Value value) {
    if (!endpoint.bundleName)
      llvm::report_fatal_error("bundle endpoint missing identifier");
    BundleKey key{endpoint.combId, endpoint.seqId, endpoint.kind,
                  endpoint.bundleName};
    producedBundles[key] = value;
    if (auto it = pendingBundles.find(key); it != pendingBundles.end()) {
      for (Backedge edge : it->second)
        edge.setValue(value);
      pendingBundles.erase(it);
    }
  };

  auto rewriteInstance = [&](hw::InstanceOp inst,
                             ModuleAggregationResult &modResult) {
    SmallVector<Value> appendedOperands;
    appendedOperands.reserve(modResult.appendedInputs.size());
    for (const auto &endpoint : modResult.appendedInputs)
      appendedOperands.push_back(getOperand(endpoint));

    SmallVector<StringAttr> appendedOperandNames;
    appendedOperandNames.reserve(modResult.appendedInputs.size());
    for (const auto &endpoint : modResult.appendedInputs)
      appendedOperandNames.push_back(endpoint.name);

    SmallVector<StringAttr> appendedResultNames;
    appendedResultNames.reserve(modResult.appendedOutputs.size());
    for (const auto &endpoint : modResult.appendedOutputs)
      appendedResultNames.push_back(endpoint.name);

    SmallVector<Value> newOperands;
    newOperands.reserve(modResult.oldInputToNew.size() +
                        appendedOperands.size());
    for (auto [idx, value] : llvm::enumerate(inst.getOperands()))
      if (modResult.oldInputToNew[idx] != kInvalidIndex)
        newOperands.push_back(value);
    newOperands.append(appendedOperands.begin(), appendedOperands.end());

    ImplicitLocOpBuilder builder(inst.getLoc(), inst);
    auto newInst = hw::InstanceOp::create(
        builder, modResult.module, inst.getInstanceNameAttr(), newOperands,
        inst.getParameters(), inst.getInnerSymAttr());
    newInst->setDialectAttrs(inst->getDialectAttrs());
    if (inst.getDoNotPrintAttr())
      newInst.setDoNotPrintAttr(inst.getDoNotPrintAttr());

    if (auto argNames = inst.getArgNamesAttr()) {
      SmallVector<Attribute> names;
      names.reserve(newOperands.size());
      for (auto [idx, attr] : llvm::enumerate(argNames))
        if (modResult.oldInputToNew[idx] != kInvalidIndex)
          names.push_back(attr);
      names.append(appendedOperandNames.begin(), appendedOperandNames.end());
      newInst.setArgNamesAttr(ArrayAttr::get(inst.getContext(), names));
    }

    if (auto resNames = inst.getResultNamesAttr()) {
      SmallVector<Attribute> names;
      for (auto [idx, attr] : llvm::enumerate(resNames))
        if (!llvm::is_contained(modResult.removedOutputs, idx))
          names.push_back(attr);
      names.append(appendedResultNames.begin(), appendedResultNames.end());
      newInst.setResultNamesAttr(ArrayAttr::get(inst.getContext(), names));
    }

    unsigned appendedCount = modResult.appendedOutputs.size();
    if (appendedCount != 0) {
      for (auto [relIdx, endpoint] :
           llvm::enumerate(modResult.appendedOutputs)) {
        unsigned resultIdx =
            newInst.getNumResults() - appendedCount + relIdx;
        recordOutput(endpoint, newInst.getResult(resultIdx));
      }
    }

    auto outputRemoved = [&](unsigned idx,
                             ArrayRef<unsigned> removed) -> bool {
      return llvm::is_contained(removed, idx);
    };

    for (auto [idx, mapIdx] : llvm::enumerate(modResult.oldOutputToNew)) {
      if (outputRemoved(idx, modResult.removedOutputs)) {
        inst.getResult(idx).dropAllUses();
        continue;
      }
      assert(mapIdx != kInvalidIndex &&
             "expected kept output to have valid mapping");
      inst.getResult(idx).replaceAllUsesWith(newInst.getResult(mapIdx));
    }
    inst.erase();
  };

  for (const Partition &part : partitions.partitions) {
    if (auto it = results.find(part.combModule); it != results.end())
      rewriteInstance(part.combInstance, it->second);
    if (auto it = results.find(part.seqModule); it != results.end())
      rewriteInstance(part.seqInstance, it->second);
  }

  if (!pendingBundles.empty()) {
    auto diag =
        topModule.emitOpError("failed to wire all aggregated corvus bundles");
    for (const auto &it : pendingBundles) {
      const BundleKey &key = it.first;
      diag.attachNote()
          << "missing producer for "
          << (key.kind == BundleKind::CombToSeq ? "comb->seq" : "seq->comb")
          << " bundle between P" << key.combId << " and P" << key.seqId
          << " (" << key.bundleName << ")";
    }
    return failure();
  }

  if (failed(edgeBuilder.clearOrEmitError()))
    return failure();

  return success();
}
