//===- HWEliminateHierPath.cpp - Replace all wire names with foo ------*- C++
//-*-===//
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
#include "mlir/Pass/Pass.h"

namespace circt {
namespace hw {
#define GEN_PASS_DEF_HWELIMINATEHIERPATH
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

using namespace circt;
using namespace hw;

namespace {
// A test pass that simply replaces all wire names with foo_<n>
struct HWEliminateHierPathPass
    : circt::hw::impl::HWEliminateHierPathBase<HWEliminateHierPathPass> {
  void runOnOperation() override;
  LogicalResult eliminateHierPath(mlir::ArrayAttr namepath, size_t startIdx,
                                  sv::XMRRefOp svXMRRefOp,
                                  Operation *globalSymTable);
  LogicalResult updateInstanceGlobally(hw::HWModuleOp updatedModuleOp);
};
} // namespace

LogicalResult HWEliminateHierPathPass::updateInstanceGlobally(
    hw::HWModuleOp updatedModuleOp) {
  SmallVector<hw::InstanceOp> instanceOps;
  // 找到所有引用了 updatedModuleOp 的 instance
  getOperation().walk([&](hw::InstanceOp instanceOp) {
    if (instanceOp.getModuleName() == updatedModuleOp.getSymName()) {
      instanceOps.push_back(instanceOp);
    }
  });
  llvm::outs() << "Found " << instanceOps.size() << " instances of module "
               << updatedModuleOp.getSymName() << "\n";
  // 更新每个 instance 的输出端口
  for (auto oldInstanceOp : instanceOps) {
    OpBuilder b(oldInstanceOp);
    b.setInsertionPointAfter(oldInstanceOp);
    // static InstanceOp create(::mlir::OpBuilder &builder, ::mlir::Location
    // location, Operation*module, StringAttr name, ArrayRef<Value> inputs,
    // ArrayAttr parameters = {}, InnerSymAttr innerSym = {});
    SmallVector<Value> oldInputs(oldInstanceOp.getInputs().begin(),
                                 oldInstanceOp.getInputs().end());
    auto newInstanceOp = b.create<hw::InstanceOp>(
        oldInstanceOp.getLoc(), updatedModuleOp,
        oldInstanceOp.getInstanceNameAttr(), oldInputs,
        oldInstanceOp.getParameters(), oldInstanceOp.getInnerSymAttr());

    llvm::outs() << "New Instance Type: "
                 << newInstanceOp.getType(newInstanceOp.getNumOutputPorts() - 1)
                 << "\n";
    // 将输出替换
    for (size_t i = 0; i < oldInstanceOp.getNumResults(); ++i) {
      oldInstanceOp.getResult(i).replaceAllUsesWith(newInstanceOp.getResult(i));
    }
    // 删除旧的 instance
    oldInstanceOp.erase();
    llvm::outs() << "Updated instance: " << newInstanceOp.getInstanceName()
                 << "\n";
  }
  return success();
}

LogicalResult HWEliminateHierPathPass::eliminateHierPath(
    mlir::ArrayAttr namepath, size_t startIdx, sv::XMRRefOp svXMRRefOp,
    Operation *globalSymTable) {
  hw::InnerRefAttr pathHead = dyn_cast<hw::InnerRefAttr>(namepath[startIdx]);
  hw::HWModuleOp headModule = cast<hw::HWModuleOp>(
      SymbolTable::lookupSymbolIn(globalSymTable, pathHead.getModuleRef()));
  hw::HWModuleOp refModule = svXMRRefOp->getParentOfType<hw::HWModuleOp>();
  llvm::outs() << "eliminateHierPath in module: " << headModule.getSymName()
               << "\n";
  auto xmrName = svXMRRefOp.getRef();
  if (startIdx == namepath.size() - 1) {
    // 递归到底
    // 不会出现 tap 本地模块信号的情况
    if (refModule == headModule) {
      // 报错，因为不允许在本地模块中使用 tap
      refModule->emitError(
          "Cannot use tap in the same module as the reference");
      signalPassFailure();
      return failure();
    }
    // TODO:headModule 添加一个输出口
    // 找到 pathHead 指向的 op
    auto headModuleInnerSymTable = InnerSymbolTable::get(headModule);
    Operation *targetOp = headModuleInnerSymTable->lookupOp(pathHead.getName());

    if (auto targetWireOp = dyn_cast<hw::WireOp>(targetOp)) {
      // 添加一个输出口
      headModule.appendOutput(xmrName, targetWireOp.getResult());
      // 更新 headModule 的所有 instance
      updateInstanceGlobally(headModule);
      return success();
    } else {
      // 不是 wire，报错
      headModule->emitError("Expected a wire at the end of the path");
      signalPassFailure();
      return failure();
    }
  } else {
    if (refModule == headModule) {
      eliminateHierPath(namepath, startIdx + 1, svXMRRefOp, globalSymTable);
      // TODO：发生引用的位置，instance 已经添加好输出口，修改引用即可
      llvm::outs() << "here is ref Module: " << headModule.getSymName() << "\n";
      return success();
    } else {
      // 中间层次
      // 递归处理内部层次
      eliminateHierPath(namepath, startIdx + 1, svXMRRefOp, globalSymTable);
      // 找到对应的 instance
      auto headModuleInnerSymTable = InnerSymbolTable::get(headModule);
      auto updatedInstanceOp = dyn_cast<hw::InstanceOp>(
          headModuleInnerSymTable->lookupOp(pathHead.getName()));
      if (!updatedInstanceOp) {
        headModule->emitError("Expected an instance in the middle of the path");
        signalPassFailure();
        return failure();
      }
      // instance 最后的一个 result 添加到 headModule 的输出上
      int resultIdx = updatedInstanceOp.getNumResults() - 1;
      auto newResultValue = updatedInstanceOp.getResult(resultIdx);
      llvm::outs() << "Adding output of instance: "
                   << updatedInstanceOp.getInstanceName()
                   << " result index: " << resultIdx
                   << "to Module:" << headModule.getSymName()
                   << " with Type:" << newResultValue.getType() << "\n";

      headModule.appendOutput(xmrName, newResultValue);
      //   修改 headModule 的所有 instance，添加一个输出值
      updateInstanceGlobally(headModule);
      llvm::outs() << "here is intermediate Module: " << headModule.getSymName()
                   << "\n";
      return success();
    }
  }
}

void HWEliminateHierPathPass::runOnOperation() {
  auto *globalSymTable = SymbolTable::getNearestSymbolTable(getOperation());
  getOperation().walk([&](hw::HWModuleOp hwModuleOp) {
    hwModuleOp.walk([&](sv::XMRRefOp svXMRRefOp) {
      auto *tableOp = SymbolTable::getNearestSymbolTable(svXMRRefOp);
      auto *op = SymbolTable::lookupSymbolIn(tableOp, svXMRRefOp.getRef());
      auto hierOp = dyn_cast<hw::HierPathOp>(op);
      // 打印模块名称、svXMRRefName以及path
      llvm::outs() << "Processing ModuleName:"
                   << svXMRRefOp->getParentOfType<hw::HWModuleOp>().getSymName()
                   << " ref:" << svXMRRefOp.getRef() << " path: ";
      for (Attribute path : hierOp.getNamepath()) {
        auto innerRefPath = dyn_cast<hw::InnerRefAttr>(path);
        llvm::outs() << innerRefPath.getModuleRef()
                     << "::" << innerRefPath.getName() << "->";
      }
      llvm::outs() << "\n";
      eliminateHierPath(hierOp.getNamepath(), 0, svXMRRefOp, globalSymTable);
    });
  });
  // exit(0);
}
