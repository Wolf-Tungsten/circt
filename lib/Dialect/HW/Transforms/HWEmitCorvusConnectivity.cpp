//===- HWEmitCorvusConnectivity.cpp - Emit Corvus connectivity JSON -------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This pass collects connectivity information tailored for the Corvus flow and
// serialises it into a JSON file. The emitted JSON summarises how the top-level
// module interfaces with the partition modules produced by previous Corvus
// passes. The pass only succeeds if every referenced connection can be traced
// back to either the public top-level inputs or the outputs of modules marked
// with the `__corvus_partition` attribute.
//
//===----------------------------------------------------------------------===//

#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "circt/Dialect/HW/HWTypes.h"
#include "circt/Dialect/Seq/SeqTypes.h"
#include "mlir/IR/BuiltinOps.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/JSON.h"
#include "llvm/Support/raw_ostream.h"
#include <functional>
#include <memory>

using namespace mlir;
using namespace circt;
using namespace circt::hw;

namespace circt {
namespace hw {
#define GEN_PASS_DEF_HWEMITCORVUSCONNECTIVITY
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

namespace {

struct HWEmitCorvusConnectivityPass
    : public hw::impl::HWEmitCorvusConnectivityBase<
          HWEmitCorvusConnectivityPass> {
  using Base =
      hw::impl::HWEmitCorvusConnectivityBase<HWEmitCorvusConnectivityPass>;
  using Base::Base;

  void runOnOperation() override;

private:
  struct Endpoint {
    std::string moduleName;
    std::string portName;
  };

  FailureOr<Endpoint>
  resolveModuleOutput(hw::HWModuleOp module, unsigned outputIdx,
                      SmallVectorImpl<hw::InstanceOp> &instanceStack,
                      unsigned depth);

  FailureOr<Endpoint>
  resolveValue(Value value, hw::HWModuleOp currentModule,
               SmallVectorImpl<hw::InstanceOp> &instanceStack, unsigned depth);

  LogicalResult buildInstancePath(hw::HWModuleOp currentModule,
                                  hw::InstanceOp targetInstance,
                                  SmallVectorImpl<hw::InstanceOp> &path);

  FailureOr<int64_t> getPortWidth(Type type, StringRef moduleName,
                                  StringRef portName, Location loc);

  bool isPartitionModule(hw::HWModuleOp module) const {
    return module && module->hasAttr(partitionAttrName);
  }

  static constexpr unsigned kMaxTraversalDepth = 4096;
  static constexpr StringLiteral partitionAttrName = "__corvus_partition";

  mlir::ModuleOp moduleOp;
  hw::HWModuleOp topModule;
  llvm::DenseMap<StringAttr, hw::HWModuleOp> modulesByName;
};

} // namespace

FailureOr<int64_t>
HWEmitCorvusConnectivityPass::getPortWidth(Type type, StringRef moduleName,
                                           StringRef portName, Location loc) {
  auto unwrapType = type;
  if (auto inout = dyn_cast<hw::InOutType>(unwrapType))
    unwrapType = inout.getElementType();

  if (llvm::isa<seq::ClockType>(unwrapType))
    return 1;

  int64_t width = hw::getBitWidth(unwrapType);
  if (width < 0) {
    emitError(loc) << "port '" << portName << "' of module '" << moduleName
                   << "' has an unsupported type for bit-width extraction";
    return failure();
  }
  return width;
}

FailureOr<HWEmitCorvusConnectivityPass::Endpoint>
HWEmitCorvusConnectivityPass::resolveModuleOutput(
    hw::HWModuleOp module, unsigned outputIdx,
    SmallVectorImpl<hw::InstanceOp> &instanceStack, unsigned depth) {
  if (depth > kMaxTraversalDepth) {
    module.emitOpError("driver search exceeded maximum recursion depth");
    return failure();
  }

  if (isPartitionModule(module)) {
    if (outputIdx >= module.getNumOutputPorts()) {
      module.emitOpError("output index ") << outputIdx << " is out of bounds";
      return failure();
    }
    Endpoint endpoint{module.getModuleNameAttr().getValue().str(),
                      module.getOutputNameAttr(outputIdx).getValue().str()};
    return endpoint;
  }

  Block *body = module.getBodyBlock();
  if (!body || body->empty()) {
    module.emitOpError("missing body while resolving module output");
    return failure();
  }

  auto outputOp = dyn_cast<hw::OutputOp>(body->getTerminator());
  if (!outputOp) {
    module.emitOpError("expected hw.output terminator");
    return failure();
  }

  if (outputIdx >= outputOp.getNumOperands()) {
    module.emitOpError("output index ")
        << outputIdx << " exceeds hw.output operand count";
    return failure();
  }

  Value operand = outputOp.getOperand(outputIdx);
  return resolveValue(operand, module, instanceStack, depth + 1);
}

FailureOr<HWEmitCorvusConnectivityPass::Endpoint>
HWEmitCorvusConnectivityPass::resolveValue(
    Value value, hw::HWModuleOp currentModule,
    SmallVectorImpl<hw::InstanceOp> &instanceStack, unsigned depth) {
  if (depth > kMaxTraversalDepth) {
    currentModule.emitOpError("driver search exceeded maximum recursion depth");
    return failure();
  }

  if (auto blockArg = dyn_cast<BlockArgument>(value)) {
    if (blockArg.getOwner() != currentModule.getBodyBlock()) {
      currentModule.emitOpError(
          "encountered block argument that does not belong to this module "
          "while tracing connectivity");
      return failure();
    }

    unsigned argIdx = blockArg.getArgNumber();
    if (currentModule == topModule) {
      Endpoint endpoint{topModule.getModuleNameAttr().getValue().str(),
                        topModule.getInputNameAttr(argIdx).getValue().str()};
      return endpoint;
    }

    if (instanceStack.empty()) {
      currentModule.emitOpError("unable to determine driver for input port '")
          << currentModule.getInputNameAttr(argIdx)
          << "' because the module has no parent instance";
      return failure();
    }

    hw::InstanceOp parentInstance = instanceStack.back();
    instanceStack.pop_back();
    Value parentValue = parentInstance.getOperand(argIdx);
    hw::HWModuleOp parentModule =
        parentInstance->getParentOfType<hw::HWModuleOp>();

    auto result =
        resolveValue(parentValue, parentModule, instanceStack, depth + 1);

    instanceStack.push_back(parentInstance);
    return result;
  }

  auto definingOp = value.getDefiningOp();
  if (!definingOp) {
    currentModule.emitOpError(
        "value without defining operation encountered on driver path");
    return failure();
  }

  auto instance = dyn_cast<hw::InstanceOp>(definingOp);
  if (!instance) {
    definingOp->emitError("operation '")
        << definingOp->getName()
        << "' is not allowed on Corvus connectivity driver paths";
    return failure();
  }

  unsigned resultIdx = llvm::cast<OpResult>(value).getResultNumber();
  StringAttr referencedNameAttr = instance.getModuleNameAttr().getAttr();
  auto moduleIt = modulesByName.find(referencedNameAttr);
  if (moduleIt == modulesByName.end()) {
    instance.emitOpError("referenced module '")
        << referencedNameAttr.getValue() << "' was not found";
    return failure();
  }

  hw::HWModuleOp referencedModule = moduleIt->second;
  if (resultIdx >= referencedModule.getNumOutputPorts()) {
    instance.emitOpError("result #")
        << resultIdx << " exceeds number of outputs of module '"
        << referencedNameAttr.getValue() << "'";
    return failure();
  }

  instanceStack.push_back(instance);
  auto result = resolveModuleOutput(referencedModule, resultIdx, instanceStack,
                                    depth + 1);
  instanceStack.pop_back();
  return result;
}

LogicalResult HWEmitCorvusConnectivityPass::buildInstancePath(
    hw::HWModuleOp currentModule, hw::InstanceOp targetInstance,
    SmallVectorImpl<hw::InstanceOp> &path) {
  LogicalResult status = success();

  std::function<bool(hw::HWModuleOp, unsigned)> dfs =
      [&](hw::HWModuleOp module, unsigned depth) -> bool {
    if (failed(status))
      return false;

    if (depth > kMaxTraversalDepth) {
      module.emitOpError("instance traversal exceeded maximum recursion depth");
      status = failure();
      return false;
    }

    for (auto instance : module.getOps<hw::InstanceOp>()) {
      path.push_back(instance);
      if (instance == targetInstance)
        return true;

      StringAttr childName = instance.getModuleNameAttr().getAttr();
      auto it = modulesByName.find(childName);
      if (it == modulesByName.end()) {
        instance.emitOpError("referenced module '")
            << childName.getValue() << "' was not found";
        status = failure();
        path.pop_back();
        return false;
      }

      if (dfs(it->second, depth + 1))
        return true;
      path.pop_back();
    }

    return false;
  };

  if (!dfs(currentModule, 0)) {
    if (failed(status))
      return failure();
    return failure();
  }

  return success();
}

void HWEmitCorvusConnectivityPass::runOnOperation() {
  moduleOp = getOperation();
  modulesByName.clear();
  topModule = nullptr;

  if (jsonFile.empty())
    return;

  for (auto hwModule : moduleOp.getOps<hw::HWModuleOp>()) {
    StringAttr nameAttr = hwModule.getModuleNameAttr();
    modulesByName[nameAttr] = hwModule;

    if (hwModule.isPublic()) {
      if (topModule) {
        hwModule.emitOpError("expected exactly one public hw.module, already "
                             "have '")
            << topModule.getModuleNameAttr().getValue() << "'";
        signalPassFailure();
        return;
      }
      topModule = hwModule;
    }
  }

  if (!topModule) {
    moduleOp.emitError("HWEmitCorvusConnectivity requires a public hw.module");
    signalPassFailure();
    return;
  }

  llvm::DenseMap<StringAttr, hw::HWModuleOp> partitionModules;
  for (auto &[nameAttr, module] : modulesByName)
    if (isPartitionModule(module))
      partitionModules[nameAttr] = module;

  struct PartitionInstanceInfo {
    hw::InstanceOp instance;
    hw::HWModuleOp parent;
  };

  llvm::DenseMap<StringAttr, PartitionInstanceInfo> partitionInstances;

  for (auto hwModule : moduleOp.getOps<hw::HWModuleOp>()) {
    for (auto instance : hwModule.getOps<hw::InstanceOp>()) {
      StringAttr referencedName = instance.getModuleNameAttr().getAttr();
      auto partIt = partitionModules.find(referencedName);
      if (partIt == partitionModules.end())
        continue;

      auto &info = partitionInstances[referencedName];
      if (info.instance) {
        instance.emitOpError("partition module '")
            << referencedName.getValue() << "' is instantiated more than once";
        signalPassFailure();
        return;
      }

      info.instance = instance;
      info.parent = hwModule;
    }
  }

  llvm::json::Object topInputsJson;
  for (unsigned idx = 0, e = topModule.getNumInputPorts(); idx < e; ++idx) {
    auto nameAttr = topModule.getInputNameAttr(idx);
    auto width = getPortWidth(topModule.getInputTypes()[idx],
                              topModule.getModuleNameAttr().getValue(),
                              nameAttr.getValue(), topModule.getLoc());
    if (failed(width)) {
      signalPassFailure();
      return;
    }

    llvm::json::Object portObject;
    portObject["W"] = *width;
    topInputsJson[nameAttr.getValue().str()] = std::move(portObject);
  }

  llvm::json::Object topOutputsJson;
  for (unsigned idx = 0, e = topModule.getNumOutputPorts(); idx < e; ++idx) {
    auto nameAttr = topModule.getOutputNameAttr(idx);
    auto width = getPortWidth(topModule.getOutputTypes()[idx],
                              topModule.getModuleNameAttr().getValue(),
                              nameAttr.getValue(), topModule.getLoc());
    if (failed(width)) {
      signalPassFailure();
      return;
    }

    SmallVector<hw::InstanceOp, 8> instanceStack;
    auto endpoint = resolveModuleOutput(topModule, idx, instanceStack, 0);
    if (failed(endpoint)) {
      signalPassFailure();
      return;
    }

    llvm::json::Object portObject;
    portObject["W"] = *width;
    portObject["M"] = endpoint->moduleName;
    portObject["P"] = endpoint->portName;
    topOutputsJson[nameAttr.getValue().str()] = std::move(portObject);
  }

  llvm::json::Object partitionsJson;
  for (auto &entry : partitionInstances) {
    StringAttr partNameAttr = entry.first;
    PartitionInstanceInfo &info = entry.second;
    hw::HWModuleOp partitionModule = partitionModules.lookup(partNameAttr);

    if (!partitionModule)
      continue;
    if (!info.instance)
      continue;

    llvm::json::Object partitionJson;

    llvm::json::Object outputsJson;
    for (unsigned idx = 0, e = partitionModule.getNumOutputPorts(); idx < e;
         ++idx) {
      auto nameAttr = partitionModule.getOutputNameAttr(idx);
      auto width = getPortWidth(partitionModule.getOutputTypes()[idx],
                                partitionModule.getModuleNameAttr().getValue(),
                                nameAttr.getValue(), partitionModule.getLoc());
      if (failed(width)) {
        signalPassFailure();
        return;
      }

      llvm::json::Object portObject;
      portObject["W"] = *width;
      outputsJson[nameAttr.getValue().str()] = std::move(portObject);
    }

    llvm::json::Object inputsJson;
    for (unsigned idx = 0, e = partitionModule.getNumInputPorts(); idx < e;
         ++idx) {
      auto nameAttr = partitionModule.getInputNameAttr(idx);
      auto width = getPortWidth(partitionModule.getInputTypes()[idx],
                                partitionModule.getModuleNameAttr().getValue(),
                                nameAttr.getValue(), partitionModule.getLoc());
      if (failed(width)) {
        signalPassFailure();
        return;
      }

      SmallVector<hw::InstanceOp, 8> path;
      path.clear();
      if (failed(buildInstancePath(topModule, info.instance, path))) {
        info.instance.emitOpError("failed to locate instance in hierarchy "
                                  "rooted at top module '")
            << topModule.getModuleNameAttr().getValue() << "'";
        signalPassFailure();
        return;
      }

      SmallVector<hw::InstanceOp, 8> instanceStack;
      if (!path.empty())
        instanceStack.assign(path.begin(), path.end() - 1);
      Value operand = info.instance.getOperand(idx);
      auto endpoint = resolveValue(operand, info.parent, instanceStack, 0);
      if (failed(endpoint)) {
        signalPassFailure();
        return;
      }

      llvm::json::Object portObject;
      portObject["W"] = *width;
      portObject["M"] = endpoint->moduleName;
      portObject["P"] = endpoint->portName;
      inputsJson[nameAttr.getValue().str()] = std::move(portObject);
    }

    partitionJson["inputs"] = std::move(inputsJson);
    partitionJson["outputs"] = std::move(outputsJson);
    partitionsJson[partNameAttr.getValue().str()] = std::move(partitionJson);
  }

  llvm::json::Object topJson;
  topJson["moduleName"] = topModule.getModuleNameAttr().getValue().str();
  topJson["inputs"] = std::move(topInputsJson);
  topJson["outputs"] = std::move(topOutputsJson);

  llvm::json::Object rootJson;
  rootJson["top"] = std::move(topJson);
  rootJson["partitions"] = std::move(partitionsJson);

  std::unique_ptr<llvm::raw_ostream> ownedStream;
  llvm::raw_ostream *stream = nullptr;
  if (jsonFile == "-") {
    stream = &llvm::outs();
  } else {
    std::error_code ec;
    ownedStream = std::make_unique<llvm::raw_fd_ostream>(jsonFile, ec);
    if (ec) {
      moduleOp.emitError("failed to open '")
          << jsonFile << "' for writing: " << ec.message();
      signalPassFailure();
      return;
    }
    stream = ownedStream.get();
  }

  llvm::json::Value jsonValue(std::move(rootJson));
  llvm::json::OStream jsonStream(*stream, /*IndentSize=*/2);
  jsonStream.value(jsonValue);
  if (ownedStream)
    ownedStream->flush();
}
