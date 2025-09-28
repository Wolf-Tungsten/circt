set(LLVM_LINK_COMPONENTS
  Support
)

add_circt_tool(corvus-compiler
  corvus-compiler.cpp

  DEPENDS
  SUPPORT_PLUGINS
)
llvm_update_compile_flags(corvus-compiler)
target_link_libraries(corvus-compiler PRIVATE
  CIRCTExportVerilog
  CIRCTImportFIRFile
  CIRCTFIRRTLTransforms
  CIRCTHWTransforms
  CIRCTOMTransforms
  CIRCTVerifTransforms
  CIRCTVerif
  CIRCTSeq
  CIRCTSim
  CIRCTSVTransforms
  CIRCTTransforms
  CIRCTFirtool
  CIRCTTargetDebugInfo

  MLIRBytecodeReader
  MLIRBytecodeWriter
  MLIRParser
  MLIRSupport
  MLIRIR
  MLIROptLib
  MLIRFuncDialect
  MLIRTransforms
)

export_executable_symbols_for_plugins(corvus-compiler)
