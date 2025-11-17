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

#include "circt/Dialect/HW/HWAttributes.h"
#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "circt/Dialect/Seq/SeqOps.h"
#include "circt/Support/BackedgeBuilder.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/SymbolTable.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/StringSet.h"
#include <numeric>
#include <cctype>

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

static std::string sanitizePortComponent(StringRef raw) {
  std::string result;
  result.reserve(raw.size());
  for (char ch : raw) {
    unsigned char c = static_cast<unsigned char>(ch);
    if (std::isalnum(c) || ch == '_')
      result.push_back(ch);
    else
      result.push_back('_');
  }
  if (result.empty())
    return "";
  if (std::isdigit(static_cast<unsigned char>(result.front())))
    result.insert(result.begin(), '_');
  return result;
}

static std::string
makeUniquePortName(StringRef desired, StringRef fallback,
                   llvm::StringSet<> &usedNames) {
  std::string base = sanitizePortComponent(desired);
  if (base.empty())
    base = sanitizePortComponent(fallback);
  if (base.empty())
    base = "port";

  std::string name = base;
  unsigned suffix = 0;
  while (usedNames.contains(name))
    name = base + "_" + std::to_string(++suffix);
  usedNames.insert(name);
  return name;
}

static std::string getRegEntityName(seq::FirRegOp reg) {
  StringRef name = reg.getName();
  if (!name.empty())
    return name.str();
  if (auto innerSym = reg.getInnerSymAttr())
    if (auto symName = innerSym.getSymName())
      if (!symName.getValue().empty())
        return symName.getValue().str();
  return "anon_reg";
}

static std::string getMemEntityName(Value memVal) {
  if (auto memOp = memVal.getDefiningOp<seq::FirMemOp>()) {
    if (auto nameOpt = memOp.getName())
      if (!nameOpt->empty())
        return nameOpt->str();
    if (auto innerSymOpt = memOp.getInnerSym())
      if (auto symName = innerSymOpt->getSymName())
        if (!symName.getValue().empty())
          return symName.getValue().str();
  }
  return "anon_mem";
}

static std::string getSeqMemPortPrefix(Operation *op, Value memVal) {
  std::string base = getMemEntityName(memVal);
  if (isa<seq::FirMemReadOp>(op))
    return base + "_rd";
  if (isa<seq::FirMemWriteOp>(op))
    return base + "_wr";
  if (isa<seq::FirMemReadWriteOp>(op))
    return base + "_rw";
  return base;
}

static std::string getSeqOperandPortName(Operation *op, OpOperand &operand) {
  Value val = operand.get();
  if (auto reg = dyn_cast<seq::FirRegOp>(op)) {
    std::string base = getRegEntityName(reg);
    if (val == reg.getNext())
      return base + "_d";
    if (val == reg.getClk())
      return base + "_clk";
    Value reset = reg.getReset();
    if (reset && val == reset)
      return base + "_rst";
    Value resetVal = reg.getResetValue();
    if (resetVal && val == resetVal)
      return base + "_rstval";
    return base + "_in";
  }

  if (auto read = dyn_cast<seq::FirMemReadOp>(op)) {
    std::string prefix = getSeqMemPortPrefix(op, read.getMemory());
    if (val == read.getAddress())
      return prefix + "_addr";
    if (val == read.getClk())
      return prefix + "_clk";
    Value en = read.getEnable();
    if (en && val == en)
      return prefix + "_en";
    return prefix + "_in";
  }

  if (auto write = dyn_cast<seq::FirMemWriteOp>(op)) {
    std::string prefix = getSeqMemPortPrefix(op, write.getMemory());
    if (val == write.getAddress())
      return prefix + "_addr";
    if (val == write.getClk())
      return prefix + "_clk";
    Value en = write.getEnable();
    if (en && val == en)
      return prefix + "_en";
    if (val == write.getData())
      return prefix + "_d";
    Value mask = write.getMask();
    if (mask && val == mask)
      return prefix + "_mask";
    return prefix + "_in";
  }

  if (auto readWrite = dyn_cast<seq::FirMemReadWriteOp>(op)) {
    std::string prefix = getSeqMemPortPrefix(op, readWrite.getMemory());
    if (val == readWrite.getAddress())
      return prefix + "_addr";
    if (val == readWrite.getClk())
      return prefix + "_clk";
    Value en = readWrite.getEnable();
    if (en && val == en)
      return prefix + "_en";
    if (val == readWrite.getWriteData())
      return prefix + "_wd";
    if (val == readWrite.getMode())
      return prefix + "_mode";
    Value mask = readWrite.getMask();
    if (mask && val == mask)
      return prefix + "_mask";
    return prefix + "_in";
  }

  return "";
}

static std::string getSeqResultPortName(Operation *op, unsigned resultIndex) {
  (void)resultIndex;
  if (auto reg = dyn_cast<seq::FirRegOp>(op))
    return getRegEntityName(reg) + "_q";
  if (auto read = dyn_cast<seq::FirMemReadOp>(op))
    return getSeqMemPortPrefix(op, read.getMemory()) + "_data";
  if (auto readWrite = dyn_cast<seq::FirMemReadWriteOp>(op))
    return getSeqMemPortPrefix(op, readWrite.getMemory()) + "_rdata";
  return "";
}

