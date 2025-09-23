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
#include <ranges>
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

  llvm::SmallVector<Operation *, 4> srcToErase;
  llvm::SmallVector<std::pair<std::string, Value>, 4> srcToOutputValues;
  llvm::SmallVector<std::pair<std::string, Value>, 4> srcToInputValues;

  llvm::SmallVector<Operation *, 4> dstToErase;
  llvm::SmallVector<std::pair<std::string, Value>, 4> dstToOutputValues;
  llvm::SmallVector<std::pair<std::string, Value>, 4> dstToInputValues;

  uint64_t svOpLabelCount = 0;
  LogicalResult addLabelToSVOp();
  LogicalResult addLabelToSVOp(Operation *op, bool top);
  void processSrcSVOpRecursivly(Operation *op);
  LogicalResult processSrcHWModule();
  void processDstSVOpRecursivly(Operation *op);
  LogicalResult processDstHWModule();

  bool isSVOp(Operation *op) {
    return op->getDialect() ==
           op->getContext()->getLoadedDialect<circt::sv::SVDialect>();
  }
  std::string getSVOpLabel(Operation *op) {
    auto attr = op->getAttrOfType<StringAttr>("corvus_svop_label");
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
    if (failed(addLabelToSVOp())) {
      signalPassFailure();
      return;
    }
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
    srcToErase.clear();
    srcToInputValues.clear();
    srcToOutputValues.clear();
  });
}

LogicalResult HWStripExternalModule::addLabelToSVOp(Operation *op, bool top) {
  // 判断是否为 sv 方言的操作
  // 如果没有 label 属性，就添加一个
  if (!top || isSVOp(op)) {
    if (!op->hasAttr("corvus_svop_label")) {
      OpBuilder b(op);
      op->setAttr("corvus_svop_label",
                  b.getStringAttr(std::to_string(svOpLabelCount++)));
    }
  }
  // 递归处理子操作
  for (auto &region : op->getRegions()) {
    for (auto &block : region) {
      for (auto &nestedOp : block) {
        if (failed(addLabelToSVOp(&nestedOp, false)))
          return failure();
      }
    }
  }
  return success();
}

LogicalResult HWStripExternalModule::addLabelToSVOp() {
  for (auto &block : srcHWModuleOp.getBodyRegion()) {
    for (auto &op : block.getOperations()) {
      if (failed(addLabelToSVOp(&op, true)))
        return failure();
    }
  }
  return success();
}

LogicalResult HWStripExternalModule::processSrcHWModule() {
  // 遍历所有的 hw.instance
  srcHWModuleOp.walk([&](hw::InstanceOp instanceOp) {
    if (!isExternalInstanceOp(instanceOp)) {
      return;
    }
    auto instanceName = instanceOp.getInstanceName().str();
    // 遍历 instanceOp 的所有输入，将其添加到src模块的输出接口
    for (unsigned int i = 0; i < instanceOp.getNumOperands(); i++) {
      auto operand = instanceOp.getOperand(i);
      if (operand.getDefiningOp() == nullptr) {
        // 这个 operand 是 block argument，不需要处理
        continue;
      }
      std::string outputName = "extp_";
      outputName += instanceName;
      outputName += "_in_";
      outputName += std::to_string(i);
      srcToOutputValues.push_back({outputName, operand});
    }
    // 遍历 instanceOp 的所有输出，将其添加到src模块的输入接口
    for (unsigned int i = 0; i < instanceOp.getNumResults(); i++) {
      auto result = instanceOp.getResult(i);
      std::string inputName = "extp_";
      inputName += instanceName;
      inputName += "_out_";
      inputName += std::to_string(i);
      srcToInputValues.push_back({inputName, result});
    }
    // 将 instanceOp 标记为待删除
    srcToErase.push_back(instanceOp);
  });

  // 遍历 src 所有直接的操作，不能用 walk，因为 walk 会递归进入 region
  for (auto &block : srcHWModuleOp.getBodyRegion()) {
    for (auto &op : block.getOperations()) {
      if (isSVOp(&op)) {
        processSrcSVOpRecursivly(&op);
        // 标记该 sv 操作为待删除
        srcToErase.push_back(&op);
      }
    }
  }
  // 添加新的输入输出端口
  for (auto [name, value] : srcToOutputValues) {
    srcHWModuleOp.appendOutput(name, value);
  }
  for (auto [name, value] : srcToInputValues) {
    auto [portName, blockArgument] =
        srcHWModuleOp.appendInput(name, value.getType());
    value.replaceAllUsesWith(blockArgument);
  }
  // 删除所有标记的操作
  for (auto op : llvm::reverse(srcToErase)) {
    op->erase(); // 现在才能安全释放
  }
  return success();
}

void HWStripExternalModule::processSrcSVOpRecursivly(Operation *op) {
  // 分析 sv 操作的输入操作数
  for (unsigned int i = 0; i < op->getNumOperands(); i++) {
    auto operand = op->getOperand(i);
    auto defOp = operand.getDefiningOp();
    if (defOp == nullptr) {
      // 这个 operand 是 block argument，不需要处理
      continue;
    }
    if (defOp->getParentOp() ==
        srcHWModuleOp) { // 这个 operand 是定义在 srcHWModuleOp 层次上的
      std::string outputName = "extp_sv";
      outputName += getSVOpLabel(op);
      outputName += "_in_";
      outputName += std::to_string(i);
      srcToOutputValues.push_back({outputName, operand});
    }
  }
  // srcToErase.push_back(op);
  // llvm::outs() << "Marking SV Op for Erase: " << getSVOpLabel(op) << "\n";
  //    递归进入 op 内部
  for (auto &region : op->getRegions()) {
    for (auto &block : region) {
      for (auto &nestedOp : block) {
        processSrcSVOpRecursivly(&nestedOp);
      }
    }
  }
};

