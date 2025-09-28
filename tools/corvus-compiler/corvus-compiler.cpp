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

/// This struct contains command line options that can be used to initialize
/// various bits of a Firtool pipeline. This uses a struct wrapper to avoid the
/// need for global command line options.
struct CorvusCompilerCmdOptions {
  llvm::cl::opt<std::string> outputFilename{
      "o",
      llvm::cl::desc("Output filename, or directory for split output"),
      llvm::cl::value_desc("filename"),
      llvm::cl::init("-"),
  };
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
  CorvusCompilerOptions() : outputFilename("-") {
    if (!clOptions.isConstructed())
      return;
    outputFilename = clOptions->outputFilename;
  }

private:
  std::string outputFilename;
};

/// Process the entire input provided by the user, splitting it up if the
/// corresponding option was specified.
LogicalResult
processInput(MLIRContext &context, CorvusCompilerOptions &corvusCompilerOptions,
             TimingScope &ts, std::unique_ptr<llvm::MemoryBuffer> input,
             std::optional<std::unique_ptr<llvm::ToolOutputFile>> &outputFile) {
  if (!splitInputFile)
    return processInputSplit(context, firtoolOptions, ts, std::move(input),
                             outputFile);

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
        return processInputSplit(context, firtoolOptions, ts, std::move(buffer),
                                 outputFile);
      },
      llvm::outs());
}

/// This implements the top-level logic for the firtool command, invoked once
/// command line options are parsed and LLVM/MLIR are all set up and ready to
/// go.
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

  // Register our dialects.
  context.loadDialect<chirrtl::CHIRRTLDialect, emit::EmitDialect,
                      firrtl::FIRRTLDialect, hw::HWDialect, comb::CombDialect,
                      seq::SeqDialect, om::OMDialect, sv::SVDialect,
                      verif::VerifDialect, ltl::LTLDialect, debug::DebugDialect,
                      sim::SimDialect>();

  // Process the input.
  if (failed(processInput(context, firtoolOptions, ts, std::move(input),
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
  CorvusCompilerOption corvusCompilerOptions;

  // Do the guts of the corvus-compiler process.
  auto result = executeCorvusCompiler(context, corvusCompilerOptions);

  // Use "exit" instead of return'ing to signal completion.  This avoids
  // invoking the MLIRContext destructor, which spends a bunch of time
  // deallocating memory etc which process exit will do for us.
  exit(failed(result));
}