static size_t
collectUniqueInput(DenseMap<Value, size_t> &map,
                   SmallVector<std::pair<StringAttr, Type>> &inputs, Value v,
                   llvm::StringSet<> &usedNames, MLIRContext *ctx,
                   StringRef desiredName, StringRef fallbackPrefix,
                   bool *isNew = nullptr) {
  if (auto it = map.find(v); it != map.end()) {
    if (isNew)
      *isNew = false;
    return it->second;
  }

  std::string name =
      makeUniquePortName(desiredName, fallbackPrefix, usedNames);
  size_t idx = inputs.size();
  inputs.emplace_back(StringAttr::get(ctx, name), v.getType());
  map.try_emplace(v, idx);
  if (isNew)
    *isNew = true;
  return idx;
}

static void collectUniqueOutput(DenseSet<Value> &added,
                                SmallVector<std::pair<StringAttr, Value>> &outputs,
                                Value v, llvm::StringSet<> &usedNames,
                                MLIRContext *ctx, StringRef desiredName,
                                StringRef fallbackPrefix) {
  if (added.contains(v))
    return;
  std::string name =
      makeUniquePortName(desiredName, fallbackPrefix, usedNames);
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
  llvm::StringSet<> usedInputNames;
  llvm::StringSet<> usedOutputNames;

  for (Operation &op : *seqModule.getBodyBlock()) {
    if (!isSeqBoundaryOp(&op))
      continue;

    for (OpOperand &operand : op.getOpOperands()) {
      Value v = operand.get();
      if (isConst(v) || v.getDefiningOp<seq::FirMemOp>())
        continue;
      std::string desiredName = getSeqOperandPortName(&op, operand);
      size_t idx =
          collectUniqueInput(valToInputIdx, sInputs, v, usedInputNames,
                             seqModule.getContext(), desiredName, "seq_in");
      operandsToReplace.push_back({&operand, idx});
    }

    unsigned resultIndex = 0;
    for (Value res : op.getResults())
      collectUniqueOutput(exported, sOutputs, res, usedOutputNames,
                          seqModule.getContext(),
                          getSeqResultPortName(&op, resultIndex++), "seq_out");
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

  llvm::StringSet<> usedOutputNames;
  llvm::StringSet<> usedInputNames;
  SmallVector<std::pair<StringAttr, Value>> cOutputs;
  for (Operation *op : seqOps)
    for (OpOperand &operand : op->getOpOperands()) {
      Value v = operand.get();
      if (isConst(v) || v.getDefiningOp<seq::FirMemOp>())
        continue;
      collectUniqueOutput(cOutAdded, cOutputs, v, usedOutputNames,
                          combModule.getContext(),
                          getSeqOperandPortName(op, operand), "to_s");
    }

  if (!cOutputs.empty())
    combModule.appendOutputs(cOutputs);

  SmallVector<std::pair<StringAttr, Type>> cInputs;
  DenseMap<Value, size_t> cValueToInputIdx;
  SmallVector<Value> valuesToReplace;
  for (Operation *op : seqOps) {
    unsigned resultIndex = 0;
    for (Value res : op->getResults()) {
      bool inserted = false;
      collectUniqueInput(cValueToInputIdx, cInputs, res, usedInputNames,
                         combModule.getContext(),
                         getSeqResultPortName(op, resultIndex++), "from_s",
                         &inserted);
      if (inserted)
        valuesToReplace.push_back(res);
    }
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
        << "corvus_seq expects " << seqInputCount
        << " inputs but corvus_comb produced " << combExtraOutputCount
        << " bridge outputs";
    return failure();
  }
  if (seqOutputCount != combExtraInputCount) {
    wrapper.emitOpError()
        << "corvus_comb expects " << combExtraInputCount
        << " bridge inputs but corvus_seq produced " << seqOutputCount;
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
      builder.getStringAttr("corvus_comb_inst"), combInputs);

  SmallVector<Value> seqInputs;
  seqInputs.reserve(seqInputCount);
  for (unsigned i = 0; i < seqInputCount; ++i)
    seqInputs.push_back(combInst.getResult(cOrigOutputs + i));

  auto seqInst = builder.create<hw::InstanceOp>(
      loc, seqModule.getOperation(),
      builder.getStringAttr("corvus_seq_inst"), seqInputs);

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
        moduleName.empty() ? "corvus_top" : StringRef(moduleName);

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

    if (failed(ensureSymbolFree("corvus_seq")) ||
        failed(ensureSymbolFree("corvus_comb"))) {
      signalPassFailure();
      return;
    }

    HWModuleOp wrapper = matches.front();
    OpBuilder builder(ctx);

    builder.setInsertionPointAfter(wrapper);
    auto seqModule = cast<HWModuleOp>(builder.clone(*wrapper));
    seqModule.setSymNameAttr(builder.getStringAttr("corvus_seq"));
    seqModule.setPrivate();

    builder.setInsertionPointAfter(seqModule);
    auto combModule = cast<HWModuleOp>(builder.clone(*wrapper));
    combModule.setSymNameAttr(builder.getStringAttr("corvus_comb"));
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