LogicalResult HWStripExternalModule::processDstHWModule() {
  auto terminatorOp = dstHWModuleOp.getBody().front().getTerminator();
  // step 1. 收集所有需要添加的接口、需要删除的 op
  for (auto &block : dstHWModuleOp.getBody().getBlocks()) {
    for (auto &op : block.getOperations()) {
      if (isSVOp(&op)) {
        processDstSVOpRecursivly(&op);
      } else if (isExternalInstanceOp(&op)) {
        // 处理输入，如果输入是来自 op 的，则添加成输入
        auto instanceOp = cast<hw::InstanceOp>(op);
        auto instanceName = instanceOp.getInstanceName().str();
        for (unsigned int i = 0; i < instanceOp.getNumOperands(); i++) {
          auto operand = instanceOp.getOperand(i);
          std::string inputName = "extp_";
          inputName += instanceName;
          inputName += "_in_";
          inputName += std::to_string(i);
          dstToInputValues.push_back({inputName, operand});
        }
        // 处理输出，如果输出是被 op 使用的，则添加成输出
        for (unsigned int i = 0; i < instanceOp.getNumResults(); i++) {
          auto result = instanceOp.getResult(i);
          std::string outputName = "extp_";
          outputName += instanceName;
          outputName += "_out_";
          outputName += std::to_string(i);
          dstToOutputValues.push_back({outputName, result});
        }
      } else {
        // 其他操作除了 terminator 都删除
        if (&op != dstHWModuleOp.getBody().front().getTerminator()) {
          dstToErase.push_back(&op);
        }
      }
    }
  }
  // step 2. 记录原有接口数量
  unsigned int originalInputNum = dstHWModuleOp.getNumInputPorts();
  unsigned int originalOutputNum = dstHWModuleOp.getNumOutputPorts();
  llvm::SmallVector<unsigned, 4> inputIndicesToRemove;
  llvm::SmallVector<unsigned, 4> outputIndicesToRemove;
  for (unsigned i = 0; i < originalInputNum + originalOutputNum; i++) {
    llvm::outs() << "Port " << i << ": ";
    if (dstHWModuleOp.getPort(i).isInput()) {
      llvm::outs() << "Input\n";
      inputIndicesToRemove.push_back(i);
    } else if (dstHWModuleOp.getPort(i).isOutput()) {
      llvm::outs() << "Output\n";
      outputIndicesToRemove.push_back(i);
    }
  }

  // step 3. 将原有输出删除
  auto outOp = cast<hw::OutputOp>(terminatorOp);
  outOp->eraseOperands(0, originalOutputNum);
  dstHWModuleOp.erasePorts({}, outputIndicesToRemove);

  // step 3. 添加输入
  // for (auto [name, value] : dstToInputValues) {
  //   auto [portName, blockArgument] =
  //       dstHWModuleOp.appendInput(name, value.getType());
  //   value.replaceAllUsesWith(blockArgument);
  // }

  // step x. 删除所有标记的操作
  // for (auto op : dstToErase) {
  //   op->dropAllUses();
  //   op->erase(); // 现在才能安全释放
  // }

  // for (auto [name, value] : dstToInputValues) {
  //   auto [portName, blockArgument] =
  //       dstHWModuleOp.appendInput(name, value.getType());
  //   value.replaceAllUsesWith(blockArgument);
  // }
  // // 添加新的输出端口
  // for (auto [name, value] : dstToOutputValues) {
  //   dstHWModuleOp.appendOutput(name, value);
  // }

  // dstHWModuleOp.modifyPorts({}, {}, inputIndicesToRemove,
  //                           outputIndicesToRemove);

  // 修改 block arguments
  // dstHWModuleOp.getBody().front().eraseArguments(0, originalInputNum);
  // 修改 terminator operands
  // terminatorOp->eraseOperands(0, originalOutputNum);
  return success();
}

void HWStripExternalModule::processDstSVOpRecursivly(Operation *op) {
  // 分析 sv 操作的输入操作数
  for (unsigned int i = 0; i < op->getNumOperands(); i++) {
    auto operand = op->getOperand(i);

    std::string inputName = "extp_sv";
    inputName += getSVOpLabel(op);
    inputName += "_in_";
    inputName += std::to_string(i);
    auto defOp = operand.getDefiningOp();
    if (defOp == nullptr) {
      // 这个 operand 是 block argument，需要判断是不是顶层模块的输入
      if (operand.getParentBlock() == &dstHWModuleOp.getBody().front()) {
        dstToInputValues.push_back({inputName, operand});
      }
    } else {
      if (defOp->getParentOp() ==
          dstHWModuleOp) { // 这个 operand 是定义在 dstHWModuleOp 层次上的
        dstToInputValues.push_back({inputName, operand});
      }
    }
  }

  for (auto &region : op->getRegions()) {
    for (auto &block : region) {
      for (auto &nestedOp : block) {
        processDstSVOpRecursivly(&nestedOp);
      }
    }
  }
};