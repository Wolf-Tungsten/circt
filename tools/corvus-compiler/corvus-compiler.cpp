#include "circt/Conversion/ExportVerilog.h"
#include "circt/Conversion/Passes.h"
#include "circt/Dialect/Comb/CombDialect.h"
#include "circt/Dialect/Debug/DebugDialect.h"
#include "circt/Dialect/Emit/EmitDialect.h"
#include "circt/Dialect/FIRRTL/CHIRRTLDialect.h"
#include "circt/Dialect/FIRRTL/FIRParser.h"
#include "circt/Dialect/FIRRTL/FIRRTLDialect.h"
#include "circt/Dialect/FIRRTL/FIRRTLOps.h"
#include "circt/Dialect/FIRRTL/Passes.h"
#include "circt/Dialect/HW/HWDialect.h"
#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "circt/Dialect/LTL/LTLDialect.h"
#include "circt/Dialect/OM/OMDialect.h"
#include "circt/Dialect/OM/OMOps.h"
#include "circt/Dialect/OM/OMPasses.h"
#include "circt/Dialect/SV/SVDialect.h"
#include "circt/Dialect/SV/SVPasses.h"
#include "circt/Dialect/Seq/SeqDialect.h"
#include "circt/Dialect/Seq/SeqPasses.h"
#include "circt/Dialect/Sim/SimDialect.h"
#include "circt/Dialect/Verif/VerifDialect.h"
#include "circt/Dialect/Verif/VerifPasses.h"
#include "circt/Support/LoweringOptions.h"
#include "circt/Support/LoweringOptionsParser.h"
#include "circt/Support/Passes.h"
#include "circt/Support/Version.h"
#include "circt/Target/DebugInfo.h"
#include "circt/Transforms/Passes.h"
#include "mlir/Bytecode/BytecodeReader.h"
#include "mlir/Bytecode/BytecodeWriter.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/AsmState.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/Parser/Parser.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Pass/PassInstrumentation.h"
#include "mlir/Pass/PassManager.h"
#include "mlir/Pass/PassRegistry.h"
#include "mlir/Support/FileUtilities.h"
#include "mlir/Support/Timing.h"
#include "mlir/Support/ToolUtilities.h"
#include "mlir/Tools/Plugins/PassPlugin.h"
#include "mlir/Transforms/Passes.h"
#include "llvm/Support/Chrono.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/JSON.h"
#include "llvm/Support/Path.h"
#include "llvm/Support/PrettyStackTrace.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/ToolOutputFile.h"

using namespace llvm;
using namespace mlir;
using namespace circt;

