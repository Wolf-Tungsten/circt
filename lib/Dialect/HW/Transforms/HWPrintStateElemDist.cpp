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
#include "circt/Dialect/Seq/SeqOps.h"
#include "mlir/Pass/Pass.h"
#include <unordered_map>

namespace circt {
namespace hw {
#define GEN_PASS_DEF_HWPRINTSTATEELEMDIST
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

using namespace circt;
using namespace hw;

namespace {
// A test pass that simply replaces all wire names with foo_<n>
struct HWPrintStateElemDist
    : circt::hw::impl::HWPrintStateElemDistBase<HWPrintStateElemDist> {

  std::unordered_map<int, int> regCount;
  std::unordered_map<int, int> memCount;
  void runOnOperation() override;
};
} // namespace

void HWPrintStateElemDist::runOnOperation() {
  getOperation().walk([&](seq::FirRegOp firRegOp) {
    int width = firRegOp.getType().getIntOrFloatBitWidth();
    regCount[width]++;
  });
  llvm::outs() << "==================\n";
  llvm::outs() << "RegWidth,Count\n";
  int regCountAmount = 0;
  int regBitAmount = 0;
  for (const auto &[width, count] : regCount) {
    llvm::outs() << width << "," << count << "\n";
    regCountAmount += count;
    regBitAmount += width * count;
  }
  llvm::outs() << "TotalRegsCount:" << regCountAmount << "\n";
  llvm::outs() << "TotalRegsBit:" << regBitAmount << "\n";
  llvm::outs() << "==================\n";
  // 统计 firmem 的位宽
  getOperation().walk([&](seq::FirMemOp firMemOp) {
    int width = firMemOp.getType().getWidth();
    int depth = firMemOp.getType().getDepth();
    memCount[width] += depth;
  });
  // 以CSV形式打印结果
  int memRowAmount = 0;
  int memBitAmount = 0;
  llvm::outs() << "MemRowWidth,Count\n";
  for (const auto &[width, count] : memCount) {
    llvm::outs() << width << "," << count << "\n";
    memRowAmount += count;
    memBitAmount += width * count;
  }
  llvm::outs() << "TotalMemsRow:" << memRowAmount << "\n";
  llvm::outs() << "TotalMemsBit:" << memBitAmount << "\n";
  llvm::outs() << "==================\n";
  exit(0); // 直接退出，避免后续pass报错
}
