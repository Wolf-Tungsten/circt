#include "circt/Dialect/Comb/CombOps.h"
#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "circt/Dialect/HW/HWTypes.h"
#include "circt/Dialect/Seq/SeqOps.h"
#include "mlir/IR/SymbolTable.h"
#include "mlir/Pass/Pass.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/Support/Debug.h"

#define DEBUG_TYPE "hw-export-cove-graph"

namespace circt {
namespace hw {
#define GEN_PASS_DEF_HWEXPORTCOVEGRAPH
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

using namespace circt;
using namespace hw;
using namespace mlir;

namespace {
struct HWExportCoveGraph {
  /// The number of partitions to create.
  // llvm::DenseMap<llvm::SmallString<0>, int> seenLabelCount;

  // std::string labelGuard(llvm::StringRef expectLabel) {
  //   auto search = seenLabelCount.find(expectLabel);
  //   if (search != seenLabelCount.end()) {
  //     // Label exists, increment the count and append suffix
  //     int count = search->second;
  //     llvm::Twine newLabel = expectLabel + "_" + llvm::Twine(count);
  //     seenLabelCount[expectLabel] = count + 1;
  //     // Also record the newLabel entry
  //     seenLabelCount[newLabel] = 1;
  //     return newLabel;
  //   } else {
  //     // Label is new, just add it to the map with initial count
  //     seenLabelCount[expectLabel] = 1;
  //     return expectLabel;
  //   }
  // }

  // llvm::DenseMap<std::string, Operation *> labelOpMap;

  // LogicalResult collectStateOps(circt::hw::HWModuleOp module) {

  //   module.walk([&](Operation *op) {
  //     if (isa<seq::CompRegOp>(op) || isa<seq::CompRegClockEnabledOp>(op) ||
  //         isa<seq::FirRegOp>(op)) {
  //       // 检查 `name` 属性是否为空
  //       StringAttr nameAttr = op->getAttrOfType<StringAttr>("name");
  //       if (!nameAttr || nameAttr.getValue().empty()) {
  //         // 设置初始名称为 `anonymous_firreg`
  //         std::string newName = "anonymous_firreg";
  //         // 使用 labelGuard 来获得一个安全的 label
  //         std::string safeLabel = labelGuard(newName);
  //         // 将安全的 label 设置到 `name` 属性上
  //         op->setAttr("name", StringAttr::get(op->getContext(), safeLabel));
  //         // 将操作指针插入到 `labelOpMap` 中
  //         labelOpMap[safeLabel] = op;
  //       } else {
  //         // 如果已有名称，也可以根据需要使用 `labelGuard`
  //         std::string existingName = nameAttr.getValue().str();
  //         std::string safeLabel = labelGuard(existingName);
  //         if (safeLabel != existingName) {
  //           op->setAttr("name", StringAttr::get(op->getContext(),
  //           safeLabel));
  //         }
  //         labelOpMap[safeLabel] = op;
  //       }
  //     } else if (isa<seq::FirMemWriteOp>(op) ||
  //                isa<seq::FirMemReadWriteOp>(op)) {
  //       // 获取 op 的第一个操作数，找这个 value 的 def op，必须是 firmem
  //       // 类型的 memOp， 获取 memOp 的 name 属性
  //       Value memoryOperand = op->getOperand(0);
  //       Operation *memOp = memoryOperand.getDefiningOp();
  //     }
  //   });
  // }

  // /// Run the partitioning pass on the given module.
  // LogicalResult run(ModuleOp circuit) {
  //   MLIRContext *ctx = circuit->getContext();
  //   llvm::outs() << "Defined Symbols in the Module:\n";
  //   // 直接遍历模块中的操作
  //   circuit.walk([](Operation *op) {
  //     // 判断操作是否实现了 SymbolOpInterface
  //     if (auto symbolOp = dyn_cast<SymbolOpInterface>(op)) {
  //       // 获取符号名称
  //       StringRef symbolName = symbolOp.getName();
  //       llvm::outs() << "- " << symbolName << "\n";
  //     }
  //   });

  //   circuit.walk([&](circt::hw::HWModuleOp mod) {
  //     llvm::outs() << "=== Module: " << mod.getName() << "\n";
  //     int id = 0;
  //     mod.walk([&](mlir::Operation *op) {
  //       // firreg
  //       if (auto fir = llvm::dyn_cast<circt::seq::FirRegOp>(op)) {
  //         std::string new_reg_name = "grh_reg_" + std::to_string(id++);
  //         llvm::outs()
  //             << "  firreg  : " << fir.getResult().getType() << " "
  //             << fir->getAttrOfType<mlir::StringAttr>("name").getValue()
  //             << "\n";
  //         // fir->setAttr("name", StringAttr::get(ctx, new_reg_name));
  //       }
  //       // compreg
  //       if (auto comp = llvm::dyn_cast<circt::seq::CompRegOp>(op)) {
  //         llvm::outs()
  //             << "  compreg : " << comp.getResult().getType() << " "
  //             << comp->getAttrOfType<mlir::StringAttr>("name").getValue()
  //             << "\n";
  //       }
  //     });
  //   });
  //   // LLVM_DEBUG(llvm::dbgs() << "User Request Partition:" << n << "\n");
  //   return success();
  // }
};
} // namespace

namespace {
// A test pass that simply replaces all wire names with foo_<n>
struct HWExportCoveGraphPass
    : circt::hw::impl::HWExportCoveGraphBase<HWExportCoveGraphPass> {
  using HWExportCoveGraphBase<HWExportCoveGraphPass>::HWExportCoveGraphBase;
  void runOnOperation() override;
};
} // namespace

void HWExportCoveGraphPass::runOnOperation() {

  HWExportCoveGraph exporter;

  // if (failed(exporter.run(getOperation())))
  //   signalPassFailure();
}
