#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "circt/Dialect/HW/HWTypes.h"
#include "mlir/Pass/Pass.h"
#include "llvm/Support/Debug.h"

#define DEBUG_TYPE "hw-partition"

namespace circt {
namespace hw {
#define GEN_PASS_DEF_HWPARTITION
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

using namespace circt;
using namespace hw;

namespace {
struct HWPartitioner {
  /// The number of partitions to create.
  int n = 4;

  /// Run the partitioning pass on the given module.
  LogicalResult run(ModuleOp module) {
    LLVM_DEBUG(llvm::dbgs() << "User Request Partition:" << n << "\n");
    return success();
  }
};
} // namespace

namespace {
// A test pass that simply replaces all wire names with foo_<n>
struct HWPartitionPass : circt::hw::impl::HWPartitionBase<HWPartitionPass> {
  using HWPartitionBase<HWPartitionPass>::HWPartitionBase;
  void runOnOperation() override;
};
} // namespace

void HWPartitionPass::runOnOperation() {

  HWPartitioner partitioner;
  partitioner.n = n;

  if (failed(partitioner.run(getOperation())))
    signalPassFailure();
}
