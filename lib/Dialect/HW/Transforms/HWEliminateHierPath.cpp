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
#include "llvm/Support/Debug.h"

#define DEBUG_TYPE "hw-eliminate-hierpath"

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
  LLVM_DEBUG(llvm::dbgs() << "Found " << instanceOps.size()
                          << " instances of module "
                          << updatedModuleOp.getSymName() << "\n");
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

    LLVM_DEBUG(llvm::dbgs()
               << "New Instance Type: "
               << newInstanceOp.getType(newInstanceOp.getNumOutputPorts() - 1)
               << "\n");
    // 将输出替换
    for (size_t i = 0; i < oldInstanceOp.getNumResults(); ++i) {
      oldInstanceOp.getResult(i).replaceAllUsesWith(newInstanceOp.getResult(i));
    }
    // 删除旧的 instance
    oldInstanceOp.erase();
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
  LLVM_DEBUG(llvm::dbgs() << "eliminateHierPath in module: "
                          << headModule.getSymName() << "\n");
  std::string xmrName = svXMRRefOp.getRef().str();
  xmrName = "xmr_" + xmrName;
  if (startIdx == namepath.size() - 1) {
    // 递归到底
    // 不会出现 tap 本地模块信号的情况
    if (refModule == headModule) {
      // 报错，因为不允许在本地模块中使用 tap
      refModule->emitError(
          "Cannot use tap in the same module as the reference");
      return failure();
    }
    // headModule 添加一个输出口
    // 找到 pathHead 指向的 op
    auto headModuleInnerSymTable = InnerSymbolTable::get(headModule);
    Operation *targetOp = headModuleInnerSymTable->lookupOp(pathHead.getName());

    if (auto targetWireOp = dyn_cast<hw::WireOp>(targetOp)) {
      // 添加一个输出口
      headModule.appendOutput(xmrName, targetWireOp.getResult());
      // 更新 headModule 的所有 instance
      return updateInstanceGlobally(headModule);
    } else {
      // 不是 wire，报错
      headModule->emitError("Expected a wire at the end of the path");
      return failure();
    }
  } else {
    // 递归处理内部层次
    if (failed(eliminateHierPath(namepath, startIdx + 1, svXMRRefOp,
                                 globalSymTable))) {
      return failure();
    }
    // 找到对应的 instance
    auto headModuleInnerSymTable = InnerSymbolTable::get(headModule);
    auto updatedInstanceOp = dyn_cast<hw::InstanceOp>(
        headModuleInnerSymTable->lookupOp(pathHead.getName()));
    if (!updatedInstanceOp) {
      headModule->emitError("Expected an instance in the middle of the path");
      return failure();
    }
    // instance 最后的一个 result 添加到 headModule 的输出上
    int resultIdx = updatedInstanceOp.getNumResults() - 1;
    auto newResultValue = updatedInstanceOp.getResult(resultIdx);
    SmallVector<sv::ReadInOutOp> readInOutOpsToRemove;
    if (refModule == headModule) {
      for (auto user : svXMRRefOp.getResult().getUsers()) {
        if (!isa<sv::ReadInOutOp>(user)) {
          svXMRRefOp->emitError(
              "The result of sv.xmrref must be used by sv.readinout");
          return failure();
        }
        if (user->getResult(0).getType() != newResultValue.getType()) {
          user->emitError("The type of sv.readinout must match the type of the "
                          "target signal");
          return failure();
        }
        // Op 和 类型都匹配了
        readInOutOpsToRemove.push_back(cast<sv::ReadInOutOp>(user));
      }
      for (auto readInOutOp : readInOutOpsToRemove) {
        readInOutOp.getResult().replaceAllUsesWith(newResultValue);
        readInOutOp.erase();
      }
      return success();
    } else {
      // 中间层次
      headModule.appendOutput(xmrName, newResultValue);
      // 修改 headModule 的所有 instance，添加一个输出值
      return updateInstanceGlobally(headModule);
    }
  }
}

void HWEliminateHierPathPass::runOnOperation() {
  auto *globalSymTable = SymbolTable::getNearestSymbolTable(getOperation());
  SmallVector<sv::XMRRefOp> svXMRRefOps;
  getOperation().walk(
      [&](sv::XMRRefOp svXMRRefOp) { svXMRRefOps.push_back(svXMRRefOp); });
  for (auto svXMRRefOp : svXMRRefOps) {
    auto hierOp = dyn_cast<hw::HierPathOp>(
        SymbolTable::lookupSymbolIn(globalSymTable, svXMRRefOp.getRef()));
    if (!hierOp) {
      svXMRRefOp->emitError("Expected a hw.hierpath operation for sv.xmrref");
      signalPassFailure();
      return;
    }
    // 打印模块名称、svXMRRefName以及path
    if (failed(eliminateHierPath(hierOp.getNamepath(), 0, svXMRRefOp,
                                 globalSymTable))) {
      signalPassFailure();
      return;
    }
    svXMRRefOp.erase();
    hierOp.erase();
  }
  SmallVector<hw::HierPathOp> hierPaths;
  getOperation().walk([&](hw::HierPathOp op) { hierPaths.push_back(op); });
  for (auto hp : hierPaths) {
    LLVM_DEBUG(llvm::dbgs() << "Erasing hierpath: " << hp.getSymName() << " : "
                            << hp << "\n");
    hp.erase();
  }
}
