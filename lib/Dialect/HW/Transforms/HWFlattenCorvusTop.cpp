//===- HWFlattenCorvusTop.cpp - Inline __corvus_seq/__corvus_comb ---------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This pass removes the `__corvus_seq`/`__corvus_comb` wrappers below
// `__corvus_top` by inlining the partitioned `_P*` instances that they contain.
// After the transformation, `__corvus_top` directly instantiates the partition
// clones and forwards their results using SSA values only.
//
//===----------------------------------------------------------------------===//

#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/IRMapping.h"
#include "mlir/IR/SymbolTable.h"
#include "mlir/IR/Visitors.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/Twine.h"
#include "llvm/Support/Debug.h"

#define DEBUG_TYPE "hw-flatten-corvus-top"

namespace circt {
namespace hw {
#define GEN_PASS_DEF_HWFLATTENCORVUSTOP
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

using namespace mlir;
using namespace circt;
using namespace hw;

namespace {

static LogicalResult flattenWrapperInstance(hw::InstanceOp wrapperInstance,
                                            hw::HWModuleOp wrapperModule) {
  auto *body = wrapperModule.getBodyBlock();
  auto outputOp = dyn_cast<hw::OutputOp>(body->getTerminator());
  if (!outputOp)
    return wrapperModule.emitOpError(
        "expected body to terminate with hw.output");

  IRMapping mapper;
  auto operands = wrapperInstance.getOperands();
  if (operands.size() != body->getNumArguments())
    return wrapperInstance.emitOpError(
        "operand count does not match wrapper module inputs");

  for (auto [arg, operand] : llvm::zip(body->getArguments(), operands))
    mapper.map(arg, operand);

  OpBuilder builder(wrapperInstance);
  auto parentName = wrapperInstance.getInstanceName();

  for (Operation &op : body->without_terminator()) {
    auto innerInst = dyn_cast<hw::InstanceOp>(&op);
    if (!innerInst)
      return op.emitOpError(
          "expected only hw.instance operations inside wrapper module");

    Operation *clonedOp = builder.clone(op, mapper);
    auto clonedInst = cast<hw::InstanceOp>(clonedOp);

    if (auto innerNameAttr = innerInst.getInstanceNameAttr()) {
      std::string compoundName =
          (Twine(parentName) + "." + innerNameAttr.getValue()).str();
      clonedInst.setInstanceNameAttr(builder.getStringAttr(compoundName));
    }

    // Drop inner symbols to avoid collisions after cloning into the parent
    // module. The corvus pipeline re-establishes unique symbols later.
    clonedInst.removeInnerSymAttr();

    for (auto [oldResult, newResult] :
         llvm::zip(innerInst.getResults(), clonedInst.getResults()))
      mapper.map(oldResult, newResult);
  }

  SmallVector<Value> newResults;
  newResults.reserve(outputOp.getNumOperands());
  for (Value operand : outputOp.getOperands()) {
    Value mapped = mapper.lookupOrNull(operand);
    if (!mapped)
      return outputOp.emitError(
          "failed to remap output operand while flattening wrapper instance");
    newResults.push_back(mapped);
  }

  for (auto [oldResult, newResult] :
       llvm::zip(wrapperInstance.getResults(), newResults))
    oldResult.replaceAllUsesWith(newResult);

  wrapperInstance.erase();
  return success();
}

struct HWFlattenCorvusTopPass
    : hw::impl::HWFlattenCorvusTopBase<HWFlattenCorvusTopPass> {
  using HWFlattenCorvusTopBase::HWFlattenCorvusTopBase;

  void runOnOperation() override {
    ModuleOp module = getOperation();
    SymbolTable symbolTable(module);

    if (topModuleName.empty())
      return;

    auto topModule = symbolTable.lookup<hw::HWModuleOp>(topModuleName);
    if (!topModule) {
      module.emitError("could not find hw.module named ") << topModuleName;
      signalPassFailure();
      return;
    }

    bool hadError = false;
    auto flattenWrapper = [&](StringRef wrapperName) -> hw::HWModuleOp {
      if (wrapperName.empty())
        return {};

      auto wrapperModule = symbolTable.lookup<hw::HWModuleOp>(wrapperName);
      if (!wrapperModule)
        return {};

      auto *body = topModule.getBodyBlock();
      SmallVector<hw::InstanceOp> instancesToFlatten;
      for (Operation &op : body->without_terminator())
        if (auto inst = dyn_cast<hw::InstanceOp>(&op))
          if (inst.getReferencedModuleName() == wrapperName)
            instancesToFlatten.push_back(inst);

      for (hw::InstanceOp inst : instancesToFlatten)
        if (failed(flattenWrapperInstance(inst, wrapperModule))) {
          hadError = true;
          return {};
        }
      return wrapperModule;
    };

    hw::HWModuleOp seqWrapper = flattenWrapper(seqWrapperName);
    if (hadError) {
      signalPassFailure();
      return;
    }
    hw::HWModuleOp combWrapper = flattenWrapper(combWrapperName);
    if (hadError) {
      signalPassFailure();
      return;
    }

    auto eraseWrapperIfUnused = [&](hw::HWModuleOp wrapperModule) {
      if (!wrapperModule)
        return;
      StringRef targetName = wrapperModule.getModuleName();
      bool hasUses = false;
      module.walk([&](hw::InstanceOp inst) {
        if (inst.getReferencedModuleName() == targetName) {
          hasUses = true;
          LLVM_DEBUG({
            llvm::dbgs() << "[hw-flatten-corvus-top] wrapper " << targetName
                         << " still used by instance " << inst.getInstanceName()
                         << '\n';
          });
          return WalkResult::interrupt();
        }
        return WalkResult::advance();
      });
      LLVM_DEBUG({
        llvm::dbgs() << "[hw-flatten-corvus-top] "
                     << (hasUses ? "keeping " : "erasing ") << targetName
                     << '\n';
      });
      if (!hasUses)
        wrapperModule.erase();
    };

    eraseWrapperIfUnused(seqWrapper);
    eraseWrapperIfUnused(combWrapper);
  }
};

} // namespace
