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

void HWGlobalUniqueInnerSymPass::runOnOperation() {
  ModuleOp top = getOperation();
  MLIRContext *ctx = &getContext();

  // Counter per base name for suffix generation.
  DenseMap<StringAttr, unsigned> globalNameCounters;

  // For each property name: list of (moduleOp, ifaceOp, propertyIndex).
  DenseMap<
      StringAttr,
      SmallVector<std::tuple<hw::HWModuleOp, InnerSymbolOpInterface, unsigned>>>
      nameToProps;
  // Keep a list of all (module, iface) pairs to allow bulk rewrite.
  SmallVector<std::pair<hw::HWModuleOp, InnerSymbolOpInterface>> ifaceList;

  top.walk([&](hw::HWModuleOp mod) {
    mod.walk([&](Operation *op) {
      if (auto iface = dyn_cast<InnerSymbolOpInterface>(op)) {
        if (auto symAttr = iface.getInnerSymAttr()) {
          ifaceList.emplace_back(mod, iface);
          for (auto en : llvm::enumerate(symAttr.getProps())) {
            nameToProps[en.value().getName()].push_back(
                {mod, iface, en.index()});
          }
        }
      }
    });
  });

  // Determine renames: keep first occurrence of each name, rename all others.
  DenseMap<std::tuple<hw::HWModuleOp, InnerSymbolOpInterface, unsigned>,
           StringAttr>
      renameMap;
  for (auto &bucket : nameToProps) {
    auto &vec = bucket.getSecond();
    if (vec.size() <= 1)
      continue; // already unique
    unsigned &counter = globalNameCounters[bucket.getFirst()];
    for (size_t i = 0; i < vec.size(); ++i) {
      if (i == 0)
        continue; // retain first
      StringAttr base = bucket.getFirst();
      StringAttr newName;
      do {
        newName = StringAttr::get(
            ctx, (base.getValue() + "_g" + std::to_string(counter++)));
      } while (newName == base);
      renameMap[vec[i]] = newName;
    }
  }

  if (renameMap.empty())
    return;

  // Apply changes per op: rebuild InnerSymAttr if any of its properties
  // renamed.
  for (auto &pair : ifaceList) {
    auto mod = pair.first;
    (void)mod; // reserved for future filtering
    auto iface = pair.second;
    auto oldAttr = iface.getInnerSymAttr();
    if (!oldAttr)
      continue;
    bool changed = false;
    SmallVector<InnerSymPropertiesAttr> newProps;
    newProps.reserve(oldAttr.getProps().size());
    for (auto en : llvm::enumerate(oldAttr.getProps())) {
      auto key = std::make_tuple(pair.first, iface, (unsigned)en.index());
      if (auto it = renameMap.find(key); it != renameMap.end()) {
        changed = true;
        newProps.push_back(InnerSymPropertiesAttr::get(
            oldAttr.getContext(), it->second, en.value().getFieldID(),
            en.value().getSymVisibility()));
      } else {
        newProps.push_back(en.value());
      }
    }
    if (changed)
      iface.setInnerSymbolAttr(
          InnerSymAttr::get(oldAttr.getContext(), newProps));
  }
}
// HierPaths 已在前置 pass 中处理并移除，本 pass 不再更新引用。
