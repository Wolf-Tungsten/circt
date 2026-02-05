//===- HWAggregateCorvusPorts.cpp - Bundle corvus partition IO -------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This pass aggregates the direct connections between `corvus_seq_P*` and
// `corvus_comb_P*` partitions instantiated under `corvus_top`. Instead of
// only bundling one-to-one edges, it now groups all signals that flow from a
// partition to a *set* of opposite-kind partitions. Each group becomes a
// single bundle port on the producer that is fanned out to every consumer in
// the set. The producer concatenates the bundled signals while each consumer
// immediately extracts them into wires, keeping partition IO compact without
// changing behaviour.
//
//===----------------------------------------------------------------------===//

#include "circt/Dialect/Comb/CombOps.h"
#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "circt/Dialect/HW/HWTypes.h"
#include "circt/Dialect/Seq/SeqOps.h"
#include "circt/Dialect/Seq/SeqTypes.h"
#include "circt/Support/BackedgeBuilder.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/ImplicitLocOpBuilder.h"
#include "mlir/IR/SymbolTable.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/Hashing.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/MathExtras.h"
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

enum class PartitionKind { Comb, Seq };

struct DestPortInfo {
  unsigned destId = 0;
  SmallVector<unsigned> inputPorts;
};

struct BundleSignal {
  unsigned sourcePortIdx = 0;
  Type type;
  SmallVector<DestPortInfo> consumers;
};

struct BundleInfo {
  BundleKind kind = BundleKind::CombToSeq;
  unsigned sourceId = 0;
  SmallVector<unsigned> destIds;
  SmallVector<BundleSignal> signals;
  StringAttr name;
  LocationAttr loc;
  Type type;
  SmallVector<int64_t> offsets;
};

struct ModuleBundlePlan {
  struct InputBundle {
    const BundleInfo *bundle = nullptr;
    SmallVector<SmallVector<unsigned>> signalInputPorts;
  };

  struct OutputBundle {
    const BundleInfo *bundle = nullptr;
    SmallVector<unsigned> signalOutputPorts;
  };

  SmallVector<InputBundle> inputs;
  SmallVector<OutputBundle> outputs;
};

struct AppendedPortInfo {
  BundleKind kind = BundleKind::CombToSeq;
  unsigned sourceId = 0;
  SmallVector<unsigned> destIds;
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

struct BundleGroupKey {
  BundleKind kind = BundleKind::CombToSeq;
  unsigned sourceId = 0;
  SmallVector<unsigned> destIds;

  bool operator==(const BundleGroupKey &rhs) const {
    return kind == rhs.kind && sourceId == rhs.sourceId &&
           destIds == rhs.destIds;
  }
};

static StringAttr makeBundleName(MLIRContext *ctx, BundleKind kind,
                                 unsigned sourceId, ArrayRef<unsigned> destIds) {
  std::string buffer;
  llvm::raw_string_ostream os(buffer);
  if (kind == BundleKind::CombToSeq)
    os << "C" << sourceId << "_to_S";
  else
    os << "S" << sourceId << "_to_C";
  llvm::interleave(destIds, os, "_");
  os << "_bundle";
  return StringAttr::get(ctx, os.str());
}

static FailureOr<int64_t> getSignalBitWidth(Location loc, Type type) {
  if (isa<seq::ClockType>(type))
    return 1;
  int64_t width = hw::getBitWidth(type);
  if (width <= 0)
    return emitError(loc) << "cannot determine bitwidth for type " << type;
  return width;
}

static FailureOr<Value> castValueToInteger(Location loc, OpBuilder &builder,
                                           Value value, unsigned width) {
  if (width == 0)
    return emitError(loc) << "cannot cast value with zero bitwidth";
  Type intType = builder.getIntegerType(width);
  if (isa<seq::ClockType>(value.getType())) {
    if (width != 1)
      return emitError(loc)
             << "clock values must map to a single bit, requested width "
             << width;
    return builder.createOrFold<seq::FromClockOp>(loc, value);
  }
  if (value.getType() == intType)
    return value;
  return builder.createOrFold<hw::BitcastOp>(loc, intType, value);
}

static FailureOr<Value> castIntegerToType(Location loc, OpBuilder &builder,
                                          Value value, Type targetType) {
  if (isa<seq::ClockType>(targetType)) {
    auto intTy = dyn_cast<IntegerType>(value.getType());
    if (!intTy || intTy.getWidth() != 1)
      return emitError(loc) << "cannot convert value of type "
                            << value.getType() << " to clock";
    return builder.createOrFold<seq::ToClockOp>(loc, value);
  }
  if (value.getType() == targetType)
    return value;
  return builder.createOrFold<hw::BitcastOp>(loc, targetType, value);
}

static const Partition &getPartition(const DiscoveredPartitions &parts,
                                     unsigned id) {
  auto it = parts.idToIndex.find(id);
  assert(it != parts.idToIndex.end() && "unknown partition id");
  return parts.partitions[it->second];
}

struct BundleKey {
  BundleKind kind = BundleKind::CombToSeq;
  unsigned sourceId = 0;
  SmallVector<unsigned> destIds;
  StringAttr bundleName;

