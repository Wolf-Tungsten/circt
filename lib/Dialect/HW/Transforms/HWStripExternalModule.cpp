//===- FooWires.cpp - Replace all wire names with foo ------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//===----------------------------------------------------------------------===//
//
// Replace all wire names with foo.
//
//===----------------------------------------------------------------------===//

#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "circt/Dialect/HW/HWTypes.h"
#include "circt/Dialect/SV/SVOps.h"
#include "circt/Dialect/Seq/SeqOps.h"
#include "mlir/Pass/Pass.h"
#include <unordered_map>

namespace circt {
namespace hw {
#define GEN_PASS_DEF_HWSTRIPEXTERNALMODULE
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

using namespace circt;
using namespace hw;

namespace {
// A test pass that simply replaces all wire names with foo_<n>
struct HWStripExternalModule
    : circt::hw::impl::HWStripExternalModuleBase<HWStripExternalModule> {

  void runOnOperation() override;
  ModuleOp mlirModuleOp;
  hw::HWModuleOp srcHWModuleOp;
  hw::HWModuleOp dstHWModuleOp;

  uint64_t svOpLabelCount = 0;
  LogicalResult addLabelToSVOp(Operation *op);
  LogicalResult processSrcHWModule();
  LogicalResult processDstHWModule();

  bool isExternalOp(Operation *op);
  bool isSVOp(Operation *op) {
    return op->getDialect() ==
           op->getContext()->getLoadedDialect<circt::sv::SVDialect>();
  }
  std::string getSVOpLabel(Operation *op) {
    auto attr = op->getAttrOfType<StringAttr>("corvus_tmp_label");
    return attr.getValue().str();
  }
  bool isExternalInstanceOp(Operation *op) {
    if (auto instanceOp = dyn_cast<hw::InstanceOp>(op)) {
      auto moduleName = instanceOp.getModuleName();
      auto symbolTable = mlir::SymbolTable(mlirModuleOp);
      auto referencedModule =
          symbolTable.lookup<hw::HWModuleExternOp>(moduleName);
      if (referencedModule)
        return true;
    }
    return false;
  }
};
} // namespace

void HWStripExternalModule::runOnOperation() {
  auto module = getOperation();
  mlirModuleOp = module;
  module.walk([&](hw::HWModuleOp hwModule) {
    // 对于每个 hwModule 单独处理
    srcHWModuleOp = hwModule;
    // 给所有 sv 方言操作加一个 tmp_label
    addLabelToSVOp(srcHWModuleOp);
    // 在 module 中，克隆一个 srcHWModuleOp，作为 dstHWModuleOp
    OpBuilder builder(module.getBodyRegion());
    dstHWModuleOp = srcHWModuleOp.clone();
    std::string newName = (dstHWModuleOp.getName() + "StrippedExternal").str();
    dstHWModuleOp.setSymNameAttr(builder.getStringAttr(newName));
    builder.insert(dstHWModuleOp);
    // 处理 srcHWModuleOp
    if (failed(processSrcHWModule())) {
      signalPassFailure();
      return;
    }
    // 处理 dstHWModuleOp
    if (failed(processDstHWModule())) {
      signalPassFailure();
      return;
    }
  });
}

LogicalResult HWStripExternalModule::addLabelToSVOp(Operation *op) {
  // 判断是否为 sv 方言的操作
  if (op->getDialect() ==
      op->getContext()->getLoadedDialect<circt::sv::SVDialect>()) {
    // 如果没有 label 属性，就添加一个
    if (!op->hasAttr("corvus_tmp_label")) {
      OpBuilder b(op);
      op->setAttr("corvus_tmp_label",
                  b.getStringAttr(std::to_string(svOpLabelCount++)));
    }
  }
  // 递归处理子操作
  for (auto &region : op->getRegions()) {
    for (auto &block : region) {
      for (auto &nestedOp : block) {
        if (failed(addLabelToSVOp(&nestedOp)))
          return failure();
      }
    }
  }
  return success();
}

LogicalResult HWStripExternalModule::processSrcHWModule() {
  llvm::SetVector<Operation *> toErase;
  llvm::SmallVector<std::pair<std::string, Value>, 4> toOutputValues;
  llvm::SmallVector<std::pair<std::string, Value>, 4> toInputValues;

  // 遍历 srcHWModuleOp 的所有操作
  srcHWModuleOp.walk([&](Operation *op) {
    if (isExternalOp(op)) {
      toErase.insert(op);
    } else {
      for (auto result : op->getResults()) {
        // 遍历使用 result 的 op，是 external 的话就要加入到 toOutputValues
        for (auto &use : result.getUses()) {
          auto useOp = use.getOwner();
          if (isSVOp(useOp)) {
            std::string outputName = "svop_";
            outputName += getSVOpLabel(useOp);
            outputName += "_opr_";
            outputName += std::to_string(use.getOperandNumber());
            toOutputValues.push_back({outputName, result});
          }
          if (isExternalInstanceOp(use.getOwner())) {
            std::string outputName = "extins_";
            outputName +=
                dyn_cast<hw::InstanceOp>(useOp).getInstanceName().str();
            outputName += "_in_";
            outputName += std::to_string(use.getOperandNumber());
            toOutputValues.push_back({outputName, result});
          }
        }
      }
      for (auto operand : op->getOperands()) {
        // 遍历 operand 的定义 op，是 external 的话就要加入到 toInputValues
        auto defOp = operand.getDefiningOp();
        auto resultNum = 0;
        if (defOp) {
          resultNum = dyn_cast<OpResult>(operand).getResultNumber();
        } else {
          // operand 是 block argument
          continue;
        }
        if (false && isSVOp(defOp)) { // 先屏蔽 sv.op 的输入端口处理
          std::string inputName = "svop_";
          inputName += getSVOpLabel(defOp);
          inputName += "_res_";
          inputName += std::to_string(resultNum);
          toInputValues.push_back({inputName, operand});
        }
        if (isExternalInstanceOp(defOp)) {
          std::string inputName = "extins_";
          inputName += dyn_cast<hw::InstanceOp>(defOp).getInstanceName().str();
          inputName += "_out_";
          inputName += std::to_string(resultNum);
          toInputValues.push_back({inputName, operand});
        }
      }
    }
  });
  // 遍历 srcHWModuleOp 的输入参数，如果输入参数被 externalOp
  // 是用了，也要加入到 toOutputValues
  for (auto blockArg : srcHWModuleOp.getBodyBlock()->getArguments()) {
    for (auto &use : blockArg.getUses()) {
      if (isExternalOp(use.getOwner())) {
        // toOutputValues.push_back(blockArg);
        break;
      }
    }
  }
  // 添加新的输入输出端口
  for (auto [name, value] : toOutputValues) {
    srcHWModuleOp.appendOutput(name, value);
  }
  for (auto [name, value] : toInputValues) {
    auto [portName, blockArgument] =
        srcHWModuleOp.appendInput(name, value.getType());
    value.replaceAllUsesWith(blockArgument);
  }
  return success();
}

LogicalResult HWStripExternalModule::processDstHWModule() {
  // // 遍历 dstHWModuleOp 的所有操作
  // dstHWModuleOp.walk([&](Operation *op) {
  //   if (isExternalOp(op)) {
  //     op->erase();
  //   }
  // });
  return success();
}

bool HWStripExternalModule::isExternalOp(Operation *op) {
  if (op == nullptr) {
    return false;
  }
  // 不在 srcHWModuleOp 中直接定义的 op
  if (op->getParentOp() != srcHWModuleOp) {
    return true;
  }
  // sv 方言中的操作
  if (isa<sv::IfDefOp>(op)) {
    return true;
  }
  // instance hw.module.external 的 instance
  if (auto instanceOp = dyn_cast<hw::InstanceOp>(op)) {
    auto moduleName = instanceOp.getModuleName();
    auto symbolTable = mlir::SymbolTable(mlirModuleOp);
    auto referencedModule =
        symbolTable.lookup<hw::HWModuleExternOp>(moduleName);
    if (referencedModule)
      return true;
  }
  return false;
}