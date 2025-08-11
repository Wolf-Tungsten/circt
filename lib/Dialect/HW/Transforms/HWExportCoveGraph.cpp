#include "circt/Dialect/Comb/CombOps.h"
#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "circt/Dialect/HW/HWTypes.h"
#include "circt/Dialect/Seq/SeqOps.h"
#include "mlir/IR/SymbolTable.h"
#include "mlir/Pass/Pass.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/JSON.h"
#include "llvm/Support/raw_ostream.h"
#include <deque>

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

  std::string outputJSONPath;
  /// The number of partitions to create.
  std::unordered_map<std::string, int> seenLabelCount;

  std::string labelGuard(std::string expectLabel) {
    auto search = seenLabelCount.find(expectLabel);
    if (search != seenLabelCount.end()) {
      // Label exists, increment the count and append suffix
      int count = search->second;
      std::string newLabel = expectLabel + "_" + std::to_string(count);
      seenLabelCount[expectLabel] = count + 1;
      // Also record the newLabel entry
      seenLabelCount[newLabel] = 1;
      return newLabel;
    } else {
      // Label is new, just add it to the map with initial count
      seenLabelCount[expectLabel] = 1;
      return expectLabel;
    }
  }

  std::unordered_map<std::string, Operation *> labelStateOpMap;
  std::unordered_map<Operation *, std::string> statelessOpIdMap;
  int statelessOpIdCounter = 0;

  void collectOps(circt::hw::HWModuleOp module) {

    module.walk([&](Operation *op) {
      if (op == module) {
        // 跳过模块本身
        return;
      }
      if (isa<seq::CompRegOp>(op) || isa<seq::CompRegClockEnabledOp>(op) ||
          isa<seq::FirRegOp>(op)) {
        // 检查 `name` 属性是否为空
        StringAttr nameAttr = op->getAttrOfType<StringAttr>("name");
        if (!nameAttr || nameAttr.getValue().empty()) {
          // 设置初始名称为 `anonymous_firreg`
          std::string newName = "anonymous_firreg";
          // 使用 labelGuard 来获得一个安全的 label
          std::string safeLabel = labelGuard(newName);
          // 将安全的 label 设置到 `name` 属性上
          op->setAttr("name", StringAttr::get(op->getContext(), safeLabel));
          // 将操作指针插入到 `labelOpMap` 中
          labelStateOpMap[safeLabel] = op;
        } else {
          // 如果已有名称，也可以根据需要使用 `labelGuard`
          std::string existingName = nameAttr.getValue().str();
          std::string safeLabel = labelGuard(existingName);
          if (safeLabel != existingName) {
            op->setAttr("name", StringAttr::get(op->getContext(), safeLabel));
          }
          labelStateOpMap[safeLabel] = op;
        }
      } else if (isa<seq::FirMemWriteOp>(op) ||
                 isa<seq::FirMemReadWriteOp>(op)) {
        // 获取 op 的第一个操作数，找这个 value 的 def op，必须是 firmem
        // 类型的 memOp， 获取 memOp 的 name 属性
        Value memoryOperand = op->getOperand(0);
        Operation *memOp = memoryOperand.getDefiningOp();
        llvm::StringRef memName =
            memOp->getAttrOfType<StringAttr>("name").getValue();
        if (memName.empty()) {
          // 如果没有名称，设置一个默认名称
          std::string newMemName = "anonymous_firmem";
          newMemName = labelGuard(newMemName);
          memOp->setAttr("name", StringAttr::get(op->getContext(), newMemName));
          memName = memOp->getAttrOfType<StringAttr>("name").getValue();
        }
        std::string portName = memName.str() + "_port";
        portName = labelGuard(portName);
        labelStateOpMap[portName] = op;
      } else {
        // stateless op
        if (statelessOpIdMap.count(op) == 0) {
          std::string label = op->getName().getStringRef().str();
          label = labelGuard(label);
          statelessOpIdMap[op] = label;
        }
      }
    });
  }

  std::unordered_map<std::string, llvm::SmallPtrSet<Operation *, 8>> coveMap;

  bool isStopOp(Operation *op) {
    // 检查操作是否是状态操作
    return isa<seq::CompRegOp>(op) || isa<seq::CompRegClockEnabledOp>(op) ||
           isa<seq::FirRegOp>(op) || isa<seq::FirMemReadOp>(op) ||
           isa<seq::FirMemReadWriteOp>(op) || isa<hw::ConstantOp>(op);
  }

  LogicalResult pickLogicCove(const std::string &stateOplabel) {
    if (labelStateOpMap.count(stateOplabel) == 0) {
      llvm::errs() << "Error: No operation found for label: " << stateOplabel
                   << "\n";
      return failure();
    }
    Operation *op = labelStateOpMap[stateOplabel];
    // BFS 遍历产生逻辑锥
    llvm::SmallPtrSet<Operation *, 8> coveSet;
    std::deque<Operation *> worklist;
    auto tryUpdateCoveAndWorklist = [&](Value v) {
      if (!v) {
        return;
      }
      Operation *defOp = v.getDefiningOp();
      if (defOp && !isStopOp(defOp) && !coveSet.contains(defOp)) {
        coveSet.insert(defOp);
        worklist.push_back(defOp);
      }
    };
    // 初始化装载
    if (auto compReg = dyn_cast<seq::CompRegOp>(op)) {
      // input
      tryUpdateCoveAndWorklist(compReg.getInput());
    } else if (auto compRegCe = dyn_cast<seq::CompRegClockEnabledOp>(op)) {
      // input
      tryUpdateCoveAndWorklist(compRegCe.getInput());
      // 处理时钟使能信号
      tryUpdateCoveAndWorklist(compRegCe.getClockEnable());
    } else if (auto firReg = dyn_cast<seq::FirRegOp>(op)) {
      // next
      tryUpdateCoveAndWorklist(firReg.getNext());
      tryUpdateCoveAndWorklist(firReg.getReset());
    } else if (auto firMemWrite = dyn_cast<seq::FirMemWriteOp>(op)) {
      tryUpdateCoveAndWorklist(firMemWrite.getData());
      tryUpdateCoveAndWorklist(firMemWrite.getAddress());
      tryUpdateCoveAndWorklist(firMemWrite.getMask());
      tryUpdateCoveAndWorklist(firMemWrite.getEnable());
    } else if (auto firMemReadWrite = dyn_cast<seq::FirMemReadWriteOp>(op)) {
      tryUpdateCoveAndWorklist(firMemReadWrite.getWriteData());
      tryUpdateCoveAndWorklist(firMemReadWrite.getAddress());
      tryUpdateCoveAndWorklist(firMemReadWrite.getMask());
      tryUpdateCoveAndWorklist(firMemReadWrite.getEnable());
      tryUpdateCoveAndWorklist(firMemReadWrite.getMode());
    } else {
      return failure();
    }
    while (!worklist.empty()) {
      Operation *currentOp = worklist.front();
      worklist.pop_front();
      // 遍历 currentOp 的所有操作数
      for (Value operand : currentOp->getOperands()) {
        tryUpdateCoveAndWorklist(operand);
      }
    }
    // 将 coveSet 添加到 coveMap 中
    coveMap[stateOplabel] = coveSet;
    return success();
  }

  void printCove() {
    for (const auto &pair : coveMap) {
      llvm::outs() << "Cove for state op label: " << pair.first << "\n";
      for (Operation *op : pair.second) {
        llvm::outs() << "  Op ID: " << statelessOpIdMap[op] << ", Op: ";
        op->print(llvm::outs());
        llvm::outs() << "\n";
      }
    }
  }

  void dumpJson() {
    std::error_code ec;
    llvm::raw_fd_ostream raw_os(outputJSONPath, ec, llvm::sys::fs::OF_Text);
    if (ec) {
      llvm::errs() << "Cannot open file: " << ec.message() << "\n";
      return;
    }
    llvm::json::OStream os(raw_os, 2);
    os.object([&] {
      os.attributeObject("coveMap", [&] {
        for (const auto &pair : coveMap) {
          os.attributeArray(pair.first, [&] {
            for (Operation *op : pair.second) {
              // 输出操作的 ID
              os.value(statelessOpIdMap[op]);
            }
          });
        }
      });
      os.attributeObject("statelessOp", [&] {
        for (const auto &pair : statelessOpIdMap) {
          os.attribute(pair.second, pair.first->getName().getStringRef());
        }
      });
      os.attributeObject("statefulOp", [&] {
        for (const auto &pair : labelStateOpMap) {
          os.attribute(pair.first, pair.second->getName().getStringRef());
        }
      });
    });
  }
  LogicalResult run(hw::HWModuleOp topModule) {
    llvm::dbgs() << "Running HWExportCoveGraph on module: "
                 << topModule.getName() << "\n";
    collectOps(topModule);
    llvm::dbgs() << "Collected " << labelStateOpMap.size()
                 << " stateful operations and " << statelessOpIdMap.size()
                 << " stateless operations.\n";
    // 遍历所有的状态操作
    for (auto [label, op] : labelStateOpMap) {
      // 处理逻辑锥
      llvm::dbgs() << "Processing logic cove for label: " << label << "\n";
      if (failed(pickLogicCove(label))) {
        llvm::errs() << "Failed to pick logic cove for label: " << label
                     << "\n";
        return failure();
      }
    }
    // 输出 JSON 文件
    if (!outputJSONPath.empty()) {
      dumpJson();
    }
    return success();
  }
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
  exporter.outputJSONPath = outputJSONPath;
  getOperation()->walk([&](hw::HWModuleOp module) {
    if (failed(exporter.run(module))) {
      signalPassFailure();
    }
  });
  // if (failed(exporter.run(getOperation())))
  //   signalPassFailure();
}
