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

  LogicalResult processSrcHWModule();
  LogicalResult processDstHWModule();
  std::string
  portNameGuard(std::string expectedPortName, hw::HWModuleOp moduleOp,
                llvm::ArrayRef<std::pair<std::string, Value>> existingPorts);
};
} // namespace

void HWStripExternalModule::runOnOperation() {
  auto module = getOperation();
  mlirModuleOp = module;
  module.walk([&](hw::HWModuleOp hwModule) {
    if (hwModule.isPrivate()) {
      return; // 只处理顶层模块
    }
    // 对于每个 hwModule 单独处理
    srcHWModuleOp = hwModule;
    // 在 module 中，克隆一个 srcHWModuleOp，作为 dstHWModuleOp
    OpBuilder builder(module.getBodyRegion());
    dstHWModuleOp = srcHWModuleOp.clone();
    std::string newName = (dstHWModuleOp.getName() + "_corvus_external").str();
    dstHWModuleOp.setSymNameAttr(builder.getStringAttr(newName));
    dstHWModuleOp.setPrivate();
    // dstHWModuleOp 添加一个 corvus_external 属性
    dstHWModuleOp->setAttr("corvus_external", builder.getUnitAttr());
    // srcHWModuleOp 添加一个 corvus_top 属性
    srcHWModuleOp->setAttr("corvus_top", builder.getUnitAttr());
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
    dstToErase.clear();
    dstToInputValues.clear();
    dstToOutputValues.clear();
  });
  // 删除多余的 sv.bind
  llvm::SmallVector<sv::BindOp, 4> svBindOps;
  for (auto svBindOp : module.getOps<sv::BindOp>()) {
    svBindOps.push_back(svBindOp);
  }
  for (auto svBindOp : svBindOps) {
    svBindOp.erase();
  }
}

LogicalResult HWStripExternalModule::processSrcHWModule() {
  // 遍历所有的 hw.instance
  for (hw::InstanceOp instanceOp : srcHWModuleOp.getOps<hw::InstanceOp>()) {
    auto instanceName = instanceOp.getInstanceName().str();
    // 遍历 instanceOp 的所有输入，将其添加到src模块的输出接口
    for (unsigned int i = 0; i < instanceOp.getNumOperands(); i++) {
      auto operand = instanceOp.getOperand(i);
      std::string outputName = "extp_";
      outputName += instanceName;
      outputName += "_in_";
      outputName += std::to_string(i);
      outputName = portNameGuard(outputName, srcHWModuleOp,
                                 srcToOutputValues); // 避免重名
      srcToOutputValues.push_back({outputName, operand});
    }
    // 遍历 instanceOp 的所有输出，将其添加到src模块的输入接口
    for (unsigned int i = 0; i < instanceOp.getNumResults(); i++) {
      auto result = instanceOp.getResult(i);
      std::string inputName = "extp_";
      inputName += instanceName;
      inputName += "_out_";
      inputName += std::to_string(i);
      inputName = portNameGuard(inputName, srcHWModuleOp,
                                srcToInputValues); // 避免重名
      srcToInputValues.push_back({inputName, result});
    }
    // 将 instanceOp 标记为待删除
    srcToErase.push_back(instanceOp);
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

LogicalResult HWStripExternalModule::processDstHWModule() {
  auto terminatorOp = dstHWModuleOp.getBody().front().getTerminator();
  // step 1. 收集所有需要添加的接口、需要删除的 op
  for (auto &block : dstHWModuleOp.getBody().getBlocks()) {
    for (auto &op : block.getOperations()) {
      if (isa<hw::InstanceOp>(op)) {
        // 处理输入，如果输入是来自 op 的，则添加成输入
        auto instanceOp = cast<hw::InstanceOp>(op);
        auto instanceName = instanceOp.getInstanceName().str();
        for (unsigned int i = 0; i < instanceOp.getNumOperands(); i++) {
          auto operand = instanceOp.getOperand(i);
          std::string inputName = "extp_";
          inputName += instanceName;
          inputName += "_in_";
          inputName += std::to_string(i);
          inputName = portNameGuard(inputName, dstHWModuleOp, dstToInputValues);
          dstToInputValues.push_back({inputName, operand});
        }
        // 处理输出，如果输出是被 op 使用的，则添加成输出
        for (unsigned int i = 0; i < instanceOp.getNumResults(); i++) {
          auto result = instanceOp.getResult(i);
          std::string outputName = "extp_";
          outputName += instanceName;
          outputName += "_out_";
          outputName += std::to_string(i);
          outputName =
              portNameGuard(outputName, dstHWModuleOp, dstToOutputValues);
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
  for (unsigned i = 0; i < originalOutputNum; i++) {
    outputIndicesToRemove.push_back(i);
  }
  for (unsigned i = 0; i < originalInputNum; i++) {
    inputIndicesToRemove.push_back(i);
  }

  // step 3. 将原有输出端口都删除
  terminatorOp->eraseOperands(0, originalOutputNum);
  dstHWModuleOp.erasePorts({}, outputIndicesToRemove);

  // step 4. 添加输出端口
  for (auto [name, value] : dstToOutputValues) {
    dstHWModuleOp.appendOutput(name, value);
  }

  // step 5. 添加输入端口
  for (auto [name, value] : dstToInputValues) {
    auto [portName, blockArgument] =
        dstHWModuleOp.appendInput(name, value.getType());
    value.replaceAllUsesWith(blockArgument);
  }

  // step 6. 删除所有标记的操作
  for (auto op : dstToErase) {
    op->dropAllUses();
    op->erase(); // 现在才能安全释放
  }

  // step 7. 删除所有原有输入端口
  dstHWModuleOp.erasePorts(inputIndicesToRemove, {});
  dstHWModuleOp.getBody().front().eraseArguments(0, originalInputNum);
  return success();
}

std::string HWStripExternalModule::portNameGuard(
    std::string expectedPortName, hw::HWModuleOp moduleOp,
    llvm::ArrayRef<std::pair<std::string, Value>> existingPorts) {
  std::string portName = expectedPortName;
  int suffix = 0;
  bool conflict = true;
  while (conflict) {
    conflict = false;
    // 是否和马上添加的port重复？
    for (auto [existingPortName, _] : existingPorts) {
      if (existingPortName == portName) {
        conflict = true;
        portName = expectedPortName + "_" + std::to_string(suffix++);
        break;
      }
    }
    // 是否和 moduleOp 里已有的 port 重复？
    for (auto port : moduleOp.getPortList()) {
      if (port.name == portName) {
        conflict = true;
        portName = expectedPortName + "_" + std::to_string(suffix++);
        break;
      }
    }
  }
  return portName;
}