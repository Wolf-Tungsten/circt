//===- HWInsertPartitionWires.cpp - Wire between partitions and seq ops -*- C++
//-*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//===----------------------------------------------------------------------===//
//
// This pass inserts hw.wire operations between operations that feed operands of
// sequential boundary ops (seq::FirRegOp/Mem* ops) whenever those operands are
// annotated with hw.repcut_partitions. The partition information is attached to
// seq boundary ops, and replicated comb ops can belong to multiple partitions.
// Without an intermediate wire per defining op/partition combination, later
// partitioning collapses multiple outputs down to a single connection.
//
// For each operand of a boundary op:
//   * ignore constants and operands produced by seq::FirMemOp (mem entity).
//   * determine the set of partition IDs on the boundary op.
//   * insert a single hw.wire op between the defining operation and the
//     boundary op, keyed by (defining operation, partition-set) so that all
//     operands sharing the same producer and partition set reuse the same wire.
//
//===----------------------------------------------------------------------===//

#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "circt/Dialect/Seq/SeqOps.h"
#include "mlir/IR/Builders.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/SmallVector.h"
#include <algorithm>

#define DEBUG_TYPE "hw-insert-partition-wires"

namespace circt {
namespace hw {
#define GEN_PASS_DEF_HWINSERTPARTITIONWIRES
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

using namespace mlir;
using namespace circt;
using namespace hw;

namespace {

static bool isBoundaryOp(Operation *op) {
  return isa<seq::FirRegOp, seq::FirMemReadOp, seq::FirMemWriteOp,
             seq::FirMemReadWriteOp, hw::OutputOp>(op);
}

static bool collectPartitionInfo(Operation *op, ArrayAttr &attr,
                                 SmallVectorImpl<uint64_t> &ids) {
  attr = op->getAttrOfType<ArrayAttr>("hw.repcut_partitions");
  if (!attr || attr.empty())
    return false;

  ids.clear();
  for (Attribute elem : attr)
    if (auto intAttr = dyn_cast<IntegerAttr>(elem))
      ids.push_back(intAttr.getUInt());

  if (ids.empty())
    return false;

  llvm::sort(ids);
  ids.erase(std::unique(ids.begin(), ids.end()), ids.end());
  return true;
}

struct DefPartitionKey {
  Operation *defOp = nullptr;
  SmallVector<uint64_t, 4> partitions;

  DefPartitionKey() = default;
  DefPartitionKey(Operation *op, ArrayRef<uint64_t> ids)
      : defOp(op), partitions(ids.begin(), ids.end()) {}

  bool operator==(const DefPartitionKey &other) const {
    if (defOp != other.defOp)
      return false;
    return partitions == other.partitions;
  }
};

struct DefPartitionKeyInfo : llvm::DenseMapInfo<DefPartitionKey> {
  static DefPartitionKey getEmptyKey() { return {}; }
  static DefPartitionKey getTombstoneKey() {
    DefPartitionKey key;
    key.defOp = reinterpret_cast<Operation *>(-1);
    return key;
  }

  static unsigned getHashValue(const DefPartitionKey &key) {
    unsigned h = llvm::hash_value(key.defOp);
    for (uint64_t id : key.partitions)
      h = llvm::hash_combine(h, id);
    return h;
  }

  static bool isEqual(const DefPartitionKey &lhs, const DefPartitionKey &rhs) {
    return lhs == rhs;
  }
};

struct HWInsertPartitionWiresPass
    : hw::impl::HWInsertPartitionWiresBase<HWInsertPartitionWiresPass> {
  using HWInsertPartitionWiresBase::HWInsertPartitionWiresBase;

  void runOnOperation() override {
    auto module = getOperation();
    if (!moduleName.empty() && module.getModuleName() != moduleName)
      return;

    OpBuilder builder(&getContext());
    DenseMap<DefPartitionKey, Value, DefPartitionKeyInfo> keyToWire;

    module.walk([&](Operation *op) {
      if (!isBoundaryOp(op))
        return;

      ArrayAttr partitionsAttr;
      SmallVector<uint64_t, 4> partitions;
      if (!collectPartitionInfo(op, partitionsAttr, partitions))
        return;

      for (OpOperand &operand : op->getOpOperands()) {
        Value value = operand.get();
        if (!value)
          continue;

        if (value.getDefiningOp<hw::ConstantOp>())
          continue;
        if (value.getDefiningOp<seq::FirMemOp>())
          continue;

        Operation *defOp = value.getDefiningOp();
        if (!defOp)
          continue;

        DefPartitionKey key(defOp, partitions);
        auto it = keyToWire.find(key);
        Value wireValue;
        if (it != keyToWire.end()) {
          wireValue = it->second;
        } else {
          builder.setInsertionPointAfter(defOp);
          auto wire = builder.create<hw::WireOp>(value.getLoc(),
                                                 value.getType(), value);
          if (partitionsAttr)
            wire->setAttr("hw.repcut_partitions", partitionsAttr);
          wireValue = wire.getResult();
          keyToWire.try_emplace(key, wireValue);
        }
        operand.set(wireValue);
      }
    });
  }
};

} // namespace
