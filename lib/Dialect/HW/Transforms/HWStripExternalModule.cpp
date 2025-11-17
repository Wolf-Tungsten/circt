//===- HWStripExternalModule.cpp - Corvus module splitting -*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//===----------------------------------------------------------------------===//
//
// This pass splits the single public HW module (user_top) into three modules
// tailored for the Corvus flow:
//   * corvus_top (private) retains user logic but surfaces every instance
//     connection through explicit ports.
//   * corvus_external (private) contains only the extracted instances and the
//     matching bridge ports.
//   * The public wrapper reuses the original module name, instantiates the two
//     private modules, wires the bridge ports, and preserves the original IO
//     signature and behaviour.
// All sv.bind ops are removed to avoid dangling references to erased logic.
//
//===----------------------------------------------------------------------===//

#include "circt/Dialect/Comb/CombOps.h"
#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "circt/Dialect/HW/HWTypes.h"
#include "circt/Dialect/Seq/SeqOps.h"
#include "circt/Dialect/SV/SVOps.h"
#include "circt/Support/BackedgeBuilder.h"
#include "mlir/IR/SymbolTable.h"
#include "mlir/Pass/Pass.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/StringSet.h"
#include "llvm/ADT/Twine.h"

namespace circt {
namespace hw {
#define GEN_PASS_DEF_HWSTRIPEXTERNALMODULE
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

using namespace circt;
using namespace hw;

namespace {

constexpr unsigned MIN_PORT_WIDTH = 4096;

struct BridgePort {
  std::string name;
  Type type;
};

struct BridgeAssignment {
  unsigned portIdx;
  uint64_t startBit;
  uint64_t width;
  bool useBitSlice;
};

static std::string makeUniqueName(StringRef base, llvm::StringSet<> &used) {
  std::string candidate = base.str();
  unsigned suffix = 0;
  while (used.contains(candidate))
    candidate = (base + "_" + Twine(++suffix)).str();
  used.insert(candidate);
  return candidate;
}

static unsigned getIntegerBitWidth(Type type) {
  auto intType = dyn_cast<IntegerType>(type);
  if (!intType)
    return 0;
  int64_t width = hw::getBitWidth(type);
  if (width <= 0)
    return 0;
  return static_cast<unsigned>(width);
}

static Value createConcatValue(Location loc, ArrayRef<Value> values,
                               OpBuilder &builder) {
  if (values.empty())
    return Value();
  if (values.size() == 1)
    return values.front();
  SmallVector<Value> reversed(values.rbegin(), values.rend());
  return builder.createOrFold<comb::ConcatOp>(loc, reversed);
}

class HWStripExternalModule
    : public hw::impl::HWStripExternalModuleBase<HWStripExternalModule> {
public:
  void runOnOperation() override;

private:
  LogicalResult rewriteCorvusTop(hw::HWModuleOp corvusTop);
  LogicalResult rewriteCorvusExternal(hw::HWModuleOp corvusExternal);
  LogicalResult rewriteCorvusWrapper(hw::HWModuleOp corvusWrapper,
                                     hw::HWModuleOp corvusTop,
                                     hw::HWModuleOp corvusExternal);

  LogicalResult ensureSymbolFree(StringRef symbol);

  ModuleOp mlirModuleOp;
  SmallVector<BridgePort, 8> bridgeOperandPorts;
  SmallVector<BridgePort, 8> bridgeResultPorts;
  SmallVector<BridgeAssignment, 8> operandAssignments;
  SmallVector<BridgeAssignment, 8> resultAssignments;
  unsigned originalInputCount = 0;
  unsigned originalOutputCount = 0;
};

} // namespace

void HWStripExternalModule::runOnOperation() {
  mlirModuleOp = getOperation();
  bridgeOperandPorts.clear();
  bridgeResultPorts.clear();

  hw::HWModuleOp userTop;
  for (auto hwModule : mlirModuleOp.getOps<hw::HWModuleOp>()) {
    if (hwModule.isPrivate())
      continue;
    if (userTop) {
      hwModule.emitOpError(
          "HWStripExternalModule expects exactly one public hw.module");
      signalPassFailure();
      return;
    }
    userTop = hwModule;
  }

  if (!userTop) {
    mlirModuleOp.emitError(
        "HWStripExternalModule requires a public hw.module to split");
    signalPassFailure();
    return;
  }

  originalInputCount = userTop.getNumInputPorts();
  originalOutputCount = userTop.getNumOutputPorts();

  if (failed(ensureSymbolFree("corvus_top")) ||
      failed(ensureSymbolFree("corvus_external"))) {
    signalPassFailure();
    return;
  }

  OpBuilder moduleBuilder(mlirModuleOp.getBodyRegion());
  auto originalNameAttr = userTop.getModuleNameAttr();
  auto corvusTopNameAttr = moduleBuilder.getStringAttr("corvus_top");
  auto corvusExternalNameAttr =
      moduleBuilder.getStringAttr("corvus_external");

  userTop.setSymNameAttr(corvusTopNameAttr);
  userTop.setPrivate();
  userTop->setAttr("corvus_top", moduleBuilder.getUnitAttr());

  moduleBuilder.setInsertionPointAfter(userTop);

  Operation *externalCloneOp = userTop.clone();
  auto corvusExternal = cast<hw::HWModuleOp>(externalCloneOp);
  corvusExternal->removeAttr("corvus_top");
  corvusExternal.setSymNameAttr(corvusExternalNameAttr);
  moduleBuilder.insert(corvusExternal);

  moduleBuilder.setInsertionPointAfter(corvusExternal);
  Operation *wrapperCloneOp = userTop.clone();
  auto corvusWrapper = cast<hw::HWModuleOp>(wrapperCloneOp);
  corvusWrapper->removeAttr("corvus_top");
  corvusWrapper.setSymNameAttr(originalNameAttr);
  moduleBuilder.insert(corvusWrapper);

  corvusExternal.setPrivate();
  corvusExternal->setAttr("corvus_external", moduleBuilder.getUnitAttr());

  corvusWrapper.setPublic();

  if (failed(rewriteCorvusTop(userTop)) ||
      failed(rewriteCorvusExternal(corvusExternal)) ||
      failed(rewriteCorvusWrapper(corvusWrapper, userTop, corvusExternal))) {
    signalPassFailure();
    return;
  }

  SmallVector<sv::BindOp> binds;
  for (auto bindOp : mlirModuleOp.getOps<sv::BindOp>())
    binds.push_back(bindOp);
  for (auto bindOp : binds)
    bindOp.erase();
}

LogicalResult
HWStripExternalModule::rewriteCorvusTop(hw::HWModuleOp corvusTop) {
  bridgeOperandPorts.clear();
  bridgeResultPorts.clear();
  operandAssignments.clear();
  resultAssignments.clear();

  llvm::StringSet<> usedInputNames;
  llvm::StringSet<> usedOutputNames;
  for (auto port : corvusTop.getPortList()) {
    std::string name = port.name.getValue().str();
    if (port.isOutput())
      usedOutputNames.insert(name);
    else
      usedInputNames.insert(name);
  }

  SmallVector<hw::InstanceOp, 8> instances;
  for (auto instance : corvusTop.getOps<hw::InstanceOp>())
    instances.push_back(instance);

  Block &block = corvusTop.getBody().front();
  Operation *terminator = block.getTerminator();
  OpBuilder helperBuilder(terminator);
  auto loc = corvusTop.getLoc();

  SmallVector<Value> operandValues;
  SmallVector<std::string> operandBaseNames;
  SmallVector<unsigned> operandWidths;
  SmallVector<bool> operandBatchable;

  SmallVector<Value> resultValues;
  SmallVector<std::string> resultBaseNames;
  SmallVector<unsigned> resultWidths;
  SmallVector<bool> resultBatchable;

  for (auto instance : instances) {
    auto instanceName = instance.getInstanceName().str();

    for (auto [idx, operand] : llvm::enumerate(instance.getOperands())) {
      Value bundledOperand = operand;
      unsigned width = getIntegerBitWidth(operand.getType());
      if (!width && isa<seq::ClockType>(operand.getType())) {
        bundledOperand = helperBuilder.createOrFold<seq::FromClockOp>(
            loc, operand);
        width = 1;
      }
      operandValues.push_back(bundledOperand);
      operandBaseNames.push_back(
          ("extp_" + instanceName + "_in_" + Twine(idx)).str());
      operandWidths.push_back(width);
      operandBatchable.push_back(width != 0);
    }

    for (auto [idx, result] : llvm::enumerate(instance.getResults())) {
      resultValues.push_back(result);
      resultBaseNames.push_back(
          ("extp_" + instanceName + "_out_" + Twine(idx)).str());
      unsigned width = getIntegerBitWidth(result.getType());
      if (!width && isa<seq::ClockType>(result.getType()))
        width = 1;
      resultWidths.push_back(width);
      resultBatchable.push_back(width != 0);
    }
  }

  operandAssignments.resize(operandValues.size());
  resultAssignments.resize(resultValues.size());

  SmallVector<std::pair<StringAttr, Value>> outputsToAppend;
  outputsToAppend.reserve(operandValues.size());

  auto addDirectOperandPort = [&](unsigned idx) {
    std::string uniqueName =
        makeUniqueName(operandBaseNames[idx], usedOutputNames);
    auto nameAttr = StringAttr::get(corvusTop.getContext(), uniqueName);
    outputsToAppend.push_back({nameAttr, operandValues[idx]});
    bridgeOperandPorts.push_back({uniqueName, operandValues[idx].getType()});
    operandAssignments[idx] = {static_cast<unsigned>(bridgeOperandPorts.size() - 1),
                               0, operandWidths[idx], false};
  };

  auto addOperandGroup = [&](unsigned startIdx, unsigned endIdx) {
    if (startIdx >= endIdx)
      return;
    SmallVector<Value> groupValues;
    groupValues.reserve(endIdx - startIdx);
    for (unsigned i = startIdx; i < endIdx; ++i)
      groupValues.push_back(operandValues[i]);

    Value concatValue = createConcatValue(loc, groupValues, helperBuilder);
    std::string base = operandBaseNames[startIdx] + "_bundle";
    std::string uniqueName = makeUniqueName(base, usedOutputNames);
    auto nameAttr = StringAttr::get(corvusTop.getContext(), uniqueName);
    outputsToAppend.push_back({nameAttr, concatValue});
    bridgeOperandPorts.push_back({uniqueName, concatValue.getType()});
    unsigned portIdx = bridgeOperandPorts.size() - 1;
    uint64_t offset = 0;
    for (unsigned i = startIdx; i < endIdx; ++i) {
      operandAssignments[i] = {portIdx, offset, operandWidths[i], true};
      offset += operandWidths[i];
    }
  };

  bool operandGroupActive = false;
  unsigned operandGroupStart = 0;
  uint64_t operandAccumulatedWidth = 0;

  auto flushOperandGroup = [&](unsigned endIdx) {
    if (!operandGroupActive)
      return;
    addOperandGroup(operandGroupStart, endIdx);
    operandGroupActive = false;
    operandAccumulatedWidth = 0;
  };

  for (unsigned idx = 0, e = operandValues.size(); idx < e; ++idx) {
    if (!operandBatchable[idx]) {
      flushOperandGroup(idx);
      addDirectOperandPort(idx);
      continue;
    }

    if (!operandGroupActive) {
      operandGroupActive = true;
      operandGroupStart = idx;
      operandAccumulatedWidth = 0;
    }

    operandAccumulatedWidth += operandWidths[idx];
    if (operandAccumulatedWidth >= MIN_PORT_WIDTH)
      flushOperandGroup(idx + 1);
  }
  flushOperandGroup(operandValues.size());

  if (!outputsToAppend.empty())
    corvusTop.appendOutputs(outputsToAppend);

  SmallVector<std::pair<StringAttr, Type>> inputsToAppend;
  inputsToAppend.reserve(resultValues.size());

  auto addDirectResultPort = [&](unsigned idx) {
    std::string uniqueName =
        makeUniqueName(resultBaseNames[idx], usedInputNames);
    auto nameAttr = StringAttr::get(corvusTop.getContext(), uniqueName);
    Type type = resultValues[idx].getType();
    inputsToAppend.push_back({nameAttr, type});
    bridgeResultPorts.push_back({uniqueName, type});
    resultAssignments[idx] = {static_cast<unsigned>(bridgeResultPorts.size() - 1),
                              0, resultWidths[idx], false};
  };

  auto addResultGroup = [&](unsigned startIdx, unsigned endIdx) -> LogicalResult {
    if (startIdx >= endIdx)
      return success();
    uint64_t totalWidth = 0;
    for (unsigned i = startIdx; i < endIdx; ++i)
      totalWidth += resultWidths[i];
    if (totalWidth > IntegerType::kMaxWidth) {
      corvusTop.emitOpError("bridge port exceeds maximum integer width");
      return failure();
    }
    auto type = IntegerType::get(corvusTop.getContext(),
                                 static_cast<unsigned>(totalWidth));
    std::string base = resultBaseNames[startIdx] + "_bundle";
    std::string uniqueName = makeUniqueName(base, usedInputNames);
    auto nameAttr = StringAttr::get(corvusTop.getContext(), uniqueName);
    inputsToAppend.push_back({nameAttr, type});
    bridgeResultPorts.push_back({uniqueName, type});
    unsigned portIdx = bridgeResultPorts.size() - 1;
    uint64_t offset = 0;
    for (unsigned i = startIdx; i < endIdx; ++i) {
      resultAssignments[i] = {portIdx, offset, resultWidths[i], true};
      offset += resultWidths[i];
    }
    return success();
  };

  bool resultGroupActive = false;
  unsigned resultGroupStart = 0;
  uint64_t resultAccumulatedWidth = 0;

  auto flushResultGroup = [&](unsigned endIdx) -> LogicalResult {
    if (!resultGroupActive)
      return success();
    if (failed(addResultGroup(resultGroupStart, endIdx)))
      return failure();
    resultGroupActive = false;
    resultAccumulatedWidth = 0;
    return success();
  };

  for (unsigned idx = 0, e = resultValues.size(); idx < e; ++idx) {
    if (!resultBatchable[idx]) {
      if (failed(flushResultGroup(idx)))
        return failure();
      addDirectResultPort(idx);
      continue;
    }

    if (!resultGroupActive) {
      resultGroupActive = true;
      resultGroupStart = idx;
      resultAccumulatedWidth = 0;
    }

    resultAccumulatedWidth += resultWidths[idx];
    if (resultAccumulatedWidth >= MIN_PORT_WIDTH)
      if (failed(flushResultGroup(idx + 1)))
        return failure();
  }
  if (failed(flushResultGroup(resultValues.size())))
    return failure();

  SmallVector<Value> appendedInputValues;
  if (!inputsToAppend.empty()) {
    auto appendedInputs = corvusTop.appendInputs(inputsToAppend);
    for (auto &entry : appendedInputs)
      appendedInputValues.push_back(entry.second);
  }

  for (Value arg : appendedInputValues) {
    if (!arg) {
      corvusTop.emitOpError("failed to create bridge input argument");
      return failure();
    }
  }

  OpBuilder extractBuilder(corvusTop.getContext());
  extractBuilder.setInsertionPointToStart(&block);

  if (!resultAssignments.empty()) {
    for (auto [idx, result] : llvm::enumerate(resultValues)) {
      const auto &assign = resultAssignments[idx];
      if (assign.portIdx >= appendedInputValues.size()) {
        corvusTop.emitOpError("result bridge information missing");
        return failure();
      }
      Value replacement = appendedInputValues[assign.portIdx];
      if (!replacement) {
        corvusTop.emitOpError("result bridge input is null");
        return failure();
      }
      if (assign.useBitSlice)
        replacement = extractBuilder.createOrFold<comb::ExtractOp>(
            loc, replacement, assign.startBit, assign.width);
      if (isa<seq::ClockType>(result.getType()) &&
          isa<IntegerType>(replacement.getType()))
        replacement =
            extractBuilder.createOrFold<seq::ToClockOp>(loc, replacement);
      result.replaceAllUsesWith(replacement);
    }
  }

  for (auto instance : llvm::reverse(instances))
    instance.erase();

  return success();
}

LogicalResult
HWStripExternalModule::rewriteCorvusExternal(hw::HWModuleOp corvusExternal) {
  Block &block = corvusExternal.getBody().front();
  auto *terminator = block.getTerminator();

  SmallVector<Operation *, 8> originalOpsToErase;
  for (auto &op : block.getOperations()) {
    if (isa<hw::InstanceOp>(op) || &op == terminator)
      continue;
    originalOpsToErase.push_back(&op);
  }

  unsigned originalInputs = corvusExternal.getNumInputPorts();
  unsigned originalOutputs = corvusExternal.getNumOutputPorts();

  SmallVector<hw::InstanceOp, 8> instances;
  for (auto instance : block.getOps<hw::InstanceOp>())
    instances.push_back(instance);

  SmallVector<std::pair<StringAttr, Type>> inputsToAppend;
  inputsToAppend.reserve(bridgeOperandPorts.size());
  for (const auto &port : bridgeOperandPorts) {
    auto nameAttr = StringAttr::get(corvusExternal.getContext(), port.name);
    inputsToAppend.push_back({nameAttr, port.type});
  }

  SmallVector<Value> bridgeInputArgs;
  if (!inputsToAppend.empty()) {
    auto appendedInputs = corvusExternal.appendInputs(inputsToAppend);
    for (auto &entry : appendedInputs)
      bridgeInputArgs.push_back(entry.second);
  }

  for (Value arg : bridgeInputArgs) {
    if (!arg) {
      corvusExternal.emitOpError("failed to materialize bridge input arg");
      return failure();
    }
  }

  unsigned operandCursor = 0;
  for (auto instance : instances) {
    auto loc = instance.getLoc();
    for (auto [idx, operand] : llvm::enumerate(instance.getOperands())) {
      if (operandCursor >= operandAssignments.size()) {
        instance.emitOpError("operand bridge information missing");
        return failure();
      }
      const BridgeAssignment &assign = operandAssignments[operandCursor++];
      if (assign.portIdx >= bridgeInputArgs.size()) {
        instance.emitOpError("operand bridge port index out of range");
        return failure();
      }
      Value source = bridgeInputArgs[assign.portIdx];
      Value replacement = source;
      if (!replacement) {
        instance.emitOpError("bridge operand is null");
        return failure();
      }
      OpBuilder builder(instance);
      builder.setInsertionPoint(instance);
      if (assign.useBitSlice)
        replacement = builder.createOrFold<comb::ExtractOp>(
            loc, source, assign.startBit, assign.width);
      auto expectedType = instance.getOperand(idx).getType();
      if (isa<seq::ClockType>(expectedType) &&
          isa<IntegerType>(replacement.getType()))
        replacement = builder.createOrFold<seq::ToClockOp>(loc, replacement);
      instance.setOperand(idx, replacement);
      if (!instance.getOperand(idx)) {
        instance.emitOpError("failed to set operand value");
        return failure();
      }
    }
  }

  SmallVector<std::pair<StringAttr, Value>> outputsToAppend;
  outputsToAppend.reserve(bridgeResultPorts.size());
  SmallVector<SmallVector<Value>> portValueBuckets(bridgeResultPorts.size());

  unsigned resultCursor = 0;
  for (auto instance : instances) {
    for (Value result : instance.getResults()) {
      if (resultCursor >= resultAssignments.size()) {
        instance.emitOpError("result bridge information missing");
        return failure();
      }
      const BridgeAssignment &assign = resultAssignments[resultCursor++];
      if (assign.portIdx >= portValueBuckets.size()) {
        instance.emitOpError("result bridge port index out of range");
        return failure();
      }
      portValueBuckets[assign.portIdx].push_back(result);
    }
  }

  OpBuilder outputBuilder(terminator);
  auto loc = corvusExternal.getLoc();
  for (auto [idx, bucket] : llvm::enumerate(portValueBuckets)) {
    if (bucket.empty()) {
      corvusExternal.emitOpError("result bridge information missing");
      return failure();
    }
    bool expectsInteger = isa<IntegerType>(bridgeResultPorts[idx].type);
    SmallVector<Value> processedValues;
    processedValues.reserve(bucket.size());
    for (Value value : bucket) {
      Value processed = value;
      if (expectsInteger && !isa<IntegerType>(processed.getType())) {
        if (isa<seq::ClockType>(processed.getType())) {
          processed = outputBuilder.createOrFold<seq::FromClockOp>(loc, processed);
        } else {
          corvusExternal.emitOpError(
              "non-integer value encountered while bundling bridge result");
          return failure();
        }
      }
      processedValues.push_back(processed);
    }
    Value combined = createConcatValue(loc, processedValues, outputBuilder);
    auto nameAttr =
        StringAttr::get(corvusExternal.getContext(), bridgeResultPorts[idx].name);
    outputsToAppend.push_back({nameAttr, combined});
  }

  if (!outputsToAppend.empty())
    corvusExternal.appendOutputs(outputsToAppend);

  for (auto *op : originalOpsToErase) {
    op->dropAllUses();
    op->erase();
  }

  if (originalOutputs) {
    terminator->eraseOperands(0, originalOutputs);
  }

  SmallVector<unsigned, 8> inputIndicesToRemove;
  for (unsigned i = 0; i < originalInputs; ++i)
    inputIndicesToRemove.push_back(i);

  SmallVector<unsigned, 8> outputIndicesToRemove;
  for (unsigned i = 0; i < originalOutputs; ++i)
    outputIndicesToRemove.push_back(i);

  if (!inputIndicesToRemove.empty() || !outputIndicesToRemove.empty())
    corvusExternal.erasePorts(inputIndicesToRemove, outputIndicesToRemove);

  if (originalInputs)
    block.eraseArguments(0, originalInputs);

  return success();
}

LogicalResult
HWStripExternalModule::rewriteCorvusWrapper(hw::HWModuleOp corvusWrapper,
                                            hw::HWModuleOp corvusTop,
                                            hw::HWModuleOp corvusExternal) {
  Block &block = corvusWrapper.getBody().front();
  auto *terminator = block.getTerminator();

  SmallVector<Operation *, 8> toErase;
  for (auto &op : block.getOperations()) {
    if (&op == terminator)
      continue;
    toErase.push_back(&op);
  }
  for (auto *op : toErase) {
    op->dropAllUses();
    op->erase();
  }

  OpBuilder bodyBuilder(terminator);
  auto loc = corvusWrapper.getLoc();

  SmallVector<Value> corvusTopInputs;
  corvusTopInputs.reserve(corvusTop.getNumInputPorts());

  for (unsigned i = 0; i < originalInputCount; ++i)
    corvusTopInputs.push_back(block.getArgument(i));

  BackedgeBuilder edgeBuilder(bodyBuilder, loc);
  SmallVector<Backedge, 8> bridgeBackedges;
  bridgeBackedges.reserve(bridgeResultPorts.size());
  for (const BridgePort &port : bridgeResultPorts) {
    Backedge edge = edgeBuilder.get(port.type);
    bridgeBackedges.push_back(edge);
    corvusTopInputs.push_back(edge);
  }

  auto corvusTopInst = bodyBuilder.create<hw::InstanceOp>(
      loc, corvusTop.getOperation(),
      bodyBuilder.getStringAttr("corvus_top_inst"), corvusTopInputs);

  SmallVector<Value> corvusExternalInputs;
  corvusExternalInputs.reserve(bridgeOperandPorts.size());
  for (unsigned i = 0, e = bridgeOperandPorts.size(); i < e; ++i)
    corvusExternalInputs.push_back(
        corvusTopInst.getResult(originalOutputCount + i));

  auto corvusExternalInst = bodyBuilder.create<hw::InstanceOp>(
      loc, corvusExternal.getOperation(),
      bodyBuilder.getStringAttr("corvus_external_inst"),
      corvusExternalInputs);

  for (auto [idx, edge] : llvm::enumerate(bridgeBackedges))
    edge.setValue(corvusExternalInst.getResult(idx));

  if (failed(edgeBuilder.clearOrEmitError()))
    return failure();

  SmallVector<Value> wrapperOutputs;
  wrapperOutputs.reserve(originalOutputCount);
  for (unsigned i = 0; i < originalOutputCount; ++i)
    wrapperOutputs.push_back(corvusTopInst.getResult(i));

  bodyBuilder.create<hw::OutputOp>(loc, wrapperOutputs);
  terminator->erase();

  return success();
}

LogicalResult HWStripExternalModule::ensureSymbolFree(StringRef symbol) {
  if (mlirModuleOp.lookupSymbol(symbol)) {
    mlirModuleOp.emitError()
        << "HWStripExternalModule cannot reuse existing symbol '" << symbol
        << "'";
    return failure();
  }
  return success();
}