namespace {
cl::OptionCategory mainCategory("Corvus Compiler Options");
cl::list<std::string> passPlugins("load-pass-plugin",
                                  cl::desc("Load passes from plugin library"),
                                  cl::CommaSeparated, cl::cat(mainCategory));
cl::opt<std::string> inputFilename(cl::Positional, cl::desc("<input file>"),
                                   cl::init("-"), cl::cat(mainCategory));
cl::opt<bool>
    splitInputFile("split-input-file",
                   cl::desc("Split the input file into pieces and process each "
                            "chunk independently"),
                   cl::init(false), cl::Hidden, cl::cat(mainCategory));

cl::list<std::string> includeDirs(
    "include-dir",
    cl::desc("Directory to search in when resolving source references"),
    cl::value_desc("directory"), cl::cat(mainCategory));

cl::alias includeDirsShort(
    "I", cl::desc("Alias for --include-dir.  Example: -I<directory>"),
    cl::aliasopt(includeDirs), cl::Prefix, cl::NotHidden,
    cl::cat(mainCategory));
cl::opt<bool>
    verifyDiagnostics("verify-diagnostics",
                      cl::desc("Check that emitted diagnostics match "
                               "expected-* lines on the corresponding line"),
                      cl::init(false), cl::Hidden, cl::cat(mainCategory));
cl::opt<std::string>
    errorDiagnosticsFile("output-error-diagnostics",
                         cl::desc("Output error diagnostics to a JSON file"),
                         cl::init(""), cl::value_desc("filename"),
                         cl::cat(mainCategory));
cl::list<std::string> inputAnnotationFilenames(
    "annotation-file", cl::desc("Optional input annotation file"),
    cl::CommaSeparated, cl::value_desc("filename"), cl::cat(mainCategory));

enum OutputFormatKind {
  OutputIRHW,
  OutputVerilog,
  OutputSplitVerilog,
  OutputDisabled
};

cl::opt<OutputFormatKind> outputFormat(
    cl::desc("Specify output format:"),
    cl::values(clEnumValN(OutputIRHW, "ir-hw", "Emit HW dialect"),
               clEnumValN(OutputVerilog, "verilog", "Emit Verilog"),
               clEnumValN(OutputSplitVerilog, "split-verilog",
                          "Emit Verilog (one file per module; specify "
                          "directory with -o=<dir>)"),
               clEnumValN(OutputDisabled, "disable-output",
                          "Do not output anything")),
    cl::init(OutputVerilog), cl::cat(mainCategory));

cl::opt<bool>
    verbosePassExecutions("verbose-pass-executions",
                          cl::desc("Log executions of toplevel module passes"),
                          cl::init(false), cl::cat(mainCategory));

cl::opt<bool>
    verifyPasses("verify-each",
                 cl::desc("Run the verifier after each transformation pass"),
                 cl::init(true), cl::cat(mainCategory));

cl::opt<bool>
    disableCorvusPass("disable-corvus-pass",
                      cl::desc("Skip the Corvus Compiler pass pipeline"),
                      cl::init(false), cl::cat(mainCategory));

cl::opt<std::string>
    hwOutFile("output-hw-mlir",
              cl::desc("Optional file name to output the HW IR into, in "
                       "addition to the output requested by -o"),
              cl::init(""), cl::value_desc("filename"), cl::cat(mainCategory));

cl::opt<bool> emitHGLDD("emit-hgldd", cl::desc("Emit HGLDD debug info"),
                        cl::init(false), cl::cat(mainCategory));
cl::opt<std::string>
    hglddSourcePrefix("hgldd-source-prefix",
                      cl::desc("Prefix for source file paths in HGLDD output"),
                      cl::init(""), cl::value_desc("path"),
                      cl::cat(mainCategory));

cl::opt<std::string>
    hglddOutputPrefix("hgldd-output-prefix",
                      cl::desc("Prefix for output file paths in HGLDD output"),
                      cl::init(""), cl::value_desc("path"),
                      cl::cat(mainCategory));

cl::opt<std::string> hglddOutputDirectory(
    "hgldd-output-dir", cl::desc("Directory into which to emit HGLDD files"),
    cl::init(""), cl::value_desc("path"), cl::cat(mainCategory));

cl::opt<bool> hglddOnlyExistingFileLocs(
    "hgldd-only-existing-file-locs",
    cl::desc("Only consider locations in files that exist on disk"),
    cl::init(false), cl::cat(mainCategory));

cl::opt<std::string>
    mlirOutFile("output-final-mlir",
                cl::desc("Optional file name to output the final MLIR into, in "
                         "addition to the output requested by -o"),
                cl::init(""), cl::value_desc("filename"),
                cl::cat(mainCategory));
static LoweringOptionsOption loweringOptions(mainCategory);

/// This struct contains command line options that can be used to initialize
/// various bits of a Firtool pipeline. This uses a struct wrapper to avoid the
/// need for global command line options.
struct CorvusCompilerCmdOptions {
  enum class RandomKind { None, Mem, Reg, All };
  llvm::cl::opt<std::string> outputFilename{
      "o",
      llvm::cl::desc("Output filename, or directory for split output"),
      llvm::cl::value_desc("filename"),
      llvm::cl::init("-"),
  };
  llvm::cl::opt<verif::SymbolicValueLowering> symbolicValueLowering{
      "symbolic-values",
      llvm::cl::desc("Control how symbolic values are lowered"),
      llvm::cl::init(verif::SymbolicValueLowering::ExtModule),
      verif::symbolicValueLoweringCLValues()};
  llvm::cl::opt<bool> extractTestCode{
      "extract-test-code", llvm::cl::desc("Run the extract test code pass"),
      llvm::cl::init(false)};
  llvm::cl::opt<bool> etcDisableInstanceExtraction{
      "etc-disable-instance-extraction",
      llvm::cl::desc("Disable extracting instances only that feed test code"),
      llvm::cl::init(false)};
  llvm::cl::opt<bool> etcDisableRegisterExtraction{
      "etc-disable-register-extraction",
      llvm::cl::desc("Disable extracting registers that only feed test code"),
      llvm::cl::init(false)};