  bool operator==(const BundleKey &rhs) const {
    return kind == rhs.kind && sourceId == rhs.sourceId &&
           destIds == rhs.destIds && bundleName == rhs.bundleName;
  }
};

} // namespace

namespace llvm {
template <>
struct DenseMapInfo<BundleGroupKey> {
  static inline BundleGroupKey getEmptyKey() {
    return {BundleKind::CombToSeq, ~0u, SmallVector<unsigned>()};
  }
  static inline BundleGroupKey getTombstoneKey() {
    return {BundleKind::CombToSeq, ~0u - 1, SmallVector<unsigned>()};
  }
  static unsigned getHashValue(const BundleGroupKey &key) {
    return hash_combine(static_cast<unsigned>(key.kind), key.sourceId,
                        hash_combine_range(key.destIds.begin(),
                                           key.destIds.end()));
  }
  static bool isEqual(const BundleGroupKey &lhs, const BundleGroupKey &rhs) {
    return lhs == rhs;
  }
};

template <>
struct DenseMapInfo<BundleKey> {
  static inline BundleKey getEmptyKey() {
    return {BundleKind::CombToSeq, ~0u, SmallVector<unsigned>(), StringAttr()};
  }
  static inline BundleKey getTombstoneKey() {
    return {BundleKind::CombToSeq, ~0u - 1, SmallVector<unsigned>(),
            StringAttr()};
  }
  static unsigned getHashValue(const BundleKey &key) {
    return hash_combine(static_cast<unsigned>(key.kind), key.sourceId,
                        hash_combine_range(key.destIds.begin(),
                                           key.destIds.end()),
                        key.bundleName);
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

struct BundleLayout {
  SmallVector<int64_t> offsets;
  int64_t totalWidth = 0;
};

static FailureOr<BundleLayout> computeAlignedLayout(Location loc,
                                                    ArrayRef<Type> types,
                                                    unsigned alignBits) {
  BundleLayout layout;
  int64_t current = 0;
  for (Type type : types) {
    auto widthOr = getSignalBitWidth(loc, type);
    if (failed(widthOr))
      return failure();
    current = llvm::alignTo(current, static_cast<uint64_t>(alignBits));
    layout.offsets.push_back(current);
    current += *widthOr;
  }
  layout.totalWidth = current;
  return layout;
}

static FailureOr<Type> buildBundleType(Location loc, int64_t totalWidth,
                                       OpBuilder &builder) {
  if (totalWidth <= 0)
    return emitError(loc) << "bundle width must be greater than zero";
  if (totalWidth > IntegerType::kMaxWidth)
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

static FailureOr<Value>
packValues(Location loc, OpBuilder &builder, ArrayRef<Value> values,
           ArrayRef<Type> originalTypes, ArrayRef<int64_t> offsets,
           int64_t totalWidth) {
  assert(values.size() == originalTypes.size() &&
         "expected values and types to align");
  assert(values.size() == offsets.size() &&
         "expected offsets to align with values");
  assert(totalWidth > 0 && "expected positive bundle width");

  SmallVector<Value> intValues;
  intValues.reserve(values.size());
  SmallVector<int64_t> widths;
  widths.reserve(values.size());
  for (auto [val, type] : llvm::zip(values, originalTypes)) {
    auto widthOr = getSignalBitWidth(loc, type);
    if (failed(widthOr))
      return failure();
    widths.push_back(*widthOr);
    auto castedOr =
        castValueToInteger(loc, builder, val, static_cast<unsigned>(*widthOr));
    if (failed(castedOr))
      return failure();
    intValues.push_back(*castedOr);
  }

  if (intValues.empty())
    return Value();

  SmallVector<Value> segments;
  int64_t current = 0;
  for (auto [idx, intVal] : llvm::enumerate(intValues)) {
    int64_t gap = offsets[idx] - current;
    if (gap < 0)
      return emitError(loc) << "computed negative padding for bundle packing";
    if (gap > 0) {
      auto zeroTy = builder.getIntegerType(static_cast<unsigned>(gap));
      segments.push_back(
          builder.create<hw::ConstantOp>(loc, zeroTy, 0).getResult());
      current += gap;
    }
    segments.push_back(intVal);
    current += widths[idx];
  }
  if (current != totalWidth && totalWidth != 0) {
    if (current < totalWidth) {
      auto zeroTy =
          builder.getIntegerType(static_cast<unsigned>(totalWidth - current));
      segments.push_back(
          builder.create<hw::ConstantOp>(loc, zeroTy, 0).getResult());
    } else {
      return emitError(loc) << "bundle packing exceeded expected width";
    }
  }

  if (segments.size() == 1)
    return segments.front();

  SmallVector<Value> msbFirst(segments.rbegin(), segments.rend());
  return builder.create<comb::ConcatOp>(loc, msbFirst).getResult();
}

static FailureOr<Value> extractSlice(Location loc, OpBuilder &builder,
                                     Value aggregate, Type targetType,
                                     int64_t lowBit) {
  auto widthOr = getSignalBitWidth(loc, targetType);
  if (failed(widthOr))
    return failure();
  int64_t width = *widthOr;
  if (width > std::numeric_limits<int32_t>::max() ||
      lowBit > std::numeric_limits<int32_t>::max())
    return emitError(loc) << "slice offset/width exceeds supported limit";
  Value slice = builder.create<comb::ExtractOp>(loc, aggregate,
                                                static_cast<int32_t>(lowBit),
                                                static_cast<int32_t>(width));
  return castIntegerToType(loc, builder, slice, targetType);
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
    : hw::impl::HWAggregateCorvusPortsBase<HWAggregateCorvusPortsPass> {
  using Base::Base;

  void runOnOperation() override;

private:
  LogicalResult discoverPartitions(ModuleOp module, hw::HWModuleOp topModule,
                                   DiscoveredPartitions &partitions);
  LogicalResult collectBundles(const DiscoveredPartitions &partitions,
                               SmallVectorImpl<BundleInfo> &bundles);
  LogicalResult
  buildModulePlans(const DiscoveredPartitions &partitions,
                   ArrayRef<BundleInfo> bundles,
                   DenseMap<hw::HWModuleOp, ModuleBundlePlan> &plans);
  LogicalResult rewriteModule(hw::HWModuleOp module,
                              const ModuleBundlePlan &plan,
                              ModuleAggregationResult &result);
  LogicalResult rewriteTopInstances(
      hw::HWModuleOp topModule, const DiscoveredPartitions &partitions,
      DenseMap<hw::HWModuleOp, ModuleAggregationResult> &results);
};

} // namespace

void HWAggregateCorvusPortsPass::runOnOperation() {
  ModuleOp module = getOperation();
  SymbolTable symbolTable(module);

  if (topModuleName.empty())
    return;

  auto topModule = symbolTable.lookup<hw::HWModuleOp>(
      StringAttr::get(module.getContext(), topModuleName));
  if (!topModule)
    return;

  DiscoveredPartitions partitions;
  if (failed(discoverPartitions(module, topModule, partitions))) {
    signalPassFailure();
    return;
  }

  if (partitions.partitions.empty())
    return;

  SmallVector<BundleInfo, 0> bundles;
  if (failed(collectBundles(partitions, bundles))) {
    signalPassFailure();
    return;
  }
  if (bundles.empty())
    return;

  DenseMap<hw::HWModuleOp, ModuleBundlePlan> plans;
  if (failed(buildModulePlans(partitions, bundles, plans))) {
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
        return mod.emitOpError("duplicate corvus_seq partition id ") << *seqId;
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

LogicalResult HWAggregateCorvusPortsPass::collectBundles(
    const DiscoveredPartitions &partitions,
    SmallVectorImpl<BundleInfo> &bundles) {
  bundles.clear();
  if (partitions.partitions.empty())
    return success();

  hw::HWModuleOp sampleModule = partitions.partitions.front().combModule;
  MLIRContext *ctx = sampleModule.getContext();
  DenseMap<BundleGroupKey, BundleInfo> bundleMap;

  auto classifyInstance = [&](Operation *op)
      -> std::optional<std::pair<PartitionKind, unsigned>> {
    if (auto it = partitions.combInstanceToId.find(op);
        it != partitions.combInstanceToId.end())
      return std::make_pair(PartitionKind::Comb, it->second);
    if (auto it = partitions.seqInstanceToId.find(op);
        it != partitions.seqInstanceToId.end())
      return std::make_pair(PartitionKind::Seq, it->second);
    return std::nullopt;
  };

  auto processInstance = [&](hw::InstanceOp inst, PartitionKind kind,
                             unsigned id) -> LogicalResult {
    BundleKind direction =
        kind == PartitionKind::Comb ? BundleKind::CombToSeq
                                    : BundleKind::SeqToComb;
    for (auto [idx, result] : llvm::enumerate(inst.getResults())) {
      DenseMap<unsigned, SmallVector<unsigned>> destInputs;
      bool allValid = true;
      for (OpOperand &use : result.getUses()) {
        auto consumerInst = dyn_cast<hw::InstanceOp>(use.getOwner());
        if (!consumerInst) {
          allValid = false;
          break;
        }
        auto classified = classifyInstance(consumerInst.getOperation());
        if (!classified || classified->first == kind) {
          allValid = false;
          break;
        }
        destInputs[classified->second].push_back(use.getOperandNumber());
      }
      if (!allValid || destInputs.empty())
        continue;

      SmallVector<unsigned> destIds;
      destIds.reserve(destInputs.size());
      for (auto &entry : destInputs)
        destIds.push_back(entry.first);
      llvm::sort(destIds);

      SmallVector<DestPortInfo> consumers;
      consumers.reserve(destIds.size());
      for (unsigned destId : destIds) {
        auto &ports = destInputs[destId];
        llvm::sort(ports);
        consumers.push_back({destId, ports});
      }

      BundleSignal signal{static_cast<unsigned>(idx), result.getType(),
                          std::move(consumers)};

      BundleGroupKey key{direction, id, destIds};
      auto [it, inserted] = bundleMap.try_emplace(key);
      BundleInfo &bundle = it->second;
      if (inserted) {
        bundle.kind = direction;
        bundle.sourceId = id;
        bundle.destIds = destIds;
        bundle.name = makeBundleName(ctx, direction, id, destIds);
        bundle.loc = inst.getLoc();
      }
      bundle.signals.push_back(std::move(signal));
    }
    return success();
  };

  for (const Partition &part : partitions.partitions) {
    if (failed(processInstance(part.combInstance, PartitionKind::Comb,
                               part.id)))
      return failure();
    if (failed(processInstance(part.seqInstance, PartitionKind::Seq, part.id)))
      return failure();
  }

  OpBuilder typeBuilder(ctx);
  for (auto &entry : bundleMap) {
    BundleInfo &bundle = entry.second;
    llvm::sort(bundle.signals,
               [](const BundleSignal &a, const BundleSignal &b) {
                 return a.sourcePortIdx < b.sourcePortIdx;
               });
    SmallVector<Type> types;
    types.reserve(bundle.signals.size());
    for (const auto &signal : bundle.signals)
      types.push_back(signal.type);
    auto layoutOr = computeAlignedLayout(bundle.loc, types, 32);
    if (failed(layoutOr))
      return failure();
    bundle.offsets = layoutOr->offsets;
    auto typeOr =
        buildBundleType(bundle.loc, layoutOr->totalWidth, typeBuilder);
    if (failed(typeOr))
      return failure();
    bundle.type = *typeOr;
    bundles.push_back(std::move(bundle));
  }

  llvm::sort(bundles, [](const BundleInfo &a, const BundleInfo &b) {
    if (a.kind != b.kind)
      return static_cast<unsigned>(a.kind) < static_cast<unsigned>(b.kind);
    if (a.sourceId != b.sourceId)
      return a.sourceId < b.sourceId;
    return std::lexicographical_compare(a.destIds.begin(), a.destIds.end(),
                                        b.destIds.begin(), b.destIds.end());
  });
  return success();
}

LogicalResult HWAggregateCorvusPortsPass::buildModulePlans(
    const DiscoveredPartitions &partitions, ArrayRef<BundleInfo> bundles,
    DenseMap<hw::HWModuleOp, ModuleBundlePlan> &plans) {
  plans.clear();
  if (bundles.empty())
    return success();
  if (partitions.partitions.empty())
    return success();

  auto appendSourcePlan = [&](hw::HWModuleOp module, const BundleInfo &bundle) {
    auto &plan = plans[module];
    ModuleBundlePlan::OutputBundle output;
    output.bundle = &bundle;
    for (const auto &signal : bundle.signals)
      output.signalOutputPorts.push_back(signal.sourcePortIdx);
    plan.outputs.push_back(std::move(output));
  };

  auto appendDestPlan = [&](hw::HWModuleOp module, const BundleInfo &bundle,
                            unsigned destId) -> LogicalResult {
    auto &plan = plans[module];
    ModuleBundlePlan::InputBundle input;
    input.bundle = &bundle;
    input.signalInputPorts.resize(bundle.signals.size());
    for (auto [sigIdx, signal] : llvm::enumerate(bundle.signals)) {
      auto it = llvm::find_if(signal.consumers,
                              [&](const DestPortInfo &info) {
                                return info.destId == destId;
                              });
      if (it == signal.consumers.end()) {
        auto diag =
            module.emitOpError("missing consumer mapping for bundle ")
            << bundle.name << " and partition id " << destId;
        (void)diag;
        return failure();
      }
      input.signalInputPorts[sigIdx] = it->inputPorts;
      llvm::sort(input.signalInputPorts[sigIdx]);
    }
    plan.inputs.push_back(std::move(input));
    return success();
  };

  for (const BundleInfo &bundle : bundles) {
    const Partition &sourcePart = getPartition(partitions, bundle.sourceId);
    hw::HWModuleOp sourceModule = bundle.kind == BundleKind::CombToSeq
                                      ? sourcePart.combModule
                                      : sourcePart.seqModule;
    appendSourcePlan(sourceModule, bundle);

    for (unsigned destId : bundle.destIds) {
      const Partition &destPart = getPartition(partitions, destId);
      hw::HWModuleOp destModule = bundle.kind == BundleKind::CombToSeq
                                      ? destPart.seqModule
                                      : destPart.combModule;
      if (failed(appendDestPlan(destModule, bundle, destId)))
        return failure();
    }
  }

  auto sortBundles = [](auto &bundleVec) {
    llvm::sort(bundleVec, [](const auto &lhs, const auto &rhs) {
      return lhs.bundle->name.getValue() < rhs.bundle->name.getValue();
    });
  };

  for (auto &entry : plans) {
    sortBundles(entry.second.inputs);
    sortBundles(entry.second.outputs);
  }

  return success();
}

LogicalResult
HWAggregateCorvusPortsPass::rewriteModule(hw::HWModuleOp module,
                                          const ModuleBundlePlan &plan,
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
      SmallVector<int64_t> offsets;
      values.reserve(spec.signalOutputPorts.size());
      types.reserve(spec.signalOutputPorts.size());
      offsets.reserve(spec.signalOutputPorts.size());
      for (unsigned idx : spec.signalOutputPorts) {
        Value val = outputOp.getOperand(idx);
        values.push_back(val);
        types.push_back(val.getType());
        offsets.push_back(spec.bundle->offsets[values.size() - 1]);
      }
      auto bundleIntTy = cast<IntegerType>(spec.bundle->type);
      auto packedOr = packValues(module.getLoc(), builder, values, types,
                                 offsets, bundleIntTy.getWidth());
      if (failed(packedOr))
        return failure();
      module.appendOutputs({{spec.bundle->name, *packedOr}});
      StringAttr actualName = StringAttr::get(
          module.getContext(), module.getOutputName(insertIndex));
      outputsToErase.append(spec.signalOutputPorts.begin(),
                            spec.signalOutputPorts.end());

      AppendedPortInfo info;
      info.kind = spec.bundle->kind;
      info.sourceId = spec.bundle->sourceId;
      info.destIds = spec.bundle->destIds;
      info.name = actualName;
      info.type = spec.bundle->type;
      info.bundleName = spec.bundle->name;
      result.appendedOutputs.push_back(std::move(info));
    }
  }

  if (!plan.inputs.empty()) {
    builder.setInsertionPointToStart(body);
    unsigned wireCounter = 0;
    for (const auto &spec : plan.inputs) {
      auto inserted =
          module.insertInputs(module.getNumInputPorts(),
                              {{spec.bundle->name, spec.bundle->type}});
      Value aggregate = inserted.front().second;
      StringAttr actualName = inserted.front().first;

      SmallVector<int64_t> offsets(spec.bundle->offsets.begin(),
                                   spec.bundle->offsets.end());

      SmallVector<Value> extracted(spec.bundle->signals.size());
      auto getWire = [&](unsigned sigIdx) -> FailureOr<Value> {
        if (extracted[sigIdx])
          return extracted[sigIdx];
        auto sliceOr = extractSlice(module.getLoc(), builder, aggregate,
                                    spec.bundle->signals[sigIdx].type,
                                    offsets[sigIdx]);
        if (failed(sliceOr))
          return failure();
        std::string wireName =
            (spec.bundle->name.getValue() + "_slice" + std::to_string(sigIdx))
                .str();
        std::string symName =
            wireName + "_sym" + std::to_string(wireCounter++);
        auto wire = builder
                        .create<hw::WireOp>(
                            module.getLoc(), *sliceOr,
                            builder.getStringAttr(wireName),
                            hw::InnerSymAttr::get(
                                builder.getStringAttr(symName)))
                        .getResult();
        extracted[sigIdx] = wire;
        return wire;
      };

      for (auto [sigIdx, ports] : llvm::enumerate(spec.signalInputPorts)) {
        auto wireOr = getWire(sigIdx);
        if (failed(wireOr))
          return failure();
        for (unsigned portIdx : ports) {
          BlockArgument arg = body->getArgument(portIdx);
          arg.replaceAllUsesWith(*wireOr);
          inputsToErase.push_back(portIdx);
        }
      }

      AppendedPortInfo info;
      info.kind = spec.bundle->kind;
      info.sourceId = spec.bundle->sourceId;
      info.destIds = spec.bundle->destIds;
      info.name = actualName;
      info.type = spec.bundle->type;
      info.bundleName = spec.bundle->name;
      result.appendedInputs.push_back(std::move(info));
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

  auto makeKey = [&](const AppendedPortInfo &endpoint) {
    BundleKey key;
    key.kind = endpoint.kind;
    key.sourceId = endpoint.sourceId;
    key.destIds = endpoint.destIds;
    key.bundleName = endpoint.bundleName;
    return key;
  };

  auto getOperand = [&](const AppendedPortInfo &endpoint) -> Value {
    if (!endpoint.type)
      llvm::report_fatal_error("bundle endpoint missing type");
    if (!endpoint.bundleName)
      llvm::report_fatal_error("bundle endpoint missing identifier");
    BundleKey key = makeKey(endpoint);
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
    BundleKey key = makeKey(endpoint);
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
        unsigned resultIdx = newInst.getNumResults() - appendedCount + relIdx;
        recordOutput(endpoint, newInst.getResult(resultIdx));
      }
    }

    auto outputRemoved = [&](unsigned idx, ArrayRef<unsigned> removed) -> bool {
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
      std::string destStr;
      llvm::raw_string_ostream os(destStr);
      llvm::interleaveComma(
          key.destIds, os,
          [&](unsigned destId) { os << "P" << destId; });
      diag.attachNote() << "missing producer for "
                        << (key.kind == BundleKind::CombToSeq ? "comb->seq"
                                                              : "seq->comb")
                        << " bundle from P" << key.sourceId << " to " << destStr
                        << " (" << key.bundleName << ")";
    }
    return failure();
  }

  if (failed(edgeBuilder.clearOrEmitError()))
    return failure();

  return success();
}
