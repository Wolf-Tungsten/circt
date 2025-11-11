module {
  sv.macro.decl @SYNTHESIS
  sv.macro.decl @PRINTF_FD
  sv.macro.decl @PRINTF_FD_
  emit.fragment @PRINTF_FD_FRAGMENT {
    sv.verbatim "\0A// Users can define 'PRINTF_FD' to add a specified fd to prints."
    sv.ifdef  @PRINTF_FD_ {
    } else {
      sv.ifdef  @PRINTF_FD {
        sv.macro.def @PRINTF_FD_ "(`PRINTF_FD)"
      } else {
        sv.macro.def @PRINTF_FD_ "32'h80000002"
      }
    }
  }
  sv.macro.decl @PRINTF_COND
  sv.macro.decl @PRINTF_COND_
  emit.fragment @PRINTF_COND_FRAGMENT {
    sv.verbatim "\0A// Users can define 'PRINTF_COND' to add an extra gate to prints."
    sv.ifdef  @PRINTF_COND_ {
    } else {
      sv.ifdef  @PRINTF_COND {
        sv.macro.def @PRINTF_COND_ "(`PRINTF_COND)"
      } else {
        sv.macro.def @PRINTF_COND_ "1"
      }
    }
  }
  sv.macro.decl @ASSERT_VERBOSE_COND
  sv.macro.decl @ASSERT_VERBOSE_COND_
  emit.fragment @ASSERT_VERBOSE_COND_FRAGMENT {
    sv.verbatim "\0A// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing."
    sv.ifdef  @ASSERT_VERBOSE_COND_ {
    } else {
      sv.ifdef  @ASSERT_VERBOSE_COND {
        sv.macro.def @ASSERT_VERBOSE_COND_ "(`ASSERT_VERBOSE_COND)"
      } else {
        sv.macro.def @ASSERT_VERBOSE_COND_ "1"
      }
    }
  }
  sv.macro.decl @STOP_COND
  sv.macro.decl @STOP_COND_
  emit.fragment @STOP_COND_FRAGMENT {
    sv.verbatim "\0A// Users can define 'STOP_COND' to add an extra gate to stop conditions."
    sv.ifdef  @STOP_COND_ {
    } else {
      sv.ifdef  @STOP_COND {
        sv.macro.def @STOP_COND_ "(`STOP_COND)"
      } else {
        sv.macro.def @STOP_COND_ "1"
      }
    }
  }
  hw.hierpath private @xmrPath [@HierPathOutter::@sym, @HierPathInner::@sym]
  hw.hierpath private @xmrPath_0 [@ExampleDesign::@sym_0, @PrintPlayground::@sym]
  hw.hierpath private @xmrPath_1 [@ExampleDesign::@sym, @MemoryPlayground::@sym]
  hw.hierpath private @xmrPath_2 [@ExampleDesign::@sym_1, @HierPathOutter::@sym, @HierPathInner::@sym]
  hw.hierpath private @xmrPath_3 [@ExampleDesign::@sym_1, @HierPathOutter::@sym_0]
  hw.hierpath private @xmrPath_4 [@ExampleDesign::@sym_1, @HierPathOutter::@sym, @HierPathInner::@sym_0]
  hw.hierpath private @xmrPath_5 [@ExampleDesign::@sym_1, @HierPathOutter::@sym, @HierPathInner::@sym_1]
  hw.hierpath private @xmrPath_6 [@ExampleDesign::@sym_1, @HierPathOutter::@sym, @HierPathInner::@sym_2]
  hw.module private @MemoryPlayground(in %clock : !seq.clock, in %io_readAddr : i5, in %io_readEnable : i1, in %io_writeAddr : i5, in %io_writeEnable : i1, in %io_writeMask_0 : i1, in %io_writeMask_1 : i1, in %io_writeMask_2 : i1, in %io_writeMask_3 : i1, in %io_writeDataPlain : i32, in %io_writeDataWithMask_0 : i8, in %io_writeDataWithMask_1 : i8, in %io_writeDataWithMask_2 : i8, in %io_writeDataWithMask_3 : i8, out io_syncReadData : i8, out io_asyncReadData : i8, out io_syncReadDataMasked_0 : i8, out io_syncReadDataMasked_1 : i8, out io_syncReadDataMasked_2 : i8, out io_syncReadDataMasked_3 : i8, out io_asyncReadDataEnable : i32) {
    %c0_i24 = hw.constant 0 : i24
    %c98_i64 = hw.constant 98 : i64
    %syncMem = seq.firmem 1, 1, undefined, port_order : <32 x 8>
    seq.firmem.write_port %syncMem[%io_writeAddr] = %1, clock %clock : <32 x 8>
    %0 = seq.firmem.read_port %syncMem[%io_readAddr], clock %clock enable %io_readEnable {sv.namehint = "io_syncReadData"} : <32 x 8>
    %1 = comb.extract %io_writeDataPlain from 0 : (i32) -> i8
    %syncMemMasked = seq.firmem 1, 1, undefined, port_order : <32 x 32, mask 4>
    %2 = seq.firmem.read_port %syncMemMasked[%io_readAddr], clock %clock enable %io_readEnable : <32 x 32, mask 4>
    seq.firmem.write_port %syncMemMasked[%io_writeAddr] = %7, clock %clock mask %8 : <32 x 32, mask 4>, i4
    %3 = comb.extract %2 from 0 {sv.namehint = "syncMemMasked_MPORT_1_data_0"} : (i32) -> i8
    %4 = comb.extract %2 from 8 {sv.namehint = "syncMemMasked_MPORT_1_data_1"} : (i32) -> i8
    %5 = comb.extract %2 from 16 {sv.namehint = "syncMemMasked_MPORT_1_data_2"} : (i32) -> i8
    %6 = comb.extract %2 from 24 {sv.namehint = "syncMemMasked_MPORT_1_data_3"} : (i32) -> i8
    %7 = comb.concat %io_writeDataWithMask_3, %io_writeDataWithMask_2, %io_writeDataWithMask_1, %io_writeDataWithMask_0 : i8, i8, i8, i8
    %8 = comb.concat %io_writeMask_3, %io_writeMask_2, %io_writeMask_1, %io_writeMask_0 : i1, i1, i1, i1
    %asyncMem = seq.firmem 0, 1, undefined, port_order : <32 x 8>
    seq.firmem.write_port %asyncMem[%io_writeAddr] = %1, clock %clock : <32 x 8>
    %9 = seq.firmem.read_port %asyncMem[%io_readAddr], clock %clock {sv.namehint = "asyncIntm"} : <32 x 8>
    %10 = seq.firmem.read_port %asyncMem[%11], clock %clock {sv.namehint = "io_asyncReadData"} : <32 x 8>
    %11 = comb.extract %9 from 0 {sv.namehint = "_io_asyncReadData_T"} : (i8) -> i5
    %asyncMemWriteEnabled = seq.firmem 0, 1, undefined, port_order : <32 x 8>
    seq.firmem.write_port %asyncMemWriteEnabled[%io_writeAddr] = %1, clock %clock enable %io_writeEnable : <32 x 8>
    %12 = seq.firmem.read_port %asyncMemWriteEnabled[%io_readAddr], clock %clock : <32 x 8>
    %13 = comb.concat %c0_i24, %12 {sv.namehint = "io_asyncReadDataEnable"} : i24, i8
    %innerANumber = hw.wire %c98_i64 sym @sym_0  : i64
    %innerANumber_probe = hw.wire %innerANumber sym @sym  : i64
    hw.output %0, %10, %3, %4, %5, %6, %13 : i8, i8, i8, i8, i8, i8, i32
  }
  hw.module private @ClockPlayground(in %clock : !seq.clock, in %io_gate : i1, in %io_in : i16, out io_out : i16) {
    %c0_i9 = hw.constant 0 : i9
    %0 = seq.from_clock %clock
    %1 = comb.or bin %0, %io_gate {sv.namehint = "_gatedClock_T_2"} : i1
    %2 = seq.to_clock %1 {sv.namehint = "gatedClock"}
    %r = seq.firreg %4 clock %2 : i7
    %3 = comb.concat %c0_i9, %r {sv.namehint = "io_out"} : i9, i7
    %4 = comb.extract %io_in from 0 : (i16) -> i7
    hw.output %3 : i16
  }
  hw.module private @PrintPlayground(in %clock : !seq.clock, in %reset : i1, in %io_printValue : i64, in %io_enable : i1) attributes {emit.fragments = [@PRINTF_COND_FRAGMENT, @PRINTF_FD_FRAGMENT, @STOP_COND_FRAGMENT, @ASSERT_VERBOSE_COND_FRAGMENT]} {
    %c74_i64 = hw.constant 74 : i64
    %true = hw.constant true
    %c0_i64 = hw.constant 0 : i64
    %0 = seq.from_clock %clock
    %reg = seq.firreg %1 clock %clock : i64
    %innerANumber = hw.wire %c74_i64 sym @sym_0  : i64
    %innerANumber_probe = hw.wire %innerANumber sym @sym  : i64
    %1 = comb.mux bin %io_enable, %io_printValue, %reg : i64
    %2 = comb.xor bin %reset, %true : i1
    %3 = comb.and bin %io_enable, %2 : i1
    %4 = comb.icmp bin eq %reg, %c0_i64 : i64
    %5 = comb.and bin %2, %4 : i1
    sv.ifdef  @SYNTHESIS {
    } else {
      sv.always posedge %0 {
        %PRINTF_COND_ = sv.macro.ref.expr @PRINTF_COND_() : () -> i1
        %6 = comb.and bin %PRINTF_COND_, %3 : i1
        sv.if %6 {
          %PRINTF_FD_ = sv.macro.ref.expr @PRINTF_FD_() : () -> i32
          sv.fwrite %PRINTF_FD_, "PrintPlayground: reg = %d\0A"(%reg) : i64
        }
        sv.if %6 {
          %PRINTF_FD_ = sv.macro.ref.expr @PRINTF_FD_() : () -> i32
          sv.fwrite %PRINTF_FD_, "PrintPlayground: input = %d\0A"(%io_printValue) : i64
        }
        sv.if %5 {
          %ASSERT_VERBOSE_COND_ = sv.macro.ref.expr @ASSERT_VERBOSE_COND_() : () -> i1
          sv.if %ASSERT_VERBOSE_COND_ {
            sv.error "Assertion failed: PrintPlayground: input value should not be zero\0A"
          }
          %STOP_COND_ = sv.macro.ref.expr @STOP_COND_() : () -> i1
          sv.if %STOP_COND_ {
            sv.fatal 1
          }
        }
      }
    }
    hw.output
  }
  hw.module.extern private @BlackBoxPlayground(in %clk : !seq.clock, in %a : i8, out b : i8) attributes {verilogName = "BlackBoxPlayground"}
  hw.module private @HierPathInner(in %clock : !seq.clock) {
    %c123_i64 = hw.constant 123 : i64
    %c0_i64 = hw.constant 0 : i64
    %innerANumber = hw.wire %c123_i64 sym @sym_3  : i64
    %innerANumber_probe = hw.wire %innerANumber sym @sym  : i64
    %innerBundleWire_a = hw.wire %c0_i64 sym @sym_4  : i64
    %innerBundleWire_a_probe = hw.wire %innerBundleWire_a sym @sym_0  : i64
    %innerBundleWire_b = hw.wire %c0_i64 sym @sym_5  : i64
    %innerBundleWire_b_probe = hw.wire %innerBundleWire_b sym @sym_1  : i64
    %innerReg = seq.firreg %innerReg clock %clock sym @sym_6 : i64
    %innerReg_probe = hw.wire %innerReg sym @sym_2  : i64
    hw.output
  }
  hw.module private @HierPathOutter(in %clock : !seq.clock) {
    hw.instance "inner" sym @sym @HierPathInner(clock: %clock: !seq.clock) -> ()
    %innerANumberTapOut = hw.wire %1 sym @sym_1  : i64
    %innerANumberTapOut_probe = hw.wire %innerANumberTapOut sym @sym_0  : i64
    %0 = sv.xmr.ref @xmrPath : !hw.inout<i64>
    %1 = sv.read_inout %0 : !hw.inout<i64>
    hw.output
  }
  hw.module @ExampleDesign(in %clock : !seq.clock, in %reset : i1, in %io_inputValue1 : i16, in %io_inputValue2 : i16, in %io_loadingValues : i1, out io_outputRegValue1 : i16, out io_outputRegValue2 : i16, in %io_readAddr : i5, in %io_readEnable : i1, in %io_writeAddr : i5, in %io_writeEnable : i1, in %io_writeMask_0 : i1, in %io_writeMask_1 : i1, in %io_writeMask_2 : i1, in %io_writeMask_3 : i1, in %io_writeDataPlain : i32, in %io_writeDataWithMask_0 : i8, in %io_writeDataWithMask_1 : i8, in %io_writeDataWithMask_2 : i8, in %io_writeDataWithMask_3 : i8, out io_syncReadData : i8, out io_asyncReadData : i8, out io_syncReadDataMasked_0 : i8, out io_syncReadDataMasked_1 : i8, out io_syncReadDataMasked_2 : i8, out io_syncReadDataMasked_3 : i8, out io_asyncReadDataEnable : i32, in %io_gate : i1, in %io_in : i16, out io_out : i16, in %io_printValue : i64, in %io_enable : i1, in %io_blackBoxIn : i8, out io_blackBoxOut : i8, in %io_vecIndex : i4, in %io_vecData_0 : i8, in %io_vecData_1 : i8, in %io_vecData_2 : i8, in %io_vecData_3 : i8, in %io_vecData_4 : i8, in %io_vecData_5 : i8, in %io_vecData_6 : i8, in %io_vecData_7 : i8, in %io_vecData_8 : i8, in %io_vecData_9 : i8, in %io_vecData_10 : i8, in %io_vecData_11 : i8, in %io_vecData_12 : i8, in %io_vecData_13 : i8, in %io_vecData_14 : i8, in %io_vecData_15 : i8, out io_vecRegOut : i8) attributes {emit.fragments = [@PRINTF_COND_FRAGMENT, @PRINTF_FD_FRAGMENT]} {
    %c19_i16 = hw.constant 19 : i16
    %true = hw.constant true
    %0 = seq.from_clock %clock
    %reg1 = seq.firreg %1 clock %clock {sv.namehint = "reg1"} : i16
    %1 = comb.mux bin %io_loadingValues, %io_inputValue1, %reg1 : i16
    %reg2 = seq.firreg %2 clock %clock reset sync %reset, %c19_i16 {sv.namehint = "reg2"} : i16
    %2 = comb.mux bin %io_loadingValues, %io_inputValue2, %reg2 : i16
    %memPlayground.io_syncReadData, %memPlayground.io_asyncReadData, %memPlayground.io_syncReadDataMasked_0, %memPlayground.io_syncReadDataMasked_1, %memPlayground.io_syncReadDataMasked_2, %memPlayground.io_syncReadDataMasked_3, %memPlayground.io_asyncReadDataEnable = hw.instance "memPlayground" sym @sym @MemoryPlayground(clock: %clock: !seq.clock, io_readAddr: %io_readAddr: i5, io_readEnable: %io_readEnable: i1, io_writeAddr: %io_writeAddr: i5, io_writeEnable: %io_writeEnable: i1, io_writeMask_0: %io_writeMask_0: i1, io_writeMask_1: %io_writeMask_1: i1, io_writeMask_2: %io_writeMask_2: i1, io_writeMask_3: %io_writeMask_3: i1, io_writeDataPlain: %io_writeDataPlain: i32, io_writeDataWithMask_0: %io_writeDataWithMask_0: i8, io_writeDataWithMask_1: %io_writeDataWithMask_1: i8, io_writeDataWithMask_2: %io_writeDataWithMask_2: i8, io_writeDataWithMask_3: %io_writeDataWithMask_3: i8) -> (io_syncReadData: i8, io_asyncReadData: i8, io_syncReadDataMasked_0: i8, io_syncReadDataMasked_1: i8, io_syncReadDataMasked_2: i8, io_syncReadDataMasked_3: i8, io_asyncReadDataEnable: i32) {sv.namehint = "memPlayground.io_syncReadData"}
    %clockPlayground.io_out = hw.instance "clockPlayground" @ClockPlayground(clock: %clock: !seq.clock, io_gate: %io_gate: i1, io_in: %io_in: i16) -> (io_out: i16) {sv.namehint = "clockPlayground.io_out"}
    hw.instance "printPlayground" sym @sym_0 @PrintPlayground(clock: %clock: !seq.clock, reset: %reset: i1, io_printValue: %io_printValue: i64, io_enable: %io_enable: i1) -> ()
    %blackBoxPlayground.b = hw.instance "blackBoxPlayground" @BlackBoxPlayground(clk: %clock: !seq.clock, a: %io_blackBoxIn: i8) -> (b: i8) {sv.namehint = "io_blackBoxOut"}
    %3 = sv.xmr.ref @xmrPath_0 : !hw.inout<i64>
    %4 = sv.read_inout %3 {sv.namehint = "tapWire0"} : !hw.inout<i64>
    %5 = sv.xmr.ref @xmrPath_1 : !hw.inout<i64>
    %6 = sv.read_inout %5 {sv.namehint = "tapWire1"} : !hw.inout<i64>
    %tapLocal = hw.wire %reg1 sym @sym_2  : i16
    %7 = comb.xor bin %reset, %true : i1
    sv.ifdef  @SYNTHESIS {
    } else {
      sv.always posedge %0 {
        %PRINTF_COND_ = sv.macro.ref.expr @PRINTF_COND_() : () -> i1
        %20 = comb.and bin %PRINTF_COND_, %7 : i1
        sv.if %20 {
          %PRINTF_FD_ = sv.macro.ref.expr @PRINTF_FD_() : () -> i32
          sv.fwrite %PRINTF_FD_, "ExampleDesign: tapWire0 = %d\0A"(%4) : i64
        }
        sv.if %20 {
          %PRINTF_FD_ = sv.macro.ref.expr @PRINTF_FD_() : () -> i32
          sv.fwrite %PRINTF_FD_, "ExampleDesign: tapWire1 = %d\0A"(%6) : i64
        }
        sv.if %20 {
          %PRINTF_FD_ = sv.macro.ref.expr @PRINTF_FD_() : () -> i32
          sv.fwrite %PRINTF_FD_, "ExampleDesign: tapWire0_dup = %d\0A"(%4) : i64
        }
      }
    }
    hw.instance "hierPathOutter" sym @sym_1 @HierPathOutter(clock: %clock: !seq.clock) -> ()
    %innerTap = hw.wire %9 sym @sym_3  : i64
    %8 = sv.xmr.ref @xmrPath_2 : !hw.inout<i64>
    %9 = sv.read_inout %8 : !hw.inout<i64>
    %tapTapWire = hw.wire %11 sym @sym_4  : i64
    %10 = sv.xmr.ref @xmrPath_3 : !hw.inout<i64>
    %11 = sv.read_inout %10 : !hw.inout<i64>
    %tapBundleWire_a = hw.wire %13 sym @sym_5  : i64
    %tapBundleWire_b = hw.wire %15 sym @sym_6  : i64
    %12 = sv.xmr.ref @xmrPath_4 : !hw.inout<i64>
    %13 = sv.read_inout %12 : !hw.inout<i64>
    %14 = sv.xmr.ref @xmrPath_5 : !hw.inout<i64>
    %15 = sv.read_inout %14 : !hw.inout<i64>
    %tapReg = hw.wire %17 sym @sym_7  : i64
    %16 = sv.xmr.ref @xmrPath_6 : !hw.inout<i64>
    %17 = sv.read_inout %16 : !hw.inout<i64>
    %18 = hw.array_create %io_vecData_15, %io_vecData_14, %io_vecData_13, %io_vecData_12, %io_vecData_11, %io_vecData_10, %io_vecData_9, %io_vecData_8, %io_vecData_7, %io_vecData_6, %io_vecData_5, %io_vecData_4, %io_vecData_3, %io_vecData_2, %io_vecData_1, %io_vecData_0 : i8
    %19 = hw.array_get %18[%io_vecIndex] {sv.namehint = "io_vecRegOut"} : !hw.array<16xi8>, i4
    hw.output %reg1, %reg2, %memPlayground.io_syncReadData, %memPlayground.io_asyncReadData, %memPlayground.io_syncReadDataMasked_0, %memPlayground.io_syncReadDataMasked_1, %memPlayground.io_syncReadDataMasked_2, %memPlayground.io_syncReadDataMasked_3, %memPlayground.io_asyncReadDataEnable, %clockPlayground.io_out, %blackBoxPlayground.b, %19 : i16, i16, i8, i8, i8, i8, i8, i8, i32, i16, i8, i8
  }
  emit.file "./blackbox_verlog.v" sym @blackbox_blackbox_verlog.v {
    emit.verbatim "module blackbox_verilog(input wire [7:0] a, output wire [7:0] b);\0A    assign b = ~a;\0Aendmodule"
  }
  emit.file_list "firrtl_black_box_resource_files.f", [@blackbox_blackbox_verlog.v] sym @blackbox_filelist
  om.class @ExampleDesign_Class(%basepath: !om.basepath) {
    om.class.fields
  }
}
