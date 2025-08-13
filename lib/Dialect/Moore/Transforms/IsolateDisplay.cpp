//===- IsolateDisplay.cpp - Isolate display statements --------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the IsolateDisplay pass.
// It isolates display statements from the rest of the module.
//
//===----------------------------------------------------------------------===//

#include "circt/Dialect/Moore/MooreOps.h"
#include "circt/Dialect/Moore/MoorePasses.h"

namespace circt {
namespace moore {
#define GEN_PASS_DEF_ISOLATEDISPLAY
#include "circt/Dialect/Moore/MoorePasses.h.inc"
} // namespace moore
} // namespace circt

using namespace circt;
using namespace moore;

namespace {
struct IsolateDisplayPass
    : public circt::moore::impl::IsolateDisplayBase<IsolateDisplayPass> {
  void runOnOperation() override;
  LogicalResult runOnMooreModule(moore::SVModuleOp module);
  LogicalResult runOnMooreProcedure(moore::ProcedureOp procedure);
  LogicalResult dropDisplayOps(moore::ProcedureOp procedure);
  bool mooreVariableIsARegister(moore::VariableOp varOp);
};
} // namespace

std::unique_ptr<mlir::Pass> circt::moore::createIsolateDisplayPass() {
  return std::make_unique<IsolateDisplayPass>();
}

void IsolateDisplayPass::runOnOperation() {
  getOperation()->walk([&](moore::SVModuleOp module) {
    if (failed(runOnMooreModule(module))) {
      signalPassFailure();
    }
  });
}

LogicalResult IsolateDisplayPass::runOnMooreModule(moore::SVModuleOp module) {
  // Logic to isolate display statements goes here.
  // For now, we just print a message indicating the pass is running.
  llvm::dbgs() << "IsolateDisplayPass is running on module: "
               << module.getName() << "\n";
  for (auto &op : module.getBodyRegion().getOps()) {
    if (auto procedure = llvm::dyn_cast<moore::ProcedureOp>(op)) {
      if (failed(runOnMooreProcedure(procedure))) {
        return failure();
      }
    }
    if (auto varOp = llvm::dyn_cast<moore::VariableOp>(op)) {
      llvm::dbgs() << "Variable " << varOp.getName() << "is Register? "
                   << mooreVariableIsARegister(varOp) << "\n";
    }
  }
  return success();
}

LogicalResult
IsolateDisplayPass::runOnMooreProcedure(moore::ProcedureOp procedure) {
  // Logic to isolate display statements in a procedure goes here.
  // For now, we just print a message indicating the pass is running.
  llvm::dbgs() << "IsolateDisplayPass is running on procedure: "
               << procedure.getLoc() << "\n";
  if (procedure.getKind() == moore::ProcedureKind::AlwaysComb) {
    // 不支持这种类型内的 display 语句，warning 并删除
    if (failed(dropDisplayOps(procedure))) {
      return failure();
    }
  } else if (procedure.getKind() == moore::ProcedureKind::AlwaysFF ||
             procedure.getKind() == moore::ProcedureKind::Always) {
    // 对于 AlwaysFF 类型的过程，可能需要特殊处理 display 语句
    // 这里可以添加相关逻辑
    llvm::dbgs() << "Processing AlwaysFF procedure: " << procedure.getLoc()
                 << "\n";
    OpBuilder builder(procedure.getContext());
    auto parentModule = procedure->getParentOfType<moore::SVModuleOp>();
    builder.setInsertionPointAfter(parentModule);
    //   static SVModuleOp create(::mlir::OpBuilder &builder, ::mlir::Location
    //   location, StringRef name, hw::ModuleType type);
    SVModuleOp newModule =
        SVModuleOp::create(builder, parentModule.getLoc(),
                           parentModule.getName().str() + "_display_only",
                           hw::ModuleType::get(builder.getContext(), {}));
    Region &newRegion = newModule.getBodyRegion();
    Block *newBlock = builder.createBlock(&newRegion);
    builder.setInsertionPointToStart(newBlock);
    builder.create<moore::OutputOp>(procedure.getLoc());
  } else {
    // 对于其他类型的过程，可能不需要处理 display 语句
    llvm::dbgs() << "No special handling for procedure kind: "
                 << procedure.getKind() << "\n";
  }
  return success();
}

LogicalResult IsolateDisplayPass::dropDisplayOps(moore::ProcedureOp procedure) {
  llvm::SmallVector<moore::DisplayBIOp, 4> displayOps;
  procedure.walk(
      [&](moore::DisplayBIOp displayOp) { displayOps.push_back(displayOp); });
  for (auto displayOp : displayOps) {
    procedure.emitWarning(
        "Display statements are not supported in 'always_comb' procedures, "
        "removing display operation.")
        << displayOp;
    displayOp.erase();
  }
  return success();
}

bool IsolateDisplayPass::mooreVariableIsARegister(moore::VariableOp varOp) {
  auto findNonblockingAssignOp = [&](Operation *op) -> Operation * {
    for (auto user : op->getUsers()) {
      if (isa<moore::NonBlockingAssignOp>(user)) {
        return user;
      } else {
        // return findNonblockingAssignOp(user);
      }
    }
    return nullptr;
  };
  Value v = varOp.getResult();
  for (auto userOp : v.getUsers()) {
    if (isa<moore::NonBlockingAssignOp>(userOp)) {
      auto parentProcedure = userOp->getParentOfType<moore::ProcedureOp>();
      if (parentProcedure &&
          (parentProcedure.getKind() == moore::ProcedureKind::AlwaysFF ||
           parentProcedure.getKind() == moore::ProcedureKind::Always)) {
        return true;
      }
    }
  }
  return false;
}