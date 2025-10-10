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
//   * corvus_wrapper_t0 (public) instantiates the two private modules, wires
//     the bridge ports, and preserves the original IO signature and behaviour.
// All sv.bind ops are removed to avoid dangling references to erased logic.
//
//===----------------------------------------------------------------------===//

#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "circt/Dialect/HW/HWTypes.h"
#include "circt/Dialect/SV/SVOps.h"
#include "mlir/IR/SymbolTable.h"
#include "mlir/Pass/Pass.h"
#include "circt/Support/BackedgeBuilder.h"
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

struct BridgePort {
  std::string name;
  Type type;
};

static std::string makeUniqueName(StringRef base, llvm::StringSet<> &used) {
  std::string candidate = base.str();
  unsigned suffix = 0;
  while (used.contains(candidate))
    candidate = (base + "_" + Twine(++suffix)).str();
  used.insert(candidate);
  return candidate;
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
      failed(ensureSymbolFree("corvus_external")) ||
      failed(ensureSymbolFree("corvus_wrapper_t0"))) {
    signalPassFailure();
    return;
  }

  OpBuilder moduleBuilder(mlirModuleOp.getBodyRegion());
  moduleBuilder.setInsertionPointAfter(userTop);

  Operation *externalCloneOp = userTop.clone();
  auto corvusExternal = cast<hw::HWModuleOp>(externalCloneOp);
  corvusExternal.setSymNameAttr(moduleBuilder.getStringAttr("corvus_external"));
  moduleBuilder.insert(corvusExternal);

  moduleBuilder.setInsertionPointAfter(corvusExternal);
  Operation *wrapperCloneOp = userTop.clone();
  auto corvusWrapper = cast<hw::HWModuleOp>(wrapperCloneOp);
  corvusWrapper.setSymNameAttr(
      moduleBuilder.getStringAttr("corvus_wrapper_t0"));
  moduleBuilder.insert(corvusWrapper);

  userTop.setSymNameAttr(moduleBuilder.getStringAttr("corvus_top"));
  userTop.setPrivate();
  userTop->setAttr("corvus_top", moduleBuilder.getUnitAttr());

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

  for (auto instance : instances) {
    auto instanceName = instance.getInstanceName().str();

    for (auto [idx, operand] : llvm::enumerate(instance.getOperands())) {
      std::string base = ("extp_" + instanceName + "_in_" + Twine(idx)).str();
      std::string uniqueName = makeUniqueName(base, usedOutputNames);
      corvusTop.appendOutput(uniqueName, operand);
      bridgeOperandPorts.push_back({uniqueName, operand.getType()});
    }

    for (auto [idx, result] : llvm::enumerate(instance.getResults())) {
      std::string base = ("extp_" + instanceName + "_out_" + Twine(idx)).str();
      std::string uniqueName = makeUniqueName(base, usedInputNames);
      auto [nameAttr, blockArg] =
          corvusTop.appendInput(uniqueName, result.getType());
      (void)nameAttr;
      result.replaceAllUsesWith(blockArg);
      bridgeResultPorts.push_back({uniqueName, blockArg.getType()});
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

  unsigned originalInputs = corvusExternal.getNumInputPorts();
  unsigned originalOutputs = corvusExternal.getNumOutputPorts();

  SmallVector<hw::InstanceOp, 8> instances;
  for (auto instance : block.getOps<hw::InstanceOp>())
    instances.push_back(instance);

  unsigned operandCursor = 0;
  for (auto instance : instances) {
    for (auto [idx, operand] : llvm::enumerate(instance.getOperands())) {
      if (operandCursor >= bridgeOperandPorts.size()) {
        instance.emitOpError("operand bridge information missing");
        return failure();
      }
      const BridgePort &port = bridgeOperandPorts[operandCursor++];
      auto [nameAttr, blockArg] =
          corvusExternal.appendInput(port.name, port.type);
      (void)nameAttr;
      instance.setOperand(idx, blockArg);
    }
  }

  unsigned resultCursor = 0;
  for (auto instance : instances) {
    for (auto [idx, result] : llvm::enumerate(instance.getResults())) {
      if (resultCursor >= bridgeResultPorts.size()) {
        instance.emitOpError("result bridge information missing");
        return failure();
      }
      const BridgePort &port = bridgeResultPorts[resultCursor++];
      corvusExternal.appendOutput(port.name, result);
    }
  }

  SmallVector<Operation *, 8> toErase;
  for (auto &op : block.getOperations()) {
    if (isa<hw::InstanceOp>(op) || &op == terminator)
      continue;
    toErase.push_back(&op);
  }
  for (auto *op : toErase) {
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
      bodyBuilder.getStringAttr("corvus_external_inst"), corvusExternalInputs);

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