  llvm::cl::opt<bool> etcDisableModuleInlining{
      "etc-disable-module-inlining",
      llvm::cl::desc("Disable inlining modules that only feed test code"),
      llvm::cl::init(false)};
  llvm::cl::opt<RandomKind> disableRandom{
      llvm::cl::desc(
          "Disable random initialization code (may break semantics!)"),
      llvm::cl::values(
          clEnumValN(RandomKind::Mem, "disable-mem-randomization",
                     "Disable emission of memory randomization code"),
          clEnumValN(RandomKind::Reg, "disable-reg-randomization",
                     "Disable emission of register randomization code"),
          clEnumValN(RandomKind::All, "disable-all-randomization",
                     "Disable emission of all randomization code")),
      llvm::cl::init(RandomKind::None)};
  llvm::cl::opt<bool> emitSeparateAlwaysBlocks{
      "emit-separate-always-blocks",
      llvm::cl::desc(
          "Prevent always blocks from being merged and emit constructs into "
          "separate always blocks whenever possible"),
      llvm::cl::init(false)};
  llvm::cl::opt<bool> replSeqMem{
      "repl-seq-mem",
      llvm::cl::desc("Replace the seq mem for macro replacement and emit "
                     "relevant metadata"),
      llvm::cl::init(false)};
  llvm::cl::opt<bool> ignoreReadEnableMem{
      "ignore-read-enable-mem",
      llvm::cl::desc("Ignore the read enable signal, instead of "
                     "assigning X on read disable"),
      llvm::cl::init(false)};
  llvm::cl::opt<bool> addMuxPragmas{
      "add-mux-pragmas",
      llvm::cl::desc("Annotate mux pragmas for memory array access"),
      llvm::cl::init(false)};
  llvm::cl::opt<bool> addVivadoRAMAddressConflictSynthesisBugWorkaround{
      "add-vivado-ram-address-conflict-synthesis-bug-workaround",
      llvm::cl::desc(
          "Add a vivado specific SV attribute (* ram_style = "
          "\"distributed\" *) to unpacked array registers as a workaronud "
          "for a vivado synthesis bug that incorrectly modifies "
          "address conflict behavivor of combinational memories"),
      llvm::cl::init(false)};
  llvm::cl::opt<bool> disableOptimization{
      "disable-opt",
      llvm::cl::desc("Disable optimizations"),
  };
  llvm::cl::opt<bool> stripFirDebugInfo{
      "strip-fir-debug-info",
      llvm::cl::desc(
          "Disable source fir locator information in output Verilog"),
      llvm::cl::init(true)};
  llvm::cl::opt<bool> stripDebugInfo{
      "strip-debug-info",
      llvm::cl::desc("Disable source locator information in output Verilog"),
      llvm::cl::init(false)};
  llvm::cl::opt<bool> exportModuleHierarchy{
      "export-module-hierarchy",
      llvm::cl::desc("Export module and instance hierarchy as JSON"),
      llvm::cl::init(false)};
  llvm::cl::opt<unsigned> repcutNumPartitions{
      "repcut-num-partitions",
      llvm::cl::desc("Number of partitions for the HW RepCut pass"),
      llvm::cl::init(8)};
};

llvm::ManagedStatic<CorvusCompilerCmdOptions> clOptions;

/// Register a set of useful command-line options that can be used to configure
/// various flags within the MLIRContext. These flags are used when constructing
/// an MLIR context for initialization.
void registerCorvusCompilerCLOptions() {
  // Make sure that the options struct has been initialized.
  *clOptions;
}

class CorvusCompilerOptions {
public:
  CorvusCompilerOptions()
      : outputFilename("-"),
        symbolicValueLowering(verif::SymbolicValueLowering::ExtModule),
        disableRandom(CorvusCompilerCmdOptions::RandomKind::None),
        emitSeparateAlwaysBlocks(false), replSeqMem(false),
        ignoreReadEnableMem(false), addMuxPragmas(false),
        addVivadoRAMAddressConflictSynthesisBugWorkaround(false),
        disableOptimization(false), stripFirDebugInfo(true),
        stripDebugInfo(false), exportModuleHierarchy(false),
        repcutNumPartitions(8) {
    if (!clOptions.isConstructed())
      return;
    outputFilename = clOptions->outputFilename;
    symbolicValueLowering = clOptions->symbolicValueLowering;
    extractTestCode = clOptions->extractTestCode;
    etcDisableInstanceExtraction = clOptions->etcDisableInstanceExtraction;
    etcDisableRegisterExtraction = clOptions->etcDisableRegisterExtraction;
    etcDisableModuleInlining = clOptions->etcDisableModuleInlining;
    disableRandom = clOptions->disableRandom;
    emitSeparateAlwaysBlocks = clOptions->emitSeparateAlwaysBlocks;
    replSeqMem = clOptions->replSeqMem;
    ignoreReadEnableMem = clOptions->ignoreReadEnableMem;
    addMuxPragmas = clOptions->addMuxPragmas;
    addVivadoRAMAddressConflictSynthesisBugWorkaround =
        clOptions->addVivadoRAMAddressConflictSynthesisBugWorkaround;
    disableOptimization = clOptions->disableOptimization;
    stripFirDebugInfo = clOptions->stripFirDebugInfo;
    stripDebugInfo = clOptions->stripDebugInfo;
    exportModuleHierarchy = clOptions->exportModuleHierarchy;
    repcutNumPartitions = clOptions->repcutNumPartitions;
  }
  StringRef getOutputFilename() const { return outputFilename; }
  bool isDefaultOutputFilename() const { return outputFilename == "-"; }
  verif::SymbolicValueLowering getSymbolicValueLowering() const {
    return symbolicValueLowering;
  }
  bool shouldExtractTestCode() const { return extractTestCode; }
  bool shouldEtcDisableInstanceExtraction() const {
    return etcDisableInstanceExtraction;
  }
  bool shouldEtcDisableRegisterExtraction() const {
    return etcDisableRegisterExtraction;
  }
  bool shouldEtcDisableModuleInlining() const {
    return etcDisableModuleInlining;
  }

  bool isRandomEnabled(CorvusCompilerCmdOptions::RandomKind kind) const {
    return disableRandom != CorvusCompilerCmdOptions::RandomKind::All &&
           disableRandom != kind;
  }

