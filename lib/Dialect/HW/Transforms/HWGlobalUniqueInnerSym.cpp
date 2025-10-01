//===- HWGlobalUniqueInnerSym.cpp - Unique-ify inner_syms -* C++
//-*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//===----------------------------------------------------------------------===//
// Ensure that all inner symbols are globally unique across a top level
// mlir::ModuleOp.  If duplicates are found (same module+inner_sym name pair
// appearing in different hw.modules) we rename the later ones and update any
// referencing InnerRefAttr inside hw.hierpath ops.
//===----------------------------------------------------------------------===//

#include "circt/Dialect/HW/HWAttributes.h"
#include "circt/Dialect/HW/HWInstanceGraph.h"
#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "circt/Dialect/HW/InnerSymbolNamespace.h"
#include "mlir/IR/SymbolTable.h"
#include "mlir/Pass/Pass.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/SetVector.h"

#define DEBUG_TYPE "hw-global-unique-inner-sym"

using namespace mlir;
using namespace circt;
using namespace hw;

namespace circt {
namespace hw {
#define GEN_PASS_DEF_HWGLOBALUNIQUEINNERSYM
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

namespace {
struct HWGlobalUniqueInnerSymPass
    : circt::hw::impl::HWGlobalUniqueInnerSymBase<HWGlobalUniqueInnerSymPass> {
  void runOnOperation() override;
};
} // namespace

static InnerSymAttr rewriteSingle(InnerSymAttr attr, StringAttr oldName,
                                  StringAttr newName) {
  SmallVector<InnerSymPropertiesAttr> newProps;
  newProps.reserve(attr.getProps().size());
  for (auto p : attr.getProps()) {
    if (p.getName() == oldName) {
      // Preserve fieldID and visibility; only change the symbol name.
      newProps.push_back(InnerSymPropertiesAttr::get(
          attr.getContext(), newName, p.getFieldID(), p.getSymVisibility()));
    } else {
      newProps.push_back(p);
    }
  }
  return InnerSymAttr::get(attr.getContext(), newProps);
}

void HWGlobalUniqueInnerSymPass::runOnOperation() {
  ModuleOp top = getOperation();
  MLIRContext *ctx = &getContext();

  // Collect all hierpath ops to allow updates later.
  SmallVector<hw::HierPathOp> hierPaths;
  for (auto hp : top.getOps<hw::HierPathOp>())
    hierPaths.push_back(hp);

  // Map from fully qualified (moduleName, innerSymName) to chosen unique name.
  // We only rename when the same innerSymName appears in different modules.
  DenseMap<StringAttr, unsigned> globalNameCounts; // base -> next suffix
  // For quick uniqueness test across modules we store wire ops per inner name.
  DenseMap<StringAttr,
           SmallVector<std::pair<hw::HWModuleOp, hw::InnerSymbolOpInterface>>>
      opsPerName;

  // First pass: gather ops with inner_sym.
  top.walk([&](hw::HWModuleOp mod) {
    mod.walk([&](hw::InnerSymbolOpInterface opWithInnerSym) {
      auto inner = opWithInnerSym.getInnerSymAttr();
      if (!inner)
        return;
      if (auto sym = inner.getSymIfExists(0)) { // only look at first prop
        llvm::outs() << "Found op with inner_sym: " << sym << " in module "
                     << mod.getName() << "\n";
        opsPerName[sym].push_back({mod, opWithInnerSym});
      }
    });
  });

  // Second pass: For any inner symbol name that appears in more than one
  // module, rename ops after the first occurrence.
  DenseMap<hw::InnerSymbolOpInterface, StringAttr>
      renameMap; // op -> new simple name
  // Track mapping: (module symbol, oldName) -> newName for reference updates.
  DenseMap<std::pair<StringAttr, StringAttr>, StringAttr> oldToNew;
  for (auto &it : opsPerName) {
    auto &vec = it.getSecond();
    if (vec.size() <= 1)
      continue; // unique already
    // Keep first as-is; others get suffixed.
    unsigned idx = 0;
    for (auto &pair : vec) {
      auto op = pair.second;
      if (idx++ == 0)
        continue;
      auto base = it.getFirst();
      auto &next = globalNameCounts[base];
      // ensure suffixing uniqueness even if pass re-run.
      StringAttr newName;
      while (true) {
        newName = StringAttr::get(
            ctx, (base.getValue() + "_g" + std::to_string(next++)));
        // Avoid collision with any existing mapping earlier.
        bool collision = false;
        if (auto existing = op.getInnerSymAttr()) {
          for (auto p : existing.getProps())
            if (p.getName() == newName) {
              collision = true;
              break;
            }
        }
        if (!collision)
          break;
      }
      auto oldName = op.getInnerSymAttr().getSymIfExists(0);
      renameMap[op] = newName;
      oldToNew[{pair.first.getSymNameAttr(), oldName}] = newName;
    }
  }

  if (renameMap.empty())
    return; // Nothing to do.

  // Apply renames to the ops.
  for (auto &it : renameMap) {
    auto op = it.first;
    auto newName = it.second;
    auto inner = op.getInnerSymAttr();
    auto oldName = inner.getSymIfExists(0);
    auto newAttr = rewriteSingle(inner, oldName, newName);
    op.setInnerSymbolAttr(newAttr);
  }

  // Update hierpath operands referencing renamed inner syms.
  for (auto hp : hierPaths) {
    bool changed = false;
    SmallVector<Attribute> newPath;
    newPath.reserve(hp.getNamepath().size());
    for (auto attr : hp.getNamepath()) {
      if (auto ir = dyn_cast<InnerRefAttr>(attr)) {
        if (auto it = oldToNew.find({ir.getModule(), ir.getName()});
            it != oldToNew.end()) {
          changed = true;
          attr = InnerRefAttr::get(ir.getModule(), it->second);
        }
      }
      newPath.push_back(attr);
    }
    if (changed)
      hp.setNamepathAttr(ArrayAttr::get(ctx, newPath));
  }
}

// TODO: We currently do not update sv.xmrref because they refer through
// hierpath.
