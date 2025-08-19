//===- HWStatistic.cpp - Replace all wire names with foo ------*- C++ -*-===//
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
#include "mlir/Pass/Pass.h"

namespace circt {
namespace hw {
#define GEN_PASS_DEF_HWSTATISTICS
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

using namespace circt;
using namespace hw;

namespace {
// A test pass that simply replaces all wire names with foo_<n>
struct HWStatisticsPass : circt::hw::impl::HWStatisticsBase<HWStatisticsPass> {
  void runOnOperation() override;
  void countOps(Operation *op, llvm::StringMap<unsigned> &opCount);
};
} // namespace

void HWStatisticsPass::countOps(Operation *op,
                                llvm::StringMap<unsigned> &opCount) {
  // Count the operation
  auto opName = op->getName().getStringRef();
  opCount[opName]++;

  // Recursively count operations in regions
  for (Region &region : op->getRegions()) {
    for (Operation &nestedOp : region.getOps()) {
      countOps(&nestedOp, opCount);
    }
  }
}

void HWStatisticsPass::runOnOperation() {
  ModuleOp module = getOperation();
  llvm::StringMap<unsigned> opCount;

  // Count all operations in the module
  for (Operation &op : module.getBody()->getOperations()) {
    countOps(&op, opCount);
  }

  // Print results
  llvm::outs() << "=== Operation Count Summary ===\n";
  unsigned totalOps = 0;
  for (const auto &entry : opCount) {
    llvm::outs() << "  " << entry.getKey() << ": " << entry.getValue() << "\n";
    totalOps += entry.getValue();
  }
  llvm::outs() << "Total operations: " << totalOps << "\n";
  exit(0);
}