  bool shouldEmitSeparateAlwaysBlocks() const {
    return emitSeparateAlwaysBlocks;
  }
  bool shouldReplaceSequentialMemories() const { return replSeqMem; }
  bool shouldIgnoreReadEnableMemories() const { return ignoreReadEnableMem; }
  bool shouldAddMuxPragmas() const { return addMuxPragmas; }
  bool shouldAddVivadoRAMAddressConflictSynthesisBugWorkaround() const {
    return addVivadoRAMAddressConflictSynthesisBugWorkaround;
  }
  bool shouldDisableOptimization() const { return disableOptimization; }
  bool shouldStripFirDebugInfo() const { return stripFirDebugInfo; }
  bool shouldStripDebugInfo() const { return stripDebugInfo; }
  bool shouldExportModuleHierarchy() const { return exportModuleHierarchy; }
  unsigned getRepCutNumPartitions() const { return repcutNumPartitions; }

private:
  std::string outputFilename;
  verif::SymbolicValueLowering symbolicValueLowering;
  bool extractTestCode;
  bool etcDisableInstanceExtraction;
  bool etcDisableRegisterExtraction;
  bool etcDisableModuleInlining;
  CorvusCompilerCmdOptions::RandomKind disableRandom;
  bool emitSeparateAlwaysBlocks;
  bool replSeqMem;
  bool ignoreReadEnableMem;
  bool addMuxPragmas;
  bool addVivadoRAMAddressConflictSynthesisBugWorkaround;
  bool disableOptimization;
  bool stripFirDebugInfo;
  bool stripDebugInfo;
  bool exportModuleHierarchy;
  unsigned repcutNumPartitions;
};

namespace detail {
LogicalResult
populatePrepareForExportVerilog(mlir::PassManager &pm,
                                const CorvusCompilerOptions &opt) {

  // Run the verif op verification pass
  pm.addNestedPass<hw::HWModuleOp>(verif::createVerifyClockedAssertLikePass());

  // Legalize unsupported operations within the modules.
  pm.nest<hw::HWModuleOp>().addPass(sv::createHWLegalizeModulesPass());

  // Tidy up the IR to improve verilog emission quality.
  if (!opt.shouldDisableOptimization())
    pm.nest<hw::HWModuleOp>().addPass(sv::createPrettifyVerilogPass());

  if (opt.shouldStripFirDebugInfo())
    pm.addPass(circt::createStripDebugInfoWithPredPass([](mlir::Location loc) {
      if (auto fileLoc = dyn_cast<FileLineColLoc>(loc))
        return fileLoc.getFilename().getValue().ends_with(".fir");
      return false;
    }));

  if (opt.shouldStripDebugInfo())
    pm.addPass(circt::createStripDebugInfoWithPredPass(
        [](mlir::Location loc) { return true; }));

  // Emit module and testbench hierarchy JSON files.
  if (opt.shouldExportModuleHierarchy())
    pm.addPass(sv::createHWExportModuleHierarchyPass());

  // Check inner symbols and inner refs.
  pm.addPass(hw::createVerifyInnerRefNamespace());

  // Check OM object fields.
  pm.addPass(om::createVerifyObjectFieldsPass());

  return success();
}
} // namespace detail

LogicalResult populateExportVerilog(mlir::PassManager &pm,
                                    const CorvusCompilerOptions &opt,
                                    llvm::raw_ostream &os) {
  if (failed(detail::populatePrepareForExportVerilog(pm, opt)))
    return failure();

  pm.addPass(createExportVerilogPass(os));
  return success();
}

LogicalResult populateExportSplitVerilog(mlir::PassManager &pm,
                                         const CorvusCompilerOptions &opt,
                                         llvm::StringRef directory) {
  if (failed(detail::populatePrepareForExportVerilog(pm, opt)))
    return failure();

  pm.addPass(createExportSplitVerilogPass(directory));
  return success();
}

LogicalResult populateFinalizeIR(mlir::PassManager &pm,
                                 const CorvusCompilerOptions &opt) {
  pm.addPass(firrtl::createFinalizeIR());
  pm.addPass(om::createFreezePathsPass());

  return success();
}

class FileLineColLocsAsNotesDiagnosticHandler : public ScopedDiagnosticHandler {
public:
  FileLineColLocsAsNotesDiagnosticHandler(MLIRContext *ctxt)
      : ScopedDiagnosticHandler(ctxt) {
    setHandler([](Diagnostic &d) {
      SmallPtrSet<Location, 8> locs;
      // Recursively scan for FileLineColLoc locations.
      d.getLocation()->walk([&](Location loc) {
        if (isa<FileLineColLoc>(loc))
          locs.insert(loc);
        return WalkResult::advance();
      });

      // Drop top-level location the diagnostic is reported on.
      locs.erase(d.getLocation());
      // As well as the location the SourceMgrDiagnosticHandler will use.
      if (auto reportLoc = d.getLocation()->findInstanceOf<FileLineColLoc>())
        locs.erase(reportLoc);

      // Attach additional locations as notes on the diagnostic.
      for (auto l : locs)
        d.attachNote(l) << "additional location here";
      return failure();
    });
  }
};

class ErrorDiagnosticDumper : public ScopedDiagnosticHandler {
  // Mutex to protect concurrent access to the errors vector, though typically
  // not needed as ErrorDiagnosticDumper usually runs outside of parallel
  // contexts.
  llvm::sys::SmartMutex<true> mutex;
  std::unique_ptr<llvm::ToolOutputFile> outputFile;
  std::unique_ptr<json::OStream> jsonStream;
  bool errorEmitted = false;

  void convertLocToJson(Location loc, SmallVector<json::Value> &locs) {
    if (auto fileLineColLoc = dyn_cast<FileLineColLoc>(loc)) {
      json::Object obj;
      obj["file"] = fileLineColLoc.getFilename().getValue();
      obj["line"] = fileLineColLoc.getLine();
      obj["column"] = fileLineColLoc.getColumn();
      locs.push_back(std::move(obj));
      return;
    }
    if (auto fusedLoc = dyn_cast<FusedLoc>(loc)) {
      for (auto l : fusedLoc.getLocations())
        convertLocToJson(l, locs);
      return;
    }
    // TODO: Serialize others.
  }

  json::Value convertToJSON(Diagnostic &d) {
    json::Object obj;
    obj["message"] = d.str();
    SmallVector<json::Value> locs;
    convertLocToJson(d.getLocation(), locs);
    obj["location"] = json::Array(locs);
    assert(d.getSeverity() == mlir::DiagnosticSeverity::Error &&
           "only errors are expected");
    return std::move(obj);
  }

public:
  ErrorDiagnosticDumper(MLIRContext *ctxt) : ScopedDiagnosticHandler(ctxt) {
    if (errorDiagnosticsFile.empty())
      return;
    std::string error;
    outputFile = openOutputFile(errorDiagnosticsFile.getValue(), &error);
    if (!outputFile) {
      errs() << error;
      return;
    }

    jsonStream = std::make_unique<json::OStream>(outputFile->os());
    jsonStream->arrayBegin();

    // Set a handler that captures errors.
    setHandler([&](Diagnostic &d) {
      if (d.getSeverity() == mlir::DiagnosticSeverity::Error) {
        llvm::sys::SmartScopedLock<true> lock(mutex);
        auto json = convertToJSON(d);
        jsonStream->value(json);
        errorEmitted = true;
      }
      return failure();
    });
  }

