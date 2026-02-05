#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "circt/Dialect/HW/HWTypes.h"
#include "mlir/Pass/Pass.h"
#include "circt/Dialect/Seq/SeqTypes.h" 
#include "llvm/Support/Debug.h"
#include "llvm/Support/Format.h" // 必须包含这个才能用 llvm::format
// Command line option handling
#include "llvm/Support/CommandLine.h"
#include <string>
#include <map>      
#include <vector> 
#include <algorithm> 

#define DEBUG_TYPE "hw-analysis"
static llvm::cl::opt<bool> partitionIoMatrix(
    "partition-io-matrix",
    llvm::cl::desc("Enable Cross-Partition IO Matrix Analysis"),
    llvm::cl::init(false));

namespace circt {
    namespace hw {
        #define GEN_PASS_DEF_HWANALYSIS
        #include "circt/Dialect/HW/Passes.h.inc"
    } // namespace hw
} // namespace circt

using namespace circt;
using namespace hw;

namespace {
    struct HWAnalysisPass : circt::hw::impl::HWAnalysisBase<HWAnalysisPass> {
        void runOnOperation() override;
    };
} // namespace

void HWAnalysisPass::runOnOperation() {
  auto moduleOp = getOperation();
  
  // 打印表头
  llvm::dbgs() << "\n============================================================================================================================================================================\n";
  llvm::dbgs() << "                                                                    Corvus RepCut Partition Statistics                                                                   \n";
  llvm::dbgs() << "============================================================================================================================================================================\n";
  
  // 【修复】直接打印预格式化好的表头 string，避开 llvm::format 对字符串数组的类型推导错误
  // 格式对应：Module(35) | Workload(13) | Inputs(12) | Outputs(12) | Total(12)
  llvm::dbgs() << "Module Name                         | Workload(Ops) | Inputs(bit)  | Outputs(bit) | Total IO     | BW<=8    | BW<=16   | BW<=32   | BW<=64   | BW>64\n";
  llvm::dbgs() << "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n";

  // 过滤关键字：只分析名字里包含 "corvus" 的模块
  // 【修改】改为 "" 空字符串，表示匹配所有模块，不再过滤。
  // 这样无论输入是 SimTop 还是 XiangShan 都能看到结果。
  const std::string filterKey = ""; 

  // [新增] 用于自定义指令挖掘的详细统计结构
  struct CombOpDetailedStats {
      uint64_t count = 0;
      uint64_t sumResultWidth = 0;
      uint64_t maxResultWidth = 0;
      uint64_t sumInputWidths = 0; // 反映逻辑锥宽度
      uint64_t sumDepth = 0;       // 反映逻辑链长度
      uint64_t maxDepth = 0;
      std::map<int, int> widthHistogram; // 记录常见位宽(如13bit)
  };
  std::map<std::string, CombOpDetailedStats> detailedCombStats;
  
  // 用于计算逻辑深度的临时 Map
  DenseMap<Value, int> valueDepthMap;

  // ===> [新增] 可融合操作对统计（producer -> consumer）
  struct FusiblePairStats {
      uint64_t count = 0;
      uint64_t sumDepthDiff = 0;         // consumerDepth - producerDepth
      uint64_t sumProducerResWidth = 0;  // producer result width sum
      uint64_t sumConsumerInWidth = 0;   // consumer input total width sum
  };
  std::map<std::pair<std::string,std::string>, FusiblePairStats> fusibleStats;

std::map<std::string,uint64_t> globalcombopnum;
  moduleOp.walk([&](hw::HWModuleOp op) {
    std::string moduleName = op.getName().str();

    // ===> 1. 过滤逻辑 <===
    if (moduleName.find(filterKey) == std::string::npos) {
        return; 
    }
    
    // [新增] 初始化当前模块的深度追踪
    valueDepthMap.clear();
    for(auto arg : op.getBody().getArguments()) valueDepthMap[arg] = 0;

    // ===> 2. Workload 统计 <===
    int logic_op_count = 0;
    op.walk([&](Operation *innerOp) {
        if (innerOp != op.getOperation() && !innerOp->hasTrait<OpTrait::IsTerminator>()) {
            
            // [新增] 计算逻辑深度和输入总位宽
            int currentInputDepth = 0;
            uint64_t currentInputBits = 0;
            for (Value operand : innerOp->getOperands()) {
                if (valueDepthMap.count(operand)) 
                    currentInputDepth = std::max(currentInputDepth, valueDepthMap[operand]);
                int opW = hw::getBitWidth(operand.getType());
                if (opW > 0) currentInputBits += opW;
            }
            
            // 计算当前 Op 的输出深度 (常量不增加深度)
            int myDepth = currentInputDepth + (innerOp->hasTrait<OpTrait::ConstantLike>() ? 0 : 1);
            for (Value res : innerOp->getResults()) valueDepthMap[res] = myDepth;

            // 原有计数逻辑
            logic_op_count++;
            StringRef opname = innerOp->getName().getStringRef();
            if(opname.starts_with("comb.")) {
              globalcombopnum[opname.str()]++;

              // [新增] 收集详细特征
              auto &stats = detailedCombStats[opname.str()];
              stats.count++;
              stats.sumDepth += myDepth;
              stats.maxDepth = std::max(stats.maxDepth, (uint64_t)myDepth);
              stats.sumInputWidths += currentInputBits;
              
              if (innerOp->getNumResults() > 0) {
                  int bw = hw::getBitWidth(innerOp->getResult(0).getType());
                  if (bw > 0) {
                      stats.sumResultWidth += bw;
                      stats.maxResultWidth = std::max(stats.maxResultWidth, (uint64_t)bw);
                      stats.widthHistogram[bw]++;
                  }
              }

              // ===> [新增] 记录 producer -> consumer 对 (仅限 comb.* -> comb.*)
              // 遍历当前 op 的每个操作数，若其 producer 是 comb.*，则统计该对
              for (Value operand : innerOp->getOperands()) {
                Operation *prodOp = operand.getDefiningOp();
                if (!prodOp) continue;
                StringRef prodName = prodOp->getName().getStringRef();
                if (!prodName.starts_with("comb.")) continue;

                int prodDepth = 0;
                if (valueDepthMap.count(operand)) prodDepth = valueDepthMap[operand];
                int depthDiff = myDepth - prodDepth;

                int prodResW = 0;
                if (prodOp->getNumResults() > 0)
                  prodResW = hw::getBitWidth(prodOp->getResult(0).getType());

                int consInW = hw::getBitWidth(operand.getType());

                auto key = std::make_pair(std::string(prodName.str()), std::string(opname.str()));
                auto &fs = fusibleStats[key];
                fs.count++;
                if (depthDiff >= 0) fs.sumDepthDiff += (uint64_t)depthDiff;
                if (prodResW > 0) fs.sumProducerResWidth += (uint64_t)prodResW;
                if (consInW > 0) fs.sumConsumerInWidth += (uint64_t)consInW;
              }
            }
        }
    });
    int port_less_8  = 0;
    int port_less_16 = 0;
    int port_less_32 = 0;
    int port_less_64 = 0;
    int port_above_64 = 0;

    // ===> 3. 端口位宽统计 <===
    uint64_t current_input_bits = 0;
    auto inputTypes = op.getInputTypes();
    for(size_t i = 0; i < op.getNumInputPorts(); i++){
      Type typeToCheck = inputTypes[i];
      if (auto inoutType = dyn_cast<hw::InOutType>(typeToCheck)) {
        typeToCheck = inoutType.getElementType();
      }
      int bitWidth = hw::getBitWidth(typeToCheck);
      if (bitWidth > 0) current_input_bits += bitWidth;
      if(bitWidth > 0){
        if(bitWidth <= 8)
          port_less_8++;
        else if(bitWidth > 8 && bitWidth <=16)
          port_less_16++;
        else if(bitWidth > 16 && bitWidth <=32)
          port_less_32++;
        else if(bitWidth > 32 && bitWidth <=64)
          port_less_64++;
        else
          port_above_64++;
      }
    }

    uint64_t current_output_bits = 0;
    auto outputTypes = op.getOutputTypes();
    for(size_t i = 0; i < op.getNumOutputPorts(); i++){
       Type typeToCheck = outputTypes[i];
      if (auto inoutType = dyn_cast<hw::InOutType>(typeToCheck)) {
        typeToCheck = inoutType.getElementType();
      }
      int bitWidth = hw::getBitWidth(typeToCheck);
      if (bitWidth > 0) current_output_bits += bitWidth;
      if(bitWidth > 0){
        if(bitWidth <= 8)
          port_less_8++;
        else if(bitWidth > 8 && bitWidth <=16)
          port_less_16++;
        else if(bitWidth > 16 && bitWidth <=32)
          port_less_32++;
        else if(bitWidth > 32 && bitWidth <=64)
          port_less_64++;
        else
          port_above_64++;
      }
    }
    
    // ===> 4. 打印一行数据 <===
    uint64_t total_io = current_input_bits + current_output_bits;
    
    // 【优化】添加强制类型转换 (unsigned long)，防止不同平台下 uint64_t 与 %lu 不匹配
    llvm::dbgs() << llvm::format("%-35s | %-13d | %-12lu | %-12lu | %-12lu | %-8d | %-8d | %-8d | %-8d | %-8d\n", 
                                moduleName.c_str(), 
                                logic_op_count, 
                                (unsigned long)current_input_bits, 
                                (unsigned long)current_output_bits, 
                                (unsigned long)total_io,
                                port_less_8,
                                port_less_16,
                                port_less_32,
                                port_less_64,
                                port_above_64);
  });
  
  llvm::dbgs() << "============================================================================================================================================================================\n\n";
  
  uint64_t combToExtrnBits = 0;
  uint64_t seqToCombBits = 0;

  // 假设 pass 在包含了所有实例的顶层模块上运行
  auto topMod = moduleOp; 

  // 1. 收集所有 comb 和 seq 实例的输出，放入集合中以便快速查找
  DenseSet<Value> allCombOutputs;
  DenseSet<Value> allSeqOutputs;
  DenseSet<Value> allExternal;
  topMod.walk([&](hw::InstanceOp inst) {
    if (inst.getModuleName().contains("_comb_")) {
      allCombOutputs.insert(inst.getResults().begin(), inst.getResults().end());
    } 
    else if (inst.getModuleName().contains("_seq_")) {
      allSeqOutputs.insert(inst.getResults().begin(), inst.getResults().end());
    }
    else if (inst.getModuleName().contains("_external")){
      allExternal.insert(inst.getResults().begin(), inst.getResults().end());
    }
  });

  // 2. 再次遍历实例，检查它们的输入是否来自对方类型的分区
  topMod.walk([&](hw::InstanceOp inst) {
    // 如果这是一个 SEQ 实例，检查它的输入是否来自 COMB 实例
    if (inst.getModuleName().contains("_external")) {
      for (Value input : inst.getOperands()) {
        if (allCombOutputs.contains(input)) {
          combToExtrnBits += hw::getBitWidth(input.getType());
        }
      }
    }
    // 如果这是一个 COMB 实例，检查它的输入是否来自 SEQ 实例
    else if (inst.getModuleName().contains("_comb_")) {
      for (Value input : inst.getOperands()) {
        if (allSeqOutputs.contains(input)) {
          seqToCombBits += hw::getBitWidth(input.getType());
        }
      }
    }
  });

  // 3. 打印总结
  llvm::dbgs() << "\n--- Cross-Partition IO Summary ---\n";
  llvm::dbgs() << "Total bit-width from COMB to EXTERN partitions: " << combToExtrnBits << "\n";
  llvm::dbgs() << "Total bit-width from SEQ to COMB partitions: " << seqToCombBits << "\n\n";

  // ===> [新增] 3. 打印 CombOp 详细统计概览 <===
  // 为了美观，先将 map 转为 vector 进行排序（按数量降序）
  std::vector<std::pair<std::string, uint64_t>> sortedStats(globalcombopnum.begin(), globalcombopnum.end());
  std::sort(sortedStats.begin(), sortedStats.end(), 
    [](const std::pair<std::string, uint64_t>& a, const std::pair<std::string, uint64_t>& b) {
        return a.second > b.second; // 降序排列
  });

  llvm::dbgs() << "\n--- Global Combinational Logic Breakdown ---\n";
  llvm::dbgs() << llvm::format("%-25s | %-10s\n", (const char*)"Comb Op Type", (const char*)"Count");
  llvm::dbgs() << "--------------------------+-----------\n";
  
  uint64_t totalCombOps = 0;
  for (const auto &pair : sortedStats) {
      llvm::dbgs() << llvm::format("%-25s | %-10lu\n", pair.first.c_str(), pair.second);
      totalCombOps += pair.second;
  }
  llvm::dbgs() << "--------------------------+-----------\n";
  llvm::dbgs() << llvm::format("%-25s | %-10lu\n\n", (const char*)"TOTAL COMB OPS", totalCombOps);

  // ===> [新增] 打印 CombOp 特征分析表 (用于自定义指令挖掘) <===
  llvm::dbgs() << "\n==========================================================================================================\n";
  llvm::dbgs() << "                                   COMB OP FEATURE ANALYSIS (For Custom Instr)                                  \n";
  llvm::dbgs() << "==========================================================================================================\n";
  
  std::vector<std::pair<std::string, CombOpDetailedStats>> sortedDetailed(detailedCombStats.begin(), detailedCombStats.end());
  std::sort(sortedDetailed.begin(), sortedDetailed.end(), 
    [](const auto& a, const auto& b) { return a.second.count > b.second.count; }); // 按数量降序

  // 使用 (const char*) 强转以避免 llvm::format 模版推导错误
  llvm::dbgs() << llvm::format("%-20s | %-8s | %-12s | %-12s | %-10s | %-10s | %-15s\n", 
      (const char*)"Op Type", (const char*)"Count", 
      (const char*)"Avg Res Bits", (const char*)"Avg In Bits", 
      (const char*)"Avg Depth", (const char*)"Max Depth", 
      (const char*)"Common Widths");
  llvm::dbgs() << "---------------------+----------+--------------+--------------+------------+------------+----------------\n";

  for (const auto &pair : sortedDetailed) {
      const auto &name = pair.first;
      const auto &st = pair.second;
      
      double avgResW = st.count ? (double)st.sumResultWidth / st.count : 0.0;
      double avgInW = st.count ? (double)st.sumInputWidths / st.count : 0.0;
      double avgDepth = st.count ? (double)st.sumDepth / st.count : 0.0;

      // 找出 Top 2 最常见的位宽
      std::vector<std::pair<int,int>> widthCounts(st.widthHistogram.begin(), st.widthHistogram.end());
      std::sort(widthCounts.begin(), widthCounts.end(), [](const auto &a, const auto &b){ return a.second > b.second; });
      
      std::string commonWStr = "";
      if(!widthCounts.empty()) commonWStr += std::to_string(widthCounts[0].first);
      if(widthCounts.size() > 1) commonWStr += "," + std::to_string(widthCounts[1].first);

      llvm::dbgs() << llvm::format("%-20s | %-8lu | %-12.1f | %-12.1f | %-10.1f | %-10lu | %-15s\n",
          name.c_str(), (unsigned long)st.count, avgResW, avgInW, avgDepth, (unsigned long)st.maxDepth, commonWStr.c_str());
  }
  llvm::dbgs() << "----------------------------------------------------------------------------------------------------------\n\n";

  // ===> [新增] 打印可融合操作对（按出现次数降序, top50）
  if (!fusibleStats.empty()) {
    llvm::dbgs() << "\n--- Fusible CombOp Pairs (producer -> consumer) ---\n";
    std::vector<std::pair<std::pair<std::string,std::string>, FusiblePairStats>> fusVec(fusibleStats.begin(), fusibleStats.end());
    std::sort(fusVec.begin(), fusVec.end(), [](const auto &a, const auto &b){ return a.second.count > b.second.count; });
    llvm::dbgs() << llvm::format("%-40s | %-10s | %-10s | %-12s | %-12s\n", (const char*)"Pair", (const char*)"Count", (const char*)"AvgDepth", (const char*)"AvgProdRes", (const char*)"AvgConsIn");
    llvm::dbgs() << "-----------------------------------------+-----------+-----------+--------------+--------------\n";
    for (size_t i = 0; i < fusVec.size() && i < 50; ++i) {
      const auto &key = fusVec[i].first;
      const auto &s = fusVec[i].second;
      double avgDepth = s.count ? (double)s.sumDepthDiff / s.count : 0.0;
      double avgProdRes = s.count ? (double)s.sumProducerResWidth / s.count : 0.0;
      double avgConsIn = s.count ? (double)s.sumConsumerInWidth / s.count : 0.0;
      std::string pairName = key.first + " -> " + key.second;
      llvm::dbgs() << llvm::format("%-40s | %-10lu | %-10.2f | %-12.1f | %-12.1f\n",
          pairName.c_str(), (unsigned long)s.count, avgDepth, avgProdRes, avgConsIn);
    }
    llvm::dbgs() << "---------------------------------------------------------------\n\n";
  }

    // 1. 定义存储结构
  struct PartInfo { std::string type; int id; };
  if (partitionIoMatrix) {
    DenseMap<Value, PartInfo> valueSourceMap;
    int maxId = -1;

  // 辅助：从模块名解析类型和 ID (例如 corvus_seq_P5 -> {seq, 5})
  auto getPartInfo = [](StringRef name) -> PartInfo {
    int id = -1;
    std::string ty = "other";
    if (name.contains("_seq_")) ty = "seq";
    else if (name.contains("_comb_")) ty = "comb";
    else if (name.contains("_external")) ty = "ext";

    size_t pPos = name.find("_P");
    if (pPos != StringRef::npos) {
      StringRef idStr = name.substr(pPos + 2);
      idStr.consumeInteger(10, id);
    }
    return {ty, id};
  };

  // 2. 第一遍遍历：注册所有输出的源头
  topMod.walk([&](hw::InstanceOp inst) {
    PartInfo info = getPartInfo(inst.getModuleName());
    if (info.id > maxId) maxId = info.id;
    for (Value res : inst.getResults())
      valueSourceMap[res] = info;
  });

  // 3. 第二遍遍历：统计跨区流量 (使用矩阵)
  // 统计矩阵: [srcId][dstId]
  std::vector<std::vector<uint64_t>> s2cMatrix(maxId + 1, std::vector<uint64_t>(maxId + 1, 0));

  topMod.walk([&](hw::InstanceOp inst) {
    PartInfo dst = getPartInfo(inst.getModuleName());
    if (dst.type != "comb" || dst.id == -1) return;

    for (Value input : inst.getOperands()) {
      // 穿透 Bitcast 追踪源头
      Value root = input;
      while (auto cast = root.getDefiningOp<hw::BitcastOp>())
        root = cast.getOperand();

      if (valueSourceMap.count(root)) {
        PartInfo src = valueSourceMap[root];
        if (src.type == "seq" && src.id != -1) {
          s2cMatrix[src.id][dst.id] += hw::getBitWidth(input.getType());
        }
      }
    }
  });

  // 4. 打印矩阵结果
  llvm::dbgs() << "\n--- Cross-Partition IO Matrix (SEQ_Pi -> COMB_Pj Bitwidth) ---\n";
  llvm::dbgs() << "Src\\Dst |";
  for(int i=0; i<=maxId; ++i) llvm::dbgs() << llvm::format("  P%-2d |", i);
  llvm::dbgs() << "\n--------+";
  for(int i=0; i<=maxId; ++i) llvm::dbgs() << "------+";
  llvm::dbgs() << "\n";

  for (int i = 0; i <= maxId; ++i) {
    llvm::dbgs() << llvm::format(" P%-2d   |", i);
    for (int j = 0; j <= maxId; ++j) {
      llvm::dbgs() << llvm::format(" %4lu |", (unsigned long)s2cMatrix[i][j]);
    }
    llvm::dbgs() << "\n";
  }
  } // end if (partitionIoMatrix)
}
