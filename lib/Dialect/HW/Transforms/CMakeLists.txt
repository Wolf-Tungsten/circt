add_circt_dialect_library(CIRCTHWTransforms
  HWAggregateToComb.cpp
  HWPrintInstanceGraph.cpp
  HWSpecialize.cpp
  PrintHWModuleGraph.cpp
  FlattenIO.cpp
  VerifyInnerRefNamespace.cpp
  FlattenModules.cpp
  FooWires.cpp
  HWEliminateHierPath.cpp
  HWPrintStateElemDist.cpp
  HWStripExternalModule.cpp
  HWReduceMemReadLatency.cpp
  HWAssignUniqueInnerSym.cpp
  HWAssignUniqueID.cpp
  HWInsertWires.cpp
  HWSplitSeqComb.cpp
  HWFixXMRRef.cpp
  HWGlobalUniqueInnerSym.cpp
  HWCombmemToReg.cpp
  HWRepCut.cpp
  HWPartitionModules.cpp

  DEPENDS
  CIRCTHWTransformsIncGen

  LINK_LIBS PUBLIC
  CIRCTHW
  CIRCTSV
  CIRCTSeq
  CIRCTComb
  CIRCTSupport
  MLIRIR
  MLIRPass
  MLIRTransformUtils
)