  ~ErrorDiagnosticDumper() {
    if (errorDiagnosticsFile.empty() || !outputFile)
      return;

    assert(jsonStream && "jsonStream should have been initialized");

    jsonStream->arrayEnd();
    jsonStream->flush();
    if (errorEmitted)
      outputFile->keep();
  }
};
/// Print the operation to the specified stream, emitting bytecode when
/// requested and politely avoiding dumping to terminal unless forced.
static LogicalResult printOp(Operation *op, raw_ostream &os) {
  op->print(os);
  return success();
}
static debug::EmitHGLDDOptions getHGLDDOptions() {
  debug::EmitHGLDDOptions opts;
  opts.sourceFilePrefix = hglddSourcePrefix;
  opts.outputFilePrefix = hglddOutputPrefix;
  opts.outputDirectory = hglddOutputDirectory;
  opts.onlyExistingFileLocs = hglddOnlyExistingFileLocs;
  return opts;
}

/// Wrapper pass to call the `emitHGLDD` translation.
struct EmitHGLDDPass
    : public PassWrapper<EmitHGLDDPass, OperationPass<mlir::ModuleOp>> {
  llvm::raw_ostream &os;
  EmitHGLDDPass(llvm::raw_ostream &os) : os(os) {}
  void runOnOperation() override {
    markAllAnalysesPreserved();
    if (failed(debug::emitHGLDD(getOperation(), os, getHGLDDOptions())))
      return signalPassFailure();
  }
};

/// Wrapper pass to call the `emitSplitHGLDD` translation.
struct EmitSplitHGLDDPass
    : public PassWrapper<EmitSplitHGLDDPass, OperationPass<mlir::ModuleOp>> {
  void runOnOperation() override {
    markAllAnalysesPreserved();
    if (failed(debug::emitSplitHGLDD(getOperation(), getHGLDDOptions())))
      return signalPassFailure();
  }
};
/// Wrapper pass to dump IR.
struct DumpIRPass
    : public PassWrapper<DumpIRPass, OperationPass<mlir::ModuleOp>> {
  DumpIRPass(const std::string &outputFile)
      : PassWrapper<DumpIRPass, OperationPass<mlir::ModuleOp>>() {
    this->outputFile.setValue(outputFile);
  }

  DumpIRPass(const DumpIRPass &other) : PassWrapper(other) {
    outputFile.setValue(other.outputFile.getValue());
  }

  void runOnOperation() override {
    assert(!outputFile.empty());

    std::string error;
    auto mlirFile = openOutputFile(outputFile.getValue(), &error);
    if (!mlirFile) {
      errs() << error;
      return signalPassFailure();
    }

    if (failed(printOp(getOperation(), mlirFile->os())))
      return signalPassFailure();
    mlirFile->keep();
    markAllAnalysesPreserved();
  }

  Pass::Option<std::string> outputFile{*this, "output-file",
                                       cl::desc("filename"), cl::init("-")};
};

LogicalResult populateHWToSV(mlir::PassManager &pm,
                             const CorvusCompilerOptions &opt) {

  // Lowering passes from HW to SV.
  // pm.addPass(seq::createExternalizeClockGatePass(opt.getClockGateOptions()));

  pm.addPass(circt::createLowerSimToSVPass());
  pm.addPass(circt::createLowerSeqToSVPass(
      {/*disableRegRandomization=*/!opt.isRandomEnabled(
           CorvusCompilerCmdOptions::RandomKind::Reg),
       /*disableMemRandomization=*/
       !opt.isRandomEnabled(CorvusCompilerCmdOptions::RandomKind::Mem),
       /*emitSeparateAlwaysBlocks=*/
       opt.shouldEmitSeparateAlwaysBlocks()}));

  pm.addNestedPass<hw::HWModuleOp>(createLowerVerifToSVPass());
  pm.addPass(seq::createHWMemSimImplPass(
      {/*disableMemRandomization=*/!opt.isRandomEnabled(
           CorvusCompilerCmdOptions::RandomKind::Mem),
       /*disableRegRandomization=*/
       !opt.isRandomEnabled(CorvusCompilerCmdOptions::RandomKind::Reg),
       /*replSeqMem=*/opt.shouldReplaceSequentialMemories(),
       /*readEnableMode=*/opt.shouldIgnoreReadEnableMemories()
           ? seq::ReadEnableMode::Ignore
           : seq::ReadEnableMode::Undefined,
       /*addMuxPragmas=*/opt.shouldAddMuxPragmas(),
       /*addVivadoRAMAddressConflictSynthesisBugWorkaround=*/
       opt.shouldAddVivadoRAMAddressConflictSynthesisBugWorkaround()}));

  // If enabled, run the optimizer.
  if (!opt.shouldDisableOptimization()) {
    auto &modulePM = pm.nest<hw::HWModuleOp>();
    modulePM.addPass(mlir::createCSEPass());
    modulePM.addPass(createSimpleCanonicalizerPass());
    modulePM.addPass(mlir::createCSEPass());
    modulePM.addPass(sv::createHWCleanupPass(
        /*mergeAlwaysBlocks=*/!opt.shouldEmitSeparateAlwaysBlocks()));
  }

  // Check inner symbols and inner refs.
  pm.addPass(hw::createVerifyInnerRefNamespace());

  // Check OM object fields.
  pm.addPass(om::createVerifyObjectFieldsPass());

  return success();
}

/// Process a single buffer of the input.
LogicalResult processBuffer(
    MLIRContext &context, CorvusCompilerOptions &corvusCompilerOptions,
    TimingScope &ts, llvm::SourceMgr &sourceMgr,
    std::optional<std::unique_ptr<llvm::ToolOutputFile>> &outputFile) {

  // Add the annotation file if one was explicitly specified.
  unsigned numAnnotationFiles = 0;
  for (const auto &inputAnnotationFilename : inputAnnotationFilenames) {
    std::string annotationFilenameDetermined;
    if (!sourceMgr.AddIncludeFile(inputAnnotationFilename, llvm::SMLoc(),
                                  annotationFilenameDetermined)) {
      llvm::errs() << "cannot open input annotation file '"
                   << inputAnnotationFilename
                   << "': No such file or directory\n";
      return failure();
    }
    ++numAnnotationFiles;
  }

  // Parse the input.
  mlir::OwningOpRef<mlir::ModuleOp> module;

  llvm::sys::TimePoint<> parseStartTime;
  if (verbosePassExecutions) {
    llvm::errs() << "[corvus-compiler] Running "
                 << "mlir"
                 << " parser\n";
    parseStartTime = llvm::sys::TimePoint<>::clock::now();
  }

  auto parserTimer = ts.nest("MLIR Parser");
  module = parseSourceFile<ModuleOp>(sourceMgr, &context);
  if (!module)
    return failure();

  if (verbosePassExecutions) {
    auto elapsed = std::chrono::duration<double>(
                       llvm::sys::TimePoint<>::clock::now() - parseStartTime) /
                   std::chrono::seconds(1);
    llvm::errs() << "[corvus-compiler] -- Done in "
                 << llvm::format("%.3f", elapsed) << " sec\n";
  }

  // Apply any pass manager command line options.
  PassManager pm(&context);
  pm.enableVerifier(verifyPasses);
  pm.enableTiming(ts);
  if (verbosePassExecutions)
    pm.addInstrumentation(
        std::make_unique<VerbosePassInstrumentation<mlir::ModuleOp>>(
            "corvus-compiler"));
  if (failed(applyPassManagerCLOptions(pm)))
    return failure();

  // Lower if we are going to verilog or if lowering was specifically
  // requested.

  pm.nestAny().addPass(verif::createStripContractsPass());
  pm.addPass(verif::createLowerFormalToHWPass());
  pm.addPass(verif::createLowerSymbolicValuesPass(
      {corvusCompilerOptions.getSymbolicValueLowering()}));

  // Corvus Compiler Pass Start
  if (!disableCorvusPass) {
    pm.addPass(hw::createHWEliminateHierPath());
    pm.addPass(hw::createFlattenModules());
    pm.addPass(hw::createHWGlobalUniqueInnerSym());
    pm.addPass(sv::createSVExtractTestCodePass(false, true, false));
    pm.addPass(hw::createHWStripExternalModule());
    pm.addPass(hw::createHWCombmemToReg());
    pm.addPass(
        hw::createHWReduceMemReadLatency(hw::HWReduceMemReadLatencyOptions{1}));
    auto &hwModulePM = pm.nest<hw::HWModuleOp>();
    hw::HWInsertWiresOptions insertWiresOptions;
    insertWiresOptions.moduleName = "corvus_top";
    hwModulePM.addPass(hw::createHWInsertWires(insertWiresOptions));
    hw::HWRepCutOptions repcutOptions;
    repcutOptions.moduleName = "corvus_top";
    repcutOptions.numPartitions =
        corvusCompilerOptions.getRepCutNumPartitions();
    hwModulePM.addPass(hw::createHWRepCut(repcutOptions));
    hw::HWInsertPartitionWiresOptions partitionWireOptions;
    partitionWireOptions.moduleName = "corvus_top";
    hwModulePM.addPass(hw::createHWInsertPartitionWires(partitionWireOptions));
    pm.addPass(hw::createHWSplitSeqComb());
    hw::HWPartitionModulesOptions seqPartitionOptions;
    seqPartitionOptions.moduleName = "corvus_seq";
    pm.addPass(hw::createHWPartitionModules(seqPartitionOptions));
    hw::HWPartitionModulesOptions combPartitionOptions;
    combPartitionOptions.moduleName = "corvus_comb";
    pm.addPass(hw::createHWPartitionModules(combPartitionOptions));
    hw::HWFlattenCorvusTopOptions flattenOptions;
    flattenOptions.topModuleName = "corvus_top";
    flattenOptions.seqWrapperName = "corvus_seq";
    flattenOptions.combWrapperName = "corvus_comb";
    pm.addPass(hw::createHWFlattenCorvusTop(flattenOptions));
    //hw::HWAggregateCorvusPortsOptions aggregateOptions;
    //aggregateOptions.topModuleName = "corvus_top";
    //aggregateOptions.seqPartitionPrefix = "corvus_seq_P";
    //aggregateOptions.combPartitionPrefix = "corvus_comb_P";
    //pm.addPass(hw::createHWAggregateCorvusPorts(aggregateOptions));
  }
  // Corvus Compiler Pass End

  // If requested, emit the HW IR to hwOutFile.
  if (!hwOutFile.empty())
    pm.addPass(std::make_unique<DumpIRPass>(hwOutFile.getValue()));

  // Lower HW to SV start from here
  if (outputFormat != OutputIRHW)
    if (failed(populateHWToSV(pm, corvusCompilerOptions)))
      return failure();

  // If the user requested HGLDD debug info emission, enable Verilog location
  // tracking.
  // if (emitHGLDD)
  //   loweringOptions.emitVerilogLocations = true;

  // Load the emitter options from the command line. Command line options if
  // specified will override any module options.
  if (loweringOptions.toString() != LoweringOptions().toString())
    loweringOptions.setAsAttribute(module.get());

  // Add passes specific to Verilog emission if we're going there.
  if (outputFormat == OutputVerilog || outputFormat == OutputSplitVerilog) {
    // Emit a single file or multiple files depending on the output format.
    switch (outputFormat) {
    default:
      llvm_unreachable("can't reach this");
    case OutputVerilog:
      if (failed(populateExportVerilog(pm, corvusCompilerOptions,
                                       (*outputFile)->os())))
        return failure();
      if (emitHGLDD)
        pm.addPass(std::make_unique<EmitHGLDDPass>((*outputFile)->os()));
      break;
    case OutputSplitVerilog:
      if (failed(populateExportSplitVerilog(
              pm, corvusCompilerOptions,
              corvusCompilerOptions.getOutputFilename())))
        return failure();
      if (emitHGLDD)
        pm.addPass(std::make_unique<EmitSplitHGLDDPass>());
      break;
    }

    // If requested, print the final MLIR into mlirOutFile.
    if (!mlirOutFile.empty()) {
      // Run final IR mutations to clean it up after ExportVerilog and before
      // emitting the final MLIR.
      if (failed(populateFinalizeIR(pm, corvusCompilerOptions)))
        return failure();

      pm.addPass(std::make_unique<DumpIRPass>(mlirOutFile.getValue()));
    }
  }

  if (failed(pm.run(module.get())))
    return failure();

  if (outputFormat == OutputIRHW) {
    auto outputTimer = ts.nest("Print .mlir output");
    if (failed(printOp(*module, (*outputFile)->os())))
      return failure();
  }

  // We intentionally "leak" the Module into the MLIRContext instead of
  // deallocating it.  There is no need to deallocate it right before process
  // exit.
  (void)module.release();
  return success();
}
/// Process a single split of the input. This allocates a source manager and
/// creates a regular or verifying diagnostic handler, depending on whether the
/// user set the verifyDiagnostics option.
static LogicalResult processInputSplit(
    MLIRContext &context, CorvusCompilerOptions &corvusCompilerOptions,
    TimingScope &ts, std::unique_ptr<llvm::MemoryBuffer> buffer,
    std::optional<std::unique_ptr<llvm::ToolOutputFile>> &outputFile) {
  // In LLVM commit b6a98b9, we started creating splits that don't have null
  // terminated buffers, which are assumed by our tool and the SourceMgr. Make
  // a copy to ensure null-termination.
  if (!buffer->getBuffer().ends_with('\0')) {
    buffer = llvm::MemoryBuffer::getMemBufferCopy(
        buffer->getBuffer(), buffer->getBufferIdentifier());
  }

  llvm::SourceMgr sourceMgr;
  sourceMgr.AddNewSourceBuffer(std::move(buffer), llvm::SMLoc());
  sourceMgr.setIncludeDirs(includeDirs);
  if (!verifyDiagnostics) {
    SourceMgrDiagnosticHandler sourceMgrHandler(sourceMgr,
                                                &context /*, shouldShow */);
    FileLineColLocsAsNotesDiagnosticHandler addLocs(&context);
    ErrorDiagnosticDumper errorDumper(&context);
    return processBuffer(context, corvusCompilerOptions, ts, sourceMgr,
                         outputFile);
  }

  SourceMgrDiagnosticVerifierHandler sourceMgrHandler(sourceMgr, &context);
  ErrorDiagnosticDumper errorDumper(&context);
  context.printOpOnDiagnostic(false);
  (void)processBuffer(context, corvusCompilerOptions, ts, sourceMgr,
                      outputFile);
  return sourceMgrHandler.verify();
}

/// Process the entire input provided by the user, splitting it up if the
/// corresponding option was specified.
LogicalResult
processInput(MLIRContext &context, CorvusCompilerOptions &corvusCompilerOptions,
             TimingScope &ts, std::unique_ptr<llvm::MemoryBuffer> input,
             std::optional<std::unique_ptr<llvm::ToolOutputFile>> &outputFile) {
  if (!splitInputFile)
    return processInputSplit(context, corvusCompilerOptions, ts,
                             std::move(input), outputFile);

  // Emit an error if the user provides a separate annotation file alongside
  // split input. This is technically not a problem, but the user likely
  // expects the annotation file to be split as well, which is not the case.
  // To prevent any frustration, we detect this constellation and emit an
  // error here. The user can provide annotations for each split using the
  // inline JSON syntax in FIRRTL.
  if (!inputAnnotationFilenames.empty()) {
    llvm::errs() << "annotation file cannot be used with split input: "
                    "use inline JSON syntax on FIRRTL `circuit` to specify "
                    "per-split annotations\n";
    return failure();
  }

  return splitAndProcessBuffer(
      std::move(input),
      [&](std::unique_ptr<MemoryBuffer> buffer, raw_ostream &) {
        return processInputSplit(context, corvusCompilerOptions, ts,
                                 std::move(buffer), outputFile);
      },
      llvm::outs());
}

/// This implements the top-level logic for the corvus-compiler command, invoked
/// once command line options are parsed and LLVM/MLIR are all set up and ready
/// to go.
static LogicalResult
executeCorvusCompiler(MLIRContext &context,
                      CorvusCompilerOptions &corvusCompilerOptions) {
  // Create the timing manager we use to sample execution times.
  DefaultTimingManager tm;
  applyDefaultTimingManagerCLOptions(tm);
  auto ts = tm.getRootScope();

  // Set up the input file.
  std::string errorMessage;
  auto input = openInputFile(inputFilename, &errorMessage);
  if (!input) {
    llvm::errs() << errorMessage << "\n";
    return failure();
  }

  // check input format, must be mlir
  if (!StringRef(inputFilename).ends_with(".mlir")) {
    llvm::errs() << "Only mlir format is supported!\n";
    return failure();
  }

  // Create the output directory or output file depending on our mode.
  std::optional<std::unique_ptr<llvm::ToolOutputFile>> outputFile;
  if (outputFormat != OutputSplitVerilog) {
    // Create an output file.
    outputFile.emplace(openOutputFile(corvusCompilerOptions.getOutputFilename(),
                                      &errorMessage));
    if (!(*outputFile)) {
      llvm::errs() << errorMessage << "\n";
      return failure();
    }
  } else {
    // Create an output directory.
    if (corvusCompilerOptions.isDefaultOutputFilename()) {
      llvm::errs() << "missing output directory: specify with -o=<dir>\n";
      return failure();
    }
    auto error = llvm::sys::fs::create_directories(
        corvusCompilerOptions.getOutputFilename());
    if (error) {
      llvm::errs() << "cannot create output directory '"
                   << corvusCompilerOptions.getOutputFilename()
                   << "': " << error.message() << "\n";
      return failure();
    }
  }
  // Register our dialects.
  context.loadDialect<chirrtl::CHIRRTLDialect, emit::EmitDialect,
                      firrtl::FIRRTLDialect, hw::HWDialect, comb::CombDialect,
                      seq::SeqDialect, om::OMDialect, sv::SVDialect,
                      verif::VerifDialect, ltl::LTLDialect, debug::DebugDialect,
                      sim::SimDialect>();

  // Process the input.
  if (failed(processInput(context, corvusCompilerOptions, ts, std::move(input),
                          outputFile)))
    return failure();

  // If the result succeeded and we're emitting a file, close it.
  if (outputFile.has_value())
    (*outputFile)->keep();

  return success();
}

} // namespace

