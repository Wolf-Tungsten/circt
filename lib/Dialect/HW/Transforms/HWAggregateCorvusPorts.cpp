//===- HWAggregateCorvusPorts.cpp - Bundle corvus partition IO -------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This pass finds one-to-one connections between matching `__corvus_seq_P*`
// and `__corvus_comb_P*` modules inside `__corvus_top` and aggregates them into
// wide bundle ports. It reduces the number of tiny cross-partition ports by
// concatenating the signals on the producer side and extracting them on the
// consumer side. The resulting aggregated ports are appended to the module
// interfaces and the `__corvus_top` instances are rewritten to keep the design
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
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Support/raw_ostream.h"
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

struct PartitionInfo {
  unsigned id = 0;
  hw::InstanceOp combInstance;
  hw::InstanceOp seqInstance;
  hw::HWModuleOp combModule;
  hw::HWModuleOp seqModule;
  SmallVector<CombToSeqSignal> combToSeq;
  SmallVector<SeqToCombSignal> seqToComb;
  StringAttr combToSeqBundleName;
  StringAttr seqToCombBundleName;
  Type combToSeqBundleType;
  Type seqToCombBundleType;
};

struct AppendedPortInfo {
  BundleKind kind;
  StringAttr name;
  Type type;
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

struct InputBundleSpec {
  StringAttr name;
  Type type;
  SmallVector<unsigned> portIndices;
  SmallVector<BlockArgument> arguments;
};

struct OutputBundleSpec {
  StringAttr name;
  Type type;
  SmallVector<unsigned> portIndices;
  SmallVector<Value> values;
};

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
  LogicalResult
  discoverPartitions(ModuleOp module, hw::HWModuleOp topModule,
                     SmallVectorImpl<PartitionInfo> &partitions,
                     SymbolTable &symbolTable);
  LogicalResult analyzeDirectSignals(PartitionInfo &info);
  LogicalResult rewriteModuleForPartition(PartitionInfo &info,
                                          DenseMap<hw::HWModuleOp,
                                                   ModuleAggregationResult> &);
  LogicalResult rewriteModule(hw::HWModuleOp module,
                              std::optional<InputBundleSpec> inputSpec,
                              std::optional<OutputBundleSpec> outputSpec,
                              BundleKind inputKind, BundleKind outputKind,
                              ModuleAggregationResult &result);
  LogicalResult
  rewriteTopInstances(hw::HWModuleOp topModule,
                      ArrayRef<PartitionInfo> partitions,
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
  if (!topModule) {
    module.emitError("could not find hw.module named '") << topModuleName
                                                         << "'";
    signalPassFailure();
    return;
  }

  SmallVector<PartitionInfo> partitions;
  if (failed(discoverPartitions(module, topModule, partitions, symbolTable))) {
    signalPassFailure();
    return;
  }

  if (partitions.empty())
    return;

  DenseMap<hw::HWModuleOp, ModuleAggregationResult> moduleResults;
  for (PartitionInfo &info : partitions) {
    if (failed(analyzeDirectSignals(info))) {
      signalPassFailure();
      return;
    }
  }

  bool changed = false;
  for (PartitionInfo &info : partitions) {
    if (info.combToSeq.empty() && info.seqToComb.empty())
      continue;
    if (failed(rewriteModuleForPartition(info, moduleResults))) {
      signalPassFailure();
      return;
    }
    changed = true;
  }

  if (!changed)
    return;

  if (failed(rewriteTopInstances(topModule, partitions, moduleResults)))
    signalPassFailure();
}

LogicalResult HWAggregateCorvusPortsPass::discoverPartitions(
    ModuleOp module, hw::HWModuleOp topModule,
    SmallVectorImpl<PartitionInfo> &partitions, SymbolTable &symbolTable) {
  (void)symbolTable;
  DenseMap<unsigned, hw::HWModuleOp> combModules;
  DenseMap<unsigned, hw::HWModuleOp> seqModules;

  for (hw::HWModuleOp mod : module.getOps<hw::HWModuleOp>()) {
    StringRef name = mod.getModuleName();
    if (auto combId =
            parsePartitionId(name, combPartitionPrefix.empty()
                                      ? "__corvus_comb_P"
                                      : StringRef(combPartitionPrefix))) {
      if (!combModules.try_emplace(*combId, mod).second)
        return mod.emitOpError("duplicate __corvus_comb partition id ")
               << *combId;
      continue;
    }
    if (auto seqId =
            parsePartitionId(name, seqPartitionPrefix.empty()
                                      ? "__corvus_seq_P"
                                      : StringRef(seqPartitionPrefix))) {
      if (!seqModules.try_emplace(*seqId, mod).second)
        return mod.emitOpError("duplicate __corvus_seq partition id ")
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
    if (auto combId =
            parsePartitionId(target, combPartitionPrefix.empty()
                                          ? "__corvus_comb_P"
                                          : StringRef(combPartitionPrefix))) {
      if (!combInstances.try_emplace(*combId, inst).second)
        return inst.emitOpError("duplicated __corvus_comb instance for id ")
               << *combId;
      continue;
    }
    if (auto seqId =
            parsePartitionId(target, seqPartitionPrefix.empty()
                                          ? "__corvus_seq_P"
                                          : StringRef(seqPartitionPrefix))) {
      if (!seqInstances.try_emplace(*seqId, inst).second)
        return inst.emitOpError("duplicated __corvus_seq instance for id ")
               << *seqId;
    }
  }

  llvm::SmallVector<unsigned> ids;
  ids.reserve(combInstances.size());
  for (auto &pair : combInstances)
    if (seqInstances.contains(pair.first))
      ids.push_back(pair.first);
  llvm::sort(ids);

  OpBuilder builder(module.getContext());
  for (unsigned id : ids) {
    PartitionInfo info;
    info.id = id;
    info.combInstance = combInstances.lookup(id);
    info.seqInstance = seqInstances.lookup(id);
    info.combModule = combModules.lookup(id);
    info.seqModule = seqModules.lookup(id);
    if (!info.combModule || !info.seqModule) {
      module.emitError("missing partition module definition for id ")
          << id;
      return failure();
    }

    std::string comb2seqName;
    llvm::raw_string_ostream(comb2seqName)
        << "__corvus_bundle_c2s_P" << id;
    std::string seq2combName;
    llvm::raw_string_ostream(seq2combName)
        << "__corvus_bundle_s2c_P" << id;

    info.combToSeqBundleName =
        builder.getStringAttr(comb2seqName);
    info.seqToCombBundleName =
        builder.getStringAttr(seq2combName);
    partitions.push_back(info);
  }
  return success();
}

LogicalResult
HWAggregateCorvusPortsPass::analyzeDirectSignals(PartitionInfo &info) {
  if (!info.combInstance || !info.seqInstance)
    return success();

  for (auto [idx, result] : llvm::enumerate(info.combInstance.getResults())) {
    if (!result.hasOneUse())
      continue;
    OpOperand &use = *result.use_begin();
    if (use.getOwner() != info.seqInstance)
      continue;
    unsigned operandIdx = use.getOperandNumber();
    info.combToSeq.push_back(
        CombToSeqSignal{static_cast<unsigned>(idx), operandIdx,
                        result.getType()});
  }

  for (auto [idx, result] : llvm::enumerate(info.seqInstance.getResults())) {
    if (!result.hasOneUse())
      continue;
    OpOperand &use = *result.use_begin();
    if (use.getOwner() != info.combInstance)
      continue;
    unsigned operandIdx = use.getOperandNumber();
    info.seqToComb.push_back(
        SeqToCombSignal{static_cast<unsigned>(idx), operandIdx,
                        result.getType()});
  }

  auto typeBuilder = OpBuilder(info.combModule.getContext());

  if (!info.combToSeq.empty()) {
    SmallVector<Type> types;
    for (auto &signal : info.combToSeq)
      types.push_back(signal.type);
    auto typeOrErr =
        buildBundleType(info.combModule.getLoc(), types, typeBuilder);
    if (failed(typeOrErr))
      return failure();
    info.combToSeqBundleType = *typeOrErr;
  }

  if (!info.seqToComb.empty()) {
    SmallVector<Type> types;
    for (auto &signal : info.seqToComb)
      types.push_back(signal.type);
    auto typeOrErr =
        buildBundleType(info.seqModule.getLoc(), types, typeBuilder);
    if (failed(typeOrErr))
      return failure();
    info.seqToCombBundleType = *typeOrErr;
  }

  return success();
}

LogicalResult HWAggregateCorvusPortsPass::rewriteModuleForPartition(
    PartitionInfo &info,
    DenseMap<hw::HWModuleOp, ModuleAggregationResult> &moduleResults) {
  auto tryRewrite = [&](hw::HWModuleOp module, bool isComb) -> LogicalResult {
    if (moduleResults.contains(module))
      return success();

    std::optional<InputBundleSpec> inputSpec;
    std::optional<OutputBundleSpec> outputSpec;

    Block *body = module.getBodyBlock();
    auto outputOp = cast<hw::OutputOp>(body->getTerminator());

    if (isComb && !info.seqToComb.empty()) {
      llvm::sort(info.seqToComb,
                 [](const SeqToCombSignal &a, const SeqToCombSignal &b) {
                   return a.combInputIdx < b.combInputIdx;
                 });
      InputBundleSpec spec;
      spec.name = info.seqToCombBundleName;
      spec.type = info.seqToCombBundleType;
      for (auto &signal : info.seqToComb) {
        spec.portIndices.push_back(signal.combInputIdx);
        spec.arguments.push_back(body->getArgument(signal.combInputIdx));
      }
      inputSpec = spec;
    }

    if (isComb && !info.combToSeq.empty()) {
      llvm::sort(info.combToSeq,
                 [](const CombToSeqSignal &a, const CombToSeqSignal &b) {
                   return a.combOutputIdx < b.combOutputIdx;
                 });
      OutputBundleSpec spec;
      spec.name = info.combToSeqBundleName;
      spec.type = info.combToSeqBundleType;
      for (auto &signal : info.combToSeq) {
        spec.portIndices.push_back(signal.combOutputIdx);
        spec.values.push_back(outputOp.getOperand(signal.combOutputIdx));
      }
      outputSpec = spec;
    }

    if (!isComb && !info.combToSeq.empty()) {
      llvm::sort(info.combToSeq,
                 [](const CombToSeqSignal &a, const CombToSeqSignal &b) {
                   return a.seqInputIdx < b.seqInputIdx;
                 });
      InputBundleSpec spec;
      spec.name = info.combToSeqBundleName;
      spec.type = info.combToSeqBundleType;
      for (auto &signal : info.combToSeq) {
        spec.portIndices.push_back(signal.seqInputIdx);
        spec.arguments.push_back(body->getArgument(signal.seqInputIdx));
      }
      inputSpec = spec;
    }

    if (!isComb && !info.seqToComb.empty()) {
      llvm::sort(info.seqToComb,
                 [](const SeqToCombSignal &a, const SeqToCombSignal &b) {
                   return a.seqOutputIdx < b.seqOutputIdx;
                 });
      OutputBundleSpec spec;
      spec.name = info.seqToCombBundleName;
      spec.type = info.seqToCombBundleType;
      for (auto &signal : info.seqToComb) {
        spec.portIndices.push_back(signal.seqOutputIdx);
        spec.values.push_back(outputOp.getOperand(signal.seqOutputIdx));
      }
      outputSpec = spec;
    }

    if (!inputSpec && !outputSpec)
      return success();

    ModuleAggregationResult result;
    result.module = module;
    if (failed(rewriteModule(module, inputSpec, outputSpec,
                             isComb ? BundleKind::SeqToComb
                                    : BundleKind::CombToSeq,
                             isComb ? BundleKind::CombToSeq
                                    : BundleKind::SeqToComb,
                             result)))
      return failure();
    moduleResults.insert({module, result});
    return success();
  };

  if (failed(tryRewrite(info.combModule, /*isComb=*/true)))
    return failure();
  if (failed(tryRewrite(info.seqModule, /*isComb=*/false)))
    return failure();
  return success();
}

LogicalResult HWAggregateCorvusPortsPass::rewriteModule(
    hw::HWModuleOp module, std::optional<InputBundleSpec> inputSpec,
    std::optional<OutputBundleSpec> outputSpec, BundleKind inputKind,
    BundleKind outputKind, ModuleAggregationResult &result) {
  Block *body = module.getBodyBlock();
  auto outputOp = cast<hw::OutputOp>(body->getTerminator());
  OpBuilder builder(module.getContext());

  result.module = module;
  result.originalInputCount = module.getNumInputPorts();
  result.originalOutputCount = module.getNumOutputPorts();

  SmallVector<unsigned> inputsToErase;
  SmallVector<unsigned> outputsToErase;

  if (outputSpec) {
    SmallVector<Type> types;
    for (Value val : outputSpec->values)
      types.push_back(val.getType());
    builder.setInsertionPoint(outputOp);
    auto packedOr = packValues(module.getLoc(), builder, outputSpec->values,
                               types);
    if (failed(packedOr))
      return failure();
    StringAttr name = outputSpec->name;
    module.appendOutputs({{name, *packedOr}});
    outputsToErase.assign(outputSpec->portIndices.begin(),
                          outputSpec->portIndices.end());
    result.appendedOutputs.push_back(
        {outputKind, name, outputSpec->type});
  }

  if (inputSpec) {
    auto inserted = module.insertInputs(
        module.getNumInputPorts(),
        {{inputSpec->name, inputSpec->type}});
    Value aggregate = inserted.front().second;
    builder.setInsertionPointToStart(body);
    int64_t offset = 0;
    for (auto [arg, idx] :
         llvm::zip(inputSpec->arguments, inputSpec->portIndices)) {
      auto sliceOr =
          extractSlice(module.getLoc(), builder, aggregate, arg.getType(),
                       offset);
      if (failed(sliceOr))
        return failure();
      arg.replaceAllUsesWith(*sliceOr);
      offset += hw::getBitWidth(arg.getType());
    }
    inputsToErase.assign(inputSpec->portIndices.begin(),
                         inputSpec->portIndices.end());
    result.appendedInputs.push_back(
        {inputKind, inputSpec->name, inputSpec->type});
  }

  module.modifyPorts({}, {}, inputsToErase, outputsToErase);
  eraseArguments(body, inputsToErase);
  eraseOperands(outputOp, outputsToErase);

  llvm::sort(inputsToErase);
  llvm::sort(outputsToErase);
  result.removedInputs = inputsToErase;
  result.removedOutputs = outputsToErase;
  result.oldInputToNew =
      computeOldToNewMapping(result.originalInputCount, inputsToErase);
  result.oldOutputToNew =
      computeOldToNewMapping(result.originalOutputCount, outputsToErase);
  return success();
}

LogicalResult HWAggregateCorvusPortsPass::rewriteTopInstances(
    hw::HWModuleOp topModule, ArrayRef<PartitionInfo> partitions,
    DenseMap<hw::HWModuleOp, ModuleAggregationResult> &results) {
  for (const PartitionInfo &info : partitions) {
    auto combIt = results.find(info.combModule);
    auto seqIt = results.find(info.seqModule);
    if (combIt == results.end() && seqIt == results.end())
      continue;

    auto rewriteInstance = [&](hw::InstanceOp inst,
                               const ModuleAggregationResult &modResult,
                               ArrayRef<Value> appendedOperands,
                               ArrayRef<StringAttr> appendedOperandNames,
                               ArrayRef<StringAttr> appendedResultNames)
        -> hw::InstanceOp {
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
        for (auto [idx, attr] : llvm::enumerate(argNames))
          if (modResult.oldInputToNew[idx] != kInvalidIndex)
            names.push_back(attr);
        for (auto name : appendedOperandNames)
          names.push_back(name);
        newInst.setArgNamesAttr(ArrayAttr::get(inst.getContext(), names));
      }

      if (auto resNames = inst.getResultNamesAttr()) {
        SmallVector<Attribute> names;
        for (auto [idx, attr] : llvm::enumerate(resNames))
          if (!llvm::is_contained(modResult.removedOutputs, idx))
            names.push_back(attr);
        for (auto name : appendedResultNames)
          names.push_back(name);
        newInst.setResultNamesAttr(ArrayAttr::get(inst.getContext(), names));
      }
      return newInst;
    };

    hw::InstanceOp combInst = info.combInstance;
    hw::InstanceOp seqInst = info.seqInstance;
    ModuleAggregationResult *combRes =
        combIt != results.end() ? &combIt->second : nullptr;
    ModuleAggregationResult *seqRes =
        seqIt != results.end() ? &seqIt->second : nullptr;

    OpBuilder edgeOpBuilder(topModule.getBodyBlock(),
                            topModule.getBodyBlock()->begin());
    BackedgeBuilder edgeBuilder(edgeOpBuilder, topModule.getLoc());
    Backedge seqToCombEdge;
    SmallVector<Value> combAppendedOperands;
    SmallVector<StringAttr> combAppendedOperandNames;
    SmallVector<StringAttr> combAppendedResultNames;

    if (combRes) {
      for (auto &port : combRes->appendedInputs) {
        if (port.kind == BundleKind::SeqToComb) {
          seqToCombEdge = edgeBuilder.get(port.type);
          combAppendedOperands.push_back(seqToCombEdge);
          combAppendedOperandNames.push_back(port.name);
        }
      }
      for (auto &port : combRes->appendedOutputs)
        combAppendedResultNames.push_back(port.name);
    }

    hw::InstanceOp newCombInst =
        combRes ? rewriteInstance(combInst, *combRes, combAppendedOperands,
                                  combAppendedOperandNames,
                                  combAppendedResultNames)
                : combInst;

    Value combToSeqBundle;
    if (combRes) {
      unsigned appendedCount = combRes->appendedOutputs.size();
      for (auto [relIdx, port] :
           llvm::enumerate(combRes->appendedOutputs)) {
        if (port.kind == BundleKind::CombToSeq) {
          unsigned resultIdx =
              newCombInst.getNumResults() - appendedCount + relIdx;
          combToSeqBundle = newCombInst.getResult(resultIdx);
          break;
        }
      }
    }

    SmallVector<Value> seqAppendedOperands;
    SmallVector<StringAttr> seqAppendedOperandNames;
    SmallVector<StringAttr> seqAppendedResultNames;
    if (seqRes) {
      for (auto &port : seqRes->appendedInputs) {
        if (port.kind == BundleKind::CombToSeq) {
          seqAppendedOperands.push_back(combToSeqBundle);
          seqAppendedOperandNames.push_back(port.name);
        }
      }
      for (auto &port : seqRes->appendedOutputs)
        seqAppendedResultNames.push_back(port.name);
    }

    hw::InstanceOp newSeqInst =
        seqRes ? rewriteInstance(seqInst, *seqRes, seqAppendedOperands,
                                 seqAppendedOperandNames,
                                 seqAppendedResultNames)
               : seqInst;

    if (seqRes) {
      unsigned appendedCount = seqRes->appendedOutputs.size();
      for (auto [relIdx, port] :
           llvm::enumerate(seqRes->appendedOutputs)) {
        if (port.kind == BundleKind::SeqToComb && seqToCombEdge) {
          unsigned resultIdx =
              newSeqInst.getNumResults() - appendedCount + relIdx;
          seqToCombEdge.setValue(newSeqInst.getResult(resultIdx));
          break;
        }
      }
    }

    if (seqRes) {
      auto seqOutputRemoved = [&](unsigned idx) {
        return llvm::is_contained(seqRes->removedOutputs, idx);
      };
      for (auto [idx, mapIdx] :
           llvm::enumerate(seqRes->oldOutputToNew)) {
        if (seqOutputRemoved(idx)) {
          seqInst.getResult(idx).dropAllUses();
          continue;
        }
        assert(mapIdx != kInvalidIndex &&
               "expected kept seq output to have valid mapping");
        seqInst.getResult(idx)
            .replaceAllUsesWith(newSeqInst.getResult(mapIdx));
      }
      seqInst.erase();
    }
    if (combRes) {
      auto combOutputRemoved = [&](unsigned idx) {
        return llvm::is_contained(combRes->removedOutputs, idx);
      };
      for (auto [idx, mapIdx] :
           llvm::enumerate(combRes->oldOutputToNew)) {
        if (combOutputRemoved(idx)) {
          combInst.getResult(idx).dropAllUses();
          continue;
        }
        assert(mapIdx != kInvalidIndex &&
               "expected kept comb output to have valid mapping");
        combInst.getResult(idx)
            .replaceAllUsesWith(newCombInst.getResult(mapIdx));
      }
      combInst.erase();
    }

    if (seqRes && seqToCombEdge)
      if (failed(edgeBuilder.clearOrEmitError()))
        return failure();
  }
  return success();
}
