//===- HWExportVerilatorHierVlt.cpp - Emit Verilator hier vlt -*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This pass emits Verilator hierarchy control (`.vlt`) directives for modules
// marked with the `hw.corvus_partition` attribute.
//
//===----------------------------------------------------------------------===//

#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "mlir/IR/BuiltinOps.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/raw_ostream.h"

#define DEBUG_TYPE "hw-export-verilator-hier-vlt"

namespace circt {
namespace hw {
#define GEN_PASS_DEF_HWEXPORTVERILATORHIERVLT
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

using namespace mlir;
using namespace circt;
using namespace hw;

namespace {

struct HWExportVerilatorHierVltPass
    : public circt::hw::impl::HWExportVerilatorHierVltBase<
          HWExportVerilatorHierVltPass> {
  using Base::Base;

  void runOnOperation() override {
    ModuleOp module = getOperation();

    if (verilatorHierVltOutput.empty())
      return;

    SmallVector<StringRef> partitionedModules;
    partitionedModules.reserve(16);
    for (HWModuleOp hwModule : module.getOps<HWModuleOp>()) {
      if (!hwModule->hasAttr(partitionAttrName))
        continue;
      partitionedModules.push_back(hwModule.getModuleNameAttr().getValue());
    }

    std::error_code ec;
    llvm::raw_fd_ostream output(verilatorHierVltOutput, ec,
                                llvm::sys::fs::OF_Text);
    if (ec) {
      module.emitError("failed to open Verilator control file '")
          << verilatorHierVltOutput << "': " << ec.message();
      signalPassFailure();
      return;
    }

    output << "`verilator_config\n";

    if (!partitionedModules.empty())
      output << "\n";

    for (StringRef moduleName : partitionedModules) {
      output << "hier_block -module \"" << moduleName << "\"\n";
      output << "hier_workers -module \"" << moduleName << "\" -workers "
             << verilatorHierVltWorkers << "\n";
    }
  }

private:
  static constexpr llvm::StringLiteral partitionAttrName =
      "hw.corvus_partition";
};

} // namespace
