//===- HWPartitionModules.cpp - Partition S/C modules by RepCut -*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//===----------------------------------------------------------------------===//
//
// This pass partitions S and C modules based on repcut_partitions attributes.
// For each unique partition ID, it creates a separate module containing only
// operations assigned to that partition.
//
//===----------------------------------------------------------------------===//

#include "circt/Dialect/Comb/CombOps.h"
#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "circt/Dialect/Seq/SeqOps.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/SymbolTable.h"
#include "llvm/ADT/DenseSet.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/Support/raw_ostream.h"
#include <cstdint>
#include <utility>

#define DEBUG_TYPE "hw-partition-modules"

namespace circt {
namespace hw {
#define GEN_PASS_DEF_HWPARTITIONMODULES
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

using namespace mlir;
using namespace circt;
using namespace hw;

namespace {

// Helper function to get partition IDs from an operation
static DenseSet<uint64_t> getPartitionIds(Operation *op) {
  DenseSet<uint64_t> ids;

  auto attr = op->getAttrOfType<ArrayAttr>("repcut_partitions");
  if (!attr)
    return ids;

  for (Attribute elem : attr) {
    if (auto intAttr = dyn_cast<IntegerAttr>(elem))
      ids.insert(intAttr.getUInt());
  }

  return ids;
}

// Helper function to collect all partition IDs used in a module
static DenseSet<uint64_t> collectAllPartitionIds(HWModuleOp module) {
  DenseSet<uint64_t> allIds;

  module.walk([&](Operation *op) {
    auto ids = getPartitionIds(op);
    allIds.insert(ids.begin(), ids.end());
  });

  return allIds;
}

// Helper function to check if an operation belongs to a partition
static bool belongsToPartition(Operation *op, uint64_t partitionId) {
  // hw.output always belongs to all partitions
  if (isa<hw::OutputOp>(op))
    return true;

  auto ids = getPartitionIds(op);
  return ids.contains(partitionId);
}

struct PartitionCloneInfo {
  Operation *module;
  SmallVector<unsigned> inputPortMap;
  SmallVector<unsigned> outputPortMap;
  uint64_t partitionId;
};

static LogicalResult
rebuildModuleWithPartitionInstances(HWModuleOp original,
                                    ArrayRef<PartitionCloneInfo> partitions) {
  if (partitions.empty())
    return success();

  Block *body = original.getBodyBlock();
  auto *terminator = body->getTerminator();

  for (Operation &op : llvm::make_early_inc_range(body->without_terminator())) {
    op.dropAllUses();
    op.erase();
  }

  OpBuilder builder(original.getContext());
  builder.setInsertionPointToStart(body);

  SmallVector<Value> moduleOutputs(original.getNumOutputPorts());
  auto loc = original.getLoc();
  auto moduleSymName = SymbolTable::getSymbolName(original);

  for (const auto &info : partitions) {
    SmallVector<Value> inputs;
    inputs.reserve(info.inputPortMap.size());
    for (unsigned inputIdx : info.inputPortMap)
      inputs.push_back(body->getArgument(inputIdx));

    std::string instNameStr =
        (moduleSymName.str() + "_P" + Twine(info.partitionId) + "_inst").str();
    auto instName = builder.getStringAttr(instNameStr);

    auto instance =
        builder.create<hw::InstanceOp>(loc, info.module, instName, inputs);

    for (auto [resultIdx, originalIdx] : llvm::enumerate(info.outputPortMap)) {
      if (moduleOutputs[originalIdx])
        continue;
      moduleOutputs[originalIdx] = instance.getResult(resultIdx);
    }
  }

  for (auto [idx, value] : llvm::enumerate(moduleOutputs)) {
    if (!value) {
      original->emitError("failed to map output port ")
          << idx << " to a partition";
      return failure();
    }
  }

  builder.setInsertionPoint(terminator);
  builder.create<hw::OutputOp>(loc, moduleOutputs);
  terminator->erase();
  return success();
}

struct HWPartitionModulesPass
    : circt::hw::impl::HWPartitionModulesBase<HWPartitionModulesPass> {
  using HWPartitionModulesBase::HWPartitionModulesBase;

  void runOnOperation() override {
    auto top = getOperation(); // mlir::ModuleOp

    if (moduleName.empty())
      return;

    OpBuilder builder(top.getContext());
    SymbolTable symbolTable(top);
    auto module = symbolTable.lookup<HWModuleOp>(moduleName);
    if (!module) {
      top.emitError("HWPartitionModules could not find module named ")
          << moduleName;
      signalPassFailure();
      return;
    }

    auto moduleSymName = SymbolTable::getSymbolName(module);

    DenseSet<uint64_t> partitionIdSet = collectAllPartitionIds(module);
    SmallVector<uint64_t> partitionIds;
    partitionIds.reserve(partitionIdSet.size());
    for (uint64_t id : partitionIdSet)
      partitionIds.push_back(id);
    llvm::sort(partitionIds);

    llvm::errs() << "Module: " << moduleSymName.getValue()
                 << " partition count: " << partitionIds.size() << "\n";

    if (partitionIds.empty())
      return; // No partitions found, keep the module as is

    SmallVector<PartitionCloneInfo> partitionInfos;
    partitionInfos.reserve(partitionIds.size());

    for (uint64_t partitionId : partitionIds) {
      builder.setInsertionPointAfter(module);
      auto clonedModule = cast<HWModuleOp>(builder.clone(*module));
      clonedModule.setVisibility(SymbolTable::Visibility::Private);

      auto originalName = SymbolTable::getSymbolName(module);
      auto newName = StringAttr::get(
          top.getContext(),
          (originalName.str() + "_P" + Twine(partitionId)).str());
      clonedModule.setSymName(newName);

      Block *body = clonedModule.getBodyBlock();
      auto outputOp = cast<hw::OutputOp>(body->getTerminator());

      SmallVector<Value> validOutputs;
      SmallVector<unsigned> outputsToKeep;
      for (unsigned i = 0; i < outputOp.getNumOperands(); i++) {
        Value outputValue = outputOp.getOperand(i);
        Operation *defOp = outputValue.getDefiningOp();

        bool keep = isa<BlockArgument>(outputValue) ||
                    (defOp && belongsToPartition(defOp, partitionId));

        if (keep) {
          validOutputs.push_back(outputValue);
          outputsToKeep.push_back(i);
        }
      }

      SmallVector<Operation *> opsToErase;
      clonedModule.walk([&](Operation *op) {
        if (isa<hw::HWModuleOp>(op) || isa<hw::OutputOp>(op))
          return;

        if (!belongsToPartition(op, partitionId))
          opsToErase.push_back(op);
      });

      for (Operation *op : opsToErase) {
        op->dropAllUses();
        op->erase();
      }

      OpBuilder outputBuilder(outputOp);
      outputBuilder.create<hw::OutputOp>(outputOp.getLoc(), validOutputs);
      outputOp->erase();

      SmallVector<unsigned> unusedInputs;
      for (unsigned i = 0; i < clonedModule.getNumInputPorts(); i++) {
        BlockArgument arg = body->getArgument(i);
        if (arg.use_empty())
          unusedInputs.push_back(i);
      }

      SmallVector<unsigned> unusedOutputs;
      for (unsigned i = 0; i < clonedModule.getNumOutputPorts(); i++) {
        if (std::find(outputsToKeep.begin(), outputsToKeep.end(), i) ==
            outputsToKeep.end())
          unusedOutputs.push_back(i);
      }

      SmallVector<unsigned> inputsToKeep;
      inputsToKeep.reserve(clonedModule.getNumInputPorts() -
                           unusedInputs.size());
      for (unsigned i = 0; i < clonedModule.getNumInputPorts(); ++i) {
        if (!llvm::is_contained(unusedInputs, i))
          inputsToKeep.push_back(i);
      }

      llvm::sort(unusedInputs);
      llvm::sort(unusedOutputs);
      clonedModule.erasePorts(unusedInputs, unusedOutputs);
      for (auto it = unusedInputs.rbegin(); it != unusedInputs.rend(); it++)
        body->eraseArgument(*it);

      partitionInfos.push_back({clonedModule.getOperation(),
                                std::move(inputsToKeep),
                                std::move(outputsToKeep), partitionId});
    }

    if (failed(rebuildModuleWithPartitionInstances(module, partitionInfos))) {
      signalPassFailure();
      return;
    }
  }
};

} // namespace
