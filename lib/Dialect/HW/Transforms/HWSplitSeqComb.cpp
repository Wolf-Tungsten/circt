//===- HWSplitSeqComb.cpp - Split flattened module into S/C -----*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//===----------------------------------------------------------------------===//
//
// This pass takes a flattened HW module and splits it into two modules:
// S (sequential) and C (combinational).
// - S contains only seq::FirRegOp, seq::FirMemReadOp, seq::FirMemWriteOp,
//   seq::FirMemReadWriteOp, seq::FirMemOp, and hw::ConstantOp.
// - C contains the remaining logic (combinational and wires, constants kept).
// Boundary values between S and C are materialized as new IO ports.
// Constants are kept in both modules and never routed via IO.
//
// The transform duplicates the original hw.module into two modules, then:
//  - In S: add inputs for non-constant operands of seq ops, add outputs for
//          results of seq ops, and erase other ops.
//  - In C: add outputs for values driving seq-op operands, add inputs for
//          results of seq ops, replace their uses, then erase seq ops.
//
//===----------------------------------------------------------------------===//

#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "circt/Dialect/Seq/SeqOps.h"
#include "circt/Support/BackedgeBuilder.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/SymbolTable.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/STLExtras.h"
#include <numeric>

#define DEBUG_TYPE "hw-split-seq-comb"

