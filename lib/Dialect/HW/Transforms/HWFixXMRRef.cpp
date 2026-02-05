//===- HWFixXMRRef.cpp - Resolve sv.xmrref after flatten -------*- C++ -*-===//
//
// After flattening modules and uniquifying all inner symbols, each hw.hierpath
// referenced by an sv.xmrref should end in a unique InnerRef to the concrete
// target op (commonly an hw.wire). This pass replaces uses of sv.xmrref (and
// trivial sv.read_inout wrappers) with the underlying value and erases now
// unused hw.hierpath operations.
//
//===----------------------------------------------------------------------===//
#include "circt/Dialect/HW/HWAttributes.h"
#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "circt/Dialect/HW/InnerSymbolTable.h"
#include "circt/Dialect/SV/SVAttributes.h"
#include "circt/Dialect/SV/SVOps.h"
#include "mlir/IR/SymbolTable.h"
#include "mlir/Pass/Pass.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/SmallPtrSet.h"

#define DEBUG_TYPE "hw-fix-xmrref"

using namespace mlir;
using namespace circt;
using namespace hw;

namespace circt {
namespace hw {
#define GEN_PASS_DEF_HWFIXXMRREF
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

namespace {
struct HWFixXMRRefPass : circt::hw::impl::HWFixXMRRefBase<HWFixXMRRefPass> {
  void runOnOperation() override;
};
} // namespace

void HWFixXMRRefPass::runOnOperation() {
  getOperation()->emitError("This PASS is deprecated, please use "
                            "hw.eliminate-hierpath instead.");
  signalPassFailure();
  return;

  ModuleOp top = getOperation();
  SymbolTable symTable(top);
  InnerSymbolTableCollection innerTables;

  SmallVector<sv::XMRRefOp> xmrOps;
  top.walk([&](sv::XMRRefOp op) { xmrOps.push_back(op); });

  // 查找全局唯一的一个非 private module 作为 modOp
  HWModuleOp modOp;
  for (auto m : top.getOps<HWModuleOp>()) {
    if (!m.isPrivate()) {
      if (modOp) {
        modOp = nullptr;
        break;
      }
      modOp = m;
    }
  }
  if (!modOp) {
    // 没有找到合适的 modOp，无法继续
    top->emitError("No suitable top-level module found for XMR resolution.");
    signalPassFailure();
    return;
  }
  LLVM_DEBUG(llvm::dbgs() << "HWFixXMRRef found top-level module: "
                          << modOp.getName() << "\n");
  auto &innerTable = innerTables.getInnerSymbolTable(modOp);

  // Resolve each xmr.
  for (auto xmr : xmrOps) {
    auto hier = dyn_cast_or_null<hw::HierPathOp>(symTable.lookup(xmr.getRef()));
    LLVM_DEBUG(llvm::dbgs() << "Resolving xmr: " << xmr.getRef() << "\n");
    if (!hier)
      continue; // dangling; skip
    auto namepath = hier.getNamepath();
    if (namepath.empty())
      continue;
    auto last = dyn_cast<hw::InnerRefAttr>(namepath[namepath.size() - 1]);
    if (!last)
      continue; // unexpected
    LLVM_DEBUG(llvm::dbgs() << "  last path element: " << last << "\n");
    Operation *target = innerTable.lookupOp(last.getName());
    if (!target)
      continue;

    Value replacement;
    if (auto wire = dyn_cast<hw::WireOp>(target)) {
      replacement = wire.getResult();
    } else if (target->getNumResults() == 1) {
      replacement = target->getResult(0);
    } else {
      target->emitError("xmr target has unexpected number of results");
      signalPassFailure();
      return;
    }

    auto useOps = xmr.getResult().getUsers();
    for (auto u : useOps) {
      // 判断result的次数
      if (u->getNumResults() != 1) {
        u->emitError("xmr user has unexpected number of results");
        signalPassFailure();
        return;
      }
      u->getResult(0).replaceAllUsesWith(replacement);
      LLVM_DEBUG(llvm::dbgs() << "  replaced use: " << *u << "\n");
      u->erase();
    }

    xmr.erase();
  }

  // Erase hierpaths
  llvm::SmallVector<hw::HierPathOp> hierPaths;
  top.walk([&](hw::HierPathOp op) { hierPaths.push_back(op); });
  for (auto hp : hierPaths) {
    LLVM_DEBUG(llvm::dbgs() << "Erasing hierpath: " << hp.getSymName() << " : "
                            << hp << "\n");
    hp.erase();
  }
}