/// Main driver for corvus-compiler command.  This sets up LLVM and MLIR, and
/// parses command line options before passing off to 'TODO'.  This is
/// set up so we can `exit(0)` at the end of the program to avoid teardown of
/// the MLIRContext and modules inside of it (reducing compile time).
int main(int argc, char **argv) {
  InitLLVM y(argc, argv);

  // Set the bug report message to indicate users should file issues on
  // llvm/circt and not llvm/llvm-project.
  setBugReportMsg(circtBugReportMsg);

  // Hide default LLVM options, other than for this tool.
  // MLIR options are added below.
  cl::HideUnrelatedOptions(mainCategory);

  /// Set the callback to load a pass plugin.
  passPlugins.setCallback([&](const std::string &pluginPath) {
    llvm::errs() << "[corvus-compiler] load plugin " << pluginPath << '\n';
    auto plugin = PassPlugin::load(pluginPath);
    if (!plugin) {
      errs() << plugin.takeError() << '\n';
      errs() << "Failed to load passes from '" << pluginPath
             << "'. Request ignored.\n";
      return;
    }
    plugin.get().registerPassRegistryCallbacks();
  });

  // Register passes before parsing command-line options, so that they are
  // available for use with options like `--mlir-print-ir-before`.
  {
    // MLIR transforms:
    // Don't use registerTransformsPasses, pulls in too much.
    registerCSEPass();
    registerCanonicalizerPass();
    registerStripDebugInfoPass();
    registerSymbolDCEPass();

    // Dialect passes:
    firrtl::registerPasses();
    om::registerPasses();
    sv::registerPasses();
    hw::registerFlattenModulesPass();
    verif::registerVerifyClockedAssertLikePass();

    // Export passes:
    registerExportSplitVerilogPass();
    registerExportVerilogPass();

    // Conversion passes:
    registerPrepareForEmissionPass();
    registerHWLowerInstanceChoicesPass();
    registerLowerFIRRTLToHWPass();
    registerLegalizeAnonEnumsPass();
    registerLowerSeqToSVPass();
    registerLowerSimToSVPass();
    registerLowerVerifToSVPass();
    registerLowerLTLToCorePass();
    registerConvertHWToBTOR2Pass();
  }

  // Register any pass manager command line options.
  registerMLIRContextCLOptions();
  registerPassManagerCLOptions();
  registerDefaultTimingManagerCLOptions();
  registerAsmPrinterCLOptions();
  registerCorvusCompilerCLOptions();
  cl::AddExtraVersionPrinter(
      [](raw_ostream &os) { os << getCirctVersion() << '\n'; });
  // Parse pass names in main to ensure static initialization completed.
  cl::ParseCommandLineOptions(argc, argv, "MLIR-based FIRRTL compiler\n");

  MLIRContext context;
  // Construct the CorvusCompilerOption from the command line options.
  CorvusCompilerOptions corvusCompilerOptions;

  // Do the guts of the corvus-compiler process.
  auto result = executeCorvusCompiler(context, corvusCompilerOptions);

  // Use "exit" instead of return'ing to signal completion.  This avoids
  // invoking the MLIRContext destructor, which spends a bunch of time
  // deallocating memory etc which process exit will do for us.
  exit(failed(result));
}