namespace circt {
namespace hw {
#define GEN_PASS_DEF_HWSPLITSEQCOMB
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

using namespace mlir;
using namespace circt;
using namespace hw;

namespace {

// The boundary seq ops which define the S<->C interface.
static bool isSeqBoundaryOp(Operation *op) {
  return isa<seq::FirRegOp, seq::FirMemReadOp, seq::FirMemWriteOp,
             seq::FirMemReadWriteOp>(op);
}

static bool isConst(Value v) { return v.getDefiningOp<hw::ConstantOp>(); }

// Collect a unique input for a given value if not yet present.
// Returns the index in the collection, or the existing mapped value's index.
static size_t
collectUniqueInput(DenseMap<Value, size_t> &map,
                   SmallVector<std::pair<StringAttr, Type>> &inputs, Value v,
                   StringRef baseName, MLIRContext *ctx) {
  if (auto it = map.find(v); it != map.end())
    return it->second; // Return existing index

  size_t idx = inputs.size();
  auto ty = v.getType();
  std::string name = (baseName + Twine(idx)).str();
  inputs.emplace_back(StringAttr::get(ctx, name), ty);
  map.try_emplace(v, idx);

  return idx;
}

// Collect a unique output for a given value if not yet present.
// Returns true if the value was added to the collection.
static void
collectUniqueOutput(DenseSet<Value> &added,
                    SmallVector<std::pair<StringAttr, Value>> &outputs, Value v,
                    StringRef baseName, MLIRContext *ctx) {
  if (added.contains(v))
    return; // Already added

  std::string name = (baseName + Twine(added.size())).str();
  outputs.emplace_back(StringAttr::get(ctx, name), v);
  added.insert(v);
}

static LogicalResult transformSequentialModule(HWModuleOp seqModule) {
  size_t sOrigInputs = seqModule.getNumInputPorts();
  size_t sOrigOutputs = seqModule.getNumOutputPorts();

  // Remove original outputs and reset the terminator.
  SmallVector<unsigned> eraseOutputs(sOrigOutputs);
  std::iota(eraseOutputs.begin(), eraseOutputs.end(), 0);
  seqModule.erasePorts({}, eraseOutputs);
  auto *term = seqModule.getBodyBlock()->getTerminator();
  auto outOp = cast<hw::OutputOp>(term);
  OpBuilder outBuilder(outOp);
  outBuilder.create<hw::OutputOp>(outOp.getLoc());
  outOp.erase();

  DenseMap<Value, size_t> valToInputIdx;
  DenseSet<Value> exported;
  SmallVector<std::pair<StringAttr, Type>> sInputs;
  SmallVector<std::pair<StringAttr, Value>> sOutputs;
  SmallVector<std::pair<OpOperand *, size_t>> operandsToReplace;

  for (Operation &op : *seqModule.getBodyBlock()) {
    if (!isSeqBoundaryOp(&op))
      continue;

    for (OpOperand &operand : op.getOpOperands()) {
      Value v = operand.get();
      if (isConst(v) || v.getDefiningOp<seq::FirMemOp>())
        continue;

      size_t idx = collectUniqueInput(valToInputIdx, sInputs, v, "s_in_",
                                      seqModule.getContext());
      operandsToReplace.push_back({&operand, idx});
    }

    for (Value res : op.getResults())
      collectUniqueOutput(exported, sOutputs, res, "s_out_",
                          seqModule.getContext());
  }

  if (!sInputs.empty()) {
    seqModule.appendInputs(sInputs);
    Block *body = seqModule.getBodyBlock();
    for (auto [operand, idx] : operandsToReplace) {
      BlockArgument arg = body->getArgument(sOrigInputs + idx);
      operand->set(arg);
    }
  }

  if (!sOutputs.empty())
    seqModule.appendOutputs(sOutputs);

  SmallVector<Operation *> toErase;
  for (Operation &op : llvm::make_early_inc_range(*seqModule.getBodyBlock())) {
    if (isa<hw::OutputOp>(&op) || isa<seq::FirMemOp>(&op) ||
        isSeqBoundaryOp(&op) || isa<hw::ConstantOp>(&op))
      continue;
    op.dropAllUses();
    op.erase();
  }

  SmallVector<unsigned> eraseInputs(sOrigInputs);
  std::iota(eraseInputs.begin(), eraseInputs.end(), 0);
  seqModule.erasePorts(eraseInputs, {});
  seqModule.getBodyBlock()->eraseArguments(0, sOrigInputs);
  return success();
}

static LogicalResult transformCombinationalModule(HWModuleOp combModule,
                                                  size_t cOrigInputs,
                                                  size_t cOrigOutputs) {
  DenseSet<Value> cOutAdded;
  SmallVector<Operation *> seqOps;
  SmallVector<Operation *> memOps;
  combModule.walk([&](Operation *op) {
    if (isSeqBoundaryOp(op))
      seqOps.push_back(op);
    else if (isa<seq::FirMemOp>(op))
      memOps.push_back(op);
  });

  SmallVector<std::pair<StringAttr, Value>> cOutputs;
  for (Operation *op : seqOps)
    for (Value v : op->getOperands()) {
      if (isConst(v) || v.getDefiningOp<seq::FirMemOp>())
        continue;
      collectUniqueOutput(cOutAdded, cOutputs, v, "to_s_", combModule.getContext());
    }

  if (!cOutputs.empty())
    combModule.appendOutputs(cOutputs);

  SmallVector<std::pair<StringAttr, Type>> cInputs;
  DenseMap<Value, size_t> cValueToInputIdx;
  SmallVector<Value> valuesToReplace;
  for (Operation *op : seqOps)
    for (Value res : op->getResults()) {
      size_t oldSize = cInputs.size();
      collectUniqueInput(cValueToInputIdx, cInputs, res, "from_s_",
                         combModule.getContext());
      if (cInputs.size() > oldSize)
        valuesToReplace.push_back(res);
    }

  if (!cInputs.empty()) {
    combModule.appendInputs(cInputs);
    Block *body = combModule.getBodyBlock();
    for (Value res : valuesToReplace) {
      size_t idx = cValueToInputIdx.lookup(res);
      BlockArgument arg = body->getArgument(cOrigInputs + idx);
      res.replaceAllUsesWith(arg);
    }
  }

  for (Operation *op : seqOps)
    op->erase();
  for (Operation *op : memOps)
    op->erase();
  return success();
}

static LogicalResult rewriteWrapperModule(HWModuleOp wrapper,
                                          HWModuleOp seqModule,
                                          HWModuleOp combModule,
                                          size_t cOrigInputs,
                                          size_t cOrigOutputs) {
  Block &body = wrapper.getBody().front();
  Operation *terminator = body.getTerminator();

  SmallVector<Operation *> toErase;
  for (Operation &op : body) {
    if (&op == terminator)
      continue;
    toErase.push_back(&op);
  }
  for (Operation *op : toErase) {
    op->dropAllUses();
    op->erase();
  }

  unsigned seqInputCount = seqModule.getNumInputPorts();
  unsigned seqOutputCount = seqModule.getNumOutputPorts();
  unsigned combExtraInputCount =
      combModule.getNumInputPorts() - cOrigInputs;
  unsigned combExtraOutputCount =
      combModule.getNumOutputPorts() - cOrigOutputs;

  if (seqInputCount != combExtraOutputCount) {
    wrapper.emitOpError()
        << "__corvus_seq expects " << seqInputCount
        << " inputs but __corvus_comb produced " << combExtraOutputCount
        << " bridge outputs";
    return failure();
  }
  if (seqOutputCount != combExtraInputCount) {
    wrapper.emitOpError()
        << "__corvus_comb expects " << combExtraInputCount
        << " bridge inputs but __corvus_seq produced " << seqOutputCount;
    return failure();
  }

  OpBuilder builder(terminator);
  Location loc = wrapper.getLoc();
  BackedgeBuilder edgeBuilder(builder, loc);

  SmallVector<Value> combInputs;
  combInputs.reserve(combModule.getNumInputPorts());
  for (unsigned i = 0; i < cOrigInputs; ++i)
    combInputs.push_back(body.getArgument(i));

  SmallVector<Backedge> fromSeqEdges;
  for (unsigned i = 0; i < combExtraInputCount; ++i) {
    Type ty = combModule.getInputTypes()[cOrigInputs + i];
    Backedge edge = edgeBuilder.get(ty);
    combInputs.push_back(edge);
    fromSeqEdges.push_back(edge);
  }

  auto combInst = builder.create<hw::InstanceOp>(
      loc, combModule.getOperation(),
      builder.getStringAttr("__corvus_comb_inst"), combInputs);

  SmallVector<Value> seqInputs;
  seqInputs.reserve(seqInputCount);
  for (unsigned i = 0; i < seqInputCount; ++i)
    seqInputs.push_back(combInst.getResult(cOrigOutputs + i));

  auto seqInst = builder.create<hw::InstanceOp>(
      loc, seqModule.getOperation(),
      builder.getStringAttr("__corvus_seq_inst"), seqInputs);

  for (unsigned i = 0; i < seqOutputCount; ++i)
    fromSeqEdges[i].setValue(seqInst.getResult(i));

  if (failed(edgeBuilder.clearOrEmitError()))
    return failure();

  SmallVector<Value> wrapperOutputs;
  wrapperOutputs.reserve(cOrigOutputs);
  for (unsigned i = 0; i < cOrigOutputs; ++i)
    wrapperOutputs.push_back(combInst.getResult(i));

  builder.create<hw::OutputOp>(loc, wrapperOutputs);
  terminator->erase();
  return success();
}

struct HWSplitSeqCombPass
    : circt::hw::impl::HWSplitSeqCombBase<HWSplitSeqCombPass> {
  using Base::Base;

  void runOnOperation() override {
    ModuleOp top = getOperation();
    MLIRContext *ctx = top.getContext();

    StringRef targetName =
        moduleName.empty() ? "__corvus_top" : StringRef(moduleName);

    SmallVector<HWModuleOp> matches;
    for (HWModuleOp mod : top.getOps<HWModuleOp>()) {
      auto nameAttr = mod.getModuleNameAttr();
      if (nameAttr && nameAttr.getValue() == targetName)
        matches.push_back(mod);
    }

    if (matches.empty()) {
      top.emitError()
          << "HWSplitSeqComb could not find hw.module named '" << targetName
          << "'";
      signalPassFailure();
      return;
    }
    if (matches.size() > 1) {
      top.emitError()
          << "HWSplitSeqComb found multiple hw.module ops named '" << targetName
          << "'";
      signalPassFailure();
      return;
    }

    auto ensureSymbolFree = [&](StringRef symbol) -> LogicalResult {
      if (top.lookupSymbol(StringAttr::get(ctx, symbol))) {
        top.emitError()
            << "HWSplitSeqComb cannot create module '" << symbol
            << "' because a symbol with the same name already exists";
        return failure();
      }
      return success();
    };

    if (failed(ensureSymbolFree("__corvus_seq")) ||
        failed(ensureSymbolFree("__corvus_comb"))) {
      signalPassFailure();
      return;
    }

    HWModuleOp wrapper = matches.front();
    OpBuilder builder(ctx);

    builder.setInsertionPointAfter(wrapper);
    auto seqModule = cast<HWModuleOp>(builder.clone(*wrapper));
    seqModule.setSymNameAttr(builder.getStringAttr("__corvus_seq"));
    seqModule.setPrivate();

    builder.setInsertionPointAfter(seqModule);
    auto combModule = cast<HWModuleOp>(builder.clone(*wrapper));
    combModule.setSymNameAttr(builder.getStringAttr("__corvus_comb"));
    combModule.setPrivate();

    size_t combOrigInputs = combModule.getNumInputPorts();
    size_t combOrigOutputs = combModule.getNumOutputPorts();

    if (failed(transformSequentialModule(seqModule)) ||
        failed(transformCombinationalModule(combModule, combOrigInputs,
                                            combOrigOutputs)) ||
        failed(rewriteWrapperModule(wrapper, seqModule, combModule,
                                    combOrigInputs, combOrigOutputs))) {
      signalPassFailure();
      return;
    }
  }
};

} // namespace
