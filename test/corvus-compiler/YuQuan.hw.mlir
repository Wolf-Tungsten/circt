module {
  sv.macro.decl @SYNTHESIS
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
  hw.hierpath private @nla_6 [@DCache::@sym_2, @S011HD1P_X32Y2D128_BW]
  hw.hierpath private @nla_5 [@DCache::@sym_1, @S011HD1P_X32Y2D128_BW]
  hw.hierpath private @nla_4 [@DCache::@sym_0, @S011HD1P_X32Y2D128_BW]
  hw.hierpath private @nla_3 [@DCache::@sym, @S011HD1P_X32Y2D128_BW]
  hw.hierpath private @nla_2 [@ICache::@sym_2, @S011HD1P_X32Y2D128_BW]
  hw.hierpath private @nla_1 [@ICache::@sym_1, @S011HD1P_X32Y2D128_BW]
  hw.hierpath private @nla_0 [@ICache::@sym_0, @S011HD1P_X32Y2D128_BW]
  hw.hierpath private @nla [@ICache::@sym, @S011HD1P_X32Y2D128_BW]
  hw.module private @GPRs(in %clock : !seq.clock, in %reset : i1, in %io_gprsW_wen : i1, in %io_gprsW_waddr : i5, in %io_gprsW_wdata : i64, in %io_gprsW_retire : i1, in %io_gprsW_except : i1, out io_rregs_1 : i64, out io_rregs_2 : i64, out io_rregs_3 : i64, out io_rregs_4 : i64, out io_rregs_5 : i64, out io_rregs_6 : i64, out io_rregs_7 : i64, out io_rregs_8 : i64, out io_rregs_9 : i64, out io_rregs_10 : i64, out io_rregs_11 : i64, out io_rregs_12 : i64, out io_rregs_13 : i64, out io_rregs_14 : i64, out io_rregs_15 : i64, out io_rregs_16 : i64, out io_rregs_17 : i64, out io_rregs_18 : i64, out io_rregs_19 : i64, out io_rregs_20 : i64, out io_rregs_21 : i64, out io_rregs_22 : i64, out io_rregs_23 : i64, out io_rregs_24 : i64, out io_rregs_25 : i64, out io_rregs_26 : i64, out io_rregs_27 : i64, out io_rregs_28 : i64, out io_rregs_29 : i64, out io_rregs_30 : i64, out io_rregs_31 : i64, out io_debug_gprs_1 : i64, out io_debug_gprs_2 : i64, out io_debug_gprs_3 : i64, out io_debug_gprs_4 : i64, out io_debug_gprs_5 : i64, out io_debug_gprs_6 : i64, out io_debug_gprs_7 : i64, out io_debug_gprs_8 : i64, out io_debug_gprs_9 : i64, out io_debug_gprs_10 : i64, out io_debug_gprs_11 : i64, out io_debug_gprs_12 : i64, out io_debug_gprs_13 : i64, out io_debug_gprs_14 : i64, out io_debug_gprs_15 : i64, out io_debug_gprs_16 : i64, out io_debug_gprs_17 : i64, out io_debug_gprs_18 : i64, out io_debug_gprs_19 : i64, out io_debug_gprs_20 : i64, out io_debug_gprs_21 : i64, out io_debug_gprs_22 : i64, out io_debug_gprs_23 : i64, out io_debug_gprs_24 : i64, out io_debug_gprs_25 : i64, out io_debug_gprs_26 : i64, out io_debug_gprs_27 : i64, out io_debug_gprs_28 : i64, out io_debug_gprs_29 : i64, out io_debug_gprs_30 : i64, out io_debug_gprs_31 : i64) {
    %true = hw.constant true
    %c-1_i5 = hw.constant -1 : i5
    %c0_i5 = hw.constant 0 : i5
    %c1_i5 = hw.constant 1 : i5
    %c2_i5 = hw.constant 2 : i5
    %c3_i5 = hw.constant 3 : i5
    %c4_i5 = hw.constant 4 : i5
    %c5_i5 = hw.constant 5 : i5
    %c6_i5 = hw.constant 6 : i5
    %c7_i5 = hw.constant 7 : i5
    %c8_i5 = hw.constant 8 : i5
    %c9_i5 = hw.constant 9 : i5
    %c10_i5 = hw.constant 10 : i5
    %c11_i5 = hw.constant 11 : i5
    %c12_i5 = hw.constant 12 : i5
    %c13_i5 = hw.constant 13 : i5
    %c14_i5 = hw.constant 14 : i5
    %c15_i5 = hw.constant 15 : i5
    %c-16_i5 = hw.constant -16 : i5
    %c-15_i5 = hw.constant -15 : i5
    %c-14_i5 = hw.constant -14 : i5
    %c-13_i5 = hw.constant -13 : i5
    %c-12_i5 = hw.constant -12 : i5
    %c-11_i5 = hw.constant -11 : i5
    %c-10_i5 = hw.constant -10 : i5
    %c-9_i5 = hw.constant -9 : i5
    %c-8_i5 = hw.constant -8 : i5
    %c-7_i5 = hw.constant -7 : i5
    %c-6_i5 = hw.constant -6 : i5
    %c-5_i5 = hw.constant -5 : i5
    %c-4_i5 = hw.constant -4 : i5
    %c-3_i5 = hw.constant -3 : i5
    %c-2_i5 = hw.constant -2 : i5
    %regs_0 = seq.firreg %100 clock %clock {firrtl.random_init_start = 0 : ui64} : i64
    %regs_1 = seq.firreg %104 clock %clock {firrtl.random_init_start = 64 : ui64, sv.namehint = "regs_1"} : i64
    %regs_2 = seq.firreg %108 clock %clock {firrtl.random_init_start = 128 : ui64, sv.namehint = "regs_2"} : i64
    %regs_3 = seq.firreg %112 clock %clock {firrtl.random_init_start = 192 : ui64, sv.namehint = "regs_3"} : i64
    %regs_4 = seq.firreg %116 clock %clock {firrtl.random_init_start = 256 : ui64, sv.namehint = "regs_4"} : i64
    %regs_5 = seq.firreg %120 clock %clock {firrtl.random_init_start = 320 : ui64, sv.namehint = "regs_5"} : i64
    %regs_6 = seq.firreg %124 clock %clock {firrtl.random_init_start = 384 : ui64, sv.namehint = "regs_6"} : i64
    %regs_7 = seq.firreg %128 clock %clock {firrtl.random_init_start = 448 : ui64, sv.namehint = "regs_7"} : i64
    %regs_8 = seq.firreg %132 clock %clock {firrtl.random_init_start = 512 : ui64, sv.namehint = "regs_8"} : i64
    %regs_9 = seq.firreg %136 clock %clock {firrtl.random_init_start = 576 : ui64, sv.namehint = "regs_9"} : i64
    %regs_10 = seq.firreg %140 clock %clock {firrtl.random_init_start = 640 : ui64, sv.namehint = "regs_10"} : i64
    %regs_11 = seq.firreg %144 clock %clock {firrtl.random_init_start = 704 : ui64, sv.namehint = "regs_11"} : i64
    %regs_12 = seq.firreg %148 clock %clock {firrtl.random_init_start = 768 : ui64, sv.namehint = "regs_12"} : i64
    %regs_13 = seq.firreg %152 clock %clock {firrtl.random_init_start = 832 : ui64, sv.namehint = "regs_13"} : i64
    %regs_14 = seq.firreg %156 clock %clock {firrtl.random_init_start = 896 : ui64, sv.namehint = "regs_14"} : i64
    %regs_15 = seq.firreg %160 clock %clock {firrtl.random_init_start = 960 : ui64, sv.namehint = "regs_15"} : i64
    %regs_16 = seq.firreg %164 clock %clock {firrtl.random_init_start = 1024 : ui64, sv.namehint = "regs_16"} : i64
    %regs_17 = seq.firreg %168 clock %clock {firrtl.random_init_start = 1088 : ui64, sv.namehint = "regs_17"} : i64
    %regs_18 = seq.firreg %172 clock %clock {firrtl.random_init_start = 1152 : ui64, sv.namehint = "regs_18"} : i64
    %regs_19 = seq.firreg %176 clock %clock {firrtl.random_init_start = 1216 : ui64, sv.namehint = "regs_19"} : i64
    %regs_20 = seq.firreg %180 clock %clock {firrtl.random_init_start = 1280 : ui64, sv.namehint = "regs_20"} : i64
    %regs_21 = seq.firreg %184 clock %clock {firrtl.random_init_start = 1344 : ui64, sv.namehint = "regs_21"} : i64
    %regs_22 = seq.firreg %188 clock %clock {firrtl.random_init_start = 1408 : ui64, sv.namehint = "regs_22"} : i64
    %regs_23 = seq.firreg %192 clock %clock {firrtl.random_init_start = 1472 : ui64, sv.namehint = "regs_23"} : i64
    %regs_24 = seq.firreg %196 clock %clock {firrtl.random_init_start = 1536 : ui64, sv.namehint = "regs_24"} : i64
    %regs_25 = seq.firreg %200 clock %clock {firrtl.random_init_start = 1600 : ui64, sv.namehint = "regs_25"} : i64
    %regs_26 = seq.firreg %204 clock %clock {firrtl.random_init_start = 1664 : ui64, sv.namehint = "regs_26"} : i64
    %regs_27 = seq.firreg %208 clock %clock {firrtl.random_init_start = 1728 : ui64, sv.namehint = "regs_27"} : i64
    %regs_28 = seq.firreg %212 clock %clock {firrtl.random_init_start = 1792 : ui64, sv.namehint = "regs_28"} : i64
    %regs_29 = seq.firreg %216 clock %clock {firrtl.random_init_start = 1856 : ui64, sv.namehint = "regs_29"} : i64
    %regs_30 = seq.firreg %220 clock %clock {firrtl.random_init_start = 1920 : ui64, sv.namehint = "regs_30"} : i64
    %regs_31 = seq.firreg %224 clock %clock {firrtl.random_init_start = 1984 : ui64, sv.namehint = "regs_31"} : i64
    %rd = seq.firreg %226 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 2048 : ui64} : i5
    %0 = comb.icmp bin ne %io_gprsW_waddr, %c0_i5 : i5
    %1 = comb.icmp bin eq %io_gprsW_waddr, %c1_i5 : i5
    %2 = comb.and bin %0, %1 : i1
    %3 = comb.mux bin %2, %io_gprsW_wdata, %regs_1 : i64
    %4 = comb.icmp bin eq %io_gprsW_waddr, %c2_i5 : i5
    %5 = comb.and bin %0, %4 : i1
    %6 = comb.mux bin %5, %io_gprsW_wdata, %regs_2 : i64
    %7 = comb.icmp bin eq %io_gprsW_waddr, %c3_i5 : i5
    %8 = comb.and bin %0, %7 : i1
    %9 = comb.mux bin %8, %io_gprsW_wdata, %regs_3 : i64
    %10 = comb.icmp bin eq %io_gprsW_waddr, %c4_i5 : i5
    %11 = comb.and bin %0, %10 : i1
    %12 = comb.mux bin %11, %io_gprsW_wdata, %regs_4 : i64
    %13 = comb.icmp bin eq %io_gprsW_waddr, %c5_i5 : i5
    %14 = comb.and bin %0, %13 : i1
    %15 = comb.mux bin %14, %io_gprsW_wdata, %regs_5 : i64
    %16 = comb.icmp bin eq %io_gprsW_waddr, %c6_i5 : i5
    %17 = comb.and bin %0, %16 : i1
    %18 = comb.mux bin %17, %io_gprsW_wdata, %regs_6 : i64
    %19 = comb.icmp bin eq %io_gprsW_waddr, %c7_i5 : i5
    %20 = comb.and bin %0, %19 : i1
    %21 = comb.mux bin %20, %io_gprsW_wdata, %regs_7 : i64
    %22 = comb.icmp bin eq %io_gprsW_waddr, %c8_i5 : i5
    %23 = comb.and bin %0, %22 : i1
    %24 = comb.mux bin %23, %io_gprsW_wdata, %regs_8 : i64
    %25 = comb.icmp bin eq %io_gprsW_waddr, %c9_i5 : i5
    %26 = comb.and bin %0, %25 : i1
    %27 = comb.mux bin %26, %io_gprsW_wdata, %regs_9 : i64
    %28 = comb.icmp bin eq %io_gprsW_waddr, %c10_i5 : i5
    %29 = comb.and bin %0, %28 : i1
    %30 = comb.mux bin %29, %io_gprsW_wdata, %regs_10 : i64
    %31 = comb.icmp bin eq %io_gprsW_waddr, %c11_i5 : i5
    %32 = comb.and bin %0, %31 : i1
    %33 = comb.mux bin %32, %io_gprsW_wdata, %regs_11 : i64
    %34 = comb.icmp bin eq %io_gprsW_waddr, %c12_i5 : i5
    %35 = comb.and bin %0, %34 : i1
    %36 = comb.mux bin %35, %io_gprsW_wdata, %regs_12 : i64
    %37 = comb.icmp bin eq %io_gprsW_waddr, %c13_i5 : i5
    %38 = comb.and bin %0, %37 : i1
    %39 = comb.mux bin %38, %io_gprsW_wdata, %regs_13 : i64
    %40 = comb.icmp bin eq %io_gprsW_waddr, %c14_i5 : i5
    %41 = comb.and bin %0, %40 : i1
    %42 = comb.mux bin %41, %io_gprsW_wdata, %regs_14 : i64
    %43 = comb.icmp bin eq %io_gprsW_waddr, %c15_i5 : i5
    %44 = comb.and bin %0, %43 : i1
    %45 = comb.mux bin %44, %io_gprsW_wdata, %regs_15 : i64
    %46 = comb.icmp bin eq %io_gprsW_waddr, %c-16_i5 : i5
    %47 = comb.and bin %0, %46 : i1
    %48 = comb.mux bin %47, %io_gprsW_wdata, %regs_16 : i64
    %49 = comb.icmp bin eq %io_gprsW_waddr, %c-15_i5 : i5
    %50 = comb.and bin %0, %49 : i1
    %51 = comb.mux bin %50, %io_gprsW_wdata, %regs_17 : i64
    %52 = comb.icmp bin eq %io_gprsW_waddr, %c-14_i5 : i5
    %53 = comb.and bin %0, %52 : i1
    %54 = comb.mux bin %53, %io_gprsW_wdata, %regs_18 : i64
    %55 = comb.icmp bin eq %io_gprsW_waddr, %c-13_i5 : i5
    %56 = comb.and bin %0, %55 : i1
    %57 = comb.mux bin %56, %io_gprsW_wdata, %regs_19 : i64
    %58 = comb.icmp bin eq %io_gprsW_waddr, %c-12_i5 : i5
    %59 = comb.and bin %0, %58 : i1
    %60 = comb.mux bin %59, %io_gprsW_wdata, %regs_20 : i64
    %61 = comb.icmp bin eq %io_gprsW_waddr, %c-11_i5 : i5
    %62 = comb.and bin %0, %61 : i1
    %63 = comb.mux bin %62, %io_gprsW_wdata, %regs_21 : i64
    %64 = comb.icmp bin eq %io_gprsW_waddr, %c-10_i5 : i5
    %65 = comb.and bin %0, %64 : i1
    %66 = comb.mux bin %65, %io_gprsW_wdata, %regs_22 : i64
    %67 = comb.icmp bin eq %io_gprsW_waddr, %c-9_i5 : i5
    %68 = comb.and bin %0, %67 : i1
    %69 = comb.mux bin %68, %io_gprsW_wdata, %regs_23 : i64
    %70 = comb.icmp bin eq %io_gprsW_waddr, %c-8_i5 : i5
    %71 = comb.and bin %0, %70 : i1
    %72 = comb.mux bin %71, %io_gprsW_wdata, %regs_24 : i64
    %73 = comb.icmp bin eq %io_gprsW_waddr, %c-7_i5 : i5
    %74 = comb.and bin %0, %73 : i1
    %75 = comb.mux bin %74, %io_gprsW_wdata, %regs_25 : i64
    %76 = comb.icmp bin eq %io_gprsW_waddr, %c-6_i5 : i5
    %77 = comb.and bin %0, %76 : i1
    %78 = comb.mux bin %77, %io_gprsW_wdata, %regs_26 : i64
    %79 = comb.icmp bin eq %io_gprsW_waddr, %c-5_i5 : i5
    %80 = comb.and bin %0, %79 : i1
    %81 = comb.mux bin %80, %io_gprsW_wdata, %regs_27 : i64
    %82 = comb.icmp bin eq %io_gprsW_waddr, %c-4_i5 : i5
    %83 = comb.and bin %0, %82 : i1
    %84 = comb.mux bin %83, %io_gprsW_wdata, %regs_28 : i64
    %85 = comb.icmp bin eq %io_gprsW_waddr, %c-3_i5 : i5
    %86 = comb.and bin %0, %85 : i1
    %87 = comb.mux bin %86, %io_gprsW_wdata, %regs_29 : i64
    %88 = comb.icmp bin eq %io_gprsW_waddr, %c-2_i5 : i5
    %89 = comb.and bin %0, %88 : i1
    %90 = comb.mux bin %89, %io_gprsW_wdata, %regs_30 : i64
    %91 = comb.icmp bin eq %io_gprsW_waddr, %c-1_i5 : i5
    %92 = comb.and bin %0, %91 : i1
    %93 = comb.mux bin %92, %io_gprsW_wdata, %regs_31 : i64
    %94 = hw.array_create %regs_31, %regs_30, %regs_29, %regs_28, %regs_27, %regs_26, %regs_25, %regs_24, %regs_23, %regs_22, %regs_21, %regs_20, %regs_19, %regs_18, %regs_17, %regs_16, %regs_15, %regs_14, %regs_13, %regs_12, %regs_11, %regs_10, %regs_9, %regs_8, %regs_7, %regs_6, %regs_5, %regs_4, %regs_3, %regs_2, %regs_1, %regs_0 : i64
    %95 = hw.array_get %94[%io_gprsW_waddr] : !hw.array<32xi64>, i5
    %96 = comb.icmp bin ne %rd, %c0_i5 : i5
    %97 = comb.and bin %io_gprsW_except, %96 : i1
    %98 = comb.xor %io_gprsW_wen, %true : i1
    %99 = comb.or %98, %io_gprsW_retire : i1
    %100 = comb.mux bin %99, %regs_0, %95 : i64
    %101 = comb.icmp bin eq %rd, %c1_i5 : i5
    %102 = comb.and %io_gprsW_retire, %97, %101 : i1
    %103 = comb.mux bin %102, %regs_0, %3 : i64
    %104 = comb.mux bin %io_gprsW_wen, %103, %regs_1 : i64
    %105 = comb.icmp bin eq %rd, %c2_i5 : i5
    %106 = comb.and %io_gprsW_retire, %97, %105 : i1
    %107 = comb.mux bin %106, %regs_0, %6 : i64
    %108 = comb.mux bin %io_gprsW_wen, %107, %regs_2 : i64
    %109 = comb.icmp bin eq %rd, %c3_i5 : i5
    %110 = comb.and %io_gprsW_retire, %97, %109 : i1
    %111 = comb.mux bin %110, %regs_0, %9 : i64
    %112 = comb.mux bin %io_gprsW_wen, %111, %regs_3 : i64
    %113 = comb.icmp bin eq %rd, %c4_i5 : i5
    %114 = comb.and %io_gprsW_retire, %97, %113 : i1
    %115 = comb.mux bin %114, %regs_0, %12 : i64
    %116 = comb.mux bin %io_gprsW_wen, %115, %regs_4 : i64
    %117 = comb.icmp bin eq %rd, %c5_i5 : i5
    %118 = comb.and %io_gprsW_retire, %97, %117 : i1
    %119 = comb.mux bin %118, %regs_0, %15 : i64
    %120 = comb.mux bin %io_gprsW_wen, %119, %regs_5 : i64
    %121 = comb.icmp bin eq %rd, %c6_i5 : i5
    %122 = comb.and %io_gprsW_retire, %97, %121 : i1
    %123 = comb.mux bin %122, %regs_0, %18 : i64
    %124 = comb.mux bin %io_gprsW_wen, %123, %regs_6 : i64
    %125 = comb.icmp bin eq %rd, %c7_i5 : i5
    %126 = comb.and %io_gprsW_retire, %97, %125 : i1
    %127 = comb.mux bin %126, %regs_0, %21 : i64
    %128 = comb.mux bin %io_gprsW_wen, %127, %regs_7 : i64
    %129 = comb.icmp bin eq %rd, %c8_i5 : i5
    %130 = comb.and %io_gprsW_retire, %97, %129 : i1
    %131 = comb.mux bin %130, %regs_0, %24 : i64
    %132 = comb.mux bin %io_gprsW_wen, %131, %regs_8 : i64
    %133 = comb.icmp bin eq %rd, %c9_i5 : i5
    %134 = comb.and %io_gprsW_retire, %97, %133 : i1
    %135 = comb.mux bin %134, %regs_0, %27 : i64
    %136 = comb.mux bin %io_gprsW_wen, %135, %regs_9 : i64
    %137 = comb.icmp bin eq %rd, %c10_i5 : i5
    %138 = comb.and %io_gprsW_retire, %97, %137 : i1
    %139 = comb.mux bin %138, %regs_0, %30 : i64
    %140 = comb.mux bin %io_gprsW_wen, %139, %regs_10 : i64
    %141 = comb.icmp bin eq %rd, %c11_i5 : i5
    %142 = comb.and %io_gprsW_retire, %97, %141 : i1
    %143 = comb.mux bin %142, %regs_0, %33 : i64
    %144 = comb.mux bin %io_gprsW_wen, %143, %regs_11 : i64
    %145 = comb.icmp bin eq %rd, %c12_i5 : i5
    %146 = comb.and %io_gprsW_retire, %97, %145 : i1
    %147 = comb.mux bin %146, %regs_0, %36 : i64
    %148 = comb.mux bin %io_gprsW_wen, %147, %regs_12 : i64
    %149 = comb.icmp bin eq %rd, %c13_i5 : i5
    %150 = comb.and %io_gprsW_retire, %97, %149 : i1
    %151 = comb.mux bin %150, %regs_0, %39 : i64
    %152 = comb.mux bin %io_gprsW_wen, %151, %regs_13 : i64
    %153 = comb.icmp bin eq %rd, %c14_i5 : i5
    %154 = comb.and %io_gprsW_retire, %97, %153 : i1
    %155 = comb.mux bin %154, %regs_0, %42 : i64
    %156 = comb.mux bin %io_gprsW_wen, %155, %regs_14 : i64
    %157 = comb.icmp bin eq %rd, %c15_i5 : i5
    %158 = comb.and %io_gprsW_retire, %97, %157 : i1
    %159 = comb.mux bin %158, %regs_0, %45 : i64
    %160 = comb.mux bin %io_gprsW_wen, %159, %regs_15 : i64
    %161 = comb.icmp bin eq %rd, %c-16_i5 : i5
    %162 = comb.and %io_gprsW_retire, %97, %161 : i1
    %163 = comb.mux bin %162, %regs_0, %48 : i64
    %164 = comb.mux bin %io_gprsW_wen, %163, %regs_16 : i64
    %165 = comb.icmp bin eq %rd, %c-15_i5 : i5
    %166 = comb.and %io_gprsW_retire, %97, %165 : i1
    %167 = comb.mux bin %166, %regs_0, %51 : i64
    %168 = comb.mux bin %io_gprsW_wen, %167, %regs_17 : i64
    %169 = comb.icmp bin eq %rd, %c-14_i5 : i5
    %170 = comb.and %io_gprsW_retire, %97, %169 : i1
    %171 = comb.mux bin %170, %regs_0, %54 : i64
    %172 = comb.mux bin %io_gprsW_wen, %171, %regs_18 : i64
    %173 = comb.icmp bin eq %rd, %c-13_i5 : i5
    %174 = comb.and %io_gprsW_retire, %97, %173 : i1
    %175 = comb.mux bin %174, %regs_0, %57 : i64
    %176 = comb.mux bin %io_gprsW_wen, %175, %regs_19 : i64
    %177 = comb.icmp bin eq %rd, %c-12_i5 : i5
    %178 = comb.and %io_gprsW_retire, %97, %177 : i1
    %179 = comb.mux bin %178, %regs_0, %60 : i64
    %180 = comb.mux bin %io_gprsW_wen, %179, %regs_20 : i64
    %181 = comb.icmp bin eq %rd, %c-11_i5 : i5
    %182 = comb.and %io_gprsW_retire, %97, %181 : i1
    %183 = comb.mux bin %182, %regs_0, %63 : i64
    %184 = comb.mux bin %io_gprsW_wen, %183, %regs_21 : i64
    %185 = comb.icmp bin eq %rd, %c-10_i5 : i5
    %186 = comb.and %io_gprsW_retire, %97, %185 : i1
    %187 = comb.mux bin %186, %regs_0, %66 : i64
    %188 = comb.mux bin %io_gprsW_wen, %187, %regs_22 : i64
    %189 = comb.icmp bin eq %rd, %c-9_i5 : i5
    %190 = comb.and %io_gprsW_retire, %97, %189 : i1
    %191 = comb.mux bin %190, %regs_0, %69 : i64
    %192 = comb.mux bin %io_gprsW_wen, %191, %regs_23 : i64
    %193 = comb.icmp bin eq %rd, %c-8_i5 : i5
    %194 = comb.and %io_gprsW_retire, %97, %193 : i1
    %195 = comb.mux bin %194, %regs_0, %72 : i64
    %196 = comb.mux bin %io_gprsW_wen, %195, %regs_24 : i64
    %197 = comb.icmp bin eq %rd, %c-7_i5 : i5
    %198 = comb.and %io_gprsW_retire, %97, %197 : i1
    %199 = comb.mux bin %198, %regs_0, %75 : i64
    %200 = comb.mux bin %io_gprsW_wen, %199, %regs_25 : i64
    %201 = comb.icmp bin eq %rd, %c-6_i5 : i5
    %202 = comb.and %io_gprsW_retire, %97, %201 : i1
    %203 = comb.mux bin %202, %regs_0, %78 : i64
    %204 = comb.mux bin %io_gprsW_wen, %203, %regs_26 : i64
    %205 = comb.icmp bin eq %rd, %c-5_i5 : i5
    %206 = comb.and %io_gprsW_retire, %97, %205 : i1
    %207 = comb.mux bin %206, %regs_0, %81 : i64
    %208 = comb.mux bin %io_gprsW_wen, %207, %regs_27 : i64
    %209 = comb.icmp bin eq %rd, %c-4_i5 : i5
    %210 = comb.and %io_gprsW_retire, %97, %209 : i1
    %211 = comb.mux bin %210, %regs_0, %84 : i64
    %212 = comb.mux bin %io_gprsW_wen, %211, %regs_28 : i64
    %213 = comb.icmp bin eq %rd, %c-3_i5 : i5
    %214 = comb.and %io_gprsW_retire, %97, %213 : i1
    %215 = comb.mux bin %214, %regs_0, %87 : i64
    %216 = comb.mux bin %io_gprsW_wen, %215, %regs_29 : i64
    %217 = comb.icmp bin eq %rd, %c-2_i5 : i5
    %218 = comb.and %io_gprsW_retire, %97, %217 : i1
    %219 = comb.mux bin %218, %regs_0, %90 : i64
    %220 = comb.mux bin %io_gprsW_wen, %219, %regs_30 : i64
    %221 = comb.icmp bin eq %rd, %c-1_i5 : i5
    %222 = comb.and %io_gprsW_retire, %97, %221 : i1
    %223 = comb.mux bin %222, %regs_0, %93 : i64
    %224 = comb.mux bin %io_gprsW_wen, %223, %regs_31 : i64
    %225 = comb.mux bin %io_gprsW_retire, %c0_i5, %io_gprsW_waddr : i5
    %226 = comb.mux bin %io_gprsW_wen, %225, %rd : i5
    hw.output %regs_1, %regs_2, %regs_3, %regs_4, %regs_5, %regs_6, %regs_7, %regs_8, %regs_9, %regs_10, %regs_11, %regs_12, %regs_13, %regs_14, %regs_15, %regs_16, %regs_17, %regs_18, %regs_19, %regs_20, %regs_21, %regs_22, %regs_23, %regs_24, %regs_25, %regs_26, %regs_27, %regs_28, %regs_29, %regs_30, %regs_31, %regs_1, %regs_2, %regs_3, %regs_4, %regs_5, %regs_6, %regs_7, %regs_8, %regs_9, %regs_10, %regs_11, %regs_12, %regs_13, %regs_14, %regs_15, %regs_16, %regs_17, %regs_18, %regs_19, %regs_20, %regs_21, %regs_22, %regs_23, %regs_24, %regs_25, %regs_26, %regs_27, %regs_28, %regs_29, %regs_30, %regs_31 : i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64
  }
  hw.module private @CSRs(in %clock : !seq.clock, in %reset : i1, in %io_csrsW_wen_0 : i1, in %io_csrsW_wen_1 : i1, in %io_csrsW_wen_2 : i1, in %io_csrsW_wen_3 : i1, in %io_csrsW_wcsr_0 : i12, in %io_csrsW_wcsr_1 : i12, in %io_csrsW_wcsr_2 : i12, in %io_csrsW_wcsr_3 : i12, in %io_csrsW_wdata_0 : i64, in %io_csrsW_wdata_1 : i64, in %io_csrsW_wdata_2 : i64, in %io_csrsW_wdata_3 : i64, in %io_csrsR_0_rcsr : i12, out io_csrsR_0_rdata : i64, out io_csrsR_1_rdata : i64, out io_csrsR_2_rdata : i64, out io_csrsR_3_rdata : i64, out io_csrsR_4_rdata : i64, out io_csrsR_5_rdata : i64, out io_csrsR_6_rdata : i64, out io_csrsR_7_rdata : i64, out io_csrsR_8_rdata : i64, out io_csrsR_9_rdata : i64, out io_mmuRead_0_rdata : i64, out io_mmuRead_1_rdata : i64, in %io_meip : i1, in %io_seip : i1, in %io_retire : i1, in %io_changePriv : i1, in %io_newPriv : i2, in %io_mtime : i64, in %io_mtip : i1, in %io_msip : i1, out io_currentPriv : i2, out io_bareSEIP : i1, out io_bareUEIP : i1, out io_debug_mstatus : i64, out io_debug_mepc : i64, out io_debug_sepc : i64, out io_debug_mtvec : i64, out io_debug_stvec : i64, out io_debug_mcause : i64, out io_debug_scause : i64, out io_debug_mtval : i64, out io_debug_stval : i64, out io_debug_mie : i64, out io_debug_mscratch : i64) {
    %c802_i12 = hw.constant 802 : i12
    %c-1248_i12 = hw.constant -1248 : i12
    %true = hw.constant true
    %c1_i64 = hw.constant 1 : i64
    %c262_i12 = hw.constant 262 : i12
    %c800_i12 = hw.constant 800 : i12
    %c774_i12 = hw.constant 774 : i12
    %c769_i12 = hw.constant 769 : i12
    %c770_i12 = hw.constant 770 : i12
    %c771_i12 = hw.constant 771 : i12
    %c384_i12 = hw.constant 384 : i12
    %c324_i12 = hw.constant 324 : i12
    %c323_i12 = hw.constant 323 : i12
    %c322_i12 = hw.constant 322 : i12
    %c321_i12 = hw.constant 321 : i12
    %c320_i12 = hw.constant 320 : i12
    %c261_i12 = hw.constant 261 : i12
    %c260_i12 = hw.constant 260 : i12
    %c256_i12 = hw.constant 256 : i12
    %c835_i12 = hw.constant 835 : i12
    %c834_i12 = hw.constant 834 : i12
    %c833_i12 = hw.constant 833 : i12
    %c832_i12 = hw.constant 832 : i12
    %c772_i12 = hw.constant 772 : i12
    %c836_i12 = hw.constant 836 : i12
    %c773_i12 = hw.constant 773 : i12
    %c768_i12 = hw.constant 768 : i12
    %c0_i5 = hw.constant 0 : i5
    %c-1_i2 = hw.constant -1 : i2
    %c-239_i12 = hw.constant -239 : i12
    %c-238_i12 = hw.constant -238 : i12
    %c-237_i12 = hw.constant -237 : i12
    %c-236_i12 = hw.constant -236 : i12
    %c-1280_i12 = hw.constant -1280 : i12
    %c-1278_i12 = hw.constant -1278 : i12
    %c-1024_i12 = hw.constant -1024 : i12
    %c-1022_i12 = hw.constant -1022 : i12
    %c0_i59 = hw.constant 0 : i59
    %c0_i4 = hw.constant 0 : i4
    %c-1023_i12 = hw.constant -1023 : i12
    %c-2_i2 = hw.constant -2 : i2
    %c0_i2 = hw.constant 0 : i2
    %c0_i54 = hw.constant 0 : i54
    %c0_i44 = hw.constant 0 : i44
    %c0_i52 = hw.constant 0 : i52
    %c-9223372036853460731_i64 = hw.constant -9223372036853460731 : i64
    %c0_i19 = hw.constant 0 : i19
    %false = hw.constant false
    %c0_i64 = hw.constant 0 : i64
    %c5120_i40 = hw.constant 5120 : i40
    %c8192_i43 = hw.constant 8192 : i43
    %c0_i3 = hw.constant 0 : i3
    %mtvec = seq.firreg %997 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 0 : ui64, sv.namehint = "mtvec"} : i64
    %mstatus_SD = seq.firreg %1134 clock %clock reset sync %reset, %false {firrtl.random_init_start = 64 : ui64} : i1
    %mstatus_TSR = seq.firreg %1125 clock %clock reset sync %reset, %false {firrtl.random_init_start = 105 : ui64} : i1
    %mstatus_MXR = seq.firreg %1081 clock %clock reset sync %reset, %false {firrtl.random_init_start = 108 : ui64} : i1
    %mstatus_SUM = seq.firreg %1085 clock %clock reset sync %reset, %false {firrtl.random_init_start = 109 : ui64} : i1
    %mstatus_MPRV = seq.firreg %1089 clock %clock reset sync %reset, %false {firrtl.random_init_start = 110 : ui64} : i1
    %mstatus_FS = seq.firreg %1129 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 113 : ui64} : i2
    %mstatus_MPP = seq.firreg %1093 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 115 : ui64} : i2
    %mstatus_SPP = seq.firreg %1097 clock %clock reset sync %reset, %false {firrtl.random_init_start = 119 : ui64} : i1
    %mstatus_MPIE = seq.firreg %1101 clock %clock reset sync %reset, %false {firrtl.random_init_start = 120 : ui64} : i1
    %mstatus_SPIE = seq.firreg %1105 clock %clock reset sync %reset, %false {firrtl.random_init_start = 122 : ui64} : i1
    %mstatus_UPIE = seq.firreg %1109 clock %clock reset sync %reset, %false {firrtl.random_init_start = 123 : ui64} : i1
    %mstatus_MIE = seq.firreg %1113 clock %clock reset sync %reset, %false {firrtl.random_init_start = 124 : ui64} : i1
    %mstatus_SIE = seq.firreg %1117 clock %clock reset sync %reset, %false {firrtl.random_init_start = 126 : ui64} : i1
    %mstatus_UIE = seq.firreg %1121 clock %clock reset sync %reset, %false {firrtl.random_init_start = 127 : ui64} : i1
    %medeleg = seq.firreg %1273 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 128 : ui64, sv.namehint = "medeleg"} : i64
    %mideleg_SEI = seq.firreg %1249 clock %clock reset sync %reset, %false {firrtl.random_init_start = 246 : ui64} : i1
    %mideleg_UEI = seq.firreg %1261 clock %clock reset sync %reset, %false {firrtl.random_init_start = 247 : ui64} : i1
    %mideleg_STI = seq.firreg %1257 clock %clock reset sync %reset, %false {firrtl.random_init_start = 250 : ui64} : i1
    %mideleg_UTI = seq.firreg %1269 clock %clock reset sync %reset, %false {firrtl.random_init_start = 251 : ui64} : i1
    %mideleg_SSI = seq.firreg %1253 clock %clock reset sync %reset, %false {firrtl.random_init_start = 254 : ui64} : i1
    %mideleg_USI = seq.firreg %1265 clock %clock reset sync %reset, %false {firrtl.random_init_start = 255 : ui64} : i1
    %mcycle = seq.firreg %1042 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 256 : ui64} : i64
    %minstret = seq.firreg %1046 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 320 : ui64} : i64
    %mscratch = seq.firreg %1050 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 384 : ui64, sv.namehint = "mscratch"} : i64
    %mepc = seq.firreg %1056 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 448 : ui64, sv.namehint = "mepc"} : i64
    %mcause = seq.firreg %1063 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 512 : ui64} : i5
    %mtval = seq.firreg %1067 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 517 : ui64, sv.namehint = "mtval"} : i64
    %mip_SEIP = seq.firreg %1008 clock %clock reset sync %reset, %false {firrtl.random_init_start = 635 : ui64, sv.namehint = "mip_SEIP"} : i1
    %mip_UEIP = seq.firreg %1224 clock %clock reset sync %reset, %false {firrtl.random_init_start = 636 : ui64, sv.namehint = "mip_UEIP"} : i1
    %mip_STIP = seq.firreg %1013 clock %clock reset sync %reset, %false {firrtl.random_init_start = 639 : ui64} : i1
    %mip_UTIP = seq.firreg %1019 clock %clock reset sync %reset, %false {firrtl.random_init_start = 640 : ui64} : i1
    %mip_SSIP = seq.firreg %1216 clock %clock reset sync %reset, %false {firrtl.random_init_start = 643 : ui64} : i1
    %mip_USIP = seq.firreg %1220 clock %clock reset sync %reset, %false {firrtl.random_init_start = 644 : ui64} : i1
    %mie_MEIE = seq.firreg %1145 clock %clock reset sync %reset, %false {firrtl.random_init_start = 697 : ui64} : i1
    %mie_SEIE = seq.firreg %1157 clock %clock reset sync %reset, %false {firrtl.random_init_start = 699 : ui64} : i1
    %mie_UEIE = seq.firreg %1169 clock %clock reset sync %reset, %false {firrtl.random_init_start = 700 : ui64} : i1
    %mie_MTIE = seq.firreg %1153 clock %clock reset sync %reset, %false {firrtl.random_init_start = 701 : ui64} : i1
    %mie_STIE = seq.firreg %1165 clock %clock reset sync %reset, %false {firrtl.random_init_start = 703 : ui64} : i1
    %mie_UTIE = seq.firreg %1177 clock %clock reset sync %reset, %false {firrtl.random_init_start = 704 : ui64} : i1
    %mie_MSIE = seq.firreg %1149 clock %clock reset sync %reset, %false {firrtl.random_init_start = 705 : ui64} : i1
    %mie_SSIE = seq.firreg %1161 clock %clock reset sync %reset, %false {firrtl.random_init_start = 707 : ui64} : i1
    %mie_USIE = seq.firreg %1173 clock %clock reset sync %reset, %false {firrtl.random_init_start = 708 : ui64} : i1
    %stvec = seq.firreg %1187 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 709 : ui64, sv.namehint = "stvec"} : i64
    %sscratch = seq.firreg %1191 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 773 : ui64} : i64
    %sepc = seq.firreg %1197 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 837 : ui64, sv.namehint = "sepc"} : i64
    %scause = seq.firreg %1204 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 901 : ui64} : i5
    %stval = seq.firreg %1208 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 906 : ui64, sv.namehint = "stval"} : i64
    %REG_mode = seq.firreg %1233 clock %clock reset sync %reset, %false {firrtl.random_init_start = 970 : ui64} : i1
    %REG_PPN = seq.firreg %1238 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 971 : ui64} : i44
    %currentPriv = seq.firreg %0 clock %clock reset sync %reset, %c-1_i2 {firrtl.random_init_start = 1015 : ui64, sv.namehint = "currentPriv"} : i2
    %0 = comb.mux bin %io_changePriv, %io_newPriv, %currentPriv : i2
    %1 = comb.add bin %mcycle, %c1_i64 {sv.namehint = "_mcycle_T"} : i64
    %2 = comb.add bin %minstret, %c1_i64 {sv.namehint = "_minstret_T"} : i64
    %3 = comb.mux bin %io_retire, %2, %minstret : i64
    %4 = comb.extract %io_csrsW_wcsr_0 from 10 : (i12) -> i2
    %5 = comb.icmp bin eq %4, %c-1_i2 : i2
    %6 = comb.icmp bin eq %io_csrsW_wcsr_0, %c768_i12 : i12
    %7 = comb.extract %io_csrsW_wdata_0 from 0 {sv.namehint = "mstatus_1_UIE"} : (i64) -> i1
    %8 = comb.extract %io_csrsW_wdata_0 from 1 {sv.namehint = "mstatus_1_SIE"} : (i64) -> i1
    %9 = comb.extract %io_csrsW_wdata_0 from 3 {sv.namehint = "mstatus_1_MIE"} : (i64) -> i1
    %10 = comb.extract %io_csrsW_wdata_0 from 4 {sv.namehint = "mstatus_1_UPIE"} : (i64) -> i1
    %11 = comb.extract %io_csrsW_wdata_0 from 5 {sv.namehint = "mstatus_1_SPIE"} : (i64) -> i1
    %12 = comb.extract %io_csrsW_wdata_0 from 7 {sv.namehint = "mstatus_1_MPIE"} : (i64) -> i1
    %13 = comb.extract %io_csrsW_wdata_0 from 8 {sv.namehint = "mstatus_1_SPP"} : (i64) -> i1
    %14 = comb.extract %io_csrsW_wdata_0 from 11 {sv.namehint = "mstatus_1_MPP"} : (i64) -> i2
    %15 = comb.extract %io_csrsW_wdata_0 from 13 {sv.namehint = "mstatus_1_FS"} : (i64) -> i2
    %16 = comb.extract %io_csrsW_wdata_0 from 17 {sv.namehint = "mstatus_1_MPRV"} : (i64) -> i1
    %17 = comb.extract %io_csrsW_wdata_0 from 18 {sv.namehint = "mstatus_1_SUM"} : (i64) -> i1
    %18 = comb.extract %io_csrsW_wdata_0 from 19 {sv.namehint = "mstatus_1_MXR"} : (i64) -> i1
    %19 = comb.extract %io_csrsW_wdata_0 from 22 {sv.namehint = "mstatus_1_TSR"} : (i64) -> i1
    %20 = comb.mux bin %6, %18, %mstatus_MXR : i1
    %21 = comb.mux bin %6, %17, %mstatus_SUM : i1
    %22 = comb.mux bin %6, %16, %mstatus_MPRV : i1
    %23 = comb.icmp bin eq %14, %c-2_i2 : i2
    %24 = comb.xor %6, %true : i1
    %25 = comb.mux bin %6, %13, %mstatus_SPP : i1
    %26 = comb.mux bin %6, %11, %mstatus_SPIE : i1
    %27 = comb.mux bin %6, %10, %mstatus_UPIE : i1
    %28 = comb.mux bin %6, %8, %mstatus_SIE : i1
    %29 = comb.mux bin %6, %7, %mstatus_UIE : i1
    %30 = comb.mux bin %6, %15, %mstatus_FS : i2
    %31 = comb.icmp bin eq %15, %c-1_i2 {sv.namehint = "_mstatus_SD_T"} : i2
    %32 = comb.mux bin %6, %31, %mstatus_SD : i1
    %33 = comb.extract %io_csrsW_wdata_0 from 2 {sv.namehint = "_mtvec_T"} : (i64) -> i62
    %34 = comb.extract %io_csrsW_wdata_0 from 1 {sv.namehint = "_mtvec_T_1"} : (i64) -> i1
    %35 = comb.extract %mtvec from 0 {sv.namehint = "_mtvec_T_2"} : (i64) -> i2
    %36 = comb.extract %io_csrsW_wdata_0 from 0 {sv.namehint = "_mtvec_T_3"} : (i64) -> i2
    %37 = comb.mux bin %34, %35, %36 {sv.namehint = "_mtvec_T_4"} : i2
    %38 = comb.concat %33, %37 {sv.namehint = "_mtvec_T_5"} : i62, i2
    %39 = comb.icmp bin ne %io_csrsW_wcsr_0, %c773_i12 : i12
    %40 = comb.xor %io_csrsW_wen_0, %true : i1
    %41 = comb.or %40, %5, %39 : i1
    %42 = comb.mux bin %41, %mtvec, %38 : i64
    %43 = comb.icmp bin eq %io_csrsW_wcsr_0, %c836_i12 : i12
    %44 = comb.extract %io_csrsW_wdata_0 from 0 {sv.namehint = "mip_1_USIP"} : (i64) -> i1
    %45 = comb.extract %io_csrsW_wdata_0 from 1 {sv.namehint = "mip_1_SSIP"} : (i64) -> i1
    %46 = comb.extract %io_csrsW_wdata_0 from 4 {sv.namehint = "mip_1_UTIP"} : (i64) -> i1
    %47 = comb.extract %io_csrsW_wdata_0 from 5 {sv.namehint = "mip_1_STIP"} : (i64) -> i1
    %48 = comb.extract %io_csrsW_wdata_0 from 8 {sv.namehint = "mip_1_UEIP"} : (i64) -> i1
    %49 = comb.extract %io_csrsW_wdata_0 from 9 {sv.namehint = "mip_1_SEIP"} : (i64) -> i1
    %50 = comb.xor %43, %true : i1
    %51 = comb.xor %io_csrsW_wen_0, %true : i1
    %52 = comb.or %51, %5, %50 : i1
    %53 = comb.mux bin %52, %mip_SEIP, %49 : i1
    %54 = comb.mux bin %43, %45, %mip_SSIP : i1
    %55 = comb.xor %43, %true : i1
    %56 = comb.xor %io_csrsW_wen_0, %true : i1
    %57 = comb.or %56, %5, %55 : i1
    %58 = comb.mux bin %57, %mip_STIP, %47 : i1
    %59 = comb.mux bin %43, %48, %mip_UEIP : i1
    %60 = comb.mux bin %43, %44, %mip_USIP : i1
    %61 = comb.xor %43, %true : i1
    %62 = comb.xor %io_csrsW_wen_0, %true : i1
    %63 = comb.or %62, %5, %61 : i1
    %64 = comb.mux bin %63, %mip_UTIP, %46 : i1
    %65 = comb.icmp bin eq %io_csrsW_wcsr_0, %c772_i12 : i12
    %66 = comb.extract %io_csrsW_wdata_0 from 0 {sv.namehint = "mie_1_USIE"} : (i64) -> i1
    %67 = comb.extract %io_csrsW_wdata_0 from 1 {sv.namehint = "mie_1_SSIE"} : (i64) -> i1
    %68 = comb.extract %io_csrsW_wdata_0 from 3 {sv.namehint = "mie_1_MSIE"} : (i64) -> i1
    %69 = comb.extract %io_csrsW_wdata_0 from 4 {sv.namehint = "mie_1_UTIE"} : (i64) -> i1
    %70 = comb.extract %io_csrsW_wdata_0 from 5 {sv.namehint = "mie_1_STIE"} : (i64) -> i1
    %71 = comb.extract %io_csrsW_wdata_0 from 7 {sv.namehint = "mie_1_MTIE"} : (i64) -> i1
    %72 = comb.extract %io_csrsW_wdata_0 from 8 {sv.namehint = "mie_1_UEIE"} : (i64) -> i1
    %73 = comb.extract %io_csrsW_wdata_0 from 9 {sv.namehint = "mie_1_SEIE"} : (i64) -> i1
    %74 = comb.extract %io_csrsW_wdata_0 from 11 {sv.namehint = "mie_1_MEIE"} : (i64) -> i1
    %75 = comb.mux bin %65, %73, %mie_SEIE : i1
    %76 = comb.mux bin %65, %67, %mie_SSIE : i1
    %77 = comb.mux bin %65, %70, %mie_STIE : i1
    %78 = comb.mux bin %65, %72, %mie_UEIE : i1
    %79 = comb.mux bin %65, %66, %mie_USIE : i1
    %80 = comb.mux bin %65, %69, %mie_UTIE : i1
    %81 = comb.icmp bin ne %io_csrsW_wcsr_0, %c-1280_i12 : i12
    %82 = comb.xor %io_csrsW_wen_0, %true : i1
    %83 = comb.or %82, %5, %81 : i1
    %84 = comb.mux bin %83, %1, %io_csrsW_wdata_0 : i64
    %85 = comb.icmp bin ne %io_csrsW_wcsr_0, %c-1278_i12 : i12
    %86 = comb.xor %io_csrsW_wen_0, %true : i1
    %87 = comb.or %86, %5, %85 : i1
    %88 = comb.mux bin %87, %3, %io_csrsW_wdata_0 : i64
    %89 = comb.icmp bin ne %io_csrsW_wcsr_0, %c832_i12 : i12
    %90 = comb.xor %io_csrsW_wen_0, %true : i1
    %91 = comb.or %90, %5, %89 : i1
    %92 = comb.mux bin %91, %mscratch, %io_csrsW_wdata_0 : i64
    %93 = comb.extract %io_csrsW_wdata_0 from 1 {sv.namehint = "_mepc_T"} : (i64) -> i63
    %94 = comb.concat %93, %false {sv.namehint = "_mepc_T_1"} : i63, i1
    %95 = comb.icmp bin ne %io_csrsW_wcsr_0, %c833_i12 : i12
    %96 = comb.xor %io_csrsW_wen_0, %true : i1
    %97 = comb.or %96, %5, %95 : i1
    %98 = comb.mux bin %97, %mepc, %94 : i64
    %99 = comb.extract %io_csrsW_wdata_0 from 63 {sv.namehint = "_mcause_T"} : (i64) -> i1
    %100 = comb.extract %io_csrsW_wdata_0 from 0 {sv.namehint = "_mcause_T_1"} : (i64) -> i4
    %101 = comb.concat %99, %100 {sv.namehint = "_mcause_T_2"} : i1, i4
    %102 = comb.icmp bin ne %io_csrsW_wcsr_0, %c834_i12 : i12
    %103 = comb.xor %io_csrsW_wen_0, %true : i1
    %104 = comb.or %103, %5, %102 : i1
    %105 = comb.mux bin %104, %mcause, %101 : i5
    %106 = comb.icmp bin ne %io_csrsW_wcsr_0, %c835_i12 : i12
    %107 = comb.xor %io_csrsW_wen_0, %true : i1
    %108 = comb.or %107, %5, %106 : i1
    %109 = comb.mux bin %108, %mtval, %io_csrsW_wdata_0 : i64
    %110 = comb.icmp bin eq %io_csrsW_wcsr_0, %c256_i12 : i12
    %111 = comb.extract %io_csrsW_wdata_0 from 0 {sv.namehint = "smstatus_UIE"} : (i64) -> i1
    %112 = comb.extract %io_csrsW_wdata_0 from 1 {sv.namehint = "smstatus_SIE"} : (i64) -> i1
    %113 = comb.extract %io_csrsW_wdata_0 from 4 {sv.namehint = "smstatus_UPIE"} : (i64) -> i1
    %114 = comb.extract %io_csrsW_wdata_0 from 5 {sv.namehint = "smstatus_SPIE"} : (i64) -> i1
    %115 = comb.extract %io_csrsW_wdata_0 from 8 {sv.namehint = "smstatus_SPP"} : (i64) -> i1
    %116 = comb.extract %io_csrsW_wdata_0 from 13 {sv.namehint = "smstatus_FS"} : (i64) -> i2
    %117 = comb.extract %io_csrsW_wdata_0 from 17 {sv.namehint = "smstatus_MPRV"} : (i64) -> i1
    %118 = comb.extract %io_csrsW_wdata_0 from 18 {sv.namehint = "smstatus_SUM"} : (i64) -> i1
    %119 = comb.extract %io_csrsW_wdata_0 from 19 {sv.namehint = "smstatus_MXR"} : (i64) -> i1
    %120 = comb.mux bin %110, %119, %20 : i1
    %121 = comb.xor %io_csrsW_wen_0, %true : i1
    %122 = comb.or %121, %5 : i1
    %123 = comb.mux bin %122, %mstatus_MXR, %120 : i1
    %124 = comb.mux bin %110, %118, %21 : i1
    %125 = comb.xor %io_csrsW_wen_0, %true : i1
    %126 = comb.or %125, %5 : i1
    %127 = comb.mux bin %126, %mstatus_SUM, %124 : i1
    %128 = comb.mux bin %110, %117, %22 : i1
    %129 = comb.xor %io_csrsW_wen_0, %true : i1
    %130 = comb.or %129, %5 : i1
    %131 = comb.mux bin %130, %mstatus_MPRV, %128 : i1
    %132 = comb.or bin %5, %110 : i1
    %133 = comb.xor %io_csrsW_wen_0, %true : i1
    %134 = comb.or %133, %132, %24, %23 : i1
    %135 = comb.mux bin %134, %mstatus_MPP, %14 : i2
    %136 = comb.mux bin %110, %115, %25 : i1
    %137 = comb.xor %io_csrsW_wen_0, %true : i1
    %138 = comb.or %137, %5 : i1
    %139 = comb.mux bin %138, %mstatus_SPP, %136 : i1
    %140 = comb.xor %6, %true : i1
    %141 = comb.xor %io_csrsW_wen_0, %true : i1
    %142 = comb.or %141, %132, %140 : i1
    %143 = comb.mux bin %142, %mstatus_MPIE, %12 : i1
    %144 = comb.mux bin %110, %114, %26 : i1
    %145 = comb.xor %io_csrsW_wen_0, %true : i1
    %146 = comb.or %145, %5 : i1
    %147 = comb.mux bin %146, %mstatus_SPIE, %144 : i1
    %148 = comb.mux bin %110, %113, %27 : i1
    %149 = comb.xor %io_csrsW_wen_0, %true : i1
    %150 = comb.or %149, %5 : i1
    %151 = comb.mux bin %150, %mstatus_UPIE, %148 : i1
    %152 = comb.xor %6, %true : i1
    %153 = comb.xor %io_csrsW_wen_0, %true : i1
    %154 = comb.or %153, %132, %152 : i1
    %155 = comb.mux bin %154, %mstatus_MIE, %9 : i1
    %156 = comb.mux bin %110, %112, %28 : i1
    %157 = comb.xor %io_csrsW_wen_0, %true : i1
    %158 = comb.or %157, %5 : i1
    %159 = comb.mux bin %158, %mstatus_SIE, %156 : i1
    %160 = comb.mux bin %110, %111, %29 : i1
    %161 = comb.xor %io_csrsW_wen_0, %true : i1
    %162 = comb.or %161, %5 : i1
    %163 = comb.mux bin %162, %mstatus_UIE, %160 : i1
    %164 = comb.xor %6, %true : i1
    %165 = comb.xor %io_csrsW_wen_0, %true : i1
    %166 = comb.or %165, %132, %164 : i1
    %167 = comb.mux bin %166, %mstatus_TSR, %19 : i1
    %168 = comb.mux bin %110, %116, %30 : i2
    %169 = comb.xor %io_csrsW_wen_0, %true : i1
    %170 = comb.or %169, %5 : i1
    %171 = comb.mux bin %170, %mstatus_FS, %168 : i2
    %172 = comb.icmp bin eq %116, %c-1_i2 {sv.namehint = "_mstatus_SD_T_1"} : i2
    %173 = comb.mux bin %110, %172, %32 : i1
    %174 = comb.xor %io_csrsW_wen_0, %true : i1
    %175 = comb.or %174, %5 : i1
    %176 = comb.mux bin %175, %mstatus_SD, %173 : i1
    %177 = comb.icmp bin eq %io_csrsW_wcsr_0, %c260_i12 : i12
    %178 = comb.extract %io_csrsW_wdata_0 from 0 {sv.namehint = "smie_USIE"} : (i64) -> i1
    %179 = comb.extract %io_csrsW_wdata_0 from 1 {sv.namehint = "smie_SSIE"} : (i64) -> i1
    %180 = comb.extract %io_csrsW_wdata_0 from 4 {sv.namehint = "smie_UTIE"} : (i64) -> i1
    %181 = comb.extract %io_csrsW_wdata_0 from 5 {sv.namehint = "smie_STIE"} : (i64) -> i1
    %182 = comb.extract %io_csrsW_wdata_0 from 8 {sv.namehint = "smie_UEIE"} : (i64) -> i1
    %183 = comb.extract %io_csrsW_wdata_0 from 9 {sv.namehint = "smie_SEIE"} : (i64) -> i1
    %184 = comb.or bin %5, %177 : i1
    %185 = comb.xor %65, %true : i1
    %186 = comb.xor %io_csrsW_wen_0, %true : i1
    %187 = comb.or %186, %184, %185 : i1
    %188 = comb.mux bin %187, %mie_MEIE, %74 : i1
    %189 = comb.xor %65, %true : i1
    %190 = comb.xor %io_csrsW_wen_0, %true : i1
    %191 = comb.or %190, %184, %189 : i1
    %192 = comb.mux bin %191, %mie_MSIE, %68 : i1
    %193 = comb.xor %65, %true : i1
    %194 = comb.xor %io_csrsW_wen_0, %true : i1
    %195 = comb.or %194, %184, %193 : i1
    %196 = comb.mux bin %195, %mie_MTIE, %71 : i1
    %197 = comb.mux bin %177, %183, %75 : i1
    %198 = comb.xor %io_csrsW_wen_0, %true : i1
    %199 = comb.or %198, %5 : i1
    %200 = comb.mux bin %199, %mie_SEIE, %197 : i1
    %201 = comb.mux bin %177, %179, %76 : i1
    %202 = comb.xor %io_csrsW_wen_0, %true : i1
    %203 = comb.or %202, %5 : i1
    %204 = comb.mux bin %203, %mie_SSIE, %201 : i1
    %205 = comb.mux bin %177, %181, %77 : i1
    %206 = comb.xor %io_csrsW_wen_0, %true : i1
    %207 = comb.or %206, %5 : i1
    %208 = comb.mux bin %207, %mie_STIE, %205 : i1
    %209 = comb.mux bin %177, %182, %78 : i1
    %210 = comb.xor %io_csrsW_wen_0, %true : i1
    %211 = comb.or %210, %5 : i1
    %212 = comb.mux bin %211, %mie_UEIE, %209 : i1
    %213 = comb.mux bin %177, %178, %79 : i1
    %214 = comb.xor %io_csrsW_wen_0, %true : i1
    %215 = comb.or %214, %5 : i1
    %216 = comb.mux bin %215, %mie_USIE, %213 : i1
    %217 = comb.mux bin %177, %180, %80 : i1
    %218 = comb.xor %io_csrsW_wen_0, %true : i1
    %219 = comb.or %218, %5 : i1
    %220 = comb.mux bin %219, %mie_UTIE, %217 : i1
    %221 = comb.extract %io_csrsW_wdata_0 from 2 {sv.namehint = "_stvec_T"} : (i64) -> i62
    %222 = comb.extract %io_csrsW_wdata_0 from 0 {sv.namehint = "_stvec_T_4"} : (i64) -> i2
    %223 = comb.extract %io_csrsW_wdata_0 from 1 {sv.namehint = "_stvec_T_2"} : (i64) -> i1
    %224 = comb.extract %stvec from 0 {sv.namehint = "_stvec_T_3"} : (i64) -> i2
    %225 = comb.mux bin %223, %224, %222 {sv.namehint = "_stvec_T_5"} : i2
    %226 = comb.concat %221, %225 {sv.namehint = "_stvec_T_6"} : i62, i2
    %227 = comb.icmp bin ne %io_csrsW_wcsr_0, %c261_i12 : i12
    %228 = comb.xor %io_csrsW_wen_0, %true : i1
    %229 = comb.or %228, %5, %227 : i1
    %230 = comb.mux bin %229, %stvec, %226 : i64
    %231 = comb.icmp bin ne %io_csrsW_wcsr_0, %c320_i12 : i12
    %232 = comb.xor %io_csrsW_wen_0, %true : i1
    %233 = comb.or %232, %5, %231 : i1
    %234 = comb.mux bin %233, %sscratch, %io_csrsW_wdata_0 : i64
    %235 = comb.extract %io_csrsW_wdata_0 from 1 {sv.namehint = "_sepc_T"} : (i64) -> i63
    %236 = comb.concat %235, %false {sv.namehint = "_sepc_T_1"} : i63, i1
    %237 = comb.icmp bin ne %io_csrsW_wcsr_0, %c321_i12 : i12
    %238 = comb.xor %io_csrsW_wen_0, %true : i1
    %239 = comb.or %238, %5, %237 : i1
    %240 = comb.mux bin %239, %sepc, %236 : i64
    %241 = comb.extract %io_csrsW_wdata_0 from 63 {sv.namehint = "_scause_T"} : (i64) -> i1
    %242 = comb.extract %io_csrsW_wdata_0 from 0 {sv.namehint = "_scause_T_1"} : (i64) -> i4
    %243 = comb.concat %241, %242 {sv.namehint = "_scause_T_2"} : i1, i4
    %244 = comb.icmp bin ne %io_csrsW_wcsr_0, %c322_i12 : i12
    %245 = comb.xor %io_csrsW_wen_0, %true : i1
    %246 = comb.or %245, %5, %244 : i1
    %247 = comb.mux bin %246, %scause, %243 : i5
    %248 = comb.icmp bin ne %io_csrsW_wcsr_0, %c323_i12 : i12
    %249 = comb.xor %io_csrsW_wen_0, %true : i1
    %250 = comb.or %249, %5, %248 : i1
    %251 = comb.mux bin %250, %stval, %io_csrsW_wdata_0 : i64
    %252 = comb.icmp bin eq %io_csrsW_wcsr_0, %c324_i12 : i12
    %253 = comb.extract %io_csrsW_wdata_0 from 0 {sv.namehint = "smip_USIP"} : (i64) -> i1
    %254 = comb.extract %io_csrsW_wdata_0 from 1 {sv.namehint = "smip_SSIP"} : (i64) -> i1
    %255 = comb.extract %io_csrsW_wdata_0 from 8 {sv.namehint = "smip_UEIP"} : (i64) -> i1
    %256 = comb.mux bin %252, %254, %54 : i1
    %257 = comb.xor %io_csrsW_wen_0, %true : i1
    %258 = comb.or %257, %5 : i1
    %259 = comb.mux bin %258, %mip_SSIP, %256 : i1
    %260 = comb.mux bin %252, %253, %60 : i1
    %261 = comb.xor %io_csrsW_wen_0, %true : i1
    %262 = comb.or %261, %5 : i1
    %263 = comb.mux bin %262, %mip_USIP, %260 : i1
    %264 = comb.mux bin %252, %255, %59 : i1
    %265 = comb.xor %io_csrsW_wen_0, %true : i1
    %266 = comb.or %265, %5 : i1
    %267 = comb.mux bin %266, %mip_UEIP, %264 : i1
    %268 = comb.icmp bin eq %io_csrsW_wcsr_0, %c384_i12 : i12
    %269 = comb.extract %io_csrsW_wdata_0 from 60 : (i64) -> i3
    %270 = comb.icmp bin eq %269, %c0_i3 : i3
    %271 = comb.extract %io_csrsW_wdata_0 from 63 : (i64) -> i1
    %272 = comb.and bin %268, %270 : i1
    %273 = comb.xor %272, %true : i1
    %274 = comb.xor %io_csrsW_wen_0, %true : i1
    %275 = comb.or %274, %5, %273 : i1
    %276 = comb.mux bin %275, %REG_mode, %271 : i1
    %277 = comb.extract %io_csrsW_wdata_0 from 0 : (i64) -> i44
    %278 = comb.xor %272, %true : i1
    %279 = comb.xor %io_csrsW_wen_0, %true : i1
    %280 = comb.or %279, %5, %278 : i1
    %281 = comb.mux bin %280, %REG_PPN, %277 : i44
    %282 = comb.icmp bin eq %io_csrsW_wcsr_0, %c771_i12 : i12
    %283 = comb.extract %io_csrsW_wdata_0 from 0 {sv.namehint = "mideleg_1_USI"} : (i64) -> i1
    %284 = comb.extract %io_csrsW_wdata_0 from 1 {sv.namehint = "mideleg_1_SSI"} : (i64) -> i1
    %285 = comb.extract %io_csrsW_wdata_0 from 4 {sv.namehint = "mideleg_1_UTI"} : (i64) -> i1
    %286 = comb.extract %io_csrsW_wdata_0 from 5 {sv.namehint = "mideleg_1_STI"} : (i64) -> i1
    %287 = comb.extract %io_csrsW_wdata_0 from 8 {sv.namehint = "mideleg_1_UEI"} : (i64) -> i1
    %288 = comb.extract %io_csrsW_wdata_0 from 9 {sv.namehint = "mideleg_1_SEI"} : (i64) -> i1
    %289 = comb.xor %282, %true : i1
    %290 = comb.xor %io_csrsW_wen_0, %true : i1
    %291 = comb.or %290, %5, %289 : i1
    %292 = comb.mux bin %291, %mideleg_SEI, %288 : i1
    %293 = comb.xor %282, %true : i1
    %294 = comb.xor %io_csrsW_wen_0, %true : i1
    %295 = comb.or %294, %5, %293 : i1
    %296 = comb.mux bin %295, %mideleg_SSI, %284 : i1
    %297 = comb.xor %282, %true : i1
    %298 = comb.xor %io_csrsW_wen_0, %true : i1
    %299 = comb.or %298, %5, %297 : i1
    %300 = comb.mux bin %299, %mideleg_STI, %286 : i1
    %301 = comb.xor %282, %true : i1
    %302 = comb.xor %io_csrsW_wen_0, %true : i1
    %303 = comb.or %302, %5, %301 : i1
    %304 = comb.mux bin %303, %mideleg_UEI, %287 : i1
    %305 = comb.xor %282, %true : i1
    %306 = comb.xor %io_csrsW_wen_0, %true : i1
    %307 = comb.or %306, %5, %305 : i1
    %308 = comb.mux bin %307, %mideleg_USI, %283 : i1
    %309 = comb.xor %282, %true : i1
    %310 = comb.xor %io_csrsW_wen_0, %true : i1
    %311 = comb.or %310, %5, %309 : i1
    %312 = comb.mux bin %311, %mideleg_UTI, %285 : i1
    %313 = comb.icmp bin ne %io_csrsW_wcsr_0, %c770_i12 : i12
    %314 = comb.xor %io_csrsW_wen_0, %true : i1
    %315 = comb.or %314, %5, %313 : i1
    %316 = comb.mux bin %315, %medeleg, %io_csrsW_wdata_0 : i64
    %317 = comb.extract %io_csrsW_wcsr_1 from 10 : (i12) -> i2
    %318 = comb.icmp bin eq %317, %c-1_i2 : i2
    %319 = comb.icmp bin eq %io_csrsW_wcsr_1, %c768_i12 : i12
    %320 = comb.extract %io_csrsW_wdata_1 from 0 {sv.namehint = "mstatus_3_UIE"} : (i64) -> i1
    %321 = comb.extract %io_csrsW_wdata_1 from 1 {sv.namehint = "mstatus_3_SIE"} : (i64) -> i1
    %322 = comb.extract %io_csrsW_wdata_1 from 3 {sv.namehint = "mstatus_3_MIE"} : (i64) -> i1
    %323 = comb.extract %io_csrsW_wdata_1 from 4 {sv.namehint = "mstatus_3_UPIE"} : (i64) -> i1
    %324 = comb.extract %io_csrsW_wdata_1 from 5 {sv.namehint = "mstatus_3_SPIE"} : (i64) -> i1
    %325 = comb.extract %io_csrsW_wdata_1 from 7 {sv.namehint = "mstatus_3_MPIE"} : (i64) -> i1
    %326 = comb.extract %io_csrsW_wdata_1 from 8 {sv.namehint = "mstatus_3_SPP"} : (i64) -> i1
    %327 = comb.extract %io_csrsW_wdata_1 from 11 {sv.namehint = "mstatus_3_MPP"} : (i64) -> i2
    %328 = comb.extract %io_csrsW_wdata_1 from 13 {sv.namehint = "mstatus_3_FS"} : (i64) -> i2
    %329 = comb.extract %io_csrsW_wdata_1 from 17 {sv.namehint = "mstatus_3_MPRV"} : (i64) -> i1
    %330 = comb.extract %io_csrsW_wdata_1 from 18 {sv.namehint = "mstatus_3_SUM"} : (i64) -> i1
    %331 = comb.extract %io_csrsW_wdata_1 from 19 {sv.namehint = "mstatus_3_MXR"} : (i64) -> i1
    %332 = comb.extract %io_csrsW_wdata_1 from 22 {sv.namehint = "mstatus_3_TSR"} : (i64) -> i1
    %333 = comb.mux bin %319, %331, %123 : i1
    %334 = comb.mux bin %319, %330, %127 : i1
    %335 = comb.mux bin %319, %329, %131 : i1
    %336 = comb.icmp bin eq %327, %c-2_i2 : i2
    %337 = comb.mux bin %336, %mstatus_MPP, %327 {sv.namehint = "_mstatus_MPP_T_5"} : i2
    %338 = comb.mux bin %319, %337, %135 : i2
    %339 = comb.mux bin %319, %326, %139 : i1
    %340 = comb.mux bin %319, %325, %143 : i1
    %341 = comb.mux bin %319, %324, %147 : i1
    %342 = comb.mux bin %319, %323, %151 : i1
    %343 = comb.mux bin %319, %322, %155 : i1
    %344 = comb.mux bin %319, %321, %159 : i1
    %345 = comb.mux bin %319, %320, %163 : i1
    %346 = comb.mux bin %319, %332, %167 : i1
    %347 = comb.mux bin %319, %328, %171 : i2
    %348 = comb.icmp bin eq %328, %c-1_i2 {sv.namehint = "_mstatus_SD_T_2"} : i2
    %349 = comb.mux bin %319, %348, %176 : i1
    %350 = comb.extract %io_csrsW_wdata_1 from 2 {sv.namehint = "_mtvec_T_6"} : (i64) -> i62
    %351 = comb.extract %io_csrsW_wdata_1 from 1 {sv.namehint = "_mtvec_T_7"} : (i64) -> i1
    %352 = comb.extract %mtvec from 0 {sv.namehint = "_mtvec_T_8"} : (i64) -> i2
    %353 = comb.extract %io_csrsW_wdata_1 from 0 {sv.namehint = "_mtvec_T_9"} : (i64) -> i2
    %354 = comb.mux bin %351, %352, %353 {sv.namehint = "_mtvec_T_10"} : i2
    %355 = comb.concat %350, %354 {sv.namehint = "_mtvec_T_11"} : i62, i2
    %356 = comb.icmp bin ne %io_csrsW_wcsr_1, %c773_i12 : i12
    %357 = comb.xor %io_csrsW_wen_1, %true : i1
    %358 = comb.or %357, %318, %356 : i1
    %359 = comb.mux bin %358, %42, %355 : i64
    %360 = comb.icmp bin eq %io_csrsW_wcsr_1, %c836_i12 : i12
    %361 = comb.extract %io_csrsW_wdata_1 from 0 {sv.namehint = "mip_2_USIP"} : (i64) -> i1
    %362 = comb.extract %io_csrsW_wdata_1 from 1 {sv.namehint = "mip_2_SSIP"} : (i64) -> i1
    %363 = comb.extract %io_csrsW_wdata_1 from 4 {sv.namehint = "mip_2_UTIP"} : (i64) -> i1
    %364 = comb.extract %io_csrsW_wdata_1 from 5 {sv.namehint = "mip_2_STIP"} : (i64) -> i1
    %365 = comb.extract %io_csrsW_wdata_1 from 8 {sv.namehint = "mip_2_UEIP"} : (i64) -> i1
    %366 = comb.extract %io_csrsW_wdata_1 from 9 {sv.namehint = "mip_2_SEIP"} : (i64) -> i1
    %367 = comb.xor %360, %true : i1
    %368 = comb.xor %io_csrsW_wen_1, %true : i1
    %369 = comb.or %368, %318, %367 : i1
    %370 = comb.mux bin %369, %53, %366 : i1
    %371 = comb.mux bin %360, %362, %259 : i1
    %372 = comb.xor %360, %true : i1
    %373 = comb.xor %io_csrsW_wen_1, %true : i1
    %374 = comb.or %373, %318, %372 : i1
    %375 = comb.mux bin %374, %58, %364 : i1
    %376 = comb.mux bin %360, %365, %267 : i1
    %377 = comb.mux bin %360, %361, %263 : i1
    %378 = comb.xor %360, %true : i1
    %379 = comb.xor %io_csrsW_wen_1, %true : i1
    %380 = comb.or %379, %318, %378 : i1
    %381 = comb.mux bin %380, %64, %363 : i1
    %382 = comb.icmp bin eq %io_csrsW_wcsr_1, %c772_i12 : i12
    %383 = comb.extract %io_csrsW_wdata_1 from 0 {sv.namehint = "mie_3_USIE"} : (i64) -> i1
    %384 = comb.extract %io_csrsW_wdata_1 from 1 {sv.namehint = "mie_3_SSIE"} : (i64) -> i1
    %385 = comb.extract %io_csrsW_wdata_1 from 3 {sv.namehint = "mie_3_MSIE"} : (i64) -> i1
    %386 = comb.extract %io_csrsW_wdata_1 from 4 {sv.namehint = "mie_3_UTIE"} : (i64) -> i1
    %387 = comb.extract %io_csrsW_wdata_1 from 5 {sv.namehint = "mie_3_STIE"} : (i64) -> i1
    %388 = comb.extract %io_csrsW_wdata_1 from 7 {sv.namehint = "mie_3_MTIE"} : (i64) -> i1
    %389 = comb.extract %io_csrsW_wdata_1 from 8 {sv.namehint = "mie_3_UEIE"} : (i64) -> i1
    %390 = comb.extract %io_csrsW_wdata_1 from 9 {sv.namehint = "mie_3_SEIE"} : (i64) -> i1
    %391 = comb.extract %io_csrsW_wdata_1 from 11 {sv.namehint = "mie_3_MEIE"} : (i64) -> i1
    %392 = comb.mux bin %382, %391, %188 : i1
    %393 = comb.mux bin %382, %385, %192 : i1
    %394 = comb.mux bin %382, %388, %196 : i1
    %395 = comb.mux bin %382, %390, %200 : i1
    %396 = comb.mux bin %382, %384, %204 : i1
    %397 = comb.mux bin %382, %387, %208 : i1
    %398 = comb.mux bin %382, %389, %212 : i1
    %399 = comb.mux bin %382, %383, %216 : i1
    %400 = comb.mux bin %382, %386, %220 : i1
    %401 = comb.icmp bin ne %io_csrsW_wcsr_1, %c-1280_i12 : i12
    %402 = comb.xor %io_csrsW_wen_1, %true : i1
    %403 = comb.or %402, %318, %401 : i1
    %404 = comb.mux bin %403, %84, %io_csrsW_wdata_1 : i64
    %405 = comb.icmp bin ne %io_csrsW_wcsr_1, %c-1278_i12 : i12
    %406 = comb.xor %io_csrsW_wen_1, %true : i1
    %407 = comb.or %406, %318, %405 : i1
    %408 = comb.mux bin %407, %88, %io_csrsW_wdata_1 : i64
    %409 = comb.icmp bin ne %io_csrsW_wcsr_1, %c832_i12 : i12
    %410 = comb.xor %io_csrsW_wen_1, %true : i1
    %411 = comb.or %410, %318, %409 : i1
    %412 = comb.mux bin %411, %92, %io_csrsW_wdata_1 : i64
    %413 = comb.extract %io_csrsW_wdata_1 from 1 {sv.namehint = "_mepc_T_2"} : (i64) -> i63
    %414 = comb.concat %413, %false {sv.namehint = "_mepc_T_3"} : i63, i1
    %415 = comb.icmp bin ne %io_csrsW_wcsr_1, %c833_i12 : i12
    %416 = comb.xor %io_csrsW_wen_1, %true : i1
    %417 = comb.or %416, %318, %415 : i1
    %418 = comb.mux bin %417, %98, %414 : i64
    %419 = comb.extract %io_csrsW_wdata_1 from 63 {sv.namehint = "_mcause_T_3"} : (i64) -> i1
    %420 = comb.extract %io_csrsW_wdata_1 from 0 {sv.namehint = "_mcause_T_4"} : (i64) -> i4
    %421 = comb.concat %419, %420 {sv.namehint = "_mcause_T_5"} : i1, i4
    %422 = comb.icmp bin ne %io_csrsW_wcsr_1, %c834_i12 : i12
    %423 = comb.xor %io_csrsW_wen_1, %true : i1
    %424 = comb.or %423, %318, %422 : i1
    %425 = comb.mux bin %424, %105, %421 : i5
    %426 = comb.icmp bin ne %io_csrsW_wcsr_1, %c835_i12 : i12
    %427 = comb.xor %io_csrsW_wen_1, %true : i1
    %428 = comb.or %427, %318, %426 : i1
    %429 = comb.mux bin %428, %109, %io_csrsW_wdata_1 : i64
    %430 = comb.icmp bin eq %io_csrsW_wcsr_1, %c256_i12 : i12
    %431 = comb.extract %io_csrsW_wdata_1 from 0 {sv.namehint = "mstatus_4_UIE"} : (i64) -> i1
    %432 = comb.extract %io_csrsW_wdata_1 from 1 {sv.namehint = "mstatus_4_SIE"} : (i64) -> i1
    %433 = comb.extract %io_csrsW_wdata_1 from 4 {sv.namehint = "mstatus_4_UPIE"} : (i64) -> i1
    %434 = comb.extract %io_csrsW_wdata_1 from 5 {sv.namehint = "mstatus_4_SPIE"} : (i64) -> i1
    %435 = comb.extract %io_csrsW_wdata_1 from 8 {sv.namehint = "mstatus_4_SPP"} : (i64) -> i1
    %436 = comb.extract %io_csrsW_wdata_1 from 13 {sv.namehint = "mstatus_4_FS"} : (i64) -> i2
    %437 = comb.extract %io_csrsW_wdata_1 from 17 {sv.namehint = "mstatus_4_MPRV"} : (i64) -> i1
    %438 = comb.extract %io_csrsW_wdata_1 from 18 {sv.namehint = "mstatus_4_SUM"} : (i64) -> i1
    %439 = comb.extract %io_csrsW_wdata_1 from 19 {sv.namehint = "mstatus_4_MXR"} : (i64) -> i1
    %440 = comb.mux bin %430, %439, %333 : i1
    %441 = comb.xor %io_csrsW_wen_1, %true : i1
    %442 = comb.or %441, %318 : i1
    %443 = comb.mux bin %442, %123, %440 : i1
    %444 = comb.mux bin %430, %438, %334 : i1
    %445 = comb.xor %io_csrsW_wen_1, %true : i1
    %446 = comb.or %445, %318 : i1
    %447 = comb.mux bin %446, %127, %444 : i1
    %448 = comb.mux bin %430, %437, %335 : i1
    %449 = comb.xor %io_csrsW_wen_1, %true : i1
    %450 = comb.or %449, %318 : i1
    %451 = comb.mux bin %450, %131, %448 : i1
    %452 = comb.mux bin %430, %mstatus_MPP, %338 : i2
    %453 = comb.xor %io_csrsW_wen_1, %true : i1
    %454 = comb.or %453, %318 : i1
    %455 = comb.mux bin %454, %135, %452 : i2
    %456 = comb.mux bin %430, %435, %339 : i1
    %457 = comb.xor %io_csrsW_wen_1, %true : i1
    %458 = comb.or %457, %318 : i1
    %459 = comb.mux bin %458, %139, %456 : i1
    %460 = comb.mux bin %430, %mstatus_MPIE, %340 : i1
    %461 = comb.xor %io_csrsW_wen_1, %true : i1
    %462 = comb.or %461, %318 : i1
    %463 = comb.mux bin %462, %143, %460 : i1
    %464 = comb.mux bin %430, %434, %341 : i1
    %465 = comb.xor %io_csrsW_wen_1, %true : i1
    %466 = comb.or %465, %318 : i1
    %467 = comb.mux bin %466, %147, %464 : i1
    %468 = comb.mux bin %430, %433, %342 : i1
    %469 = comb.xor %io_csrsW_wen_1, %true : i1
    %470 = comb.or %469, %318 : i1
    %471 = comb.mux bin %470, %151, %468 : i1
    %472 = comb.mux bin %430, %mstatus_MIE, %343 : i1
    %473 = comb.xor %io_csrsW_wen_1, %true : i1
    %474 = comb.or %473, %318 : i1
    %475 = comb.mux bin %474, %155, %472 : i1
    %476 = comb.mux bin %430, %432, %344 : i1
    %477 = comb.xor %io_csrsW_wen_1, %true : i1
    %478 = comb.or %477, %318 : i1
    %479 = comb.mux bin %478, %159, %476 : i1
    %480 = comb.mux bin %430, %431, %345 : i1
    %481 = comb.xor %io_csrsW_wen_1, %true : i1
    %482 = comb.or %481, %318 : i1
    %483 = comb.mux bin %482, %163, %480 : i1
    %484 = comb.mux bin %430, %mstatus_TSR, %346 : i1
    %485 = comb.xor %io_csrsW_wen_1, %true : i1
    %486 = comb.or %485, %318 : i1
    %487 = comb.mux bin %486, %167, %484 : i1
    %488 = comb.mux bin %430, %436, %347 : i2
    %489 = comb.xor %io_csrsW_wen_1, %true : i1
    %490 = comb.or %489, %318 : i1
    %491 = comb.mux bin %490, %171, %488 : i2
    %492 = comb.icmp bin eq %436, %c-1_i2 {sv.namehint = "_mstatus_SD_T_3"} : i2
    %493 = comb.mux bin %430, %492, %349 : i1
    %494 = comb.xor %io_csrsW_wen_1, %true : i1
    %495 = comb.or %494, %318 : i1
    %496 = comb.mux bin %495, %176, %493 : i1
    %497 = comb.icmp bin eq %io_csrsW_wcsr_1, %c260_i12 : i12
    %498 = comb.extract %io_csrsW_wdata_1 from 0 {sv.namehint = "mie_4_USIE"} : (i64) -> i1
    %499 = comb.extract %io_csrsW_wdata_1 from 1 {sv.namehint = "mie_4_SSIE"} : (i64) -> i1
    %500 = comb.extract %io_csrsW_wdata_1 from 4 {sv.namehint = "mie_4_UTIE"} : (i64) -> i1
    %501 = comb.extract %io_csrsW_wdata_1 from 5 {sv.namehint = "mie_4_STIE"} : (i64) -> i1
    %502 = comb.extract %io_csrsW_wdata_1 from 8 {sv.namehint = "mie_4_UEIE"} : (i64) -> i1
    %503 = comb.extract %io_csrsW_wdata_1 from 9 {sv.namehint = "mie_4_SEIE"} : (i64) -> i1
    %504 = comb.mux bin %497, %mie_MEIE, %392 : i1
    %505 = comb.xor %io_csrsW_wen_1, %true : i1
    %506 = comb.or %505, %318 : i1
    %507 = comb.mux bin %506, %188, %504 : i1
    %508 = comb.mux bin %497, %mie_MSIE, %393 : i1
    %509 = comb.xor %io_csrsW_wen_1, %true : i1
    %510 = comb.or %509, %318 : i1
    %511 = comb.mux bin %510, %192, %508 : i1
    %512 = comb.mux bin %497, %mie_MTIE, %394 : i1
    %513 = comb.xor %io_csrsW_wen_1, %true : i1
    %514 = comb.or %513, %318 : i1
    %515 = comb.mux bin %514, %196, %512 : i1
    %516 = comb.mux bin %497, %503, %395 : i1
    %517 = comb.xor %io_csrsW_wen_1, %true : i1
    %518 = comb.or %517, %318 : i1
    %519 = comb.mux bin %518, %200, %516 : i1
    %520 = comb.mux bin %497, %499, %396 : i1
    %521 = comb.xor %io_csrsW_wen_1, %true : i1
    %522 = comb.or %521, %318 : i1
    %523 = comb.mux bin %522, %204, %520 : i1
    %524 = comb.mux bin %497, %501, %397 : i1
    %525 = comb.xor %io_csrsW_wen_1, %true : i1
    %526 = comb.or %525, %318 : i1
    %527 = comb.mux bin %526, %208, %524 : i1
    %528 = comb.mux bin %497, %502, %398 : i1
    %529 = comb.xor %io_csrsW_wen_1, %true : i1
    %530 = comb.or %529, %318 : i1
    %531 = comb.mux bin %530, %212, %528 : i1
    %532 = comb.mux bin %497, %498, %399 : i1
    %533 = comb.xor %io_csrsW_wen_1, %true : i1
    %534 = comb.or %533, %318 : i1
    %535 = comb.mux bin %534, %216, %532 : i1
    %536 = comb.mux bin %497, %500, %400 : i1
    %537 = comb.xor %io_csrsW_wen_1, %true : i1
    %538 = comb.or %537, %318 : i1
    %539 = comb.mux bin %538, %220, %536 : i1
    %540 = comb.extract %io_csrsW_wdata_1 from 2 {sv.namehint = "_stvec_T_7"} : (i64) -> i62
    %541 = comb.extract %io_csrsW_wdata_1 from 0 {sv.namehint = "_stvec_T_11"} : (i64) -> i2
    %542 = comb.extract %io_csrsW_wdata_1 from 1 {sv.namehint = "_stvec_T_9"} : (i64) -> i1
    %543 = comb.extract %stvec from 0 {sv.namehint = "_stvec_T_10"} : (i64) -> i2
    %544 = comb.mux bin %542, %543, %541 {sv.namehint = "_stvec_T_12"} : i2
    %545 = comb.concat %540, %544 {sv.namehint = "_stvec_T_13"} : i62, i2
    %546 = comb.icmp bin ne %io_csrsW_wcsr_1, %c261_i12 : i12
    %547 = comb.xor %io_csrsW_wen_1, %true : i1
    %548 = comb.or %547, %318, %546 : i1
    %549 = comb.mux bin %548, %230, %545 : i64
    %550 = comb.icmp bin ne %io_csrsW_wcsr_1, %c320_i12 : i12
    %551 = comb.xor %io_csrsW_wen_1, %true : i1
    %552 = comb.or %551, %318, %550 : i1
    %553 = comb.mux bin %552, %234, %io_csrsW_wdata_1 : i64
    %554 = comb.extract %io_csrsW_wdata_1 from 1 {sv.namehint = "_sepc_T_2"} : (i64) -> i63
    %555 = comb.concat %554, %false {sv.namehint = "_sepc_T_3"} : i63, i1
    %556 = comb.icmp bin ne %io_csrsW_wcsr_1, %c321_i12 : i12
    %557 = comb.xor %io_csrsW_wen_1, %true : i1
    %558 = comb.or %557, %318, %556 : i1
    %559 = comb.mux bin %558, %240, %555 : i64
    %560 = comb.extract %io_csrsW_wdata_1 from 63 {sv.namehint = "_scause_T_3"} : (i64) -> i1
    %561 = comb.extract %io_csrsW_wdata_1 from 0 {sv.namehint = "_scause_T_4"} : (i64) -> i4
    %562 = comb.concat %560, %561 {sv.namehint = "_scause_T_5"} : i1, i4
    %563 = comb.icmp bin ne %io_csrsW_wcsr_1, %c322_i12 : i12
    %564 = comb.xor %io_csrsW_wen_1, %true : i1
    %565 = comb.or %564, %318, %563 : i1
    %566 = comb.mux bin %565, %247, %562 : i5
    %567 = comb.icmp bin ne %io_csrsW_wcsr_1, %c323_i12 : i12
    %568 = comb.xor %io_csrsW_wen_1, %true : i1
    %569 = comb.or %568, %318, %567 : i1
    %570 = comb.mux bin %569, %251, %io_csrsW_wdata_1 : i64
    %571 = comb.icmp bin eq %io_csrsW_wcsr_1, %c324_i12 : i12
    %572 = comb.extract %io_csrsW_wdata_1 from 0 {sv.namehint = "smip_1_USIP"} : (i64) -> i1
    %573 = comb.extract %io_csrsW_wdata_1 from 1 {sv.namehint = "smip_1_SSIP"} : (i64) -> i1
    %574 = comb.extract %io_csrsW_wdata_1 from 8 {sv.namehint = "smip_1_UEIP"} : (i64) -> i1
    %575 = comb.mux bin %571, %573, %371 : i1
    %576 = comb.xor %io_csrsW_wen_1, %true : i1
    %577 = comb.or %576, %318 : i1
    %578 = comb.mux bin %577, %259, %575 : i1
    %579 = comb.mux bin %571, %572, %377 : i1
    %580 = comb.xor %io_csrsW_wen_1, %true : i1
    %581 = comb.or %580, %318 : i1
    %582 = comb.mux bin %581, %263, %579 : i1
    %583 = comb.mux bin %571, %574, %376 : i1
    %584 = comb.xor %io_csrsW_wen_1, %true : i1
    %585 = comb.or %584, %318 : i1
    %586 = comb.mux bin %585, %267, %583 : i1
    %587 = comb.icmp bin eq %io_csrsW_wcsr_1, %c384_i12 : i12
    %588 = comb.extract %io_csrsW_wdata_1 from 60 : (i64) -> i3
    %589 = comb.icmp bin eq %588, %c0_i3 : i3
    %590 = comb.extract %io_csrsW_wdata_1 from 63 : (i64) -> i1
    %591 = comb.and bin %587, %589 : i1
    %592 = comb.xor %591, %true : i1
    %593 = comb.xor %io_csrsW_wen_1, %true : i1
    %594 = comb.or %593, %318, %592 : i1
    %595 = comb.mux bin %594, %276, %590 : i1
    %596 = comb.extract %io_csrsW_wdata_1 from 0 : (i64) -> i44
    %597 = comb.xor %591, %true : i1
    %598 = comb.xor %io_csrsW_wen_1, %true : i1
    %599 = comb.or %598, %318, %597 : i1
    %600 = comb.mux bin %599, %281, %596 : i44
    %601 = comb.icmp bin eq %io_csrsW_wcsr_1, %c771_i12 : i12
    %602 = comb.extract %io_csrsW_wdata_1 from 0 {sv.namehint = "mideleg_2_USI"} : (i64) -> i1
    %603 = comb.extract %io_csrsW_wdata_1 from 1 {sv.namehint = "mideleg_2_SSI"} : (i64) -> i1
    %604 = comb.extract %io_csrsW_wdata_1 from 4 {sv.namehint = "mideleg_2_UTI"} : (i64) -> i1
    %605 = comb.extract %io_csrsW_wdata_1 from 5 {sv.namehint = "mideleg_2_STI"} : (i64) -> i1
    %606 = comb.extract %io_csrsW_wdata_1 from 8 {sv.namehint = "mideleg_2_UEI"} : (i64) -> i1
    %607 = comb.extract %io_csrsW_wdata_1 from 9 {sv.namehint = "mideleg_2_SEI"} : (i64) -> i1
    %608 = comb.xor %601, %true : i1
    %609 = comb.xor %io_csrsW_wen_1, %true : i1
    %610 = comb.or %609, %318, %608 : i1
    %611 = comb.mux bin %610, %292, %607 : i1
    %612 = comb.xor %601, %true : i1
    %613 = comb.xor %io_csrsW_wen_1, %true : i1
    %614 = comb.or %613, %318, %612 : i1
    %615 = comb.mux bin %614, %296, %603 : i1
    %616 = comb.xor %601, %true : i1
    %617 = comb.xor %io_csrsW_wen_1, %true : i1
    %618 = comb.or %617, %318, %616 : i1
    %619 = comb.mux bin %618, %300, %605 : i1
    %620 = comb.xor %601, %true : i1
    %621 = comb.xor %io_csrsW_wen_1, %true : i1
    %622 = comb.or %621, %318, %620 : i1
    %623 = comb.mux bin %622, %304, %606 : i1
    %624 = comb.xor %601, %true : i1
    %625 = comb.xor %io_csrsW_wen_1, %true : i1
    %626 = comb.or %625, %318, %624 : i1
    %627 = comb.mux bin %626, %308, %602 : i1
    %628 = comb.xor %601, %true : i1
    %629 = comb.xor %io_csrsW_wen_1, %true : i1
    %630 = comb.or %629, %318, %628 : i1
    %631 = comb.mux bin %630, %312, %604 : i1
    %632 = comb.icmp bin ne %io_csrsW_wcsr_1, %c770_i12 : i12
    %633 = comb.xor %io_csrsW_wen_1, %true : i1
    %634 = comb.or %633, %318, %632 : i1
    %635 = comb.mux bin %634, %316, %io_csrsW_wdata_1 : i64
    %636 = comb.extract %io_csrsW_wcsr_2 from 10 : (i12) -> i2
    %637 = comb.icmp bin eq %636, %c-1_i2 : i2
    %638 = comb.icmp bin eq %io_csrsW_wcsr_2, %c768_i12 : i12
    %639 = comb.extract %io_csrsW_wdata_2 from 0 {sv.namehint = "mstatus_5_UIE"} : (i64) -> i1
    %640 = comb.extract %io_csrsW_wdata_2 from 1 {sv.namehint = "mstatus_5_SIE"} : (i64) -> i1
    %641 = comb.extract %io_csrsW_wdata_2 from 3 {sv.namehint = "mstatus_5_MIE"} : (i64) -> i1
    %642 = comb.extract %io_csrsW_wdata_2 from 4 {sv.namehint = "mstatus_5_UPIE"} : (i64) -> i1
    %643 = comb.extract %io_csrsW_wdata_2 from 5 {sv.namehint = "mstatus_5_SPIE"} : (i64) -> i1
    %644 = comb.extract %io_csrsW_wdata_2 from 7 {sv.namehint = "mstatus_5_MPIE"} : (i64) -> i1
    %645 = comb.extract %io_csrsW_wdata_2 from 8 {sv.namehint = "mstatus_5_SPP"} : (i64) -> i1
    %646 = comb.extract %io_csrsW_wdata_2 from 11 {sv.namehint = "mstatus_5_MPP"} : (i64) -> i2
    %647 = comb.extract %io_csrsW_wdata_2 from 13 {sv.namehint = "mstatus_5_FS"} : (i64) -> i2
    %648 = comb.extract %io_csrsW_wdata_2 from 17 {sv.namehint = "mstatus_5_MPRV"} : (i64) -> i1
    %649 = comb.extract %io_csrsW_wdata_2 from 18 {sv.namehint = "mstatus_5_SUM"} : (i64) -> i1
    %650 = comb.extract %io_csrsW_wdata_2 from 19 {sv.namehint = "mstatus_5_MXR"} : (i64) -> i1
    %651 = comb.extract %io_csrsW_wdata_2 from 22 {sv.namehint = "mstatus_5_TSR"} : (i64) -> i1
    %652 = comb.mux bin %638, %650, %443 : i1
    %653 = comb.mux bin %638, %649, %447 : i1
    %654 = comb.mux bin %638, %648, %451 : i1
    %655 = comb.icmp bin eq %646, %c-2_i2 : i2
    %656 = comb.mux bin %655, %mstatus_MPP, %646 {sv.namehint = "_mstatus_MPP_T_9"} : i2
    %657 = comb.mux bin %638, %656, %455 : i2
    %658 = comb.mux bin %638, %645, %459 : i1
    %659 = comb.mux bin %638, %644, %463 : i1
    %660 = comb.mux bin %638, %643, %467 : i1
    %661 = comb.mux bin %638, %642, %471 : i1
    %662 = comb.mux bin %638, %641, %475 : i1
    %663 = comb.mux bin %638, %640, %479 : i1
    %664 = comb.mux bin %638, %639, %483 : i1
    %665 = comb.mux bin %638, %651, %487 : i1
    %666 = comb.mux bin %638, %647, %491 : i2
    %667 = comb.icmp bin eq %647, %c-1_i2 {sv.namehint = "_mstatus_SD_T_4"} : i2
    %668 = comb.mux bin %638, %667, %496 : i1
    %669 = comb.extract %io_csrsW_wdata_2 from 2 {sv.namehint = "_mtvec_T_12"} : (i64) -> i62
    %670 = comb.extract %io_csrsW_wdata_2 from 1 {sv.namehint = "_mtvec_T_13"} : (i64) -> i1
    %671 = comb.extract %mtvec from 0 {sv.namehint = "_mtvec_T_14"} : (i64) -> i2
    %672 = comb.extract %io_csrsW_wdata_2 from 0 {sv.namehint = "_mtvec_T_15"} : (i64) -> i2
    %673 = comb.mux bin %670, %671, %672 {sv.namehint = "_mtvec_T_16"} : i2
    %674 = comb.concat %669, %673 {sv.namehint = "_mtvec_T_17"} : i62, i2
    %675 = comb.icmp bin ne %io_csrsW_wcsr_2, %c773_i12 : i12
    %676 = comb.xor %io_csrsW_wen_2, %true : i1
    %677 = comb.or %676, %637, %675 : i1
    %678 = comb.mux bin %677, %359, %674 : i64
    %679 = comb.icmp bin eq %io_csrsW_wcsr_2, %c836_i12 : i12
    %680 = comb.extract %io_csrsW_wdata_2 from 0 {sv.namehint = "mip_3_USIP"} : (i64) -> i1
    %681 = comb.extract %io_csrsW_wdata_2 from 1 {sv.namehint = "mip_3_SSIP"} : (i64) -> i1
    %682 = comb.extract %io_csrsW_wdata_2 from 4 {sv.namehint = "mip_3_UTIP"} : (i64) -> i1
    %683 = comb.extract %io_csrsW_wdata_2 from 5 {sv.namehint = "mip_3_STIP"} : (i64) -> i1
    %684 = comb.extract %io_csrsW_wdata_2 from 8 {sv.namehint = "mip_3_UEIP"} : (i64) -> i1
    %685 = comb.extract %io_csrsW_wdata_2 from 9 {sv.namehint = "mip_3_SEIP"} : (i64) -> i1
    %686 = comb.xor %679, %true : i1
    %687 = comb.xor %io_csrsW_wen_2, %true : i1
    %688 = comb.or %687, %637, %686 : i1
    %689 = comb.mux bin %688, %370, %685 : i1
    %690 = comb.mux bin %679, %681, %578 : i1
    %691 = comb.xor %679, %true : i1
    %692 = comb.xor %io_csrsW_wen_2, %true : i1
    %693 = comb.or %692, %637, %691 : i1
    %694 = comb.mux bin %693, %375, %683 : i1
    %695 = comb.mux bin %679, %684, %586 : i1
    %696 = comb.mux bin %679, %680, %582 : i1
    %697 = comb.xor %679, %true : i1
    %698 = comb.xor %io_csrsW_wen_2, %true : i1
    %699 = comb.or %698, %637, %697 : i1
    %700 = comb.mux bin %699, %381, %682 : i1
    %701 = comb.icmp bin eq %io_csrsW_wcsr_2, %c772_i12 : i12
    %702 = comb.extract %io_csrsW_wdata_2 from 0 {sv.namehint = "mie_5_USIE"} : (i64) -> i1
    %703 = comb.extract %io_csrsW_wdata_2 from 1 {sv.namehint = "mie_5_SSIE"} : (i64) -> i1
    %704 = comb.extract %io_csrsW_wdata_2 from 3 {sv.namehint = "mie_5_MSIE"} : (i64) -> i1
    %705 = comb.extract %io_csrsW_wdata_2 from 4 {sv.namehint = "mie_5_UTIE"} : (i64) -> i1
    %706 = comb.extract %io_csrsW_wdata_2 from 5 {sv.namehint = "mie_5_STIE"} : (i64) -> i1
    %707 = comb.extract %io_csrsW_wdata_2 from 7 {sv.namehint = "mie_5_MTIE"} : (i64) -> i1
    %708 = comb.extract %io_csrsW_wdata_2 from 8 {sv.namehint = "mie_5_UEIE"} : (i64) -> i1
    %709 = comb.extract %io_csrsW_wdata_2 from 9 {sv.namehint = "mie_5_SEIE"} : (i64) -> i1
    %710 = comb.extract %io_csrsW_wdata_2 from 11 {sv.namehint = "mie_5_MEIE"} : (i64) -> i1
    %711 = comb.mux bin %701, %710, %507 : i1
    %712 = comb.mux bin %701, %704, %511 : i1
    %713 = comb.mux bin %701, %707, %515 : i1
    %714 = comb.mux bin %701, %709, %519 : i1
    %715 = comb.mux bin %701, %703, %523 : i1
    %716 = comb.mux bin %701, %706, %527 : i1
    %717 = comb.mux bin %701, %708, %531 : i1
    %718 = comb.mux bin %701, %702, %535 : i1
    %719 = comb.mux bin %701, %705, %539 : i1
    %720 = comb.icmp bin ne %io_csrsW_wcsr_2, %c-1280_i12 : i12
    %721 = comb.xor %io_csrsW_wen_2, %true : i1
    %722 = comb.or %721, %637, %720 : i1
    %723 = comb.mux bin %722, %404, %io_csrsW_wdata_2 : i64
    %724 = comb.icmp bin ne %io_csrsW_wcsr_2, %c-1278_i12 : i12
    %725 = comb.xor %io_csrsW_wen_2, %true : i1
    %726 = comb.or %725, %637, %724 : i1
    %727 = comb.mux bin %726, %408, %io_csrsW_wdata_2 : i64
    %728 = comb.icmp bin ne %io_csrsW_wcsr_2, %c832_i12 : i12
    %729 = comb.xor %io_csrsW_wen_2, %true : i1
    %730 = comb.or %729, %637, %728 : i1
    %731 = comb.mux bin %730, %412, %io_csrsW_wdata_2 : i64
    %732 = comb.extract %io_csrsW_wdata_2 from 1 {sv.namehint = "_mepc_T_4"} : (i64) -> i63
    %733 = comb.concat %732, %false {sv.namehint = "_mepc_T_5"} : i63, i1
    %734 = comb.icmp bin ne %io_csrsW_wcsr_2, %c833_i12 : i12
    %735 = comb.xor %io_csrsW_wen_2, %true : i1
    %736 = comb.or %735, %637, %734 : i1
    %737 = comb.mux bin %736, %418, %733 : i64
    %738 = comb.extract %io_csrsW_wdata_2 from 63 {sv.namehint = "_mcause_T_6"} : (i64) -> i1
    %739 = comb.extract %io_csrsW_wdata_2 from 0 {sv.namehint = "_mcause_T_7"} : (i64) -> i4
    %740 = comb.concat %738, %739 {sv.namehint = "_mcause_T_8"} : i1, i4
    %741 = comb.icmp bin ne %io_csrsW_wcsr_2, %c834_i12 : i12
    %742 = comb.xor %io_csrsW_wen_2, %true : i1
    %743 = comb.or %742, %637, %741 : i1
    %744 = comb.mux bin %743, %425, %740 : i5
    %745 = comb.icmp bin ne %io_csrsW_wcsr_2, %c835_i12 : i12
    %746 = comb.xor %io_csrsW_wen_2, %true : i1
    %747 = comb.or %746, %637, %745 : i1
    %748 = comb.mux bin %747, %429, %io_csrsW_wdata_2 : i64
    %749 = comb.icmp bin eq %io_csrsW_wcsr_2, %c256_i12 : i12
    %750 = comb.extract %io_csrsW_wdata_2 from 0 {sv.namehint = "mstatus_6_UIE"} : (i64) -> i1
    %751 = comb.extract %io_csrsW_wdata_2 from 1 {sv.namehint = "mstatus_6_SIE"} : (i64) -> i1
    %752 = comb.extract %io_csrsW_wdata_2 from 4 {sv.namehint = "mstatus_6_UPIE"} : (i64) -> i1
    %753 = comb.extract %io_csrsW_wdata_2 from 5 {sv.namehint = "mstatus_6_SPIE"} : (i64) -> i1
    %754 = comb.extract %io_csrsW_wdata_2 from 8 {sv.namehint = "mstatus_6_SPP"} : (i64) -> i1
    %755 = comb.extract %io_csrsW_wdata_2 from 13 {sv.namehint = "mstatus_6_FS"} : (i64) -> i2
    %756 = comb.extract %io_csrsW_wdata_2 from 17 {sv.namehint = "mstatus_6_MPRV"} : (i64) -> i1
    %757 = comb.extract %io_csrsW_wdata_2 from 18 {sv.namehint = "mstatus_6_SUM"} : (i64) -> i1
    %758 = comb.extract %io_csrsW_wdata_2 from 19 {sv.namehint = "mstatus_6_MXR"} : (i64) -> i1
    %759 = comb.mux bin %749, %758, %652 : i1
    %760 = comb.xor %io_csrsW_wen_2, %true : i1
    %761 = comb.or %760, %637 : i1
    %762 = comb.mux bin %761, %443, %759 : i1
    %763 = comb.mux bin %749, %757, %653 : i1
    %764 = comb.xor %io_csrsW_wen_2, %true : i1
    %765 = comb.or %764, %637 : i1
    %766 = comb.mux bin %765, %447, %763 : i1
    %767 = comb.mux bin %749, %756, %654 : i1
    %768 = comb.xor %io_csrsW_wen_2, %true : i1
    %769 = comb.or %768, %637 : i1
    %770 = comb.mux bin %769, %451, %767 : i1
    %771 = comb.mux bin %749, %mstatus_MPP, %657 : i2
    %772 = comb.xor %io_csrsW_wen_2, %true : i1
    %773 = comb.or %772, %637 : i1
    %774 = comb.mux bin %773, %455, %771 : i2
    %775 = comb.mux bin %749, %754, %658 : i1
    %776 = comb.xor %io_csrsW_wen_2, %true : i1
    %777 = comb.or %776, %637 : i1
    %778 = comb.mux bin %777, %459, %775 : i1
    %779 = comb.mux bin %749, %mstatus_MPIE, %659 : i1
    %780 = comb.xor %io_csrsW_wen_2, %true : i1
    %781 = comb.or %780, %637 : i1
    %782 = comb.mux bin %781, %463, %779 : i1
    %783 = comb.mux bin %749, %753, %660 : i1
    %784 = comb.xor %io_csrsW_wen_2, %true : i1
    %785 = comb.or %784, %637 : i1
    %786 = comb.mux bin %785, %467, %783 : i1
    %787 = comb.mux bin %749, %752, %661 : i1
    %788 = comb.xor %io_csrsW_wen_2, %true : i1
    %789 = comb.or %788, %637 : i1
    %790 = comb.mux bin %789, %471, %787 : i1
    %791 = comb.mux bin %749, %mstatus_MIE, %662 : i1
    %792 = comb.xor %io_csrsW_wen_2, %true : i1
    %793 = comb.or %792, %637 : i1
    %794 = comb.mux bin %793, %475, %791 : i1
    %795 = comb.mux bin %749, %751, %663 : i1
    %796 = comb.xor %io_csrsW_wen_2, %true : i1
    %797 = comb.or %796, %637 : i1
    %798 = comb.mux bin %797, %479, %795 : i1
    %799 = comb.mux bin %749, %750, %664 : i1
    %800 = comb.xor %io_csrsW_wen_2, %true : i1
    %801 = comb.or %800, %637 : i1
    %802 = comb.mux bin %801, %483, %799 : i1
    %803 = comb.mux bin %749, %mstatus_TSR, %665 : i1
    %804 = comb.xor %io_csrsW_wen_2, %true : i1
    %805 = comb.or %804, %637 : i1
    %806 = comb.mux bin %805, %487, %803 : i1
    %807 = comb.mux bin %749, %755, %666 : i2
    %808 = comb.xor %io_csrsW_wen_2, %true : i1
    %809 = comb.or %808, %637 : i1
    %810 = comb.mux bin %809, %491, %807 : i2
    %811 = comb.icmp bin eq %755, %c-1_i2 {sv.namehint = "_mstatus_SD_T_5"} : i2
    %812 = comb.mux bin %749, %811, %668 : i1
    %813 = comb.xor %io_csrsW_wen_2, %true : i1
    %814 = comb.or %813, %637 : i1
    %815 = comb.mux bin %814, %496, %812 : i1
    %816 = comb.icmp bin eq %io_csrsW_wcsr_2, %c260_i12 : i12
    %817 = comb.extract %io_csrsW_wdata_2 from 0 {sv.namehint = "mie_6_USIE"} : (i64) -> i1
    %818 = comb.extract %io_csrsW_wdata_2 from 1 {sv.namehint = "mie_6_SSIE"} : (i64) -> i1
    %819 = comb.extract %io_csrsW_wdata_2 from 4 {sv.namehint = "mie_6_UTIE"} : (i64) -> i1
    %820 = comb.extract %io_csrsW_wdata_2 from 5 {sv.namehint = "mie_6_STIE"} : (i64) -> i1
    %821 = comb.extract %io_csrsW_wdata_2 from 8 {sv.namehint = "mie_6_UEIE"} : (i64) -> i1
    %822 = comb.extract %io_csrsW_wdata_2 from 9 {sv.namehint = "mie_6_SEIE"} : (i64) -> i1
    %823 = comb.mux bin %816, %mie_MEIE, %711 : i1
    %824 = comb.xor %io_csrsW_wen_2, %true : i1
    %825 = comb.or %824, %637 : i1
    %826 = comb.mux bin %825, %507, %823 : i1
    %827 = comb.mux bin %816, %mie_MSIE, %712 : i1
    %828 = comb.xor %io_csrsW_wen_2, %true : i1
    %829 = comb.or %828, %637 : i1
    %830 = comb.mux bin %829, %511, %827 : i1
    %831 = comb.mux bin %816, %mie_MTIE, %713 : i1
    %832 = comb.xor %io_csrsW_wen_2, %true : i1
    %833 = comb.or %832, %637 : i1
    %834 = comb.mux bin %833, %515, %831 : i1
    %835 = comb.mux bin %816, %822, %714 : i1
    %836 = comb.xor %io_csrsW_wen_2, %true : i1
    %837 = comb.or %836, %637 : i1
    %838 = comb.mux bin %837, %519, %835 : i1
    %839 = comb.mux bin %816, %818, %715 : i1
    %840 = comb.xor %io_csrsW_wen_2, %true : i1
    %841 = comb.or %840, %637 : i1
    %842 = comb.mux bin %841, %523, %839 : i1
    %843 = comb.mux bin %816, %820, %716 : i1
    %844 = comb.xor %io_csrsW_wen_2, %true : i1
    %845 = comb.or %844, %637 : i1
    %846 = comb.mux bin %845, %527, %843 : i1
    %847 = comb.mux bin %816, %821, %717 : i1
    %848 = comb.xor %io_csrsW_wen_2, %true : i1
    %849 = comb.or %848, %637 : i1
    %850 = comb.mux bin %849, %531, %847 : i1
    %851 = comb.mux bin %816, %817, %718 : i1
    %852 = comb.xor %io_csrsW_wen_2, %true : i1
    %853 = comb.or %852, %637 : i1
    %854 = comb.mux bin %853, %535, %851 : i1
    %855 = comb.mux bin %816, %819, %719 : i1
    %856 = comb.xor %io_csrsW_wen_2, %true : i1
    %857 = comb.or %856, %637 : i1
    %858 = comb.mux bin %857, %539, %855 : i1
    %859 = comb.extract %io_csrsW_wdata_2 from 2 {sv.namehint = "_stvec_T_14"} : (i64) -> i62
    %860 = comb.extract %io_csrsW_wdata_2 from 0 {sv.namehint = "_stvec_T_18"} : (i64) -> i2
    %861 = comb.extract %io_csrsW_wdata_2 from 1 {sv.namehint = "_stvec_T_16"} : (i64) -> i1
    %862 = comb.extract %stvec from 0 {sv.namehint = "_stvec_T_17"} : (i64) -> i2
    %863 = comb.mux bin %861, %862, %860 {sv.namehint = "_stvec_T_19"} : i2
    %864 = comb.concat %859, %863 {sv.namehint = "_stvec_T_20"} : i62, i2
    %865 = comb.icmp bin ne %io_csrsW_wcsr_2, %c261_i12 : i12
    %866 = comb.xor %io_csrsW_wen_2, %true : i1
    %867 = comb.or %866, %637, %865 : i1
    %868 = comb.mux bin %867, %549, %864 : i64
    %869 = comb.icmp bin ne %io_csrsW_wcsr_2, %c320_i12 : i12
    %870 = comb.xor %io_csrsW_wen_2, %true : i1
    %871 = comb.or %870, %637, %869 : i1
    %872 = comb.mux bin %871, %553, %io_csrsW_wdata_2 : i64
    %873 = comb.extract %io_csrsW_wdata_2 from 1 {sv.namehint = "_sepc_T_4"} : (i64) -> i63
    %874 = comb.concat %873, %false {sv.namehint = "_sepc_T_5"} : i63, i1
    %875 = comb.icmp bin ne %io_csrsW_wcsr_2, %c321_i12 : i12
    %876 = comb.xor %io_csrsW_wen_2, %true : i1
    %877 = comb.or %876, %637, %875 : i1
    %878 = comb.mux bin %877, %559, %874 : i64
    %879 = comb.extract %io_csrsW_wdata_2 from 63 {sv.namehint = "_scause_T_6"} : (i64) -> i1
    %880 = comb.extract %io_csrsW_wdata_2 from 0 {sv.namehint = "_scause_T_7"} : (i64) -> i4
    %881 = comb.concat %879, %880 {sv.namehint = "_scause_T_8"} : i1, i4
    %882 = comb.icmp bin ne %io_csrsW_wcsr_2, %c322_i12 : i12
    %883 = comb.xor %io_csrsW_wen_2, %true : i1
    %884 = comb.or %883, %637, %882 : i1
    %885 = comb.mux bin %884, %566, %881 : i5
    %886 = comb.icmp bin ne %io_csrsW_wcsr_2, %c323_i12 : i12
    %887 = comb.xor %io_csrsW_wen_2, %true : i1
    %888 = comb.or %887, %637, %886 : i1
    %889 = comb.mux bin %888, %570, %io_csrsW_wdata_2 : i64
    %890 = comb.icmp bin eq %io_csrsW_wcsr_2, %c324_i12 : i12
    %891 = comb.extract %io_csrsW_wdata_2 from 0 {sv.namehint = "smip_2_USIP"} : (i64) -> i1
    %892 = comb.extract %io_csrsW_wdata_2 from 1 {sv.namehint = "smip_2_SSIP"} : (i64) -> i1
    %893 = comb.extract %io_csrsW_wdata_2 from 8 {sv.namehint = "smip_2_UEIP"} : (i64) -> i1
    %894 = comb.mux bin %890, %892, %690 : i1
    %895 = comb.xor %io_csrsW_wen_2, %true : i1
    %896 = comb.or %895, %637 : i1
    %897 = comb.mux bin %896, %578, %894 : i1
    %898 = comb.mux bin %890, %891, %696 : i1
    %899 = comb.xor %io_csrsW_wen_2, %true : i1
    %900 = comb.or %899, %637 : i1
    %901 = comb.mux bin %900, %582, %898 : i1
    %902 = comb.mux bin %890, %893, %695 : i1
    %903 = comb.xor %io_csrsW_wen_2, %true : i1
    %904 = comb.or %903, %637 : i1
    %905 = comb.mux bin %904, %586, %902 : i1
    %906 = comb.icmp bin eq %io_csrsW_wcsr_2, %c384_i12 : i12
    %907 = comb.extract %io_csrsW_wdata_2 from 60 : (i64) -> i3
    %908 = comb.icmp bin eq %907, %c0_i3 : i3
    %909 = comb.extract %io_csrsW_wdata_2 from 63 : (i64) -> i1
    %910 = comb.and bin %906, %908 : i1
    %911 = comb.xor %910, %true : i1
    %912 = comb.xor %io_csrsW_wen_2, %true : i1
    %913 = comb.or %912, %637, %911 : i1
    %914 = comb.mux bin %913, %595, %909 : i1
    %915 = comb.extract %io_csrsW_wdata_2 from 0 : (i64) -> i44
    %916 = comb.xor %910, %true : i1
    %917 = comb.xor %io_csrsW_wen_2, %true : i1
    %918 = comb.or %917, %637, %916 : i1
    %919 = comb.mux bin %918, %600, %915 : i44
    %920 = comb.icmp bin eq %io_csrsW_wcsr_2, %c771_i12 : i12
    %921 = comb.extract %io_csrsW_wdata_2 from 0 {sv.namehint = "mideleg_3_USI"} : (i64) -> i1
    %922 = comb.extract %io_csrsW_wdata_2 from 1 {sv.namehint = "mideleg_3_SSI"} : (i64) -> i1
    %923 = comb.extract %io_csrsW_wdata_2 from 4 {sv.namehint = "mideleg_3_UTI"} : (i64) -> i1
    %924 = comb.extract %io_csrsW_wdata_2 from 5 {sv.namehint = "mideleg_3_STI"} : (i64) -> i1
    %925 = comb.extract %io_csrsW_wdata_2 from 8 {sv.namehint = "mideleg_3_UEI"} : (i64) -> i1
    %926 = comb.extract %io_csrsW_wdata_2 from 9 {sv.namehint = "mideleg_3_SEI"} : (i64) -> i1
    %927 = comb.xor %920, %true : i1
    %928 = comb.xor %io_csrsW_wen_2, %true : i1
    %929 = comb.or %928, %637, %927 : i1
    %930 = comb.mux bin %929, %611, %926 : i1
    %931 = comb.xor %920, %true : i1
    %932 = comb.xor %io_csrsW_wen_2, %true : i1
    %933 = comb.or %932, %637, %931 : i1
    %934 = comb.mux bin %933, %615, %922 : i1
    %935 = comb.xor %920, %true : i1
    %936 = comb.xor %io_csrsW_wen_2, %true : i1
    %937 = comb.or %936, %637, %935 : i1
    %938 = comb.mux bin %937, %619, %924 : i1
    %939 = comb.xor %920, %true : i1
    %940 = comb.xor %io_csrsW_wen_2, %true : i1
    %941 = comb.or %940, %637, %939 : i1
    %942 = comb.mux bin %941, %623, %925 : i1
    %943 = comb.xor %920, %true : i1
    %944 = comb.xor %io_csrsW_wen_2, %true : i1
    %945 = comb.or %944, %637, %943 : i1
    %946 = comb.mux bin %945, %627, %921 : i1
    %947 = comb.xor %920, %true : i1
    %948 = comb.xor %io_csrsW_wen_2, %true : i1
    %949 = comb.or %948, %637, %947 : i1
    %950 = comb.mux bin %949, %631, %923 : i1
    %951 = comb.icmp bin ne %io_csrsW_wcsr_2, %c770_i12 : i12
    %952 = comb.xor %io_csrsW_wen_2, %true : i1
    %953 = comb.or %952, %637, %951 : i1
    %954 = comb.mux bin %953, %635, %io_csrsW_wdata_2 : i64
    %955 = comb.extract %io_csrsW_wcsr_3 from 10 : (i12) -> i2
    %956 = comb.icmp bin eq %955, %c-1_i2 : i2
    %957 = comb.icmp bin eq %io_csrsW_wcsr_3, %c768_i12 : i12
    %958 = comb.extract %io_csrsW_wdata_3 from 0 {sv.namehint = "mstatus_7_UIE"} : (i64) -> i1
    %959 = comb.extract %io_csrsW_wdata_3 from 1 {sv.namehint = "mstatus_7_SIE"} : (i64) -> i1
    %960 = comb.extract %io_csrsW_wdata_3 from 3 {sv.namehint = "mstatus_7_MIE"} : (i64) -> i1
    %961 = comb.extract %io_csrsW_wdata_3 from 4 {sv.namehint = "mstatus_7_UPIE"} : (i64) -> i1
    %962 = comb.extract %io_csrsW_wdata_3 from 5 {sv.namehint = "mstatus_7_SPIE"} : (i64) -> i1
    %963 = comb.extract %io_csrsW_wdata_3 from 7 {sv.namehint = "mstatus_7_MPIE"} : (i64) -> i1
    %964 = comb.extract %io_csrsW_wdata_3 from 8 {sv.namehint = "mstatus_7_SPP"} : (i64) -> i1
    %965 = comb.extract %io_csrsW_wdata_3 from 11 {sv.namehint = "mstatus_7_MPP"} : (i64) -> i2
    %966 = comb.extract %io_csrsW_wdata_3 from 13 {sv.namehint = "mstatus_7_FS"} : (i64) -> i2
    %967 = comb.extract %io_csrsW_wdata_3 from 17 {sv.namehint = "mstatus_7_MPRV"} : (i64) -> i1
    %968 = comb.extract %io_csrsW_wdata_3 from 18 {sv.namehint = "mstatus_7_SUM"} : (i64) -> i1
    %969 = comb.extract %io_csrsW_wdata_3 from 19 {sv.namehint = "mstatus_7_MXR"} : (i64) -> i1
    %970 = comb.extract %io_csrsW_wdata_3 from 22 {sv.namehint = "mstatus_7_TSR"} : (i64) -> i1
    %971 = comb.mux bin %957, %969, %762 : i1
    %972 = comb.mux bin %957, %968, %766 : i1
    %973 = comb.mux bin %957, %967, %770 : i1
    %974 = comb.icmp bin eq %965, %c-2_i2 : i2
    %975 = comb.mux bin %974, %mstatus_MPP, %965 {sv.namehint = "_mstatus_MPP_T_13"} : i2
    %976 = comb.mux bin %957, %975, %774 : i2
    %977 = comb.mux bin %957, %964, %778 : i1
    %978 = comb.mux bin %957, %963, %782 : i1
    %979 = comb.mux bin %957, %962, %786 : i1
    %980 = comb.mux bin %957, %961, %790 : i1
    %981 = comb.mux bin %957, %960, %794 : i1
    %982 = comb.mux bin %957, %959, %798 : i1
    %983 = comb.mux bin %957, %958, %802 : i1
    %984 = comb.mux bin %957, %970, %806 : i1
    %985 = comb.mux bin %957, %966, %810 : i2
    %986 = comb.icmp bin eq %966, %c-1_i2 {sv.namehint = "_mstatus_SD_T_6"} : i2
    %987 = comb.mux bin %957, %986, %815 : i1
    %988 = comb.extract %io_csrsW_wdata_3 from 2 {sv.namehint = "_mtvec_T_18"} : (i64) -> i62
    %989 = comb.extract %io_csrsW_wdata_3 from 1 {sv.namehint = "_mtvec_T_19"} : (i64) -> i1
    %990 = comb.extract %mtvec from 0 {sv.namehint = "_mtvec_T_20"} : (i64) -> i2
    %991 = comb.extract %io_csrsW_wdata_3 from 0 {sv.namehint = "_mtvec_T_21"} : (i64) -> i2
    %992 = comb.mux bin %989, %990, %991 {sv.namehint = "_mtvec_T_22"} : i2
    %993 = comb.concat %988, %992 {sv.namehint = "_mtvec_T_23"} : i62, i2
    %994 = comb.icmp bin ne %io_csrsW_wcsr_3, %c773_i12 : i12
    %995 = comb.xor %io_csrsW_wen_3, %true : i1
    %996 = comb.or %995, %956, %994 : i1
    %997 = comb.mux bin %996, %678, %993 : i64
    %998 = comb.icmp bin eq %io_csrsW_wcsr_3, %c836_i12 : i12
    %999 = comb.extract %io_csrsW_wdata_3 from 0 {sv.namehint = "mip_4_USIP"} : (i64) -> i1
    %1000 = comb.extract %io_csrsW_wdata_3 from 1 {sv.namehint = "mip_4_SSIP"} : (i64) -> i1
    %1001 = comb.extract %io_csrsW_wdata_3 from 4 {sv.namehint = "mip_4_UTIP"} : (i64) -> i1
    %1002 = comb.extract %io_csrsW_wdata_3 from 5 {sv.namehint = "mip_4_STIP"} : (i64) -> i1
    %1003 = comb.extract %io_csrsW_wdata_3 from 8 {sv.namehint = "mip_4_UEIP"} : (i64) -> i1
    %1004 = comb.extract %io_csrsW_wdata_3 from 9 {sv.namehint = "mip_4_SEIP"} : (i64) -> i1
    %1005 = comb.xor %998, %true : i1
    %1006 = comb.xor %io_csrsW_wen_3, %true : i1
    %1007 = comb.or %1006, %956, %1005 : i1
    %1008 = comb.mux bin %1007, %689, %1004 : i1
    %1009 = comb.mux bin %998, %1000, %897 : i1
    %1010 = comb.xor %998, %true : i1
    %1011 = comb.xor %io_csrsW_wen_3, %true : i1
    %1012 = comb.or %1011, %956, %1010 : i1
    %1013 = comb.mux bin %1012, %694, %1002 : i1
    %1014 = comb.mux bin %998, %1003, %905 : i1
    %1015 = comb.mux bin %998, %999, %901 : i1
    %1016 = comb.xor %998, %true : i1
    %1017 = comb.xor %io_csrsW_wen_3, %true : i1
    %1018 = comb.or %1017, %956, %1016 : i1
    %1019 = comb.mux bin %1018, %700, %1001 : i1
    %1020 = comb.icmp bin eq %io_csrsW_wcsr_3, %c772_i12 : i12
    %1021 = comb.extract %io_csrsW_wdata_3 from 0 {sv.namehint = "mie_7_USIE"} : (i64) -> i1
    %1022 = comb.extract %io_csrsW_wdata_3 from 1 {sv.namehint = "mie_7_SSIE"} : (i64) -> i1
    %1023 = comb.extract %io_csrsW_wdata_3 from 3 {sv.namehint = "mie_7_MSIE"} : (i64) -> i1
    %1024 = comb.extract %io_csrsW_wdata_3 from 4 {sv.namehint = "mie_7_UTIE"} : (i64) -> i1
    %1025 = comb.extract %io_csrsW_wdata_3 from 5 {sv.namehint = "mie_7_STIE"} : (i64) -> i1
    %1026 = comb.extract %io_csrsW_wdata_3 from 7 {sv.namehint = "mie_7_MTIE"} : (i64) -> i1
    %1027 = comb.extract %io_csrsW_wdata_3 from 8 {sv.namehint = "mie_7_UEIE"} : (i64) -> i1
    %1028 = comb.extract %io_csrsW_wdata_3 from 9 {sv.namehint = "mie_7_SEIE"} : (i64) -> i1
    %1029 = comb.extract %io_csrsW_wdata_3 from 11 {sv.namehint = "mie_7_MEIE"} : (i64) -> i1
    %1030 = comb.mux bin %1020, %1029, %826 : i1
    %1031 = comb.mux bin %1020, %1023, %830 : i1
    %1032 = comb.mux bin %1020, %1026, %834 : i1
    %1033 = comb.mux bin %1020, %1028, %838 : i1
    %1034 = comb.mux bin %1020, %1022, %842 : i1
    %1035 = comb.mux bin %1020, %1025, %846 : i1
    %1036 = comb.mux bin %1020, %1027, %850 : i1
    %1037 = comb.mux bin %1020, %1021, %854 : i1
    %1038 = comb.mux bin %1020, %1024, %858 : i1
    %1039 = comb.icmp bin ne %io_csrsW_wcsr_3, %c-1280_i12 : i12
    %1040 = comb.xor %io_csrsW_wen_3, %true : i1
    %1041 = comb.or %1040, %956, %1039 : i1
    %1042 = comb.mux bin %1041, %723, %io_csrsW_wdata_3 : i64
    %1043 = comb.icmp bin ne %io_csrsW_wcsr_3, %c-1278_i12 : i12
    %1044 = comb.xor %io_csrsW_wen_3, %true : i1
    %1045 = comb.or %1044, %956, %1043 : i1
    %1046 = comb.mux bin %1045, %727, %io_csrsW_wdata_3 : i64
    %1047 = comb.icmp bin ne %io_csrsW_wcsr_3, %c832_i12 : i12
    %1048 = comb.xor %io_csrsW_wen_3, %true : i1
    %1049 = comb.or %1048, %956, %1047 : i1
    %1050 = comb.mux bin %1049, %731, %io_csrsW_wdata_3 : i64
    %1051 = comb.extract %io_csrsW_wdata_3 from 1 {sv.namehint = "_mepc_T_6"} : (i64) -> i63
    %1052 = comb.concat %1051, %false {sv.namehint = "_mepc_T_7"} : i63, i1
    %1053 = comb.icmp bin ne %io_csrsW_wcsr_3, %c833_i12 : i12
    %1054 = comb.xor %io_csrsW_wen_3, %true : i1
    %1055 = comb.or %1054, %956, %1053 : i1
    %1056 = comb.mux bin %1055, %737, %1052 : i64
    %1057 = comb.extract %io_csrsW_wdata_3 from 63 {sv.namehint = "_mcause_T_9"} : (i64) -> i1
    %1058 = comb.extract %io_csrsW_wdata_3 from 0 {sv.namehint = "_mcause_T_10"} : (i64) -> i4
    %1059 = comb.concat %1057, %1058 {sv.namehint = "_mcause_T_11"} : i1, i4
    %1060 = comb.icmp bin ne %io_csrsW_wcsr_3, %c834_i12 : i12
    %1061 = comb.xor %io_csrsW_wen_3, %true : i1
    %1062 = comb.or %1061, %956, %1060 : i1
    %1063 = comb.mux bin %1062, %744, %1059 : i5
    %1064 = comb.icmp bin ne %io_csrsW_wcsr_3, %c835_i12 : i12
    %1065 = comb.xor %io_csrsW_wen_3, %true : i1
    %1066 = comb.or %1065, %956, %1064 : i1
    %1067 = comb.mux bin %1066, %748, %io_csrsW_wdata_3 : i64
    %1068 = comb.icmp bin eq %io_csrsW_wcsr_3, %c256_i12 : i12
    %1069 = comb.extract %io_csrsW_wdata_3 from 0 {sv.namehint = "mstatus_8_UIE"} : (i64) -> i1
    %1070 = comb.extract %io_csrsW_wdata_3 from 1 {sv.namehint = "mstatus_8_SIE"} : (i64) -> i1
    %1071 = comb.extract %io_csrsW_wdata_3 from 4 {sv.namehint = "mstatus_8_UPIE"} : (i64) -> i1
    %1072 = comb.extract %io_csrsW_wdata_3 from 5 {sv.namehint = "mstatus_8_SPIE"} : (i64) -> i1
    %1073 = comb.extract %io_csrsW_wdata_3 from 8 {sv.namehint = "mstatus_8_SPP"} : (i64) -> i1
    %1074 = comb.extract %io_csrsW_wdata_3 from 13 {sv.namehint = "mstatus_8_FS"} : (i64) -> i2
    %1075 = comb.extract %io_csrsW_wdata_3 from 17 {sv.namehint = "mstatus_8_MPRV"} : (i64) -> i1
    %1076 = comb.extract %io_csrsW_wdata_3 from 18 {sv.namehint = "mstatus_8_SUM"} : (i64) -> i1
    %1077 = comb.extract %io_csrsW_wdata_3 from 19 {sv.namehint = "mstatus_8_MXR"} : (i64) -> i1
    %1078 = comb.mux bin %1068, %1077, %971 : i1
    %1079 = comb.xor %io_csrsW_wen_3, %true : i1
    %1080 = comb.or %1079, %956 : i1
    %1081 = comb.mux bin %1080, %762, %1078 : i1
    %1082 = comb.mux bin %1068, %1076, %972 : i1
    %1083 = comb.xor %io_csrsW_wen_3, %true : i1
    %1084 = comb.or %1083, %956 : i1
    %1085 = comb.mux bin %1084, %766, %1082 : i1
    %1086 = comb.mux bin %1068, %1075, %973 : i1
    %1087 = comb.xor %io_csrsW_wen_3, %true : i1
    %1088 = comb.or %1087, %956 : i1
    %1089 = comb.mux bin %1088, %770, %1086 : i1
    %1090 = comb.mux bin %1068, %mstatus_MPP, %976 : i2
    %1091 = comb.xor %io_csrsW_wen_3, %true : i1
    %1092 = comb.or %1091, %956 : i1
    %1093 = comb.mux bin %1092, %774, %1090 : i2
    %1094 = comb.mux bin %1068, %1073, %977 : i1
    %1095 = comb.xor %io_csrsW_wen_3, %true : i1
    %1096 = comb.or %1095, %956 : i1
    %1097 = comb.mux bin %1096, %778, %1094 : i1
    %1098 = comb.mux bin %1068, %mstatus_MPIE, %978 : i1
    %1099 = comb.xor %io_csrsW_wen_3, %true : i1
    %1100 = comb.or %1099, %956 : i1
    %1101 = comb.mux bin %1100, %782, %1098 : i1
    %1102 = comb.mux bin %1068, %1072, %979 : i1
    %1103 = comb.xor %io_csrsW_wen_3, %true : i1
    %1104 = comb.or %1103, %956 : i1
    %1105 = comb.mux bin %1104, %786, %1102 : i1
    %1106 = comb.mux bin %1068, %1071, %980 : i1
    %1107 = comb.xor %io_csrsW_wen_3, %true : i1
    %1108 = comb.or %1107, %956 : i1
    %1109 = comb.mux bin %1108, %790, %1106 : i1
    %1110 = comb.mux bin %1068, %mstatus_MIE, %981 : i1
    %1111 = comb.xor %io_csrsW_wen_3, %true : i1
    %1112 = comb.or %1111, %956 : i1
    %1113 = comb.mux bin %1112, %794, %1110 : i1
    %1114 = comb.mux bin %1068, %1070, %982 : i1
    %1115 = comb.xor %io_csrsW_wen_3, %true : i1
    %1116 = comb.or %1115, %956 : i1
    %1117 = comb.mux bin %1116, %798, %1114 : i1
    %1118 = comb.mux bin %1068, %1069, %983 : i1
    %1119 = comb.xor %io_csrsW_wen_3, %true : i1
    %1120 = comb.or %1119, %956 : i1
    %1121 = comb.mux bin %1120, %802, %1118 : i1
    %1122 = comb.mux bin %1068, %mstatus_TSR, %984 : i1
    %1123 = comb.xor %io_csrsW_wen_3, %true : i1
    %1124 = comb.or %1123, %956 : i1
    %1125 = comb.mux bin %1124, %806, %1122 : i1
    %1126 = comb.mux bin %1068, %1074, %985 : i2
    %1127 = comb.xor %io_csrsW_wen_3, %true : i1
    %1128 = comb.or %1127, %956 : i1
    %1129 = comb.mux bin %1128, %810, %1126 : i2
    %1130 = comb.icmp bin eq %1074, %c-1_i2 {sv.namehint = "_mstatus_SD_T_7"} : i2
    %1131 = comb.mux bin %1068, %1130, %987 : i1
    %1132 = comb.xor %io_csrsW_wen_3, %true : i1
    %1133 = comb.or %1132, %956 : i1
    %1134 = comb.mux bin %1133, %815, %1131 : i1
    %1135 = comb.icmp bin eq %io_csrsW_wcsr_3, %c260_i12 : i12
    %1136 = comb.extract %io_csrsW_wdata_3 from 0 {sv.namehint = "mie_8_USIE"} : (i64) -> i1
    %1137 = comb.extract %io_csrsW_wdata_3 from 1 {sv.namehint = "mie_8_SSIE"} : (i64) -> i1
    %1138 = comb.extract %io_csrsW_wdata_3 from 4 {sv.namehint = "mie_8_UTIE"} : (i64) -> i1
    %1139 = comb.extract %io_csrsW_wdata_3 from 5 {sv.namehint = "mie_8_STIE"} : (i64) -> i1
    %1140 = comb.extract %io_csrsW_wdata_3 from 8 {sv.namehint = "mie_8_UEIE"} : (i64) -> i1
    %1141 = comb.extract %io_csrsW_wdata_3 from 9 {sv.namehint = "mie_8_SEIE"} : (i64) -> i1
    %1142 = comb.mux bin %1135, %mie_MEIE, %1030 : i1
    %1143 = comb.xor %io_csrsW_wen_3, %true : i1
    %1144 = comb.or %1143, %956 : i1
    %1145 = comb.mux bin %1144, %826, %1142 : i1
    %1146 = comb.mux bin %1135, %mie_MSIE, %1031 : i1
    %1147 = comb.xor %io_csrsW_wen_3, %true : i1
    %1148 = comb.or %1147, %956 : i1
    %1149 = comb.mux bin %1148, %830, %1146 : i1
    %1150 = comb.mux bin %1135, %mie_MTIE, %1032 : i1
    %1151 = comb.xor %io_csrsW_wen_3, %true : i1
    %1152 = comb.or %1151, %956 : i1
    %1153 = comb.mux bin %1152, %834, %1150 : i1
    %1154 = comb.mux bin %1135, %1141, %1033 : i1
    %1155 = comb.xor %io_csrsW_wen_3, %true : i1
    %1156 = comb.or %1155, %956 : i1
    %1157 = comb.mux bin %1156, %838, %1154 : i1
    %1158 = comb.mux bin %1135, %1137, %1034 : i1
    %1159 = comb.xor %io_csrsW_wen_3, %true : i1
    %1160 = comb.or %1159, %956 : i1
    %1161 = comb.mux bin %1160, %842, %1158 : i1
    %1162 = comb.mux bin %1135, %1139, %1035 : i1
    %1163 = comb.xor %io_csrsW_wen_3, %true : i1
    %1164 = comb.or %1163, %956 : i1
    %1165 = comb.mux bin %1164, %846, %1162 : i1
    %1166 = comb.mux bin %1135, %1140, %1036 : i1
    %1167 = comb.xor %io_csrsW_wen_3, %true : i1
    %1168 = comb.or %1167, %956 : i1
    %1169 = comb.mux bin %1168, %850, %1166 : i1
    %1170 = comb.mux bin %1135, %1136, %1037 : i1
    %1171 = comb.xor %io_csrsW_wen_3, %true : i1
    %1172 = comb.or %1171, %956 : i1
    %1173 = comb.mux bin %1172, %854, %1170 : i1
    %1174 = comb.mux bin %1135, %1138, %1038 : i1
    %1175 = comb.xor %io_csrsW_wen_3, %true : i1
    %1176 = comb.or %1175, %956 : i1
    %1177 = comb.mux bin %1176, %858, %1174 : i1
    %1178 = comb.extract %io_csrsW_wdata_3 from 2 {sv.namehint = "_stvec_T_21"} : (i64) -> i62
    %1179 = comb.extract %io_csrsW_wdata_3 from 0 {sv.namehint = "_stvec_T_25"} : (i64) -> i2
    %1180 = comb.extract %io_csrsW_wdata_3 from 1 {sv.namehint = "_stvec_T_23"} : (i64) -> i1
    %1181 = comb.extract %stvec from 0 {sv.namehint = "_stvec_T_24"} : (i64) -> i2
    %1182 = comb.mux bin %1180, %1181, %1179 {sv.namehint = "_stvec_T_26"} : i2
    %1183 = comb.concat %1178, %1182 {sv.namehint = "_stvec_T_27"} : i62, i2
    %1184 = comb.icmp bin ne %io_csrsW_wcsr_3, %c261_i12 : i12
    %1185 = comb.xor %io_csrsW_wen_3, %true : i1
    %1186 = comb.or %1185, %956, %1184 : i1
    %1187 = comb.mux bin %1186, %868, %1183 : i64
    %1188 = comb.icmp bin ne %io_csrsW_wcsr_3, %c320_i12 : i12
    %1189 = comb.xor %io_csrsW_wen_3, %true : i1
    %1190 = comb.or %1189, %956, %1188 : i1
    %1191 = comb.mux bin %1190, %872, %io_csrsW_wdata_3 : i64
    %1192 = comb.extract %io_csrsW_wdata_3 from 1 {sv.namehint = "_sepc_T_6"} : (i64) -> i63
    %1193 = comb.concat %1192, %false {sv.namehint = "_sepc_T_7"} : i63, i1
    %1194 = comb.icmp bin ne %io_csrsW_wcsr_3, %c321_i12 : i12
    %1195 = comb.xor %io_csrsW_wen_3, %true : i1
    %1196 = comb.or %1195, %956, %1194 : i1
    %1197 = comb.mux bin %1196, %878, %1193 : i64
    %1198 = comb.extract %io_csrsW_wdata_3 from 63 {sv.namehint = "_scause_T_9"} : (i64) -> i1
    %1199 = comb.extract %io_csrsW_wdata_3 from 0 {sv.namehint = "_scause_T_10"} : (i64) -> i4
    %1200 = comb.concat %1198, %1199 {sv.namehint = "_scause_T_11"} : i1, i4
    %1201 = comb.icmp bin ne %io_csrsW_wcsr_3, %c322_i12 : i12
    %1202 = comb.xor %io_csrsW_wen_3, %true : i1
    %1203 = comb.or %1202, %956, %1201 : i1
    %1204 = comb.mux bin %1203, %885, %1200 : i5
    %1205 = comb.icmp bin ne %io_csrsW_wcsr_3, %c323_i12 : i12
    %1206 = comb.xor %io_csrsW_wen_3, %true : i1
    %1207 = comb.or %1206, %956, %1205 : i1
    %1208 = comb.mux bin %1207, %889, %io_csrsW_wdata_3 : i64
    %1209 = comb.icmp bin eq %io_csrsW_wcsr_3, %c324_i12 : i12
    %1210 = comb.extract %io_csrsW_wdata_3 from 0 {sv.namehint = "smip_3_USIP"} : (i64) -> i1
    %1211 = comb.extract %io_csrsW_wdata_3 from 1 {sv.namehint = "smip_3_SSIP"} : (i64) -> i1
    %1212 = comb.extract %io_csrsW_wdata_3 from 8 {sv.namehint = "smip_3_UEIP"} : (i64) -> i1
    %1213 = comb.mux bin %1209, %1211, %1009 : i1
    %1214 = comb.xor %io_csrsW_wen_3, %true : i1
    %1215 = comb.or %1214, %956 : i1
    %1216 = comb.mux bin %1215, %897, %1213 : i1
    %1217 = comb.mux bin %1209, %1210, %1015 : i1
    %1218 = comb.xor %io_csrsW_wen_3, %true : i1
    %1219 = comb.or %1218, %956 : i1
    %1220 = comb.mux bin %1219, %901, %1217 : i1
    %1221 = comb.mux bin %1209, %1212, %1014 : i1
    %1222 = comb.xor %io_csrsW_wen_3, %true : i1
    %1223 = comb.or %1222, %956 : i1
    %1224 = comb.mux bin %1223, %905, %1221 : i1
    %1225 = comb.icmp bin eq %io_csrsW_wcsr_3, %c384_i12 : i12
    %1226 = comb.extract %io_csrsW_wdata_3 from 60 : (i64) -> i3
    %1227 = comb.icmp bin eq %1226, %c0_i3 : i3
    %1228 = comb.extract %io_csrsW_wdata_3 from 63 : (i64) -> i1
    %1229 = comb.and bin %1225, %1227 : i1
    %1230 = comb.xor %1229, %true : i1
    %1231 = comb.xor %io_csrsW_wen_3, %true : i1
    %1232 = comb.or %1231, %956, %1230 : i1
    %1233 = comb.mux bin %1232, %914, %1228 : i1
    %1234 = comb.extract %io_csrsW_wdata_3 from 0 : (i64) -> i44
    %1235 = comb.xor %1229, %true : i1
    %1236 = comb.xor %io_csrsW_wen_3, %true : i1
    %1237 = comb.or %1236, %956, %1235 : i1
    %1238 = comb.mux bin %1237, %919, %1234 : i44
    %1239 = comb.icmp bin eq %io_csrsW_wcsr_3, %c771_i12 : i12
    %1240 = comb.extract %io_csrsW_wdata_3 from 0 {sv.namehint = "mideleg_4_USI"} : (i64) -> i1
    %1241 = comb.extract %io_csrsW_wdata_3 from 1 {sv.namehint = "mideleg_4_SSI"} : (i64) -> i1
    %1242 = comb.extract %io_csrsW_wdata_3 from 4 {sv.namehint = "mideleg_4_UTI"} : (i64) -> i1
    %1243 = comb.extract %io_csrsW_wdata_3 from 5 {sv.namehint = "mideleg_4_STI"} : (i64) -> i1
    %1244 = comb.extract %io_csrsW_wdata_3 from 8 {sv.namehint = "mideleg_4_UEI"} : (i64) -> i1
    %1245 = comb.extract %io_csrsW_wdata_3 from 9 {sv.namehint = "mideleg_4_SEI"} : (i64) -> i1
    %1246 = comb.xor %1239, %true : i1
    %1247 = comb.xor %io_csrsW_wen_3, %true : i1
    %1248 = comb.or %1247, %956, %1246 : i1
    %1249 = comb.mux bin %1248, %930, %1245 : i1
    %1250 = comb.xor %1239, %true : i1
    %1251 = comb.xor %io_csrsW_wen_3, %true : i1
    %1252 = comb.or %1251, %956, %1250 : i1
    %1253 = comb.mux bin %1252, %934, %1241 : i1
    %1254 = comb.xor %1239, %true : i1
    %1255 = comb.xor %io_csrsW_wen_3, %true : i1
    %1256 = comb.or %1255, %956, %1254 : i1
    %1257 = comb.mux bin %1256, %938, %1243 : i1
    %1258 = comb.xor %1239, %true : i1
    %1259 = comb.xor %io_csrsW_wen_3, %true : i1
    %1260 = comb.or %1259, %956, %1258 : i1
    %1261 = comb.mux bin %1260, %942, %1244 : i1
    %1262 = comb.xor %1239, %true : i1
    %1263 = comb.xor %io_csrsW_wen_3, %true : i1
    %1264 = comb.or %1263, %956, %1262 : i1
    %1265 = comb.mux bin %1264, %946, %1240 : i1
    %1266 = comb.xor %1239, %true : i1
    %1267 = comb.xor %io_csrsW_wen_3, %true : i1
    %1268 = comb.or %1267, %956, %1266 : i1
    %1269 = comb.mux bin %1268, %950, %1242 : i1
    %1270 = comb.icmp bin ne %io_csrsW_wcsr_3, %c770_i12 : i12
    %1271 = comb.xor %io_csrsW_wen_3, %true : i1
    %1272 = comb.or %1271, %956, %1270 : i1
    %1273 = comb.mux bin %1272, %954, %io_csrsW_wdata_3 : i64
    %1274 = comb.icmp bin eq %io_csrsR_0_rcsr, %c-239_i12 : i12
    %1275 = comb.icmp bin eq %io_csrsR_0_rcsr, %c-238_i12 : i12
    %1276 = comb.icmp bin eq %io_csrsR_0_rcsr, %c-237_i12 : i12
    %1277 = comb.icmp bin eq %io_csrsR_0_rcsr, %c-236_i12 : i12
    %1278 = comb.icmp bin ne %io_csrsR_0_rcsr, %c769_i12 : i12
    %1279 = comb.or %1277, %1276, %1275, %1274, %1278 : i1
    %1280 = comb.mux bin %1279, %c0_i64, %c-9223372036853460731_i64 : i64
    %1281 = comb.icmp bin eq %io_csrsR_0_rcsr, %c768_i12 : i12
    %1282 = comb.concat %mstatus_SD, %c5120_i40, %mstatus_TSR, %c0_i2, %mstatus_MXR, %mstatus_SUM, %mstatus_MPRV, %c0_i2, %mstatus_FS, %mstatus_MPP, %c0_i2, %mstatus_SPP, %mstatus_MPIE, %false, %mstatus_SPIE, %mstatus_UPIE, %mstatus_MIE, %false, %mstatus_SIE, %mstatus_UIE {sv.namehint = "_io_csrsR_0_rdata_T"} : i1, i40, i1, i2, i1, i1, i1, i2, i2, i2, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1283 = comb.mux bin %1281, %1282, %1280 : i64
    %1284 = comb.icmp bin eq %io_csrsR_0_rcsr, %c773_i12 : i12
    %1285 = comb.mux bin %1284, %mtvec, %1283 : i64
    %1286 = comb.icmp bin eq %io_csrsR_0_rcsr, %c836_i12 : i12
    %1287 = comb.or bin %mip_SEIP, %io_seip {sv.namehint = "io_csrsR_0_rdata_data_SEIP"} : i1
    %1288 = comb.concat %c0_i52, %io_meip, %false, %1287, %mip_UEIP, %io_mtip, %false, %mip_STIP, %mip_UTIP, %io_msip, %false, %mip_SSIP, %mip_USIP {sv.namehint = "_io_csrsR_0_rdata_T_1"} : i52, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1289 = comb.mux bin %1286, %1288, %1285 : i64
    %1290 = comb.icmp bin eq %io_csrsR_0_rcsr, %c772_i12 : i12
    %1291 = comb.concat %c0_i52, %mie_MEIE, %false, %mie_SEIE, %mie_UEIE, %mie_MTIE, %false, %mie_STIE, %mie_UTIE, %mie_MSIE, %false, %mie_SSIE, %mie_USIE {sv.namehint = "_io_csrsR_0_rdata_T_2"} : i52, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1292 = comb.mux bin %1290, %1291, %1289 : i64
    %1293 = comb.icmp bin eq %io_csrsR_0_rcsr, %c-1280_i12 : i12
    %1294 = comb.icmp bin eq %io_csrsR_0_rcsr, %c-1024_i12 : i12
    %1295 = comb.or bin %1293, %1294 : i1
    %1296 = comb.mux bin %1295, %mcycle, %1292 : i64
    %1297 = comb.icmp bin eq %io_csrsR_0_rcsr, %c-1278_i12 : i12
    %1298 = comb.icmp bin eq %io_csrsR_0_rcsr, %c-1022_i12 : i12
    %1299 = comb.or bin %1297, %1298 : i1
    %1300 = comb.mux bin %1299, %minstret, %1296 : i64
    %1301 = comb.icmp bin ugt %io_csrsR_0_rcsr, %c-1278_i12 : i12
    %1302 = comb.icmp bin ult %io_csrsR_0_rcsr, %c-1248_i12 : i12
    %1303 = comb.and bin %1301, %1302 : i1
    %1304 = comb.icmp bin ugt %io_csrsR_0_rcsr, %c802_i12 : i12
    %1305 = comb.icmp bin ult %io_csrsR_0_rcsr, %c832_i12 : i12
    %1306 = comb.and bin %1304, %1305 : i1
    %1307 = comb.icmp bin eq %io_csrsR_0_rcsr, %c774_i12 : i12
    %1308 = comb.icmp bin eq %io_csrsR_0_rcsr, %c800_i12 : i12
    %1309 = comb.or bin %1308, %1307, %1306, %1303 : i1
    %1310 = comb.mux bin %1309, %c0_i64, %1300 : i64
    %1311 = comb.icmp bin eq %io_csrsR_0_rcsr, %c832_i12 : i12
    %1312 = comb.mux bin %1311, %mscratch, %1310 : i64
    %1313 = comb.icmp bin eq %io_csrsR_0_rcsr, %c833_i12 : i12
    %1314 = comb.extract %mepc from 1 {sv.namehint = "_io_csrsR_0_rdata_T_3"} : (i64) -> i63
    %1315 = comb.concat %1314, %false {sv.namehint = "_io_csrsR_0_rdata_T_4"} : i63, i1
    %1316 = comb.mux bin %1313, %1315, %1312 : i64
    %1317 = comb.icmp bin eq %io_csrsR_0_rcsr, %c834_i12 : i12
    %1318 = comb.extract %mcause from 4 {sv.namehint = "_io_csrsR_0_rdata_T_5"} : (i5) -> i1
    %1319 = comb.extract %mcause from 0 {sv.namehint = "_io_csrsR_0_rdata_T_7"} : (i5) -> i4
    %1320 = comb.concat %1318, %c0_i59, %1319 {sv.namehint = "_io_csrsR_0_rdata_T_8"} : i1, i59, i4
    %1321 = comb.mux bin %1317, %1320, %1316 : i64
    %1322 = comb.icmp bin eq %io_csrsR_0_rcsr, %c835_i12 : i12
    %1323 = comb.mux bin %1322, %mtval, %1321 : i64
    %1324 = comb.icmp bin eq %io_csrsR_0_rcsr, %c256_i12 : i12
    %1325 = comb.concat %mstatus_SD, %c8192_i43, %mstatus_MXR, %mstatus_SUM, %c0_i3, %mstatus_FS, %c0_i4, %mstatus_SPP, %c0_i2, %mstatus_SPIE, %mstatus_UPIE, %c0_i2, %mstatus_SIE, %mstatus_UIE {sv.namehint = "_io_csrsR_0_rdata_T_24"} : i1, i43, i1, i1, i3, i2, i4, i1, i2, i1, i1, i2, i1, i1
    %1326 = comb.mux bin %1324, %1325, %1323 : i64
    %1327 = comb.icmp bin eq %io_csrsR_0_rcsr, %c260_i12 : i12
    %1328 = comb.concat %c0_i54, %mie_SEIE, %mie_UEIE, %c0_i2, %mie_STIE, %mie_UTIE, %c0_i2, %mie_SSIE, %mie_USIE {sv.namehint = "_io_csrsR_0_rdata_T_32"} : i54, i1, i1, i2, i1, i1, i2, i1, i1
    %1329 = comb.mux bin %1327, %1328, %1326 : i64
    %1330 = comb.icmp bin eq %io_csrsR_0_rcsr, %c261_i12 : i12
    %1331 = comb.mux bin %1330, %stvec, %1329 : i64
    %1332 = comb.icmp bin eq %io_csrsR_0_rcsr, %c262_i12 : i12
    %1333 = comb.mux bin %1332, %c0_i64, %1331 : i64
    %1334 = comb.icmp bin eq %io_csrsR_0_rcsr, %c320_i12 : i12
    %1335 = comb.mux bin %1334, %sscratch, %1333 : i64
    %1336 = comb.icmp bin eq %io_csrsR_0_rcsr, %c321_i12 : i12
    %1337 = comb.extract %sepc from 1 {sv.namehint = "_io_csrsR_0_rdata_T_33"} : (i64) -> i63
    %1338 = comb.concat %1337, %false {sv.namehint = "_io_csrsR_0_rdata_T_34"} : i63, i1
    %1339 = comb.mux bin %1336, %1338, %1335 : i64
    %1340 = comb.icmp bin eq %io_csrsR_0_rcsr, %c322_i12 : i12
    %1341 = comb.extract %scause from 4 {sv.namehint = "_io_csrsR_0_rdata_T_35"} : (i5) -> i1
    %1342 = comb.extract %scause from 0 {sv.namehint = "_io_csrsR_0_rdata_T_37"} : (i5) -> i4
    %1343 = comb.concat %1341, %c0_i59, %1342 {sv.namehint = "_io_csrsR_0_rdata_T_38"} : i1, i59, i4
    %1344 = comb.mux bin %1340, %1343, %1339 : i64
    %1345 = comb.icmp bin eq %io_csrsR_0_rcsr, %c323_i12 : i12
    %1346 = comb.mux bin %1345, %stval, %1344 : i64
    %1347 = comb.icmp bin eq %io_csrsR_0_rcsr, %c324_i12 : i12
    %1348 = comb.concat %c0_i54, %mip_SEIP, %mip_UEIP, %c0_i2, %mip_STIP, %mip_UTIP, %c0_i2, %mip_SSIP, %mip_USIP {sv.namehint = "_io_csrsR_0_rdata_T_46"} : i54, i1, i1, i2, i1, i1, i2, i1, i1
    %1349 = comb.mux bin %1347, %1348, %1346 : i64
    %1350 = comb.icmp bin eq %io_csrsR_0_rcsr, %c384_i12 : i12
    %1351 = comb.concat %REG_mode, %c0_i19, %REG_PPN {sv.namehint = "_io_csrsR_0_rdata_T_49"} : i1, i19, i44
    %1352 = comb.mux bin %1350, %1351, %1349 : i64
    %1353 = comb.icmp bin eq %io_csrsR_0_rcsr, %c771_i12 : i12
    %1354 = comb.concat %c0_i54, %mideleg_SEI, %mideleg_UEI, %c0_i2, %mideleg_STI, %mideleg_UTI, %c0_i2, %mideleg_SSI, %mideleg_USI {sv.namehint = "_io_csrsR_0_rdata_T_50"} : i54, i1, i1, i2, i1, i1, i2, i1, i1
    %1355 = comb.mux bin %1353, %1354, %1352 : i64
    %1356 = comb.icmp bin eq %io_csrsR_0_rcsr, %c770_i12 : i12
    %1357 = comb.mux bin %1356, %medeleg, %1355 : i64
    %1358 = comb.icmp bin eq %io_csrsR_0_rcsr, %c-1023_i12 : i12
    %1359 = comb.mux bin %1358, %io_mtime, %1357 {sv.namehint = "io_csrsR_0_rdata"} : i64
    %1360 = comb.concat %mstatus_SD, %c5120_i40, %mstatus_TSR, %c0_i2, %mstatus_MXR, %mstatus_SUM, %mstatus_MPRV, %c0_i2, %mstatus_FS, %mstatus_MPP, %c0_i2, %mstatus_SPP, %mstatus_MPIE, %false, %mstatus_SPIE, %mstatus_UPIE, %mstatus_MIE, %false, %mstatus_SIE, %mstatus_UIE {sv.namehint = "io_csrsR_1_rdata"} : i1, i40, i1, i2, i1, i1, i1, i2, i2, i2, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1361 = comb.concat %c0_i52, %mie_MEIE, %false, %mie_SEIE, %mie_UEIE, %mie_MTIE, %false, %mie_STIE, %mie_UTIE, %mie_MSIE, %false, %mie_SSIE, %mie_USIE {sv.namehint = "io_csrsR_2_rdata"} : i52, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1362 = comb.concat %c0_i54, %mideleg_SEI, %mideleg_UEI, %c0_i2, %mideleg_STI, %mideleg_UTI, %c0_i2, %mideleg_SSI, %mideleg_USI {sv.namehint = "io_csrsR_3_rdata"} : i54, i1, i1, i2, i1, i1, i2, i1, i1
    %1363 = comb.or bin %mip_SEIP, %io_seip {sv.namehint = "io_csrsR_7_rdata_data_SEIP"} : i1
    %1364 = comb.concat %c0_i52, %io_meip, %false, %1363, %mip_UEIP, %io_mtip, %false, %mip_STIP, %mip_UTIP, %io_msip, %false, %mip_SSIP, %mip_USIP {sv.namehint = "io_csrsR_7_rdata"} : i52, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1365 = comb.extract %mepc from 1 {sv.namehint = "_io_csrsR_8_rdata_T_3"} : (i64) -> i63
    %1366 = comb.concat %1365, %false {sv.namehint = "io_csrsR_8_rdata"} : i63, i1
    %1367 = comb.extract %sepc from 1 {sv.namehint = "_io_csrsR_9_rdata_T_33"} : (i64) -> i63
    %1368 = comb.concat %1367, %false {sv.namehint = "io_csrsR_9_rdata"} : i63, i1
    %1369 = comb.concat %mstatus_SD, %c5120_i40, %mstatus_TSR, %c0_i2, %mstatus_MXR, %mstatus_SUM, %mstatus_MPRV, %c0_i2, %mstatus_FS, %mstatus_MPP, %c0_i2, %mstatus_SPP, %mstatus_MPIE, %false, %mstatus_SPIE, %mstatus_UPIE, %mstatus_MIE, %false, %mstatus_SIE, %mstatus_UIE {sv.namehint = "io_mmuRead_0_rdata"} : i1, i40, i1, i2, i1, i1, i1, i2, i2, i2, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1370 = comb.concat %REG_mode, %c0_i19, %REG_PPN {sv.namehint = "io_mmuRead_1_rdata"} : i1, i19, i44
    %1371 = comb.concat %mstatus_SD, %c5120_i40, %mstatus_TSR, %c0_i2, %mstatus_MXR, %mstatus_SUM, %mstatus_MPRV, %c0_i2, %mstatus_FS, %mstatus_MPP, %c0_i2, %mstatus_SPP, %mstatus_MPIE, %false, %mstatus_SPIE, %mstatus_UPIE, %mstatus_MIE, %false, %mstatus_SIE, %mstatus_UIE {sv.namehint = "io_debug_mstatus"} : i1, i40, i1, i2, i1, i1, i1, i2, i2, i2, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1372 = comb.extract %mcause from 4 {sv.namehint = "_io_debug_mcause_T"} : (i5) -> i1
    %1373 = comb.extract %mcause from 0 {sv.namehint = "_io_debug_mcause_T_2"} : (i5) -> i4
    %1374 = comb.concat %1372, %c0_i59, %1373 {sv.namehint = "io_debug_mcause"} : i1, i59, i4
    %1375 = comb.concat %c0_i52, %mie_MEIE, %false, %mie_SEIE, %mie_UEIE, %mie_MTIE, %false, %mie_STIE, %mie_UTIE, %mie_MSIE, %false, %mie_SSIE, %mie_USIE {sv.namehint = "io_debug_mie"} : i52, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1376 = comb.extract %scause from 4 {sv.namehint = "_io_debug_scause_T"} : (i5) -> i1
    %1377 = comb.extract %scause from 0 {sv.namehint = "_io_debug_scause_T_2"} : (i5) -> i4
    %1378 = comb.concat %1376, %c0_i59, %1377 {sv.namehint = "io_debug_scause"} : i1, i59, i4
    hw.output %1359, %1360, %1361, %1362, %medeleg, %mtvec, %stvec, %1364, %1366, %1368, %1369, %1370, %currentPriv, %mip_SEIP, %mip_UEIP, %1371, %mepc, %sepc, %mtvec, %stvec, %1374, %1378, %mtval, %stval, %1375, %mscratch : i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i2, i1, i1, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64
  }
  hw.module private @Bypass(in %io_receive_raddr_0 : i5, in %io_receive_raddr_1 : i5, in %io_receive_raddr_2 : i5, out io_receive_rdata_0 : i64, out io_receive_rdata_1 : i64, out io_receive_rdata_2 : i64, in %io_rregs_1 : i64, in %io_rregs_2 : i64, in %io_rregs_3 : i64, in %io_rregs_4 : i64, in %io_rregs_5 : i64, in %io_rregs_6 : i64, in %io_rregs_7 : i64, in %io_rregs_8 : i64, in %io_rregs_9 : i64, in %io_rregs_10 : i64, in %io_rregs_11 : i64, in %io_rregs_12 : i64, in %io_rregs_13 : i64, in %io_rregs_14 : i64, in %io_rregs_15 : i64, in %io_rregs_16 : i64, in %io_rregs_17 : i64, in %io_rregs_18 : i64, in %io_rregs_19 : i64, in %io_rregs_20 : i64, in %io_rregs_21 : i64, in %io_rregs_22 : i64, in %io_rregs_23 : i64, in %io_rregs_24 : i64, in %io_rregs_25 : i64, in %io_rregs_26 : i64, in %io_rregs_27 : i64, in %io_rregs_28 : i64, in %io_rregs_29 : i64, in %io_rregs_30 : i64, in %io_rregs_31 : i64, in %io_instr : i32, in %io_idOut_valid : i1, in %io_idOut_index : i5, in %io_exOut_valid : i1, in %io_exOut_index : i5, in %io_exOut_value : i64, in %io_memOut_valid : i1, in %io_memOut_index : i5, in %io_memOut_value : i64, in %io_isLd : i1, in %io_isAmo : i1, out io_isWait : i1) {
    %c15_i5 = hw.constant 15 : i5
    %c14_i5 = hw.constant 14 : i5
    %c13_i5 = hw.constant 13 : i5
    %c12_i5 = hw.constant 12 : i5
    %c11_i5 = hw.constant 11 : i5
    %c10_i5 = hw.constant 10 : i5
    %c9_i5 = hw.constant 9 : i5
    %c8_i5 = hw.constant 8 : i5
    %c7_i5 = hw.constant 7 : i5
    %c6_i5 = hw.constant 6 : i5
    %c5_i5 = hw.constant 5 : i5
    %c4_i5 = hw.constant 4 : i5
    %c3_i5 = hw.constant 3 : i5
    %c2_i5 = hw.constant 2 : i5
    %c1_i5 = hw.constant 1 : i5
    %c-1_i5 = hw.constant -1 : i5
    %c0_i2 = hw.constant 0 : i2
    %c0_i3 = hw.constant 0 : i3
    %c0_i5 = hw.constant 0 : i5
    %c1_i2 = hw.constant 1 : i2
    %c-2_i2 = hw.constant -2 : i2
    %c-1_i2 = hw.constant -1 : i2
    %c-4_i3 = hw.constant -4 : i3
    %c-16_i5 = hw.constant -16 : i5
    %c-15_i5 = hw.constant -15 : i5
    %c-14_i5 = hw.constant -14 : i5
    %c-13_i5 = hw.constant -13 : i5
    %c-12_i5 = hw.constant -12 : i5
    %c-11_i5 = hw.constant -11 : i5
    %c-10_i5 = hw.constant -10 : i5
    %c-9_i5 = hw.constant -9 : i5
    %c-8_i5 = hw.constant -8 : i5
    %c-7_i5 = hw.constant -7 : i5
    %c-6_i5 = hw.constant -6 : i5
    %c-5_i5 = hw.constant -5 : i5
    %c-4_i5 = hw.constant -4 : i5
    %c-3_i5 = hw.constant -3 : i5
    %c-2_i5 = hw.constant -2 : i5
    %c0_i64 = hw.constant 0 : i64
    %0 = comb.extract %io_instr from 0 {sv.namehint = "insCmp"} : (i32) -> i2
    %1 = comb.extract %io_instr from 13 {sv.namehint = "insCF3"} : (i32) -> i3
    %2 = comb.extract %io_instr from 10 {sv.namehint = "insCF2"} : (i32) -> i2
    %3 = comb.extract %io_instr from 15 {sv.namehint = "insRs_0"} : (i32) -> i5
    %4 = comb.extract %io_instr from 20 {sv.namehint = "insRs_1"} : (i32) -> i5
    %5 = comb.extract %io_instr from 7 {sv.namehint = "insRsc_0"} : (i32) -> i5
    %6 = comb.extract %io_instr from 2 {sv.namehint = "insRsc_1"} : (i32) -> i5
    %7 = comb.extract %io_instr from 7 {sv.namehint = "_insRsp_T"} : (i32) -> i3
    %8 = comb.concat %c1_i2, %7 {sv.namehint = "insRsp_0"} : i2, i3
    %9 = comb.extract %io_instr from 2 {sv.namehint = "_insRsp_T_1"} : (i32) -> i3
    %10 = comb.concat %c1_i2, %9 {sv.namehint = "insRsp_1"} : i2, i3
    %11 = comb.icmp bin eq %io_exOut_index, %c0_i5 : i5
    %12 = comb.and bin %11, %io_exOut_valid : i1
    %13 = comb.icmp bin eq %io_memOut_index, %c0_i5 : i5
    %14 = comb.and bin %13, %io_memOut_valid : i1
    %15 = comb.mux bin %14, %io_memOut_value, %c0_i64 : i64
    %16 = comb.mux bin %12, %io_exOut_value, %15 : i64
    %17 = comb.mux bin %io_isAmo, %16, %c0_i64 {sv.namehint = "rregs_0"} : i64
    %18 = comb.icmp bin eq %io_exOut_index, %c1_i5 : i5
    %19 = comb.and bin %18, %io_exOut_valid : i1
    %20 = comb.icmp bin eq %io_memOut_index, %c1_i5 : i5
    %21 = comb.and bin %20, %io_memOut_valid : i1
    %22 = comb.mux bin %21, %io_memOut_value, %io_rregs_1 : i64
    %23 = comb.mux bin %19, %io_exOut_value, %22 {sv.namehint = "rregs_1"} : i64
    %24 = comb.icmp bin eq %io_exOut_index, %c2_i5 : i5
    %25 = comb.and bin %24, %io_exOut_valid : i1
    %26 = comb.icmp bin eq %io_memOut_index, %c2_i5 : i5
    %27 = comb.and bin %26, %io_memOut_valid : i1
    %28 = comb.mux bin %27, %io_memOut_value, %io_rregs_2 : i64
    %29 = comb.mux bin %25, %io_exOut_value, %28 {sv.namehint = "rregs_2"} : i64
    %30 = comb.icmp bin eq %io_exOut_index, %c3_i5 : i5
    %31 = comb.and bin %30, %io_exOut_valid : i1
    %32 = comb.icmp bin eq %io_memOut_index, %c3_i5 : i5
    %33 = comb.and bin %32, %io_memOut_valid : i1
    %34 = comb.mux bin %33, %io_memOut_value, %io_rregs_3 : i64
    %35 = comb.mux bin %31, %io_exOut_value, %34 {sv.namehint = "rregs_3"} : i64
    %36 = comb.icmp bin eq %io_exOut_index, %c4_i5 : i5
    %37 = comb.and bin %36, %io_exOut_valid : i1
    %38 = comb.icmp bin eq %io_memOut_index, %c4_i5 : i5
    %39 = comb.and bin %38, %io_memOut_valid : i1
    %40 = comb.mux bin %39, %io_memOut_value, %io_rregs_4 : i64
    %41 = comb.mux bin %37, %io_exOut_value, %40 {sv.namehint = "rregs_4"} : i64
    %42 = comb.icmp bin eq %io_exOut_index, %c5_i5 : i5
    %43 = comb.and bin %42, %io_exOut_valid : i1
    %44 = comb.icmp bin eq %io_memOut_index, %c5_i5 : i5
    %45 = comb.and bin %44, %io_memOut_valid : i1
    %46 = comb.mux bin %45, %io_memOut_value, %io_rregs_5 : i64
    %47 = comb.mux bin %43, %io_exOut_value, %46 {sv.namehint = "rregs_5"} : i64
    %48 = comb.icmp bin eq %io_exOut_index, %c6_i5 : i5
    %49 = comb.and bin %48, %io_exOut_valid : i1
    %50 = comb.icmp bin eq %io_memOut_index, %c6_i5 : i5
    %51 = comb.and bin %50, %io_memOut_valid : i1
    %52 = comb.mux bin %51, %io_memOut_value, %io_rregs_6 : i64
    %53 = comb.mux bin %49, %io_exOut_value, %52 {sv.namehint = "rregs_6"} : i64
    %54 = comb.icmp bin eq %io_exOut_index, %c7_i5 : i5
    %55 = comb.and bin %54, %io_exOut_valid : i1
    %56 = comb.icmp bin eq %io_memOut_index, %c7_i5 : i5
    %57 = comb.and bin %56, %io_memOut_valid : i1
    %58 = comb.mux bin %57, %io_memOut_value, %io_rregs_7 : i64
    %59 = comb.mux bin %55, %io_exOut_value, %58 {sv.namehint = "rregs_7"} : i64
    %60 = comb.icmp bin eq %io_exOut_index, %c8_i5 : i5
    %61 = comb.and bin %60, %io_exOut_valid : i1
    %62 = comb.icmp bin eq %io_memOut_index, %c8_i5 : i5
    %63 = comb.and bin %62, %io_memOut_valid : i1
    %64 = comb.mux bin %63, %io_memOut_value, %io_rregs_8 : i64
    %65 = comb.mux bin %61, %io_exOut_value, %64 {sv.namehint = "rregs_8"} : i64
    %66 = comb.icmp bin eq %io_exOut_index, %c9_i5 : i5
    %67 = comb.and bin %66, %io_exOut_valid : i1
    %68 = comb.icmp bin eq %io_memOut_index, %c9_i5 : i5
    %69 = comb.and bin %68, %io_memOut_valid : i1
    %70 = comb.mux bin %69, %io_memOut_value, %io_rregs_9 : i64
    %71 = comb.mux bin %67, %io_exOut_value, %70 {sv.namehint = "rregs_9"} : i64
    %72 = comb.icmp bin eq %io_exOut_index, %c10_i5 : i5
    %73 = comb.and bin %72, %io_exOut_valid : i1
    %74 = comb.icmp bin eq %io_memOut_index, %c10_i5 : i5
    %75 = comb.and bin %74, %io_memOut_valid : i1
    %76 = comb.mux bin %75, %io_memOut_value, %io_rregs_10 : i64
    %77 = comb.mux bin %73, %io_exOut_value, %76 {sv.namehint = "rregs_10"} : i64
    %78 = comb.icmp bin eq %io_exOut_index, %c11_i5 : i5
    %79 = comb.and bin %78, %io_exOut_valid : i1
    %80 = comb.icmp bin eq %io_memOut_index, %c11_i5 : i5
    %81 = comb.and bin %80, %io_memOut_valid : i1
    %82 = comb.mux bin %81, %io_memOut_value, %io_rregs_11 : i64
    %83 = comb.mux bin %79, %io_exOut_value, %82 {sv.namehint = "rregs_11"} : i64
    %84 = comb.icmp bin eq %io_exOut_index, %c12_i5 : i5
    %85 = comb.and bin %84, %io_exOut_valid : i1
    %86 = comb.icmp bin eq %io_memOut_index, %c12_i5 : i5
    %87 = comb.and bin %86, %io_memOut_valid : i1
    %88 = comb.mux bin %87, %io_memOut_value, %io_rregs_12 : i64
    %89 = comb.mux bin %85, %io_exOut_value, %88 {sv.namehint = "rregs_12"} : i64
    %90 = comb.icmp bin eq %io_exOut_index, %c13_i5 : i5
    %91 = comb.and bin %90, %io_exOut_valid : i1
    %92 = comb.icmp bin eq %io_memOut_index, %c13_i5 : i5
    %93 = comb.and bin %92, %io_memOut_valid : i1
    %94 = comb.mux bin %93, %io_memOut_value, %io_rregs_13 : i64
    %95 = comb.mux bin %91, %io_exOut_value, %94 {sv.namehint = "rregs_13"} : i64
    %96 = comb.icmp bin eq %io_exOut_index, %c14_i5 : i5
    %97 = comb.and bin %96, %io_exOut_valid : i1
    %98 = comb.icmp bin eq %io_memOut_index, %c14_i5 : i5
    %99 = comb.and bin %98, %io_memOut_valid : i1
    %100 = comb.mux bin %99, %io_memOut_value, %io_rregs_14 : i64
    %101 = comb.mux bin %97, %io_exOut_value, %100 {sv.namehint = "rregs_14"} : i64
    %102 = comb.icmp bin eq %io_exOut_index, %c15_i5 : i5
    %103 = comb.and bin %102, %io_exOut_valid : i1
    %104 = comb.icmp bin eq %io_memOut_index, %c15_i5 : i5
    %105 = comb.and bin %104, %io_memOut_valid : i1
    %106 = comb.mux bin %105, %io_memOut_value, %io_rregs_15 : i64
    %107 = comb.mux bin %103, %io_exOut_value, %106 {sv.namehint = "rregs_15"} : i64
    %108 = comb.icmp bin eq %io_exOut_index, %c-16_i5 : i5
    %109 = comb.and bin %108, %io_exOut_valid : i1
    %110 = comb.icmp bin eq %io_memOut_index, %c-16_i5 : i5
    %111 = comb.and bin %110, %io_memOut_valid : i1
    %112 = comb.mux bin %111, %io_memOut_value, %io_rregs_16 : i64
    %113 = comb.mux bin %109, %io_exOut_value, %112 {sv.namehint = "rregs_16"} : i64
    %114 = comb.icmp bin eq %io_exOut_index, %c-15_i5 : i5
    %115 = comb.and bin %114, %io_exOut_valid : i1
    %116 = comb.icmp bin eq %io_memOut_index, %c-15_i5 : i5
    %117 = comb.and bin %116, %io_memOut_valid : i1
    %118 = comb.mux bin %117, %io_memOut_value, %io_rregs_17 : i64
    %119 = comb.mux bin %115, %io_exOut_value, %118 {sv.namehint = "rregs_17"} : i64
    %120 = comb.icmp bin eq %io_exOut_index, %c-14_i5 : i5
    %121 = comb.and bin %120, %io_exOut_valid : i1
    %122 = comb.icmp bin eq %io_memOut_index, %c-14_i5 : i5
    %123 = comb.and bin %122, %io_memOut_valid : i1
    %124 = comb.mux bin %123, %io_memOut_value, %io_rregs_18 : i64
    %125 = comb.mux bin %121, %io_exOut_value, %124 {sv.namehint = "rregs_18"} : i64
    %126 = comb.icmp bin eq %io_exOut_index, %c-13_i5 : i5
    %127 = comb.and bin %126, %io_exOut_valid : i1
    %128 = comb.icmp bin eq %io_memOut_index, %c-13_i5 : i5
    %129 = comb.and bin %128, %io_memOut_valid : i1
    %130 = comb.mux bin %129, %io_memOut_value, %io_rregs_19 : i64
    %131 = comb.mux bin %127, %io_exOut_value, %130 {sv.namehint = "rregs_19"} : i64
    %132 = comb.icmp bin eq %io_exOut_index, %c-12_i5 : i5
    %133 = comb.and bin %132, %io_exOut_valid : i1
    %134 = comb.icmp bin eq %io_memOut_index, %c-12_i5 : i5
    %135 = comb.and bin %134, %io_memOut_valid : i1
    %136 = comb.mux bin %135, %io_memOut_value, %io_rregs_20 : i64
    %137 = comb.mux bin %133, %io_exOut_value, %136 {sv.namehint = "rregs_20"} : i64
    %138 = comb.icmp bin eq %io_exOut_index, %c-11_i5 : i5
    %139 = comb.and bin %138, %io_exOut_valid : i1
    %140 = comb.icmp bin eq %io_memOut_index, %c-11_i5 : i5
    %141 = comb.and bin %140, %io_memOut_valid : i1
    %142 = comb.mux bin %141, %io_memOut_value, %io_rregs_21 : i64
    %143 = comb.mux bin %139, %io_exOut_value, %142 {sv.namehint = "rregs_21"} : i64
    %144 = comb.icmp bin eq %io_exOut_index, %c-10_i5 : i5
    %145 = comb.and bin %144, %io_exOut_valid : i1
    %146 = comb.icmp bin eq %io_memOut_index, %c-10_i5 : i5
    %147 = comb.and bin %146, %io_memOut_valid : i1
    %148 = comb.mux bin %147, %io_memOut_value, %io_rregs_22 : i64
    %149 = comb.mux bin %145, %io_exOut_value, %148 {sv.namehint = "rregs_22"} : i64
    %150 = comb.icmp bin eq %io_exOut_index, %c-9_i5 : i5
    %151 = comb.and bin %150, %io_exOut_valid : i1
    %152 = comb.icmp bin eq %io_memOut_index, %c-9_i5 : i5
    %153 = comb.and bin %152, %io_memOut_valid : i1
    %154 = comb.mux bin %153, %io_memOut_value, %io_rregs_23 : i64
    %155 = comb.mux bin %151, %io_exOut_value, %154 {sv.namehint = "rregs_23"} : i64
    %156 = comb.icmp bin eq %io_exOut_index, %c-8_i5 : i5
    %157 = comb.and bin %156, %io_exOut_valid : i1
    %158 = comb.icmp bin eq %io_memOut_index, %c-8_i5 : i5
    %159 = comb.and bin %158, %io_memOut_valid : i1
    %160 = comb.mux bin %159, %io_memOut_value, %io_rregs_24 : i64
    %161 = comb.mux bin %157, %io_exOut_value, %160 {sv.namehint = "rregs_24"} : i64
    %162 = comb.icmp bin eq %io_exOut_index, %c-7_i5 : i5
    %163 = comb.and bin %162, %io_exOut_valid : i1
    %164 = comb.icmp bin eq %io_memOut_index, %c-7_i5 : i5
    %165 = comb.and bin %164, %io_memOut_valid : i1
    %166 = comb.mux bin %165, %io_memOut_value, %io_rregs_25 : i64
    %167 = comb.mux bin %163, %io_exOut_value, %166 {sv.namehint = "rregs_25"} : i64
    %168 = comb.icmp bin eq %io_exOut_index, %c-6_i5 : i5
    %169 = comb.and bin %168, %io_exOut_valid : i1
    %170 = comb.icmp bin eq %io_memOut_index, %c-6_i5 : i5
    %171 = comb.and bin %170, %io_memOut_valid : i1
    %172 = comb.mux bin %171, %io_memOut_value, %io_rregs_26 : i64
    %173 = comb.mux bin %169, %io_exOut_value, %172 {sv.namehint = "rregs_26"} : i64
    %174 = comb.icmp bin eq %io_exOut_index, %c-5_i5 : i5
    %175 = comb.and bin %174, %io_exOut_valid : i1
    %176 = comb.icmp bin eq %io_memOut_index, %c-5_i5 : i5
    %177 = comb.and bin %176, %io_memOut_valid : i1
    %178 = comb.mux bin %177, %io_memOut_value, %io_rregs_27 : i64
    %179 = comb.mux bin %175, %io_exOut_value, %178 {sv.namehint = "rregs_27"} : i64
    %180 = comb.icmp bin eq %io_exOut_index, %c-4_i5 : i5
    %181 = comb.and bin %180, %io_exOut_valid : i1
    %182 = comb.icmp bin eq %io_memOut_index, %c-4_i5 : i5
    %183 = comb.and bin %182, %io_memOut_valid : i1
    %184 = comb.mux bin %183, %io_memOut_value, %io_rregs_28 : i64
    %185 = comb.mux bin %181, %io_exOut_value, %184 {sv.namehint = "rregs_28"} : i64
    %186 = comb.icmp bin eq %io_exOut_index, %c-3_i5 : i5
    %187 = comb.and bin %186, %io_exOut_valid : i1
    %188 = comb.icmp bin eq %io_memOut_index, %c-3_i5 : i5
    %189 = comb.and bin %188, %io_memOut_valid : i1
    %190 = comb.mux bin %189, %io_memOut_value, %io_rregs_29 : i64
    %191 = comb.mux bin %187, %io_exOut_value, %190 {sv.namehint = "rregs_29"} : i64
    %192 = comb.icmp bin eq %io_exOut_index, %c-2_i5 : i5
    %193 = comb.and bin %192, %io_exOut_valid : i1
    %194 = comb.icmp bin eq %io_memOut_index, %c-2_i5 : i5
    %195 = comb.and bin %194, %io_memOut_valid : i1
    %196 = comb.mux bin %195, %io_memOut_value, %io_rregs_30 : i64
    %197 = comb.mux bin %193, %io_exOut_value, %196 {sv.namehint = "rregs_30"} : i64
    %198 = comb.icmp bin eq %io_exOut_index, %c-1_i5 : i5
    %199 = comb.and bin %198, %io_exOut_valid : i1
    %200 = comb.icmp bin eq %io_memOut_index, %c-1_i5 : i5
    %201 = comb.and bin %200, %io_memOut_valid : i1
    %202 = comb.mux bin %201, %io_memOut_value, %io_rregs_31 : i64
    %203 = comb.mux bin %199, %io_exOut_value, %202 {sv.namehint = "rregs_31"} : i64
    %204 = hw.array_create %203, %197, %191, %185, %179, %173, %167, %161, %155, %149, %143, %137, %131, %125, %119, %113, %107, %101, %95, %89, %83, %77, %71, %65, %59, %53, %47, %41, %35, %29, %23, %17 : i64
    %205 = hw.array_get %204[%io_receive_raddr_0] {sv.namehint = "io_receive_rdata_0"} : !hw.array<32xi64>, i5
    %206 = hw.array_get %204[%io_receive_raddr_1] {sv.namehint = "io_receive_rdata_1"} : !hw.array<32xi64>, i5
    %207 = hw.array_get %204[%io_receive_raddr_2] {sv.namehint = "io_receive_rdata_2"} : !hw.array<32xi64>, i5
    %208 = comb.icmp bin eq %0, %c-1_i2 : i2
    %209 = comb.icmp bin ne %3, %c0_i5 : i5
    %210 = comb.or bin %209, %io_isAmo : i1
    %211 = comb.icmp bin eq %3, %io_idOut_index : i5
    %212 = comb.and bin %211, %io_idOut_valid : i1
    %213 = comb.icmp bin eq %3, %io_exOut_index : i5
    %214 = comb.and bin %213, %io_exOut_valid, %io_isLd : i1
    %215 = comb.or bin %212, %214 : i1
    %216 = comb.and bin %210, %215 : i1
    %217 = comb.icmp bin ne %4, %c0_i5 : i5
    %218 = comb.or bin %217, %io_isAmo : i1
    %219 = comb.icmp bin eq %4, %io_idOut_index : i5
    %220 = comb.and bin %219, %io_idOut_valid : i1
    %221 = comb.icmp bin eq %4, %io_exOut_index : i5
    %222 = comb.and bin %221, %io_exOut_valid, %io_isLd : i1
    %223 = comb.or bin %220, %222 : i1
    %224 = comb.and bin %218, %223 : i1
    %225 = comb.or %224, %216 : i1
    %226 = comb.and %208, %225 : i1
    %227 = comb.icmp bin eq %0, %c0_i2 : i2
    %228 = comb.icmp bin eq %1, %c0_i3 : i3
    %229 = comb.icmp bin eq %io_idOut_index, %c2_i5 : i5
    %230 = comb.and bin %229, %io_idOut_valid : i1
    %231 = comb.and bin %25, %io_isLd : i1
    %232 = comb.or bin %230, %231 : i1
    %233 = comb.or %232, %226 : i1
    %234 = comb.extract %io_instr from 15 : (i32) -> i1
    %235 = comb.icmp bin eq %8, %io_idOut_index : i5
    %236 = comb.and bin %235, %io_idOut_valid : i1
    %237 = comb.icmp bin eq %8, %io_exOut_index : i5
    %238 = comb.and bin %237, %io_exOut_valid, %io_isLd : i1
    %239 = comb.or bin %236, %238 : i1
    %240 = comb.or %239, %226 : i1
    %241 = comb.icmp bin eq %10, %io_idOut_index : i5
    %242 = comb.and bin %241, %io_idOut_valid : i1
    %243 = comb.icmp bin eq %10, %io_exOut_index : i5
    %244 = comb.and bin %243, %io_exOut_valid, %io_isLd : i1
    %245 = comb.or bin %242, %244, %239 : i1
    %246 = comb.or %245, %226 : i1
    %247 = comb.mux bin %234, %246, %240 : i1
    %248 = comb.mux bin %228, %233, %247 : i1
    %249 = comb.mux bin %227, %248, %226 : i1
    %250 = comb.icmp bin eq %0, %c1_i2 : i2
    %251 = comb.icmp bin ne %5, %c0_i5 : i5
    %252 = comb.or bin %251, %io_isAmo : i1
    %253 = comb.icmp bin eq %5, %io_idOut_index : i5
    %254 = comb.and bin %253, %io_idOut_valid : i1
    %255 = comb.icmp bin eq %5, %io_exOut_index : i5
    %256 = comb.and bin %255, %io_exOut_valid, %io_isLd : i1
    %257 = comb.or bin %254, %256 : i1
    %258 = comb.and bin %252, %257 : i1
    %259 = comb.or %258, %249 : i1
    %260 = comb.icmp bin eq %1, %c-4_i3 : i3
    %261 = comb.icmp bin eq %2, %c-1_i2 : i2
    %262 = comb.or %245, %249 : i1
    %263 = comb.or %239, %249 : i1
    %264 = comb.mux bin %261, %262, %263 : i1
    %265 = comb.extract %io_instr from 14 : (i32) -> i2
    %266 = comb.icmp bin eq %265, %c-1_i2 : i2
    %267 = comb.and bin %266, %239 : i1
    %268 = comb.or %267, %249 : i1
    %269 = comb.mux bin %260, %264, %268 : i1
    %270 = comb.mux bin %234, %269, %259 : i1
    %271 = comb.mux bin %250, %270, %249 : i1
    %272 = comb.icmp bin eq %0, %c-2_i2 : i2
    %273 = comb.extract %io_instr from 14 : (i32) -> i1
    %274 = comb.or %232, %271 : i1
    %275 = comb.icmp bin ne %6, %c0_i5 : i5
    %276 = comb.or bin %275, %io_isAmo : i1
    %277 = comb.icmp bin eq %6, %io_idOut_index : i5
    %278 = comb.and bin %277, %io_idOut_valid : i1
    %279 = comb.icmp bin eq %6, %io_exOut_index : i5
    %280 = comb.and bin %279, %io_exOut_valid, %io_isLd : i1
    %281 = comb.or bin %278, %280 : i1
    %282 = comb.and bin %276, %281 : i1
    %283 = comb.or %282, %232, %271 : i1
    %284 = comb.mux bin %234, %283, %274 : i1
    %285 = comb.mux bin %273, %284, %271 : i1
    %286 = comb.and bin %260, %275, %282 : i1
    %287 = comb.or %286, %285 : i1
    %288 = comb.extract %io_instr from 13 : (i32) -> i2
    %289 = comb.icmp bin eq %288, %c0_i2 : i2
    %290 = comb.and bin %289, %251 : i1
    %291 = comb.or %258, %286, %285 : i1
    %292 = comb.mux bin %290, %291, %287 : i1
    %293 = comb.mux bin %272, %292, %271 : i1
    %294 = comb.icmp bin eq %io_idOut_index, %io_exOut_index : i5
    %295 = comb.and bin %294, %io_exOut_valid, %io_isLd : i1
    %296 = comb.or bin %io_idOut_valid, %295 : i1
    %297 = comb.and bin %io_isAmo, %296 : i1
    %298 = comb.or %297, %293 {sv.namehint = "io_isWait"} : i1
    hw.output %205, %206, %207, %298 : i64, i64, i64, i1
  }
  hw.module private @BypassCsr(in %io_idIO_bits_isWcsr : i1, in %io_idIO_bits_special : i5, in %io_idIO_bits_isPriv : i1, in %io_idIO_bits_isSatp : i1, in %io_idIO_valid : i1, in %io_exIO_bits_isWcsr : i1, in %io_exIO_bits_isPriv : i1, in %io_exIO_bits_isSatp : i1, in %io_exIO_valid : i1, in %io_memIO_bits_isWcsr : i1, in %io_memIO_bits_isPriv : i1, in %io_memIO_bits_isSatp : i1, in %io_memIO_valid : i1, out io_isWait : i1, out io_isPriv : i1, out io_isSatp : i1) {
    %true = hw.constant true
    %c8_i5 = hw.constant 8 : i5
    %0 = comb.xor bin %io_idIO_bits_isPriv, %true {sv.namehint = "_id_T"} : i1
    %1 = comb.xor bin %io_idIO_bits_isWcsr, %true {sv.namehint = "_id_T_1"} : i1
    %2 = comb.icmp bin ne %io_idIO_bits_special, %c8_i5 {sv.namehint = "_id_T_4"} : i5
    %3 = comb.and bin %0, %1, %2 {sv.namehint = "_id_T_5"} : i1
    %4 = comb.xor bin %io_idIO_valid, %true {sv.namehint = "_id_T_6"} : i1
    %5 = comb.or bin %3, %4 {sv.namehint = "id"} : i1
    %6 = comb.xor bin %io_exIO_bits_isPriv, %true {sv.namehint = "_ex_T"} : i1
    %7 = comb.xor bin %io_exIO_bits_isWcsr, %true {sv.namehint = "_ex_T_1"} : i1
    %8 = comb.and bin %6, %7 {sv.namehint = "_ex_T_2"} : i1
    %9 = comb.xor bin %io_exIO_valid, %true {sv.namehint = "_ex_T_3"} : i1
    %10 = comb.or bin %8, %9 {sv.namehint = "ex"} : i1
    %11 = comb.xor bin %io_memIO_bits_isPriv, %true {sv.namehint = "_mem_T"} : i1
    %12 = comb.xor bin %io_memIO_bits_isWcsr, %true {sv.namehint = "_mem_T_1"} : i1
    %13 = comb.and bin %11, %12 {sv.namehint = "_mem_T_2"} : i1
    %14 = comb.xor bin %io_memIO_valid, %true {sv.namehint = "_mem_T_3"} : i1
    %15 = comb.or bin %13, %14 {sv.namehint = "mem"} : i1
    %16 = comb.and bin %5, %10, %15 {sv.namehint = "_io_isWait_T_1"} : i1
    %17 = comb.xor bin %16, %true {sv.namehint = "io_isWait"} : i1
    %18 = comb.and bin %io_idIO_bits_isPriv, %io_idIO_valid {sv.namehint = "_io_isPriv_T"} : i1
    %19 = comb.and bin %io_exIO_bits_isPriv, %io_exIO_valid {sv.namehint = "_io_isPriv_T_1"} : i1
    %20 = comb.and bin %io_memIO_bits_isPriv, %io_memIO_valid {sv.namehint = "_io_isPriv_T_3"} : i1
    %21 = comb.or bin %18, %19, %20 {sv.namehint = "io_isPriv"} : i1
    %22 = comb.and bin %io_idIO_bits_isSatp, %io_idIO_valid {sv.namehint = "_io_isSatp_T"} : i1
    %23 = comb.and bin %io_exIO_bits_isSatp, %io_exIO_valid {sv.namehint = "_io_isSatp_T_1"} : i1
    %24 = comb.and bin %io_memIO_bits_isSatp, %io_memIO_valid {sv.namehint = "_io_isSatp_T_3"} : i1
    %25 = comb.or bin %22, %23, %24 {sv.namehint = "io_isSatp"} : i1
    hw.output %17, %21, %25 : i1, i1, i1
  }
  hw.module private @AXIRMux(in %clock : !seq.clock, in %reset : i1, out io_axiRaIn0_ready : i1, in %io_axiRaIn0_valid : i1, in %io_axiRaIn0_bits_addr : i32, in %io_axiRaIn0_bits_len : i8, in %io_axiRaIn0_bits_size : i3, out io_axiRaIn1_ready : i1, in %io_axiRaIn1_valid : i1, in %io_axiRaIn1_bits_addr : i32, in %io_axiRaIn1_bits_len : i8, in %io_axiRaIn1_bits_size : i3, in %io_axiRaOut_ready : i1, out io_axiRaOut_valid : i1, out io_axiRaOut_bits_addr : i32, out io_axiRaOut_bits_len : i8, out io_axiRaOut_bits_size : i3, out io_axiRdIn0_valid : i1, out io_axiRdIn0_bits_data : i64, out io_axiRdIn1_valid : i1, out io_axiRdIn1_bits_data : i64, in %io_axiRdOut_valid : i1, in %io_axiRdOut_bits_data : i64, in %io_axiRdOut_bits_last : i1) {
    %false = hw.constant false
    %c0_i64 = hw.constant 0 : i64
    %c0_i3 = hw.constant 0 : i3
    %c0_i8 = hw.constant 0 : i8
    %c0_i32 = hw.constant 0 : i32
    %true = hw.constant true
    %regState = seq.firreg %33 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64} : i1
    %rrID = seq.firreg %0 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64} : i1
    %0 = comb.xor bin %rrID, %true {sv.namehint = "_rrID_T"} : i1
    %regCurrentID = seq.firreg %11 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2 : ui64} : i1
    %1 = comb.xor bin %rrID, %true : i1
    %2 = comb.and bin %1, %io_axiRaIn0_valid : i1
    %3 = comb.or %2, %regState : i1
    %4 = comb.or %io_axiRaIn1_valid, %2, %regState : i1
    %5 = comb.mux bin %rrID, %4, %3 : i1
    %6 = comb.mux bin %regState, %regState, %5 {sv.namehint = "state"} : i1
    %7 = comb.and %rrID, %io_axiRaIn1_valid : i1
    %8 = comb.or %7, %2 : i1
    %9 = comb.xor %8, %true : i1
    %10 = comb.or %regState, %9 : i1
    %11 = comb.mux bin %10, %regCurrentID, %rrID : i1
    %12 = comb.mux bin %regState, %regCurrentID, %rrID {sv.namehint = "currentID"} : i1
    %13 = comb.xor bin %12, %true : i1
    %14 = comb.and bin %6, %13 : i1
    %15 = comb.and %14, %io_axiRaOut_ready {sv.namehint = "io_axiRaIn0_ready"} : i1
    %16 = comb.and %13, %io_axiRaIn0_valid : i1
    %17 = comb.and %14, %io_axiRdOut_valid {sv.namehint = "io_axiRdIn0_valid"} : i1
    %18 = comb.mux bin %14, %io_axiRdOut_bits_data, %c0_i64 {sv.namehint = "io_axiRdIn0_bits_data"} : i64
    %19 = comb.and bin %6, %12 : i1
    %20 = comb.and %19, %io_axiRaOut_ready {sv.namehint = "io_axiRaIn1_ready"} : i1
    %21 = comb.mux bin %12, %io_axiRaIn1_valid, %16 : i1
    %22 = comb.and %6, %21 {sv.namehint = "io_axiRaOut_valid"} : i1
    %23 = comb.mux bin %12, %io_axiRaIn1_bits_addr, %io_axiRaIn0_bits_addr : i32
    %24 = comb.mux bin %6, %23, %c0_i32 {sv.namehint = "io_axiRaOut_bits_addr"} : i32
    %25 = comb.mux bin %12, %io_axiRaIn1_bits_len, %io_axiRaIn0_bits_len : i8
    %26 = comb.mux bin %6, %25, %c0_i8 {sv.namehint = "io_axiRaOut_bits_len"} : i8
    %27 = comb.mux bin %12, %io_axiRaIn1_bits_size, %io_axiRaIn0_bits_size : i3
    %28 = comb.mux bin %6, %27, %c0_i3 {sv.namehint = "io_axiRaOut_bits_size"} : i3
    %29 = comb.and %19, %io_axiRdOut_valid {sv.namehint = "io_axiRdIn1_valid"} : i1
    %30 = comb.mux bin %19, %io_axiRdOut_bits_data, %c0_i64 {sv.namehint = "io_axiRdIn1_bits_data"} : i64
    %31 = comb.and bin %6, %io_axiRdOut_valid, %io_axiRdOut_bits_last : i1
    %32 = comb.xor %31, %true : i1
    %33 = comb.and %32, %6 : i1
    hw.output %15, %20, %22, %24, %26, %28, %17, %18, %29, %30 : i1, i1, i1, i32, i8, i3, i1, i64, i1, i64
  }
  hw.module private @DCacheMux(in %clock : !seq.clock, in %reset : i1, in %io_cpuIO_cpuReq_addr : i32, in %io_cpuIO_cpuReq_data : i64, in %io_cpuIO_cpuReq_size : i3, in %io_cpuIO_cpuReq_rw : i1, in %io_cpuIO_cpuReq_wmask : i8, in %io_cpuIO_cpuReq_valid : i1, in %io_cpuIO_cpuReq_revoke : i1, out io_cpuIO_cpuResult_data : i64, out io_cpuIO_cpuResult_ready : i1, in %io_dmaIO_cpuReq_addr : i32, in %io_dmaIO_cpuReq_data : i64, in %io_dmaIO_cpuReq_size : i3, in %io_dmaIO_cpuReq_rw : i1, in %io_dmaIO_cpuReq_wmask : i8, in %io_dmaIO_cpuReq_valid : i1, out io_dmaIO_cpuResult_data : i64, out io_dmaIO_cpuResult_ready : i1, out io_dcacheIO_cpuReq_addr : i32, out io_dcacheIO_cpuReq_data : i64, out io_dcacheIO_cpuReq_size : i3, out io_dcacheIO_cpuReq_rw : i1, out io_dcacheIO_cpuReq_wmask : i8, out io_dcacheIO_cpuReq_valid : i1, out io_dcacheIO_cpuReq_revoke : i1, in %io_dcacheIO_cpuResult_data : i64, in %io_dcacheIO_cpuResult_ready : i1) {
    %true = hw.constant true
    %c0_i64 = hw.constant 0 : i64
    %false = hw.constant false
    %current = seq.firreg %23 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64} : i1
    %state = seq.firreg %24 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64} : i1
    %0 = comb.xor bin %current, %true {sv.namehint = "_io_dcacheIO_cpuReq_T"} : i1
    %1 = comb.mux bin %current, %c0_i64, %io_dcacheIO_cpuResult_data {sv.namehint = "io_cpuIO_cpuResult_data"} : i64
    %2 = comb.and %0, %io_dcacheIO_cpuResult_ready {sv.namehint = "io_cpuIO_cpuResult_ready"} : i1
    %3 = comb.mux bin %current, %io_dcacheIO_cpuResult_data, %c0_i64 {sv.namehint = "io_dmaIO_cpuResult_data"} : i64
    %4 = comb.and %current, %io_dcacheIO_cpuResult_ready {sv.namehint = "io_dmaIO_cpuResult_ready"} : i1
    %5 = comb.and %0, %io_cpuIO_cpuReq_revoke {sv.namehint = "_io_dcacheIO_cpuReq_T_1_revoke"} : i1
    %6 = comb.xor bin %state, %true : i1
    %7 = comb.or bin %6, %io_dcacheIO_cpuResult_ready : i1
    %8 = comb.xor %io_dmaIO_cpuReq_valid, %true : i1
    %9 = comb.and %8, %io_cpuIO_cpuReq_revoke {sv.namehint = "_io_dcacheIO_cpuReq_T_2_revoke"} : i1
    %10 = comb.mux %7, %io_dmaIO_cpuReq_valid, %current : i1
    %11 = comb.mux bin %10, %io_dmaIO_cpuReq_addr, %io_cpuIO_cpuReq_addr {sv.namehint = "io_dcacheIO_cpuReq_addr"} : i32
    %12 = comb.mux %7, %io_dmaIO_cpuReq_valid, %current : i1
    %13 = comb.mux bin %12, %io_dmaIO_cpuReq_data, %io_cpuIO_cpuReq_data {sv.namehint = "io_dcacheIO_cpuReq_data"} : i64
    %14 = comb.mux %7, %io_dmaIO_cpuReq_valid, %current : i1
    %15 = comb.mux bin %14, %io_dmaIO_cpuReq_size, %io_cpuIO_cpuReq_size {sv.namehint = "io_dcacheIO_cpuReq_size"} : i3
    %16 = comb.mux %7, %io_dmaIO_cpuReq_valid, %current : i1
    %17 = comb.mux bin %16, %io_dmaIO_cpuReq_rw, %io_cpuIO_cpuReq_rw {sv.namehint = "io_dcacheIO_cpuReq_rw"} : i1
    %18 = comb.mux %7, %io_dmaIO_cpuReq_valid, %current : i1
    %19 = comb.mux bin %18, %io_dmaIO_cpuReq_wmask, %io_cpuIO_cpuReq_wmask {sv.namehint = "io_dcacheIO_cpuReq_wmask"} : i8
    %20 = comb.mux %7, %io_dmaIO_cpuReq_valid, %current : i1
    %21 = comb.mux bin %20, %io_dmaIO_cpuReq_valid, %io_cpuIO_cpuReq_valid {sv.namehint = "io_dcacheIO_cpuReq_valid"} : i1
    %22 = comb.mux bin %7, %9, %5 {sv.namehint = "io_dcacheIO_cpuReq_revoke"} : i1
    %23 = comb.mux bin %7, %io_dmaIO_cpuReq_valid, %current : i1
    %24 = comb.mux bin %7, %21, %state : i1
    hw.output %1, %2, %3, %4, %11, %13, %15, %17, %19, %21, %22 : i64, i1, i64, i1, i32, i64, i3, i1, i8, i1, i1
  }
  hw.module private @DMA(in %clock : !seq.clock, in %reset : i1, out io_cpuIO_cpuReq_addr : i32, out io_cpuIO_cpuReq_data : i64, out io_cpuIO_cpuReq_size : i3, out io_cpuIO_cpuReq_rw : i1, out io_cpuIO_cpuReq_wmask : i8, out io_cpuIO_cpuReq_valid : i1, in %io_cpuIO_cpuResult_data : i64, in %io_cpuIO_cpuResult_ready : i1, out io_memIO_aw_ready : i1, in %io_memIO_aw_valid : i1, in %io_memIO_aw_bits_id : i4, in %io_memIO_aw_bits_addr : i32, in %io_memIO_aw_bits_len : i8, in %io_memIO_aw_bits_size : i3, out io_memIO_ar_ready : i1, in %io_memIO_ar_valid : i1, in %io_memIO_ar_bits_id : i4, in %io_memIO_ar_bits_addr : i32, in %io_memIO_ar_bits_len : i8, in %io_memIO_ar_bits_size : i3, out io_memIO_w_ready : i1, in %io_memIO_w_valid : i1, in %io_memIO_w_bits_data : i64, in %io_memIO_w_bits_strb : i8, in %io_memIO_b_ready : i1, out io_memIO_b_valid : i1, out io_memIO_b_bits_id : i4, in %io_memIO_r_ready : i1, out io_memIO_r_valid : i1, out io_memIO_r_bits_id : i4, out io_memIO_r_bits_data : i64, out io_memIO_r_bits_last : i1) {
    %c-1_i8 = hw.constant -1 : i8
    %c0_i24 = hw.constant 0 : i24
    %0 = hw.aggregate_constant [-128 : i8, 64 : i8, 32 : i8, 16 : i8, 8 : i8, 4 : i8, 2 : i8, 1 : i8] : !hw.array<8xi8>
    %c0_i9 = hw.constant 0 : i9
    %true = hw.constant true
    %c0_i3 = hw.constant 0 : i3
    %c0_i8 = hw.constant 0 : i8
    %c0_i4 = hw.constant 0 : i4
    %c0_i32 = hw.constant 0 : i32
    %c0_i64 = hw.constant 0 : i64
    %false = hw.constant false
    %state = seq.firreg %97 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64} : i1
    %current = seq.firreg %101 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64, sv.namehint = "current"} : i1
    %reading = seq.firreg %59 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2 : ui64} : i1
    %writing = seq.firreg %99 clock %clock reset sync %reset, %false {firrtl.random_init_start = 3 : ui64} : i1
    %AWREADY = seq.firreg %91 clock %clock reset sync %reset, %true {firrtl.random_init_start = 4 : ui64, sv.namehint = "AWREADY"} : i1
    %WREADY = seq.firreg %83 clock %clock reset sync %reset, %false {firrtl.random_init_start = 5 : ui64, sv.namehint = "WREADY"} : i1
    %BVALID = seq.firreg %93 clock %clock reset sync %reset, %false {firrtl.random_init_start = 6 : ui64, sv.namehint = "BVALID"} : i1
    %ARREADY = seq.firreg %65 clock %clock reset sync %reset, %true {firrtl.random_init_start = 7 : ui64, sv.namehint = "ARREADY"} : i1
    %RVALID = seq.firreg %33 clock %clock reset sync %reset, %false {firrtl.random_init_start = 8 : ui64, sv.namehint = "RVALID"} : i1
    %ARSIZE = seq.firreg %66 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 9 : ui64} : i3
    %ARLEN = seq.firreg %67 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 12 : ui64} : i8
    %AWSIZE = seq.firreg %79 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 20 : ui64} : i3
    %AWLEN = seq.firreg %80 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 23 : ui64} : i8
    %RID = seq.firreg %60 clock %clock reset sync %reset, %c0_i4 {firrtl.random_init_start = 31 : ui64, sv.namehint = "RID"} : i4
    %BID = seq.firreg %75 clock %clock reset sync %reset, %c0_i4 {firrtl.random_init_start = 35 : ui64, sv.namehint = "BID"} : i4
    %ARADDR = seq.firreg %63 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 39 : ui64} : i32
    %AWADDR = seq.firreg %74 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 71 : ui64} : i32
    %RDATA = seq.firreg %16 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 103 : ui64, sv.namehint = "RDATA"} : i64
    %WDATA = seq.firreg %84 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 167 : ui64, sv.namehint = "WDATA"} : i64
    %WSTRB = seq.firreg %85 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 231 : ui64, sv.namehint = "WSTRB"} : i8
    %1 = comb.xor bin %current, %true {sv.namehint = "_io_cpuIO_cpuReq_size_T"} : i1
    %2 = comb.mux bin %current, %AWADDR, %ARADDR {sv.namehint = "io_cpuIO_cpuReq_addr"} : i32
    %3 = comb.xor bin %ARREADY, %true {sv.namehint = "_io_cpuIO_cpuReq_valid_T_2"} : i1
    %4 = comb.xor bin %RVALID, %true {sv.namehint = "_io_cpuIO_cpuReq_valid_T_3"} : i1
    %5 = comb.and bin %3, %4 {sv.namehint = "_io_cpuIO_cpuReq_valid_T_4"} : i1
    %6 = comb.xor bin %AWREADY, %true {sv.namehint = "_io_cpuIO_cpuReq_valid_T_5"} : i1
    %7 = comb.xor bin %WREADY, %true {sv.namehint = "_io_cpuIO_cpuReq_valid_T_6"} : i1
    %8 = comb.xor bin %BVALID, %true {sv.namehint = "_io_cpuIO_cpuReq_valid_T_8"} : i1
    %9 = comb.and bin %6, %7, %8 {sv.namehint = "_io_cpuIO_cpuReq_valid_T_9"} : i1
    %10 = comb.mux bin %current, %9, %5 {sv.namehint = "_io_cpuIO_cpuReq_valid_T_10"} : i1
    %11 = comb.mux bin %current, %AWSIZE, %ARSIZE {sv.namehint = "io_cpuIO_cpuReq_size"} : i3
    %12 = comb.xor %io_cpuIO_cpuResult_ready, %true : i1
    %13 = comb.and %12, %state, %10 {sv.namehint = "io_cpuIO_cpuReq_valid"} : i1
    %14 = comb.and bin %io_cpuIO_cpuResult_ready, %1 : i1
    %15 = comb.or %14, %RVALID : i1
    %16 = comb.mux bin %14, %io_cpuIO_cpuResult_data, %RDATA : i64
    %17 = comb.icmp bin ne %AWLEN, %c0_i8 : i8
    %18 = comb.and %io_cpuIO_cpuResult_ready, %current, %17 : i1
    %19 = hw.array_get %0[%AWSIZE] : !hw.array<8xi8>, i3
    %20 = comb.concat %c0_i24, %19 : i24, i8
    %21 = comb.add bin %AWADDR, %20 {sv.namehint = "_AWADDR_T"} : i32
    %22 = comb.and %io_cpuIO_cpuResult_ready, %current, %17 : i1
    %23 = comb.mux bin %22, %21, %AWADDR : i32
    %24 = comb.add %AWLEN, %c-1_i8 {sv.namehint = "_AWLEN_T"} : i8
    %25 = comb.and %io_cpuIO_cpuResult_ready, %current, %17 : i1
    %26 = comb.mux bin %25, %24, %AWLEN : i8
    %27 = comb.concat %1, %AWLEN : i1, i8
    %28 = comb.icmp bin eq %27, %c0_i9 : i9
    %29 = comb.and %io_cpuIO_cpuResult_ready, %28 : i1
    %30 = comb.or %29, %BVALID : i1
    %31 = comb.and bin %io_memIO_r_ready, %RVALID {sv.namehint = "_state_T_1"} : i1
    %32 = comb.xor %31, %true : i1
    %33 = comb.and %32, %15 : i1
    %34 = comb.icmp bin eq %ARLEN, %c0_i8 : i8
    %35 = comb.and bin %31, %34 : i1
    %36 = comb.or %35, %ARREADY : i1
    %37 = comb.and %31, %34 {sv.namehint = "io_memIO_r_bits_last"} : i1
    %38 = comb.mux bin %35, %writing, %state : i1
    %39 = comb.xor %35, %true : i1
    %40 = comb.and %39, %reading : i1
    %41 = comb.or %34, %current : i1
    %42 = hw.array_get %0[%ARSIZE] : !hw.array<8xi8>, i3
    %43 = comb.concat %c0_i24, %42 : i24, i8
    %44 = comb.add bin %ARADDR, %43 {sv.namehint = "_ARADDR_T"} : i32
    %45 = comb.xor %31, %true : i1
    %46 = comb.or %45, %34 : i1
    %47 = comb.mux bin %46, %ARADDR, %44 : i32
    %48 = comb.add %ARLEN, %c-1_i8 {sv.namehint = "_ARLEN_T"} : i8
    %49 = comb.xor %31, %true : i1
    %50 = comb.or %49, %34 : i1
    %51 = comb.mux bin %50, %ARLEN, %48 : i8
    %52 = comb.xor bin %io_memIO_r_ready, %true : i1
    %53 = comb.and bin %RVALID, %52, %io_memIO_w_valid, %1 : i1
    %54 = comb.or %53, %current : i1
    %55 = comb.mux bin %31, %41, %54 : i1
    %56 = comb.and bin %ARREADY, %io_memIO_ar_valid : i1
    %57 = comb.xor %56, %true : i1
    %58 = comb.and %57, %55 : i1
    %59 = comb.or %56, %40 : i1
    %60 = comb.mux bin %56, %io_memIO_ar_bits_id, %RID : i4
    %61 = comb.extract %io_memIO_ar_bits_addr from 3 {sv.namehint = "_ARADDR_T_2"} : (i32) -> i29
    %62 = comb.concat %61, %c0_i3 {sv.namehint = "_ARADDR_T_3"} : i29, i3
    %63 = comb.mux bin %56, %62, %47 : i32
    %64 = comb.xor %56, %true : i1
    %65 = comb.and %64, %36 : i1
    %66 = comb.mux bin %56, %io_memIO_ar_bits_size, %ARSIZE : i3
    %67 = comb.mux bin %56, %io_memIO_ar_bits_len, %51 : i8
    %68 = comb.and bin %AWREADY, %io_memIO_aw_valid : i1
    %69 = comb.or %68, %58 : i1
    %70 = comb.or %68, %56, %38 : i1
    %71 = comb.or %68, %writing : i1
    %72 = comb.extract %io_memIO_aw_bits_addr from 3 {sv.namehint = "_AWADDR_T_2"} : (i32) -> i29
    %73 = comb.concat %72, %c0_i3 {sv.namehint = "_AWADDR_T_3"} : i29, i3
    %74 = comb.mux bin %68, %73, %23 : i32
    %75 = comb.mux bin %68, %io_memIO_aw_bits_id, %BID : i4
    %76 = comb.xor %68, %true : i1
    %77 = comb.and %76, %AWREADY : i1
    %78 = comb.or %68, %18, %WREADY : i1
    %79 = comb.mux bin %68, %io_memIO_aw_bits_size, %AWSIZE : i3
    %80 = comb.mux bin %68, %io_memIO_aw_bits_len, %26 : i8
    %81 = comb.and bin %WREADY, %io_memIO_w_valid : i1
    %82 = comb.xor %81, %true : i1
    %83 = comb.and %82, %78 : i1
    %84 = comb.mux bin %81, %io_memIO_w_bits_data, %WDATA : i64
    %85 = comb.mux bin %81, %io_memIO_w_bits_strb, %WSTRB : i8
    %86 = comb.xor bin %io_memIO_w_valid, %true : i1
    %87 = comb.and bin %WREADY, %86, %io_memIO_r_ready, %current : i1
    %88 = comb.xor %87, %true : i1
    %89 = comb.or %81, %88 : i1
    %90 = comb.and bin %io_memIO_b_ready, %BVALID : i1
    %91 = comb.or %90, %77 : i1
    %92 = comb.xor %90, %true : i1
    %93 = comb.and %92, %30 : i1
    %94 = comb.and bin %31, %37 {sv.namehint = "_state_T_2"} : i1
    %95 = comb.xor bin %94, %true {sv.namehint = "_state_T_3"} : i1
    %96 = comb.and bin %reading, %95 {sv.namehint = "_state_T_5"} : i1
    %97 = comb.mux bin %90, %96, %70 : i1
    %98 = comb.xor %90, %true : i1
    %99 = comb.and %98, %71 : i1
    %100 = comb.xor %90, %true : i1
    %101 = comb.and %100, %89, %69 : i1
    hw.output %2, %WDATA, %11, %current, %WSTRB, %13, %AWREADY, %ARREADY, %WREADY, %BVALID, %BID, %RVALID, %RID, %RDATA, %37 : i32, i64, i3, i1, i8, i1, i1, i1, i1, i1, i4, i1, i4, i64, i1
  }
  hw.module private @MaximalPeriodGaloisLFSR(in %clock : !seq.clock, in %reset : i1, out io_out_0 : i1, out io_out_1 : i1) {
    %true = hw.constant true
    %false = hw.constant false
    %state_0 = seq.firreg %0 clock %clock reset sync %reset, %true {firrtl.random_init_start = 0 : ui64, sv.namehint = "state_0"} : i1
    %state_1 = seq.firreg %state_0 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64, sv.namehint = "state_1"} : i1
    %0 = comb.xor bin %state_1, %state_0 : i1
    hw.output %state_0, %state_1 : i1, i1
  }
  hw.module private @SyncReadReg(in %clock : !seq.clock, in %reset : i1, in %io_WEN : i1, in %io_A : i6, in %io_D : i1, in %io_RST : i1, out io_PQ : i1) {
    %true = hw.constant true
    %c-1_i6 = hw.constant -1 : i6
    %c0_i6 = hw.constant 0 : i6
    %c1_i6 = hw.constant 1 : i6
    %c2_i6 = hw.constant 2 : i6
    %c3_i6 = hw.constant 3 : i6
    %c4_i6 = hw.constant 4 : i6
    %c5_i6 = hw.constant 5 : i6
    %c6_i6 = hw.constant 6 : i6
    %c7_i6 = hw.constant 7 : i6
    %c8_i6 = hw.constant 8 : i6
    %c9_i6 = hw.constant 9 : i6
    %c10_i6 = hw.constant 10 : i6
    %c11_i6 = hw.constant 11 : i6
    %c12_i6 = hw.constant 12 : i6
    %c13_i6 = hw.constant 13 : i6
    %c14_i6 = hw.constant 14 : i6
    %c15_i6 = hw.constant 15 : i6
    %c16_i6 = hw.constant 16 : i6
    %c17_i6 = hw.constant 17 : i6
    %c18_i6 = hw.constant 18 : i6
    %c19_i6 = hw.constant 19 : i6
    %c20_i6 = hw.constant 20 : i6
    %c21_i6 = hw.constant 21 : i6
    %c22_i6 = hw.constant 22 : i6
    %c23_i6 = hw.constant 23 : i6
    %c24_i6 = hw.constant 24 : i6
    %c25_i6 = hw.constant 25 : i6
    %c26_i6 = hw.constant 26 : i6
    %c27_i6 = hw.constant 27 : i6
    %c28_i6 = hw.constant 28 : i6
    %c29_i6 = hw.constant 29 : i6
    %c30_i6 = hw.constant 30 : i6
    %c31_i6 = hw.constant 31 : i6
    %c-32_i6 = hw.constant -32 : i6
    %c-31_i6 = hw.constant -31 : i6
    %c-30_i6 = hw.constant -30 : i6
    %c-29_i6 = hw.constant -29 : i6
    %c-28_i6 = hw.constant -28 : i6
    %c-27_i6 = hw.constant -27 : i6
    %c-26_i6 = hw.constant -26 : i6
    %c-25_i6 = hw.constant -25 : i6
    %c-24_i6 = hw.constant -24 : i6
    %c-23_i6 = hw.constant -23 : i6
    %c-22_i6 = hw.constant -22 : i6
    %c-21_i6 = hw.constant -21 : i6
    %c-20_i6 = hw.constant -20 : i6
    %c-19_i6 = hw.constant -19 : i6
    %c-18_i6 = hw.constant -18 : i6
    %c-17_i6 = hw.constant -17 : i6
    %c-16_i6 = hw.constant -16 : i6
    %c-15_i6 = hw.constant -15 : i6
    %c-14_i6 = hw.constant -14 : i6
    %c-13_i6 = hw.constant -13 : i6
    %c-12_i6 = hw.constant -12 : i6
    %c-11_i6 = hw.constant -11 : i6
    %c-10_i6 = hw.constant -10 : i6
    %c-9_i6 = hw.constant -9 : i6
    %c-8_i6 = hw.constant -8 : i6
    %c-7_i6 = hw.constant -7 : i6
    %c-6_i6 = hw.constant -6 : i6
    %c-5_i6 = hw.constant -5 : i6
    %c-4_i6 = hw.constant -4 : i6
    %c-3_i6 = hw.constant -3 : i6
    %c-2_i6 = hw.constant -2 : i6
    %false = hw.constant false
    %sreg_0 = seq.firreg %193 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64} : i1
    %sreg_1 = seq.firreg %195 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64} : i1
    %sreg_2 = seq.firreg %197 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2 : ui64} : i1
    %sreg_3 = seq.firreg %199 clock %clock reset sync %reset, %false {firrtl.random_init_start = 3 : ui64} : i1
    %sreg_4 = seq.firreg %201 clock %clock reset sync %reset, %false {firrtl.random_init_start = 4 : ui64} : i1
    %sreg_5 = seq.firreg %203 clock %clock reset sync %reset, %false {firrtl.random_init_start = 5 : ui64} : i1
    %sreg_6 = seq.firreg %205 clock %clock reset sync %reset, %false {firrtl.random_init_start = 6 : ui64} : i1
    %sreg_7 = seq.firreg %207 clock %clock reset sync %reset, %false {firrtl.random_init_start = 7 : ui64} : i1
    %sreg_8 = seq.firreg %209 clock %clock reset sync %reset, %false {firrtl.random_init_start = 8 : ui64} : i1
    %sreg_9 = seq.firreg %211 clock %clock reset sync %reset, %false {firrtl.random_init_start = 9 : ui64} : i1
    %sreg_10 = seq.firreg %213 clock %clock reset sync %reset, %false {firrtl.random_init_start = 10 : ui64} : i1
    %sreg_11 = seq.firreg %215 clock %clock reset sync %reset, %false {firrtl.random_init_start = 11 : ui64} : i1
    %sreg_12 = seq.firreg %217 clock %clock reset sync %reset, %false {firrtl.random_init_start = 12 : ui64} : i1
    %sreg_13 = seq.firreg %219 clock %clock reset sync %reset, %false {firrtl.random_init_start = 13 : ui64} : i1
    %sreg_14 = seq.firreg %221 clock %clock reset sync %reset, %false {firrtl.random_init_start = 14 : ui64} : i1
    %sreg_15 = seq.firreg %223 clock %clock reset sync %reset, %false {firrtl.random_init_start = 15 : ui64} : i1
    %sreg_16 = seq.firreg %225 clock %clock reset sync %reset, %false {firrtl.random_init_start = 16 : ui64} : i1
    %sreg_17 = seq.firreg %227 clock %clock reset sync %reset, %false {firrtl.random_init_start = 17 : ui64} : i1
    %sreg_18 = seq.firreg %229 clock %clock reset sync %reset, %false {firrtl.random_init_start = 18 : ui64} : i1
    %sreg_19 = seq.firreg %231 clock %clock reset sync %reset, %false {firrtl.random_init_start = 19 : ui64} : i1
    %sreg_20 = seq.firreg %233 clock %clock reset sync %reset, %false {firrtl.random_init_start = 20 : ui64} : i1
    %sreg_21 = seq.firreg %235 clock %clock reset sync %reset, %false {firrtl.random_init_start = 21 : ui64} : i1
    %sreg_22 = seq.firreg %237 clock %clock reset sync %reset, %false {firrtl.random_init_start = 22 : ui64} : i1
    %sreg_23 = seq.firreg %239 clock %clock reset sync %reset, %false {firrtl.random_init_start = 23 : ui64} : i1
    %sreg_24 = seq.firreg %241 clock %clock reset sync %reset, %false {firrtl.random_init_start = 24 : ui64} : i1
    %sreg_25 = seq.firreg %243 clock %clock reset sync %reset, %false {firrtl.random_init_start = 25 : ui64} : i1
    %sreg_26 = seq.firreg %245 clock %clock reset sync %reset, %false {firrtl.random_init_start = 26 : ui64} : i1
    %sreg_27 = seq.firreg %247 clock %clock reset sync %reset, %false {firrtl.random_init_start = 27 : ui64} : i1
    %sreg_28 = seq.firreg %249 clock %clock reset sync %reset, %false {firrtl.random_init_start = 28 : ui64} : i1
    %sreg_29 = seq.firreg %251 clock %clock reset sync %reset, %false {firrtl.random_init_start = 29 : ui64} : i1
    %sreg_30 = seq.firreg %253 clock %clock reset sync %reset, %false {firrtl.random_init_start = 30 : ui64} : i1
    %sreg_31 = seq.firreg %255 clock %clock reset sync %reset, %false {firrtl.random_init_start = 31 : ui64} : i1
    %sreg_32 = seq.firreg %257 clock %clock reset sync %reset, %false {firrtl.random_init_start = 32 : ui64} : i1
    %sreg_33 = seq.firreg %259 clock %clock reset sync %reset, %false {firrtl.random_init_start = 33 : ui64} : i1
    %sreg_34 = seq.firreg %261 clock %clock reset sync %reset, %false {firrtl.random_init_start = 34 : ui64} : i1
    %sreg_35 = seq.firreg %263 clock %clock reset sync %reset, %false {firrtl.random_init_start = 35 : ui64} : i1
    %sreg_36 = seq.firreg %265 clock %clock reset sync %reset, %false {firrtl.random_init_start = 36 : ui64} : i1
    %sreg_37 = seq.firreg %267 clock %clock reset sync %reset, %false {firrtl.random_init_start = 37 : ui64} : i1
    %sreg_38 = seq.firreg %269 clock %clock reset sync %reset, %false {firrtl.random_init_start = 38 : ui64} : i1
    %sreg_39 = seq.firreg %271 clock %clock reset sync %reset, %false {firrtl.random_init_start = 39 : ui64} : i1
    %sreg_40 = seq.firreg %273 clock %clock reset sync %reset, %false {firrtl.random_init_start = 40 : ui64} : i1
    %sreg_41 = seq.firreg %275 clock %clock reset sync %reset, %false {firrtl.random_init_start = 41 : ui64} : i1
    %sreg_42 = seq.firreg %277 clock %clock reset sync %reset, %false {firrtl.random_init_start = 42 : ui64} : i1
    %sreg_43 = seq.firreg %279 clock %clock reset sync %reset, %false {firrtl.random_init_start = 43 : ui64} : i1
    %sreg_44 = seq.firreg %281 clock %clock reset sync %reset, %false {firrtl.random_init_start = 44 : ui64} : i1
    %sreg_45 = seq.firreg %283 clock %clock reset sync %reset, %false {firrtl.random_init_start = 45 : ui64} : i1
    %sreg_46 = seq.firreg %285 clock %clock reset sync %reset, %false {firrtl.random_init_start = 46 : ui64} : i1
    %sreg_47 = seq.firreg %287 clock %clock reset sync %reset, %false {firrtl.random_init_start = 47 : ui64} : i1
    %sreg_48 = seq.firreg %289 clock %clock reset sync %reset, %false {firrtl.random_init_start = 48 : ui64} : i1
    %sreg_49 = seq.firreg %291 clock %clock reset sync %reset, %false {firrtl.random_init_start = 49 : ui64} : i1
    %sreg_50 = seq.firreg %293 clock %clock reset sync %reset, %false {firrtl.random_init_start = 50 : ui64} : i1
    %sreg_51 = seq.firreg %295 clock %clock reset sync %reset, %false {firrtl.random_init_start = 51 : ui64} : i1
    %sreg_52 = seq.firreg %297 clock %clock reset sync %reset, %false {firrtl.random_init_start = 52 : ui64} : i1
    %sreg_53 = seq.firreg %299 clock %clock reset sync %reset, %false {firrtl.random_init_start = 53 : ui64} : i1
    %sreg_54 = seq.firreg %301 clock %clock reset sync %reset, %false {firrtl.random_init_start = 54 : ui64} : i1
    %sreg_55 = seq.firreg %303 clock %clock reset sync %reset, %false {firrtl.random_init_start = 55 : ui64} : i1
    %sreg_56 = seq.firreg %305 clock %clock reset sync %reset, %false {firrtl.random_init_start = 56 : ui64} : i1
    %sreg_57 = seq.firreg %307 clock %clock reset sync %reset, %false {firrtl.random_init_start = 57 : ui64} : i1
    %sreg_58 = seq.firreg %309 clock %clock reset sync %reset, %false {firrtl.random_init_start = 58 : ui64} : i1
    %sreg_59 = seq.firreg %311 clock %clock reset sync %reset, %false {firrtl.random_init_start = 59 : ui64} : i1
    %sreg_60 = seq.firreg %313 clock %clock reset sync %reset, %false {firrtl.random_init_start = 60 : ui64} : i1
    %sreg_61 = seq.firreg %315 clock %clock reset sync %reset, %false {firrtl.random_init_start = 61 : ui64} : i1
    %sreg_62 = seq.firreg %317 clock %clock reset sync %reset, %false {firrtl.random_init_start = 62 : ui64} : i1
    %sreg_63 = seq.firreg %319 clock %clock reset sync %reset, %false {firrtl.random_init_start = 63 : ui64} : i1
    %0 = comb.icmp bin eq %io_A, %c0_i6 : i6
    %1 = comb.and bin %io_WEN, %0 : i1
    %2 = comb.mux bin %1, %io_D, %sreg_0 : i1
    %3 = comb.icmp bin eq %io_A, %c1_i6 : i6
    %4 = comb.and bin %io_WEN, %3 : i1
    %5 = comb.mux bin %4, %io_D, %sreg_1 : i1
    %6 = comb.icmp bin eq %io_A, %c2_i6 : i6
    %7 = comb.and bin %io_WEN, %6 : i1
    %8 = comb.mux bin %7, %io_D, %sreg_2 : i1
    %9 = comb.icmp bin eq %io_A, %c3_i6 : i6
    %10 = comb.and bin %io_WEN, %9 : i1
    %11 = comb.mux bin %10, %io_D, %sreg_3 : i1
    %12 = comb.icmp bin eq %io_A, %c4_i6 : i6
    %13 = comb.and bin %io_WEN, %12 : i1
    %14 = comb.mux bin %13, %io_D, %sreg_4 : i1
    %15 = comb.icmp bin eq %io_A, %c5_i6 : i6
    %16 = comb.and bin %io_WEN, %15 : i1
    %17 = comb.mux bin %16, %io_D, %sreg_5 : i1
    %18 = comb.icmp bin eq %io_A, %c6_i6 : i6
    %19 = comb.and bin %io_WEN, %18 : i1
    %20 = comb.mux bin %19, %io_D, %sreg_6 : i1
    %21 = comb.icmp bin eq %io_A, %c7_i6 : i6
    %22 = comb.and bin %io_WEN, %21 : i1
    %23 = comb.mux bin %22, %io_D, %sreg_7 : i1
    %24 = comb.icmp bin eq %io_A, %c8_i6 : i6
    %25 = comb.and bin %io_WEN, %24 : i1
    %26 = comb.mux bin %25, %io_D, %sreg_8 : i1
    %27 = comb.icmp bin eq %io_A, %c9_i6 : i6
    %28 = comb.and bin %io_WEN, %27 : i1
    %29 = comb.mux bin %28, %io_D, %sreg_9 : i1
    %30 = comb.icmp bin eq %io_A, %c10_i6 : i6
    %31 = comb.and bin %io_WEN, %30 : i1
    %32 = comb.mux bin %31, %io_D, %sreg_10 : i1
    %33 = comb.icmp bin eq %io_A, %c11_i6 : i6
    %34 = comb.and bin %io_WEN, %33 : i1
    %35 = comb.mux bin %34, %io_D, %sreg_11 : i1
    %36 = comb.icmp bin eq %io_A, %c12_i6 : i6
    %37 = comb.and bin %io_WEN, %36 : i1
    %38 = comb.mux bin %37, %io_D, %sreg_12 : i1
    %39 = comb.icmp bin eq %io_A, %c13_i6 : i6
    %40 = comb.and bin %io_WEN, %39 : i1
    %41 = comb.mux bin %40, %io_D, %sreg_13 : i1
    %42 = comb.icmp bin eq %io_A, %c14_i6 : i6
    %43 = comb.and bin %io_WEN, %42 : i1
    %44 = comb.mux bin %43, %io_D, %sreg_14 : i1
    %45 = comb.icmp bin eq %io_A, %c15_i6 : i6
    %46 = comb.and bin %io_WEN, %45 : i1
    %47 = comb.mux bin %46, %io_D, %sreg_15 : i1
    %48 = comb.icmp bin eq %io_A, %c16_i6 : i6
    %49 = comb.and bin %io_WEN, %48 : i1
    %50 = comb.mux bin %49, %io_D, %sreg_16 : i1
    %51 = comb.icmp bin eq %io_A, %c17_i6 : i6
    %52 = comb.and bin %io_WEN, %51 : i1
    %53 = comb.mux bin %52, %io_D, %sreg_17 : i1
    %54 = comb.icmp bin eq %io_A, %c18_i6 : i6
    %55 = comb.and bin %io_WEN, %54 : i1
    %56 = comb.mux bin %55, %io_D, %sreg_18 : i1
    %57 = comb.icmp bin eq %io_A, %c19_i6 : i6
    %58 = comb.and bin %io_WEN, %57 : i1
    %59 = comb.mux bin %58, %io_D, %sreg_19 : i1
    %60 = comb.icmp bin eq %io_A, %c20_i6 : i6
    %61 = comb.and bin %io_WEN, %60 : i1
    %62 = comb.mux bin %61, %io_D, %sreg_20 : i1
    %63 = comb.icmp bin eq %io_A, %c21_i6 : i6
    %64 = comb.and bin %io_WEN, %63 : i1
    %65 = comb.mux bin %64, %io_D, %sreg_21 : i1
    %66 = comb.icmp bin eq %io_A, %c22_i6 : i6
    %67 = comb.and bin %io_WEN, %66 : i1
    %68 = comb.mux bin %67, %io_D, %sreg_22 : i1
    %69 = comb.icmp bin eq %io_A, %c23_i6 : i6
    %70 = comb.and bin %io_WEN, %69 : i1
    %71 = comb.mux bin %70, %io_D, %sreg_23 : i1
    %72 = comb.icmp bin eq %io_A, %c24_i6 : i6
    %73 = comb.and bin %io_WEN, %72 : i1
    %74 = comb.mux bin %73, %io_D, %sreg_24 : i1
    %75 = comb.icmp bin eq %io_A, %c25_i6 : i6
    %76 = comb.and bin %io_WEN, %75 : i1
    %77 = comb.mux bin %76, %io_D, %sreg_25 : i1
    %78 = comb.icmp bin eq %io_A, %c26_i6 : i6
    %79 = comb.and bin %io_WEN, %78 : i1
    %80 = comb.mux bin %79, %io_D, %sreg_26 : i1
    %81 = comb.icmp bin eq %io_A, %c27_i6 : i6
    %82 = comb.and bin %io_WEN, %81 : i1
    %83 = comb.mux bin %82, %io_D, %sreg_27 : i1
    %84 = comb.icmp bin eq %io_A, %c28_i6 : i6
    %85 = comb.and bin %io_WEN, %84 : i1
    %86 = comb.mux bin %85, %io_D, %sreg_28 : i1
    %87 = comb.icmp bin eq %io_A, %c29_i6 : i6
    %88 = comb.and bin %io_WEN, %87 : i1
    %89 = comb.mux bin %88, %io_D, %sreg_29 : i1
    %90 = comb.icmp bin eq %io_A, %c30_i6 : i6
    %91 = comb.and bin %io_WEN, %90 : i1
    %92 = comb.mux bin %91, %io_D, %sreg_30 : i1
    %93 = comb.icmp bin eq %io_A, %c31_i6 : i6
    %94 = comb.and bin %io_WEN, %93 : i1
    %95 = comb.mux bin %94, %io_D, %sreg_31 : i1
    %96 = comb.icmp bin eq %io_A, %c-32_i6 : i6
    %97 = comb.and bin %io_WEN, %96 : i1
    %98 = comb.mux bin %97, %io_D, %sreg_32 : i1
    %99 = comb.icmp bin eq %io_A, %c-31_i6 : i6
    %100 = comb.and bin %io_WEN, %99 : i1
    %101 = comb.mux bin %100, %io_D, %sreg_33 : i1
    %102 = comb.icmp bin eq %io_A, %c-30_i6 : i6
    %103 = comb.and bin %io_WEN, %102 : i1
    %104 = comb.mux bin %103, %io_D, %sreg_34 : i1
    %105 = comb.icmp bin eq %io_A, %c-29_i6 : i6
    %106 = comb.and bin %io_WEN, %105 : i1
    %107 = comb.mux bin %106, %io_D, %sreg_35 : i1
    %108 = comb.icmp bin eq %io_A, %c-28_i6 : i6
    %109 = comb.and bin %io_WEN, %108 : i1
    %110 = comb.mux bin %109, %io_D, %sreg_36 : i1
    %111 = comb.icmp bin eq %io_A, %c-27_i6 : i6
    %112 = comb.and bin %io_WEN, %111 : i1
    %113 = comb.mux bin %112, %io_D, %sreg_37 : i1
    %114 = comb.icmp bin eq %io_A, %c-26_i6 : i6
    %115 = comb.and bin %io_WEN, %114 : i1
    %116 = comb.mux bin %115, %io_D, %sreg_38 : i1
    %117 = comb.icmp bin eq %io_A, %c-25_i6 : i6
    %118 = comb.and bin %io_WEN, %117 : i1
    %119 = comb.mux bin %118, %io_D, %sreg_39 : i1
    %120 = comb.icmp bin eq %io_A, %c-24_i6 : i6
    %121 = comb.and bin %io_WEN, %120 : i1
    %122 = comb.mux bin %121, %io_D, %sreg_40 : i1
    %123 = comb.icmp bin eq %io_A, %c-23_i6 : i6
    %124 = comb.and bin %io_WEN, %123 : i1
    %125 = comb.mux bin %124, %io_D, %sreg_41 : i1
    %126 = comb.icmp bin eq %io_A, %c-22_i6 : i6
    %127 = comb.and bin %io_WEN, %126 : i1
    %128 = comb.mux bin %127, %io_D, %sreg_42 : i1
    %129 = comb.icmp bin eq %io_A, %c-21_i6 : i6
    %130 = comb.and bin %io_WEN, %129 : i1
    %131 = comb.mux bin %130, %io_D, %sreg_43 : i1
    %132 = comb.icmp bin eq %io_A, %c-20_i6 : i6
    %133 = comb.and bin %io_WEN, %132 : i1
    %134 = comb.mux bin %133, %io_D, %sreg_44 : i1
    %135 = comb.icmp bin eq %io_A, %c-19_i6 : i6
    %136 = comb.and bin %io_WEN, %135 : i1
    %137 = comb.mux bin %136, %io_D, %sreg_45 : i1
    %138 = comb.icmp bin eq %io_A, %c-18_i6 : i6
    %139 = comb.and bin %io_WEN, %138 : i1
    %140 = comb.mux bin %139, %io_D, %sreg_46 : i1
    %141 = comb.icmp bin eq %io_A, %c-17_i6 : i6
    %142 = comb.and bin %io_WEN, %141 : i1
    %143 = comb.mux bin %142, %io_D, %sreg_47 : i1
    %144 = comb.icmp bin eq %io_A, %c-16_i6 : i6
    %145 = comb.and bin %io_WEN, %144 : i1
    %146 = comb.mux bin %145, %io_D, %sreg_48 : i1
    %147 = comb.icmp bin eq %io_A, %c-15_i6 : i6
    %148 = comb.and bin %io_WEN, %147 : i1
    %149 = comb.mux bin %148, %io_D, %sreg_49 : i1
    %150 = comb.icmp bin eq %io_A, %c-14_i6 : i6
    %151 = comb.and bin %io_WEN, %150 : i1
    %152 = comb.mux bin %151, %io_D, %sreg_50 : i1
    %153 = comb.icmp bin eq %io_A, %c-13_i6 : i6
    %154 = comb.and bin %io_WEN, %153 : i1
    %155 = comb.mux bin %154, %io_D, %sreg_51 : i1
    %156 = comb.icmp bin eq %io_A, %c-12_i6 : i6
    %157 = comb.and bin %io_WEN, %156 : i1
    %158 = comb.mux bin %157, %io_D, %sreg_52 : i1
    %159 = comb.icmp bin eq %io_A, %c-11_i6 : i6
    %160 = comb.and bin %io_WEN, %159 : i1
    %161 = comb.mux bin %160, %io_D, %sreg_53 : i1
    %162 = comb.icmp bin eq %io_A, %c-10_i6 : i6
    %163 = comb.and bin %io_WEN, %162 : i1
    %164 = comb.mux bin %163, %io_D, %sreg_54 : i1
    %165 = comb.icmp bin eq %io_A, %c-9_i6 : i6
    %166 = comb.and bin %io_WEN, %165 : i1
    %167 = comb.mux bin %166, %io_D, %sreg_55 : i1
    %168 = comb.icmp bin eq %io_A, %c-8_i6 : i6
    %169 = comb.and bin %io_WEN, %168 : i1
    %170 = comb.mux bin %169, %io_D, %sreg_56 : i1
    %171 = comb.icmp bin eq %io_A, %c-7_i6 : i6
    %172 = comb.and bin %io_WEN, %171 : i1
    %173 = comb.mux bin %172, %io_D, %sreg_57 : i1
    %174 = comb.icmp bin eq %io_A, %c-6_i6 : i6
    %175 = comb.and bin %io_WEN, %174 : i1
    %176 = comb.mux bin %175, %io_D, %sreg_58 : i1
    %177 = comb.icmp bin eq %io_A, %c-5_i6 : i6
    %178 = comb.and bin %io_WEN, %177 : i1
    %179 = comb.mux bin %178, %io_D, %sreg_59 : i1
    %180 = comb.icmp bin eq %io_A, %c-4_i6 : i6
    %181 = comb.and bin %io_WEN, %180 : i1
    %182 = comb.mux bin %181, %io_D, %sreg_60 : i1
    %183 = comb.icmp bin eq %io_A, %c-3_i6 : i6
    %184 = comb.and bin %io_WEN, %183 : i1
    %185 = comb.mux bin %184, %io_D, %sreg_61 : i1
    %186 = comb.icmp bin eq %io_A, %c-2_i6 : i6
    %187 = comb.and bin %io_WEN, %186 : i1
    %188 = comb.mux bin %187, %io_D, %sreg_62 : i1
    %189 = comb.icmp bin eq %io_A, %c-1_i6 : i6
    %190 = comb.and bin %io_WEN, %189 : i1
    %191 = comb.mux bin %190, %io_D, %sreg_63 : i1
    %192 = comb.xor %io_RST, %true : i1
    %193 = comb.and %192, %2 : i1
    %194 = comb.xor %io_RST, %true : i1
    %195 = comb.and %194, %5 : i1
    %196 = comb.xor %io_RST, %true : i1
    %197 = comb.and %196, %8 : i1
    %198 = comb.xor %io_RST, %true : i1
    %199 = comb.and %198, %11 : i1
    %200 = comb.xor %io_RST, %true : i1
    %201 = comb.and %200, %14 : i1
    %202 = comb.xor %io_RST, %true : i1
    %203 = comb.and %202, %17 : i1
    %204 = comb.xor %io_RST, %true : i1
    %205 = comb.and %204, %20 : i1
    %206 = comb.xor %io_RST, %true : i1
    %207 = comb.and %206, %23 : i1
    %208 = comb.xor %io_RST, %true : i1
    %209 = comb.and %208, %26 : i1
    %210 = comb.xor %io_RST, %true : i1
    %211 = comb.and %210, %29 : i1
    %212 = comb.xor %io_RST, %true : i1
    %213 = comb.and %212, %32 : i1
    %214 = comb.xor %io_RST, %true : i1
    %215 = comb.and %214, %35 : i1
    %216 = comb.xor %io_RST, %true : i1
    %217 = comb.and %216, %38 : i1
    %218 = comb.xor %io_RST, %true : i1
    %219 = comb.and %218, %41 : i1
    %220 = comb.xor %io_RST, %true : i1
    %221 = comb.and %220, %44 : i1
    %222 = comb.xor %io_RST, %true : i1
    %223 = comb.and %222, %47 : i1
    %224 = comb.xor %io_RST, %true : i1
    %225 = comb.and %224, %50 : i1
    %226 = comb.xor %io_RST, %true : i1
    %227 = comb.and %226, %53 : i1
    %228 = comb.xor %io_RST, %true : i1
    %229 = comb.and %228, %56 : i1
    %230 = comb.xor %io_RST, %true : i1
    %231 = comb.and %230, %59 : i1
    %232 = comb.xor %io_RST, %true : i1
    %233 = comb.and %232, %62 : i1
    %234 = comb.xor %io_RST, %true : i1
    %235 = comb.and %234, %65 : i1
    %236 = comb.xor %io_RST, %true : i1
    %237 = comb.and %236, %68 : i1
    %238 = comb.xor %io_RST, %true : i1
    %239 = comb.and %238, %71 : i1
    %240 = comb.xor %io_RST, %true : i1
    %241 = comb.and %240, %74 : i1
    %242 = comb.xor %io_RST, %true : i1
    %243 = comb.and %242, %77 : i1
    %244 = comb.xor %io_RST, %true : i1
    %245 = comb.and %244, %80 : i1
    %246 = comb.xor %io_RST, %true : i1
    %247 = comb.and %246, %83 : i1
    %248 = comb.xor %io_RST, %true : i1
    %249 = comb.and %248, %86 : i1
    %250 = comb.xor %io_RST, %true : i1
    %251 = comb.and %250, %89 : i1
    %252 = comb.xor %io_RST, %true : i1
    %253 = comb.and %252, %92 : i1
    %254 = comb.xor %io_RST, %true : i1
    %255 = comb.and %254, %95 : i1
    %256 = comb.xor %io_RST, %true : i1
    %257 = comb.and %256, %98 : i1
    %258 = comb.xor %io_RST, %true : i1
    %259 = comb.and %258, %101 : i1
    %260 = comb.xor %io_RST, %true : i1
    %261 = comb.and %260, %104 : i1
    %262 = comb.xor %io_RST, %true : i1
    %263 = comb.and %262, %107 : i1
    %264 = comb.xor %io_RST, %true : i1
    %265 = comb.and %264, %110 : i1
    %266 = comb.xor %io_RST, %true : i1
    %267 = comb.and %266, %113 : i1
    %268 = comb.xor %io_RST, %true : i1
    %269 = comb.and %268, %116 : i1
    %270 = comb.xor %io_RST, %true : i1
    %271 = comb.and %270, %119 : i1
    %272 = comb.xor %io_RST, %true : i1
    %273 = comb.and %272, %122 : i1
    %274 = comb.xor %io_RST, %true : i1
    %275 = comb.and %274, %125 : i1
    %276 = comb.xor %io_RST, %true : i1
    %277 = comb.and %276, %128 : i1
    %278 = comb.xor %io_RST, %true : i1
    %279 = comb.and %278, %131 : i1
    %280 = comb.xor %io_RST, %true : i1
    %281 = comb.and %280, %134 : i1
    %282 = comb.xor %io_RST, %true : i1
    %283 = comb.and %282, %137 : i1
    %284 = comb.xor %io_RST, %true : i1
    %285 = comb.and %284, %140 : i1
    %286 = comb.xor %io_RST, %true : i1
    %287 = comb.and %286, %143 : i1
    %288 = comb.xor %io_RST, %true : i1
    %289 = comb.and %288, %146 : i1
    %290 = comb.xor %io_RST, %true : i1
    %291 = comb.and %290, %149 : i1
    %292 = comb.xor %io_RST, %true : i1
    %293 = comb.and %292, %152 : i1
    %294 = comb.xor %io_RST, %true : i1
    %295 = comb.and %294, %155 : i1
    %296 = comb.xor %io_RST, %true : i1
    %297 = comb.and %296, %158 : i1
    %298 = comb.xor %io_RST, %true : i1
    %299 = comb.and %298, %161 : i1
    %300 = comb.xor %io_RST, %true : i1
    %301 = comb.and %300, %164 : i1
    %302 = comb.xor %io_RST, %true : i1
    %303 = comb.and %302, %167 : i1
    %304 = comb.xor %io_RST, %true : i1
    %305 = comb.and %304, %170 : i1
    %306 = comb.xor %io_RST, %true : i1
    %307 = comb.and %306, %173 : i1
    %308 = comb.xor %io_RST, %true : i1
    %309 = comb.and %308, %176 : i1
    %310 = comb.xor %io_RST, %true : i1
    %311 = comb.and %310, %179 : i1
    %312 = comb.xor %io_RST, %true : i1
    %313 = comb.and %312, %182 : i1
    %314 = comb.xor %io_RST, %true : i1
    %315 = comb.and %314, %185 : i1
    %316 = comb.xor %io_RST, %true : i1
    %317 = comb.and %316, %188 : i1
    %318 = comb.xor %io_RST, %true : i1
    %319 = comb.and %318, %191 : i1
    %320 = hw.array_create %sreg_63, %sreg_62, %sreg_61, %sreg_60, %sreg_59, %sreg_58, %sreg_57, %sreg_56, %sreg_55, %sreg_54, %sreg_53, %sreg_52, %sreg_51, %sreg_50, %sreg_49, %sreg_48, %sreg_47, %sreg_46, %sreg_45, %sreg_44, %sreg_43, %sreg_42, %sreg_41, %sreg_40, %sreg_39, %sreg_38, %sreg_37, %sreg_36, %sreg_35, %sreg_34, %sreg_33, %sreg_32, %sreg_31, %sreg_30, %sreg_29, %sreg_28, %sreg_27, %sreg_26, %sreg_25, %sreg_24, %sreg_23, %sreg_22, %sreg_21, %sreg_20, %sreg_19, %sreg_18, %sreg_17, %sreg_16, %sreg_15, %sreg_14, %sreg_13, %sreg_12, %sreg_11, %sreg_10, %sreg_9, %sreg_8, %sreg_7, %sreg_6, %sreg_5, %sreg_4, %sreg_3, %sreg_2, %sreg_1, %sreg_0 : i1
    %321 = hw.array_get %320[%io_A] {sv.namehint = "io_PQ"} : !hw.array<64xi1>, i6
    hw.output %321 : i1
  }
  hw.module private @SyncReadReg_4(in %clock : !seq.clock, in %io_WEN : i1, in %io_A : i6, in %io_D : i22, out io_PQ : i22) {
    %c-1_i6 = hw.constant -1 : i6
    %c0_i6 = hw.constant 0 : i6
    %c1_i6 = hw.constant 1 : i6
    %c2_i6 = hw.constant 2 : i6
    %c3_i6 = hw.constant 3 : i6
    %c4_i6 = hw.constant 4 : i6
    %c5_i6 = hw.constant 5 : i6
    %c6_i6 = hw.constant 6 : i6
    %c7_i6 = hw.constant 7 : i6
    %c8_i6 = hw.constant 8 : i6
    %c9_i6 = hw.constant 9 : i6
    %c10_i6 = hw.constant 10 : i6
    %c11_i6 = hw.constant 11 : i6
    %c12_i6 = hw.constant 12 : i6
    %c13_i6 = hw.constant 13 : i6
    %c14_i6 = hw.constant 14 : i6
    %c15_i6 = hw.constant 15 : i6
    %c16_i6 = hw.constant 16 : i6
    %c17_i6 = hw.constant 17 : i6
    %c18_i6 = hw.constant 18 : i6
    %c19_i6 = hw.constant 19 : i6
    %c20_i6 = hw.constant 20 : i6
    %c21_i6 = hw.constant 21 : i6
    %c22_i6 = hw.constant 22 : i6
    %c23_i6 = hw.constant 23 : i6
    %c24_i6 = hw.constant 24 : i6
    %c25_i6 = hw.constant 25 : i6
    %c26_i6 = hw.constant 26 : i6
    %c27_i6 = hw.constant 27 : i6
    %c28_i6 = hw.constant 28 : i6
    %c29_i6 = hw.constant 29 : i6
    %c30_i6 = hw.constant 30 : i6
    %c31_i6 = hw.constant 31 : i6
    %c-32_i6 = hw.constant -32 : i6
    %c-31_i6 = hw.constant -31 : i6
    %c-30_i6 = hw.constant -30 : i6
    %c-29_i6 = hw.constant -29 : i6
    %c-28_i6 = hw.constant -28 : i6
    %c-27_i6 = hw.constant -27 : i6
    %c-26_i6 = hw.constant -26 : i6
    %c-25_i6 = hw.constant -25 : i6
    %c-24_i6 = hw.constant -24 : i6
    %c-23_i6 = hw.constant -23 : i6
    %c-22_i6 = hw.constant -22 : i6
    %c-21_i6 = hw.constant -21 : i6
    %c-20_i6 = hw.constant -20 : i6
    %c-19_i6 = hw.constant -19 : i6
    %c-18_i6 = hw.constant -18 : i6
    %c-17_i6 = hw.constant -17 : i6
    %c-16_i6 = hw.constant -16 : i6
    %c-15_i6 = hw.constant -15 : i6
    %c-14_i6 = hw.constant -14 : i6
    %c-13_i6 = hw.constant -13 : i6
    %c-12_i6 = hw.constant -12 : i6
    %c-11_i6 = hw.constant -11 : i6
    %c-10_i6 = hw.constant -10 : i6
    %c-9_i6 = hw.constant -9 : i6
    %c-8_i6 = hw.constant -8 : i6
    %c-7_i6 = hw.constant -7 : i6
    %c-6_i6 = hw.constant -6 : i6
    %c-5_i6 = hw.constant -5 : i6
    %c-4_i6 = hw.constant -4 : i6
    %c-3_i6 = hw.constant -3 : i6
    %c-2_i6 = hw.constant -2 : i6
    %sreg_0 = seq.firreg %2 clock %clock : i22
    %sreg_1 = seq.firreg %5 clock %clock : i22
    %sreg_2 = seq.firreg %8 clock %clock : i22
    %sreg_3 = seq.firreg %11 clock %clock : i22
    %sreg_4 = seq.firreg %14 clock %clock : i22
    %sreg_5 = seq.firreg %17 clock %clock : i22
    %sreg_6 = seq.firreg %20 clock %clock : i22
    %sreg_7 = seq.firreg %23 clock %clock : i22
    %sreg_8 = seq.firreg %26 clock %clock : i22
    %sreg_9 = seq.firreg %29 clock %clock : i22
    %sreg_10 = seq.firreg %32 clock %clock : i22
    %sreg_11 = seq.firreg %35 clock %clock : i22
    %sreg_12 = seq.firreg %38 clock %clock : i22
    %sreg_13 = seq.firreg %41 clock %clock : i22
    %sreg_14 = seq.firreg %44 clock %clock : i22
    %sreg_15 = seq.firreg %47 clock %clock : i22
    %sreg_16 = seq.firreg %50 clock %clock : i22
    %sreg_17 = seq.firreg %53 clock %clock : i22
    %sreg_18 = seq.firreg %56 clock %clock : i22
    %sreg_19 = seq.firreg %59 clock %clock : i22
    %sreg_20 = seq.firreg %62 clock %clock : i22
    %sreg_21 = seq.firreg %65 clock %clock : i22
    %sreg_22 = seq.firreg %68 clock %clock : i22
    %sreg_23 = seq.firreg %71 clock %clock : i22
    %sreg_24 = seq.firreg %74 clock %clock : i22
    %sreg_25 = seq.firreg %77 clock %clock : i22
    %sreg_26 = seq.firreg %80 clock %clock : i22
    %sreg_27 = seq.firreg %83 clock %clock : i22
    %sreg_28 = seq.firreg %86 clock %clock : i22
    %sreg_29 = seq.firreg %89 clock %clock : i22
    %sreg_30 = seq.firreg %92 clock %clock : i22
    %sreg_31 = seq.firreg %95 clock %clock : i22
    %sreg_32 = seq.firreg %98 clock %clock : i22
    %sreg_33 = seq.firreg %101 clock %clock : i22
    %sreg_34 = seq.firreg %104 clock %clock : i22
    %sreg_35 = seq.firreg %107 clock %clock : i22
    %sreg_36 = seq.firreg %110 clock %clock : i22
    %sreg_37 = seq.firreg %113 clock %clock : i22
    %sreg_38 = seq.firreg %116 clock %clock : i22
    %sreg_39 = seq.firreg %119 clock %clock : i22
    %sreg_40 = seq.firreg %122 clock %clock : i22
    %sreg_41 = seq.firreg %125 clock %clock : i22
    %sreg_42 = seq.firreg %128 clock %clock : i22
    %sreg_43 = seq.firreg %131 clock %clock : i22
    %sreg_44 = seq.firreg %134 clock %clock : i22
    %sreg_45 = seq.firreg %137 clock %clock : i22
    %sreg_46 = seq.firreg %140 clock %clock : i22
    %sreg_47 = seq.firreg %143 clock %clock : i22
    %sreg_48 = seq.firreg %146 clock %clock : i22
    %sreg_49 = seq.firreg %149 clock %clock : i22
    %sreg_50 = seq.firreg %152 clock %clock : i22
    %sreg_51 = seq.firreg %155 clock %clock : i22
    %sreg_52 = seq.firreg %158 clock %clock : i22
    %sreg_53 = seq.firreg %161 clock %clock : i22
    %sreg_54 = seq.firreg %164 clock %clock : i22
    %sreg_55 = seq.firreg %167 clock %clock : i22
    %sreg_56 = seq.firreg %170 clock %clock : i22
    %sreg_57 = seq.firreg %173 clock %clock : i22
    %sreg_58 = seq.firreg %176 clock %clock : i22
    %sreg_59 = seq.firreg %179 clock %clock : i22
    %sreg_60 = seq.firreg %182 clock %clock : i22
    %sreg_61 = seq.firreg %185 clock %clock : i22
    %sreg_62 = seq.firreg %188 clock %clock : i22
    %sreg_63 = seq.firreg %191 clock %clock : i22
    %0 = comb.icmp bin eq %io_A, %c0_i6 : i6
    %1 = comb.and bin %io_WEN, %0 : i1
    %2 = comb.mux bin %1, %io_D, %sreg_0 : i22
    %3 = comb.icmp bin eq %io_A, %c1_i6 : i6
    %4 = comb.and bin %io_WEN, %3 : i1
    %5 = comb.mux bin %4, %io_D, %sreg_1 : i22
    %6 = comb.icmp bin eq %io_A, %c2_i6 : i6
    %7 = comb.and bin %io_WEN, %6 : i1
    %8 = comb.mux bin %7, %io_D, %sreg_2 : i22
    %9 = comb.icmp bin eq %io_A, %c3_i6 : i6
    %10 = comb.and bin %io_WEN, %9 : i1
    %11 = comb.mux bin %10, %io_D, %sreg_3 : i22
    %12 = comb.icmp bin eq %io_A, %c4_i6 : i6
    %13 = comb.and bin %io_WEN, %12 : i1
    %14 = comb.mux bin %13, %io_D, %sreg_4 : i22
    %15 = comb.icmp bin eq %io_A, %c5_i6 : i6
    %16 = comb.and bin %io_WEN, %15 : i1
    %17 = comb.mux bin %16, %io_D, %sreg_5 : i22
    %18 = comb.icmp bin eq %io_A, %c6_i6 : i6
    %19 = comb.and bin %io_WEN, %18 : i1
    %20 = comb.mux bin %19, %io_D, %sreg_6 : i22
    %21 = comb.icmp bin eq %io_A, %c7_i6 : i6
    %22 = comb.and bin %io_WEN, %21 : i1
    %23 = comb.mux bin %22, %io_D, %sreg_7 : i22
    %24 = comb.icmp bin eq %io_A, %c8_i6 : i6
    %25 = comb.and bin %io_WEN, %24 : i1
    %26 = comb.mux bin %25, %io_D, %sreg_8 : i22
    %27 = comb.icmp bin eq %io_A, %c9_i6 : i6
    %28 = comb.and bin %io_WEN, %27 : i1
    %29 = comb.mux bin %28, %io_D, %sreg_9 : i22
    %30 = comb.icmp bin eq %io_A, %c10_i6 : i6
    %31 = comb.and bin %io_WEN, %30 : i1
    %32 = comb.mux bin %31, %io_D, %sreg_10 : i22
    %33 = comb.icmp bin eq %io_A, %c11_i6 : i6
    %34 = comb.and bin %io_WEN, %33 : i1
    %35 = comb.mux bin %34, %io_D, %sreg_11 : i22
    %36 = comb.icmp bin eq %io_A, %c12_i6 : i6
    %37 = comb.and bin %io_WEN, %36 : i1
    %38 = comb.mux bin %37, %io_D, %sreg_12 : i22
    %39 = comb.icmp bin eq %io_A, %c13_i6 : i6
    %40 = comb.and bin %io_WEN, %39 : i1
    %41 = comb.mux bin %40, %io_D, %sreg_13 : i22
    %42 = comb.icmp bin eq %io_A, %c14_i6 : i6
    %43 = comb.and bin %io_WEN, %42 : i1
    %44 = comb.mux bin %43, %io_D, %sreg_14 : i22
    %45 = comb.icmp bin eq %io_A, %c15_i6 : i6
    %46 = comb.and bin %io_WEN, %45 : i1
    %47 = comb.mux bin %46, %io_D, %sreg_15 : i22
    %48 = comb.icmp bin eq %io_A, %c16_i6 : i6
    %49 = comb.and bin %io_WEN, %48 : i1
    %50 = comb.mux bin %49, %io_D, %sreg_16 : i22
    %51 = comb.icmp bin eq %io_A, %c17_i6 : i6
    %52 = comb.and bin %io_WEN, %51 : i1
    %53 = comb.mux bin %52, %io_D, %sreg_17 : i22
    %54 = comb.icmp bin eq %io_A, %c18_i6 : i6
    %55 = comb.and bin %io_WEN, %54 : i1
    %56 = comb.mux bin %55, %io_D, %sreg_18 : i22
    %57 = comb.icmp bin eq %io_A, %c19_i6 : i6
    %58 = comb.and bin %io_WEN, %57 : i1
    %59 = comb.mux bin %58, %io_D, %sreg_19 : i22
    %60 = comb.icmp bin eq %io_A, %c20_i6 : i6
    %61 = comb.and bin %io_WEN, %60 : i1
    %62 = comb.mux bin %61, %io_D, %sreg_20 : i22
    %63 = comb.icmp bin eq %io_A, %c21_i6 : i6
    %64 = comb.and bin %io_WEN, %63 : i1
    %65 = comb.mux bin %64, %io_D, %sreg_21 : i22
    %66 = comb.icmp bin eq %io_A, %c22_i6 : i6
    %67 = comb.and bin %io_WEN, %66 : i1
    %68 = comb.mux bin %67, %io_D, %sreg_22 : i22
    %69 = comb.icmp bin eq %io_A, %c23_i6 : i6
    %70 = comb.and bin %io_WEN, %69 : i1
    %71 = comb.mux bin %70, %io_D, %sreg_23 : i22
    %72 = comb.icmp bin eq %io_A, %c24_i6 : i6
    %73 = comb.and bin %io_WEN, %72 : i1
    %74 = comb.mux bin %73, %io_D, %sreg_24 : i22
    %75 = comb.icmp bin eq %io_A, %c25_i6 : i6
    %76 = comb.and bin %io_WEN, %75 : i1
    %77 = comb.mux bin %76, %io_D, %sreg_25 : i22
    %78 = comb.icmp bin eq %io_A, %c26_i6 : i6
    %79 = comb.and bin %io_WEN, %78 : i1
    %80 = comb.mux bin %79, %io_D, %sreg_26 : i22
    %81 = comb.icmp bin eq %io_A, %c27_i6 : i6
    %82 = comb.and bin %io_WEN, %81 : i1
    %83 = comb.mux bin %82, %io_D, %sreg_27 : i22
    %84 = comb.icmp bin eq %io_A, %c28_i6 : i6
    %85 = comb.and bin %io_WEN, %84 : i1
    %86 = comb.mux bin %85, %io_D, %sreg_28 : i22
    %87 = comb.icmp bin eq %io_A, %c29_i6 : i6
    %88 = comb.and bin %io_WEN, %87 : i1
    %89 = comb.mux bin %88, %io_D, %sreg_29 : i22
    %90 = comb.icmp bin eq %io_A, %c30_i6 : i6
    %91 = comb.and bin %io_WEN, %90 : i1
    %92 = comb.mux bin %91, %io_D, %sreg_30 : i22
    %93 = comb.icmp bin eq %io_A, %c31_i6 : i6
    %94 = comb.and bin %io_WEN, %93 : i1
    %95 = comb.mux bin %94, %io_D, %sreg_31 : i22
    %96 = comb.icmp bin eq %io_A, %c-32_i6 : i6
    %97 = comb.and bin %io_WEN, %96 : i1
    %98 = comb.mux bin %97, %io_D, %sreg_32 : i22
    %99 = comb.icmp bin eq %io_A, %c-31_i6 : i6
    %100 = comb.and bin %io_WEN, %99 : i1
    %101 = comb.mux bin %100, %io_D, %sreg_33 : i22
    %102 = comb.icmp bin eq %io_A, %c-30_i6 : i6
    %103 = comb.and bin %io_WEN, %102 : i1
    %104 = comb.mux bin %103, %io_D, %sreg_34 : i22
    %105 = comb.icmp bin eq %io_A, %c-29_i6 : i6
    %106 = comb.and bin %io_WEN, %105 : i1
    %107 = comb.mux bin %106, %io_D, %sreg_35 : i22
    %108 = comb.icmp bin eq %io_A, %c-28_i6 : i6
    %109 = comb.and bin %io_WEN, %108 : i1
    %110 = comb.mux bin %109, %io_D, %sreg_36 : i22
    %111 = comb.icmp bin eq %io_A, %c-27_i6 : i6
    %112 = comb.and bin %io_WEN, %111 : i1
    %113 = comb.mux bin %112, %io_D, %sreg_37 : i22
    %114 = comb.icmp bin eq %io_A, %c-26_i6 : i6
    %115 = comb.and bin %io_WEN, %114 : i1
    %116 = comb.mux bin %115, %io_D, %sreg_38 : i22
    %117 = comb.icmp bin eq %io_A, %c-25_i6 : i6
    %118 = comb.and bin %io_WEN, %117 : i1
    %119 = comb.mux bin %118, %io_D, %sreg_39 : i22
    %120 = comb.icmp bin eq %io_A, %c-24_i6 : i6
    %121 = comb.and bin %io_WEN, %120 : i1
    %122 = comb.mux bin %121, %io_D, %sreg_40 : i22
    %123 = comb.icmp bin eq %io_A, %c-23_i6 : i6
    %124 = comb.and bin %io_WEN, %123 : i1
    %125 = comb.mux bin %124, %io_D, %sreg_41 : i22
    %126 = comb.icmp bin eq %io_A, %c-22_i6 : i6
    %127 = comb.and bin %io_WEN, %126 : i1
    %128 = comb.mux bin %127, %io_D, %sreg_42 : i22
    %129 = comb.icmp bin eq %io_A, %c-21_i6 : i6
    %130 = comb.and bin %io_WEN, %129 : i1
    %131 = comb.mux bin %130, %io_D, %sreg_43 : i22
    %132 = comb.icmp bin eq %io_A, %c-20_i6 : i6
    %133 = comb.and bin %io_WEN, %132 : i1
    %134 = comb.mux bin %133, %io_D, %sreg_44 : i22
    %135 = comb.icmp bin eq %io_A, %c-19_i6 : i6
    %136 = comb.and bin %io_WEN, %135 : i1
    %137 = comb.mux bin %136, %io_D, %sreg_45 : i22
    %138 = comb.icmp bin eq %io_A, %c-18_i6 : i6
    %139 = comb.and bin %io_WEN, %138 : i1
    %140 = comb.mux bin %139, %io_D, %sreg_46 : i22
    %141 = comb.icmp bin eq %io_A, %c-17_i6 : i6
    %142 = comb.and bin %io_WEN, %141 : i1
    %143 = comb.mux bin %142, %io_D, %sreg_47 : i22
    %144 = comb.icmp bin eq %io_A, %c-16_i6 : i6
    %145 = comb.and bin %io_WEN, %144 : i1
    %146 = comb.mux bin %145, %io_D, %sreg_48 : i22
    %147 = comb.icmp bin eq %io_A, %c-15_i6 : i6
    %148 = comb.and bin %io_WEN, %147 : i1
    %149 = comb.mux bin %148, %io_D, %sreg_49 : i22
    %150 = comb.icmp bin eq %io_A, %c-14_i6 : i6
    %151 = comb.and bin %io_WEN, %150 : i1
    %152 = comb.mux bin %151, %io_D, %sreg_50 : i22
    %153 = comb.icmp bin eq %io_A, %c-13_i6 : i6
    %154 = comb.and bin %io_WEN, %153 : i1
    %155 = comb.mux bin %154, %io_D, %sreg_51 : i22
    %156 = comb.icmp bin eq %io_A, %c-12_i6 : i6
    %157 = comb.and bin %io_WEN, %156 : i1
    %158 = comb.mux bin %157, %io_D, %sreg_52 : i22
    %159 = comb.icmp bin eq %io_A, %c-11_i6 : i6
    %160 = comb.and bin %io_WEN, %159 : i1
    %161 = comb.mux bin %160, %io_D, %sreg_53 : i22
    %162 = comb.icmp bin eq %io_A, %c-10_i6 : i6
    %163 = comb.and bin %io_WEN, %162 : i1
    %164 = comb.mux bin %163, %io_D, %sreg_54 : i22
    %165 = comb.icmp bin eq %io_A, %c-9_i6 : i6
    %166 = comb.and bin %io_WEN, %165 : i1
    %167 = comb.mux bin %166, %io_D, %sreg_55 : i22
    %168 = comb.icmp bin eq %io_A, %c-8_i6 : i6
    %169 = comb.and bin %io_WEN, %168 : i1
    %170 = comb.mux bin %169, %io_D, %sreg_56 : i22
    %171 = comb.icmp bin eq %io_A, %c-7_i6 : i6
    %172 = comb.and bin %io_WEN, %171 : i1
    %173 = comb.mux bin %172, %io_D, %sreg_57 : i22
    %174 = comb.icmp bin eq %io_A, %c-6_i6 : i6
    %175 = comb.and bin %io_WEN, %174 : i1
    %176 = comb.mux bin %175, %io_D, %sreg_58 : i22
    %177 = comb.icmp bin eq %io_A, %c-5_i6 : i6
    %178 = comb.and bin %io_WEN, %177 : i1
    %179 = comb.mux bin %178, %io_D, %sreg_59 : i22
    %180 = comb.icmp bin eq %io_A, %c-4_i6 : i6
    %181 = comb.and bin %io_WEN, %180 : i1
    %182 = comb.mux bin %181, %io_D, %sreg_60 : i22
    %183 = comb.icmp bin eq %io_A, %c-3_i6 : i6
    %184 = comb.and bin %io_WEN, %183 : i1
    %185 = comb.mux bin %184, %io_D, %sreg_61 : i22
    %186 = comb.icmp bin eq %io_A, %c-2_i6 : i6
    %187 = comb.and bin %io_WEN, %186 : i1
    %188 = comb.mux bin %187, %io_D, %sreg_62 : i22
    %189 = comb.icmp bin eq %io_A, %c-1_i6 : i6
    %190 = comb.and bin %io_WEN, %189 : i1
    %191 = comb.mux bin %190, %io_D, %sreg_63 : i22
    %192 = hw.array_create %sreg_63, %sreg_62, %sreg_61, %sreg_60, %sreg_59, %sreg_58, %sreg_57, %sreg_56, %sreg_55, %sreg_54, %sreg_53, %sreg_52, %sreg_51, %sreg_50, %sreg_49, %sreg_48, %sreg_47, %sreg_46, %sreg_45, %sreg_44, %sreg_43, %sreg_42, %sreg_41, %sreg_40, %sreg_39, %sreg_38, %sreg_37, %sreg_36, %sreg_35, %sreg_34, %sreg_33, %sreg_32, %sreg_31, %sreg_30, %sreg_29, %sreg_28, %sreg_27, %sreg_26, %sreg_25, %sreg_24, %sreg_23, %sreg_22, %sreg_21, %sreg_20, %sreg_19, %sreg_18, %sreg_17, %sreg_16, %sreg_15, %sreg_14, %sreg_13, %sreg_12, %sreg_11, %sreg_10, %sreg_9, %sreg_8, %sreg_7, %sreg_6, %sreg_5, %sreg_4, %sreg_3, %sreg_2, %sreg_1, %sreg_0 : i22
    %193 = hw.array_get %192[%io_A] {sv.namehint = "io_PQ"} : !hw.array<64xi22>, i6
    hw.output %193 : i22
  }
  hw.module.extern private @S011HD1P_X32Y2D128_BW(out Q : i128, in %CLK : !seq.clock, in %CEN : i1, in %WEN : i1, in %BWEN : i128, in %A : i6, in %D : i128) attributes {verilogName = "S011HD1P_X32Y2D128_BW"}
  hw.module private @ICache(in %clock : !seq.clock, in %reset : i1, in %io_cpuIO_cpuReq_addr : i32, in %io_cpuIO_cpuReq_valid : i1, in %io_cpuIO_cpuReq_revoke : i1, out io_cpuIO_cpuResult_data : i32, out io_cpuIO_cpuResult_ready : i1, in %io_memIO_ar_ready : i1, out io_memIO_ar_valid : i1, out io_memIO_ar_bits_addr : i32, out io_memIO_ar_bits_len : i8, out io_memIO_ar_bits_size : i3, in %io_memIO_r_valid : i1, in %io_memIO_r_bits_data : i64, out io_inv_ready : i1, in %io_inv_valid : i1, in %io_jmpBch : i1) {
    %c0_i7 = hw.constant 0 : i7
    %c-1_i2 = hw.constant -1 : i2
    %c0_i16 = hw.constant 0 : i16
    %c-2_i2 = hw.constant -2 : i2
    %c3_i3 = hw.constant 3 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c1_i3 = hw.constant 1 : i3
    %c2_i3 = hw.constant 2 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c1_i2 = hw.constant 1 : i2
    %c0_i2 = hw.constant 0 : i2
    %c0_i3 = hw.constant 0 : i3
    %c0_i32 = hw.constant 0 : i32
    %c0_i4 = hw.constant 0 : i4
    %true = hw.constant true
    %c0_i128 = hw.constant 0 : i128
    %false = hw.constant false
    %rand_prng.io_out_0, %rand_prng.io_out_1 = hw.instance "rand_prng" @MaximalPeriodGaloisLFSR(clock: %clock: !seq.clock, reset: %reset: i1) -> (io_out_0: i1, io_out_1: i1)
    %0 = comb.concat %rand_prng.io_out_1, %rand_prng.io_out_0 {sv.namehint = "rand"} : i1, i1
    %state = seq.firreg %198 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 0 : ui64} : i3
    %received = seq.firreg %127 clock %clock reset sync %reset, %false {firrtl.random_init_start = 3 : ui64} : i1
    %willDrop = seq.firreg %205 clock %clock reset sync %reset, %false {firrtl.random_init_start = 4 : ui64} : i1
    %addr = seq.firreg %58 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 5 : ui64} : i32
    %1 = comb.extract %addr from 1 {sv.namehint = "addrOffset"} : (i32) -> i3
    %2 = comb.extract %addr from 4 {sv.namehint = "rAddr"} : (i32) -> i6
    %3 = comb.extract %addr from 10 {sv.namehint = "addrTag"} : (i32) -> i22
    %4 = comb.extract %addr from 4 {sv.namehint = "_offEqual_T"} : (i32) -> i28
    %5 = comb.concat %4, %c0_i4 {sv.namehint = "memAddr"} : i28, i4
    %ARVALID = seq.firreg %130 clock %clock reset sync %reset, %false {firrtl.random_init_start = 37 : ui64} : i1
    %sregs.io_PQ = hw.instance "sregs" @SyncReadReg(clock: %clock: !seq.clock, reset: %reset: i1, io_WEN: %165: i1, io_A: %2: i6, io_D: %true: i1, io_RST: %66: i1) -> (io_PQ: i1)
    %sregs_1.io_PQ = hw.instance "sregs_1" @SyncReadReg(clock: %clock: !seq.clock, reset: %reset: i1, io_WEN: %167: i1, io_A: %2: i6, io_D: %true: i1, io_RST: %66: i1) -> (io_PQ: i1)
    %sregs_2.io_PQ = hw.instance "sregs_2" @SyncReadReg(clock: %clock: !seq.clock, reset: %reset: i1, io_WEN: %169: i1, io_A: %2: i6, io_D: %true: i1, io_RST: %66: i1) -> (io_PQ: i1)
    %sregs_3.io_PQ = hw.instance "sregs_3" @SyncReadReg(clock: %clock: !seq.clock, reset: %reset: i1, io_WEN: %171: i1, io_A: %2: i6, io_D: %true: i1, io_RST: %66: i1) -> (io_PQ: i1)
    %sregs_4.io_PQ = hw.instance "sregs_4" @SyncReadReg_4(clock: %clock: !seq.clock, io_WEN: %165: i1, io_A: %2: i6, io_D: %3: i22) -> (io_PQ: i22)
    %sregs_5.io_PQ = hw.instance "sregs_5" @SyncReadReg_4(clock: %clock: !seq.clock, io_WEN: %167: i1, io_A: %2: i6, io_D: %3: i22) -> (io_PQ: i22)
    %sregs_6.io_PQ = hw.instance "sregs_6" @SyncReadReg_4(clock: %clock: !seq.clock, io_WEN: %169: i1, io_A: %2: i6, io_D: %3: i22) -> (io_PQ: i22)
    %sregs_7.io_PQ = hw.instance "sregs_7" @SyncReadReg_4(clock: %clock: !seq.clock, io_WEN: %171: i1, io_A: %2: i6, io_D: %3: i22) -> (io_PQ: i22)
    %sram.Q = hw.instance "sram" sym @sym @S011HD1P_X32Y2D128_BW(CLK: %clock: !seq.clock, CEN: %false: i1, WEN: %17: i1, BWEN: %c0_i128: i128, A: %2: i6, D: %writeBuffer: i128) -> (Q: i128)
    %sram_1.Q = hw.instance "sram_1" sym @sym_0 @S011HD1P_X32Y2D128_BW(CLK: %clock: !seq.clock, CEN: %false: i1, WEN: %18: i1, BWEN: %c0_i128: i128, A: %2: i6, D: %writeBuffer: i128) -> (Q: i128)
    %sram_2.Q = hw.instance "sram_2" sym @sym_1 @S011HD1P_X32Y2D128_BW(CLK: %clock: !seq.clock, CEN: %false: i1, WEN: %19: i1, BWEN: %c0_i128: i128, A: %2: i6, D: %writeBuffer: i128) -> (Q: i128)
    %sram_3.Q = hw.instance "sram_3" sym @sym_2 @S011HD1P_X32Y2D128_BW(CLK: %clock: !seq.clock, CEN: %false: i1, WEN: %20: i1, BWEN: %c0_i128: i128, A: %2: i6, D: %writeBuffer: i128) -> (Q: i128)
    %grp = seq.firreg %91 clock %clock {firrtl.random_init_start = 38 : ui64} : i2
    %way = seq.firreg %96 clock %clock {firrtl.random_init_start = 40 : ui64} : i2
    %writeBuffer = seq.firreg %114 clock %clock {firrtl.random_init_start = 42 : ui64} : i128
    %6 = hw.array_create %sram_3.Q, %sram_2.Q, %sram_1.Q, %sram.Q : i128
    %7 = hw.array_get %6[%grp] : !hw.array<4xi128>, i2
    %8 = comb.extract %7 from 0 {sv.namehint = "_wordData_WIRE_0"} : (i128) -> i32
    %9 = comb.extract %7 from 16 {sv.namehint = "_wordData_WIRE_1"} : (i128) -> i32
    %10 = comb.extract %7 from 32 {sv.namehint = "_wordData_WIRE_2"} : (i128) -> i32
    %11 = comb.extract %7 from 48 {sv.namehint = "_wordData_WIRE_3"} : (i128) -> i32
    %12 = comb.extract %7 from 64 {sv.namehint = "_wordData_WIRE_4"} : (i128) -> i32
    %13 = comb.extract %7 from 80 {sv.namehint = "_wordData_WIRE_5"} : (i128) -> i32
    %14 = comb.extract %7 from 96 {sv.namehint = "_wordData_WIRE_6"} : (i128) -> i32
    %15 = comb.extract %7 from 112 {sv.namehint = "_wordData_T_7"} : (i128) -> i16
    %16 = comb.concat %c0_i16, %15 {sv.namehint = "_wordData_WIRE_7"} : i16, i16
    %17 = comb.xor bin %165, %true {sv.namehint = "_sram_io_WEN_T"} : i1
    %18 = comb.xor bin %167, %true {sv.namehint = "_sram_io_WEN_T_1"} : i1
    %19 = comb.xor bin %169, %true {sv.namehint = "_sram_io_WEN_T_2"} : i1
    %20 = comb.xor bin %171, %true {sv.namehint = "_sram_io_WEN_T_3"} : i1
    %21 = hw.array_create %16, %14, %13, %12, %11, %10, %9, %8 : i32
    %22 = hw.array_get %21[%1] : !hw.array<8xi32>, i3
    %23 = comb.extract %io_cpuIO_cpuReq_addr from 31 : (i32) -> i1
    %24 = comb.xor bin %23, %true {sv.namehint = "isPeripheral"} : i1
    %ready = seq.firreg %37 clock %clock reset sync %reset, %true {firrtl.random_init_start = 170 : ui64} : i1
    %finish = seq.firreg %38 clock %clock reset sync %reset, %false {firrtl.random_init_start = 171 : ui64} : i1
    %ARVALID_1 = seq.firreg %40 clock %clock reset sync %reset, %true {firrtl.random_init_start = 172 : ui64} : i1
    %rdata = seq.firreg %42 clock %clock {firrtl.random_init_start = 173 : ui64} : i64
    %25 = comb.and bin %ready, %181, %186, %187 : i1
    %26 = comb.xor bin %ready, %true : i1
    %27 = comb.or bin %25, %26 : i1
    %28 = comb.mux bin %27, %ARVALID_1, %ARVALID {sv.namehint = "io_memIO_ar_valid"} : i1
    %29 = comb.xor %27, %true : i1
    %30 = comb.concat %c0_i7, %29 {sv.namehint = "io_memIO_ar_bits_len"} : i7, i1
    %31 = comb.xor %27, %true : i1
    %32 = comb.concat %c1_i2, %31 {sv.namehint = "io_memIO_ar_bits_size"} : i2, i1
    %33 = comb.mux bin %27, %addr, %5 {sv.namehint = "io_memIO_ar_bits_addr"} : i32
    %34 = comb.and bin %io_memIO_ar_ready, %28 : i1
    %35 = comb.xor %34, %true : i1
    %36 = comb.and %35, %ARVALID_1 : i1
    %37 = comb.mux bin %27, %io_memIO_r_valid, %ready : i1
    %38 = comb.and %27, %io_memIO_r_valid : i1
    %39 = comb.or %io_memIO_r_valid, %36 : i1
    %40 = comb.mux bin %27, %39, %ARVALID_1 : i1
    %41 = comb.and bin %27, %io_memIO_r_valid : i1
    %42 = comb.mux bin %41, %io_memIO_r_bits_data, %rdata : i64
    %compareHit = seq.firreg %90 clock %clock reset sync %reset, %false {firrtl.random_init_start = 237 : ui64} : i1
    %fakeAnswer = seq.firreg %119 clock %clock reset sync %reset, %false {firrtl.random_init_start = 238 : ui64} : i1
    %answerData = seq.firreg %160 clock %clock {firrtl.random_init_start = 239 : ui64} : i32
    %crossBurst = seq.firreg %154 clock %clock reset sync %reset, %false {firrtl.random_init_start = 271 : ui64} : i1
    %43 = comb.icmp bin eq %way, %c0_i2 : i2
    %44 = comb.and %fakeAnswer, %43 : i1
    %45 = comb.icmp bin eq %way, %c1_i2 : i2
    %46 = comb.and %fakeAnswer, %45 : i1
    %47 = comb.icmp bin eq %way, %c-2_i2 : i2
    %48 = comb.and %fakeAnswer, %47 : i1
    %49 = comb.icmp bin eq %way, %c-1_i2 : i2
    %50 = comb.and %fakeAnswer, %49 : i1
    %51 = comb.icmp bin ne %state, %c3_i3 : i3
    %52 = comb.and bin %io_cpuIO_cpuReq_valid, %51 : i1
    %53 = comb.icmp bin eq %state, %c-3_i3 {sv.namehint = "_addr_T"} : i3
    %54 = comb.extract %io_cpuIO_cpuReq_addr from 31 {sv.namehint = "_addr_T_1"} : (i32) -> i1
    %55 = comb.and bin %53, %54 {sv.namehint = "_addr_T_2"} : i1
    %56 = comb.xor %52, %true : i1
    %57 = comb.or %56, %55 : i1
    %58 = comb.mux bin %57, %addr, %io_cpuIO_cpuReq_addr : i32
    %59 = comb.or bin %io_jmpBch, %io_cpuIO_cpuReq_revoke {sv.namehint = "revoke"} : i1
    %60 = comb.icmp bin eq %state, %c0_i3 : i3
    %61 = comb.concat %24, %c1_i2 {sv.namehint = "_state_T"} : i1, i2
    %62 = comb.mux bin %59, %c0_i3, %61 {sv.namehint = "_state_T_1"} : i3
    %63 = comb.and bin %60, %io_cpuIO_cpuReq_valid : i1
    %64 = comb.mux bin %63, %62, %state : i3
    %65 = comb.xor %io_cpuIO_cpuReq_valid, %true : i1
    %66 = comb.and %60, %65, %io_inv_valid {sv.namehint = "sregs.io_RST"} : i1
    %67 = comb.icmp bin eq %state, %c1_i3 : i3
    %68 = comb.icmp bin eq %sregs_4.io_PQ, %3 {sv.namehint = "_compareHit_qual1_T"} : i22
    %69 = comb.icmp bin eq %sregs_5.io_PQ, %3 {sv.namehint = "_compareHit_qual1_T_2"} : i22
    %70 = comb.and bin %sregs_1.io_PQ, %69 {sv.namehint = "_startGrp_T_12"} : i1
    %71 = comb.icmp bin eq %sregs_6.io_PQ, %3 {sv.namehint = "_compareHit_qual1_T_4"} : i22
    %72 = comb.and bin %sregs_2.io_PQ, %71 {sv.namehint = "_startGrp_T_5"} : i1
    %73 = comb.icmp bin eq %sregs_7.io_PQ, %3 {sv.namehint = "_compareHit_qual1_T_6"} : i22
    %74 = comb.and bin %sregs_3.io_PQ, %73 {sv.namehint = "_startGrp_T_7"} : i1
    %75 = comb.concat %72, %false {sv.namehint = "_startGrp_T_10"} : i1, i1
    %76 = comb.replicate %74 {sv.namehint = "_startGrp_T_11"} : (i1) -> i2
    %77 = comb.concat %false, %70 : i1, i1
    %78 = comb.or bin %77, %75, %76 {sv.namehint = "startGrp"} : i2
    %79 = comb.or bin %willDrop, %59 {sv.namehint = "_state_T_2"} : i1
    %80 = comb.xor %79, %true : i1
    %81 = comb.concat %false, %80, %false {sv.namehint = "_state_T_3"} : i1, i1, i1
    %82 = comb.mux bin %67, %81, %64 : i3
    %83 = comb.xor %67, %true : i1
    %84 = comb.and %83, %willDrop : i1
    %85 = comb.and bin %sregs.io_PQ, %68 {sv.namehint = "compareHit_qual1_0"} : i1
    %86 = comb.and bin %sregs_1.io_PQ, %69 {sv.namehint = "compareHit_qual1_1"} : i1
    %87 = comb.and bin %sregs_2.io_PQ, %71 {sv.namehint = "compareHit_qual1_2"} : i1
    %88 = comb.and bin %sregs_3.io_PQ, %73 {sv.namehint = "compareHit_qual1_3"} : i1
    %89 = comb.or bin %85, %86, %87, %88 {sv.namehint = "_compareHit_T_2"} : i1
    %90 = comb.mux bin %67, %89, %compareHit : i1
    %91 = comb.mux bin %67, %78, %grp : i2
    %92 = comb.mux bin %sregs.io_PQ, %0, %c0_i2 {sv.namehint = "_way_T_1"} : i2
    %93 = comb.mux bin %sregs_1.io_PQ, %92, %c1_i2 {sv.namehint = "_way_T_3"} : i2
    %94 = comb.mux bin %sregs_2.io_PQ, %93, %c-2_i2 {sv.namehint = "_way_T_5"} : i2
    %95 = comb.mux bin %sregs_3.io_PQ, %94, %c-1_i2 {sv.namehint = "_way_T_7"} : i2
    %96 = comb.mux bin %67, %95, %way : i2
    %97 = comb.icmp bin eq %state, %c2_i3 : i3
    %98 = comb.xor bin %compareHit, %true {sv.namehint = "_ARVALID_T"} : i1
    %99 = comb.xor bin %59, %true {sv.namehint = "_ARVALID_T_1"} : i1
    %100 = comb.and bin %98, %99 {sv.namehint = "_ARVALID_T_2"} : i1
    %101 = comb.mux bin %97, %100, %ARVALID : i1
    %102 = comb.and %97, %compareHit : i1
    %103 = comb.concat %24, %c1_i2 {sv.namehint = "_state_T_4"} : i1, i2
    %104 = comb.mux bin %io_cpuIO_cpuReq_valid, %103, %c0_i3 {sv.namehint = "_state_T_5"} : i3
    %105 = comb.mux bin %compareHit, %104, %c3_i3 {sv.namehint = "_state_T_6"} : i3
    %106 = comb.mux bin %59, %c0_i3, %105 {sv.namehint = "_state_T_7"} : i3
    %107 = comb.mux bin %97, %106, %82 : i3
    %108 = comb.icmp bin eq %state, %c3_i3 : i3
    %109 = comb.xor %io_memIO_r_valid, %true : i1
    %110 = comb.and %109, %crossBurst : i1
    %111 = comb.extract %writeBuffer from 64 {sv.namehint = "_writeBuffer_T"} : (i128) -> i64
    %112 = comb.concat %io_memIO_r_bits_data, %111 {sv.namehint = "_writeBuffer_T_1"} : i64, i64
    %113 = comb.and bin %108, %io_memIO_r_valid : i1
    %114 = comb.mux bin %113, %112, %writeBuffer : i128
    %115 = comb.xor %willDrop, %true : i1
    %116 = comb.concat %115, %c0_i2 {sv.namehint = "_state_T_10"} : i1, i2
    %117 = comb.and bin %108, %io_memIO_r_valid, %received : i1
    %118 = comb.mux bin %117, %116, %107 : i3
    %119 = comb.and %117, %willDrop : i1
    %120 = comb.or bin %received, %67 : i1
    %121 = comb.xor %120, %true : i1
    %122 = comb.and %121, %willDrop : i1
    %123 = comb.mux bin %io_memIO_r_valid, %122, %84 : i1
    %124 = comb.add bin %received, %true {sv.namehint = "_received_T"} : i1
    %125 = comb.xor %received, %true : i1
    %126 = comb.and %125, %124 : i1
    %127 = comb.mux bin %113, %126, %received : i1
    %128 = comb.and bin %108, %34 : i1
    %129 = comb.xor %128, %true : i1
    %130 = comb.and %129, %101 : i1
    %131 = comb.extract %addr from 3 : (i32) -> i1
    %132 = comb.icmp bin eq %received, %131 : i1
    %133 = comb.extract %addr from 1 {sv.namehint = "_answerData_T_9"} : (i32) -> i2
    %134 = comb.icmp bin eq %133, %c0_i2 {sv.namehint = "_answerData_T_1"} : i2
    %135 = comb.icmp bin eq %133, %c1_i2 {sv.namehint = "_answerData_T_4"} : i2
    %136 = comb.icmp bin eq %133, %c-2_i2 {sv.namehint = "_answerData_T_7"} : i2
    %137 = comb.extract %io_memIO_r_bits_data from 32 {sv.namehint = "_answerData_T_8"} : (i64) -> i32
    %138 = comb.icmp bin eq %133, %c-1_i2 {sv.namehint = "_answerData_T_10"} : i2
    %139 = comb.extract %io_memIO_r_bits_data from 48 {sv.namehint = "_answerData_T_11"} : (i64) -> i16
    %140 = comb.extract %io_memIO_r_bits_data from 0 : (i64) -> i32
    %141 = comb.mux bin %134, %140, %c0_i32 {sv.namehint = "_answerData_T_12"} : i32
    %142 = comb.extract %io_memIO_r_bits_data from 16 : (i64) -> i32
    %143 = comb.mux bin %135, %142, %c0_i32 {sv.namehint = "_answerData_T_13"} : i32
    %144 = comb.mux bin %136, %137, %c0_i32 {sv.namehint = "_answerData_T_14"} : i32
    %145 = comb.mux bin %138, %139, %c0_i16 {sv.namehint = "_answerData_T_15"} : i16
    %146 = comb.or bin %141, %143, %144 : i32
    %147 = comb.extract %146 from 16 : (i32) -> i16
    %148 = comb.extract %146 from 0 : (i32) -> i16
    %149 = comb.or bin %148, %145 : i16
    %150 = comb.concat %147, %149 : i16, i16
    %151 = comb.icmp bin eq %133, %c-1_i2 : i2
    %152 = comb.and bin %132, %151 : i1
    %153 = comb.or %152, %110 : i1
    %154 = comb.mux bin %108, %153, %crossBurst : i1
    %155 = comb.extract %io_memIO_r_bits_data from 0 {sv.namehint = "_answerData_T_19"} : (i64) -> i16
    %156 = comb.extract %answerData from 0 {sv.namehint = "_answerData_T_20"} : (i32) -> i16
    %157 = comb.concat %155, %156 {sv.namehint = "_answerData_T_21"} : i16, i16
    %158 = comb.mux bin %crossBurst, %157, %answerData : i32
    %159 = comb.mux bin %132, %150, %158 : i32
    %160 = comb.mux bin %108, %159, %answerData : i32
    %161 = comb.or %59, %123 : i1
    %162 = comb.mux bin %108, %161, %84 : i1
    %163 = comb.icmp bin eq %state, %c-4_i3 : i3
    %164 = comb.and bin %163, %43 : i1
    %165 = comb.or %164, %44 {sv.namehint = "wen_0"} : i1
    %166 = comb.and bin %163, %45 : i1
    %167 = comb.or %166, %46 {sv.namehint = "wen_1"} : i1
    %168 = comb.and bin %163, %47 : i1
    %169 = comb.or %168, %48 {sv.namehint = "wen_2"} : i1
    %170 = comb.and bin %163, %49 : i1
    %171 = comb.or %170, %50 {sv.namehint = "wen_3"} : i1
    %172 = comb.xor bin %willDrop, %true {sv.namehint = "_hit_T"} : i1
    %173 = comb.mux bin %163, %172, %102 : i1
    %174 = comb.mux bin %163, %59, %162 : i1
    %175 = comb.mux bin %163, %answerData, %22 : i32
    %176 = comb.concat %24, %c1_i2 {sv.namehint = "_state_T_11"} : i1, i2
    %177 = comb.xor %io_cpuIO_cpuReq_valid, %true : i1
    %178 = comb.or %willDrop, %177 : i1
    %179 = comb.mux bin %178, %c0_i3, %176 {sv.namehint = "_state_T_13"} : i3
    %180 = comb.mux bin %163, %179, %118 : i3
    %181 = comb.icmp bin eq %state, %c-3_i3 : i3
    %182 = comb.or bin %willDrop, %59 {sv.namehint = "_hit_T_1"} : i1
    %183 = comb.xor %182, %true : i1
    %184 = comb.and %183, %finish {sv.namehint = "_hit_T_2"} : i1
    %185 = comb.mux bin %181, %184, %173 {sv.namehint = "hit"} : i1
    %186 = comb.xor bin %59, %true {sv.namehint = "_valid_T"} : i1
    %187 = comb.xor bin %finish, %true {sv.namehint = "_valid_T_1"} : i1
    %188 = comb.extract %rdata from 0 {sv.namehint = "_io_cpuIO_cpuResult_data_WIRE_0"} : (i64) -> i32
    %189 = comb.extract %rdata from 32 {sv.namehint = "_io_cpuIO_cpuResult_data_WIRE_1"} : (i64) -> i32
    %190 = comb.extract %addr from 2 {sv.namehint = "_io_cpuIO_cpuResult_data_T_2"} : (i32) -> i1
    %191 = comb.mux bin %190, %189, %188 : i32
    %192 = comb.mux bin %181, %191, %175 {sv.namehint = "io_cpuIO_cpuResult_data"} : i32
    %193 = comb.and bin %59, %ready : i1
    %194 = comb.or bin %finish, %193 : i1
    %195 = comb.and bin %io_cpuIO_cpuReq_valid, %24 : i1
    %196 = comb.mux bin %195, %c-3_i3, %c0_i3 : i3
    %197 = comb.and bin %181, %194 : i1
    %198 = comb.mux bin %197, %196, %180 : i3
    %199 = comb.xor bin %io_cpuIO_cpuReq_valid, %true : i1
    %200 = comb.or bin %26, %199 : i1
    %201 = comb.and bin %59, %200 : i1
    %202 = comb.or %201, %174 : i1
    %203 = comb.xor %194, %true : i1
    %204 = comb.and %203, %202 : i1
    %205 = comb.mux bin %181, %204, %174 : i1
    hw.output %192, %185, %28, %33, %30, %32, %66 : i32, i1, i1, i32, i8, i3, i1
  }
  hw.module private @DCache(in %clock : !seq.clock, in %reset : i1, in %io_cpuIO_cpuReq_addr : i32, in %io_cpuIO_cpuReq_data : i64, in %io_cpuIO_cpuReq_size : i3, in %io_cpuIO_cpuReq_rw : i1, in %io_cpuIO_cpuReq_wmask : i8, in %io_cpuIO_cpuReq_valid : i1, in %io_cpuIO_cpuReq_revoke : i1, out io_cpuIO_cpuResult_data : i64, out io_cpuIO_cpuResult_ready : i1, in %io_memIO_aw_ready : i1, out io_memIO_aw_valid : i1, out io_memIO_aw_bits_addr : i32, out io_memIO_aw_bits_len : i8, out io_memIO_aw_bits_size : i3, in %io_memIO_ar_ready : i1, out io_memIO_ar_valid : i1, out io_memIO_ar_bits_addr : i32, out io_memIO_ar_bits_len : i8, out io_memIO_ar_bits_size : i3, in %io_memIO_w_ready : i1, out io_memIO_w_valid : i1, out io_memIO_w_bits_data : i64, out io_memIO_w_bits_strb : i8, out io_memIO_w_bits_last : i1, in %io_memIO_b_valid : i1, in %io_memIO_r_valid : i1, in %io_memIO_r_bits_data : i64, out io_clintIO_wen : i1, out io_clintIO_addr : i2, in %io_clintIO_rdata : i64, out io_clintIO_wdata : i64, out io_plicIO_wen : i1, out io_plicIO_addr : i26, in %io_plicIO_rdata : i32, out io_plicIO_wdata : i32, out io_wb_ready : i1, in %io_wb_valid : i1) {
    %c1_i6 = hw.constant 1 : i6
    %c0_i7 = hw.constant 0 : i7
    %c201326591_i32 = hw.constant 201326591 : i32
    %c268435456_i32 = hw.constant 268435456 : i32
    %c33554432_i32 = hw.constant 33554432 : i32
    %c33570816_i32 = hw.constant 33570816 : i32
    %c33603576_i32 = hw.constant 33603576 : i32
    %c-1_i6 = hw.constant -1 : i6
    %c-1_i4 = hw.constant -1 : i4
    %c-1_i16 = hw.constant -1 : i16
    %c0_i32 = hw.constant 0 : i32
    %c-1_i2 = hw.constant -1 : i2
    %c0_i3 = hw.constant 0 : i3
    %c1_i4 = hw.constant 1 : i4
    %c2_i4 = hw.constant 2 : i4
    %c3_i4 = hw.constant 3 : i4
    %c4_i4 = hw.constant 4 : i4
    %c5_i4 = hw.constant 5 : i4
    %c6_i4 = hw.constant 6 : i4
    %c7_i4 = hw.constant 7 : i4
    %c-8_i4 = hw.constant -8 : i4
    %c-7_i4 = hw.constant -7 : i4
    %c3_i3 = hw.constant 3 : i3
    %c-2_i2 = hw.constant -2 : i2
    %c0_i2 = hw.constant 0 : i2
    %c0_i64 = hw.constant 0 : i64
    %c-1_i8 = hw.constant -1 : i8
    %c0_i4 = hw.constant 0 : i4
    %c1_i2 = hw.constant 1 : i2
    %true = hw.constant true
    %false = hw.constant false
    %rand_prng.io_out_0, %rand_prng.io_out_1 = hw.instance "rand_prng" @MaximalPeriodGaloisLFSR(clock: %clock: !seq.clock, reset: %reset: i1) -> (io_out_0: i1, io_out_1: i1)
    %0 = comb.concat %rand_prng.io_out_1, %rand_prng.io_out_0 {sv.namehint = "rand"} : i1, i1
    %state = seq.firreg %581 clock %clock reset sync %reset, %c0_i4 {firrtl.random_init_start = 0 : ui64} : i4
    %received = seq.firreg %443 clock %clock reset sync %reset, %false {firrtl.random_init_start = 4 : ui64} : i1
    %backAllInnerState = seq.firreg %534 clock %clock reset sync %reset, %false {firrtl.random_init_start = 5 : ui64} : i1
    %writingBackAll = seq.firreg %538 clock %clock reset sync %reset, %false {firrtl.random_init_start = 6 : ui64} : i1
    %ARVALID = seq.firreg %578 clock %clock reset sync %reset, %false {firrtl.random_init_start = 7 : ui64} : i1
    %addr = seq.firreg %525 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 38 : ui64} : i32
    %reqData = seq.firreg %312 clock %clock {firrtl.random_init_start = 70 : ui64, sv.namehint = "reqData"} : i64
    %reqRw = seq.firreg %313 clock %clock reset sync %reset, %false {firrtl.random_init_start = 134 : ui64} : i1
    %reqSize = seq.firreg %314 clock %clock {firrtl.random_init_start = 135 : ui64} : i3
    %reqWMask = seq.firreg %315 clock %clock {firrtl.random_init_start = 138 : ui64} : i8
    %1 = comb.extract %addr from 3 {sv.namehint = "addrOffset"} : (i32) -> i1
    %2 = comb.extract %addr from 4 {sv.namehint = "rAddr"} : (i32) -> i6
    %3 = comb.icmp bin eq %state, %c0_i4 {sv.namehint = "_realIndex_T"} : i4
    %4 = comb.extract %addr from 10 {sv.namehint = "addrTag"} : (i32) -> i22
    %5 = comb.extract %addr from 4 {sv.namehint = "_memAddr_T"} : (i32) -> i28
    %6 = comb.concat %5, %c0_i4 {sv.namehint = "memAddr"} : i28, i4
    %7 = comb.extract %io_memIO_r_bits_data from 0 {sv.namehint = "_rbytes_T"} : (i64) -> i8
    %8 = comb.extract %io_memIO_r_bits_data from 8 {sv.namehint = "_rbytes_T_1"} : (i64) -> i8
    %9 = comb.extract %io_memIO_r_bits_data from 16 {sv.namehint = "_rbytes_T_2"} : (i64) -> i8
    %10 = comb.extract %io_memIO_r_bits_data from 24 {sv.namehint = "_rbytes_T_3"} : (i64) -> i8
    %11 = comb.extract %io_memIO_r_bits_data from 32 {sv.namehint = "_rbytes_T_4"} : (i64) -> i8
    %12 = comb.extract %io_memIO_r_bits_data from 40 {sv.namehint = "_rbytes_T_5"} : (i64) -> i8
    %13 = comb.extract %io_memIO_r_bits_data from 48 {sv.namehint = "_rbytes_T_6"} : (i64) -> i8
    %14 = comb.extract %io_memIO_r_bits_data from 56 {sv.namehint = "_rbytes_T_7"} : (i64) -> i8
    %sregs.io_PQ = hw.instance "sregs" @SyncReadReg(clock: %clock: !seq.clock, reset: %reset: i1, io_WEN: %549: i1, io_A: %2: i6, io_D: %true: i1, io_RST: %false: i1) -> (io_PQ: i1)
    %sregs_1.io_PQ = hw.instance "sregs_1" @SyncReadReg(clock: %clock: !seq.clock, reset: %reset: i1, io_WEN: %551: i1, io_A: %2: i6, io_D: %true: i1, io_RST: %false: i1) -> (io_PQ: i1)
    %sregs_2.io_PQ = hw.instance "sregs_2" @SyncReadReg(clock: %clock: !seq.clock, reset: %reset: i1, io_WEN: %553: i1, io_A: %2: i6, io_D: %true: i1, io_RST: %false: i1) -> (io_PQ: i1)
    %sregs_3.io_PQ = hw.instance "sregs_3" @SyncReadReg(clock: %clock: !seq.clock, reset: %reset: i1, io_WEN: %555: i1, io_A: %2: i6, io_D: %true: i1, io_RST: %false: i1) -> (io_PQ: i1)
    %sregs_4.io_PQ = hw.instance "sregs_4" @SyncReadReg(clock: %clock: !seq.clock, reset: %reset: i1, io_WEN: %549: i1, io_A: %2: i6, io_D: %373: i1, io_RST: %535: i1) -> (io_PQ: i1)
    %sregs_5.io_PQ = hw.instance "sregs_5" @SyncReadReg(clock: %clock: !seq.clock, reset: %reset: i1, io_WEN: %551: i1, io_A: %2: i6, io_D: %373: i1, io_RST: %535: i1) -> (io_PQ: i1)
    %sregs_6.io_PQ = hw.instance "sregs_6" @SyncReadReg(clock: %clock: !seq.clock, reset: %reset: i1, io_WEN: %553: i1, io_A: %2: i6, io_D: %373: i1, io_RST: %535: i1) -> (io_PQ: i1)
    %sregs_7.io_PQ = hw.instance "sregs_7" @SyncReadReg(clock: %clock: !seq.clock, reset: %reset: i1, io_WEN: %555: i1, io_A: %2: i6, io_D: %373: i1, io_RST: %535: i1) -> (io_PQ: i1)
    %sregs_8.io_PQ = hw.instance "sregs_8" @SyncReadReg_4(clock: %clock: !seq.clock, io_WEN: %549: i1, io_A: %2: i6, io_D: %4: i22) -> (io_PQ: i22)
    %sregs_9.io_PQ = hw.instance "sregs_9" @SyncReadReg_4(clock: %clock: !seq.clock, io_WEN: %551: i1, io_A: %2: i6, io_D: %4: i22) -> (io_PQ: i22)
    %sregs_10.io_PQ = hw.instance "sregs_10" @SyncReadReg_4(clock: %clock: !seq.clock, io_WEN: %553: i1, io_A: %2: i6, io_D: %4: i22) -> (io_PQ: i22)
    %sregs_11.io_PQ = hw.instance "sregs_11" @SyncReadReg_4(clock: %clock: !seq.clock, io_WEN: %555: i1, io_A: %2: i6, io_D: %4: i22) -> (io_PQ: i22)
    %sram.Q = hw.instance "sram" sym @sym @S011HD1P_X32Y2D128_BW(CLK: %clock: !seq.clock, CEN: %false: i1, WEN: %170: i1, BWEN: %204: i128, A: %2: i6, D: %573: i128) -> (Q: i128)
    %sram_1.Q = hw.instance "sram_1" sym @sym_0 @S011HD1P_X32Y2D128_BW(CLK: %clock: !seq.clock, CEN: %false: i1, WEN: %205: i1, BWEN: %238: i128, A: %2: i6, D: %573: i128) -> (Q: i128)
    %sram_2.Q = hw.instance "sram_2" sym @sym_1 @S011HD1P_X32Y2D128_BW(CLK: %clock: !seq.clock, CEN: %false: i1, WEN: %239: i1, BWEN: %272: i128, A: %2: i6, D: %573: i128) -> (Q: i128)
    %sram_3.Q = hw.instance "sram_3" sym @sym_2 @S011HD1P_X32Y2D128_BW(CLK: %clock: !seq.clock, CEN: %false: i1, WEN: %273: i1, BWEN: %306: i128, A: %2: i6, D: %573: i128) -> (Q: i128)
    %grp = seq.firreg %406 clock %clock {firrtl.random_init_start = 146 : ui64} : i2
    %15 = comb.extract %reqWMask from 0 {sv.namehint = "_bwe_T"} : (i8) -> i1
    %16 = comb.xor bin %1, %true : i1
    %17 = comb.and %16, %15 : i1
    %18 = comb.and %1, %15 : i1
    %19 = comb.extract %reqWMask from 1 {sv.namehint = "_bwe_T_1"} : (i8) -> i1
    %20 = comb.xor bin %1, %true : i1
    %21 = comb.and %20, %19 : i1
    %22 = comb.and %1, %19 : i1
    %23 = comb.extract %reqWMask from 2 {sv.namehint = "_bwe_T_2"} : (i8) -> i1
    %24 = comb.xor bin %1, %true : i1
    %25 = comb.and %24, %23 : i1
    %26 = comb.and %1, %23 : i1
    %27 = comb.extract %reqWMask from 3 {sv.namehint = "_bwe_T_3"} : (i8) -> i1
    %28 = comb.xor bin %1, %true : i1
    %29 = comb.and %28, %27 : i1
    %30 = comb.and %1, %27 : i1
    %31 = comb.extract %reqWMask from 4 {sv.namehint = "_bwe_T_4"} : (i8) -> i1
    %32 = comb.xor bin %1, %true : i1
    %33 = comb.and %32, %31 : i1
    %34 = comb.and %1, %31 : i1
    %35 = comb.extract %reqWMask from 5 {sv.namehint = "_bwe_T_5"} : (i8) -> i1
    %36 = comb.xor bin %1, %true : i1
    %37 = comb.and %36, %35 : i1
    %38 = comb.and %1, %35 : i1
    %39 = comb.extract %reqWMask from 6 {sv.namehint = "_bwe_T_6"} : (i8) -> i1
    %40 = comb.xor bin %1, %true : i1
    %41 = comb.and %40, %39 : i1
    %42 = comb.and %1, %39 : i1
    %43 = comb.extract %reqWMask from 7 {sv.namehint = "_bwe_T_7"} : (i8) -> i1
    %44 = comb.xor bin %1, %true : i1
    %45 = comb.and %44, %43 : i1
    %46 = comb.and %1, %43 : i1
    %way = seq.firreg %519 clock %clock {firrtl.random_init_start = 148 : ui64} : i2
    %47 = comb.extract %io_cpuIO_cpuReq_addr from 31 : (i32) -> i1
    %48 = comb.icmp bin eq %io_cpuIO_cpuReq_addr, %c33603576_i32 {sv.namehint = "_isClint_T"} : i32
    %49 = comb.icmp bin eq %io_cpuIO_cpuReq_addr, %c33570816_i32 {sv.namehint = "_address_T_1"} : i32
    %50 = comb.icmp bin eq %io_cpuIO_cpuReq_addr, %c33554432_i32 {sv.namehint = "_address_T_2"} : i32
    %51 = comb.or bin %48, %49, %50 {sv.namehint = "isClint"} : i1
    %52 = comb.concat %false, %49 : i1, i1
    %53 = comb.mux bin %50, %c-2_i2, %52 {sv.namehint = "_address_T_3"} : i2
    %address = seq.firreg %54 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 150 : ui64, sv.namehint = "address"} : i2
    %54 = comb.mux bin %51, %53, %address : i2
    %55 = comb.icmp bin eq %state, %c-8_i4 {sv.namehint = "_io_clintIO_wen_T"} : i4
    %56 = comb.and bin %55, %reqRw {sv.namehint = "io_clintIO_wen"} : i1
    %57 = comb.icmp bin ugt %io_cpuIO_cpuReq_addr, %c201326591_i32 {sv.namehint = "_isPlic_T"} : i32
    %58 = comb.icmp bin ult %io_cpuIO_cpuReq_addr, %c268435456_i32 {sv.namehint = "_isPlic_T_1"} : i32
    %59 = comb.and bin %57, %58 {sv.namehint = "isPlic"} : i1
    %address_1 = seq.firreg %60 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 152 : ui64} : i32
    %60 = comb.mux bin %59, %io_cpuIO_cpuReq_addr, %address_1 : i32
    %61 = comb.extract %address_1 from 0 {sv.namehint = "io_plicIO_addr"} : (i32) -> i26
    %62 = comb.extract %address_1 from 2 {sv.namehint = "_io_plicIO_wdata_T"} : (i32) -> i1
    %63 = comb.extract %reqData from 32 {sv.namehint = "_io_plicIO_wdata_T_1"} : (i64) -> i32
    %64 = comb.extract %reqData from 0 {sv.namehint = "_io_plicIO_wdata_T_2"} : (i64) -> i32
    %65 = comb.mux bin %62, %63, %64 {sv.namehint = "io_plicIO_wdata"} : i32
    %66 = comb.icmp bin eq %state, %c-7_i4 {sv.namehint = "_io_plicIO_wen_T"} : i4
    %67 = comb.and bin %66, %reqRw {sv.namehint = "io_plicIO_wen"} : i1
    %68 = hw.array_create %sregs_11.io_PQ, %sregs_10.io_PQ, %sregs_9.io_PQ, %sregs_8.io_PQ : i22
    %69 = hw.array_get %68[%way] : !hw.array<4xi22>, i2
    %70 = comb.concat %69, %2, %c0_i4 : i22, i6, i4
    %used = seq.firreg %74 clock %clock reset sync %reset, %false {firrtl.random_init_start = 184 : ui64} : i1
    %buffer = seq.firreg %80 clock %clock {firrtl.random_init_start = 185 : ui64} : i128
    %ready = seq.firreg %104 clock %clock reset sync %reset, %true {firrtl.random_init_start = 313 : ui64} : i1
    %wbAddr = seq.firreg %81 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 314 : ui64} : i32
    %AWVALID = seq.firreg %85 clock %clock reset sync %reset, %false {firrtl.random_init_start = 346 : ui64} : i1
    %WVALID = seq.firreg %94 clock %clock reset sync %reset, %false {firrtl.random_init_start = 347 : ui64} : i1
    %sent = seq.firreg %103 clock %clock reset sync %reset, %false {firrtl.random_init_start = 348 : ui64} : i1
    %71 = comb.extract %buffer from 0 {sv.namehint = "wdata_0"} : (i128) -> i64
    %72 = comb.extract %buffer from 64 {sv.namehint = "wdata_1"} : (i128) -> i64
    %73 = comb.and bin %ready, %417 : i1
    %74 = comb.or %73, %used : i1
    %75 = comb.xor %417, %true : i1
    %76 = comb.or %417, %AWVALID : i1
    %77 = comb.or %417, %WVALID : i1
    %78 = hw.array_create %sram_3.Q, %sram_2.Q, %sram_1.Q, %sram.Q : i128
    %79 = hw.array_get %78[%way] : !hw.array<4xi128>, i2
    %80 = comb.mux bin %73, %79, %buffer : i128
    %81 = comb.mux bin %73, %70, %wbAddr : i32
    %82 = comb.and bin %io_memIO_aw_ready, %110 : i1
    %83 = comb.xor %82, %true : i1
    %84 = comb.and %83, %AWVALID : i1
    %85 = comb.mux bin %ready, %76, %84 : i1
    %86 = comb.and bin %io_memIO_w_ready, %115 : i1
    %87 = comb.mux bin %sent, %72, %71 : i64
    %88 = comb.xor %86, %true : i1
    %89 = comb.or %ready, %88 : i1
    %90 = comb.mux bin %89, %c0_i64, %87 {sv.namehint = "wireWdata"} : i64
    %91 = comb.and bin %86, %sent : i1
    %92 = comb.xor %91, %true : i1
    %93 = comb.and %92, %WVALID : i1
    %94 = comb.mux bin %ready, %77, %93 : i1
    %95 = comb.and %86, %sent : i1
    %96 = comb.xor %ready, %true : i1
    %97 = comb.and %96, %95 : i1
    %98 = comb.add bin %sent, %true {sv.namehint = "_sent_T"} : i1
    %99 = comb.xor %sent, %true : i1
    %100 = comb.and %99, %98 : i1
    %101 = comb.xor %86, %true : i1
    %102 = comb.or %ready, %101 : i1
    %103 = comb.mux bin %102, %sent, %100 : i1
    %104 = comb.mux bin %ready, %75, %io_memIO_b_valid : i1
    %ready_1 = seq.firreg %142 clock %clock reset sync %reset, %true {firrtl.random_init_start = 349 : ui64} : i1
    %finish = seq.firreg %143 clock %clock reset sync %reset, %false {firrtl.random_init_start = 350 : ui64} : i1
    %ARVALID_1 = seq.firreg %145 clock %clock reset sync %reset, %true {firrtl.random_init_start = 351 : ui64} : i1
    %rdata = seq.firreg %147 clock %clock {firrtl.random_init_start = 352 : ui64} : i64
    %105 = comb.and bin %ready_1, %490, %492 : i1
    %106 = comb.xor bin %ready_1, %true : i1
    %107 = comb.or bin %105, %106 : i1
    %AWVALID_1 = seq.firreg %127 clock %clock reset sync %reset, %true {firrtl.random_init_start = 416 : ui64} : i1
    %WVALID_1 = seq.firreg %129 clock %clock reset sync %reset, %true {firrtl.random_init_start = 417 : ui64} : i1
    %108 = comb.and bin %reqRw, %ready : i1
    %109 = comb.and bin %107, %108 : i1
    %110 = comb.mux bin %109, %AWVALID_1, %AWVALID {sv.namehint = "io_memIO_aw_valid"} : i1
    %111 = comb.xor %109, %true : i1
    %112 = comb.concat %c0_i7, %111 {sv.namehint = "io_memIO_aw_bits_len"} : i7, i1
    %113 = comb.mux bin %109, %reqSize, %c3_i3 {sv.namehint = "io_memIO_aw_bits_size"} : i3
    %114 = comb.mux bin %109, %addr, %wbAddr {sv.namehint = "io_memIO_aw_bits_addr"} : i32
    %115 = comb.mux bin %109, %WVALID_1, %WVALID {sv.namehint = "io_memIO_w_valid"} : i1
    %116 = comb.or %ready, %95 : i1
    %117 = comb.and bin %107, %reqRw : i1
    %118 = comb.mux bin %117, %116, %97 {sv.namehint = "io_memIO_w_bits_last"} : i1
    %119 = comb.mux bin %109, %reqData, %90 {sv.namehint = "io_memIO_w_bits_data"} : i64
    %120 = comb.mux bin %109, %reqWMask, %c-1_i8 {sv.namehint = "io_memIO_w_bits_strb"} : i8
    %121 = comb.xor %82, %true : i1
    %122 = comb.and %121, %AWVALID_1 : i1
    %123 = comb.xor %86, %true : i1
    %124 = comb.and %123, %WVALID_1 : i1
    %125 = comb.and %108, %io_memIO_b_valid : i1
    %126 = comb.or %io_memIO_b_valid, %122 : i1
    %127 = comb.mux bin %108, %126, %AWVALID_1 : i1
    %128 = comb.or %io_memIO_b_valid, %124 : i1
    %129 = comb.mux bin %108, %128, %WVALID_1 : i1
    %130 = comb.xor bin %reqRw, %true : i1
    %131 = comb.and bin %107, %130 : i1
    %132 = comb.mux bin %131, %ARVALID_1, %ARVALID {sv.namehint = "io_memIO_ar_valid"} : i1
    %133 = comb.xor %131, %true : i1
    %134 = comb.concat %c0_i7, %133 {sv.namehint = "io_memIO_ar_bits_len"} : i7, i1
    %135 = comb.mux bin %131, %reqSize, %c3_i3 {sv.namehint = "io_memIO_ar_bits_size"} : i3
    %136 = comb.mux bin %131, %addr, %6 {sv.namehint = "io_memIO_ar_bits_addr"} : i32
    %137 = comb.and bin %io_memIO_ar_ready, %132 : i1
    %138 = comb.xor %137, %true : i1
    %139 = comb.and %138, %ARVALID_1 : i1
    %140 = comb.and bin %130, %io_memIO_r_valid : i1
    %141 = comb.or %140, %125 : i1
    %142 = comb.mux bin %107, %141, %ready_1 : i1
    %143 = comb.and %107, %141 : i1
    %144 = comb.or %io_memIO_r_valid, %139 : i1
    %145 = comb.mux bin %131, %144, %ARVALID_1 : i1
    %146 = comb.and bin %107, %140 : i1
    %147 = comb.mux bin %146, %io_memIO_r_bits_data, %rdata : i64
    %inBuffer = seq.firreg %437 clock %clock {firrtl.random_init_start = 418 : ui64} : i128
    %148 = comb.icmp bin ne %grp, %c0_i2 : i2
    %149 = comb.extract %sram.Q from 0 {sv.namehint = "_wordData_WIRE_0"} : (i128) -> i64
    %150 = comb.extract %sram.Q from 64 {sv.namehint = "_wordData_WIRE_1"} : (i128) -> i64
    %151 = comb.icmp bin eq %grp, %c1_i2 {sv.namehint = "_wordData_T_3"} : i2
    %152 = comb.extract %sram_1.Q from 0 {sv.namehint = "_wordData_WIRE_1_0"} : (i128) -> i64
    %153 = comb.extract %sram_1.Q from 64 {sv.namehint = "_wordData_WIRE_1_1"} : (i128) -> i64
    %154 = comb.icmp bin eq %grp, %c-2_i2 {sv.namehint = "_wordData_T_6"} : i2
    %155 = comb.extract %sram_2.Q from 0 {sv.namehint = "_wordData_WIRE_2_0"} : (i128) -> i64
    %156 = comb.extract %sram_2.Q from 64 {sv.namehint = "_wordData_WIRE_2_1"} : (i128) -> i64
    %157 = comb.icmp bin eq %grp, %c-1_i2 {sv.namehint = "_wordData_T_9"} : i2
    %158 = comb.extract %sram_3.Q from 0 {sv.namehint = "_wordData_WIRE_3_0"} : (i128) -> i64
    %159 = comb.extract %sram_3.Q from 64 {sv.namehint = "_wordData_WIRE_3_1"} : (i128) -> i64
    %160 = comb.mux bin %1, %150, %149 : i64
    %161 = comb.mux bin %148, %c0_i64, %160 {sv.namehint = "_wordData_T_12"} : i64
    %162 = comb.mux bin %1, %153, %152 : i64
    %163 = comb.mux bin %151, %162, %c0_i64 {sv.namehint = "_wordData_T_13"} : i64
    %164 = comb.mux bin %1, %156, %155 : i64
    %165 = comb.mux bin %154, %164, %c0_i64 {sv.namehint = "_wordData_T_14"} : i64
    %166 = comb.mux bin %1, %159, %158 : i64
    %167 = comb.mux bin %157, %166, %c0_i64 {sv.namehint = "_wordData_T_15"} : i64
    %168 = comb.or bin %161, %163, %165, %167 {sv.namehint = "wordData"} : i64
    %169 = comb.concat %572, %571, %570, %569, %568, %567, %566, %565, %564, %563, %562, %561, %560, %559, %558, %557 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %170 = comb.xor bin %549, %true {sv.namehint = "_sram_io_WEN_T"} : i1
    %171 = comb.xor bin %169, %c-1_i16 {sv.namehint = "_sram_io_BWEN_T_106"} : i16
    %172 = comb.extract %171 from 0 {sv.namehint = "_sram_io_BWEN_T_5"} : (i16) -> i1
    %173 = comb.extract %171 from 1 {sv.namehint = "_sram_io_BWEN_T_6"} : (i16) -> i1
    %174 = comb.extract %171 from 2 {sv.namehint = "_sram_io_BWEN_T_7"} : (i16) -> i1
    %175 = comb.extract %171 from 3 {sv.namehint = "_sram_io_BWEN_T_8"} : (i16) -> i1
    %176 = comb.extract %171 from 4 {sv.namehint = "_sram_io_BWEN_T_9"} : (i16) -> i1
    %177 = comb.extract %171 from 5 {sv.namehint = "_sram_io_BWEN_T_10"} : (i16) -> i1
    %178 = comb.extract %171 from 6 {sv.namehint = "_sram_io_BWEN_T_11"} : (i16) -> i1
    %179 = comb.extract %171 from 7 {sv.namehint = "_sram_io_BWEN_T_12"} : (i16) -> i1
    %180 = comb.extract %171 from 8 {sv.namehint = "_sram_io_BWEN_T_13"} : (i16) -> i1
    %181 = comb.extract %171 from 9 {sv.namehint = "_sram_io_BWEN_T_14"} : (i16) -> i1
    %182 = comb.extract %171 from 10 {sv.namehint = "_sram_io_BWEN_T_15"} : (i16) -> i1
    %183 = comb.extract %171 from 11 {sv.namehint = "_sram_io_BWEN_T_16"} : (i16) -> i1
    %184 = comb.extract %171 from 12 {sv.namehint = "_sram_io_BWEN_T_17"} : (i16) -> i1
    %185 = comb.extract %171 from 13 {sv.namehint = "_sram_io_BWEN_T_18"} : (i16) -> i1
    %186 = comb.extract %171 from 14 {sv.namehint = "_sram_io_BWEN_T_19"} : (i16) -> i1
    %187 = comb.extract %171 from 15 {sv.namehint = "_sram_io_BWEN_T_20"} : (i16) -> i1
    %188 = comb.replicate %172 {sv.namehint = "_sram_io_BWEN_T_21"} : (i1) -> i8
    %189 = comb.replicate %173 {sv.namehint = "_sram_io_BWEN_T_22"} : (i1) -> i8
    %190 = comb.replicate %174 {sv.namehint = "_sram_io_BWEN_T_23"} : (i1) -> i8
    %191 = comb.replicate %175 {sv.namehint = "_sram_io_BWEN_T_24"} : (i1) -> i8
    %192 = comb.replicate %176 {sv.namehint = "_sram_io_BWEN_T_25"} : (i1) -> i8
    %193 = comb.replicate %177 {sv.namehint = "_sram_io_BWEN_T_26"} : (i1) -> i8
    %194 = comb.replicate %178 {sv.namehint = "_sram_io_BWEN_T_27"} : (i1) -> i8
    %195 = comb.replicate %179 {sv.namehint = "_sram_io_BWEN_T_28"} : (i1) -> i8
    %196 = comb.replicate %180 {sv.namehint = "_sram_io_BWEN_T_29"} : (i1) -> i8
    %197 = comb.replicate %181 {sv.namehint = "_sram_io_BWEN_T_30"} : (i1) -> i8
    %198 = comb.replicate %182 {sv.namehint = "_sram_io_BWEN_T_31"} : (i1) -> i8
    %199 = comb.replicate %183 {sv.namehint = "_sram_io_BWEN_T_32"} : (i1) -> i8
    %200 = comb.replicate %184 {sv.namehint = "_sram_io_BWEN_T_33"} : (i1) -> i8
    %201 = comb.replicate %185 {sv.namehint = "_sram_io_BWEN_T_34"} : (i1) -> i8
    %202 = comb.replicate %186 {sv.namehint = "_sram_io_BWEN_T_35"} : (i1) -> i8
    %203 = comb.replicate %187 {sv.namehint = "_sram_io_BWEN_T_36"} : (i1) -> i8
    %204 = comb.concat %203, %202, %201, %200, %199, %198, %197, %196, %195, %194, %193, %192, %191, %190, %189, %188 {sv.namehint = "_sram_io_BWEN_T_37"} : i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8
    %205 = comb.xor bin %551, %true {sv.namehint = "_sram_io_WEN_T_1"} : i1
    %206 = comb.extract %171 from 0 {sv.namehint = "_sram_io_BWEN_T_39"} : (i16) -> i1
    %207 = comb.extract %171 from 1 {sv.namehint = "_sram_io_BWEN_T_40"} : (i16) -> i1
    %208 = comb.extract %171 from 2 {sv.namehint = "_sram_io_BWEN_T_41"} : (i16) -> i1
    %209 = comb.extract %171 from 3 {sv.namehint = "_sram_io_BWEN_T_42"} : (i16) -> i1
    %210 = comb.extract %171 from 4 {sv.namehint = "_sram_io_BWEN_T_43"} : (i16) -> i1
    %211 = comb.extract %171 from 5 {sv.namehint = "_sram_io_BWEN_T_44"} : (i16) -> i1
    %212 = comb.extract %171 from 6 {sv.namehint = "_sram_io_BWEN_T_45"} : (i16) -> i1
    %213 = comb.extract %171 from 7 {sv.namehint = "_sram_io_BWEN_T_46"} : (i16) -> i1
    %214 = comb.extract %171 from 8 {sv.namehint = "_sram_io_BWEN_T_47"} : (i16) -> i1
    %215 = comb.extract %171 from 9 {sv.namehint = "_sram_io_BWEN_T_48"} : (i16) -> i1
    %216 = comb.extract %171 from 10 {sv.namehint = "_sram_io_BWEN_T_49"} : (i16) -> i1
    %217 = comb.extract %171 from 11 {sv.namehint = "_sram_io_BWEN_T_50"} : (i16) -> i1
    %218 = comb.extract %171 from 12 {sv.namehint = "_sram_io_BWEN_T_51"} : (i16) -> i1
    %219 = comb.extract %171 from 13 {sv.namehint = "_sram_io_BWEN_T_52"} : (i16) -> i1
    %220 = comb.extract %171 from 14 {sv.namehint = "_sram_io_BWEN_T_53"} : (i16) -> i1
    %221 = comb.extract %171 from 15 {sv.namehint = "_sram_io_BWEN_T_54"} : (i16) -> i1
    %222 = comb.replicate %206 {sv.namehint = "_sram_io_BWEN_T_55"} : (i1) -> i8
    %223 = comb.replicate %207 {sv.namehint = "_sram_io_BWEN_T_56"} : (i1) -> i8
    %224 = comb.replicate %208 {sv.namehint = "_sram_io_BWEN_T_57"} : (i1) -> i8
    %225 = comb.replicate %209 {sv.namehint = "_sram_io_BWEN_T_58"} : (i1) -> i8
    %226 = comb.replicate %210 {sv.namehint = "_sram_io_BWEN_T_59"} : (i1) -> i8
    %227 = comb.replicate %211 {sv.namehint = "_sram_io_BWEN_T_60"} : (i1) -> i8
    %228 = comb.replicate %212 {sv.namehint = "_sram_io_BWEN_T_61"} : (i1) -> i8
    %229 = comb.replicate %213 {sv.namehint = "_sram_io_BWEN_T_62"} : (i1) -> i8
    %230 = comb.replicate %214 {sv.namehint = "_sram_io_BWEN_T_63"} : (i1) -> i8
    %231 = comb.replicate %215 {sv.namehint = "_sram_io_BWEN_T_64"} : (i1) -> i8
    %232 = comb.replicate %216 {sv.namehint = "_sram_io_BWEN_T_65"} : (i1) -> i8
    %233 = comb.replicate %217 {sv.namehint = "_sram_io_BWEN_T_66"} : (i1) -> i8
    %234 = comb.replicate %218 {sv.namehint = "_sram_io_BWEN_T_67"} : (i1) -> i8
    %235 = comb.replicate %219 {sv.namehint = "_sram_io_BWEN_T_68"} : (i1) -> i8
    %236 = comb.replicate %220 {sv.namehint = "_sram_io_BWEN_T_69"} : (i1) -> i8
    %237 = comb.replicate %221 {sv.namehint = "_sram_io_BWEN_T_70"} : (i1) -> i8
    %238 = comb.concat %237, %236, %235, %234, %233, %232, %231, %230, %229, %228, %227, %226, %225, %224, %223, %222 {sv.namehint = "_sram_io_BWEN_T_71"} : i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8
    %239 = comb.xor bin %553, %true {sv.namehint = "_sram_io_WEN_T_2"} : i1
    %240 = comb.extract %171 from 0 {sv.namehint = "_sram_io_BWEN_T_73"} : (i16) -> i1
    %241 = comb.extract %171 from 1 {sv.namehint = "_sram_io_BWEN_T_74"} : (i16) -> i1
    %242 = comb.extract %171 from 2 {sv.namehint = "_sram_io_BWEN_T_75"} : (i16) -> i1
    %243 = comb.extract %171 from 3 {sv.namehint = "_sram_io_BWEN_T_76"} : (i16) -> i1
    %244 = comb.extract %171 from 4 {sv.namehint = "_sram_io_BWEN_T_77"} : (i16) -> i1
    %245 = comb.extract %171 from 5 {sv.namehint = "_sram_io_BWEN_T_78"} : (i16) -> i1
    %246 = comb.extract %171 from 6 {sv.namehint = "_sram_io_BWEN_T_79"} : (i16) -> i1
    %247 = comb.extract %171 from 7 {sv.namehint = "_sram_io_BWEN_T_80"} : (i16) -> i1
    %248 = comb.extract %171 from 8 {sv.namehint = "_sram_io_BWEN_T_81"} : (i16) -> i1
    %249 = comb.extract %171 from 9 {sv.namehint = "_sram_io_BWEN_T_82"} : (i16) -> i1
    %250 = comb.extract %171 from 10 {sv.namehint = "_sram_io_BWEN_T_83"} : (i16) -> i1
    %251 = comb.extract %171 from 11 {sv.namehint = "_sram_io_BWEN_T_84"} : (i16) -> i1
    %252 = comb.extract %171 from 12 {sv.namehint = "_sram_io_BWEN_T_85"} : (i16) -> i1
    %253 = comb.extract %171 from 13 {sv.namehint = "_sram_io_BWEN_T_86"} : (i16) -> i1
    %254 = comb.extract %171 from 14 {sv.namehint = "_sram_io_BWEN_T_87"} : (i16) -> i1
    %255 = comb.extract %171 from 15 {sv.namehint = "_sram_io_BWEN_T_88"} : (i16) -> i1
    %256 = comb.replicate %240 {sv.namehint = "_sram_io_BWEN_T_89"} : (i1) -> i8
    %257 = comb.replicate %241 {sv.namehint = "_sram_io_BWEN_T_90"} : (i1) -> i8
    %258 = comb.replicate %242 {sv.namehint = "_sram_io_BWEN_T_91"} : (i1) -> i8
    %259 = comb.replicate %243 {sv.namehint = "_sram_io_BWEN_T_92"} : (i1) -> i8
    %260 = comb.replicate %244 {sv.namehint = "_sram_io_BWEN_T_93"} : (i1) -> i8
    %261 = comb.replicate %245 {sv.namehint = "_sram_io_BWEN_T_94"} : (i1) -> i8
    %262 = comb.replicate %246 {sv.namehint = "_sram_io_BWEN_T_95"} : (i1) -> i8
    %263 = comb.replicate %247 {sv.namehint = "_sram_io_BWEN_T_96"} : (i1) -> i8
    %264 = comb.replicate %248 {sv.namehint = "_sram_io_BWEN_T_97"} : (i1) -> i8
    %265 = comb.replicate %249 {sv.namehint = "_sram_io_BWEN_T_98"} : (i1) -> i8
    %266 = comb.replicate %250 {sv.namehint = "_sram_io_BWEN_T_99"} : (i1) -> i8
    %267 = comb.replicate %251 {sv.namehint = "_sram_io_BWEN_T_100"} : (i1) -> i8
    %268 = comb.replicate %252 {sv.namehint = "_sram_io_BWEN_T_101"} : (i1) -> i8
    %269 = comb.replicate %253 {sv.namehint = "_sram_io_BWEN_T_102"} : (i1) -> i8
    %270 = comb.replicate %254 {sv.namehint = "_sram_io_BWEN_T_103"} : (i1) -> i8
    %271 = comb.replicate %255 {sv.namehint = "_sram_io_BWEN_T_104"} : (i1) -> i8
    %272 = comb.concat %271, %270, %269, %268, %267, %266, %265, %264, %263, %262, %261, %260, %259, %258, %257, %256 {sv.namehint = "_sram_io_BWEN_T_105"} : i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8
    %273 = comb.xor bin %555, %true {sv.namehint = "_sram_io_WEN_T_3"} : i1
    %274 = comb.extract %171 from 0 {sv.namehint = "_sram_io_BWEN_T_107"} : (i16) -> i1
    %275 = comb.extract %171 from 1 {sv.namehint = "_sram_io_BWEN_T_108"} : (i16) -> i1
    %276 = comb.extract %171 from 2 {sv.namehint = "_sram_io_BWEN_T_109"} : (i16) -> i1
    %277 = comb.extract %171 from 3 {sv.namehint = "_sram_io_BWEN_T_110"} : (i16) -> i1
    %278 = comb.extract %171 from 4 {sv.namehint = "_sram_io_BWEN_T_111"} : (i16) -> i1
    %279 = comb.extract %171 from 5 {sv.namehint = "_sram_io_BWEN_T_112"} : (i16) -> i1
    %280 = comb.extract %171 from 6 {sv.namehint = "_sram_io_BWEN_T_113"} : (i16) -> i1
    %281 = comb.extract %171 from 7 {sv.namehint = "_sram_io_BWEN_T_114"} : (i16) -> i1
    %282 = comb.extract %171 from 8 {sv.namehint = "_sram_io_BWEN_T_115"} : (i16) -> i1
    %283 = comb.extract %171 from 9 {sv.namehint = "_sram_io_BWEN_T_116"} : (i16) -> i1
    %284 = comb.extract %171 from 10 {sv.namehint = "_sram_io_BWEN_T_117"} : (i16) -> i1
    %285 = comb.extract %171 from 11 {sv.namehint = "_sram_io_BWEN_T_118"} : (i16) -> i1
    %286 = comb.extract %171 from 12 {sv.namehint = "_sram_io_BWEN_T_119"} : (i16) -> i1
    %287 = comb.extract %171 from 13 {sv.namehint = "_sram_io_BWEN_T_120"} : (i16) -> i1
    %288 = comb.extract %171 from 14 {sv.namehint = "_sram_io_BWEN_T_121"} : (i16) -> i1
    %289 = comb.extract %171 from 15 {sv.namehint = "_sram_io_BWEN_T_122"} : (i16) -> i1
    %290 = comb.replicate %274 {sv.namehint = "_sram_io_BWEN_T_123"} : (i1) -> i8
    %291 = comb.replicate %275 {sv.namehint = "_sram_io_BWEN_T_124"} : (i1) -> i8
    %292 = comb.replicate %276 {sv.namehint = "_sram_io_BWEN_T_125"} : (i1) -> i8
    %293 = comb.replicate %277 {sv.namehint = "_sram_io_BWEN_T_126"} : (i1) -> i8
    %294 = comb.replicate %278 {sv.namehint = "_sram_io_BWEN_T_127"} : (i1) -> i8
    %295 = comb.replicate %279 {sv.namehint = "_sram_io_BWEN_T_128"} : (i1) -> i8
    %296 = comb.replicate %280 {sv.namehint = "_sram_io_BWEN_T_129"} : (i1) -> i8
    %297 = comb.replicate %281 {sv.namehint = "_sram_io_BWEN_T_130"} : (i1) -> i8
    %298 = comb.replicate %282 {sv.namehint = "_sram_io_BWEN_T_131"} : (i1) -> i8
    %299 = comb.replicate %283 {sv.namehint = "_sram_io_BWEN_T_132"} : (i1) -> i8
    %300 = comb.replicate %284 {sv.namehint = "_sram_io_BWEN_T_133"} : (i1) -> i8
    %301 = comb.replicate %285 {sv.namehint = "_sram_io_BWEN_T_134"} : (i1) -> i8
    %302 = comb.replicate %286 {sv.namehint = "_sram_io_BWEN_T_135"} : (i1) -> i8
    %303 = comb.replicate %287 {sv.namehint = "_sram_io_BWEN_T_136"} : (i1) -> i8
    %304 = comb.replicate %288 {sv.namehint = "_sram_io_BWEN_T_137"} : (i1) -> i8
    %305 = comb.replicate %289 {sv.namehint = "_sram_io_BWEN_T_138"} : (i1) -> i8
    %306 = comb.concat %305, %304, %303, %302, %301, %300, %299, %298, %297, %296, %295, %294, %293, %292, %291, %290 {sv.namehint = "_sram_io_BWEN_T_139"} : i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8
    %useEmpty = seq.firreg %366 clock %clock reset sync %reset, %false {firrtl.random_init_start = 546 : ui64} : i1
    %willDrop = seq.firreg %584 clock %clock reset sync %reset, %false {firrtl.random_init_start = 547 : ui64} : i1
    %compareHit = seq.firreg %411 clock %clock reset sync %reset, %false {firrtl.random_init_start = 548 : ui64} : i1
    %compDirty_0 = seq.firreg %360 clock %clock reset sync %reset, %false {firrtl.random_init_start = 549 : ui64} : i1
    %compDirty_1 = seq.firreg %361 clock %clock reset sync %reset, %false {firrtl.random_init_start = 550 : ui64} : i1
    %compDirty_2 = seq.firreg %362 clock %clock reset sync %reset, %false {firrtl.random_init_start = 551 : ui64} : i1
    %compDirty_3 = seq.firreg %363 clock %clock reset sync %reset, %false {firrtl.random_init_start = 552 : ui64} : i1
    %wbBufferGo = seq.firreg %369 clock %clock reset sync %reset, %false {firrtl.random_init_start = 553 : ui64} : i1
    %answerData = seq.firreg %449 clock %clock {firrtl.random_init_start = 554 : ui64} : i64
    %plicReadHit = seq.firreg %545 clock %clock reset sync %reset, %false {firrtl.random_init_start = 618 : ui64} : i1
    %plicRdata = seq.firreg %io_plicIO_rdata clock %clock {firrtl.random_init_start = 619 : ui64} : i32
    %307 = comb.icmp bin ne %state, %c3_i4 : i4
    %308 = comb.icmp bin ne %state, %c4_i4 : i4
    %309 = comb.icmp bin ne %state, %c7_i4 : i4
    %310 = comb.and bin %io_cpuIO_cpuReq_valid, %307, %308, %309 : i1
    %311 = comb.mux bin %310, %io_cpuIO_cpuReq_addr, %addr : i32
    %312 = comb.mux bin %310, %io_cpuIO_cpuReq_data, %reqData : i64
    %313 = comb.mux bin %310, %io_cpuIO_cpuReq_rw, %reqRw : i1
    %314 = comb.mux bin %310, %io_cpuIO_cpuReq_size, %reqSize : i3
    %315 = comb.mux bin %310, %io_cpuIO_cpuReq_wmask, %reqWMask : i8
    %316 = comb.xor %3, %true : i1
    %317 = comb.and %316, %willDrop : i1
    %318 = comb.mux bin %47, %c1_i4, %c6_i4 : i4
    %319 = comb.mux bin %51, %c-8_i4, %318 : i4
    %320 = comb.mux bin %59, %c-7_i4, %319 : i4
    %321 = comb.mux bin %io_wb_valid, %c7_i4, %state : i4
    %322 = comb.mux bin %io_cpuIO_cpuReq_valid, %320, %321 : i4
    %323 = comb.mux bin %3, %322, %state : i4
    %324 = comb.xor %io_wb_valid, %true : i1
    %325 = comb.xor %3, %true : i1
    %326 = comb.or %325, %io_cpuIO_cpuReq_valid, %324 : i1
    %327 = comb.mux bin %326, %311, %c0_i32 : i32
    %328 = comb.xor %io_wb_valid, %true : i1
    %329 = comb.xor %3, %true : i1
    %330 = comb.or %329, %io_cpuIO_cpuReq_valid, %328 : i1
    %331 = comb.mux bin %330, %way, %c0_i2 : i2
    %332 = comb.xor %io_cpuIO_cpuReq_valid, %true : i1
    %333 = comb.and %3, %332, %io_wb_valid : i1
    %334 = comb.or %333, %writingBackAll : i1
    %335 = comb.icmp bin eq %state, %c1_i4 : i4
    %336 = comb.mux bin %335, %c2_i4, %323 : i4
    %337 = comb.icmp bin eq %sregs_8.io_PQ, %4 {sv.namehint = "_compareHit_qual1_T"} : i22
    %338 = comb.icmp bin eq %sregs_9.io_PQ, %4 {sv.namehint = "_compareHit_qual1_T_2"} : i22
    %339 = comb.and bin %sregs_1.io_PQ, %338 {sv.namehint = "_grp_T_12"} : i1
    %340 = comb.icmp bin eq %sregs_10.io_PQ, %4 {sv.namehint = "_compareHit_qual1_T_4"} : i22
    %341 = comb.and bin %sregs_2.io_PQ, %340 {sv.namehint = "_grp_T_5"} : i1
    %342 = comb.icmp bin eq %sregs_11.io_PQ, %4 {sv.namehint = "_compareHit_qual1_T_6"} : i22
    %343 = comb.and bin %sregs_3.io_PQ, %342 {sv.namehint = "_grp_T_7"} : i1
    %344 = comb.concat %341, %false {sv.namehint = "_grp_T_10"} : i1, i1
    %345 = comb.replicate %343 {sv.namehint = "_grp_T_11"} : (i1) -> i2
    %346 = comb.concat %false, %339 : i1, i1
    %347 = comb.or bin %346, %344, %345 {sv.namehint = "_grp_T_14"} : i2
    %348 = comb.mux bin %335, %347, %grp : i2
    %349 = comb.and bin %sregs.io_PQ, %337 {sv.namehint = "compareHit_qual1_0"} : i1
    %350 = comb.and bin %sregs_1.io_PQ, %338 {sv.namehint = "compareHit_qual1_1"} : i1
    %351 = comb.and bin %sregs_2.io_PQ, %340 {sv.namehint = "compareHit_qual1_2"} : i1
    %352 = comb.and bin %sregs_3.io_PQ, %342 {sv.namehint = "compareHit_qual1_3"} : i1
    %353 = comb.or bin %349, %350, %351, %352 {sv.namehint = "_compareHit_T_2"} : i1
    %354 = comb.mux bin %335, %353, %compareHit : i1
    %355 = comb.mux bin %sregs.io_PQ, %0, %c0_i2 {sv.namehint = "_way_T_1"} : i2
    %356 = comb.mux bin %sregs_1.io_PQ, %355, %c1_i2 {sv.namehint = "_way_T_3"} : i2
    %357 = comb.mux bin %sregs_2.io_PQ, %356, %c-2_i2 {sv.namehint = "_way_T_5"} : i2
    %358 = comb.mux bin %sregs_3.io_PQ, %357, %c-1_i2 {sv.namehint = "_way_T_7"} : i2
    %359 = comb.mux bin %335, %358, %331 : i2
    %360 = comb.mux bin %335, %sregs_4.io_PQ, %compDirty_0 : i1
    %361 = comb.mux bin %335, %sregs_5.io_PQ, %compDirty_1 : i1
    %362 = comb.mux bin %335, %sregs_6.io_PQ, %compDirty_2 : i1
    %363 = comb.mux bin %335, %sregs_7.io_PQ, %compDirty_3 : i1
    %364 = comb.concat %sregs_3.io_PQ, %sregs_2.io_PQ, %sregs_1.io_PQ, %sregs.io_PQ {sv.namehint = "_useEmpty_T"} : i1, i1, i1, i1
    %365 = comb.icmp bin ne %364, %c-1_i4 {sv.namehint = "_useEmpty_T_2"} : i4
    %366 = comb.mux bin %335, %365, %useEmpty : i1
    %367 = comb.icmp bin eq %136, %wbAddr {sv.namehint = "_wbBufferGo_T"} : i32
    %368 = comb.and bin %used, %367 {sv.namehint = "_wbBufferGo_T_1"} : i1
    %369 = comb.mux bin %335, %368, %wbBufferGo : i1
    %370 = comb.icmp bin eq %state, %c2_i4 : i4
    %371 = comb.and %370, %compareHit : i1
    %372 = comb.and bin %370, %compareHit : i1
    %373 = comb.or %372, %reqRw {sv.namehint = "wdirty"} : i1
    %374 = comb.replicate %reqData {sv.namehint = "_wdata_T_2"} : (i64) -> i128
    %375 = comb.mux bin %372, %374, %inBuffer : i128
    %376 = comb.xor bin %148, %true : i1
    %377 = comb.and bin %370, %compareHit, %reqRw : i1
    %378 = comb.and %377, %376 : i1
    %379 = comb.icmp bin eq %grp, %c1_i2 : i2
    %380 = comb.and %377, %379 : i1
    %381 = comb.icmp bin eq %grp, %c-2_i2 : i2
    %382 = comb.and %377, %381 : i1
    %383 = comb.icmp bin eq %grp, %c-1_i2 : i2
    %384 = comb.and %377, %383 : i1
    %385 = hw.array_create %compDirty_3, %compDirty_2, %compDirty_1, %compDirty_0 : i1
    %386 = hw.array_get %385[%way] : !hw.array<4xi1>, i2
    %387 = comb.xor bin %386, %true : i1
    %388 = comb.or bin %useEmpty, %387 : i1
    %389 = comb.or %wbBufferGo, %354 : i1
    %390 = comb.xor %wbBufferGo, %true : i1
    %391 = comb.xor %compareHit, %true : i1
    %392 = comb.and %370, %391, %388, %390 : i1
    %393 = comb.or %392, %ARVALID : i1
    %394 = comb.or %388, %ready : i1
    %395 = comb.xor %compareHit, %true : i1
    %396 = comb.and %370, %395, %394, %wbBufferGo {sv.namehint = "readBack"} : i1
    %397 = comb.or bin %compareHit, %388 : i1
    %398 = comb.xor %397, %true : i1
    %399 = comb.and %370, %398, %wbBufferGo, %ready : i1
    %400 = comb.and bin %wbBufferGo, %ready : i1
    %401 = comb.or %388, %ready : i1
    %402 = comb.and %401, %wbBufferGo : i1
    %403 = comb.xor %402, %true : i1
    %404 = comb.xor %370, %true : i1
    %405 = comb.or %404, %compareHit, %403 : i1
    %406 = comb.mux bin %405, %348, %way : i2
    %407 = comb.or %400, %354 : i1
    %408 = comb.mux bin %388, %389, %407 : i1
    %409 = comb.xor %370, %true : i1
    %410 = comb.or %409, %compareHit : i1
    %411 = comb.mux bin %410, %354, %408 : i1
    %412 = comb.mux %388, %c4_i4, %c3_i4 : i4
    %413 = comb.mux bin %wbBufferGo, %336, %412 : i4
    %414 = comb.mux bin %compareHit, %c0_i4, %413 : i4
    %415 = comb.mux bin %370, %414, %336 : i4
    %416 = comb.icmp bin eq %state, %c3_i4 : i4
    %417 = comb.or %416, %399 {sv.namehint = "valid"} : i1
    %418 = comb.xor bin %writingBackAll, %true {sv.namehint = "_ARVALID_T"} : i1
    %419 = comb.and bin %416, %73 : i1
    %420 = comb.mux bin %419, %418, %393 : i1
    %421 = comb.mux bin %writingBackAll, %c7_i4, %c4_i4 {sv.namehint = "_state_T"} : i4
    %422 = comb.mux bin %419, %421, %415 : i4
    %423 = comb.icmp bin eq %way, %c-1_i2 {sv.namehint = "_addr_T"} : i2
    %424 = comb.add bin %way, %c1_i2 {sv.namehint = "_way_T_9"} : i2
    %425 = comb.mux bin %423, %c0_i2, %424 {sv.namehint = "_way_T_11"} : i2
    %426 = comb.mux bin %writingBackAll, %425, %way {sv.namehint = "_way_T_12"} : i2
    %427 = comb.mux bin %419, %426, %359 : i2
    %428 = comb.and bin %writingBackAll, %423 {sv.namehint = "_addr_T_1"} : i1
    %429 = comb.add bin %2, %c1_i6 {sv.namehint = "_addr_T_2"} : i6
    %430 = comb.concat %4, %429, %1, %c0_i3 {sv.namehint = "_addr_T_6"} : i22, i6, i1, i3
    %431 = comb.mux bin %428, %430, %addr {sv.namehint = "_addr_T_7"} : i32
    %432 = comb.mux bin %419, %431, %327 : i32
    %433 = comb.icmp bin eq %state, %c4_i4 : i4
    %434 = comb.extract %inBuffer from 64 {sv.namehint = "_inBuffer_T_2"} : (i128) -> i64
    %435 = comb.concat %473, %470, %467, %464, %461, %458, %455, %452, %434 {sv.namehint = "_inBuffer_T_3"} : i8, i8, i8, i8, i8, i8, i8, i8, i64
    %436 = comb.and bin %433, %io_memIO_r_valid : i1
    %437 = comb.mux bin %436, %435, %inBuffer : i128
    %438 = comb.and bin %433, %io_memIO_r_valid, %received : i1
    %439 = comb.mux bin %438, %c5_i4, %422 : i4
    %440 = comb.add bin %received, %true {sv.namehint = "_received_T"} : i1
    %441 = comb.xor %received, %true : i1
    %442 = comb.and %441, %440 : i1
    %443 = comb.mux bin %436, %442, %received : i1
    %444 = comb.and bin %433, %137 : i1
    %445 = comb.xor %444, %true : i1
    %446 = comb.and %445, %420 : i1
    %447 = comb.icmp bin eq %received, %1 : i1
    %448 = comb.and bin %433, %447 : i1
    %449 = comb.mux bin %448, %io_memIO_r_bits_data, %answerData : i64
    %450 = comb.extract %reqData from 0 {sv.namehint = "_rbytes_0_T"} : (i64) -> i8
    %451 = comb.and bin %433, %447, %reqRw, %15 : i1
    %452 = comb.mux bin %451, %450, %7 {sv.namehint = "rbytes_0"} : i8
    %453 = comb.extract %reqData from 8 {sv.namehint = "_rbytes_1_T"} : (i64) -> i8
    %454 = comb.and bin %433, %447, %reqRw, %19 : i1
    %455 = comb.mux bin %454, %453, %8 {sv.namehint = "rbytes_1"} : i8
    %456 = comb.extract %reqData from 16 {sv.namehint = "_rbytes_2_T"} : (i64) -> i8
    %457 = comb.and bin %433, %447, %reqRw, %23 : i1
    %458 = comb.mux bin %457, %456, %9 {sv.namehint = "rbytes_2"} : i8
    %459 = comb.extract %reqData from 24 {sv.namehint = "_rbytes_3_T"} : (i64) -> i8
    %460 = comb.and bin %433, %447, %reqRw, %27 : i1
    %461 = comb.mux bin %460, %459, %10 {sv.namehint = "rbytes_3"} : i8
    %462 = comb.extract %reqData from 32 {sv.namehint = "_rbytes_4_T"} : (i64) -> i8
    %463 = comb.and bin %433, %447, %reqRw, %31 : i1
    %464 = comb.mux bin %463, %462, %11 {sv.namehint = "rbytes_4"} : i8
    %465 = comb.extract %reqData from 40 {sv.namehint = "_rbytes_5_T"} : (i64) -> i8
    %466 = comb.and bin %433, %447, %reqRw, %35 : i1
    %467 = comb.mux bin %466, %465, %12 {sv.namehint = "rbytes_5"} : i8
    %468 = comb.extract %reqData from 48 {sv.namehint = "_rbytes_6_T"} : (i64) -> i8
    %469 = comb.and bin %433, %447, %reqRw, %39 : i1
    %470 = comb.mux bin %469, %468, %13 {sv.namehint = "rbytes_6"} : i8
    %471 = comb.extract %reqData from 56 {sv.namehint = "_rbytes_7_T"} : (i64) -> i8
    %472 = comb.and bin %433, %447, %reqRw, %43 : i1
    %473 = comb.mux bin %472, %471, %14 {sv.namehint = "rbytes_7"} : i8
    %474 = comb.icmp bin eq %state, %c5_i4 : i4
    %475 = comb.icmp bin eq %way, %c0_i2 : i2
    %476 = comb.and bin %474, %475 : i1
    %477 = comb.or %476, %378 : i1
    %478 = comb.icmp bin eq %way, %c1_i2 : i2
    %479 = comb.and bin %474, %478 : i1
    %480 = comb.or %479, %380 : i1
    %481 = comb.icmp bin eq %way, %c-2_i2 : i2
    %482 = comb.and bin %474, %481 : i1
    %483 = comb.or %482, %382 : i1
    %484 = comb.icmp bin eq %way, %c-1_i2 : i2
    %485 = comb.and bin %474, %484 : i1
    %486 = comb.or %485, %384 : i1
    %487 = comb.xor bin %willDrop, %true {sv.namehint = "_hit_T"} : i1
    %488 = comb.mux bin %474, %487, %371 : i1
    %489 = comb.mux bin %474, %answerData, %168 : i64
    %490 = comb.icmp bin eq %state, %c6_i4 : i4
    %491 = comb.mux bin %490, %finish, %488 : i1
    %492 = comb.xor bin %finish, %true {sv.namehint = "_valid_T"} : i1
    %493 = comb.mux bin %490, %rdata, %489 : i64
    %494 = comb.and %490, %543 : i1
    %495 = comb.or %494, %474 : i1
    %496 = comb.mux bin %495, %c0_i4, %439 : i4
    %497 = comb.and bin %490, %willDrop : i1
    %498 = comb.xor %497, %true : i1
    %499 = comb.and %498, %543 {sv.namehint = "io_cpuIO_cpuResult_ready"} : i1
    %500 = comb.or bin %willDrop, %3 : i1
    %501 = comb.xor %500, %true : i1
    %502 = comb.and %501, %willDrop : i1
    %503 = comb.mux bin %490, %502, %317 : i1
    %504 = comb.icmp bin eq %state, %c7_i4 : i4
    %505 = comb.xor bin %backAllInnerState, %true : i1
    %506 = hw.array_create %sregs_3.io_PQ, %sregs_2.io_PQ, %sregs_1.io_PQ, %sregs.io_PQ : i1
    %507 = hw.array_get %506[%way] : !hw.array<4xi1>, i2
    %508 = hw.array_create %sregs_7.io_PQ, %sregs_6.io_PQ, %sregs_5.io_PQ, %sregs_4.io_PQ : i1
    %509 = hw.array_get %508[%way] : !hw.array<4xi1>, i2
    %510 = comb.and bin %507, %509 : i1
    %511 = comb.and bin %505, %510 : i1
    %512 = comb.mux bin %511, %c3_i4, %496 : i4
    %513 = comb.icmp bin eq %way, %c-1_i2 {sv.namehint = "_addr_T_8"} : i2
    %514 = comb.add bin %way, %c1_i2 {sv.namehint = "_way_T_14"} : i2
    %515 = comb.mux bin %513, %c0_i2, %514 {sv.namehint = "_way_T_16"} : i2
    %516 = comb.and bin %504, %505 : i1
    %517 = comb.xor %516, %true : i1
    %518 = comb.or %517, %510 : i1
    %519 = comb.mux bin %518, %427, %515 : i2
    %520 = comb.add bin %2, %c1_i6 {sv.namehint = "_addr_T_9"} : i6
    %521 = comb.concat %4, %520, %1, %c0_i3 {sv.namehint = "_addr_T_13"} : i22, i6, i1, i3
    %522 = comb.mux bin %513, %521, %addr {sv.namehint = "_addr_T_14"} : i32
    %523 = comb.xor %516, %true : i1
    %524 = comb.or %523, %510 : i1
    %525 = comb.mux bin %524, %432, %522 : i32
    %526 = comb.icmp bin eq %2, %c-1_i6 : i6
    %527 = comb.and bin %505, %484, %526 : i1
    %528 = comb.or %527, %backAllInnerState : i1
    %529 = comb.and bin %backAllInnerState, %ready : i1
    %530 = comb.mux bin %529, %c0_i4, %512 : i4
    %531 = comb.mux bin %504, %530, %496 : i4
    %532 = comb.xor %529, %true : i1
    %533 = comb.and %532, %528 : i1
    %534 = comb.mux bin %504, %533, %backAllInnerState : i1
    %535 = comb.and %504, %529 {sv.namehint = "io_wb_ready"} : i1
    %536 = comb.and bin %504, %529 : i1
    %537 = comb.xor %536, %true : i1
    %538 = comb.and %537, %334 : i1
    %539 = comb.or %55, %491 : i1
    %540 = comb.mux bin %55, %io_clintIO_rdata, %493 : i64
    %541 = comb.and %66, %543 : i1
    %542 = comb.or bin %reqRw, %plicReadHit {sv.namehint = "_hit_T_1"} : i1
    %543 = comb.mux bin %66, %542, %539 {sv.namehint = "hit"} : i1
    %544 = comb.xor bin %543, %true {sv.namehint = "_plicReadHit_T"} : i1
    %545 = comb.mux bin %66, %544, %plicReadHit : i1
    %546 = comb.replicate %plicRdata {sv.namehint = "_io_cpuIO_cpuResult_data_T"} : (i32) -> i64
    %547 = comb.mux bin %66, %546, %540 {sv.namehint = "io_cpuIO_cpuResult_data"} : i64
    %548 = comb.or %475, %476, %378 : i1
    %549 = comb.mux bin %396, %548, %477 {sv.namehint = "wen_0"} : i1
    %550 = comb.or %478, %479, %380 : i1
    %551 = comb.mux bin %396, %550, %480 {sv.namehint = "wen_1"} : i1
    %552 = comb.or %481, %482, %382 : i1
    %553 = comb.mux bin %396, %552, %483 {sv.namehint = "wen_2"} : i1
    %554 = comb.or %484, %485, %384 : i1
    %555 = comb.mux bin %396, %554, %486 {sv.namehint = "wen_3"} : i1
    %556 = comb.or bin %396, %474 : i1
    %557 = comb.or %556, %17 {sv.namehint = "bwe_0"} : i1
    %558 = comb.or %556, %21 {sv.namehint = "bwe_1"} : i1
    %559 = comb.or %556, %25 {sv.namehint = "bwe_2"} : i1
    %560 = comb.or %556, %29 {sv.namehint = "bwe_3"} : i1
    %561 = comb.or %556, %33 {sv.namehint = "bwe_4"} : i1
    %562 = comb.or %556, %37 {sv.namehint = "bwe_5"} : i1
    %563 = comb.or %556, %41 {sv.namehint = "bwe_6"} : i1
    %564 = comb.or %556, %45 {sv.namehint = "bwe_7"} : i1
    %565 = comb.or %556, %18 {sv.namehint = "bwe_8"} : i1
    %566 = comb.or %556, %22 {sv.namehint = "bwe_9"} : i1
    %567 = comb.or %556, %26 {sv.namehint = "bwe_10"} : i1
    %568 = comb.or %556, %30 {sv.namehint = "bwe_11"} : i1
    %569 = comb.or %556, %34 {sv.namehint = "bwe_12"} : i1
    %570 = comb.or %556, %38 {sv.namehint = "bwe_13"} : i1
    %571 = comb.or %556, %42 {sv.namehint = "bwe_14"} : i1
    %572 = comb.or %556, %46 {sv.namehint = "bwe_15"} : i1
    %573 = comb.mux bin %396, %buffer, %375 {sv.namehint = "wdata_1"} : i128
    %574 = comb.icmp bin ult %state, %c3_i4 : i4
    %575 = comb.or bin %574, %444 : i1
    %576 = comb.xor %575, %true : i1
    %577 = comb.and %576, %420 : i1
    %578 = comb.mux bin %io_cpuIO_cpuReq_revoke, %577, %446 : i1
    %579 = comb.and bin %io_cpuIO_cpuReq_revoke, %574 : i1
    %580 = comb.or %579, %541, %55 : i1
    %581 = comb.mux bin %580, %c0_i4, %531 : i4
    %582 = comb.xor %574, %true : i1
    %583 = comb.and %io_cpuIO_cpuReq_revoke, %582 : i1
    %584 = comb.or %583, %503 : i1
    hw.output %547, %499, %110, %114, %112, %113, %132, %136, %134, %135, %115, %119, %120, %118, %56, %address, %reqData, %67, %61, %65, %535 : i64, i1, i1, i32, i8, i3, i1, i32, i8, i3, i1, i64, i8, i1, i1, i2, i64, i1, i26, i32, i1
  }
  hw.module private @RVMMU(in %clock : !seq.clock, in %reset : i1, in %io_ifIO_pipelineReq_cpuReq_addr : i64, in %io_ifIO_pipelineReq_cpuReq_valid : i1, in %io_ifIO_pipelineReq_cpuReq_revoke : i1, in %io_ifIO_pipelineReq_offset : i4, out io_ifIO_pipelineResult_exception : i1, out io_ifIO_pipelineResult_cause : i4, out io_ifIO_pipelineResult_cpuResult_data : i32, out io_ifIO_pipelineResult_cpuResult_ready : i1, out io_ifIO_pipelineResult_fromMem : i1, out io_ifIO_pipelineResult_crossCache : i1, in %io_memIO_pipelineReq_cpuReq_addr : i64, in %io_memIO_pipelineReq_cpuReq_data : i64, in %io_memIO_pipelineReq_cpuReq_size : i3, in %io_memIO_pipelineReq_cpuReq_rw : i1, in %io_memIO_pipelineReq_cpuReq_wmask : i8, in %io_memIO_pipelineReq_cpuReq_valid : i1, in %io_memIO_pipelineReq_flush : i1, out io_memIO_pipelineResult_exception : i1, out io_memIO_pipelineResult_cause : i4, out io_memIO_pipelineResult_cpuResult_data : i64, out io_memIO_pipelineResult_cpuResult_ready : i1, out io_memIO_pipelineResult_isMMIO : i1, out io_icacheIO_cpuReq_addr : i32, out io_icacheIO_cpuReq_valid : i1, out io_icacheIO_cpuReq_revoke : i1, in %io_icacheIO_cpuResult_data : i32, in %io_icacheIO_cpuResult_ready : i1, out io_dcacheIO_cpuReq_addr : i32, out io_dcacheIO_cpuReq_data : i64, out io_dcacheIO_cpuReq_size : i3, out io_dcacheIO_cpuReq_rw : i1, out io_dcacheIO_cpuReq_wmask : i8, out io_dcacheIO_cpuReq_valid : i1, out io_dcacheIO_cpuReq_revoke : i1, in %io_dcacheIO_cpuResult_data : i64, in %io_dcacheIO_cpuResult_ready : i1, in %io_csrIO_0_rdata : i64, in %io_csrIO_1_rdata : i64, in %io_priv : i2, in %io_jmpBch : i1, out io_revAmo : i1) {
    %c0_i7 = hw.constant 0 : i7
    %c1_i35 = hw.constant 1 : i35
    %c0_i32 = hw.constant 0 : i32
    %c3_i3 = hw.constant 3 : i3
    %c2_i3 = hw.constant 2 : i3
    %c1_i3 = hw.constant 1 : i3
    %c-1_i26 = hw.constant -1 : i26
    %c0_i35 = hw.constant 0 : i35
    %c0_i4 = hw.constant 0 : i4
    %c-8_i4 = hw.constant -8 : i4
    %c-1_i2 = hw.constant -1 : i2
    %c0_i16 = hw.constant 0 : i16
    %c-2_i2 = hw.constant -2 : i2
    %c1_i2 = hw.constant 1 : i2
    %c-4_i4 = hw.constant -4 : i4
    %c-1_i4 = hw.constant -1 : i4
    %c-3_i4 = hw.constant -3 : i4
    %c-1_i8 = hw.constant -1 : i8
    %c1_i4 = hw.constant 1 : i4
    %c2_i4 = hw.constant 2 : i4
    %c3_i4 = hw.constant 3 : i4
    %c4_i4 = hw.constant 4 : i4
    %c5_i4 = hw.constant 5 : i4
    %c6_i4 = hw.constant 6 : i4
    %c7_i4 = hw.constant 7 : i4
    %c-7_i4 = hw.constant -7 : i4
    %c-6_i4 = hw.constant -6 : i4
    %c-5_i4 = hw.constant -5 : i4
    %c-2_i4 = hw.constant -2 : i4
    %c0_i44 = hw.constant 0 : i44
    %c0_i2 = hw.constant 0 : i2
    %c0_i9 = hw.constant 0 : i9
    %c0_i26 = hw.constant 0 : i26
    %c0_i10 = hw.constant 0 : i10
    %true = hw.constant true
    %false = hw.constant false
    %c0_i3 = hw.constant 0 : i3
    %stage = seq.firreg %2080 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 0 : ui64} : i2
    %level = seq.firreg %2044 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 2 : ui64} : i2
    %tlbEntries_0_v = seq.firreg %1558 clock %clock reset sync %reset, %false {firrtl.random_init_start = 4 : ui64} : i1
    %tlbEntries_0_r = seq.firreg %1556 clock %clock reset sync %reset, %false {firrtl.random_init_start = 5 : ui64} : i1
    %tlbEntries_0_w = seq.firreg %1554 clock %clock reset sync %reset, %false {firrtl.random_init_start = 6 : ui64} : i1
    %tlbEntries_0_x = seq.firreg %1552 clock %clock reset sync %reset, %false {firrtl.random_init_start = 7 : ui64} : i1
    %tlbEntries_0_u = seq.firreg %1550 clock %clock reset sync %reset, %false {firrtl.random_init_start = 8 : ui64} : i1
    %tlbEntries_0_d = seq.firreg %1548 clock %clock reset sync %reset, %false {firrtl.random_init_start = 10 : ui64} : i1
    %tlbEntries_0_i = seq.firreg %1546 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 11 : ui64} : i2
    %tlbEntries_0_vpn_0 = seq.firreg %1543 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 13 : ui64} : i9
    %tlbEntries_0_vpn_1 = seq.firreg %1544 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 22 : ui64} : i9
    %tlbEntries_0_vpn_2 = seq.firreg %1545 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 31 : ui64} : i9
    %tlbEntries_0_ppn = seq.firreg %1542 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 40 : ui64} : i44
    %tlbEntries_1_v = seq.firreg %1575 clock %clock reset sync %reset, %false {firrtl.random_init_start = 84 : ui64} : i1
    %tlbEntries_1_r = seq.firreg %1573 clock %clock reset sync %reset, %false {firrtl.random_init_start = 85 : ui64} : i1
    %tlbEntries_1_w = seq.firreg %1571 clock %clock reset sync %reset, %false {firrtl.random_init_start = 86 : ui64} : i1
    %tlbEntries_1_x = seq.firreg %1569 clock %clock reset sync %reset, %false {firrtl.random_init_start = 87 : ui64} : i1
    %tlbEntries_1_u = seq.firreg %1567 clock %clock reset sync %reset, %false {firrtl.random_init_start = 88 : ui64} : i1
    %tlbEntries_1_d = seq.firreg %1565 clock %clock reset sync %reset, %false {firrtl.random_init_start = 90 : ui64} : i1
    %tlbEntries_1_i = seq.firreg %1563 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 91 : ui64} : i2
    %tlbEntries_1_vpn_0 = seq.firreg %1560 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 93 : ui64} : i9
    %tlbEntries_1_vpn_1 = seq.firreg %1561 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 102 : ui64} : i9
    %tlbEntries_1_vpn_2 = seq.firreg %1562 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 111 : ui64} : i9
    %tlbEntries_1_ppn = seq.firreg %1559 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 120 : ui64} : i44
    %tlbEntries_2_v = seq.firreg %1592 clock %clock reset sync %reset, %false {firrtl.random_init_start = 164 : ui64} : i1
    %tlbEntries_2_r = seq.firreg %1590 clock %clock reset sync %reset, %false {firrtl.random_init_start = 165 : ui64} : i1
    %tlbEntries_2_w = seq.firreg %1588 clock %clock reset sync %reset, %false {firrtl.random_init_start = 166 : ui64} : i1
    %tlbEntries_2_x = seq.firreg %1586 clock %clock reset sync %reset, %false {firrtl.random_init_start = 167 : ui64} : i1
    %tlbEntries_2_u = seq.firreg %1584 clock %clock reset sync %reset, %false {firrtl.random_init_start = 168 : ui64} : i1
    %tlbEntries_2_d = seq.firreg %1582 clock %clock reset sync %reset, %false {firrtl.random_init_start = 170 : ui64} : i1
    %tlbEntries_2_i = seq.firreg %1580 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 171 : ui64} : i2
    %tlbEntries_2_vpn_0 = seq.firreg %1577 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 173 : ui64} : i9
    %tlbEntries_2_vpn_1 = seq.firreg %1578 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 182 : ui64} : i9
    %tlbEntries_2_vpn_2 = seq.firreg %1579 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 191 : ui64} : i9
    %tlbEntries_2_ppn = seq.firreg %1576 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 200 : ui64} : i44
    %tlbEntries_3_v = seq.firreg %1609 clock %clock reset sync %reset, %false {firrtl.random_init_start = 244 : ui64} : i1
    %tlbEntries_3_r = seq.firreg %1607 clock %clock reset sync %reset, %false {firrtl.random_init_start = 245 : ui64} : i1
    %tlbEntries_3_w = seq.firreg %1605 clock %clock reset sync %reset, %false {firrtl.random_init_start = 246 : ui64} : i1
    %tlbEntries_3_x = seq.firreg %1603 clock %clock reset sync %reset, %false {firrtl.random_init_start = 247 : ui64} : i1
    %tlbEntries_3_u = seq.firreg %1601 clock %clock reset sync %reset, %false {firrtl.random_init_start = 248 : ui64} : i1
    %tlbEntries_3_d = seq.firreg %1599 clock %clock reset sync %reset, %false {firrtl.random_init_start = 250 : ui64} : i1
    %tlbEntries_3_i = seq.firreg %1597 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 251 : ui64} : i2
    %tlbEntries_3_vpn_0 = seq.firreg %1594 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 253 : ui64} : i9
    %tlbEntries_3_vpn_1 = seq.firreg %1595 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 262 : ui64} : i9
    %tlbEntries_3_vpn_2 = seq.firreg %1596 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 271 : ui64} : i9
    %tlbEntries_3_ppn = seq.firreg %1593 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 280 : ui64} : i44
    %tlbEntries_4_v = seq.firreg %1626 clock %clock reset sync %reset, %false {firrtl.random_init_start = 324 : ui64} : i1
    %tlbEntries_4_r = seq.firreg %1624 clock %clock reset sync %reset, %false {firrtl.random_init_start = 325 : ui64} : i1
    %tlbEntries_4_w = seq.firreg %1622 clock %clock reset sync %reset, %false {firrtl.random_init_start = 326 : ui64} : i1
    %tlbEntries_4_x = seq.firreg %1620 clock %clock reset sync %reset, %false {firrtl.random_init_start = 327 : ui64} : i1
    %tlbEntries_4_u = seq.firreg %1618 clock %clock reset sync %reset, %false {firrtl.random_init_start = 328 : ui64} : i1
    %tlbEntries_4_d = seq.firreg %1616 clock %clock reset sync %reset, %false {firrtl.random_init_start = 330 : ui64} : i1
    %tlbEntries_4_i = seq.firreg %1614 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 331 : ui64} : i2
    %tlbEntries_4_vpn_0 = seq.firreg %1611 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 333 : ui64} : i9
    %tlbEntries_4_vpn_1 = seq.firreg %1612 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 342 : ui64} : i9
    %tlbEntries_4_vpn_2 = seq.firreg %1613 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 351 : ui64} : i9
    %tlbEntries_4_ppn = seq.firreg %1610 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 360 : ui64} : i44
    %tlbEntries_5_v = seq.firreg %1643 clock %clock reset sync %reset, %false {firrtl.random_init_start = 404 : ui64} : i1
    %tlbEntries_5_r = seq.firreg %1641 clock %clock reset sync %reset, %false {firrtl.random_init_start = 405 : ui64} : i1
    %tlbEntries_5_w = seq.firreg %1639 clock %clock reset sync %reset, %false {firrtl.random_init_start = 406 : ui64} : i1
    %tlbEntries_5_x = seq.firreg %1637 clock %clock reset sync %reset, %false {firrtl.random_init_start = 407 : ui64} : i1
    %tlbEntries_5_u = seq.firreg %1635 clock %clock reset sync %reset, %false {firrtl.random_init_start = 408 : ui64} : i1
    %tlbEntries_5_d = seq.firreg %1633 clock %clock reset sync %reset, %false {firrtl.random_init_start = 410 : ui64} : i1
    %tlbEntries_5_i = seq.firreg %1631 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 411 : ui64} : i2
    %tlbEntries_5_vpn_0 = seq.firreg %1628 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 413 : ui64} : i9
    %tlbEntries_5_vpn_1 = seq.firreg %1629 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 422 : ui64} : i9
    %tlbEntries_5_vpn_2 = seq.firreg %1630 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 431 : ui64} : i9
    %tlbEntries_5_ppn = seq.firreg %1627 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 440 : ui64} : i44
    %tlbEntries_6_v = seq.firreg %1660 clock %clock reset sync %reset, %false {firrtl.random_init_start = 484 : ui64} : i1
    %tlbEntries_6_r = seq.firreg %1658 clock %clock reset sync %reset, %false {firrtl.random_init_start = 485 : ui64} : i1
    %tlbEntries_6_w = seq.firreg %1656 clock %clock reset sync %reset, %false {firrtl.random_init_start = 486 : ui64} : i1
    %tlbEntries_6_x = seq.firreg %1654 clock %clock reset sync %reset, %false {firrtl.random_init_start = 487 : ui64} : i1
    %tlbEntries_6_u = seq.firreg %1652 clock %clock reset sync %reset, %false {firrtl.random_init_start = 488 : ui64} : i1
    %tlbEntries_6_d = seq.firreg %1650 clock %clock reset sync %reset, %false {firrtl.random_init_start = 490 : ui64} : i1
    %tlbEntries_6_i = seq.firreg %1648 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 491 : ui64} : i2
    %tlbEntries_6_vpn_0 = seq.firreg %1645 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 493 : ui64} : i9
    %tlbEntries_6_vpn_1 = seq.firreg %1646 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 502 : ui64} : i9
    %tlbEntries_6_vpn_2 = seq.firreg %1647 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 511 : ui64} : i9
    %tlbEntries_6_ppn = seq.firreg %1644 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 520 : ui64} : i44
    %tlbEntries_7_v = seq.firreg %1677 clock %clock reset sync %reset, %false {firrtl.random_init_start = 564 : ui64} : i1
    %tlbEntries_7_r = seq.firreg %1675 clock %clock reset sync %reset, %false {firrtl.random_init_start = 565 : ui64} : i1
    %tlbEntries_7_w = seq.firreg %1673 clock %clock reset sync %reset, %false {firrtl.random_init_start = 566 : ui64} : i1
    %tlbEntries_7_x = seq.firreg %1671 clock %clock reset sync %reset, %false {firrtl.random_init_start = 567 : ui64} : i1
    %tlbEntries_7_u = seq.firreg %1669 clock %clock reset sync %reset, %false {firrtl.random_init_start = 568 : ui64} : i1
    %tlbEntries_7_d = seq.firreg %1667 clock %clock reset sync %reset, %false {firrtl.random_init_start = 570 : ui64} : i1
    %tlbEntries_7_i = seq.firreg %1665 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 571 : ui64} : i2
    %tlbEntries_7_vpn_0 = seq.firreg %1662 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 573 : ui64} : i9
    %tlbEntries_7_vpn_1 = seq.firreg %1663 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 582 : ui64} : i9
    %tlbEntries_7_vpn_2 = seq.firreg %1664 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 591 : ui64} : i9
    %tlbEntries_7_ppn = seq.firreg %1661 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 600 : ui64} : i44
    %tlbEntries_8_v = seq.firreg %1694 clock %clock reset sync %reset, %false {firrtl.random_init_start = 644 : ui64} : i1
    %tlbEntries_8_r = seq.firreg %1692 clock %clock reset sync %reset, %false {firrtl.random_init_start = 645 : ui64} : i1
    %tlbEntries_8_w = seq.firreg %1690 clock %clock reset sync %reset, %false {firrtl.random_init_start = 646 : ui64} : i1
    %tlbEntries_8_x = seq.firreg %1688 clock %clock reset sync %reset, %false {firrtl.random_init_start = 647 : ui64} : i1
    %tlbEntries_8_u = seq.firreg %1686 clock %clock reset sync %reset, %false {firrtl.random_init_start = 648 : ui64} : i1
    %tlbEntries_8_d = seq.firreg %1684 clock %clock reset sync %reset, %false {firrtl.random_init_start = 650 : ui64} : i1
    %tlbEntries_8_i = seq.firreg %1682 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 651 : ui64} : i2
    %tlbEntries_8_vpn_0 = seq.firreg %1679 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 653 : ui64} : i9
    %tlbEntries_8_vpn_1 = seq.firreg %1680 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 662 : ui64} : i9
    %tlbEntries_8_vpn_2 = seq.firreg %1681 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 671 : ui64} : i9
    %tlbEntries_8_ppn = seq.firreg %1678 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 680 : ui64} : i44
    %tlbEntries_9_v = seq.firreg %1711 clock %clock reset sync %reset, %false {firrtl.random_init_start = 724 : ui64} : i1
    %tlbEntries_9_r = seq.firreg %1709 clock %clock reset sync %reset, %false {firrtl.random_init_start = 725 : ui64} : i1
    %tlbEntries_9_w = seq.firreg %1707 clock %clock reset sync %reset, %false {firrtl.random_init_start = 726 : ui64} : i1
    %tlbEntries_9_x = seq.firreg %1705 clock %clock reset sync %reset, %false {firrtl.random_init_start = 727 : ui64} : i1
    %tlbEntries_9_u = seq.firreg %1703 clock %clock reset sync %reset, %false {firrtl.random_init_start = 728 : ui64} : i1
    %tlbEntries_9_d = seq.firreg %1701 clock %clock reset sync %reset, %false {firrtl.random_init_start = 730 : ui64} : i1
    %tlbEntries_9_i = seq.firreg %1699 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 731 : ui64} : i2
    %tlbEntries_9_vpn_0 = seq.firreg %1696 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 733 : ui64} : i9
    %tlbEntries_9_vpn_1 = seq.firreg %1697 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 742 : ui64} : i9
    %tlbEntries_9_vpn_2 = seq.firreg %1698 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 751 : ui64} : i9
    %tlbEntries_9_ppn = seq.firreg %1695 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 760 : ui64} : i44
    %tlbEntries_10_v = seq.firreg %1728 clock %clock reset sync %reset, %false {firrtl.random_init_start = 804 : ui64} : i1
    %tlbEntries_10_r = seq.firreg %1726 clock %clock reset sync %reset, %false {firrtl.random_init_start = 805 : ui64} : i1
    %tlbEntries_10_w = seq.firreg %1724 clock %clock reset sync %reset, %false {firrtl.random_init_start = 806 : ui64} : i1
    %tlbEntries_10_x = seq.firreg %1722 clock %clock reset sync %reset, %false {firrtl.random_init_start = 807 : ui64} : i1
    %tlbEntries_10_u = seq.firreg %1720 clock %clock reset sync %reset, %false {firrtl.random_init_start = 808 : ui64} : i1
    %tlbEntries_10_d = seq.firreg %1718 clock %clock reset sync %reset, %false {firrtl.random_init_start = 810 : ui64} : i1
    %tlbEntries_10_i = seq.firreg %1716 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 811 : ui64} : i2
    %tlbEntries_10_vpn_0 = seq.firreg %1713 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 813 : ui64} : i9
    %tlbEntries_10_vpn_1 = seq.firreg %1714 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 822 : ui64} : i9
    %tlbEntries_10_vpn_2 = seq.firreg %1715 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 831 : ui64} : i9
    %tlbEntries_10_ppn = seq.firreg %1712 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 840 : ui64} : i44
    %tlbEntries_11_v = seq.firreg %1745 clock %clock reset sync %reset, %false {firrtl.random_init_start = 884 : ui64} : i1
    %tlbEntries_11_r = seq.firreg %1743 clock %clock reset sync %reset, %false {firrtl.random_init_start = 885 : ui64} : i1
    %tlbEntries_11_w = seq.firreg %1741 clock %clock reset sync %reset, %false {firrtl.random_init_start = 886 : ui64} : i1
    %tlbEntries_11_x = seq.firreg %1739 clock %clock reset sync %reset, %false {firrtl.random_init_start = 887 : ui64} : i1
    %tlbEntries_11_u = seq.firreg %1737 clock %clock reset sync %reset, %false {firrtl.random_init_start = 888 : ui64} : i1
    %tlbEntries_11_d = seq.firreg %1735 clock %clock reset sync %reset, %false {firrtl.random_init_start = 890 : ui64} : i1
    %tlbEntries_11_i = seq.firreg %1733 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 891 : ui64} : i2
    %tlbEntries_11_vpn_0 = seq.firreg %1730 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 893 : ui64} : i9
    %tlbEntries_11_vpn_1 = seq.firreg %1731 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 902 : ui64} : i9
    %tlbEntries_11_vpn_2 = seq.firreg %1732 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 911 : ui64} : i9
    %tlbEntries_11_ppn = seq.firreg %1729 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 920 : ui64} : i44
    %tlbEntries_12_v = seq.firreg %1762 clock %clock reset sync %reset, %false {firrtl.random_init_start = 964 : ui64} : i1
    %tlbEntries_12_r = seq.firreg %1760 clock %clock reset sync %reset, %false {firrtl.random_init_start = 965 : ui64} : i1
    %tlbEntries_12_w = seq.firreg %1758 clock %clock reset sync %reset, %false {firrtl.random_init_start = 966 : ui64} : i1
    %tlbEntries_12_x = seq.firreg %1756 clock %clock reset sync %reset, %false {firrtl.random_init_start = 967 : ui64} : i1
    %tlbEntries_12_u = seq.firreg %1754 clock %clock reset sync %reset, %false {firrtl.random_init_start = 968 : ui64} : i1
    %tlbEntries_12_d = seq.firreg %1752 clock %clock reset sync %reset, %false {firrtl.random_init_start = 970 : ui64} : i1
    %tlbEntries_12_i = seq.firreg %1750 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 971 : ui64} : i2
    %tlbEntries_12_vpn_0 = seq.firreg %1747 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 973 : ui64} : i9
    %tlbEntries_12_vpn_1 = seq.firreg %1748 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 982 : ui64} : i9
    %tlbEntries_12_vpn_2 = seq.firreg %1749 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 991 : ui64} : i9
    %tlbEntries_12_ppn = seq.firreg %1746 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 1000 : ui64} : i44
    %tlbEntries_13_v = seq.firreg %1779 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1044 : ui64} : i1
    %tlbEntries_13_r = seq.firreg %1777 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1045 : ui64} : i1
    %tlbEntries_13_w = seq.firreg %1775 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1046 : ui64} : i1
    %tlbEntries_13_x = seq.firreg %1773 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1047 : ui64} : i1
    %tlbEntries_13_u = seq.firreg %1771 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1048 : ui64} : i1
    %tlbEntries_13_d = seq.firreg %1769 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1050 : ui64} : i1
    %tlbEntries_13_i = seq.firreg %1767 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1051 : ui64} : i2
    %tlbEntries_13_vpn_0 = seq.firreg %1764 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 1053 : ui64} : i9
    %tlbEntries_13_vpn_1 = seq.firreg %1765 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 1062 : ui64} : i9
    %tlbEntries_13_vpn_2 = seq.firreg %1766 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 1071 : ui64} : i9
    %tlbEntries_13_ppn = seq.firreg %1763 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 1080 : ui64} : i44
    %tlbEntries_14_v = seq.firreg %1796 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1124 : ui64} : i1
    %tlbEntries_14_r = seq.firreg %1794 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1125 : ui64} : i1
    %tlbEntries_14_w = seq.firreg %1792 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1126 : ui64} : i1
    %tlbEntries_14_x = seq.firreg %1790 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1127 : ui64} : i1
    %tlbEntries_14_u = seq.firreg %1788 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1128 : ui64} : i1
    %tlbEntries_14_d = seq.firreg %1786 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1130 : ui64} : i1
    %tlbEntries_14_i = seq.firreg %1784 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1131 : ui64} : i2
    %tlbEntries_14_vpn_0 = seq.firreg %1781 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 1133 : ui64} : i9
    %tlbEntries_14_vpn_1 = seq.firreg %1782 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 1142 : ui64} : i9
    %tlbEntries_14_vpn_2 = seq.firreg %1783 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 1151 : ui64} : i9
    %tlbEntries_14_ppn = seq.firreg %1780 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 1160 : ui64} : i44
    %tlbEntries_15_v = seq.firreg %1813 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1204 : ui64} : i1
    %tlbEntries_15_r = seq.firreg %1811 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1205 : ui64} : i1
    %tlbEntries_15_w = seq.firreg %1809 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1206 : ui64} : i1
    %tlbEntries_15_x = seq.firreg %1807 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1207 : ui64} : i1
    %tlbEntries_15_u = seq.firreg %1805 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1208 : ui64} : i1
    %tlbEntries_15_d = seq.firreg %1803 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1210 : ui64} : i1
    %tlbEntries_15_i = seq.firreg %1801 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1211 : ui64} : i2
    %tlbEntries_15_vpn_0 = seq.firreg %1798 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 1213 : ui64} : i9
    %tlbEntries_15_vpn_1 = seq.firreg %1799 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 1222 : ui64} : i9
    %tlbEntries_15_vpn_2 = seq.firreg %1800 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 1231 : ui64} : i9
    %tlbEntries_15_ppn = seq.firreg %1797 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 1240 : ui64} : i44
    %0 = comb.extract %io_csrIO_0_rdata from 11 {sv.namehint = "mstatus_MPP"} : (i64) -> i2
    %1 = comb.extract %io_csrIO_0_rdata from 17 {sv.namehint = "mstatus_MPRV"} : (i64) -> i1
    %2 = comb.extract %io_csrIO_0_rdata from 18 {sv.namehint = "mstatus_SUM"} : (i64) -> i1
    %crossCache = seq.firreg %2097 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1284 : ui64} : i1
    %crossAddrP = seq.firreg %2061 clock %clock reset sync %reset, %c0_i35 {firrtl.random_init_start = 1285 : ui64} : i35
    %3 = comb.extract %crossAddrP from 34 {sv.namehint = "_crossAddr_T"} : (i35) -> i1
    %4 = comb.replicate %3 {sv.namehint = "_crossAddr_T_1"} : (i1) -> i25
    %5 = comb.concat %4, %crossAddrP, %c0_i4 {sv.namehint = "crossAddr"} : i25, i35, i4
    %6 = comb.mux bin %crossCache, %5, %io_ifIO_pipelineReq_cpuReq_addr {sv.namehint = "_ifVaddr_T"} : i64
    %7 = comb.extract %6 from 0 {sv.namehint = "ifVaddr_offset"} : (i64) -> i12
    %8 = comb.extract %6 from 12 {sv.namehint = "ifVaddr_vpn_0"} : (i64) -> i9
    %9 = comb.extract %6 from 21 {sv.namehint = "ifVaddr_vpn_1"} : (i64) -> i9
    %10 = comb.extract %6 from 30 {sv.namehint = "ifVaddr_vpn_2"} : (i64) -> i9
    %11 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 0 {sv.namehint = "memVaddr_offset"} : (i64) -> i12
    %12 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 12 {sv.namehint = "memVaddr_vpn_0"} : (i64) -> i9
    %13 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 21 {sv.namehint = "memVaddr_vpn_1"} : (i64) -> i9
    %14 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 30 {sv.namehint = "memVaddr_vpn_2"} : (i64) -> i9
    %vaddr_vpn_0 = seq.firreg %2035 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 1345 : ui64} : i9
    %vaddr_vpn_1 = seq.firreg %2037 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 1354 : ui64} : i9
    %vaddr_vpn_2 = seq.firreg %2039 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 1363 : ui64} : i9
    %15 = comb.extract %io_csrIO_1_rdata from 0 {sv.namehint = "wireSatp_PPN"} : (i64) -> i44
    %16 = comb.extract %io_csrIO_1_rdata from 63 {sv.namehint = "wireSatp_mode"} : (i64) -> i1
    %pte_rsw1 = seq.firreg %212 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1384 : ui64} : i10
    %pte_ppn2 = seq.firreg %213 clock %clock reset sync %reset, %c0_i26 {firrtl.random_init_start = 1394 : ui64} : i26
    %pte_ppn1 = seq.firreg %214 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 1420 : ui64} : i9
    %pte_ppn0 = seq.firreg %215 clock %clock reset sync %reset, %c0_i9 {firrtl.random_init_start = 1429 : ui64} : i9
    %pte_rsw0 = seq.firreg %216 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1438 : ui64} : i2
    %pte_d = seq.firreg %217 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1440 : ui64} : i1
    %pte_g = seq.firreg %218 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1442 : ui64} : i1
    %pte_u = seq.firreg %219 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1443 : ui64} : i1
    %pte_x = seq.firreg %220 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1444 : ui64} : i1
    %pte_w = seq.firreg %221 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1445 : ui64} : i1
    %pte_r = seq.firreg %222 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1446 : ui64} : i1
    %pte_v = seq.firreg %223 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1447 : ui64} : i1
    %17 = comb.extract %io_dcacheIO_cpuResult_data from 0 {sv.namehint = "newPte_v"} : (i64) -> i1
    %18 = comb.extract %io_dcacheIO_cpuResult_data from 1 {sv.namehint = "newPte_r"} : (i64) -> i1
    %19 = comb.extract %io_dcacheIO_cpuResult_data from 2 {sv.namehint = "newPte_w"} : (i64) -> i1
    %20 = comb.extract %io_dcacheIO_cpuResult_data from 3 {sv.namehint = "newPte_x"} : (i64) -> i1
    %21 = comb.extract %io_dcacheIO_cpuResult_data from 4 {sv.namehint = "newPte_u"} : (i64) -> i1
    %22 = comb.extract %io_dcacheIO_cpuResult_data from 5 {sv.namehint = "newPte_g"} : (i64) -> i1
    %23 = comb.extract %io_dcacheIO_cpuResult_data from 6 {sv.namehint = "newPte_a"} : (i64) -> i1
    %24 = comb.extract %io_dcacheIO_cpuResult_data from 7 {sv.namehint = "newPte_d"} : (i64) -> i1
    %25 = comb.extract %io_dcacheIO_cpuResult_data from 8 {sv.namehint = "newPte_rsw0"} : (i64) -> i2
    %26 = comb.extract %io_dcacheIO_cpuResult_data from 10 {sv.namehint = "newPte_ppn0"} : (i64) -> i9
    %27 = comb.extract %io_dcacheIO_cpuResult_data from 19 {sv.namehint = "newPte_ppn1"} : (i64) -> i9
    %28 = comb.extract %io_dcacheIO_cpuResult_data from 28 {sv.namehint = "newPte_ppn2"} : (i64) -> i26
    %29 = comb.extract %io_dcacheIO_cpuResult_data from 54 {sv.namehint = "newPte_rsw1"} : (i64) -> i10
    %current = seq.firreg %2028 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1448 : ui64} : i1
    %ptePpn = seq.firreg %319 clock %clock reset sync %reset, %c0_i44 {firrtl.random_init_start = 1449 : ui64} : i44
    %30 = comb.extract %io_priv from 1 : (i2) -> i1
    %31 = comb.xor bin %30, %true {sv.namehint = "_isSv39_i_T"} : i1
    %32 = comb.and bin %31, %16 {sv.namehint = "isSv39_i"} : i1
    %33 = comb.mux bin %1, %0, %io_priv {sv.namehint = "_isSv39_d_T"} : i2
    %34 = comb.extract %33 from 1 : (i2) -> i1
    %35 = comb.xor bin %34, %true {sv.namehint = "_isSv39_d_T_1"} : i1
    %36 = comb.and bin %35, %16 {sv.namehint = "isSv39_d"} : i1
    %ifDel = seq.firreg %2083 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1493 : ui64} : i1
    %memDel = seq.firreg %2078 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1494 : ui64} : i1
    %ifReady = seq.firreg %2088 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1495 : ui64} : i1
    %memReady = seq.firreg %2002 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1496 : ui64} : i1
    %ifExcpt = seq.firreg %2086 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1497 : ui64} : i1
    %memExcpt = seq.firreg %2077 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1498 : ui64} : i1
    %ifCause = seq.firreg %2084 clock %clock reset sync %reset, %c0_i4 {firrtl.random_init_start = 1499 : ui64} : i4
    %memCause = seq.firreg %2074 clock %clock reset sync %reset, %c0_i4 {firrtl.random_init_start = 1503 : ui64} : i4
    %ifCrossCache = seq.firreg %2092 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1507 : ui64} : i1
    %37 = comb.icmp bin eq %io_priv, %c0_i2 {sv.namehint = "isU_i"} : i2
    %38 = comb.icmp bin eq %io_priv, %c1_i2 {sv.namehint = "isS_i"} : i2
    %39 = comb.icmp bin eq %33, %c0_i2 {sv.namehint = "isU_d"} : i2
    %40 = comb.icmp bin eq %33, %c1_i2 {sv.namehint = "isS_d"} : i2
    %partialInst = seq.firreg %2063 clock %clock reset sync %reset, %c0_i16 {firrtl.random_init_start = 1508 : ui64} : i16
    %41 = comb.and bin %memDel, %memReady, %memExcpt {sv.namehint = "io_revAmo"} : i1
    %42 = comb.mux bin %ifDel, %ifReady, %io_icacheIO_cpuResult_ready : i1
    %43 = comb.and %ifDel, %ifExcpt {sv.namehint = "io_ifIO_pipelineResult_exception"} : i1
    %44 = comb.mux bin %ifDel, %ifCause, %c0_i4 {sv.namehint = "io_ifIO_pipelineResult_cause"} : i4
    %45 = comb.and %ifDel, %ifCrossCache {sv.namehint = "io_ifIO_pipelineResult_crossCache"} : i1
    %46 = comb.and %ifDel, %memExcpt {sv.namehint = "io_ifIO_pipelineResult_fromMem"} : i1
    %47 = comb.mux bin %memDel, %memReady, %io_dcacheIO_cpuResult_ready : i1
    %48 = comb.and %memDel, %memExcpt {sv.namehint = "io_memIO_pipelineResult_exception"} : i1
    %49 = comb.mux bin %memDel, %memCause, %c0_i4 {sv.namehint = "io_memIO_pipelineResult_cause"} : i4
    %50 = comb.extract %6 from 12 {sv.namehint = "_io_icacheIO_cpuReq_addr_T_144"} : (i64) -> i4
    %51 = comb.extract %6 from 21 {sv.namehint = "_io_icacheIO_cpuReq_addr_T_145"} : (i64) -> i4
    %52 = comb.extract %6 from 30 {sv.namehint = "_io_icacheIO_cpuReq_addr_T_146"} : (i64) -> i4
    %53 = hw.array_create %tlbEntries_15_ppn, %tlbEntries_14_ppn, %tlbEntries_13_ppn, %tlbEntries_12_ppn, %tlbEntries_11_ppn, %tlbEntries_10_ppn, %tlbEntries_9_ppn, %tlbEntries_8_ppn, %tlbEntries_7_ppn, %tlbEntries_6_ppn, %tlbEntries_5_ppn, %tlbEntries_4_ppn, %tlbEntries_3_ppn, %tlbEntries_2_ppn, %tlbEntries_1_ppn, %tlbEntries_0_ppn : i44
    %54 = hw.array_get %53[%50] : !hw.array<16xi44>, i4
    %55 = hw.array_get %53[%51] : !hw.array<16xi44>, i4
    %56 = hw.array_get %53[%52] : !hw.array<16xi44>, i4
    %57 = hw.array_create %tlbEntries_15_v, %tlbEntries_14_v, %tlbEntries_13_v, %tlbEntries_12_v, %tlbEntries_11_v, %tlbEntries_10_v, %tlbEntries_9_v, %tlbEntries_8_v, %tlbEntries_7_v, %tlbEntries_6_v, %tlbEntries_5_v, %tlbEntries_4_v, %tlbEntries_3_v, %tlbEntries_2_v, %tlbEntries_1_v, %tlbEntries_0_v : i1
    %58 = hw.array_get %57[%50] : !hw.array<16xi1>, i4
    %59 = comb.extract %6 from 12 {sv.namehint = "_crossAddrP_T"} : (i64) -> i27
    %60 = hw.array_create %tlbEntries_15_vpn_0, %tlbEntries_14_vpn_0, %tlbEntries_13_vpn_0, %tlbEntries_12_vpn_0, %tlbEntries_11_vpn_0, %tlbEntries_10_vpn_0, %tlbEntries_9_vpn_0, %tlbEntries_8_vpn_0, %tlbEntries_7_vpn_0, %tlbEntries_6_vpn_0, %tlbEntries_5_vpn_0, %tlbEntries_4_vpn_0, %tlbEntries_3_vpn_0, %tlbEntries_2_vpn_0, %tlbEntries_1_vpn_0, %tlbEntries_0_vpn_0 : i9
    %61 = hw.array_get %60[%50] : !hw.array<16xi9>, i4
    %62 = hw.array_create %tlbEntries_15_vpn_1, %tlbEntries_14_vpn_1, %tlbEntries_13_vpn_1, %tlbEntries_12_vpn_1, %tlbEntries_11_vpn_1, %tlbEntries_10_vpn_1, %tlbEntries_9_vpn_1, %tlbEntries_8_vpn_1, %tlbEntries_7_vpn_1, %tlbEntries_6_vpn_1, %tlbEntries_5_vpn_1, %tlbEntries_4_vpn_1, %tlbEntries_3_vpn_1, %tlbEntries_2_vpn_1, %tlbEntries_1_vpn_1, %tlbEntries_0_vpn_1 : i9
    %63 = hw.array_get %62[%50] : !hw.array<16xi9>, i4
    %64 = hw.array_create %tlbEntries_15_vpn_2, %tlbEntries_14_vpn_2, %tlbEntries_13_vpn_2, %tlbEntries_12_vpn_2, %tlbEntries_11_vpn_2, %tlbEntries_10_vpn_2, %tlbEntries_9_vpn_2, %tlbEntries_8_vpn_2, %tlbEntries_7_vpn_2, %tlbEntries_6_vpn_2, %tlbEntries_5_vpn_2, %tlbEntries_4_vpn_2, %tlbEntries_3_vpn_2, %tlbEntries_2_vpn_2, %tlbEntries_1_vpn_2, %tlbEntries_0_vpn_2 : i9
    %65 = hw.array_get %64[%50] : !hw.array<16xi9>, i4
    %66 = comb.concat %65, %63, %61 {sv.namehint = "_io_icacheIO_cpuReq_addr_T_7"} : i9, i9, i9
    %67 = comb.icmp bin eq %59, %66 {sv.namehint = "_io_icacheIO_cpuReq_addr_T_8"} : i27
    %68 = hw.array_create %tlbEntries_15_i, %tlbEntries_14_i, %tlbEntries_13_i, %tlbEntries_12_i, %tlbEntries_11_i, %tlbEntries_10_i, %tlbEntries_9_i, %tlbEntries_8_i, %tlbEntries_7_i, %tlbEntries_6_i, %tlbEntries_5_i, %tlbEntries_4_i, %tlbEntries_3_i, %tlbEntries_2_i, %tlbEntries_1_i, %tlbEntries_0_i : i2
    %69 = hw.array_get %68[%50] : !hw.array<16xi2>, i4
    %70 = comb.icmp bin ne %69, %c0_i2 : i2
    %71 = comb.xor bin %70, %true {sv.namehint = "_io_icacheIO_cpuReq_addr_T_13"} : i1
    %72 = comb.and bin %58, %67, %71 {sv.namehint = "_io_icacheIO_cpuReq_addr_WIRE_10_0"} : i1
    %73 = comb.extract %6 from 21 {sv.namehint = "_io_icacheIO_cpuReq_addr_T_121"} : (i64) -> i18
    %74 = hw.array_get %57[%51] : !hw.array<16xi1>, i4
    %75 = hw.array_get %64[%51] : !hw.array<16xi9>, i4
    %76 = hw.array_get %62[%51] : !hw.array<16xi9>, i4
    %77 = comb.concat %75, %76 {sv.namehint = "_io_icacheIO_cpuReq_addr_T_77"} : i9, i9
    %78 = comb.icmp bin eq %73, %77 {sv.namehint = "_io_icacheIO_cpuReq_addr_T_78"} : i18
    %79 = hw.array_get %68[%51] : !hw.array<16xi2>, i4
    %80 = comb.icmp bin eq %79, %c1_i2 {sv.namehint = "_io_icacheIO_cpuReq_addr_T_83"} : i2
    %81 = comb.and bin %74, %78, %80 {sv.namehint = "_io_icacheIO_cpuReq_addr_WIRE_21_1"} : i1
    %82 = comb.extract %6 from 0 : (i64) -> i21
    %83 = hw.array_get %57[%52] : !hw.array<16xi1>, i4
    %84 = hw.array_get %64[%52] : !hw.array<16xi9>, i4
    %85 = comb.icmp bin eq %10, %84 {sv.namehint = "_io_icacheIO_cpuReq_addr_T_142"} : i9
    %86 = hw.array_get %68[%52] : !hw.array<16xi2>, i4
    %87 = comb.icmp bin eq %86, %c-2_i2 {sv.namehint = "_io_icacheIO_cpuReq_addr_T_147"} : i2
    %88 = comb.and bin %83, %85, %87 {sv.namehint = "_io_icacheIO_cpuReq_addr_WIRE_32_2"} : i1
    %89 = comb.extract %6 from 0 : (i64) -> i30
    %90 = comb.extract %54 from 0 : (i44) -> i20
    %91 = comb.concat %90, %7 : i20, i12
    %92 = comb.mux bin %72, %91, %c0_i32 {sv.namehint = "_io_icacheIO_cpuReq_addr_T_153"} : i32
    %93 = comb.extract %55 from 9 : (i44) -> i11
    %94 = comb.concat %93, %82 : i11, i21
    %95 = comb.mux bin %81, %94, %c0_i32 {sv.namehint = "_io_icacheIO_cpuReq_addr_T_154"} : i32
    %96 = comb.extract %56 from 18 : (i44) -> i2
    %97 = comb.concat %96, %89 : i2, i30
    %98 = comb.mux bin %88, %97, %c0_i32 {sv.namehint = "_io_icacheIO_cpuReq_addr_T_155"} : i32
    %99 = comb.or bin %92, %95, %98 {sv.namehint = "_io_icacheIO_cpuReq_addr_T_157"} : i32
    %100 = comb.extract %6 from 0 : (i64) -> i32
    %101 = comb.mux bin %32, %99, %100 {sv.namehint = "_io_icacheIO_cpuReq_addr_T_160"} : i32
    %102 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 12 {sv.namehint = "_memAddr_T_144"} : (i64) -> i4
    %103 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 21 {sv.namehint = "_memAddr_T_145"} : (i64) -> i4
    %104 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 30 {sv.namehint = "_memAddr_T_146"} : (i64) -> i4
    %105 = hw.array_get %53[%102] : !hw.array<16xi44>, i4
    %106 = hw.array_get %53[%103] : !hw.array<16xi44>, i4
    %107 = hw.array_get %53[%104] : !hw.array<16xi44>, i4
    %108 = hw.array_get %57[%102] : !hw.array<16xi1>, i4
    %109 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 12 {sv.namehint = "_memAddr_T_158"} : (i64) -> i27
    %110 = hw.array_get %60[%102] : !hw.array<16xi9>, i4
    %111 = hw.array_get %62[%102] : !hw.array<16xi9>, i4
    %112 = hw.array_get %64[%102] : !hw.array<16xi9>, i4
    %113 = comb.concat %112, %111, %110 {sv.namehint = "_io_dcacheIO_cpuReq_addr_T_7"} : i9, i9, i9
    %114 = comb.icmp bin eq %109, %113 {sv.namehint = "_io_dcacheIO_cpuReq_addr_T_8"} : i27
    %115 = hw.array_get %68[%102] : !hw.array<16xi2>, i4
    %116 = comb.icmp bin ne %115, %c0_i2 : i2
    %117 = comb.xor bin %116, %true {sv.namehint = "_io_dcacheIO_cpuReq_addr_T_13"} : i1
    %118 = comb.and bin %108, %114, %117 {sv.namehint = "_io_dcacheIO_cpuReq_addr_WIRE_10_0"} : i1
    %119 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 21 {sv.namehint = "_memAddr_T_121"} : (i64) -> i18
    %120 = hw.array_get %57[%103] : !hw.array<16xi1>, i4
    %121 = hw.array_get %64[%103] : !hw.array<16xi9>, i4
    %122 = hw.array_get %62[%103] : !hw.array<16xi9>, i4
    %123 = comb.concat %121, %122 {sv.namehint = "_io_dcacheIO_cpuReq_addr_T_77"} : i9, i9
    %124 = comb.icmp bin eq %119, %123 {sv.namehint = "_io_dcacheIO_cpuReq_addr_T_78"} : i18
    %125 = hw.array_get %68[%103] : !hw.array<16xi2>, i4
    %126 = comb.icmp bin eq %125, %c1_i2 {sv.namehint = "_io_dcacheIO_cpuReq_addr_T_83"} : i2
    %127 = comb.and bin %120, %124, %126 {sv.namehint = "_io_dcacheIO_cpuReq_addr_WIRE_21_1"} : i1
    %128 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 0 : (i64) -> i21
    %129 = hw.array_get %57[%104] : !hw.array<16xi1>, i4
    %130 = hw.array_get %64[%104] : !hw.array<16xi9>, i4
    %131 = comb.icmp bin eq %14, %130 {sv.namehint = "_io_dcacheIO_cpuReq_addr_T_142"} : i9
    %132 = hw.array_get %68[%104] : !hw.array<16xi2>, i4
    %133 = comb.icmp bin eq %132, %c-2_i2 {sv.namehint = "_io_dcacheIO_cpuReq_addr_T_147"} : i2
    %134 = comb.and bin %129, %131, %133 {sv.namehint = "_io_dcacheIO_cpuReq_addr_WIRE_32_2"} : i1
    %135 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 0 : (i64) -> i30
    %136 = comb.extract %105 from 0 : (i44) -> i20
    %137 = comb.concat %136, %11 : i20, i12
    %138 = comb.mux bin %118, %137, %c0_i32 {sv.namehint = "_io_dcacheIO_cpuReq_addr_T_153"} : i32
    %139 = comb.extract %106 from 9 : (i44) -> i11
    %140 = comb.concat %139, %128 : i11, i21
    %141 = comb.mux bin %127, %140, %c0_i32 {sv.namehint = "_io_dcacheIO_cpuReq_addr_T_154"} : i32
    %142 = comb.extract %107 from 18 : (i44) -> i2
    %143 = comb.concat %142, %135 : i2, i30
    %144 = comb.mux bin %134, %143, %c0_i32 {sv.namehint = "_io_dcacheIO_cpuReq_addr_T_155"} : i32
    %145 = comb.or bin %138, %141, %144 {sv.namehint = "_io_dcacheIO_cpuReq_addr_T_157"} : i32
    %146 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 0 : (i64) -> i32
    %147 = comb.mux bin %36, %145, %146 {sv.namehint = "_io_dcacheIO_cpuReq_addr_T_160"} : i32
    %148 = comb.concat %65, %63, %61 : i9, i9, i9
    %149 = comb.icmp bin eq %59, %148 : i27
    %150 = comb.xor bin %70, %true : i1
    %151 = comb.and bin %58, %149, %150 : i1
    %152 = comb.concat %75, %76 : i9, i9
    %153 = comb.icmp bin eq %73, %152 : i18
    %154 = comb.icmp bin eq %79, %c1_i2 : i2
    %155 = comb.and bin %74, %153, %154 : i1
    %156 = comb.icmp bin eq %10, %84 : i9
    %157 = comb.icmp bin eq %86, %c-2_i2 : i2
    %158 = comb.and bin %83, %156, %157 : i1
    %159 = comb.concat %158, %155, %151 : i1, i1, i1
    %160 = comb.icmp bin ne %159, %c0_i3 : i3
    %161 = comb.xor bin %160, %true : i1
    %162 = comb.and bin %32, %161 : i1
    %163 = comb.xor %162, %true : i1
    %164 = comb.and %163, %ifReady : i1
    %165 = comb.xor %162, %true : i1
    %166 = comb.and %165, %io_ifIO_pipelineReq_cpuReq_valid : i1
    %167 = comb.concat %112, %111, %110 : i9, i9, i9
    %168 = comb.icmp bin eq %109, %167 : i27
    %169 = comb.xor bin %116, %true : i1
    %170 = comb.and bin %108, %168, %169 : i1
    %171 = comb.concat %121, %122 : i9, i9
    %172 = comb.icmp bin eq %119, %171 : i18
    %173 = comb.icmp bin eq %125, %c1_i2 : i2
    %174 = comb.and bin %120, %172, %173 : i1
    %175 = comb.icmp bin eq %14, %130 : i9
    %176 = comb.icmp bin eq %132, %c-2_i2 : i2
    %177 = comb.and bin %129, %175, %176 : i1
    %178 = comb.concat %177, %174, %170 : i1, i1, i1
    %179 = comb.icmp bin ne %178, %c0_i3 : i3
    %180 = comb.xor bin %179, %true : i1
    %181 = hw.array_create %tlbEntries_15_d, %tlbEntries_14_d, %tlbEntries_13_d, %tlbEntries_12_d, %tlbEntries_11_d, %tlbEntries_10_d, %tlbEntries_9_d, %tlbEntries_8_d, %tlbEntries_7_d, %tlbEntries_6_d, %tlbEntries_5_d, %tlbEntries_4_d, %tlbEntries_3_d, %tlbEntries_2_d, %tlbEntries_1_d, %tlbEntries_0_d : i1
    %182 = hw.array_get %181[%102] : !hw.array<16xi1>, i4
    %183 = comb.and bin %170, %182 : i1
    %184 = hw.array_get %181[%103] : !hw.array<16xi1>, i4
    %185 = comb.and bin %174, %184 : i1
    %186 = hw.array_get %181[%104] : !hw.array<16xi1>, i4
    %187 = comb.and bin %177, %186 : i1
    %188 = comb.concat %187, %185, %183 : i1, i1, i1
    %189 = comb.icmp bin eq %188, %c0_i3 : i3
    %190 = comb.and bin %io_memIO_pipelineReq_cpuReq_rw, %189 : i1
    %191 = comb.or bin %180, %190 : i1
    %192 = comb.and bin %36, %191 : i1
    %193 = comb.xor %192, %true : i1
    %194 = comb.and %193, %memReady : i1
    %195 = comb.xor %192, %true : i1
    %196 = comb.and %195, %io_memIO_pipelineReq_cpuReq_valid : i1
    %197 = comb.or bin %32, %36 : i1
    %198 = comb.icmp bin eq %stage, %c1_i2 : i2
    %199 = comb.xor %198, %true : i1
    %200 = comb.and %199, %io_memIO_pipelineReq_cpuReq_rw : i1
    %201 = comb.icmp bin eq %level, %c-2_i2 {sv.namehint = "_ptePpn_T"} : i2
    %202 = comb.extract %io_csrIO_1_rdata from 0 : (i64) -> i20
    %203 = comb.extract %pte_ppn2 from 0 : (i26) -> i2
    %204 = comb.concat %203, %pte_ppn1, %pte_ppn0 : i2, i9, i9
    %205 = comb.mux bin %201, %202, %204 {sv.namehint = "_io_dcacheIO_cpuReq_addr_T_164"} : i20
    %206 = hw.array_create %vaddr_vpn_0, %vaddr_vpn_2, %vaddr_vpn_1, %vaddr_vpn_0 : i9
    %207 = hw.array_get %206[%level] : !hw.array<4xi9>, i2
    %208 = comb.concat %205, %207, %c0_i3 : i20, i9, i3
    %209 = comb.mux bin %198, %208, %147 : i32
    %210 = comb.and bin %198, %io_dcacheIO_cpuResult_ready : i1
    %211 = comb.and bin %197, %210 : i1
    %212 = comb.mux bin %211, %29, %pte_rsw1 : i10
    %213 = comb.mux bin %211, %28, %pte_ppn2 : i26
    %214 = comb.mux bin %211, %27, %pte_ppn1 : i9
    %215 = comb.mux bin %211, %26, %pte_ppn0 : i9
    %216 = comb.mux bin %211, %25, %pte_rsw0 : i2
    %217 = comb.mux bin %211, %24, %pte_d : i1
    %218 = comb.mux bin %211, %22, %pte_g : i1
    %219 = comb.mux bin %211, %21, %pte_u : i1
    %220 = comb.mux bin %211, %20, %pte_x : i1
    %221 = comb.mux bin %211, %19, %pte_w : i1
    %222 = comb.mux bin %211, %18, %pte_r : i1
    %223 = comb.mux bin %211, %17, %pte_v : i1
    %224 = comb.icmp bin eq %level, %c0_i2 {sv.namehint = "_leaf_T"} : i2
    %225 = comb.or bin %224, %19, %18, %20 {sv.namehint = "leaf"} : i1
    %226 = comb.xor bin %19, %true : i1
    %227 = comb.xor bin %18, %true : i1
    %228 = comb.xor bin %20, %true : i1
    %229 = comb.and bin %226, %227, %228 : i1
    %230 = comb.and bin %19, %227 : i1
    %231 = comb.extract %io_dcacheIO_cpuResult_data from 10 : (i64) -> i2
    %232 = comb.icmp bin ne %231, %c0_i2 : i2
    %233 = comb.and bin %201, %232 : i1
    %234 = comb.icmp bin eq %level, %c1_i2 : i2
    %235 = comb.extract %io_dcacheIO_cpuResult_data from 10 : (i64) -> i1
    %236 = comb.and bin %234, %235 : i1
    %237 = comb.or bin %229, %230, %233, %236 : i1
    %238 = comb.xor bin %current, %true : i1
    %239 = comb.concat %c-1_i2, %io_memIO_pipelineReq_cpuReq_rw, %true : i2, i1, i1
    %240 = comb.mux bin %current, %239, %c-4_i4 : i4
    %241 = comb.or %current, %192 : i1
    %242 = comb.or %current, %194 : i1
    %243 = comb.mux bin %current, %239, %memCause : i4
    %244 = comb.or %current, %memExcpt : i1
    %245 = comb.xor bin %21, %true : i1
    %246 = comb.and bin %37, %245 : i1
    %247 = comb.and bin %38, %21 : i1
    %248 = comb.or bin %246, %247 : i1
    %249 = comb.and bin %238, %248 : i1
    %250 = comb.and bin %39, %245 : i1
    %251 = comb.xor bin %2, %true : i1
    %252 = comb.and bin %40, %21, %251 : i1
    %253 = comb.or bin %250, %252 : i1
    %254 = comb.and bin %current, %253 : i1
    %255 = comb.and bin %238, %228 : i1
    %256 = comb.xor bin %io_memIO_pipelineReq_cpuReq_rw, %true : i1
    %257 = comb.and bin %current, %256, %227 : i1
    %258 = comb.and bin %current, %io_memIO_pipelineReq_cpuReq_rw : i1
    %259 = comb.and bin %258, %226 : i1
    %260 = comb.or bin %237, %249, %254, %255, %257, %259 : i1
    %261 = comb.and %225, %260 : i1
    %262 = comb.or bin %257, %259 : i1
    %263 = comb.or bin %237, %249, %254, %255, %262 : i1
    %264 = comb.and bin %225, %263 : i1
    %265 = comb.mux bin %259, %c-1_i4, %ifCause : i4
    %266 = comb.mux bin %257, %c-3_i4, %265 : i4
    %267 = comb.mux bin %255, %c-4_i4, %266 : i4
    %268 = comb.mux bin %254, %239, %267 : i4
    %269 = comb.mux bin %249, %c-4_i4, %268 : i4
    %270 = comb.mux bin %237, %240, %269 : i4
    %271 = comb.mux bin %225, %270, %ifCause : i4
    %272 = comb.xor %264, %true : i1
    %273 = comb.or bin %257, %259 : i1
    %274 = comb.xor %255, %true : i1
    %275 = comb.and %274, %273 : i1
    %276 = comb.or %254, %275 : i1
    %277 = comb.xor %249, %true : i1
    %278 = comb.and %277, %276 : i1
    %279 = comb.or %278, %192 : i1
    %280 = comb.mux bin %237, %241, %279 : i1
    %281 = comb.mux bin %225, %280, %192 : i1
    %282 = comb.xor %255, %true : i1
    %283 = comb.and %282, %262 : i1
    %284 = comb.or %254, %283 : i1
    %285 = comb.xor %249, %true : i1
    %286 = comb.and %285, %284 : i1
    %287 = comb.or %286, %194 : i1
    %288 = comb.mux bin %237, %242, %287 : i1
    %289 = comb.mux bin %225, %288, %194 : i1
    %290 = comb.mux bin %259, %c-1_i4, %memCause : i4
    %291 = comb.mux bin %257, %c-3_i4, %290 : i4
    %292 = comb.mux bin %255, %memCause, %291 : i4
    %293 = comb.mux bin %254, %239, %292 : i4
    %294 = comb.mux bin %249, %memCause, %293 : i4
    %295 = comb.mux bin %237, %243, %294 : i4
    %296 = comb.mux bin %225, %295, %memCause : i4
    %297 = comb.xor %255, %true : i1
    %298 = comb.and %297, %262 : i1
    %299 = comb.or %254, %298 : i1
    %300 = comb.xor %249, %true : i1
    %301 = comb.and %300, %299 : i1
    %302 = comb.or %301, %memExcpt : i1
    %303 = comb.mux bin %237, %244, %302 : i1
    %304 = comb.mux bin %225, %303, %memExcpt : i1
    %305 = comb.xor bin %23, %true : i1
    %306 = comb.xor bin %24, %true : i1
    %307 = comb.and bin %258, %306 : i1
    %308 = comb.or bin %305, %307 : i1
    %309 = comb.concat %308, %false : i1, i1
    %310 = comb.mux bin %263, %c0_i2, %309 : i2
    %311 = comb.mux bin %225, %310, %stage : i2
    %312 = comb.concat %pte_ppn2, %pte_ppn1, %pte_ppn0 {sv.namehint = "_ptePpn_T_2"} : i26, i9, i9
    %313 = comb.mux bin %201, %15, %312 {sv.namehint = "_ptePpn_T_3"} : i44
    %314 = comb.xor %308, %true : i1
    %315 = comb.and bin %198, %io_dcacheIO_cpuResult_ready, %17, %225 : i1
    %316 = comb.and bin %197, %315 : i1
    %317 = comb.xor %316, %true : i1
    %318 = comb.or %317, %263, %314 : i1
    %319 = comb.mux bin %318, %ptePpn, %313 : i44
    %320 = comb.extract %207 from 0 {sv.namehint = "_tlbEntry_T"} : (i9) -> i4
    %321 = comb.icmp bin eq %320, %c0_i4 : i4
    %322 = comb.or bin %237, %249, %254, %255, %257, %259, %308 : i1
    %323 = comb.xor %321, %true : i1
    %324 = comb.xor %315, %true : i1
    %325 = comb.or %324, %322, %323 : i1
    %326 = comb.xor %321, %true : i1
    %327 = comb.xor %315, %true : i1
    %328 = comb.or %327, %322, %326 : i1
    %329 = comb.xor %321, %true : i1
    %330 = comb.xor %315, %true : i1
    %331 = comb.or %330, %322, %329 : i1
    %332 = comb.icmp bin eq %320, %c1_i4 : i4
    %333 = comb.xor %332, %true : i1
    %334 = comb.xor %315, %true : i1
    %335 = comb.or %334, %322, %333 : i1
    %336 = comb.xor %332, %true : i1
    %337 = comb.xor %315, %true : i1
    %338 = comb.or %337, %322, %336 : i1
    %339 = comb.xor %332, %true : i1
    %340 = comb.xor %315, %true : i1
    %341 = comb.or %340, %322, %339 : i1
    %342 = comb.icmp bin eq %320, %c2_i4 : i4
    %343 = comb.xor %342, %true : i1
    %344 = comb.xor %315, %true : i1
    %345 = comb.or %344, %322, %343 : i1
    %346 = comb.xor %342, %true : i1
    %347 = comb.xor %315, %true : i1
    %348 = comb.or %347, %322, %346 : i1
    %349 = comb.xor %342, %true : i1
    %350 = comb.xor %315, %true : i1
    %351 = comb.or %350, %322, %349 : i1
    %352 = comb.icmp bin eq %320, %c3_i4 : i4
    %353 = comb.xor %352, %true : i1
    %354 = comb.xor %315, %true : i1
    %355 = comb.or %354, %322, %353 : i1
    %356 = comb.xor %352, %true : i1
    %357 = comb.xor %315, %true : i1
    %358 = comb.or %357, %322, %356 : i1
    %359 = comb.xor %352, %true : i1
    %360 = comb.xor %315, %true : i1
    %361 = comb.or %360, %322, %359 : i1
    %362 = comb.icmp bin eq %320, %c4_i4 : i4
    %363 = comb.xor %362, %true : i1
    %364 = comb.xor %315, %true : i1
    %365 = comb.or %364, %322, %363 : i1
    %366 = comb.xor %362, %true : i1
    %367 = comb.xor %315, %true : i1
    %368 = comb.or %367, %322, %366 : i1
    %369 = comb.xor %362, %true : i1
    %370 = comb.xor %315, %true : i1
    %371 = comb.or %370, %322, %369 : i1
    %372 = comb.icmp bin eq %320, %c5_i4 : i4
    %373 = comb.xor %372, %true : i1
    %374 = comb.xor %315, %true : i1
    %375 = comb.or %374, %322, %373 : i1
    %376 = comb.xor %372, %true : i1
    %377 = comb.xor %315, %true : i1
    %378 = comb.or %377, %322, %376 : i1
    %379 = comb.xor %372, %true : i1
    %380 = comb.xor %315, %true : i1
    %381 = comb.or %380, %322, %379 : i1
    %382 = comb.icmp bin eq %320, %c6_i4 : i4
    %383 = comb.xor %382, %true : i1
    %384 = comb.xor %315, %true : i1
    %385 = comb.or %384, %322, %383 : i1
    %386 = comb.xor %382, %true : i1
    %387 = comb.xor %315, %true : i1
    %388 = comb.or %387, %322, %386 : i1
    %389 = comb.xor %382, %true : i1
    %390 = comb.xor %315, %true : i1
    %391 = comb.or %390, %322, %389 : i1
    %392 = comb.icmp bin eq %320, %c7_i4 : i4
    %393 = comb.xor %392, %true : i1
    %394 = comb.xor %315, %true : i1
    %395 = comb.or %394, %322, %393 : i1
    %396 = comb.xor %392, %true : i1
    %397 = comb.xor %315, %true : i1
    %398 = comb.or %397, %322, %396 : i1
    %399 = comb.xor %392, %true : i1
    %400 = comb.xor %315, %true : i1
    %401 = comb.or %400, %322, %399 : i1
    %402 = comb.icmp bin eq %320, %c-8_i4 : i4
    %403 = comb.xor %402, %true : i1
    %404 = comb.xor %315, %true : i1
    %405 = comb.or %404, %322, %403 : i1
    %406 = comb.xor %402, %true : i1
    %407 = comb.xor %315, %true : i1
    %408 = comb.or %407, %322, %406 : i1
    %409 = comb.xor %402, %true : i1
    %410 = comb.xor %315, %true : i1
    %411 = comb.or %410, %322, %409 : i1
    %412 = comb.icmp bin eq %320, %c-7_i4 : i4
    %413 = comb.xor %412, %true : i1
    %414 = comb.xor %315, %true : i1
    %415 = comb.or %414, %322, %413 : i1
    %416 = comb.xor %412, %true : i1
    %417 = comb.xor %315, %true : i1
    %418 = comb.or %417, %322, %416 : i1
    %419 = comb.xor %412, %true : i1
    %420 = comb.xor %315, %true : i1
    %421 = comb.or %420, %322, %419 : i1
    %422 = comb.icmp bin eq %320, %c-6_i4 : i4
    %423 = comb.xor %422, %true : i1
    %424 = comb.xor %315, %true : i1
    %425 = comb.or %424, %322, %423 : i1
    %426 = comb.xor %422, %true : i1
    %427 = comb.xor %315, %true : i1
    %428 = comb.or %427, %322, %426 : i1
    %429 = comb.xor %422, %true : i1
    %430 = comb.xor %315, %true : i1
    %431 = comb.or %430, %322, %429 : i1
    %432 = comb.icmp bin eq %320, %c-5_i4 : i4
    %433 = comb.xor %432, %true : i1
    %434 = comb.xor %315, %true : i1
    %435 = comb.or %434, %322, %433 : i1
    %436 = comb.xor %432, %true : i1
    %437 = comb.xor %315, %true : i1
    %438 = comb.or %437, %322, %436 : i1
    %439 = comb.xor %432, %true : i1
    %440 = comb.xor %315, %true : i1
    %441 = comb.or %440, %322, %439 : i1
    %442 = comb.icmp bin eq %320, %c-4_i4 : i4
    %443 = comb.xor %442, %true : i1
    %444 = comb.xor %315, %true : i1
    %445 = comb.or %444, %322, %443 : i1
    %446 = comb.xor %442, %true : i1
    %447 = comb.xor %315, %true : i1
    %448 = comb.or %447, %322, %446 : i1
    %449 = comb.xor %442, %true : i1
    %450 = comb.xor %315, %true : i1
    %451 = comb.or %450, %322, %449 : i1
    %452 = comb.icmp bin eq %320, %c-3_i4 : i4
    %453 = comb.xor %452, %true : i1
    %454 = comb.xor %315, %true : i1
    %455 = comb.or %454, %322, %453 : i1
    %456 = comb.xor %452, %true : i1
    %457 = comb.xor %315, %true : i1
    %458 = comb.or %457, %322, %456 : i1
    %459 = comb.xor %452, %true : i1
    %460 = comb.xor %315, %true : i1
    %461 = comb.or %460, %322, %459 : i1
    %462 = comb.icmp bin eq %320, %c-2_i4 : i4
    %463 = comb.xor %462, %true : i1
    %464 = comb.xor %315, %true : i1
    %465 = comb.or %464, %322, %463 : i1
    %466 = comb.xor %462, %true : i1
    %467 = comb.xor %315, %true : i1
    %468 = comb.or %467, %322, %466 : i1
    %469 = comb.xor %462, %true : i1
    %470 = comb.xor %315, %true : i1
    %471 = comb.or %470, %322, %469 : i1
    %472 = comb.icmp bin eq %320, %c-1_i4 : i4
    %473 = comb.xor %472, %true : i1
    %474 = comb.xor %315, %true : i1
    %475 = comb.or %474, %322, %473 : i1
    %476 = comb.xor %472, %true : i1
    %477 = comb.xor %315, %true : i1
    %478 = comb.or %477, %322, %476 : i1
    %479 = comb.xor %472, %true : i1
    %480 = comb.xor %315, %true : i1
    %481 = comb.or %480, %322, %479 : i1
    %482 = comb.extract %io_dcacheIO_cpuResult_data from 10 {sv.namehint = "_tlbEntries_ppn_T_1"} : (i64) -> i44
    %483 = comb.xor %321, %true : i1
    %484 = comb.xor %315, %true : i1
    %485 = comb.or %484, %322, %483 : i1
    %486 = comb.mux bin %485, %tlbEntries_0_ppn, %482 : i44
    %487 = comb.xor %332, %true : i1
    %488 = comb.xor %315, %true : i1
    %489 = comb.or %488, %322, %487 : i1
    %490 = comb.mux bin %489, %tlbEntries_1_ppn, %482 : i44
    %491 = comb.xor %342, %true : i1
    %492 = comb.xor %315, %true : i1
    %493 = comb.or %492, %322, %491 : i1
    %494 = comb.mux bin %493, %tlbEntries_2_ppn, %482 : i44
    %495 = comb.xor %352, %true : i1
    %496 = comb.xor %315, %true : i1
    %497 = comb.or %496, %322, %495 : i1
    %498 = comb.mux bin %497, %tlbEntries_3_ppn, %482 : i44
    %499 = comb.xor %362, %true : i1
    %500 = comb.xor %315, %true : i1
    %501 = comb.or %500, %322, %499 : i1
    %502 = comb.mux bin %501, %tlbEntries_4_ppn, %482 : i44
    %503 = comb.xor %372, %true : i1
    %504 = comb.xor %315, %true : i1
    %505 = comb.or %504, %322, %503 : i1
    %506 = comb.mux bin %505, %tlbEntries_5_ppn, %482 : i44
    %507 = comb.xor %382, %true : i1
    %508 = comb.xor %315, %true : i1
    %509 = comb.or %508, %322, %507 : i1
    %510 = comb.mux bin %509, %tlbEntries_6_ppn, %482 : i44
    %511 = comb.xor %392, %true : i1
    %512 = comb.xor %315, %true : i1
    %513 = comb.or %512, %322, %511 : i1
    %514 = comb.mux bin %513, %tlbEntries_7_ppn, %482 : i44
    %515 = comb.xor %402, %true : i1
    %516 = comb.xor %315, %true : i1
    %517 = comb.or %516, %322, %515 : i1
    %518 = comb.mux bin %517, %tlbEntries_8_ppn, %482 : i44
    %519 = comb.xor %412, %true : i1
    %520 = comb.xor %315, %true : i1
    %521 = comb.or %520, %322, %519 : i1
    %522 = comb.mux bin %521, %tlbEntries_9_ppn, %482 : i44
    %523 = comb.xor %422, %true : i1
    %524 = comb.xor %315, %true : i1
    %525 = comb.or %524, %322, %523 : i1
    %526 = comb.mux bin %525, %tlbEntries_10_ppn, %482 : i44
    %527 = comb.xor %432, %true : i1
    %528 = comb.xor %315, %true : i1
    %529 = comb.or %528, %322, %527 : i1
    %530 = comb.mux bin %529, %tlbEntries_11_ppn, %482 : i44
    %531 = comb.xor %442, %true : i1
    %532 = comb.xor %315, %true : i1
    %533 = comb.or %532, %322, %531 : i1
    %534 = comb.mux bin %533, %tlbEntries_12_ppn, %482 : i44
    %535 = comb.xor %452, %true : i1
    %536 = comb.xor %315, %true : i1
    %537 = comb.or %536, %322, %535 : i1
    %538 = comb.mux bin %537, %tlbEntries_13_ppn, %482 : i44
    %539 = comb.xor %462, %true : i1
    %540 = comb.xor %315, %true : i1
    %541 = comb.or %540, %322, %539 : i1
    %542 = comb.mux bin %541, %tlbEntries_14_ppn, %482 : i44
    %543 = comb.xor %472, %true : i1
    %544 = comb.xor %315, %true : i1
    %545 = comb.or %544, %322, %543 : i1
    %546 = comb.mux bin %545, %tlbEntries_15_ppn, %482 : i44
    %547 = comb.xor %322, %true : i1
    %548 = comb.and %315, %547, %321 : i1
    %549 = comb.xor %322, %true : i1
    %550 = comb.and %315, %549, %332 : i1
    %551 = comb.xor %322, %true : i1
    %552 = comb.and %315, %551, %342 : i1
    %553 = comb.xor %322, %true : i1
    %554 = comb.and %315, %553, %352 : i1
    %555 = comb.xor %322, %true : i1
    %556 = comb.and %315, %555, %362 : i1
    %557 = comb.xor %322, %true : i1
    %558 = comb.and %315, %557, %372 : i1
    %559 = comb.xor %322, %true : i1
    %560 = comb.and %315, %559, %382 : i1
    %561 = comb.xor %322, %true : i1
    %562 = comb.and %315, %561, %392 : i1
    %563 = comb.xor %322, %true : i1
    %564 = comb.and %315, %563, %402 : i1
    %565 = comb.xor %322, %true : i1
    %566 = comb.and %315, %565, %412 : i1
    %567 = comb.xor %322, %true : i1
    %568 = comb.and %315, %567, %422 : i1
    %569 = comb.xor %322, %true : i1
    %570 = comb.and %315, %569, %432 : i1
    %571 = comb.xor %322, %true : i1
    %572 = comb.and %315, %571, %442 : i1
    %573 = comb.xor %322, %true : i1
    %574 = comb.and %315, %573, %452 : i1
    %575 = comb.xor %322, %true : i1
    %576 = comb.and %315, %575, %462 : i1
    %577 = comb.xor %322, %true : i1
    %578 = comb.and %315, %577, %472 : i1
    %579 = comb.xor %321, %true : i1
    %580 = comb.xor %315, %true : i1
    %581 = comb.or %580, %322, %579 : i1
    %582 = comb.mux bin %581, %tlbEntries_0_r, %18 : i1
    %583 = comb.xor %332, %true : i1
    %584 = comb.xor %315, %true : i1
    %585 = comb.or %584, %322, %583 : i1
    %586 = comb.mux bin %585, %tlbEntries_1_r, %18 : i1
    %587 = comb.xor %342, %true : i1
    %588 = comb.xor %315, %true : i1
    %589 = comb.or %588, %322, %587 : i1
    %590 = comb.mux bin %589, %tlbEntries_2_r, %18 : i1
    %591 = comb.xor %352, %true : i1
    %592 = comb.xor %315, %true : i1
    %593 = comb.or %592, %322, %591 : i1
    %594 = comb.mux bin %593, %tlbEntries_3_r, %18 : i1
    %595 = comb.xor %362, %true : i1
    %596 = comb.xor %315, %true : i1
    %597 = comb.or %596, %322, %595 : i1
    %598 = comb.mux bin %597, %tlbEntries_4_r, %18 : i1
    %599 = comb.xor %372, %true : i1
    %600 = comb.xor %315, %true : i1
    %601 = comb.or %600, %322, %599 : i1
    %602 = comb.mux bin %601, %tlbEntries_5_r, %18 : i1
    %603 = comb.xor %382, %true : i1
    %604 = comb.xor %315, %true : i1
    %605 = comb.or %604, %322, %603 : i1
    %606 = comb.mux bin %605, %tlbEntries_6_r, %18 : i1
    %607 = comb.xor %392, %true : i1
    %608 = comb.xor %315, %true : i1
    %609 = comb.or %608, %322, %607 : i1
    %610 = comb.mux bin %609, %tlbEntries_7_r, %18 : i1
    %611 = comb.xor %402, %true : i1
    %612 = comb.xor %315, %true : i1
    %613 = comb.or %612, %322, %611 : i1
    %614 = comb.mux bin %613, %tlbEntries_8_r, %18 : i1
    %615 = comb.xor %412, %true : i1
    %616 = comb.xor %315, %true : i1
    %617 = comb.or %616, %322, %615 : i1
    %618 = comb.mux bin %617, %tlbEntries_9_r, %18 : i1
    %619 = comb.xor %422, %true : i1
    %620 = comb.xor %315, %true : i1
    %621 = comb.or %620, %322, %619 : i1
    %622 = comb.mux bin %621, %tlbEntries_10_r, %18 : i1
    %623 = comb.xor %432, %true : i1
    %624 = comb.xor %315, %true : i1
    %625 = comb.or %624, %322, %623 : i1
    %626 = comb.mux bin %625, %tlbEntries_11_r, %18 : i1
    %627 = comb.xor %442, %true : i1
    %628 = comb.xor %315, %true : i1
    %629 = comb.or %628, %322, %627 : i1
    %630 = comb.mux bin %629, %tlbEntries_12_r, %18 : i1
    %631 = comb.xor %452, %true : i1
    %632 = comb.xor %315, %true : i1
    %633 = comb.or %632, %322, %631 : i1
    %634 = comb.mux bin %633, %tlbEntries_13_r, %18 : i1
    %635 = comb.xor %462, %true : i1
    %636 = comb.xor %315, %true : i1
    %637 = comb.or %636, %322, %635 : i1
    %638 = comb.mux bin %637, %tlbEntries_14_r, %18 : i1
    %639 = comb.xor %472, %true : i1
    %640 = comb.xor %315, %true : i1
    %641 = comb.or %640, %322, %639 : i1
    %642 = comb.mux bin %641, %tlbEntries_15_r, %18 : i1
    %643 = comb.xor %321, %true : i1
    %644 = comb.xor %315, %true : i1
    %645 = comb.or %644, %322, %643 : i1
    %646 = comb.mux bin %645, %tlbEntries_0_u, %21 : i1
    %647 = comb.xor %332, %true : i1
    %648 = comb.xor %315, %true : i1
    %649 = comb.or %648, %322, %647 : i1
    %650 = comb.mux bin %649, %tlbEntries_1_u, %21 : i1
    %651 = comb.xor %342, %true : i1
    %652 = comb.xor %315, %true : i1
    %653 = comb.or %652, %322, %651 : i1
    %654 = comb.mux bin %653, %tlbEntries_2_u, %21 : i1
    %655 = comb.xor %352, %true : i1
    %656 = comb.xor %315, %true : i1
    %657 = comb.or %656, %322, %655 : i1
    %658 = comb.mux bin %657, %tlbEntries_3_u, %21 : i1
    %659 = comb.xor %362, %true : i1
    %660 = comb.xor %315, %true : i1
    %661 = comb.or %660, %322, %659 : i1
    %662 = comb.mux bin %661, %tlbEntries_4_u, %21 : i1
    %663 = comb.xor %372, %true : i1
    %664 = comb.xor %315, %true : i1
    %665 = comb.or %664, %322, %663 : i1
    %666 = comb.mux bin %665, %tlbEntries_5_u, %21 : i1
    %667 = comb.xor %382, %true : i1
    %668 = comb.xor %315, %true : i1
    %669 = comb.or %668, %322, %667 : i1
    %670 = comb.mux bin %669, %tlbEntries_6_u, %21 : i1
    %671 = comb.xor %392, %true : i1
    %672 = comb.xor %315, %true : i1
    %673 = comb.or %672, %322, %671 : i1
    %674 = comb.mux bin %673, %tlbEntries_7_u, %21 : i1
    %675 = comb.xor %402, %true : i1
    %676 = comb.xor %315, %true : i1
    %677 = comb.or %676, %322, %675 : i1
    %678 = comb.mux bin %677, %tlbEntries_8_u, %21 : i1
    %679 = comb.xor %412, %true : i1
    %680 = comb.xor %315, %true : i1
    %681 = comb.or %680, %322, %679 : i1
    %682 = comb.mux bin %681, %tlbEntries_9_u, %21 : i1
    %683 = comb.xor %422, %true : i1
    %684 = comb.xor %315, %true : i1
    %685 = comb.or %684, %322, %683 : i1
    %686 = comb.mux bin %685, %tlbEntries_10_u, %21 : i1
    %687 = comb.xor %432, %true : i1
    %688 = comb.xor %315, %true : i1
    %689 = comb.or %688, %322, %687 : i1
    %690 = comb.mux bin %689, %tlbEntries_11_u, %21 : i1
    %691 = comb.xor %442, %true : i1
    %692 = comb.xor %315, %true : i1
    %693 = comb.or %692, %322, %691 : i1
    %694 = comb.mux bin %693, %tlbEntries_12_u, %21 : i1
    %695 = comb.xor %452, %true : i1
    %696 = comb.xor %315, %true : i1
    %697 = comb.or %696, %322, %695 : i1
    %698 = comb.mux bin %697, %tlbEntries_13_u, %21 : i1
    %699 = comb.xor %462, %true : i1
    %700 = comb.xor %315, %true : i1
    %701 = comb.or %700, %322, %699 : i1
    %702 = comb.mux bin %701, %tlbEntries_14_u, %21 : i1
    %703 = comb.xor %472, %true : i1
    %704 = comb.xor %315, %true : i1
    %705 = comb.or %704, %322, %703 : i1
    %706 = comb.mux bin %705, %tlbEntries_15_u, %21 : i1
    %707 = comb.xor %321, %true : i1
    %708 = comb.xor %315, %true : i1
    %709 = comb.or %708, %322, %707 : i1
    %710 = comb.mux bin %709, %tlbEntries_0_w, %19 : i1
    %711 = comb.xor %332, %true : i1
    %712 = comb.xor %315, %true : i1
    %713 = comb.or %712, %322, %711 : i1
    %714 = comb.mux bin %713, %tlbEntries_1_w, %19 : i1
    %715 = comb.xor %342, %true : i1
    %716 = comb.xor %315, %true : i1
    %717 = comb.or %716, %322, %715 : i1
    %718 = comb.mux bin %717, %tlbEntries_2_w, %19 : i1
    %719 = comb.xor %352, %true : i1
    %720 = comb.xor %315, %true : i1
    %721 = comb.or %720, %322, %719 : i1
    %722 = comb.mux bin %721, %tlbEntries_3_w, %19 : i1
    %723 = comb.xor %362, %true : i1
    %724 = comb.xor %315, %true : i1
    %725 = comb.or %724, %322, %723 : i1
    %726 = comb.mux bin %725, %tlbEntries_4_w, %19 : i1
    %727 = comb.xor %372, %true : i1
    %728 = comb.xor %315, %true : i1
    %729 = comb.or %728, %322, %727 : i1
    %730 = comb.mux bin %729, %tlbEntries_5_w, %19 : i1
    %731 = comb.xor %382, %true : i1
    %732 = comb.xor %315, %true : i1
    %733 = comb.or %732, %322, %731 : i1
    %734 = comb.mux bin %733, %tlbEntries_6_w, %19 : i1
    %735 = comb.xor %392, %true : i1
    %736 = comb.xor %315, %true : i1
    %737 = comb.or %736, %322, %735 : i1
    %738 = comb.mux bin %737, %tlbEntries_7_w, %19 : i1
    %739 = comb.xor %402, %true : i1
    %740 = comb.xor %315, %true : i1
    %741 = comb.or %740, %322, %739 : i1
    %742 = comb.mux bin %741, %tlbEntries_8_w, %19 : i1
    %743 = comb.xor %412, %true : i1
    %744 = comb.xor %315, %true : i1
    %745 = comb.or %744, %322, %743 : i1
    %746 = comb.mux bin %745, %tlbEntries_9_w, %19 : i1
    %747 = comb.xor %422, %true : i1
    %748 = comb.xor %315, %true : i1
    %749 = comb.or %748, %322, %747 : i1
    %750 = comb.mux bin %749, %tlbEntries_10_w, %19 : i1
    %751 = comb.xor %432, %true : i1
    %752 = comb.xor %315, %true : i1
    %753 = comb.or %752, %322, %751 : i1
    %754 = comb.mux bin %753, %tlbEntries_11_w, %19 : i1
    %755 = comb.xor %442, %true : i1
    %756 = comb.xor %315, %true : i1
    %757 = comb.or %756, %322, %755 : i1
    %758 = comb.mux bin %757, %tlbEntries_12_w, %19 : i1
    %759 = comb.xor %452, %true : i1
    %760 = comb.xor %315, %true : i1
    %761 = comb.or %760, %322, %759 : i1
    %762 = comb.mux bin %761, %tlbEntries_13_w, %19 : i1
    %763 = comb.xor %462, %true : i1
    %764 = comb.xor %315, %true : i1
    %765 = comb.or %764, %322, %763 : i1
    %766 = comb.mux bin %765, %tlbEntries_14_w, %19 : i1
    %767 = comb.xor %472, %true : i1
    %768 = comb.xor %315, %true : i1
    %769 = comb.or %768, %322, %767 : i1
    %770 = comb.mux bin %769, %tlbEntries_15_w, %19 : i1
    %771 = comb.xor %321, %true : i1
    %772 = comb.xor %315, %true : i1
    %773 = comb.or %772, %322, %771 : i1
    %774 = comb.mux bin %773, %tlbEntries_0_x, %20 : i1
    %775 = comb.xor %332, %true : i1
    %776 = comb.xor %315, %true : i1
    %777 = comb.or %776, %322, %775 : i1
    %778 = comb.mux bin %777, %tlbEntries_1_x, %20 : i1
    %779 = comb.xor %342, %true : i1
    %780 = comb.xor %315, %true : i1
    %781 = comb.or %780, %322, %779 : i1
    %782 = comb.mux bin %781, %tlbEntries_2_x, %20 : i1
    %783 = comb.xor %352, %true : i1
    %784 = comb.xor %315, %true : i1
    %785 = comb.or %784, %322, %783 : i1
    %786 = comb.mux bin %785, %tlbEntries_3_x, %20 : i1
    %787 = comb.xor %362, %true : i1
    %788 = comb.xor %315, %true : i1
    %789 = comb.or %788, %322, %787 : i1
    %790 = comb.mux bin %789, %tlbEntries_4_x, %20 : i1
    %791 = comb.xor %372, %true : i1
    %792 = comb.xor %315, %true : i1
    %793 = comb.or %792, %322, %791 : i1
    %794 = comb.mux bin %793, %tlbEntries_5_x, %20 : i1
    %795 = comb.xor %382, %true : i1
    %796 = comb.xor %315, %true : i1
    %797 = comb.or %796, %322, %795 : i1
    %798 = comb.mux bin %797, %tlbEntries_6_x, %20 : i1
    %799 = comb.xor %392, %true : i1
    %800 = comb.xor %315, %true : i1
    %801 = comb.or %800, %322, %799 : i1
    %802 = comb.mux bin %801, %tlbEntries_7_x, %20 : i1
    %803 = comb.xor %402, %true : i1
    %804 = comb.xor %315, %true : i1
    %805 = comb.or %804, %322, %803 : i1
    %806 = comb.mux bin %805, %tlbEntries_8_x, %20 : i1
    %807 = comb.xor %412, %true : i1
    %808 = comb.xor %315, %true : i1
    %809 = comb.or %808, %322, %807 : i1
    %810 = comb.mux bin %809, %tlbEntries_9_x, %20 : i1
    %811 = comb.xor %422, %true : i1
    %812 = comb.xor %315, %true : i1
    %813 = comb.or %812, %322, %811 : i1
    %814 = comb.mux bin %813, %tlbEntries_10_x, %20 : i1
    %815 = comb.xor %432, %true : i1
    %816 = comb.xor %315, %true : i1
    %817 = comb.or %816, %322, %815 : i1
    %818 = comb.mux bin %817, %tlbEntries_11_x, %20 : i1
    %819 = comb.xor %442, %true : i1
    %820 = comb.xor %315, %true : i1
    %821 = comb.or %820, %322, %819 : i1
    %822 = comb.mux bin %821, %tlbEntries_12_x, %20 : i1
    %823 = comb.xor %452, %true : i1
    %824 = comb.xor %315, %true : i1
    %825 = comb.or %824, %322, %823 : i1
    %826 = comb.mux bin %825, %tlbEntries_13_x, %20 : i1
    %827 = comb.xor %462, %true : i1
    %828 = comb.xor %315, %true : i1
    %829 = comb.or %828, %322, %827 : i1
    %830 = comb.mux bin %829, %tlbEntries_14_x, %20 : i1
    %831 = comb.xor %472, %true : i1
    %832 = comb.xor %315, %true : i1
    %833 = comb.or %832, %322, %831 : i1
    %834 = comb.mux bin %833, %tlbEntries_15_x, %20 : i1
    %835 = comb.xor %321, %true : i1
    %836 = comb.xor %315, %true : i1
    %837 = comb.or %836, %322, %835 : i1
    %838 = comb.mux bin %837, %tlbEntries_0_d, %24 : i1
    %839 = comb.xor %332, %true : i1
    %840 = comb.xor %315, %true : i1
    %841 = comb.or %840, %322, %839 : i1
    %842 = comb.mux bin %841, %tlbEntries_1_d, %24 : i1
    %843 = comb.xor %342, %true : i1
    %844 = comb.xor %315, %true : i1
    %845 = comb.or %844, %322, %843 : i1
    %846 = comb.mux bin %845, %tlbEntries_2_d, %24 : i1
    %847 = comb.xor %352, %true : i1
    %848 = comb.xor %315, %true : i1
    %849 = comb.or %848, %322, %847 : i1
    %850 = comb.mux bin %849, %tlbEntries_3_d, %24 : i1
    %851 = comb.xor %362, %true : i1
    %852 = comb.xor %315, %true : i1
    %853 = comb.or %852, %322, %851 : i1
    %854 = comb.mux bin %853, %tlbEntries_4_d, %24 : i1
    %855 = comb.xor %372, %true : i1
    %856 = comb.xor %315, %true : i1
    %857 = comb.or %856, %322, %855 : i1
    %858 = comb.mux bin %857, %tlbEntries_5_d, %24 : i1
    %859 = comb.xor %382, %true : i1
    %860 = comb.xor %315, %true : i1
    %861 = comb.or %860, %322, %859 : i1
    %862 = comb.mux bin %861, %tlbEntries_6_d, %24 : i1
    %863 = comb.xor %392, %true : i1
    %864 = comb.xor %315, %true : i1
    %865 = comb.or %864, %322, %863 : i1
    %866 = comb.mux bin %865, %tlbEntries_7_d, %24 : i1
    %867 = comb.xor %402, %true : i1
    %868 = comb.xor %315, %true : i1
    %869 = comb.or %868, %322, %867 : i1
    %870 = comb.mux bin %869, %tlbEntries_8_d, %24 : i1
    %871 = comb.xor %412, %true : i1
    %872 = comb.xor %315, %true : i1
    %873 = comb.or %872, %322, %871 : i1
    %874 = comb.mux bin %873, %tlbEntries_9_d, %24 : i1
    %875 = comb.xor %422, %true : i1
    %876 = comb.xor %315, %true : i1
    %877 = comb.or %876, %322, %875 : i1
    %878 = comb.mux bin %877, %tlbEntries_10_d, %24 : i1
    %879 = comb.xor %432, %true : i1
    %880 = comb.xor %315, %true : i1
    %881 = comb.or %880, %322, %879 : i1
    %882 = comb.mux bin %881, %tlbEntries_11_d, %24 : i1
    %883 = comb.xor %442, %true : i1
    %884 = comb.xor %315, %true : i1
    %885 = comb.or %884, %322, %883 : i1
    %886 = comb.mux bin %885, %tlbEntries_12_d, %24 : i1
    %887 = comb.xor %452, %true : i1
    %888 = comb.xor %315, %true : i1
    %889 = comb.or %888, %322, %887 : i1
    %890 = comb.mux bin %889, %tlbEntries_13_d, %24 : i1
    %891 = comb.xor %462, %true : i1
    %892 = comb.xor %315, %true : i1
    %893 = comb.or %892, %322, %891 : i1
    %894 = comb.mux bin %893, %tlbEntries_14_d, %24 : i1
    %895 = comb.xor %472, %true : i1
    %896 = comb.xor %315, %true : i1
    %897 = comb.or %896, %322, %895 : i1
    %898 = comb.mux bin %897, %tlbEntries_15_d, %24 : i1
    %899 = comb.xor %321, %true : i1
    %900 = comb.xor %315, %true : i1
    %901 = comb.or %900, %322, %899 : i1
    %902 = comb.xor %332, %true : i1
    %903 = comb.xor %315, %true : i1
    %904 = comb.or %903, %322, %902 : i1
    %905 = comb.xor %342, %true : i1
    %906 = comb.xor %315, %true : i1
    %907 = comb.or %906, %322, %905 : i1
    %908 = comb.xor %352, %true : i1
    %909 = comb.xor %315, %true : i1
    %910 = comb.or %909, %322, %908 : i1
    %911 = comb.xor %362, %true : i1
    %912 = comb.xor %315, %true : i1
    %913 = comb.or %912, %322, %911 : i1
    %914 = comb.xor %372, %true : i1
    %915 = comb.xor %315, %true : i1
    %916 = comb.or %915, %322, %914 : i1
    %917 = comb.xor %382, %true : i1
    %918 = comb.xor %315, %true : i1
    %919 = comb.or %918, %322, %917 : i1
    %920 = comb.xor %392, %true : i1
    %921 = comb.xor %315, %true : i1
    %922 = comb.or %921, %322, %920 : i1
    %923 = comb.xor %402, %true : i1
    %924 = comb.xor %315, %true : i1
    %925 = comb.or %924, %322, %923 : i1
    %926 = comb.xor %412, %true : i1
    %927 = comb.xor %315, %true : i1
    %928 = comb.or %927, %322, %926 : i1
    %929 = comb.xor %422, %true : i1
    %930 = comb.xor %315, %true : i1
    %931 = comb.or %930, %322, %929 : i1
    %932 = comb.xor %432, %true : i1
    %933 = comb.xor %315, %true : i1
    %934 = comb.or %933, %322, %932 : i1
    %935 = comb.xor %442, %true : i1
    %936 = comb.xor %315, %true : i1
    %937 = comb.or %936, %322, %935 : i1
    %938 = comb.xor %452, %true : i1
    %939 = comb.xor %315, %true : i1
    %940 = comb.or %939, %322, %938 : i1
    %941 = comb.xor %462, %true : i1
    %942 = comb.xor %315, %true : i1
    %943 = comb.or %942, %322, %941 : i1
    %944 = comb.xor %472, %true : i1
    %945 = comb.xor %315, %true : i1
    %946 = comb.or %945, %322, %944 : i1
    %947 = comb.add %level, %c-1_i2 {sv.namehint = "_level_T"} : i2
    %948 = comb.and bin %197, %198, %io_dcacheIO_cpuResult_ready, %17 : i1
    %949 = comb.xor %948, %true : i1
    %950 = comb.or %949, %225 : i1
    %951 = comb.mux bin %950, %level, %947 : i2
    %952 = comb.mux bin %17, %311, %c0_i2 : i2
    %953 = comb.mux bin %210, %952, %stage : i2
    %954 = comb.xor bin %io_dcacheIO_cpuResult_ready, %true : i1
    %955 = comb.xor %17, %true : i1
    %956 = comb.or %955, %261 : i1
    %957 = comb.and %211, %956 : i1
    %958 = comb.xor %17, %true : i1
    %959 = comb.or %958, %264 : i1
    %960 = comb.and %211, %959 : i1
    %961 = comb.mux bin %17, %271, %240 : i4
    %962 = comb.mux bin %211, %961, %ifCause : i4
    %963 = comb.xor %17, %true : i1
    %964 = comb.or %963, %264 : i1
    %965 = comb.and %211, %964 : i1
    %966 = comb.xor %17, %true : i1
    %967 = comb.or %966, %264 : i1
    %968 = comb.and %211, %967 : i1
    %969 = comb.and %17, %272 : i1
    %970 = comb.xor %211, %true : i1
    %971 = comb.or %970, %969 : i1
    %972 = comb.mux bin %17, %281, %241 : i1
    %973 = comb.mux bin %211, %972, %192 : i1
    %974 = comb.mux bin %17, %289, %242 : i1
    %975 = comb.mux bin %211, %974, %194 : i1
    %976 = comb.mux bin %17, %296, %243 : i4
    %977 = comb.mux bin %211, %976, %memCause : i4
    %978 = comb.mux bin %17, %304, %244 : i1
    %979 = comb.mux bin %211, %978, %memExcpt : i1
    %980 = comb.icmp bin eq %stage, %c-2_i2 : i2
    %981 = comb.and bin %current, %io_memIO_pipelineReq_cpuReq_rw {sv.namehint = "_writingPte_d_T_1"} : i1
    %982 = comb.or bin %981, %pte_d {sv.namehint = "writingPte_d"} : i1
    %983 = comb.icmp bin eq %level, %c1_i2 {sv.namehint = "_io_dcacheIO_cpuReq_addr_T_174"} : i2
    %984 = comb.extract %ptePpn from 9 : (i44) -> i11
    %985 = comb.concat %984, %vaddr_vpn_1 : i11, i9
    %986 = comb.extract %ptePpn from 0 : (i44) -> i20
    %987 = comb.mux bin %983, %985, %986 : i20
    %988 = comb.icmp bin eq %level, %c-2_i2 {sv.namehint = "_io_dcacheIO_cpuReq_addr_T_176"} : i2
    %989 = comb.extract %ptePpn from 18 : (i44) -> i2
    %990 = comb.concat %989, %vaddr_vpn_2, %vaddr_vpn_1 : i2, i9, i9
    %991 = comb.mux bin %988, %990, %987 : i20
    %992 = comb.concat %991, %vaddr_vpn_0, %c0_i3 : i20, i9, i3
    %993 = comb.mux bin %980, %992, %209 : i32
    %994 = comb.mux bin %197, %993, %147 {sv.namehint = "io_dcacheIO_cpuReq_addr"} : i32
    %995 = comb.or %980, %200 : i1
    %996 = comb.mux bin %197, %995, %io_memIO_pipelineReq_cpuReq_rw {sv.namehint = "io_dcacheIO_cpuReq_rw"} : i1
    %997 = comb.and bin %197, %980 : i1
    %998 = comb.mux bin %997, %c-1_i8, %io_memIO_pipelineReq_cpuReq_wmask {sv.namehint = "io_dcacheIO_cpuReq_wmask"} : i8
    %999 = comb.concat %pte_rsw1, %pte_ppn2, %pte_ppn1, %pte_ppn0, %pte_rsw0, %982, %true, %pte_g, %pte_u, %pte_x, %pte_w, %pte_r, %pte_v {sv.namehint = "_io_dcacheIO_cpuReq_data_T"} : i10, i26, i9, i9, i2, i1, i1, i1, i1, i1, i1, i1, i1
    %1000 = comb.mux bin %997, %999, %io_memIO_pipelineReq_cpuReq_data {sv.namehint = "io_dcacheIO_cpuReq_data"} : i64
    %1001 = comb.or bin %980, %198 : i1
    %1002 = comb.and bin %197, %1001 : i1
    %1003 = comb.xor %1002, %true : i1
    %1004 = comb.and %1003, %47 {sv.namehint = "io_memIO_pipelineResult_cpuResult_ready"} : i1
    %1005 = comb.extract %207 from 0 {sv.namehint = "_tlbEntry_T_1"} : (i9) -> i4
    %1006 = comb.icmp bin eq %1005, %c0_i4 : i4
    %1007 = comb.and bin %980, %io_dcacheIO_cpuResult_ready, %1006 : i1
    %1008 = comb.xor %325, %true : i1
    %1009 = comb.or %1007, %1008 : i1
    %1010 = comb.and %197, %1009 : i1
    %1011 = comb.mux bin %1010, %vaddr_vpn_0, %tlbEntries_0_vpn_0 : i9
    %1012 = comb.xor %328, %true : i1
    %1013 = comb.or %1007, %1012 : i1
    %1014 = comb.and %197, %1013 : i1
    %1015 = comb.mux bin %1014, %vaddr_vpn_1, %tlbEntries_0_vpn_1 : i9
    %1016 = comb.xor %331, %true : i1
    %1017 = comb.or %1007, %1016 : i1
    %1018 = comb.and %197, %1017 : i1
    %1019 = comb.mux bin %1018, %vaddr_vpn_2, %tlbEntries_0_vpn_2 : i9
    %1020 = comb.icmp bin eq %1005, %c1_i4 : i4
    %1021 = comb.and bin %980, %io_dcacheIO_cpuResult_ready, %1020 : i1
    %1022 = comb.xor %335, %true : i1
    %1023 = comb.or %1021, %1022 : i1
    %1024 = comb.and %197, %1023 : i1
    %1025 = comb.mux bin %1024, %vaddr_vpn_0, %tlbEntries_1_vpn_0 : i9
    %1026 = comb.xor %338, %true : i1
    %1027 = comb.or %1021, %1026 : i1
    %1028 = comb.and %197, %1027 : i1
    %1029 = comb.mux bin %1028, %vaddr_vpn_1, %tlbEntries_1_vpn_1 : i9
    %1030 = comb.xor %341, %true : i1
    %1031 = comb.or %1021, %1030 : i1
    %1032 = comb.and %197, %1031 : i1
    %1033 = comb.mux bin %1032, %vaddr_vpn_2, %tlbEntries_1_vpn_2 : i9
    %1034 = comb.icmp bin eq %1005, %c2_i4 : i4
    %1035 = comb.and bin %980, %io_dcacheIO_cpuResult_ready, %1034 : i1
    %1036 = comb.xor %345, %true : i1
    %1037 = comb.or %1035, %1036 : i1
    %1038 = comb.and %197, %1037 : i1
    %1039 = comb.mux bin %1038, %vaddr_vpn_0, %tlbEntries_2_vpn_0 : i9
    %1040 = comb.xor %348, %true : i1
    %1041 = comb.or %1035, %1040 : i1
    %1042 = comb.and %197, %1041 : i1
    %1043 = comb.mux bin %1042, %vaddr_vpn_1, %tlbEntries_2_vpn_1 : i9
    %1044 = comb.xor %351, %true : i1
    %1045 = comb.or %1035, %1044 : i1
    %1046 = comb.and %197, %1045 : i1
    %1047 = comb.mux bin %1046, %vaddr_vpn_2, %tlbEntries_2_vpn_2 : i9
    %1048 = comb.icmp bin eq %1005, %c3_i4 : i4
    %1049 = comb.and bin %980, %io_dcacheIO_cpuResult_ready, %1048 : i1
    %1050 = comb.xor %355, %true : i1
    %1051 = comb.or %1049, %1050 : i1
    %1052 = comb.and %197, %1051 : i1
    %1053 = comb.mux bin %1052, %vaddr_vpn_0, %tlbEntries_3_vpn_0 : i9
    %1054 = comb.xor %358, %true : i1
    %1055 = comb.or %1049, %1054 : i1
    %1056 = comb.and %197, %1055 : i1
    %1057 = comb.mux bin %1056, %vaddr_vpn_1, %tlbEntries_3_vpn_1 : i9
    %1058 = comb.xor %361, %true : i1
    %1059 = comb.or %1049, %1058 : i1
    %1060 = comb.and %197, %1059 : i1
    %1061 = comb.mux bin %1060, %vaddr_vpn_2, %tlbEntries_3_vpn_2 : i9
    %1062 = comb.icmp bin eq %1005, %c4_i4 : i4
    %1063 = comb.and bin %980, %io_dcacheIO_cpuResult_ready, %1062 : i1
    %1064 = comb.xor %365, %true : i1
    %1065 = comb.or %1063, %1064 : i1
    %1066 = comb.and %197, %1065 : i1
    %1067 = comb.mux bin %1066, %vaddr_vpn_0, %tlbEntries_4_vpn_0 : i9
    %1068 = comb.xor %368, %true : i1
    %1069 = comb.or %1063, %1068 : i1
    %1070 = comb.and %197, %1069 : i1
    %1071 = comb.mux bin %1070, %vaddr_vpn_1, %tlbEntries_4_vpn_1 : i9
    %1072 = comb.xor %371, %true : i1
    %1073 = comb.or %1063, %1072 : i1
    %1074 = comb.and %197, %1073 : i1
    %1075 = comb.mux bin %1074, %vaddr_vpn_2, %tlbEntries_4_vpn_2 : i9
    %1076 = comb.icmp bin eq %1005, %c5_i4 : i4
    %1077 = comb.and bin %980, %io_dcacheIO_cpuResult_ready, %1076 : i1
    %1078 = comb.xor %375, %true : i1
    %1079 = comb.or %1077, %1078 : i1
    %1080 = comb.and %197, %1079 : i1
    %1081 = comb.mux bin %1080, %vaddr_vpn_0, %tlbEntries_5_vpn_0 : i9
    %1082 = comb.xor %378, %true : i1
    %1083 = comb.or %1077, %1082 : i1
    %1084 = comb.and %197, %1083 : i1
    %1085 = comb.mux bin %1084, %vaddr_vpn_1, %tlbEntries_5_vpn_1 : i9
    %1086 = comb.xor %381, %true : i1
    %1087 = comb.or %1077, %1086 : i1
    %1088 = comb.and %197, %1087 : i1
    %1089 = comb.mux bin %1088, %vaddr_vpn_2, %tlbEntries_5_vpn_2 : i9
    %1090 = comb.icmp bin eq %1005, %c6_i4 : i4
    %1091 = comb.and bin %980, %io_dcacheIO_cpuResult_ready, %1090 : i1
    %1092 = comb.xor %385, %true : i1
    %1093 = comb.or %1091, %1092 : i1
    %1094 = comb.and %197, %1093 : i1
    %1095 = comb.mux bin %1094, %vaddr_vpn_0, %tlbEntries_6_vpn_0 : i9
    %1096 = comb.xor %388, %true : i1
    %1097 = comb.or %1091, %1096 : i1
    %1098 = comb.and %197, %1097 : i1
    %1099 = comb.mux bin %1098, %vaddr_vpn_1, %tlbEntries_6_vpn_1 : i9
    %1100 = comb.xor %391, %true : i1
    %1101 = comb.or %1091, %1100 : i1
    %1102 = comb.and %197, %1101 : i1
    %1103 = comb.mux bin %1102, %vaddr_vpn_2, %tlbEntries_6_vpn_2 : i9
    %1104 = comb.icmp bin eq %1005, %c7_i4 : i4
    %1105 = comb.and bin %980, %io_dcacheIO_cpuResult_ready, %1104 : i1
    %1106 = comb.xor %395, %true : i1
    %1107 = comb.or %1105, %1106 : i1
    %1108 = comb.and %197, %1107 : i1
    %1109 = comb.mux bin %1108, %vaddr_vpn_0, %tlbEntries_7_vpn_0 : i9
    %1110 = comb.xor %398, %true : i1
    %1111 = comb.or %1105, %1110 : i1
    %1112 = comb.and %197, %1111 : i1
    %1113 = comb.mux bin %1112, %vaddr_vpn_1, %tlbEntries_7_vpn_1 : i9
    %1114 = comb.xor %401, %true : i1
    %1115 = comb.or %1105, %1114 : i1
    %1116 = comb.and %197, %1115 : i1
    %1117 = comb.mux bin %1116, %vaddr_vpn_2, %tlbEntries_7_vpn_2 : i9
    %1118 = comb.icmp bin eq %1005, %c-8_i4 : i4
    %1119 = comb.and bin %980, %io_dcacheIO_cpuResult_ready, %1118 : i1
    %1120 = comb.xor %405, %true : i1
    %1121 = comb.or %1119, %1120 : i1
    %1122 = comb.and %197, %1121 : i1
    %1123 = comb.mux bin %1122, %vaddr_vpn_0, %tlbEntries_8_vpn_0 : i9
    %1124 = comb.xor %408, %true : i1
    %1125 = comb.or %1119, %1124 : i1
    %1126 = comb.and %197, %1125 : i1
    %1127 = comb.mux bin %1126, %vaddr_vpn_1, %tlbEntries_8_vpn_1 : i9
    %1128 = comb.xor %411, %true : i1
    %1129 = comb.or %1119, %1128 : i1
    %1130 = comb.and %197, %1129 : i1
    %1131 = comb.mux bin %1130, %vaddr_vpn_2, %tlbEntries_8_vpn_2 : i9
    %1132 = comb.icmp bin eq %1005, %c-7_i4 : i4
    %1133 = comb.and bin %980, %io_dcacheIO_cpuResult_ready, %1132 : i1
    %1134 = comb.xor %415, %true : i1
    %1135 = comb.or %1133, %1134 : i1
    %1136 = comb.and %197, %1135 : i1
    %1137 = comb.mux bin %1136, %vaddr_vpn_0, %tlbEntries_9_vpn_0 : i9
    %1138 = comb.xor %418, %true : i1
    %1139 = comb.or %1133, %1138 : i1
    %1140 = comb.and %197, %1139 : i1
    %1141 = comb.mux bin %1140, %vaddr_vpn_1, %tlbEntries_9_vpn_1 : i9
    %1142 = comb.xor %421, %true : i1
    %1143 = comb.or %1133, %1142 : i1
    %1144 = comb.and %197, %1143 : i1
    %1145 = comb.mux bin %1144, %vaddr_vpn_2, %tlbEntries_9_vpn_2 : i9
    %1146 = comb.icmp bin eq %1005, %c-6_i4 : i4
    %1147 = comb.and bin %980, %io_dcacheIO_cpuResult_ready, %1146 : i1
    %1148 = comb.xor %425, %true : i1
    %1149 = comb.or %1147, %1148 : i1
    %1150 = comb.and %197, %1149 : i1
    %1151 = comb.mux bin %1150, %vaddr_vpn_0, %tlbEntries_10_vpn_0 : i9
    %1152 = comb.xor %428, %true : i1
    %1153 = comb.or %1147, %1152 : i1
    %1154 = comb.and %197, %1153 : i1
    %1155 = comb.mux bin %1154, %vaddr_vpn_1, %tlbEntries_10_vpn_1 : i9
    %1156 = comb.xor %431, %true : i1
    %1157 = comb.or %1147, %1156 : i1
    %1158 = comb.and %197, %1157 : i1
    %1159 = comb.mux bin %1158, %vaddr_vpn_2, %tlbEntries_10_vpn_2 : i9
    %1160 = comb.icmp bin eq %1005, %c-5_i4 : i4
    %1161 = comb.and bin %980, %io_dcacheIO_cpuResult_ready, %1160 : i1
    %1162 = comb.xor %435, %true : i1
    %1163 = comb.or %1161, %1162 : i1
    %1164 = comb.and %197, %1163 : i1
    %1165 = comb.mux bin %1164, %vaddr_vpn_0, %tlbEntries_11_vpn_0 : i9
    %1166 = comb.xor %438, %true : i1
    %1167 = comb.or %1161, %1166 : i1
    %1168 = comb.and %197, %1167 : i1
    %1169 = comb.mux bin %1168, %vaddr_vpn_1, %tlbEntries_11_vpn_1 : i9
    %1170 = comb.xor %441, %true : i1
    %1171 = comb.or %1161, %1170 : i1
    %1172 = comb.and %197, %1171 : i1
    %1173 = comb.mux bin %1172, %vaddr_vpn_2, %tlbEntries_11_vpn_2 : i9
    %1174 = comb.icmp bin eq %1005, %c-4_i4 : i4
    %1175 = comb.and bin %980, %io_dcacheIO_cpuResult_ready, %1174 : i1
    %1176 = comb.xor %445, %true : i1
    %1177 = comb.or %1175, %1176 : i1
    %1178 = comb.and %197, %1177 : i1
    %1179 = comb.mux bin %1178, %vaddr_vpn_0, %tlbEntries_12_vpn_0 : i9
    %1180 = comb.xor %448, %true : i1
    %1181 = comb.or %1175, %1180 : i1
    %1182 = comb.and %197, %1181 : i1
    %1183 = comb.mux bin %1182, %vaddr_vpn_1, %tlbEntries_12_vpn_1 : i9
    %1184 = comb.xor %451, %true : i1
    %1185 = comb.or %1175, %1184 : i1
    %1186 = comb.and %197, %1185 : i1
    %1187 = comb.mux bin %1186, %vaddr_vpn_2, %tlbEntries_12_vpn_2 : i9
    %1188 = comb.icmp bin eq %1005, %c-3_i4 : i4
    %1189 = comb.and bin %980, %io_dcacheIO_cpuResult_ready, %1188 : i1
    %1190 = comb.xor %455, %true : i1
    %1191 = comb.or %1189, %1190 : i1
    %1192 = comb.and %197, %1191 : i1
    %1193 = comb.mux bin %1192, %vaddr_vpn_0, %tlbEntries_13_vpn_0 : i9
    %1194 = comb.xor %458, %true : i1
    %1195 = comb.or %1189, %1194 : i1
    %1196 = comb.and %197, %1195 : i1
    %1197 = comb.mux bin %1196, %vaddr_vpn_1, %tlbEntries_13_vpn_1 : i9
    %1198 = comb.xor %461, %true : i1
    %1199 = comb.or %1189, %1198 : i1
    %1200 = comb.and %197, %1199 : i1
    %1201 = comb.mux bin %1200, %vaddr_vpn_2, %tlbEntries_13_vpn_2 : i9
    %1202 = comb.icmp bin eq %1005, %c-2_i4 : i4
    %1203 = comb.and bin %980, %io_dcacheIO_cpuResult_ready, %1202 : i1
    %1204 = comb.xor %465, %true : i1
    %1205 = comb.or %1203, %1204 : i1
    %1206 = comb.and %197, %1205 : i1
    %1207 = comb.mux bin %1206, %vaddr_vpn_0, %tlbEntries_14_vpn_0 : i9
    %1208 = comb.xor %468, %true : i1
    %1209 = comb.or %1203, %1208 : i1
    %1210 = comb.and %197, %1209 : i1
    %1211 = comb.mux bin %1210, %vaddr_vpn_1, %tlbEntries_14_vpn_1 : i9
    %1212 = comb.xor %471, %true : i1
    %1213 = comb.or %1203, %1212 : i1
    %1214 = comb.and %197, %1213 : i1
    %1215 = comb.mux bin %1214, %vaddr_vpn_2, %tlbEntries_14_vpn_2 : i9
    %1216 = comb.icmp bin eq %1005, %c-1_i4 : i4
    %1217 = comb.and bin %980, %io_dcacheIO_cpuResult_ready, %1216 : i1
    %1218 = comb.xor %475, %true : i1
    %1219 = comb.or %1217, %1218 : i1
    %1220 = comb.and %197, %1219 : i1
    %1221 = comb.mux bin %1220, %vaddr_vpn_0, %tlbEntries_15_vpn_0 : i9
    %1222 = comb.xor %478, %true : i1
    %1223 = comb.or %1217, %1222 : i1
    %1224 = comb.and %197, %1223 : i1
    %1225 = comb.mux bin %1224, %vaddr_vpn_1, %tlbEntries_15_vpn_1 : i9
    %1226 = comb.xor %481, %true : i1
    %1227 = comb.or %1217, %1226 : i1
    %1228 = comb.and %197, %1227 : i1
    %1229 = comb.mux bin %1228, %vaddr_vpn_2, %tlbEntries_15_vpn_2 : i9
    %1230 = comb.concat %pte_ppn2, %pte_ppn1, %pte_ppn0 {sv.namehint = "_tlbEntries_ppn_T_3"} : i26, i9, i9
    %1231 = comb.mux bin %1007, %1230, %486 : i44
    %1232 = comb.mux bin %197, %1231, %tlbEntries_0_ppn : i44
    %1233 = comb.mux bin %1021, %1230, %490 : i44
    %1234 = comb.mux bin %197, %1233, %tlbEntries_1_ppn : i44
    %1235 = comb.mux bin %1035, %1230, %494 : i44
    %1236 = comb.mux bin %197, %1235, %tlbEntries_2_ppn : i44
    %1237 = comb.mux bin %1049, %1230, %498 : i44
    %1238 = comb.mux bin %197, %1237, %tlbEntries_3_ppn : i44
    %1239 = comb.mux bin %1063, %1230, %502 : i44
    %1240 = comb.mux bin %197, %1239, %tlbEntries_4_ppn : i44
    %1241 = comb.mux bin %1077, %1230, %506 : i44
    %1242 = comb.mux bin %197, %1241, %tlbEntries_5_ppn : i44
    %1243 = comb.mux bin %1091, %1230, %510 : i44
    %1244 = comb.mux bin %197, %1243, %tlbEntries_6_ppn : i44
    %1245 = comb.mux bin %1105, %1230, %514 : i44
    %1246 = comb.mux bin %197, %1245, %tlbEntries_7_ppn : i44
    %1247 = comb.mux bin %1119, %1230, %518 : i44
    %1248 = comb.mux bin %197, %1247, %tlbEntries_8_ppn : i44
    %1249 = comb.mux bin %1133, %1230, %522 : i44
    %1250 = comb.mux bin %197, %1249, %tlbEntries_9_ppn : i44
    %1251 = comb.mux bin %1147, %1230, %526 : i44
    %1252 = comb.mux bin %197, %1251, %tlbEntries_10_ppn : i44
    %1253 = comb.mux bin %1161, %1230, %530 : i44
    %1254 = comb.mux bin %197, %1253, %tlbEntries_11_ppn : i44
    %1255 = comb.mux bin %1175, %1230, %534 : i44
    %1256 = comb.mux bin %197, %1255, %tlbEntries_12_ppn : i44
    %1257 = comb.mux bin %1189, %1230, %538 : i44
    %1258 = comb.mux bin %197, %1257, %tlbEntries_13_ppn : i44
    %1259 = comb.mux bin %1203, %1230, %542 : i44
    %1260 = comb.mux bin %197, %1259, %tlbEntries_14_ppn : i44
    %1261 = comb.mux bin %1217, %1230, %546 : i44
    %1262 = comb.mux bin %197, %1261, %tlbEntries_15_ppn : i44
    %1263 = comb.or %1007, %548 : i1
    %1264 = comb.and %197, %1263 : i1
    %1265 = comb.or %1264, %tlbEntries_0_v : i1
    %1266 = comb.or %1021, %550 : i1
    %1267 = comb.and %197, %1266 : i1
    %1268 = comb.or %1267, %tlbEntries_1_v : i1
    %1269 = comb.or %1035, %552 : i1
    %1270 = comb.and %197, %1269 : i1
    %1271 = comb.or %1270, %tlbEntries_2_v : i1
    %1272 = comb.or %1049, %554 : i1
    %1273 = comb.and %197, %1272 : i1
    %1274 = comb.or %1273, %tlbEntries_3_v : i1
    %1275 = comb.or %1063, %556 : i1
    %1276 = comb.and %197, %1275 : i1
    %1277 = comb.or %1276, %tlbEntries_4_v : i1
    %1278 = comb.or %1077, %558 : i1
    %1279 = comb.and %197, %1278 : i1
    %1280 = comb.or %1279, %tlbEntries_5_v : i1
    %1281 = comb.or %1091, %560 : i1
    %1282 = comb.and %197, %1281 : i1
    %1283 = comb.or %1282, %tlbEntries_6_v : i1
    %1284 = comb.or %1105, %562 : i1
    %1285 = comb.and %197, %1284 : i1
    %1286 = comb.or %1285, %tlbEntries_7_v : i1
    %1287 = comb.or %1119, %564 : i1
    %1288 = comb.and %197, %1287 : i1
    %1289 = comb.or %1288, %tlbEntries_8_v : i1
    %1290 = comb.or %1133, %566 : i1
    %1291 = comb.and %197, %1290 : i1
    %1292 = comb.or %1291, %tlbEntries_9_v : i1
    %1293 = comb.or %1147, %568 : i1
    %1294 = comb.and %197, %1293 : i1
    %1295 = comb.or %1294, %tlbEntries_10_v : i1
    %1296 = comb.or %1161, %570 : i1
    %1297 = comb.and %197, %1296 : i1
    %1298 = comb.or %1297, %tlbEntries_11_v : i1
    %1299 = comb.or %1175, %572 : i1
    %1300 = comb.and %197, %1299 : i1
    %1301 = comb.or %1300, %tlbEntries_12_v : i1
    %1302 = comb.or %1189, %574 : i1
    %1303 = comb.and %197, %1302 : i1
    %1304 = comb.or %1303, %tlbEntries_13_v : i1
    %1305 = comb.or %1203, %576 : i1
    %1306 = comb.and %197, %1305 : i1
    %1307 = comb.or %1306, %tlbEntries_14_v : i1
    %1308 = comb.or %1217, %578 : i1
    %1309 = comb.and %197, %1308 : i1
    %1310 = comb.or %1309, %tlbEntries_15_v : i1
    %1311 = comb.mux bin %1007, %pte_r, %582 : i1
    %1312 = comb.mux bin %197, %1311, %tlbEntries_0_r : i1
    %1313 = comb.mux bin %1021, %pte_r, %586 : i1
    %1314 = comb.mux bin %197, %1313, %tlbEntries_1_r : i1
    %1315 = comb.mux bin %1035, %pte_r, %590 : i1
    %1316 = comb.mux bin %197, %1315, %tlbEntries_2_r : i1
    %1317 = comb.mux bin %1049, %pte_r, %594 : i1
    %1318 = comb.mux bin %197, %1317, %tlbEntries_3_r : i1
    %1319 = comb.mux bin %1063, %pte_r, %598 : i1
    %1320 = comb.mux bin %197, %1319, %tlbEntries_4_r : i1
    %1321 = comb.mux bin %1077, %pte_r, %602 : i1
    %1322 = comb.mux bin %197, %1321, %tlbEntries_5_r : i1
    %1323 = comb.mux bin %1091, %pte_r, %606 : i1
    %1324 = comb.mux bin %197, %1323, %tlbEntries_6_r : i1
    %1325 = comb.mux bin %1105, %pte_r, %610 : i1
    %1326 = comb.mux bin %197, %1325, %tlbEntries_7_r : i1
    %1327 = comb.mux bin %1119, %pte_r, %614 : i1
    %1328 = comb.mux bin %197, %1327, %tlbEntries_8_r : i1
    %1329 = comb.mux bin %1133, %pte_r, %618 : i1
    %1330 = comb.mux bin %197, %1329, %tlbEntries_9_r : i1
    %1331 = comb.mux bin %1147, %pte_r, %622 : i1
    %1332 = comb.mux bin %197, %1331, %tlbEntries_10_r : i1
    %1333 = comb.mux bin %1161, %pte_r, %626 : i1
    %1334 = comb.mux bin %197, %1333, %tlbEntries_11_r : i1
    %1335 = comb.mux bin %1175, %pte_r, %630 : i1
    %1336 = comb.mux bin %197, %1335, %tlbEntries_12_r : i1
    %1337 = comb.mux bin %1189, %pte_r, %634 : i1
    %1338 = comb.mux bin %197, %1337, %tlbEntries_13_r : i1
    %1339 = comb.mux bin %1203, %pte_r, %638 : i1
    %1340 = comb.mux bin %197, %1339, %tlbEntries_14_r : i1
    %1341 = comb.mux bin %1217, %pte_r, %642 : i1
    %1342 = comb.mux bin %197, %1341, %tlbEntries_15_r : i1
    %1343 = comb.mux bin %1007, %pte_u, %646 : i1
    %1344 = comb.mux bin %197, %1343, %tlbEntries_0_u : i1
    %1345 = comb.mux bin %1021, %pte_u, %650 : i1
    %1346 = comb.mux bin %197, %1345, %tlbEntries_1_u : i1
    %1347 = comb.mux bin %1035, %pte_u, %654 : i1
    %1348 = comb.mux bin %197, %1347, %tlbEntries_2_u : i1
    %1349 = comb.mux bin %1049, %pte_u, %658 : i1
    %1350 = comb.mux bin %197, %1349, %tlbEntries_3_u : i1
    %1351 = comb.mux bin %1063, %pte_u, %662 : i1
    %1352 = comb.mux bin %197, %1351, %tlbEntries_4_u : i1
    %1353 = comb.mux bin %1077, %pte_u, %666 : i1
    %1354 = comb.mux bin %197, %1353, %tlbEntries_5_u : i1
    %1355 = comb.mux bin %1091, %pte_u, %670 : i1
    %1356 = comb.mux bin %197, %1355, %tlbEntries_6_u : i1
    %1357 = comb.mux bin %1105, %pte_u, %674 : i1
    %1358 = comb.mux bin %197, %1357, %tlbEntries_7_u : i1
    %1359 = comb.mux bin %1119, %pte_u, %678 : i1
    %1360 = comb.mux bin %197, %1359, %tlbEntries_8_u : i1
    %1361 = comb.mux bin %1133, %pte_u, %682 : i1
    %1362 = comb.mux bin %197, %1361, %tlbEntries_9_u : i1
    %1363 = comb.mux bin %1147, %pte_u, %686 : i1
    %1364 = comb.mux bin %197, %1363, %tlbEntries_10_u : i1
    %1365 = comb.mux bin %1161, %pte_u, %690 : i1
    %1366 = comb.mux bin %197, %1365, %tlbEntries_11_u : i1
    %1367 = comb.mux bin %1175, %pte_u, %694 : i1
    %1368 = comb.mux bin %197, %1367, %tlbEntries_12_u : i1
    %1369 = comb.mux bin %1189, %pte_u, %698 : i1
    %1370 = comb.mux bin %197, %1369, %tlbEntries_13_u : i1
    %1371 = comb.mux bin %1203, %pte_u, %702 : i1
    %1372 = comb.mux bin %197, %1371, %tlbEntries_14_u : i1
    %1373 = comb.mux bin %1217, %pte_u, %706 : i1
    %1374 = comb.mux bin %197, %1373, %tlbEntries_15_u : i1
    %1375 = comb.mux bin %1007, %pte_w, %710 : i1
    %1376 = comb.mux bin %197, %1375, %tlbEntries_0_w : i1
    %1377 = comb.mux bin %1021, %pte_w, %714 : i1
    %1378 = comb.mux bin %197, %1377, %tlbEntries_1_w : i1
    %1379 = comb.mux bin %1035, %pte_w, %718 : i1
    %1380 = comb.mux bin %197, %1379, %tlbEntries_2_w : i1
    %1381 = comb.mux bin %1049, %pte_w, %722 : i1
    %1382 = comb.mux bin %197, %1381, %tlbEntries_3_w : i1
    %1383 = comb.mux bin %1063, %pte_w, %726 : i1
    %1384 = comb.mux bin %197, %1383, %tlbEntries_4_w : i1
    %1385 = comb.mux bin %1077, %pte_w, %730 : i1
    %1386 = comb.mux bin %197, %1385, %tlbEntries_5_w : i1
    %1387 = comb.mux bin %1091, %pte_w, %734 : i1
    %1388 = comb.mux bin %197, %1387, %tlbEntries_6_w : i1
    %1389 = comb.mux bin %1105, %pte_w, %738 : i1
    %1390 = comb.mux bin %197, %1389, %tlbEntries_7_w : i1
    %1391 = comb.mux bin %1119, %pte_w, %742 : i1
    %1392 = comb.mux bin %197, %1391, %tlbEntries_8_w : i1
    %1393 = comb.mux bin %1133, %pte_w, %746 : i1
    %1394 = comb.mux bin %197, %1393, %tlbEntries_9_w : i1
    %1395 = comb.mux bin %1147, %pte_w, %750 : i1
    %1396 = comb.mux bin %197, %1395, %tlbEntries_10_w : i1
    %1397 = comb.mux bin %1161, %pte_w, %754 : i1
    %1398 = comb.mux bin %197, %1397, %tlbEntries_11_w : i1
    %1399 = comb.mux bin %1175, %pte_w, %758 : i1
    %1400 = comb.mux bin %197, %1399, %tlbEntries_12_w : i1
    %1401 = comb.mux bin %1189, %pte_w, %762 : i1
    %1402 = comb.mux bin %197, %1401, %tlbEntries_13_w : i1
    %1403 = comb.mux bin %1203, %pte_w, %766 : i1
    %1404 = comb.mux bin %197, %1403, %tlbEntries_14_w : i1
    %1405 = comb.mux bin %1217, %pte_w, %770 : i1
    %1406 = comb.mux bin %197, %1405, %tlbEntries_15_w : i1
    %1407 = comb.mux bin %1007, %pte_x, %774 : i1
    %1408 = comb.mux bin %197, %1407, %tlbEntries_0_x : i1
    %1409 = comb.mux bin %1021, %pte_x, %778 : i1
    %1410 = comb.mux bin %197, %1409, %tlbEntries_1_x : i1
    %1411 = comb.mux bin %1035, %pte_x, %782 : i1
    %1412 = comb.mux bin %197, %1411, %tlbEntries_2_x : i1
    %1413 = comb.mux bin %1049, %pte_x, %786 : i1
    %1414 = comb.mux bin %197, %1413, %tlbEntries_3_x : i1
    %1415 = comb.mux bin %1063, %pte_x, %790 : i1
    %1416 = comb.mux bin %197, %1415, %tlbEntries_4_x : i1
    %1417 = comb.mux bin %1077, %pte_x, %794 : i1
    %1418 = comb.mux bin %197, %1417, %tlbEntries_5_x : i1
    %1419 = comb.mux bin %1091, %pte_x, %798 : i1
    %1420 = comb.mux bin %197, %1419, %tlbEntries_6_x : i1
    %1421 = comb.mux bin %1105, %pte_x, %802 : i1
    %1422 = comb.mux bin %197, %1421, %tlbEntries_7_x : i1
    %1423 = comb.mux bin %1119, %pte_x, %806 : i1
    %1424 = comb.mux bin %197, %1423, %tlbEntries_8_x : i1
    %1425 = comb.mux bin %1133, %pte_x, %810 : i1
    %1426 = comb.mux bin %197, %1425, %tlbEntries_9_x : i1
    %1427 = comb.mux bin %1147, %pte_x, %814 : i1
    %1428 = comb.mux bin %197, %1427, %tlbEntries_10_x : i1
    %1429 = comb.mux bin %1161, %pte_x, %818 : i1
    %1430 = comb.mux bin %197, %1429, %tlbEntries_11_x : i1
    %1431 = comb.mux bin %1175, %pte_x, %822 : i1
    %1432 = comb.mux bin %197, %1431, %tlbEntries_12_x : i1
    %1433 = comb.mux bin %1189, %pte_x, %826 : i1
    %1434 = comb.mux bin %197, %1433, %tlbEntries_13_x : i1
    %1435 = comb.mux bin %1203, %pte_x, %830 : i1
    %1436 = comb.mux bin %197, %1435, %tlbEntries_14_x : i1
    %1437 = comb.mux bin %1217, %pte_x, %834 : i1
    %1438 = comb.mux bin %197, %1437, %tlbEntries_15_x : i1
    %1439 = comb.mux bin %1007, %982, %838 : i1
    %1440 = comb.mux bin %197, %1439, %tlbEntries_0_d : i1
    %1441 = comb.mux bin %1021, %982, %842 : i1
    %1442 = comb.mux bin %197, %1441, %tlbEntries_1_d : i1
    %1443 = comb.mux bin %1035, %982, %846 : i1
    %1444 = comb.mux bin %197, %1443, %tlbEntries_2_d : i1
    %1445 = comb.mux bin %1049, %982, %850 : i1
    %1446 = comb.mux bin %197, %1445, %tlbEntries_3_d : i1
    %1447 = comb.mux bin %1063, %982, %854 : i1
    %1448 = comb.mux bin %197, %1447, %tlbEntries_4_d : i1
    %1449 = comb.mux bin %1077, %982, %858 : i1
    %1450 = comb.mux bin %197, %1449, %tlbEntries_5_d : i1
    %1451 = comb.mux bin %1091, %982, %862 : i1
    %1452 = comb.mux bin %197, %1451, %tlbEntries_6_d : i1
    %1453 = comb.mux bin %1105, %982, %866 : i1
    %1454 = comb.mux bin %197, %1453, %tlbEntries_7_d : i1
    %1455 = comb.mux bin %1119, %982, %870 : i1
    %1456 = comb.mux bin %197, %1455, %tlbEntries_8_d : i1
    %1457 = comb.mux bin %1133, %982, %874 : i1
    %1458 = comb.mux bin %197, %1457, %tlbEntries_9_d : i1
    %1459 = comb.mux bin %1147, %982, %878 : i1
    %1460 = comb.mux bin %197, %1459, %tlbEntries_10_d : i1
    %1461 = comb.mux bin %1161, %982, %882 : i1
    %1462 = comb.mux bin %197, %1461, %tlbEntries_11_d : i1
    %1463 = comb.mux bin %1175, %982, %886 : i1
    %1464 = comb.mux bin %197, %1463, %tlbEntries_12_d : i1
    %1465 = comb.mux bin %1189, %982, %890 : i1
    %1466 = comb.mux bin %197, %1465, %tlbEntries_13_d : i1
    %1467 = comb.mux bin %1203, %982, %894 : i1
    %1468 = comb.mux bin %197, %1467, %tlbEntries_14_d : i1
    %1469 = comb.mux bin %1217, %982, %898 : i1
    %1470 = comb.mux bin %197, %1469, %tlbEntries_15_d : i1
    %1471 = comb.xor %901, %true : i1
    %1472 = comb.or %1007, %1471 : i1
    %1473 = comb.and %197, %1472 : i1
    %1474 = comb.mux bin %1473, %level, %tlbEntries_0_i : i2
    %1475 = comb.xor %904, %true : i1
    %1476 = comb.or %1021, %1475 : i1
    %1477 = comb.and %197, %1476 : i1
    %1478 = comb.mux bin %1477, %level, %tlbEntries_1_i : i2
    %1479 = comb.xor %907, %true : i1
    %1480 = comb.or %1035, %1479 : i1
    %1481 = comb.and %197, %1480 : i1
    %1482 = comb.mux bin %1481, %level, %tlbEntries_2_i : i2
    %1483 = comb.xor %910, %true : i1
    %1484 = comb.or %1049, %1483 : i1
    %1485 = comb.and %197, %1484 : i1
    %1486 = comb.mux bin %1485, %level, %tlbEntries_3_i : i2
    %1487 = comb.xor %913, %true : i1
    %1488 = comb.or %1063, %1487 : i1
    %1489 = comb.and %197, %1488 : i1
    %1490 = comb.mux bin %1489, %level, %tlbEntries_4_i : i2
    %1491 = comb.xor %916, %true : i1
    %1492 = comb.or %1077, %1491 : i1
    %1493 = comb.and %197, %1492 : i1
    %1494 = comb.mux bin %1493, %level, %tlbEntries_5_i : i2
    %1495 = comb.xor %919, %true : i1
    %1496 = comb.or %1091, %1495 : i1
    %1497 = comb.and %197, %1496 : i1
    %1498 = comb.mux bin %1497, %level, %tlbEntries_6_i : i2
    %1499 = comb.xor %922, %true : i1
    %1500 = comb.or %1105, %1499 : i1
    %1501 = comb.and %197, %1500 : i1
    %1502 = comb.mux bin %1501, %level, %tlbEntries_7_i : i2
    %1503 = comb.xor %925, %true : i1
    %1504 = comb.or %1119, %1503 : i1
    %1505 = comb.and %197, %1504 : i1
    %1506 = comb.mux bin %1505, %level, %tlbEntries_8_i : i2
    %1507 = comb.xor %928, %true : i1
    %1508 = comb.or %1133, %1507 : i1
    %1509 = comb.and %197, %1508 : i1
    %1510 = comb.mux bin %1509, %level, %tlbEntries_9_i : i2
    %1511 = comb.xor %931, %true : i1
    %1512 = comb.or %1147, %1511 : i1
    %1513 = comb.and %197, %1512 : i1
    %1514 = comb.mux bin %1513, %level, %tlbEntries_10_i : i2
    %1515 = comb.xor %934, %true : i1
    %1516 = comb.or %1161, %1515 : i1
    %1517 = comb.and %197, %1516 : i1
    %1518 = comb.mux bin %1517, %level, %tlbEntries_11_i : i2
    %1519 = comb.xor %937, %true : i1
    %1520 = comb.or %1175, %1519 : i1
    %1521 = comb.and %197, %1520 : i1
    %1522 = comb.mux bin %1521, %level, %tlbEntries_12_i : i2
    %1523 = comb.xor %940, %true : i1
    %1524 = comb.or %1189, %1523 : i1
    %1525 = comb.and %197, %1524 : i1
    %1526 = comb.mux bin %1525, %level, %tlbEntries_13_i : i2
    %1527 = comb.xor %943, %true : i1
    %1528 = comb.or %1203, %1527 : i1
    %1529 = comb.and %197, %1528 : i1
    %1530 = comb.mux bin %1529, %level, %tlbEntries_14_i : i2
    %1531 = comb.xor %946, %true : i1
    %1532 = comb.or %1217, %1531 : i1
    %1533 = comb.and %197, %1532 : i1
    %1534 = comb.mux bin %1533, %level, %tlbEntries_15_i : i2
    %1535 = comb.or %980, %198 : i1
    %1536 = comb.and %197, %1535 : i1
    %1537 = comb.mux bin %1536, %954, %196 : i1
    %1538 = comb.and bin %980, %io_dcacheIO_cpuResult_ready : i1
    %1539 = comb.mux bin %1538, %c0_i2, %953 : i2
    %1540 = comb.mux bin %197, %1539, %stage : i2
    %1541 = comb.and bin %io_memIO_pipelineReq_cpuReq_valid, %io_memIO_pipelineReq_flush : i1
    %1542 = comb.mux bin %1541, %c0_i44, %1232 : i44
    %1543 = comb.mux bin %1541, %c0_i9, %1011 : i9
    %1544 = comb.mux bin %1541, %c0_i9, %1015 : i9
    %1545 = comb.mux bin %1541, %c0_i9, %1019 : i9
    %1546 = comb.mux bin %1541, %c0_i2, %1474 : i2
    %1547 = comb.xor %1541, %true : i1
    %1548 = comb.and %1547, %1440 : i1
    %1549 = comb.xor %1541, %true : i1
    %1550 = comb.and %1549, %1344 : i1
    %1551 = comb.xor %1541, %true : i1
    %1552 = comb.and %1551, %1408 : i1
    %1553 = comb.xor %1541, %true : i1
    %1554 = comb.and %1553, %1376 : i1
    %1555 = comb.xor %1541, %true : i1
    %1556 = comb.and %1555, %1312 : i1
    %1557 = comb.xor %1541, %true : i1
    %1558 = comb.and %1557, %1265 : i1
    %1559 = comb.mux bin %1541, %c0_i44, %1234 : i44
    %1560 = comb.mux bin %1541, %c0_i9, %1025 : i9
    %1561 = comb.mux bin %1541, %c0_i9, %1029 : i9
    %1562 = comb.mux bin %1541, %c0_i9, %1033 : i9
    %1563 = comb.mux bin %1541, %c0_i2, %1478 : i2
    %1564 = comb.xor %1541, %true : i1
    %1565 = comb.and %1564, %1442 : i1
    %1566 = comb.xor %1541, %true : i1
    %1567 = comb.and %1566, %1346 : i1
    %1568 = comb.xor %1541, %true : i1
    %1569 = comb.and %1568, %1410 : i1
    %1570 = comb.xor %1541, %true : i1
    %1571 = comb.and %1570, %1378 : i1
    %1572 = comb.xor %1541, %true : i1
    %1573 = comb.and %1572, %1314 : i1
    %1574 = comb.xor %1541, %true : i1
    %1575 = comb.and %1574, %1268 : i1
    %1576 = comb.mux bin %1541, %c0_i44, %1236 : i44
    %1577 = comb.mux bin %1541, %c0_i9, %1039 : i9
    %1578 = comb.mux bin %1541, %c0_i9, %1043 : i9
    %1579 = comb.mux bin %1541, %c0_i9, %1047 : i9
    %1580 = comb.mux bin %1541, %c0_i2, %1482 : i2
    %1581 = comb.xor %1541, %true : i1
    %1582 = comb.and %1581, %1444 : i1
    %1583 = comb.xor %1541, %true : i1
    %1584 = comb.and %1583, %1348 : i1
    %1585 = comb.xor %1541, %true : i1
    %1586 = comb.and %1585, %1412 : i1
    %1587 = comb.xor %1541, %true : i1
    %1588 = comb.and %1587, %1380 : i1
    %1589 = comb.xor %1541, %true : i1
    %1590 = comb.and %1589, %1316 : i1
    %1591 = comb.xor %1541, %true : i1
    %1592 = comb.and %1591, %1271 : i1
    %1593 = comb.mux bin %1541, %c0_i44, %1238 : i44
    %1594 = comb.mux bin %1541, %c0_i9, %1053 : i9
    %1595 = comb.mux bin %1541, %c0_i9, %1057 : i9
    %1596 = comb.mux bin %1541, %c0_i9, %1061 : i9
    %1597 = comb.mux bin %1541, %c0_i2, %1486 : i2
    %1598 = comb.xor %1541, %true : i1
    %1599 = comb.and %1598, %1446 : i1
    %1600 = comb.xor %1541, %true : i1
    %1601 = comb.and %1600, %1350 : i1
    %1602 = comb.xor %1541, %true : i1
    %1603 = comb.and %1602, %1414 : i1
    %1604 = comb.xor %1541, %true : i1
    %1605 = comb.and %1604, %1382 : i1
    %1606 = comb.xor %1541, %true : i1
    %1607 = comb.and %1606, %1318 : i1
    %1608 = comb.xor %1541, %true : i1
    %1609 = comb.and %1608, %1274 : i1
    %1610 = comb.mux bin %1541, %c0_i44, %1240 : i44
    %1611 = comb.mux bin %1541, %c0_i9, %1067 : i9
    %1612 = comb.mux bin %1541, %c0_i9, %1071 : i9
    %1613 = comb.mux bin %1541, %c0_i9, %1075 : i9
    %1614 = comb.mux bin %1541, %c0_i2, %1490 : i2
    %1615 = comb.xor %1541, %true : i1
    %1616 = comb.and %1615, %1448 : i1
    %1617 = comb.xor %1541, %true : i1
    %1618 = comb.and %1617, %1352 : i1
    %1619 = comb.xor %1541, %true : i1
    %1620 = comb.and %1619, %1416 : i1
    %1621 = comb.xor %1541, %true : i1
    %1622 = comb.and %1621, %1384 : i1
    %1623 = comb.xor %1541, %true : i1
    %1624 = comb.and %1623, %1320 : i1
    %1625 = comb.xor %1541, %true : i1
    %1626 = comb.and %1625, %1277 : i1
    %1627 = comb.mux bin %1541, %c0_i44, %1242 : i44
    %1628 = comb.mux bin %1541, %c0_i9, %1081 : i9
    %1629 = comb.mux bin %1541, %c0_i9, %1085 : i9
    %1630 = comb.mux bin %1541, %c0_i9, %1089 : i9
    %1631 = comb.mux bin %1541, %c0_i2, %1494 : i2
    %1632 = comb.xor %1541, %true : i1
    %1633 = comb.and %1632, %1450 : i1
    %1634 = comb.xor %1541, %true : i1
    %1635 = comb.and %1634, %1354 : i1
    %1636 = comb.xor %1541, %true : i1
    %1637 = comb.and %1636, %1418 : i1
    %1638 = comb.xor %1541, %true : i1
    %1639 = comb.and %1638, %1386 : i1
    %1640 = comb.xor %1541, %true : i1
    %1641 = comb.and %1640, %1322 : i1
    %1642 = comb.xor %1541, %true : i1
    %1643 = comb.and %1642, %1280 : i1
    %1644 = comb.mux bin %1541, %c0_i44, %1244 : i44
    %1645 = comb.mux bin %1541, %c0_i9, %1095 : i9
    %1646 = comb.mux bin %1541, %c0_i9, %1099 : i9
    %1647 = comb.mux bin %1541, %c0_i9, %1103 : i9
    %1648 = comb.mux bin %1541, %c0_i2, %1498 : i2
    %1649 = comb.xor %1541, %true : i1
    %1650 = comb.and %1649, %1452 : i1
    %1651 = comb.xor %1541, %true : i1
    %1652 = comb.and %1651, %1356 : i1
    %1653 = comb.xor %1541, %true : i1
    %1654 = comb.and %1653, %1420 : i1
    %1655 = comb.xor %1541, %true : i1
    %1656 = comb.and %1655, %1388 : i1
    %1657 = comb.xor %1541, %true : i1
    %1658 = comb.and %1657, %1324 : i1
    %1659 = comb.xor %1541, %true : i1
    %1660 = comb.and %1659, %1283 : i1
    %1661 = comb.mux bin %1541, %c0_i44, %1246 : i44
    %1662 = comb.mux bin %1541, %c0_i9, %1109 : i9
    %1663 = comb.mux bin %1541, %c0_i9, %1113 : i9
    %1664 = comb.mux bin %1541, %c0_i9, %1117 : i9
    %1665 = comb.mux bin %1541, %c0_i2, %1502 : i2
    %1666 = comb.xor %1541, %true : i1
    %1667 = comb.and %1666, %1454 : i1
    %1668 = comb.xor %1541, %true : i1
    %1669 = comb.and %1668, %1358 : i1
    %1670 = comb.xor %1541, %true : i1
    %1671 = comb.and %1670, %1422 : i1
    %1672 = comb.xor %1541, %true : i1
    %1673 = comb.and %1672, %1390 : i1
    %1674 = comb.xor %1541, %true : i1
    %1675 = comb.and %1674, %1326 : i1
    %1676 = comb.xor %1541, %true : i1
    %1677 = comb.and %1676, %1286 : i1
    %1678 = comb.mux bin %1541, %c0_i44, %1248 : i44
    %1679 = comb.mux bin %1541, %c0_i9, %1123 : i9
    %1680 = comb.mux bin %1541, %c0_i9, %1127 : i9
    %1681 = comb.mux bin %1541, %c0_i9, %1131 : i9
    %1682 = comb.mux bin %1541, %c0_i2, %1506 : i2
    %1683 = comb.xor %1541, %true : i1
    %1684 = comb.and %1683, %1456 : i1
    %1685 = comb.xor %1541, %true : i1
    %1686 = comb.and %1685, %1360 : i1
    %1687 = comb.xor %1541, %true : i1
    %1688 = comb.and %1687, %1424 : i1
    %1689 = comb.xor %1541, %true : i1
    %1690 = comb.and %1689, %1392 : i1
    %1691 = comb.xor %1541, %true : i1
    %1692 = comb.and %1691, %1328 : i1
    %1693 = comb.xor %1541, %true : i1
    %1694 = comb.and %1693, %1289 : i1
    %1695 = comb.mux bin %1541, %c0_i44, %1250 : i44
    %1696 = comb.mux bin %1541, %c0_i9, %1137 : i9
    %1697 = comb.mux bin %1541, %c0_i9, %1141 : i9
    %1698 = comb.mux bin %1541, %c0_i9, %1145 : i9
    %1699 = comb.mux bin %1541, %c0_i2, %1510 : i2
    %1700 = comb.xor %1541, %true : i1
    %1701 = comb.and %1700, %1458 : i1
    %1702 = comb.xor %1541, %true : i1
    %1703 = comb.and %1702, %1362 : i1
    %1704 = comb.xor %1541, %true : i1
    %1705 = comb.and %1704, %1426 : i1
    %1706 = comb.xor %1541, %true : i1
    %1707 = comb.and %1706, %1394 : i1
    %1708 = comb.xor %1541, %true : i1
    %1709 = comb.and %1708, %1330 : i1
    %1710 = comb.xor %1541, %true : i1
    %1711 = comb.and %1710, %1292 : i1
    %1712 = comb.mux bin %1541, %c0_i44, %1252 : i44
    %1713 = comb.mux bin %1541, %c0_i9, %1151 : i9
    %1714 = comb.mux bin %1541, %c0_i9, %1155 : i9
    %1715 = comb.mux bin %1541, %c0_i9, %1159 : i9
    %1716 = comb.mux bin %1541, %c0_i2, %1514 : i2
    %1717 = comb.xor %1541, %true : i1
    %1718 = comb.and %1717, %1460 : i1
    %1719 = comb.xor %1541, %true : i1
    %1720 = comb.and %1719, %1364 : i1
    %1721 = comb.xor %1541, %true : i1
    %1722 = comb.and %1721, %1428 : i1
    %1723 = comb.xor %1541, %true : i1
    %1724 = comb.and %1723, %1396 : i1
    %1725 = comb.xor %1541, %true : i1
    %1726 = comb.and %1725, %1332 : i1
    %1727 = comb.xor %1541, %true : i1
    %1728 = comb.and %1727, %1295 : i1
    %1729 = comb.mux bin %1541, %c0_i44, %1254 : i44
    %1730 = comb.mux bin %1541, %c0_i9, %1165 : i9
    %1731 = comb.mux bin %1541, %c0_i9, %1169 : i9
    %1732 = comb.mux bin %1541, %c0_i9, %1173 : i9
    %1733 = comb.mux bin %1541, %c0_i2, %1518 : i2
    %1734 = comb.xor %1541, %true : i1
    %1735 = comb.and %1734, %1462 : i1
    %1736 = comb.xor %1541, %true : i1
    %1737 = comb.and %1736, %1366 : i1
    %1738 = comb.xor %1541, %true : i1
    %1739 = comb.and %1738, %1430 : i1
    %1740 = comb.xor %1541, %true : i1
    %1741 = comb.and %1740, %1398 : i1
    %1742 = comb.xor %1541, %true : i1
    %1743 = comb.and %1742, %1334 : i1
    %1744 = comb.xor %1541, %true : i1
    %1745 = comb.and %1744, %1298 : i1
    %1746 = comb.mux bin %1541, %c0_i44, %1256 : i44
    %1747 = comb.mux bin %1541, %c0_i9, %1179 : i9
    %1748 = comb.mux bin %1541, %c0_i9, %1183 : i9
    %1749 = comb.mux bin %1541, %c0_i9, %1187 : i9
    %1750 = comb.mux bin %1541, %c0_i2, %1522 : i2
    %1751 = comb.xor %1541, %true : i1
    %1752 = comb.and %1751, %1464 : i1
    %1753 = comb.xor %1541, %true : i1
    %1754 = comb.and %1753, %1368 : i1
    %1755 = comb.xor %1541, %true : i1
    %1756 = comb.and %1755, %1432 : i1
    %1757 = comb.xor %1541, %true : i1
    %1758 = comb.and %1757, %1400 : i1
    %1759 = comb.xor %1541, %true : i1
    %1760 = comb.and %1759, %1336 : i1
    %1761 = comb.xor %1541, %true : i1
    %1762 = comb.and %1761, %1301 : i1
    %1763 = comb.mux bin %1541, %c0_i44, %1258 : i44
    %1764 = comb.mux bin %1541, %c0_i9, %1193 : i9
    %1765 = comb.mux bin %1541, %c0_i9, %1197 : i9
    %1766 = comb.mux bin %1541, %c0_i9, %1201 : i9
    %1767 = comb.mux bin %1541, %c0_i2, %1526 : i2
    %1768 = comb.xor %1541, %true : i1
    %1769 = comb.and %1768, %1466 : i1
    %1770 = comb.xor %1541, %true : i1
    %1771 = comb.and %1770, %1370 : i1
    %1772 = comb.xor %1541, %true : i1
    %1773 = comb.and %1772, %1434 : i1
    %1774 = comb.xor %1541, %true : i1
    %1775 = comb.and %1774, %1402 : i1
    %1776 = comb.xor %1541, %true : i1
    %1777 = comb.and %1776, %1338 : i1
    %1778 = comb.xor %1541, %true : i1
    %1779 = comb.and %1778, %1304 : i1
    %1780 = comb.mux bin %1541, %c0_i44, %1260 : i44
    %1781 = comb.mux bin %1541, %c0_i9, %1207 : i9
    %1782 = comb.mux bin %1541, %c0_i9, %1211 : i9
    %1783 = comb.mux bin %1541, %c0_i9, %1215 : i9
    %1784 = comb.mux bin %1541, %c0_i2, %1530 : i2
    %1785 = comb.xor %1541, %true : i1
    %1786 = comb.and %1785, %1468 : i1
    %1787 = comb.xor %1541, %true : i1
    %1788 = comb.and %1787, %1372 : i1
    %1789 = comb.xor %1541, %true : i1
    %1790 = comb.and %1789, %1436 : i1
    %1791 = comb.xor %1541, %true : i1
    %1792 = comb.and %1791, %1404 : i1
    %1793 = comb.xor %1541, %true : i1
    %1794 = comb.and %1793, %1340 : i1
    %1795 = comb.xor %1541, %true : i1
    %1796 = comb.and %1795, %1307 : i1
    %1797 = comb.mux bin %1541, %c0_i44, %1262 : i44
    %1798 = comb.mux bin %1541, %c0_i9, %1221 : i9
    %1799 = comb.mux bin %1541, %c0_i9, %1225 : i9
    %1800 = comb.mux bin %1541, %c0_i9, %1229 : i9
    %1801 = comb.mux bin %1541, %c0_i2, %1534 : i2
    %1802 = comb.xor %1541, %true : i1
    %1803 = comb.and %1802, %1470 : i1
    %1804 = comb.xor %1541, %true : i1
    %1805 = comb.and %1804, %1374 : i1
    %1806 = comb.xor %1541, %true : i1
    %1807 = comb.and %1806, %1438 : i1
    %1808 = comb.xor %1541, %true : i1
    %1809 = comb.and %1808, %1406 : i1
    %1810 = comb.xor %1541, %true : i1
    %1811 = comb.and %1810, %1342 : i1
    %1812 = comb.xor %1541, %true : i1
    %1813 = comb.and %1812, %1310 : i1
    %1814 = comb.xor bin %memDel, %true {sv.namehint = "_memDel_T"} : i1
    %1815 = comb.icmp bin eq %io_memIO_pipelineReq_cpuReq_size, %c1_i3 : i3
    %1816 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 0 : (i64) -> i1
    %1817 = comb.and bin %1815, %1816 : i1
    %1818 = comb.icmp bin eq %io_memIO_pipelineReq_cpuReq_size, %c2_i3 : i3
    %1819 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 0 : (i64) -> i2
    %1820 = comb.icmp bin ne %1819, %c0_i2 : i2
    %1821 = comb.and bin %1818, %1820 : i1
    %1822 = comb.icmp bin eq %io_memIO_pipelineReq_cpuReq_size, %c3_i3 : i3
    %1823 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 0 : (i64) -> i3
    %1824 = comb.icmp bin ne %1823, %c0_i3 : i3
    %1825 = comb.and bin %1822, %1824 : i1
    %1826 = comb.or bin %1817, %1821, %1825 : i1
    %1827 = comb.and bin %io_memIO_pipelineReq_cpuReq_valid, %1826 : i1
    %1828 = comb.concat %c1_i2, %io_memIO_pipelineReq_cpuReq_rw, %false : i2, i1, i1
    %1829 = comb.and bin %32, %io_ifIO_pipelineReq_cpuReq_valid : i1
    %1830 = comb.extract %6 from 38 : (i64) -> i26
    %1831 = comb.icmp bin eq %1830, %c-1_i26 : i26
    %1832 = comb.icmp bin ne %1830, %c0_i26 : i26
    %1833 = hw.array_create %tlbEntries_15_u, %tlbEntries_14_u, %tlbEntries_13_u, %tlbEntries_12_u, %tlbEntries_11_u, %tlbEntries_10_u, %tlbEntries_9_u, %tlbEntries_8_u, %tlbEntries_7_u, %tlbEntries_6_u, %tlbEntries_5_u, %tlbEntries_4_u, %tlbEntries_3_u, %tlbEntries_2_u, %tlbEntries_1_u, %tlbEntries_0_u : i1
    %1834 = hw.array_get %1833[%50] : !hw.array<16xi1>, i4
    %1835 = comb.and bin %151, %1834 : i1
    %1836 = hw.array_get %1833[%51] : !hw.array<16xi1>, i4
    %1837 = comb.and bin %155, %1836 : i1
    %1838 = hw.array_get %1833[%52] : !hw.array<16xi1>, i4
    %1839 = comb.and bin %158, %1838 : i1
    %1840 = comb.concat %1839, %1837, %1835 : i1, i1, i1
    %1841 = comb.icmp bin ne %1840, %c0_i3 : i3
    %1842 = comb.xor bin %1841, %true : i1
    %1843 = comb.and bin %37, %1842 : i1
    %1844 = comb.and bin %38, %1841 : i1
    %1845 = hw.array_create %tlbEntries_15_x, %tlbEntries_14_x, %tlbEntries_13_x, %tlbEntries_12_x, %tlbEntries_11_x, %tlbEntries_10_x, %tlbEntries_9_x, %tlbEntries_8_x, %tlbEntries_7_x, %tlbEntries_6_x, %tlbEntries_5_x, %tlbEntries_4_x, %tlbEntries_3_x, %tlbEntries_2_x, %tlbEntries_1_x, %tlbEntries_0_x : i1
    %1846 = hw.array_get %1845[%50] : !hw.array<16xi1>, i4
    %1847 = comb.and bin %151, %1846 : i1
    %1848 = hw.array_get %1845[%51] : !hw.array<16xi1>, i4
    %1849 = comb.and bin %155, %1848 : i1
    %1850 = hw.array_get %1845[%52] : !hw.array<16xi1>, i4
    %1851 = comb.and bin %158, %1850 : i1
    %1852 = comb.concat %1851, %1849, %1847 : i1, i1, i1
    %1853 = comb.icmp bin eq %1852, %c0_i3 : i3
    %1854 = comb.or bin %1843, %1844, %1853 : i1
    %1855 = comb.and bin %160, %1854 : i1
    %1856 = comb.icmp bin eq %1831, %1832 : i1
    %1857 = comb.xor %1856, %true : i1
    %1858 = comb.or %1857, %1855 : i1
    %1859 = comb.and %1829, %1858 : i1
    %1860 = comb.xor %1856, %true : i1
    %1861 = comb.or %1860, %1855 : i1
    %1862 = comb.and %1829, %1861 : i1
    %1863 = comb.xor %1856, %true : i1
    %1864 = comb.or %1863, %1855 : i1
    %1865 = comb.and %1829, %1864 : i1
    %1866 = comb.mux bin %1865, %c-4_i4, %962 : i4
    %1867 = comb.xor %1856, %true : i1
    %1868 = comb.or %1867, %1855 : i1
    %1869 = comb.and %1829, %1868 : i1
    %1870 = comb.xor %1856, %true : i1
    %1871 = comb.or %1870, %1855 : i1
    %1872 = comb.and %1829, %1871 : i1
    %1873 = comb.xor %1855, %true : i1
    %1874 = comb.and %1856, %1873 : i1
    %1875 = comb.xor %1829, %true : i1
    %1876 = comb.or %1875, %1874 : i1
    %1877 = comb.xor %1855, %true : i1
    %1878 = comb.and %1856, %1877 : i1
    %1879 = comb.xor %1829, %true : i1
    %1880 = comb.or bin %1541, %1827 : i1
    %1881 = comb.or %1880, %1879, %1878 : i1
    %1882 = comb.and %1881, %2058 {sv.namehint = "io_icacheIO_cpuReq_valid"} : i1
    %1883 = comb.xor bin %2094, %true : i1
    %1884 = comb.icmp bin ne %stage, %c0_i2 : i2
    %1885 = comb.xor bin %1884, %true : i1
    %1886 = comb.and bin %1883, %1885 : i1
    %1887 = comb.xor %1886, %true : i1
    %1888 = comb.and bin %1829, %1856 : i1
    %1889 = comb.xor %1888, %true : i1
    %1890 = comb.or %1889, %160, %1887 : i1
    %1891 = comb.and %1890, %current : i1
    %1892 = comb.xor %1886, %true : i1
    %1893 = comb.xor %1888, %true : i1
    %1894 = comb.or %1893, %160, %1892 : i1
    %1895 = comb.xor %1886, %true : i1
    %1896 = comb.xor %1888, %true : i1
    %1897 = comb.or %1896, %160, %1895 : i1
    %1898 = comb.mux bin %1897, %vaddr_vpn_0, %8 : i9
    %1899 = comb.xor %1886, %true : i1
    %1900 = comb.xor %1888, %true : i1
    %1901 = comb.or %1900, %160, %1899 : i1
    %1902 = comb.mux bin %1901, %vaddr_vpn_1, %9 : i9
    %1903 = comb.xor %1886, %true : i1
    %1904 = comb.xor %1888, %true : i1
    %1905 = comb.or %1904, %160, %1903 : i1
    %1906 = comb.mux bin %1905, %vaddr_vpn_2, %10 : i9
    %1907 = comb.xor %1886, %true : i1
    %1908 = comb.xor %1888, %true : i1
    %1909 = comb.or %1908, %160, %1907 : i1
    %1910 = comb.and bin %36, %io_memIO_pipelineReq_cpuReq_valid, %1885 : i1
    %1911 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 38 : (i64) -> i26
    %1912 = comb.icmp bin eq %1911, %c-1_i26 : i26
    %1913 = comb.icmp bin ne %1911, %c0_i26 : i26
    %1914 = hw.array_get %1833[%102] : !hw.array<16xi1>, i4
    %1915 = comb.and bin %170, %1914 : i1
    %1916 = hw.array_get %1833[%103] : !hw.array<16xi1>, i4
    %1917 = comb.and bin %174, %1916 : i1
    %1918 = hw.array_get %1833[%104] : !hw.array<16xi1>, i4
    %1919 = comb.and bin %177, %1918 : i1
    %1920 = comb.concat %1919, %1917, %1915 : i1, i1, i1
    %1921 = comb.icmp bin ne %1920, %c0_i3 : i3
    %1922 = comb.xor bin %1921, %true : i1
    %1923 = comb.and bin %39, %1922 : i1
    %1924 = comb.and bin %40, %1921, %251 : i1
    %1925 = comb.or bin %1923, %1924 : i1
    %1926 = hw.array_create %tlbEntries_15_r, %tlbEntries_14_r, %tlbEntries_13_r, %tlbEntries_12_r, %tlbEntries_11_r, %tlbEntries_10_r, %tlbEntries_9_r, %tlbEntries_8_r, %tlbEntries_7_r, %tlbEntries_6_r, %tlbEntries_5_r, %tlbEntries_4_r, %tlbEntries_3_r, %tlbEntries_2_r, %tlbEntries_1_r, %tlbEntries_0_r : i1
    %1927 = hw.array_get %1926[%102] : !hw.array<16xi1>, i4
    %1928 = comb.and bin %170, %1927 : i1
    %1929 = hw.array_get %1926[%103] : !hw.array<16xi1>, i4
    %1930 = comb.and bin %174, %1929 : i1
    %1931 = hw.array_get %1926[%104] : !hw.array<16xi1>, i4
    %1932 = comb.and bin %177, %1931 : i1
    %1933 = comb.concat %1932, %1930, %1928 : i1, i1, i1
    %1934 = comb.icmp bin eq %1933, %c0_i3 : i3
    %1935 = comb.and bin %256, %1934 : i1
    %1936 = hw.array_create %tlbEntries_15_w, %tlbEntries_14_w, %tlbEntries_13_w, %tlbEntries_12_w, %tlbEntries_11_w, %tlbEntries_10_w, %tlbEntries_9_w, %tlbEntries_8_w, %tlbEntries_7_w, %tlbEntries_6_w, %tlbEntries_5_w, %tlbEntries_4_w, %tlbEntries_3_w, %tlbEntries_2_w, %tlbEntries_1_w, %tlbEntries_0_w : i1
    %1937 = hw.array_get %1936[%102] : !hw.array<16xi1>, i4
    %1938 = comb.and bin %170, %1937 : i1
    %1939 = hw.array_get %1936[%103] : !hw.array<16xi1>, i4
    %1940 = comb.and bin %174, %1939 : i1
    %1941 = hw.array_get %1936[%104] : !hw.array<16xi1>, i4
    %1942 = comb.and bin %177, %1941 : i1
    %1943 = comb.concat %1942, %1940, %1938 : i1, i1, i1
    %1944 = comb.icmp bin eq %1943, %c0_i3 : i3
    %1945 = comb.and bin %io_memIO_pipelineReq_cpuReq_rw, %1944 : i1
    %1946 = comb.or bin %1925, %1935, %1945 : i1
    %1947 = comb.and bin %179, %1946 : i1
    %1948 = comb.icmp bin eq %1912, %1913 : i1
    %1949 = comb.xor %1948, %true : i1
    %1950 = comb.or %1949, %1947 : i1
    %1951 = comb.and %1910, %1950 : i1
    %1952 = comb.or %1827, %1951, %1859 : i1
    %1953 = comb.xor %1541, %true : i1
    %1954 = comb.and %1953, %1952 : i1
    %1955 = comb.or %1954, %957, %162 : i1
    %1956 = comb.xor %1948, %true : i1
    %1957 = comb.or %1956, %1947 : i1
    %1958 = comb.and %1910, %1957 : i1
    %1959 = comb.or %1827, %1958, %1862 : i1
    %1960 = comb.xor %1541, %true : i1
    %1961 = comb.and %1960, %1959 : i1
    %1962 = comb.or %1961, %960, %164 : i1
    %1963 = comb.mux bin %1945, %c-1_i4, %1866 : i4
    %1964 = comb.mux bin %1935, %c-3_i4, %1963 : i4
    %1965 = comb.mux bin %1925, %239, %1964 : i4
    %1966 = comb.mux bin %179, %1965, %1866 : i4
    %1967 = comb.mux bin %1948, %1966, %239 : i4
    %1968 = comb.mux bin %1910, %1967, %1866 : i4
    %1969 = comb.mux bin %1827, %1828, %1968 : i4
    %1970 = comb.mux bin %1541, %962, %1969 : i4
    %1971 = comb.xor %1948, %true : i1
    %1972 = comb.or %1971, %1947 : i1
    %1973 = comb.and %1910, %1972 : i1
    %1974 = comb.or %1827, %1973, %1869 : i1
    %1975 = comb.xor %1541, %true : i1
    %1976 = comb.and %1975, %1974 : i1
    %1977 = comb.or %1976, %965, %ifExcpt : i1
    %1978 = comb.xor %1948, %true : i1
    %1979 = comb.or %1978, %1947 : i1
    %1980 = comb.and %1910, %1979 : i1
    %1981 = comb.or %1827, %1980, %1872 : i1
    %1982 = comb.xor %1541, %true : i1
    %1983 = comb.and %1982, %1981 : i1
    %1984 = comb.or %1983, %968 : i1
    %1985 = comb.mux bin %1984, %crossCache, %ifCrossCache : i1
    %1986 = comb.xor %1947, %true : i1
    %1987 = comb.and %1948, %1986 : i1
    %1988 = comb.xor %1910, %true : i1
    %1989 = comb.or %1988, %1987 : i1
    %1990 = comb.xor %1827, %true : i1
    %1991 = comb.and %1990, %1989, %1876 : i1
    %1992 = comb.or %1541, %1991 : i1
    %1993 = comb.and %1992, %971, %crossCache : i1
    %1994 = comb.xor %1948, %true : i1
    %1995 = comb.or %1994, %1947 : i1
    %1996 = comb.and %1910, %1995 : i1
    %1997 = comb.or %1827, %1996, %973 : i1
    %1998 = comb.mux bin %1541, %1814, %1997 : i1
    %1999 = comb.xor %1948, %true : i1
    %2000 = comb.or %1999, %1947 : i1
    %2001 = comb.and %1910, %2000 : i1
    %2002 = comb.or %1880, %2001, %975 : i1
    %2003 = comb.mux bin %1945, %c-1_i4, %977 : i4
    %2004 = comb.mux bin %1935, %c-3_i4, %2003 : i4
    %2005 = comb.mux bin %1925, %239, %2004 : i4
    %2006 = comb.mux bin %179, %2005, %977 : i4
    %2007 = comb.mux bin %1948, %2006, %239 : i4
    %2008 = comb.mux bin %1910, %2007, %977 : i4
    %2009 = comb.mux bin %1827, %1828, %2008 : i4
    %2010 = comb.xor %1948, %true : i1
    %2011 = comb.or %2010, %1947 : i1
    %2012 = comb.and %1910, %2011 : i1
    %2013 = comb.or %1827, %2012, %979 : i1
    %2014 = comb.xor %1541, %true : i1
    %2015 = comb.and %2014, %2013 : i1
    %2016 = comb.xor %1947, %true : i1
    %2017 = comb.and %1948, %2016 : i1
    %2018 = comb.xor %1910, %true : i1
    %2019 = comb.or %2018, %2017 : i1
    %2020 = comb.xor %1880, %true : i1
    %2021 = comb.and %2020, %2019, %2094 {sv.namehint = "io_dcacheIO_cpuReq_valid"} : i1
    %2022 = comb.xor %1946, %true : i1
    %2023 = comb.and %2022, %190 : i1
    %2024 = comb.xor %179, %true : i1
    %2025 = comb.or %2024, %2023 : i1
    %2026 = comb.and bin %1910, %1948, %2025 : i1
    %2027 = comb.or %2026, %1891 : i1
    %2028 = comb.mux bin %1880, %current, %2027 : i1
    %2029 = comb.xor %1894, %true : i1
    %2030 = comb.or %2026, %2029 : i1
    %2031 = comb.xor %2030, %true : i1
    %2032 = comb.or %1880, %2031 : i1
    %2033 = comb.mux bin %2032, %1540, %c1_i2 : i2
    %2034 = comb.mux bin %2026, %12, %1898 : i9
    %2035 = comb.mux bin %1880, %vaddr_vpn_0, %2034 : i9
    %2036 = comb.mux bin %2026, %13, %1902 : i9
    %2037 = comb.mux bin %1880, %vaddr_vpn_1, %2036 : i9
    %2038 = comb.mux bin %2026, %14, %1906 : i9
    %2039 = comb.mux bin %1880, %vaddr_vpn_2, %2038 : i9
    %2040 = comb.xor %1909, %true : i1
    %2041 = comb.or %2026, %2040 : i1
    %2042 = comb.xor %2041, %true : i1
    %2043 = comb.or %1880, %2042 : i1
    %2044 = comb.mux bin %2043, %951, %c-2_i2 : i2
    %2045 = comb.xor bin %ifDel, %true : i1
    %2046 = comb.xor bin %crossCache, %true : i1
    %2047 = comb.icmp bin eq %io_ifIO_pipelineReq_offset, %c-2_i4 : i4
    %2048 = comb.and bin %2045, %2046, %2090, %2047 : i1
    %2049 = comb.extract %io_icacheIO_cpuResult_data from 0 : (i32) -> i2
    %2050 = comb.icmp bin eq %2049, %c-1_i2 : i2
    %2051 = comb.and bin %2048, %2050 : i1
    %2052 = comb.or %2051, %1993 : i1
    %2053 = comb.xor %2051, %true : i1
    %2054 = comb.and %2053, %2090 {sv.namehint = "io_ifIO_pipelineResult_cpuResult_ready"} : i1
    %2055 = comb.or bin %2050, %162 : i1
    %2056 = comb.xor %2055, %true : i1
    %2057 = comb.and %2056, %io_ifIO_pipelineReq_cpuReq_valid : i1
    %2058 = comb.mux bin %2048, %2057, %166 {sv.namehint = "icacheValid"} : i1
    %2059 = comb.extract %6 from 4 {sv.namehint = "_crossAddrP_T_2"} : (i64) -> i35
    %2060 = comb.add bin %2059, %c1_i35 {sv.namehint = "_crossAddrP_T_3"} : i35
    %2061 = comb.mux bin %2051, %2060, %crossAddrP : i35
    %2062 = comb.extract %io_icacheIO_cpuResult_data from 0 {sv.namehint = "_partialInst_T"} : (i32) -> i16
    %2063 = comb.mux bin %2051, %2062, %partialInst : i16
    %2064 = comb.extract %io_icacheIO_cpuResult_data from 0 {sv.namehint = "_io_ifIO_pipelineResult_cpuResult_data_T"} : (i32) -> i16
    %2065 = comb.concat %2064, %partialInst {sv.namehint = "_io_ifIO_pipelineResult_cpuResult_data_T_1"} : i16, i16
    %2066 = comb.mux bin %crossCache, %2065, %io_icacheIO_cpuResult_data {sv.namehint = "io_ifIO_pipelineResult_cpuResult_data"} : i32
    %2067 = comb.and bin %crossCache, %2090 : i1
    %2068 = comb.and bin %ifDel, %ifExcpt : i1
    %2069 = comb.and bin %memDel, %memExcpt : i1
    %2070 = comb.xor bin %io_jmpBch, %true : i1
    %2071 = comb.or bin %2070, %1541 : i1
    %2072 = comb.and %2069, %2070 : i1
    %2073 = comb.or %2072, %1541 : i1
    %2074 = comb.mux bin %2073, %c0_i4, %2009 : i4
    %2075 = comb.xor %2071, %true : i1
    %2076 = comb.and %2075, %2013 : i1
    %2077 = comb.mux bin %2069, %2076, %2015 : i1
    %2078 = comb.mux bin %2069, %io_jmpBch, %1998 : i1
    %2079 = comb.and bin %io_jmpBch, %1884, %238, %32 {sv.namehint = "io_dcacheIO_cpuReq_revoke"} : i1
    %2080 = comb.mux bin %2079, %c0_i2, %2033 : i2
    %2081 = comb.or bin %2079, %2068 : i1
    %2082 = comb.xor %2081, %true : i1
    %2083 = comb.and %2082, %1955 : i1
    %2084 = comb.mux bin %2081, %c0_i4, %1970 : i4
    %2085 = comb.xor %2081, %true : i1
    %2086 = comb.and %2085, %1977 : i1
    %2087 = comb.xor %2079, %true : i1
    %2088 = comb.and %2087, %1962 : i1
    %2089 = comb.xor %2079, %true : i1
    %2090 = comb.and %2089, %42 {sv.namehint = "icacheReady"} : i1
    %2091 = comb.xor %2081, %true : i1
    %2092 = comb.and %2091, %1985 : i1
    %2093 = comb.xor %2079, %true : i1
    %2094 = comb.and %2093, %1537 {sv.namehint = "dcacheValid"} : i1
    %2095 = comb.or bin %io_jmpBch, %2067 : i1
    %2096 = comb.xor %2095, %true : i1
    %2097 = comb.and %2096, %2052 : i1
    %2098 = comb.concat %112, %111, %110 {sv.namehint = "_memAddr_T_7"} : i9, i9, i9
    %2099 = comb.icmp bin eq %109, %2098 {sv.namehint = "_memAddr_T_8"} : i27
    %2100 = comb.xor bin %116, %true {sv.namehint = "_memAddr_T_13"} : i1
    %2101 = comb.and bin %108, %2099, %2100 {sv.namehint = "_memAddr_WIRE_10_0"} : i1
    %2102 = comb.concat %121, %122 {sv.namehint = "_memAddr_T_77"} : i9, i9
    %2103 = comb.icmp bin eq %119, %2102 {sv.namehint = "_memAddr_T_78"} : i18
    %2104 = comb.icmp bin eq %125, %c1_i2 {sv.namehint = "_memAddr_T_83"} : i2
    %2105 = comb.and bin %120, %2103, %2104 {sv.namehint = "_memAddr_WIRE_21_1"} : i1
    %2106 = comb.icmp bin eq %14, %130 {sv.namehint = "_memAddr_T_142"} : i9
    %2107 = comb.icmp bin eq %132, %c-2_i2 {sv.namehint = "_memAddr_T_147"} : i2
    %2108 = comb.and bin %129, %2106, %2107 {sv.namehint = "_memAddr_WIRE_32_2"} : i1
    %2109 = comb.extract %105 from 13 : (i44) -> i7
    %2110 = comb.mux bin %2101, %2109, %c0_i7 {sv.namehint = "_memAddr_T_153"} : i7
    %2111 = comb.extract %106 from 13 : (i44) -> i7
    %2112 = comb.mux bin %2105, %2111, %c0_i7 {sv.namehint = "_memAddr_T_154"} : i7
    %2113 = comb.extract %107 from 18 : (i44) -> i2
    %2114 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 25 : (i64) -> i5
    %2115 = comb.concat %2113, %2114 : i2, i5
    %2116 = comb.mux bin %2108, %2115, %c0_i7 {sv.namehint = "_memAddr_T_155"} : i7
    %2117 = comb.or bin %2110, %2112, %2116 {sv.namehint = "_memAddr_T_157"} : i7
    %2118 = comb.extract %io_memIO_pipelineReq_cpuReq_addr from 25 : (i64) -> i7
    %2119 = comb.mux bin %36, %2117, %2118 {sv.namehint = "_memAddr_T_160"} : i7
    %2120 = comb.extract %2119 from 6 : (i7) -> i1
    %2121 = comb.xor bin %2120, %true {sv.namehint = "_io_memIO_pipelineResult_isMMIO_T"} : i1
    %2122 = comb.icmp bin ne %2119, %c0_i7 {sv.namehint = "_io_memIO_pipelineResult_isMMIO_T_1"} : i7
    %2123 = comb.and bin %2121, %2122 {sv.namehint = "io_memIO_pipelineResult_isMMIO"} : i1
    hw.output %43, %44, %2066, %2054, %46, %45, %48, %49, %io_dcacheIO_cpuResult_data, %1004, %2123, %101, %1882, %io_ifIO_pipelineReq_cpuReq_revoke, %994, %1000, %io_memIO_pipelineReq_cpuReq_size, %996, %998, %2021, %2079, %41 : i1, i4, i32, i1, i1, i1, i1, i4, i64, i1, i1, i32, i1, i1, i32, i64, i3, i1, i8, i1, i1, i1
  }
  hw.module private @Clint(in %clock : !seq.clock, in %reset : i1, in %io_clintIO_wen : i1, in %io_clintIO_addr : i2, out io_clintIO_rdata : i64, in %io_clintIO_wdata : i64, out io_mtime : i64, out io_mtip : i1, out io_msip : i1) {
    %c1_i64 = hw.constant 1 : i64
    %c1_i2 = hw.constant 1 : i2
    %c0_i63 = hw.constant 0 : i63
    %c0_i2 = hw.constant 0 : i2
    %false = hw.constant false
    %c0_i64 = hw.constant 0 : i64
    %c-2_i2 = hw.constant -2 : i2
    %msip = seq.firreg %11 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64, sv.namehint = "msip"} : i1
    %mtime = seq.firreg %4 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1 : ui64, sv.namehint = "mtime"} : i64
    %mtimecmp = seq.firreg %7 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 65 : ui64} : i64
    %0 = comb.icmp bin ugt %mtime, %mtimecmp {sv.namehint = "io_mtip"} : i64
    %1 = comb.add bin %mtime, %c1_i64 {sv.namehint = "_mtime_T"} : i64
    %2 = comb.icmp bin eq %io_clintIO_addr, %c0_i2 : i2
    %3 = comb.and bin %io_clintIO_wen, %2 : i1
    %4 = comb.mux bin %3, %io_clintIO_wdata, %1 : i64
    %5 = comb.icmp bin eq %io_clintIO_addr, %c1_i2 : i2
    %6 = comb.and bin %io_clintIO_wen, %5 : i1
    %7 = comb.mux bin %6, %io_clintIO_wdata, %mtimecmp : i64
    %8 = comb.icmp bin eq %io_clintIO_addr, %c-2_i2 : i2
    %9 = comb.extract %io_clintIO_wdata from 0 : (i64) -> i1
    %10 = comb.and bin %io_clintIO_wen, %8 : i1
    %11 = comb.mux bin %10, %9, %msip : i1
    %12 = comb.icmp bin eq %io_clintIO_addr, %c1_i2 {sv.namehint = "_io_clintIO_rdata_T"} : i2
    %13 = comb.mux bin %12, %mtimecmp, %mtime {sv.namehint = "_io_clintIO_rdata_T_1"} : i64
    %14 = comb.icmp bin eq %io_clintIO_addr, %c-2_i2 {sv.namehint = "_io_clintIO_rdata_T_2"} : i2
    %15 = comb.concat %c0_i63, %msip : i63, i1
    %16 = comb.mux bin %14, %15, %13 {sv.namehint = "io_clintIO_rdata"} : i64
    hw.output %16, %mtime, %0, %msip : i64, i64, i1, i1
  }
  hw.module private @SimplePlic(in %clock : !seq.clock, in %reset : i1, in %io_plicIO_wen : i1, in %io_plicIO_addr : i26, out io_plicIO_rdata : i32, in %io_plicIO_wdata : i32, in %io_int : i1, out io_meip : i1, out io_seip : i1) {
    %c8319_i26 = hw.constant 8319 : i26
    %c0_i13 = hw.constant 0 : i13
    %c0_i14 = hw.constant 0 : i14
    %c1_i32 = hw.constant 1 : i32
    %c0_i22 = hw.constant 0 : i22
    %c0_i2 = hw.constant 0 : i2
    %c0_i4 = hw.constant 0 : i4
    %c0_i8 = hw.constant 0 : i8
    %c0_i16 = hw.constant 0 : i16
    %c0_i27 = hw.constant 0 : i27
    %false = hw.constant false
    %c0_i32 = hw.constant 0 : i32
    %c0_i10 = hw.constant 0 : i10
    %true = hw.constant true
    %c4096_i26 = hw.constant 4096 : i26
    %c8192_i26 = hw.constant 8192 : i26
    %c8320_i26 = hw.constant 8320 : i26
    %c8448_i26 = hw.constant 8448 : i26
    %c2097152_i26 = hw.constant 2097152 : i26
    %c2101248_i26 = hw.constant 2101248 : i26
    %c2097156_i26 = hw.constant 2097156 : i26
    %c2101252_i26 = hw.constant 2101252 : i26
    %used = seq.firreg %108 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64} : i1
    %priority = seq.firreg %12 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1 : ui64} : i32
    %source = seq.firreg %88 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 33 : ui64} : i10
    %m_enable = seq.firreg %30 clock %clock reset sync %reset, %false {firrtl.random_init_start = 43 : ui64} : i1
    %s_enable = seq.firreg %65 clock %clock reset sync %reset, %false {firrtl.random_init_start = 44 : ui64} : i1
    %m_threshold = seq.firreg %97 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 45 : ui64} : i32
    %s_threshold = seq.firreg %101 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 77 : ui64} : i32
    %interrupt = seq.firreg %io_int clock %clock reset sync %reset, %false {firrtl.random_init_start = 109 : ui64} : i1
    %0 = comb.icmp bin ugt %priority, %m_threshold {sv.namehint = "_io_meip_T"} : i32
    %1 = comb.and bin %m_enable, %0 {sv.namehint = "_io_meip_T_1"} : i1
    %2 = comb.xor %used, %true : i1
    %3 = comb.or %2, %1 {sv.namehint = "_io_meip_T_2"} : i1
    %4 = comb.and bin %3, %interrupt {sv.namehint = "io_meip"} : i1
    %5 = comb.icmp bin ugt %priority, %s_threshold {sv.namehint = "_io_seip_T"} : i32
    %6 = comb.and bin %s_enable, %5 {sv.namehint = "_io_seip_T_1"} : i1
    %7 = comb.xor %used, %true : i1
    %8 = comb.or %7, %6 {sv.namehint = "_io_seip_T_2"} : i1
    %9 = comb.and bin %8, %interrupt {sv.namehint = "io_seip"} : i1
    %10 = comb.icmp bin ult %io_plicIO_addr, %c4096_i26 : i26
    %11 = comb.and bin %10, %io_plicIO_wen : i1
    %12 = comb.mux bin %11, %io_plicIO_wdata, %priority : i32
    %13 = comb.mux bin %10, %priority, %c0_i32 : i32
    %14 = comb.extract %io_plicIO_addr from 12 : (i26) -> i14
    %15 = comb.icmp bin ne %14, %c0_i14 : i14
    %16 = comb.icmp bin ult %io_plicIO_addr, %c8192_i26 : i26
    %17 = comb.and bin %15, %16 : i1
    %18 = comb.extract %source from 0 {sv.namehint = "_io_plicIO_rdata_T"} : (i10) -> i5
    %19 = comb.concat %c0_i27, %18 : i27, i5
    %20 = comb.shl bin %c1_i32, %19 {sv.namehint = "_io_plicIO_rdata_T_1"} : i32
    %21 = comb.replicate %interrupt {sv.namehint = "_io_plicIO_rdata_T_2"} : (i1) -> i32
    %22 = comb.and bin %20, %21 {sv.namehint = "_io_plicIO_rdata_T_3"} : i32
    %23 = comb.mux bin %17, %22, %13 : i32
    %24 = comb.extract %io_plicIO_addr from 13 : (i26) -> i13
    %25 = comb.icmp bin ne %24, %c0_i13 : i13
    %26 = comb.icmp bin ult %io_plicIO_addr, %c8320_i26 : i26
    %27 = comb.and bin %25, %26 : i1
    %28 = comb.icmp bin ne %io_plicIO_wdata, %c0_i32 {sv.namehint = "_m_enable_T"} : i32
    %29 = comb.and bin %27, %io_plicIO_wen : i1
    %30 = comb.mux bin %29, %28, %m_enable : i1
    %31 = comb.extract %io_plicIO_addr from 2 {sv.namehint = "_source_T"} : (i26) -> i5
    %32 = comb.extract %io_plicIO_wdata from 16 {sv.namehint = "source_hi"} : (i32) -> i16
    %33 = comb.icmp bin ne %32, %c0_i16 {sv.namehint = "_source_T_1"} : i16
    %34 = comb.extract %io_plicIO_wdata from 17 : (i32) -> i15
    %35 = comb.extract %io_plicIO_wdata from 1 : (i32) -> i15
    %36 = comb.or bin %34, %35 {sv.namehint = "_source_T_2"} : i15
    %37 = comb.extract %36 from 7 {sv.namehint = "source_hi_1"} : (i15) -> i8
    %38 = comb.icmp bin ne %37, %c0_i8 {sv.namehint = "_source_T_3"} : i8
    %39 = comb.extract %36 from 8 : (i15) -> i7
    %40 = comb.extract %36 from 0 : (i15) -> i7
    %41 = comb.or bin %39, %40 {sv.namehint = "_source_T_4"} : i7
    %42 = comb.extract %41 from 3 {sv.namehint = "source_hi_2"} : (i7) -> i4
    %43 = comb.icmp bin ne %42, %c0_i4 {sv.namehint = "_source_T_5"} : i4
    %44 = comb.extract %41 from 4 : (i7) -> i3
    %45 = comb.extract %41 from 0 : (i7) -> i3
    %46 = comb.or bin %44, %45 {sv.namehint = "_source_T_6"} : i3
    %47 = comb.extract %46 from 1 {sv.namehint = "source_hi_3"} : (i3) -> i2
    %48 = comb.icmp bin ne %47, %c0_i2 {sv.namehint = "_source_T_7"} : i2
    %49 = comb.extract %46 from 2 : (i3) -> i1
    %50 = comb.extract %46 from 0 : (i3) -> i1
    %51 = comb.or bin %49, %50 {sv.namehint = "_source_T_8"} : i1
    %52 = comb.concat %31, %33, %38, %43, %48, %51 {sv.namehint = "_source_T_14"} : i5, i1, i1, i1, i1, i1
    %53 = comb.mux bin %29, %52, %source : i10
    %54 = comb.extract %source from 0 {sv.namehint = "_io_plicIO_rdata_T_4"} : (i10) -> i5
    %55 = comb.concat %c0_i27, %54 : i27, i5
    %56 = comb.shl bin %c1_i32, %55 {sv.namehint = "_io_plicIO_rdata_T_5"} : i32
    %57 = comb.replicate %m_enable {sv.namehint = "_io_plicIO_rdata_T_6"} : (i1) -> i32
    %58 = comb.and bin %56, %57 {sv.namehint = "_io_plicIO_rdata_T_7"} : i32
    %59 = comb.mux bin %27, %58, %23 : i32
    %60 = comb.icmp bin ugt %io_plicIO_addr, %c8319_i26 : i26
    %61 = comb.icmp bin ult %io_plicIO_addr, %c8448_i26 : i26
    %62 = comb.and bin %60, %61 : i1
    %63 = comb.icmp bin ne %io_plicIO_wdata, %c0_i32 {sv.namehint = "_s_enable_T"} : i32
    %64 = comb.and bin %62, %io_plicIO_wen : i1
    %65 = comb.mux bin %64, %63, %s_enable : i1
    %66 = comb.extract %io_plicIO_addr from 2 {sv.namehint = "_source_T_15"} : (i26) -> i5
    %67 = comb.extract %io_plicIO_wdata from 16 {sv.namehint = "source_hi_4"} : (i32) -> i16
    %68 = comb.icmp bin ne %67, %c0_i16 {sv.namehint = "_source_T_16"} : i16
    %69 = comb.extract %io_plicIO_wdata from 17 : (i32) -> i15
    %70 = comb.extract %io_plicIO_wdata from 1 : (i32) -> i15
    %71 = comb.or bin %69, %70 {sv.namehint = "_source_T_17"} : i15
    %72 = comb.extract %71 from 7 {sv.namehint = "source_hi_5"} : (i15) -> i8
    %73 = comb.icmp bin ne %72, %c0_i8 {sv.namehint = "_source_T_18"} : i8
    %74 = comb.extract %71 from 8 : (i15) -> i7
    %75 = comb.extract %71 from 0 : (i15) -> i7
    %76 = comb.or bin %74, %75 {sv.namehint = "_source_T_19"} : i7
    %77 = comb.extract %76 from 3 {sv.namehint = "source_hi_6"} : (i7) -> i4
    %78 = comb.icmp bin ne %77, %c0_i4 {sv.namehint = "_source_T_20"} : i4
    %79 = comb.extract %76 from 4 : (i7) -> i3
    %80 = comb.extract %76 from 0 : (i7) -> i3
    %81 = comb.or bin %79, %80 {sv.namehint = "_source_T_21"} : i3
    %82 = comb.extract %81 from 1 {sv.namehint = "source_hi_7"} : (i3) -> i2
    %83 = comb.icmp bin ne %82, %c0_i2 {sv.namehint = "_source_T_22"} : i2
    %84 = comb.extract %81 from 2 : (i3) -> i1
    %85 = comb.extract %81 from 0 : (i3) -> i1
    %86 = comb.or bin %84, %85 {sv.namehint = "_source_T_23"} : i1
    %87 = comb.concat %66, %68, %73, %78, %83, %86 {sv.namehint = "_source_T_29"} : i5, i1, i1, i1, i1, i1
    %88 = comb.mux bin %64, %87, %53 : i10
    %89 = comb.extract %source from 0 {sv.namehint = "_io_plicIO_rdata_T_8"} : (i10) -> i5
    %90 = comb.concat %c0_i27, %89 : i27, i5
    %91 = comb.shl bin %c1_i32, %90 {sv.namehint = "_io_plicIO_rdata_T_9"} : i32
    %92 = comb.replicate %s_enable {sv.namehint = "_io_plicIO_rdata_T_10"} : (i1) -> i32
    %93 = comb.and bin %91, %92 {sv.namehint = "_io_plicIO_rdata_T_11"} : i32
    %94 = comb.mux bin %62, %93, %59 : i32
    %95 = comb.icmp bin eq %io_plicIO_addr, %c2097152_i26 : i26
    %96 = comb.and bin %95, %io_plicIO_wen : i1
    %97 = comb.mux bin %96, %io_plicIO_wdata, %m_threshold : i32
    %98 = comb.mux bin %95, %m_threshold, %94 : i32
    %99 = comb.icmp bin eq %io_plicIO_addr, %c2101248_i26 : i26
    %100 = comb.and bin %99, %io_plicIO_wen : i1
    %101 = comb.mux bin %100, %io_plicIO_wdata, %s_threshold : i32
    %102 = comb.mux bin %99, %s_threshold, %98 : i32
    %103 = comb.icmp bin eq %io_plicIO_addr, %c2097156_i26 : i26
    %104 = comb.icmp bin eq %io_plicIO_addr, %c2101252_i26 : i26
    %105 = comb.or bin %103, %104 : i1
    %106 = comb.concat %c0_i22, %source : i22, i10
    %107 = comb.mux bin %105, %106, %102 {sv.namehint = "io_plicIO_rdata"} : i32
    %108 = comb.or %io_plicIO_wen, %used : i1
    hw.output %107, %4, %9 : i32, i1, i1
  }
  hw.module private @IF(in %clock : !seq.clock, in %reset : i1, out io_immu_pipelineReq_cpuReq_addr : i64, out io_immu_pipelineReq_cpuReq_valid : i1, out io_immu_pipelineReq_cpuReq_revoke : i1, out io_immu_pipelineReq_offset : i4, in %io_immu_pipelineResult_exception : i1, in %io_immu_pipelineResult_cause : i4, in %io_immu_pipelineResult_cpuResult_data : i32, in %io_immu_pipelineResult_cpuResult_ready : i1, in %io_immu_pipelineResult_fromMem : i1, in %io_immu_pipelineResult_crossCache : i1, out io_nextVR_VALID : i1, in %io_nextVR_READY : i1, out io_output_instr : i32, out io_output_instrCode : i7, out io_output_rs_0 : i5, out io_output_rs_1 : i5, out io_output_rd : i5, out io_output_pc : i64, out io_output_except : i1, out io_output_cause : i4, out io_output_crossCache : i1, in %io_jmpBch : i1, in %io_jbAddr : i64, in %io_isPriv : i1, in %io_isSatp : i1) {
    %c0_i61 = hw.constant 0 : i61
    %c9_i7 = hw.constant 9 : i7
    %c256_i12 = hw.constant 256 : i12
    %c768_i12 = hw.constant 768 : i12
    %c384_i12 = hw.constant 384 : i12
    %c-1_i2 = hw.constant -1 : i2
    %c0_i8 = hw.constant 0 : i8
    %c19_i32 = hw.constant 19 : i32
    %c19_i7 = hw.constant 19 : i7
    %c2147483648_i64 = hw.constant 2147483648 : i64
    %c0_i4 = hw.constant 0 : i4
    %c-13_i7 = hw.constant -13 : i7
    %true = hw.constant true
    %c-4_i3 = hw.constant -4 : i3
    %c0_i5 = hw.constant 0 : i5
    %false = hw.constant false
    %c2_i3 = hw.constant 2 : i3
    %instr = seq.firreg %47 clock %clock reset sync %reset, %c19_i32 {firrtl.random_init_start = 0 : ui64, sv.namehint = "instr"} : i32
    %instrCode = seq.firreg %49 clock %clock reset sync %reset, %c19_i7 {firrtl.random_init_start = 32 : ui64, sv.namehint = "instrCode"} : i7
    %rs_0 = seq.firreg %51 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 39 : ui64, sv.namehint = "rs_0"} : i5
    %rs_1 = seq.firreg %53 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 44 : ui64, sv.namehint = "rs_1"} : i5
    %rd = seq.firreg %55 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 49 : ui64, sv.namehint = "rd"} : i5
    %regPC = seq.firreg %68 clock %clock reset sync %reset, %c2147483648_i64 {firrtl.random_init_start = 54 : ui64} : i64
    %pc = seq.firreg %65 clock %clock reset sync %reset, %c2147483648_i64 {firrtl.random_init_start = 118 : ui64, sv.namehint = "pc"} : i64
    %NVALID = seq.firreg %58 clock %clock reset sync %reset, %false {firrtl.random_init_start = 182 : ui64, sv.namehint = "NVALID"} : i1
    %except = seq.firreg %60 clock %clock reset sync %reset, %false {firrtl.random_init_start = 183 : ui64, sv.namehint = "except"} : i1
    %memExcept = seq.firreg %61 clock %clock reset sync %reset, %false {firrtl.random_init_start = 184 : ui64} : i1
    %cause = seq.firreg %63 clock %clock reset sync %reset, %c0_i4 {firrtl.random_init_start = 185 : ui64, sv.namehint = "cause"} : i4
    %crossCache = seq.firreg %41 clock %clock reset sync %reset, %false {firrtl.random_init_start = 189 : ui64, sv.namehint = "crossCache"} : i1
    %pause = seq.firreg %45 clock %clock reset sync %reset, %false {firrtl.random_init_start = 190 : ui64, sv.namehint = "pause"} : i1
    %0 = comb.extract %io_immu_pipelineResult_cpuResult_data from 0 {sv.namehint = "_instrCode_T"} : (i32) -> i7
    %1 = comb.icmp bin eq %0, %c-13_i7 {sv.namehint = "_wirePause_T_1"} : i7
    %2 = comb.extract %io_immu_pipelineResult_cpuResult_data from 20 {sv.namehint = "_wirePause_T_10"} : (i32) -> i12
    %3 = comb.icmp bin eq %2, %c384_i12 {sv.namehint = "_wirePause_T_4"} : i12
    %4 = comb.icmp bin eq %2, %c768_i12 {sv.namehint = "_wirePause_T_8"} : i12
    %5 = comb.icmp bin eq %2, %c256_i12 {sv.namehint = "_wirePause_T_12"} : i12
    %6 = comb.extract %io_immu_pipelineResult_cpuResult_data from 25 {sv.namehint = "_wirePause_T_14"} : (i32) -> i7
    %7 = comb.icmp bin eq %6, %c9_i7 {sv.namehint = "_wirePause_T_16"} : i7
    %8 = comb.extract %io_immu_pipelineResult_cpuResult_data from 7 {sv.namehint = "_wirePause_T_17"} : (i32) -> i8
    %9 = comb.icmp bin eq %8, %c0_i8 {sv.namehint = "_wirePause_T_18"} : i8
    %10 = comb.and bin %7, %9 {sv.namehint = "_wirePause_T_19"} : i1
    %11 = comb.or bin %3, %4, %5, %10 {sv.namehint = "_wirePause_T_20"} : i1
    %12 = comb.and bin %1, %11 {sv.namehint = "wirePause"} : i1
    %13 = comb.xor bin %pause, %true {sv.namehint = "_io_immu_pipelineReq_cpuReq_valid_T"} : i1
    %14 = comb.xor bin %io_isPriv, %true {sv.namehint = "_io_immu_pipelineReq_cpuReq_valid_T_2"} : i1
    %15 = comb.xor bin %io_isSatp, %true {sv.namehint = "_io_immu_pipelineReq_cpuReq_valid_T_4"} : i1
    %16 = comb.and bin %NVALID, %memExcept {sv.namehint = "_io_immu_pipelineReq_cpuReq_valid_T_6"} : i1
    %17 = comb.xor bin %16, %true {sv.namehint = "_io_immu_pipelineReq_cpuReq_valid_T_7"} : i1
    %18 = comb.and bin %io_nextVR_READY, %13, %14, %15, %17 {sv.namehint = "io_immu_pipelineReq_cpuReq_valid"} : i1
    %19 = comb.extract %regPC from 0 {sv.namehint = "io_immu_pipelineReq_offset"} : (i64) -> i4
    %20 = comb.xor bin %NVALID, %true {sv.namehint = "_reqNext_T"} : i1
    %21 = comb.or bin %20, %io_nextVR_READY {sv.namehint = "_reqNext_T_1"} : i1
    %22 = comb.and bin %io_immu_pipelineResult_cpuResult_ready, %21 {sv.namehint = "reqNext"} : i1
    %23 = comb.extract %io_immu_pipelineResult_cpuResult_data from 15 {sv.namehint = "_rs_0_T"} : (i32) -> i5
    %24 = comb.extract %io_immu_pipelineResult_cpuResult_data from 20 {sv.namehint = "_rs_1_T"} : (i32) -> i5
    %25 = comb.extract %io_immu_pipelineResult_cpuResult_data from 7 {sv.namehint = "_rd_T"} : (i32) -> i5
    %26 = comb.mux bin %22, %regPC, %pc : i64
    %27 = comb.extract %io_immu_pipelineResult_cpuResult_data from 0 {sv.namehint = "_regPC_T"} : (i32) -> i2
    %28 = comb.icmp bin eq %27, %c-1_i2 {sv.namehint = "_wirePC_T_3"} : i2
    %29 = comb.mux bin %28, %c-4_i3, %c2_i3 {sv.namehint = "_wirePC_T_4"} : i3
    %30 = comb.concat %c0_i61, %29 : i61, i3
    %31 = comb.add bin %regPC, %30 {sv.namehint = "_wirePC_T_5"} : i64
    %32 = comb.mux bin %22, %31, %regPC : i64
    %33 = comb.icmp bin eq %27, %c-1_i2 {sv.namehint = "_regPC_T_3"} : i2
    %34 = comb.mux bin %33, %c-4_i3, %c2_i3 {sv.namehint = "_regPC_T_4"} : i3
    %35 = comb.concat %c0_i61, %34 : i61, i3
    %36 = comb.add bin %regPC, %35 {sv.namehint = "_regPC_T_5"} : i64
    %37 = comb.mux bin %22, %36, %regPC : i64
    %38 = comb.mux bin %22, %io_immu_pipelineResult_exception, %except : i1
    %39 = comb.xor %22, %true : i1
    %40 = comb.and %39, %memExcept : i1
    %41 = comb.mux bin %22, %io_immu_pipelineResult_crossCache, %crossCache : i1
    %42 = comb.and bin %io_nextVR_READY, %NVALID : i1
    %43 = comb.xor %42, %true : i1
    %44 = comb.and %43, %pause : i1
    %45 = comb.mux bin %22, %12, %44 : i1
    %46 = comb.mux bin %42, %c19_i32, %instr : i32
    %47 = comb.mux bin %22, %io_immu_pipelineResult_cpuResult_data, %46 : i32
    %48 = comb.mux bin %42, %c19_i7, %instrCode : i7
    %49 = comb.mux bin %22, %0, %48 : i7
    %50 = comb.mux bin %42, %c0_i5, %rs_0 : i5
    %51 = comb.mux bin %22, %23, %50 : i5
    %52 = comb.mux bin %42, %c0_i5, %rs_1 : i5
    %53 = comb.mux bin %22, %24, %52 : i5
    %54 = comb.mux bin %42, %c0_i5, %rd : i5
    %55 = comb.mux bin %22, %25, %54 : i5
    %56 = comb.xor %42, %true : i1
    %57 = comb.and %56, %NVALID : i1
    %58 = comb.or %22, %57 : i1
    %59 = comb.and bin %io_immu_pipelineResult_cpuResult_ready, %io_immu_pipelineResult_exception, %io_immu_pipelineResult_fromMem : i1
    %60 = comb.or %59, %38 : i1
    %61 = comb.or %59, %40 : i1
    %62 = comb.or bin %59, %22 : i1
    %63 = comb.mux bin %62, %io_immu_pipelineResult_cause, %cause : i4
    %64 = comb.and bin %59, %io_jmpBch : i1
    %65 = comb.mux bin %64, %io_jbAddr, %26 : i64
    %66 = comb.icmp bin ne %regPC, %io_jbAddr : i64
    %67 = comb.and bin %io_jmpBch, %66 : i1
    %68 = comb.mux bin %67, %io_jbAddr, %37 : i64
    %69 = comb.mux bin %67, %io_jbAddr, %32 {sv.namehint = "wirePC"} : i64
    hw.output %69, %18, %pause, %19, %NVALID, %instr, %instrCode, %rs_0, %rs_1, %rd, %pc, %except, %cause, %crossCache : i64, i1, i1, i4, i1, i32, i7, i5, i5, i5, i64, i1, i4, i1
  }
  hw.module private @RVID(in %clock : !seq.clock, in %reset : i1, out io_output_rd : i5, out io_output_isWcsr : i1, out io_output_wcsr_0 : i12, out io_output_wcsr_1 : i12, out io_output_wcsr_2 : i12, out io_output_wcsr_3 : i12, out io_output_num_0 : i64, out io_output_num_1 : i64, out io_output_num_2 : i64, out io_output_num_3 : i64, out io_output_op1_2 : i31, out io_output_op1_3 : i31, out io_output_special : i5, out io_output_retire : i1, out io_output_priv : i2, out io_output_isPriv : i1, out io_output_isSatp : i1, out io_output_memExpt : i1, out io_output_cause : i4, out io_output_pc : i64, out io_output_debug_rcsr : i12, out io_output_debug_intr : i1, out io_output_debug_rvc : i1, out io_gprsR_raddr_0 : i5, out io_gprsR_raddr_1 : i5, out io_gprsR_raddr_2 : i5, in %io_gprsR_rdata_0 : i64, in %io_gprsR_rdata_1 : i64, in %io_gprsR_rdata_2 : i64, out io_csrsR_0_rcsr : i12, in %io_csrsR_0_rdata : i64, in %io_csrsR_1_rdata : i64, in %io_csrsR_2_rdata : i64, in %io_csrsR_3_rdata : i64, in %io_csrsR_4_rdata : i64, in %io_csrsR_5_rdata : i64, in %io_csrsR_6_rdata : i64, in %io_csrsR_7_rdata : i64, in %io_csrsR_8_rdata : i64, in %io_csrsR_9_rdata : i64, in %io_lastVR_VALID : i1, out io_lastVR_READY : i1, out io_nextVR_VALID : i1, in %io_nextVR_READY : i1, in %io_input_instr : i32, in %io_input_instrCode : i7, in %io_input_rs_0 : i5, in %io_input_rs_1 : i5, in %io_input_rd : i5, in %io_input_pc : i64, in %io_input_except : i1, in %io_input_cause : i4, in %io_input_crossCache : i1, out io_jmpBch : i1, out io_jbAddr : i64, in %io_isWait : i1, in %io_currentPriv : i2, out io_isAmo : i1, in %io_mtip : i1, in %io_msip : i1, in %io_revAmo : i1) {
    %c0_i61 = hw.constant 0 : i61
    %c0_i58 = hw.constant 0 : i58
    %c-3_i4 = hw.constant -3 : i4
    %c-4_i4 = hw.constant -4 : i4
    %c6_i4 = hw.constant 6 : i4
    %c2_i4 = hw.constant 2 : i4
    %c128_i28 = hw.constant 128 : i28
    %c64_i28 = hw.constant 64 : i28
    %c0_i63 = hw.constant 0 : i63
    %c1024_i16 = hw.constant 1024 : i16
    %c8_i16 = hw.constant 8 : i16
    %c4096_i16 = hw.constant 4096 : i16
    %c4_i16 = hw.constant 4 : i16
    %c32_i16 = hw.constant 32 : i16
    %c128_i16 = hw.constant 128 : i16
    %c256_i16 = hw.constant 256 : i16
    %c1_i16 = hw.constant 1 : i16
    %c2_i16 = hw.constant 2 : i16
    %c16_i16 = hw.constant 16 : i16
    %c8192_i16 = hw.constant 8192 : i16
    %c512_i16 = hw.constant 512 : i16
    %c-32768_i16 = hw.constant -32768 : i16
    %c16384_i16 = hw.constant 16384 : i16
    %c-1024_i11 = hw.constant -1024 : i11
    %c512_i11 = hw.constant 512 : i11
    %c256_i11 = hw.constant 256 : i11
    %c-64_i7 = hw.constant -64 : i7
    %c128_i11 = hw.constant 128 : i11
    %c64_i11 = hw.constant 64 : i11
    %c32_i7 = hw.constant 32 : i7
    %c32_i11 = hw.constant 32 : i11
    %c4_i7 = hw.constant 4 : i7
    %c4_i11 = hw.constant 4 : i11
    %c2_i11 = hw.constant 2 : i11
    %c1_i64 = hw.constant 1 : i64
    %c384_i12 = hw.constant 384 : i12
    %c29_i7 = hw.constant 29 : i7
    %c2_i7 = hw.constant 2 : i7
    %c0_i28 = hw.constant 0 : i28
    %c0_i16 = hw.constant 0 : i16
    %c0_i10 = hw.constant 0 : i10
    %c0_i21 = hw.constant 0 : i21
    %c0_i29 = hw.constant 0 : i29
    %c0_i27 = hw.constant 0 : i27
    %c-1_i17 = hw.constant -1 : i17
    %c-1_i16 = hw.constant -1 : i16
    %c0_i6 = hw.constant 0 : i6
    %c0_i13 = hw.constant 0 : i13
    %c0_i8 = hw.constant 0 : i8
    %c0_i24 = hw.constant 0 : i24
    %c0_i14 = hw.constant 0 : i14
    %c0_i30 = hw.constant 0 : i30
    %c0_i36 = hw.constant 0 : i36
    %c0_i23 = hw.constant 0 : i23
    %c-1_i22 = hw.constant -1 : i22
    %c-1_i19 = hw.constant -1 : i19
    %c-1_i11 = hw.constant -1 : i11
    %c-1_i14 = hw.constant -1 : i14
    %c-1_i31 = hw.constant -1 : i31
    %c-1_i10 = hw.constant -1 : i10
    %c-1_i13 = hw.constant -1 : i13
    %c-1_i15 = hw.constant -1 : i15
    %c-1_i6 = hw.constant -1 : i6
    %c-1_i9 = hw.constant -1 : i9
    %c-1_i8 = hw.constant -1 : i8
    %c-1_i7 = hw.constant -1 : i7
    %c-1_i3 = hw.constant -1 : i3
    %c0_i5 = hw.constant 0 : i5
    %c0_i31 = hw.constant 0 : i31
    %c0_i32 = hw.constant 0 : i32
    %c-1_i2 = hw.constant -1 : i2
    %c0_i4 = hw.constant 0 : i4
    %true = hw.constant true
    %c-4_i3 = hw.constant -4 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c-2_i2 = hw.constant -2 : i2
    %c-191_i9 = hw.constant -191 : i9
    %c-25_i7 = hw.constant -25 : i7
    %c-1_i32 = hw.constant -1 : i32
    %c0_i12 = hw.constant 0 : i12
    %c0_i59 = hw.constant 0 : i59
    %c0_i54 = hw.constant 0 : i54
    %c0_i2 = hw.constant 0 : i2
    %c0_i56 = hw.constant 0 : i56
    %c0_i55 = hw.constant 0 : i55
    %c-1_i5 = hw.constant -1 : i5
    %c-17_i7 = hw.constant -17 : i7
    %c-29_i7 = hw.constant -29 : i7
    %c-13_i7 = hw.constant -13 : i7
    %c6_i5 = hw.constant 6 : i5
    %c4_i5 = hw.constant 4 : i5
    %c11_i5 = hw.constant 11 : i5
    %c12_i5 = hw.constant 12 : i5
    %c-28670_i16 = hw.constant -28670 : i16
    %c14_i5 = hw.constant 14 : i5
    %c7_i5 = hw.constant 7 : i5
    %c13_i5 = hw.constant 13 : i5
    %c-16_i5 = hw.constant -16 : i5
    %c15_i5 = hw.constant 15 : i5
    %c1_i5 = hw.constant 1 : i5
    %c2_i5 = hw.constant 2 : i5
    %c8_i5 = hw.constant 8 : i5
    %c-1_i4 = hw.constant -1 : i4
    %c-8_i4 = hw.constant -8 : i4
    %c-7_i4 = hw.constant -7 : i4
    %c-5_i4 = hw.constant -5 : i4
    %c-63_i7 = hw.constant -63 : i7
    %c-190_i9 = hw.constant -190 : i9
    %c-62_i7 = hw.constant -62 : i7
    %c-189_i9 = hw.constant -189 : i9
    %c-61_i7 = hw.constant -61 : i7
    %c0_i64 = hw.constant 0 : i64
    %c768_i12 = hw.constant 768 : i12
    %c-1_i12 = hw.constant -1 : i12
    %false = hw.constant false
    %c0_i3 = hw.constant 0 : i3
    %c0_i7 = hw.constant 0 : i7
    %c2_i64 = hw.constant 2 : i64
    %c4_i4 = hw.constant 4 : i4
    %c5_i4 = hw.constant 5 : i4
    %c1_i4 = hw.constant 1 : i4
    %c7_i4 = hw.constant 7 : i4
    %c3_i4 = hw.constant 3 : i4
    %c13_i64 = hw.constant 13 : i64
    %c15_i64 = hw.constant 15 : i64
    %c4_i64 = hw.constant 4 : i64
    %c6_i64 = hw.constant 6 : i64
    %c1_i2 = hw.constant 1 : i2
    %c-576460752303423488_i60 = hw.constant -576460752303423488 : i60
    %c3_i64 = hw.constant 3 : i64
    %c8_i64 = hw.constant 8 : i64
    %c9_i64 = hw.constant 9 : i64
    %c11_i64 = hw.constant 11 : i64
    %c12_i64 = hw.constant 12 : i64
    %c0_i9 = hw.constant 0 : i9
    %c2_i3 = hw.constant 2 : i3
    %0 = comb.extract %io_csrsR_1_rdata from 0 {sv.namehint = "mstatus_UIE"} : (i64) -> i1
    %1 = comb.extract %io_csrsR_1_rdata from 1 {sv.namehint = "mstatus_SIE"} : (i64) -> i1
    %2 = comb.extract %io_csrsR_1_rdata from 3 {sv.namehint = "mstatus_MIE"} : (i64) -> i1
    %3 = comb.extract %io_csrsR_1_rdata from 8 {sv.namehint = "mstatus_SPP"} : (i64) -> i1
    %4 = comb.extract %io_csrsR_1_rdata from 11 {sv.namehint = "mstatus_MPP"} : (i64) -> i2
    %5 = comb.extract %io_csrsR_1_rdata from 22 {sv.namehint = "mstatus_TSR"} : (i64) -> i1
    %6 = comb.extract %io_csrsR_1_rdata from 63 {sv.namehint = "mstatus_SD"} : (i64) -> i1
    %7 = comb.extract %io_csrsR_2_rdata from 0 {sv.namehint = "mie_USIE"} : (i64) -> i1
    %8 = comb.extract %io_csrsR_2_rdata from 1 {sv.namehint = "mie_SSIE"} : (i64) -> i1
    %9 = comb.extract %io_csrsR_2_rdata from 3 {sv.namehint = "mie_MSIE"} : (i64) -> i1
    %10 = comb.extract %io_csrsR_2_rdata from 4 {sv.namehint = "mie_UTIE"} : (i64) -> i1
    %11 = comb.extract %io_csrsR_2_rdata from 5 {sv.namehint = "mie_STIE"} : (i64) -> i1
    %12 = comb.extract %io_csrsR_2_rdata from 7 {sv.namehint = "mie_MTIE"} : (i64) -> i1
    %13 = comb.extract %io_csrsR_2_rdata from 8 {sv.namehint = "mie_UEIE"} : (i64) -> i1
    %14 = comb.extract %io_csrsR_2_rdata from 9 {sv.namehint = "mie_SEIE"} : (i64) -> i1
    %15 = comb.extract %io_csrsR_2_rdata from 11 {sv.namehint = "mie_MEIE"} : (i64) -> i1
    %16 = comb.extract %io_csrsR_3_rdata from 0 {sv.namehint = "mideleg_USI"} : (i64) -> i1
    %17 = comb.extract %io_csrsR_3_rdata from 1 {sv.namehint = "mideleg_SSI"} : (i64) -> i1
    %18 = comb.extract %io_csrsR_3_rdata from 4 {sv.namehint = "mideleg_UTI"} : (i64) -> i1
    %19 = comb.extract %io_csrsR_3_rdata from 5 {sv.namehint = "mideleg_STI"} : (i64) -> i1
    %20 = comb.extract %io_csrsR_3_rdata from 8 {sv.namehint = "mideleg_UEI"} : (i64) -> i1
    %21 = comb.extract %io_csrsR_3_rdata from 9 {sv.namehint = "mideleg_SEI"} : (i64) -> i1
    %22 = comb.extract %io_csrsR_7_rdata from 0 {sv.namehint = "mip_USIP"} : (i64) -> i1
    %23 = comb.extract %io_csrsR_7_rdata from 1 {sv.namehint = "mip_SSIP"} : (i64) -> i1
    %24 = comb.extract %io_csrsR_7_rdata from 4 {sv.namehint = "mip_UTIP"} : (i64) -> i1
    %25 = comb.extract %io_csrsR_7_rdata from 5 {sv.namehint = "mip_STIP"} : (i64) -> i1
    %26 = comb.extract %io_csrsR_7_rdata from 8 {sv.namehint = "mip_UEIP"} : (i64) -> i1
    %27 = comb.extract %io_csrsR_7_rdata from 9 {sv.namehint = "mip_SEIP"} : (i64) -> i1
    %28 = comb.extract %io_csrsR_7_rdata from 11 {sv.namehint = "mip_MEIP"} : (i64) -> i1
    %NVALID = seq.firreg %1752 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64, sv.namehint = "NVALID"} : i1
    %rd = seq.firreg %1722 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 1 : ui64, sv.namehint = "rd"} : i5
    %pc = seq.firreg %1702 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 6 : ui64, sv.namehint = "pc"} : i64
    %wcsr_0 = seq.firreg %1727 clock %clock reset sync %reset, %c-1_i12 {firrtl.random_init_start = 70 : ui64, sv.namehint = "wcsr_0"} : i12
    %wcsr_1 = seq.firreg %1729 clock %clock reset sync %reset, %c-1_i12 {firrtl.random_init_start = 82 : ui64, sv.namehint = "wcsr_1"} : i12
    %wcsr_2 = seq.firreg %1731 clock %clock reset sync %reset, %c-1_i12 {firrtl.random_init_start = 94 : ui64, sv.namehint = "wcsr_2"} : i12
    %wcsr_3 = seq.firreg %1733 clock %clock reset sync %reset, %c-1_i12 {firrtl.random_init_start = 106 : ui64, sv.namehint = "wcsr_3"} : i12
    %isWcsr = seq.firreg %1725 clock %clock reset sync %reset, %false {firrtl.random_init_start = 118 : ui64, sv.namehint = "isWcsr"} : i1
    %op1_2 = seq.firreg %1743 clock %clock reset sync %reset, %c0_i31 {firrtl.random_init_start = 119 : ui64, sv.namehint = "op1_2"} : i31
    %op1_3 = seq.firreg %1745 clock %clock reset sync %reset, %c0_i31 {firrtl.random_init_start = 150 : ui64, sv.namehint = "op1_3"} : i31
    %special = seq.firreg %1747 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 181 : ui64, sv.namehint = "special"} : i5
    %newPriv = seq.firreg %1694 clock %clock reset sync %reset, %c-1_i2 {firrtl.random_init_start = 218 : ui64, sv.namehint = "newPriv"} : i2
    %isPriv = seq.firreg %1761 clock %clock reset sync %reset, %false {firrtl.random_init_start = 220 : ui64, sv.namehint = "isPriv"} : i1
    %blocked = seq.firreg %1755 clock %clock reset sync %reset, %false {firrtl.random_init_start = 221 : ui64} : i1
    %amoStat = seq.firreg %1698 clock %clock reset sync %reset, %false {firrtl.random_init_start = 222 : ui64, sv.namehint = "amoStat"} : i1
    %retire = seq.firreg %1699 clock %clock reset sync %reset, %false {firrtl.random_init_start = 223 : ui64, sv.namehint = "retire"} : i1
    %isSatp = seq.firreg %1758 clock %clock reset sync %reset, %false {firrtl.random_init_start = 224 : ui64, sv.namehint = "isSatp"} : i1
    %except = seq.firreg %1700 clock %clock reset sync %reset, %false {firrtl.random_init_start = 225 : ui64, sv.namehint = "except"} : i1
    %cause = seq.firreg %1701 clock %clock reset sync %reset, %c0_i4 {firrtl.random_init_start = 226 : ui64, sv.namehint = "cause"} : i4
    %jmpBch = seq.firreg %1763 clock %clock reset sync %reset, %false {firrtl.random_init_start = 230 : ui64, sv.namehint = "jmpBch"} : i1
    %jbAddr = seq.firreg %1703 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 231 : ui64, sv.namehint = "jbAddr"} : i64
    %jbPend = seq.firreg %1712 clock %clock reset sync %reset, %false {firrtl.random_init_start = 295 : ui64} : i1
    %rcsr = seq.firreg %1715 clock %clock reset sync %reset, %c-1_i12 {firrtl.random_init_start = 296 : ui64, sv.namehint = "rcsr"} : i12
    %intr = seq.firreg %1716 clock %clock reset sync %reset, %false {firrtl.random_init_start = 308 : ui64, sv.namehint = "intr"} : i1
    %rvc = seq.firreg %1718 clock %clock reset sync %reset, %false {firrtl.random_init_start = 309 : ui64, sv.namehint = "rvc"} : i1
    %num_0 = seq.firreg %1735 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 310 : ui64, sv.namehint = "num_0"} : i64
    %num_1 = seq.firreg %1737 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 374 : ui64, sv.namehint = "num_1"} : i64
    %num_2 = seq.firreg %1739 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 438 : ui64, sv.namehint = "num_2"} : i64
    %num_3 = seq.firreg %1741 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 502 : ui64, sv.namehint = "num_3"} : i64
    %29 = comb.xor bin %io_input_instr, %c-1_i32 {sv.namehint = "decoded_invInputs"} : i32
    %30 = comb.extract %29 from 1 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0"} : (i32) -> i1
    %31 = comb.extract %29 from 13 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1"} : (i32) -> i1
    %32 = comb.extract %29 from 15 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2"} : (i32) -> i1
    %33 = comb.concat %30, %31, %32 {sv.namehint = "_decoded_andMatrixOutputs_T"} : i1, i1, i1
    %34 = comb.icmp bin eq %33, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_13_2"} : i3
    %35 = comb.extract %29 from 0 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_1"} : (i32) -> i1
    %36 = comb.extract %29 from 14 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3"} : (i32) -> i1
    %37 = comb.concat %35, %30, %31, %36, %32 {sv.namehint = "_decoded_andMatrixOutputs_T_1"} : i1, i1, i1, i1, i1
    %38 = comb.icmp bin eq %37, %c-1_i5 {sv.namehint = "decoded_andMatrixOutputs_39_2"} : i5
    %39 = comb.extract %io_input_instr from 0 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_2"} : (i32) -> i1
    %40 = comb.concat %39, %30, %31, %32 {sv.namehint = "_decoded_andMatrixOutputs_T_2"} : i1, i1, i1, i1
    %41 = comb.icmp bin eq %40, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_14_2"} : i4
    %42 = comb.concat %39, %30, %36, %32 {sv.namehint = "_decoded_andMatrixOutputs_T_3"} : i1, i1, i1, i1
    %43 = comb.icmp bin eq %42, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_52_2"} : i4
    %44 = comb.extract %io_input_instr from 1 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1_4"} : (i32) -> i1
    %45 = comb.concat %35, %44, %31 {sv.namehint = "_decoded_andMatrixOutputs_T_4"} : i1, i1, i1
    %46 = comb.icmp bin eq %45, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_24_2"} : i3
    %47 = comb.concat %35, %44, %31, %36, %32 {sv.namehint = "_decoded_andMatrixOutputs_T_5"} : i1, i1, i1, i1, i1
    %48 = comb.icmp bin eq %47, %c-1_i5 {sv.namehint = "decoded_andMatrixOutputs_51_2"} : i5
    %49 = comb.extract %29 from 2 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_6"} : (i32) -> i1
    %50 = comb.extract %29 from 3 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_4"} : (i32) -> i1
    %51 = comb.extract %29 from 5 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_2"} : (i32) -> i1
    %52 = comb.extract %29 from 6 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5"} : (i32) -> i1
    %53 = comb.extract %29 from 12 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6"} : (i32) -> i1
    %54 = comb.concat %39, %44, %49, %50, %51, %52, %53 {sv.namehint = "_decoded_andMatrixOutputs_T_6"} : i1, i1, i1, i1, i1, i1, i1
    %55 = comb.icmp bin eq %54, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_33_2"} : i7
    %56 = comb.extract %29 from 4 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_3"} : (i32) -> i1
    %57 = comb.concat %39, %44, %49, %50, %56, %51, %52, %31 {sv.namehint = "_decoded_andMatrixOutputs_T_7"} : i1, i1, i1, i1, i1, i1, i1, i1
    %58 = comb.icmp bin eq %57, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_11_2"} : i8
    %59 = comb.concat %39, %44, %49, %50, %56, %52, %36 {sv.namehint = "_decoded_andMatrixOutputs_T_8"} : i1, i1, i1, i1, i1, i1, i1
    %60 = comb.icmp bin eq %59, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_1_2"} : i7
    %61 = comb.concat %39, %44, %49, %50, %56, %51, %52, %36 {sv.namehint = "_decoded_andMatrixOutputs_T_9"} : i1, i1, i1, i1, i1, i1, i1, i1
    %62 = comb.icmp bin eq %61, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_9_2"} : i8
    %63 = comb.extract %io_input_instr from 2 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_10"} : (i32) -> i1
    %64 = comb.extract %io_input_instr from 3 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_8"} : (i32) -> i1
    %65 = comb.concat %39, %44, %63, %64, %56, %51, %52, %31, %36 {sv.namehint = "_decoded_andMatrixOutputs_T_10"} : i1, i1, i1, i1, i1, i1, i1, i1, i1
    %66 = comb.icmp bin eq %65, %c-1_i9 {sv.namehint = "decoded_andMatrixOutputs_8_2"} : i9
    %67 = comb.extract %io_input_instr from 4 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_9"} : (i32) -> i1
    %68 = comb.concat %39, %44, %49, %67, %51, %52, %53, %31, %36 {sv.namehint = "_decoded_andMatrixOutputs_T_11"} : i1, i1, i1, i1, i1, i1, i1, i1, i1
    %69 = comb.icmp bin eq %68, %c-1_i9 {sv.namehint = "decoded_andMatrixOutputs_30_2"} : i9
    %70 = comb.concat %39, %44, %63, %50, %67, %52 {sv.namehint = "_decoded_andMatrixOutputs_T_12"} : i1, i1, i1, i1, i1, i1
    %71 = comb.icmp bin eq %70, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_18_2"} : i6
    %72 = comb.extract %io_input_instr from 5 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_7"} : (i32) -> i1
    %73 = comb.concat %39, %44, %49, %50, %56, %72, %52, %36 {sv.namehint = "_decoded_andMatrixOutputs_T_13"} : i1, i1, i1, i1, i1, i1, i1, i1
    %74 = comb.icmp bin eq %73, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_36_2"} : i8
    %75 = comb.extract %29 from 25 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9"} : (i32) -> i1
    %76 = comb.extract %29 from 26 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_10"} : (i32) -> i1
    %77 = comb.extract %29 from 27 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_11"} : (i32) -> i1
    %78 = comb.extract %29 from 28 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_12"} : (i32) -> i1
    %79 = comb.extract %29 from 29 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_13"} : (i32) -> i1
    %80 = comb.extract %29 from 31 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_14"} : (i32) -> i1
    %81 = comb.concat %39, %44, %49, %67, %72, %52, %53, %31, %36, %75, %76, %77, %78, %79, %80 {sv.namehint = "_decoded_andMatrixOutputs_T_14"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %82 = comb.icmp bin eq %81, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_50_2"} : i15
    %83 = comb.extract %29 from 30 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_29"} : (i32) -> i1
    %84 = comb.concat %39, %44, %49, %50, %67, %72, %52, %76, %77, %78, %79, %83, %80 {sv.namehint = "_decoded_andMatrixOutputs_T_15"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %85 = comb.icmp bin eq %84, %c-1_i13 {sv.namehint = "decoded_andMatrixOutputs_10_2"} : i13
    %86 = comb.concat %39, %44, %49, %67, %72, %52, %53, %31, %36, %76, %77, %78, %79, %83, %80 {sv.namehint = "_decoded_andMatrixOutputs_T_16"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %87 = comb.icmp bin eq %86, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_32_2"} : i15
    %88 = comb.concat %39, %44, %49, %67, %72, %52, %31, %36, %75, %76, %77, %78, %79, %83, %80 {sv.namehint = "_decoded_andMatrixOutputs_T_17"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %89 = comb.icmp bin eq %88, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_16_2"} : i15
    %90 = comb.extract %io_input_instr from 6 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_11"} : (i32) -> i1
    %91 = comb.concat %39, %44, %49, %50, %56, %72, %90, %31 {sv.namehint = "_decoded_andMatrixOutputs_T_18"} : i1, i1, i1, i1, i1, i1, i1, i1
    %92 = comb.icmp bin eq %91, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_31_2"} : i8
    %93 = comb.concat %39, %44, %50, %56, %72, %90, %53, %31, %36 {sv.namehint = "_decoded_andMatrixOutputs_T_19"} : i1, i1, i1, i1, i1, i1, i1, i1, i1
    %94 = comb.icmp bin eq %93, %c-1_i9 {sv.namehint = "decoded_andMatrixOutputs_37_2"} : i9
    %95 = comb.concat %39, %44, %63, %50, %56, %72, %90, %53, %31, %36 {sv.namehint = "_decoded_andMatrixOutputs_T_20"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %96 = comb.icmp bin eq %95, %c-1_i10 {sv.namehint = "decoded_andMatrixOutputs_53_2"} : i10
    %97 = comb.concat %39, %44, %64, %56, %72, %90 {sv.namehint = "_decoded_andMatrixOutputs_T_21"} : i1, i1, i1, i1, i1, i1
    %98 = comb.icmp bin eq %97, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_23_2"} : i6
    %99 = comb.concat %39, %44, %49, %64, %56, %72, %90 {sv.namehint = "_decoded_andMatrixOutputs_T_22"} : i1, i1, i1, i1, i1, i1, i1
    %100 = comb.icmp bin eq %99, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_22_2"} : i7
    %101 = comb.concat %39, %44, %63, %64, %56, %72, %90 {sv.namehint = "_decoded_andMatrixOutputs_T_23"} : i1, i1, i1, i1, i1, i1, i1
    %102 = comb.icmp bin eq %101, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_42_2"} : i7
    %103 = comb.extract %29 from 7 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_12"} : (i32) -> i1
    %104 = comb.extract %29 from 8 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_8_8"} : (i32) -> i1
    %105 = comb.extract %29 from 9 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_5"} : (i32) -> i1
    %106 = comb.extract %29 from 10 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_10_4"} : (i32) -> i1
    %107 = comb.extract %29 from 11 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_11_4"} : (i32) -> i1
    %108 = comb.extract %29 from 16 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_16"} : (i32) -> i1
    %109 = comb.extract %29 from 17 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_17"} : (i32) -> i1
    %110 = comb.extract %29 from 18 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_18"} : (i32) -> i1
    %111 = comb.extract %29 from 19 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_19"} : (i32) -> i1
    %112 = comb.extract %29 from 21 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_20"} : (i32) -> i1
    %113 = comb.extract %29 from 22 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_21"} : (i32) -> i1
    %114 = comb.extract %29 from 23 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_22"} : (i32) -> i1
    %115 = comb.extract %29 from 24 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_23"} : (i32) -> i1
    %116 = comb.concat %39, %44, %49, %50, %67, %72, %90, %103, %104, %105, %106, %107, %53, %31, %36, %32, %108, %109, %110, %111, %112, %113, %114, %115, %75, %76, %77, %78, %79, %83, %80 {sv.namehint = "_decoded_andMatrixOutputs_T_24"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %117 = comb.icmp bin eq %116, %c-1_i31 {sv.namehint = "decoded_andMatrixOutputs_26_2"} : i31
    %118 = comb.extract %io_input_instr from 12 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_17"} : (i32) -> i1
    %119 = comb.concat %39, %44, %49, %67, %51, %52, %118, %31, %76, %77, %78, %79, %83, %80 {sv.namehint = "_decoded_andMatrixOutputs_T_25"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %120 = comb.icmp bin eq %119, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_48_2"} : i14
    %121 = comb.concat %39, %44, %49, %50, %72, %90, %118, %31 {sv.namehint = "_decoded_andMatrixOutputs_T_26"} : i1, i1, i1, i1, i1, i1, i1, i1
    %122 = comb.icmp bin eq %121, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_29_2"} : i8
    %123 = comb.concat %39, %44, %49, %50, %67, %72, %90, %118 {sv.namehint = "_decoded_andMatrixOutputs_T_27"} : i1, i1, i1, i1, i1, i1, i1, i1
    %124 = comb.icmp bin eq %123, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_47_2"} : i8
    %125 = comb.extract %io_input_instr from 13 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_28"} : (i32) -> i1
    %126 = comb.concat %39, %30, %125 {sv.namehint = "_decoded_andMatrixOutputs_T_28"} : i1, i1, i1
    %127 = comb.icmp bin eq %126, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_4_2"} : i3
    %128 = comb.concat %39, %44, %49, %50, %67, %51, %52, %125 {sv.namehint = "_decoded_andMatrixOutputs_T_29"} : i1, i1, i1, i1, i1, i1, i1, i1
    %129 = comb.icmp bin eq %128, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_0_2"} : i8
    %130 = comb.concat %39, %44, %63, %64, %56, %72, %52, %125, %36, %77, %78 {sv.namehint = "_decoded_andMatrixOutputs_T_30"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %131 = comb.icmp bin eq %130, %c-1_i11 {sv.namehint = "decoded_andMatrixOutputs_15_2"} : i11
    %132 = comb.concat %39, %44, %49, %50, %67, %72, %90, %125 {sv.namehint = "_decoded_andMatrixOutputs_T_31"} : i1, i1, i1, i1, i1, i1, i1, i1
    %133 = comb.icmp bin eq %132, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_41_2"} : i8
    %134 = comb.extract %io_input_instr from 14 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1_32"} : (i32) -> i1
    %135 = comb.concat %35, %134 {sv.namehint = "_decoded_andMatrixOutputs_T_32"} : i1, i1
    %136 = comb.icmp bin eq %135, %c-1_i2 {sv.namehint = "decoded_andMatrixOutputs_46_2"} : i2
    %137 = comb.concat %30, %134 {sv.namehint = "_decoded_andMatrixOutputs_T_33"} : i1, i1
    %138 = comb.icmp bin eq %137, %c-1_i2 {sv.namehint = "decoded_andMatrixOutputs_27_2"} : i2
    %139 = comb.concat %35, %30, %134 {sv.namehint = "_decoded_andMatrixOutputs_T_34"} : i1, i1, i1
    %140 = comb.icmp bin eq %139, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_44_2"} : i3
    %141 = comb.concat %35, %44, %134, %32 {sv.namehint = "_decoded_andMatrixOutputs_T_35"} : i1, i1, i1, i1
    %142 = comb.icmp bin eq %141, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_49_2"} : i4
    %143 = comb.concat %39, %44, %49, %50, %56, %72, %90, %134 {sv.namehint = "_decoded_andMatrixOutputs_T_36"} : i1, i1, i1, i1, i1, i1, i1, i1
    %144 = comb.icmp bin eq %143, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_43_2"} : i8
    %145 = comb.concat %39, %44, %49, %67, %51, %52, %118, %31, %134, %76, %77, %78, %79, %80 {sv.namehint = "_decoded_andMatrixOutputs_T_37"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %146 = comb.icmp bin eq %145, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_5_2"} : i14
    %147 = comb.concat %39, %44, %49, %67, %72, %52, %118, %31, %134, %75, %76, %77, %78, %79, %80 {sv.namehint = "_decoded_andMatrixOutputs_T_38"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %148 = comb.icmp bin eq %147, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_28_2"} : i15
    %149 = comb.concat %39, %30, %125, %134, %32 {sv.namehint = "_decoded_andMatrixOutputs_T_39"} : i1, i1, i1, i1, i1
    %150 = comb.icmp bin eq %149, %c-1_i5 {sv.namehint = "decoded_andMatrixOutputs_38_2"} : i5
    %151 = comb.extract %io_input_instr from 15 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_28"} : (i32) -> i1
    %152 = comb.concat %39, %30, %106, %31, %36, %151 {sv.namehint = "_decoded_andMatrixOutputs_T_40"} : i1, i1, i1, i1, i1, i1
    %153 = comb.icmp bin eq %152, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_2_2"} : i6
    %154 = comb.concat %39, %30, %107, %31, %36, %151 {sv.namehint = "_decoded_andMatrixOutputs_T_41"} : i1, i1, i1, i1, i1, i1
    %155 = comb.icmp bin eq %154, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_25_2"} : i6
    %156 = comb.concat %35, %44, %31, %36, %151 {sv.namehint = "_decoded_andMatrixOutputs_T_42"} : i1, i1, i1, i1, i1
    %157 = comb.icmp bin eq %156, %c-1_i5 {sv.namehint = "decoded_andMatrixOutputs_17_2"} : i5
    %158 = comb.extract %io_input_instr from 10 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_37"} : (i32) -> i1
    %159 = comb.extract %io_input_instr from 11 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_34"} : (i32) -> i1
    %160 = comb.concat %39, %30, %52, %158, %159, %31, %36, %151 {sv.namehint = "_decoded_andMatrixOutputs_T_43"} : i1, i1, i1, i1, i1, i1, i1, i1
    %161 = comb.icmp bin eq %160, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_20_2"} : i8
    %162 = comb.concat %39, %30, %158, %159, %53, %31, %36, %151 {sv.namehint = "_decoded_andMatrixOutputs_T_44"} : i1, i1, i1, i1, i1, i1, i1, i1
    %163 = comb.icmp bin eq %162, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_19_2"} : i8
    %164 = comb.concat %39, %30, %125, %36, %151 {sv.namehint = "_decoded_andMatrixOutputs_T_45"} : i1, i1, i1, i1, i1
    %165 = comb.icmp bin eq %164, %c-1_i5 {sv.namehint = "decoded_andMatrixOutputs_21_2"} : i5
    %166 = comb.concat %39, %30, %134, %151 {sv.namehint = "_decoded_andMatrixOutputs_T_46"} : i1, i1, i1, i1
    %167 = comb.icmp bin eq %166, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_6_2"} : i4
    %168 = comb.concat %35, %44, %134, %151 {sv.namehint = "_decoded_andMatrixOutputs_T_47"} : i1, i1, i1, i1
    %169 = comb.icmp bin eq %168, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_45_2"} : i4
    %170 = comb.extract %io_input_instr from 25 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_24"} : (i32) -> i1
    %171 = comb.concat %39, %44, %49, %67, %72, %52, %134, %170, %76, %77, %78, %79, %83, %80 {sv.namehint = "_decoded_andMatrixOutputs_T_48"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %172 = comb.icmp bin eq %171, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_12_2"} : i14
    %173 = comb.extract %io_input_instr from 27 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_11"} : (i32) -> i1
    %174 = comb.concat %39, %44, %63, %64, %56, %72, %52, %125, %36, %173, %79, %83, %80 {sv.namehint = "_decoded_andMatrixOutputs_T_49"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %175 = comb.icmp bin eq %174, %c-1_i13 {sv.namehint = "decoded_andMatrixOutputs_7_2"} : i13
    %176 = comb.extract %29 from 20 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_12"} : (i32) -> i1
    %177 = comb.extract %io_input_instr from 28 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_15_1"} : (i32) -> i1
    %178 = comb.concat %39, %44, %63, %64, %56, %72, %52, %125, %36, %176, %112, %113, %114, %115, %77, %177, %79, %83, %80 {sv.namehint = "_decoded_andMatrixOutputs_T_50"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %179 = comb.icmp bin eq %178, %c-1_i19 {sv.namehint = "decoded_andMatrixOutputs_3_2"} : i19
    %180 = comb.extract %io_input_instr from 21 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_21_1"} : (i32) -> i1
    %181 = comb.concat %39, %44, %49, %50, %67, %72, %90, %103, %104, %105, %106, %107, %53, %31, %36, %32, %108, %109, %110, %111, %176, %180, %113, %114, %115, %75, %76, %77, %177, %83, %80 {sv.namehint = "_decoded_andMatrixOutputs_T_51"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %182 = comb.icmp bin eq %181, %c-1_i31 {sv.namehint = "decoded_andMatrixOutputs_40_2"} : i31
    %183 = comb.extract %io_input_instr from 20 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_20_2"} : (i32) -> i1
    %184 = comb.extract %io_input_instr from 22 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_22_2"} : (i32) -> i1
    %185 = comb.concat %39, %44, %49, %50, %67, %72, %90, %103, %104, %105, %106, %107, %53, %31, %36, %32, %108, %109, %110, %111, %183, %112, %184, %114, %115, %75, %76, %77, %177, %79, %83, %80 {sv.namehint = "_decoded_andMatrixOutputs_T_52"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %186 = comb.icmp bin eq %185, %c-1_i32 {sv.namehint = "decoded_andMatrixOutputs_35_2"} : i32
    %187 = comb.concat %39, %44, %49, %50, %67, %72, %90, %103, %104, %105, %106, %107, %53, %31, %36, %170, %76, %77, %177, %79, %83, %80 {sv.namehint = "_decoded_andMatrixOutputs_T_53"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %188 = comb.icmp bin eq %187, %c-1_i22 {sv.namehint = "decoded_andMatrixOutputs_34_2"} : i22
    %189 = comb.concat %55, %58, %62, %66, %69, %82, %85, %87, %89, %96, %100, %117, %120, %129, %131, %146, %148, %172, %175, %179, %182, %186, %188 {sv.namehint = "_decoded_orMatrixOutputs_T"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %190 = comb.icmp bin ne %189, %c0_i23 {sv.namehint = "_decoded_invMatrixOutputs_T"} : i23
    %191 = comb.concat %92, %144 {sv.namehint = "_decoded_orMatrixOutputs_T_5"} : i1, i1
    %192 = comb.icmp bin ne %191, %c0_i2 {sv.namehint = "_decoded_invMatrixOutputs_T_4"} : i2
    %193 = comb.concat %124, %133 {sv.namehint = "_decoded_orMatrixOutputs_T_7"} : i1, i1
    %194 = comb.icmp bin ne %193, %c0_i2 {sv.namehint = "_decoded_invMatrixOutputs_T_5"} : i2
    %195 = comb.concat %34, %46, %55, %58, %60, %66, %69, %71, %82, %85, %87, %89, %94, %98, %117, %120, %122, %127, %129, %131, %133, %136, %138, %144, %146, %148, %153, %155, %161, %163, %172, %175, %179, %182, %186, %188 {sv.namehint = "_decoded_orMatrixOutputs_T_9"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %196 = comb.concat %157, %161, %163 {sv.namehint = "_decoded_orMatrixOutputs_T_15"} : i1, i1, i1
    %197 = comb.icmp bin ne %196, %c0_i3 {sv.namehint = "_decoded_invMatrixOutputs_T_12"} : i3
    %198 = comb.concat %41, %43, %48, %153, %155 {sv.namehint = "_decoded_orMatrixOutputs_T_18"} : i1, i1, i1, i1, i1
    %199 = comb.icmp bin ne %198, %c0_i5 {sv.namehint = "_decoded_invMatrixOutputs_T_14"} : i5
    %200 = comb.icmp bin eq %195, %c0_i36 {sv.namehint = "_decoded_invMatrixOutputs_T_7"} : i36
    %201 = comb.xor bin %io_input_instr, %c-1_i32 {sv.namehint = "decoded_invInputs_1"} : i32
    %202 = comb.extract %201 from 0 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_54"} : (i32) -> i1
    %203 = comb.extract %201 from 13 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1_54"} : (i32) -> i1
    %204 = comb.extract %201 from 14 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_52"} : (i32) -> i1
    %205 = comb.extract %201 from 15 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_48"} : (i32) -> i1
    %206 = comb.concat %202, %203, %204, %205 {sv.namehint = "_decoded_andMatrixOutputs_T_54"} : i1, i1, i1, i1
    %207 = comb.icmp bin eq %206, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_2_2_1"} : i4
    %208 = comb.extract %201 from 1 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_55"} : (i32) -> i1
    %209 = comb.concat %208, %203, %204, %205 {sv.namehint = "_decoded_andMatrixOutputs_T_55"} : i1, i1, i1, i1
    %210 = comb.icmp bin eq %209, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_31_2_1"} : i4
    %211 = comb.concat %202, %208, %203, %204, %205 {sv.namehint = "_decoded_andMatrixOutputs_T_56"} : i1, i1, i1, i1, i1
    %212 = comb.icmp bin eq %211, %c-1_i5 {sv.namehint = "decoded_andMatrixOutputs_32_2_1"} : i5
    %213 = comb.extract %io_input_instr from 0 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_57"} : (i32) -> i1
    %214 = comb.concat %213, %208, %204, %205 {sv.namehint = "_decoded_andMatrixOutputs_T_57"} : i1, i1, i1, i1
    %215 = comb.icmp bin eq %214, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_41_2_1"} : i4
    %216 = comb.extract %io_input_instr from 1 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1_58"} : (i32) -> i1
    %217 = comb.concat %202, %216, %203, %204, %205 {sv.namehint = "_decoded_andMatrixOutputs_T_58"} : i1, i1, i1, i1, i1
    %218 = comb.icmp bin eq %217, %c-1_i5 {sv.namehint = "decoded_andMatrixOutputs_40_2_1"} : i5
    %219 = comb.extract %201 from 2 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_57"} : (i32) -> i1
    %220 = comb.extract %201 from 3 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_53"} : (i32) -> i1
    %221 = comb.extract %io_input_instr from 4 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_45"} : (i32) -> i1
    %222 = comb.extract %201 from 5 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_38"} : (i32) -> i1
    %223 = comb.extract %201 from 6 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_34"} : (i32) -> i1
    %224 = comb.extract %201 from 12 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_30"} : (i32) -> i1
    %225 = comb.concat %213, %216, %219, %220, %221, %222, %223, %224 {sv.namehint = "_decoded_andMatrixOutputs_T_59"} : i1, i1, i1, i1, i1, i1, i1, i1
    %226 = comb.icmp bin eq %225, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_17_2_1"} : i8
    %227 = comb.concat %213, %216, %219, %221, %222, %223, %224, %203, %204 {sv.namehint = "_decoded_andMatrixOutputs_T_60"} : i1, i1, i1, i1, i1, i1, i1, i1, i1
    %228 = comb.icmp bin eq %227, %c-1_i9 {sv.namehint = "decoded_andMatrixOutputs_24_2_1"} : i9
    %229 = comb.extract %io_input_instr from 2 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_59"} : (i32) -> i1
    %230 = comb.concat %213, %216, %229, %220, %221, %222, %223 {sv.namehint = "_decoded_andMatrixOutputs_T_61"} : i1, i1, i1, i1, i1, i1, i1
    %231 = comb.icmp bin eq %230, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_35_2_1"} : i7
    %232 = comb.extract %201 from 4 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_48"} : (i32) -> i1
    %233 = comb.extract %io_input_instr from 5 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_41"} : (i32) -> i1
    %234 = comb.concat %213, %216, %219, %220, %232, %233, %223, %204 {sv.namehint = "_decoded_andMatrixOutputs_T_62"} : i1, i1, i1, i1, i1, i1, i1, i1
    %235 = comb.icmp bin eq %234, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_29_2_1"} : i8
    %236 = comb.extract %201 from 25 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_16"} : (i32) -> i1
    %237 = comb.extract %201 from 26 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_34"} : (i32) -> i1
    %238 = comb.extract %201 from 27 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_8_21"} : (i32) -> i1
    %239 = comb.extract %201 from 28 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_17"} : (i32) -> i1
    %240 = comb.extract %201 from 29 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_13_12"} : (i32) -> i1
    %241 = comb.extract %201 from 31 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_14_9"} : (i32) -> i1
    %242 = comb.concat %213, %216, %219, %221, %233, %223, %224, %203, %204, %236, %237, %238, %239, %240, %241 {sv.namehint = "_decoded_andMatrixOutputs_T_63"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %243 = comb.icmp bin eq %242, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_39_2_1"} : i15
    %244 = comb.extract %201 from 30 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_11_15"} : (i32) -> i1
    %245 = comb.concat %213, %216, %219, %220, %221, %233, %223, %237, %238, %239, %240, %244, %241 {sv.namehint = "_decoded_andMatrixOutputs_T_64"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %246 = comb.icmp bin eq %245, %c-1_i13 {sv.namehint = "decoded_andMatrixOutputs_9_2_1"} : i13
    %247 = comb.concat %213, %216, %219, %221, %233, %223, %224, %203, %204, %237, %238, %239, %240, %244, %241 {sv.namehint = "_decoded_andMatrixOutputs_T_65"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %248 = comb.icmp bin eq %247, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_28_2_1"} : i15
    %249 = comb.concat %213, %216, %219, %221, %233, %223, %203, %204, %236, %237, %238, %239, %240, %244, %241 {sv.namehint = "_decoded_andMatrixOutputs_T_66"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %250 = comb.icmp bin eq %249, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_11_2_1"} : i15
    %251 = comb.extract %io_input_instr from 6 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_42"} : (i32) -> i1
    %252 = comb.concat %213, %216, %219, %220, %232, %233, %251, %203 {sv.namehint = "_decoded_andMatrixOutputs_T_67"} : i1, i1, i1, i1, i1, i1, i1, i1
    %253 = comb.icmp bin eq %252, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_27_2_1"} : i8
    %254 = comb.concat %213, %216, %220, %232, %233, %251, %224, %203, %204 {sv.namehint = "_decoded_andMatrixOutputs_T_68"} : i1, i1, i1, i1, i1, i1, i1, i1, i1
    %255 = comb.icmp bin eq %254, %c-1_i9 {sv.namehint = "decoded_andMatrixOutputs_30_2_1"} : i9
    %256 = comb.concat %213, %216, %229, %220, %232, %233, %251, %224, %203, %204 {sv.namehint = "_decoded_andMatrixOutputs_T_69"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %257 = comb.icmp bin eq %256, %c-1_i10 {sv.namehint = "decoded_andMatrixOutputs_42_2_1"} : i10
    %258 = comb.extract %io_input_instr from 3 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_68"} : (i32) -> i1
    %259 = comb.concat %213, %216, %258, %232, %233, %251 {sv.namehint = "_decoded_andMatrixOutputs_T_70"} : i1, i1, i1, i1, i1, i1
    %260 = comb.icmp bin eq %259, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_21_2_1"} : i6
    %261 = comb.concat %213, %216, %219, %258, %232, %233, %251 {sv.namehint = "_decoded_andMatrixOutputs_T_71"} : i1, i1, i1, i1, i1, i1, i1
    %262 = comb.icmp bin eq %261, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_20_2_1"} : i7
    %263 = comb.concat %213, %216, %229, %258, %232, %233, %251 {sv.namehint = "_decoded_andMatrixOutputs_T_72"} : i1, i1, i1, i1, i1, i1, i1
    %264 = comb.icmp bin eq %263, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_33_2_1"} : i7
    %265 = comb.extract %io_input_instr from 12 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_47"} : (i32) -> i1
    %266 = comb.concat %213, %216, %219, %221, %222, %223, %265, %203, %237, %238, %239, %240, %244, %241 {sv.namehint = "_decoded_andMatrixOutputs_T_73"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %267 = comb.icmp bin eq %266, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_37_2_1"} : i14
    %268 = comb.concat %213, %216, %219, %220, %233, %251, %265, %203 {sv.namehint = "_decoded_andMatrixOutputs_T_74"} : i1, i1, i1, i1, i1, i1, i1, i1
    %269 = comb.icmp bin eq %268, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_23_2_1"} : i8
    %270 = comb.concat %213, %216, %219, %220, %221, %233, %251, %265 {sv.namehint = "_decoded_andMatrixOutputs_T_75"} : i1, i1, i1, i1, i1, i1, i1, i1
    %271 = comb.icmp bin eq %270, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_36_2_1"} : i8
    %272 = comb.extract %io_input_instr from 13 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_74"} : (i32) -> i1
    %273 = comb.concat %213, %208, %272 {sv.namehint = "_decoded_andMatrixOutputs_T_76"} : i1, i1, i1
    %274 = comb.icmp bin eq %273, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_18_2_1"} : i3
    %275 = comb.concat %213, %208, %272, %205 {sv.namehint = "_decoded_andMatrixOutputs_T_77"} : i1, i1, i1, i1
    %276 = comb.icmp bin eq %275, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_15_2_1"} : i4
    %277 = comb.concat %213, %216, %219, %220, %221, %222, %223, %272 {sv.namehint = "_decoded_andMatrixOutputs_T_78"} : i1, i1, i1, i1, i1, i1, i1, i1
    %278 = comb.icmp bin eq %277, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_1_2_1"} : i8
    %279 = comb.concat %213, %216, %229, %258, %232, %233, %223, %272, %204, %238, %239 {sv.namehint = "_decoded_andMatrixOutputs_T_79"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %280 = comb.icmp bin eq %279, %c-1_i11 {sv.namehint = "decoded_andMatrixOutputs_0_2_1"} : i11
    %281 = comb.concat %213, %216, %219, %220, %221, %233, %251, %272 {sv.namehint = "_decoded_andMatrixOutputs_T_80"} : i1, i1, i1, i1, i1, i1, i1, i1
    %282 = comb.icmp bin eq %281, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_7_2_1"} : i8
    %283 = comb.extract %io_input_instr from 14 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_46"} : (i32) -> i1
    %284 = comb.concat %213, %216, %219, %220, %232, %233, %251, %283 {sv.namehint = "_decoded_andMatrixOutputs_T_81"} : i1, i1, i1, i1, i1, i1, i1, i1
    %285 = comb.icmp bin eq %284, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_34_2_1"} : i8
    %286 = comb.concat %213, %216, %219, %221, %222, %223, %265, %203, %283, %237, %238, %239, %240, %241 {sv.namehint = "_decoded_andMatrixOutputs_T_82"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %287 = comb.icmp bin eq %286, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_4_2_1"} : i14
    %288 = comb.concat %213, %216, %219, %221, %233, %223, %265, %203, %283, %236, %237, %238, %239, %240, %241 {sv.namehint = "_decoded_andMatrixOutputs_T_83"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %289 = comb.icmp bin eq %288, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_26_2_1"} : i15
    %290 = comb.extract %201 from 10 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_82"} : (i32) -> i1
    %291 = comb.extract %io_input_instr from 15 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_61"} : (i32) -> i1
    %292 = comb.concat %213, %208, %290, %203, %204, %291 {sv.namehint = "_decoded_andMatrixOutputs_T_84"} : i1, i1, i1, i1, i1, i1
    %293 = comb.icmp bin eq %292, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_3_2_1"} : i6
    %294 = comb.extract %201 from 11 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_83"} : (i32) -> i1
    %295 = comb.concat %213, %208, %294, %203, %204, %291 {sv.namehint = "_decoded_andMatrixOutputs_T_85"} : i1, i1, i1, i1, i1, i1
    %296 = comb.icmp bin eq %295, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_22_2_1"} : i6
    %297 = comb.extract %io_input_instr from 10 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_79"} : (i32) -> i1
    %298 = comb.extract %io_input_instr from 11 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_70"} : (i32) -> i1
    %299 = comb.concat %213, %208, %223, %297, %298, %203, %204, %291 {sv.namehint = "_decoded_andMatrixOutputs_T_86"} : i1, i1, i1, i1, i1, i1, i1, i1
    %300 = comb.icmp bin eq %299, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_14_2_1"} : i8
    %301 = comb.concat %213, %208, %297, %298, %224, %203, %204, %291 {sv.namehint = "_decoded_andMatrixOutputs_T_87"} : i1, i1, i1, i1, i1, i1, i1, i1
    %302 = comb.icmp bin eq %301, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_13_2_1"} : i8
    %303 = comb.concat %202, %216, %265, %203, %204, %291 {sv.namehint = "_decoded_andMatrixOutputs_T_88"} : i1, i1, i1, i1, i1, i1
    %304 = comb.icmp bin eq %303, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_16_2_1"} : i6
    %305 = comb.concat %213, %208, %272, %204, %291 {sv.namehint = "_decoded_andMatrixOutputs_T_89"} : i1, i1, i1, i1, i1
    %306 = comb.icmp bin eq %305, %c-1_i5 {sv.namehint = "decoded_andMatrixOutputs_19_2_1"} : i5
    %307 = comb.concat %202, %283, %291 {sv.namehint = "_decoded_andMatrixOutputs_T_90"} : i1, i1, i1
    %308 = comb.icmp bin eq %307, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_25_2_1"} : i3
    %309 = comb.concat %208, %283, %291 {sv.namehint = "_decoded_andMatrixOutputs_T_91"} : i1, i1, i1
    %310 = comb.icmp bin eq %309, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_38_2_1"} : i3
    %311 = comb.concat %202, %208, %283, %291 {sv.namehint = "_decoded_andMatrixOutputs_T_92"} : i1, i1, i1, i1
    %312 = comb.icmp bin eq %311, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_12_2_1"} : i4
    %313 = comb.concat %213, %208, %283, %291 {sv.namehint = "_decoded_andMatrixOutputs_T_93"} : i1, i1, i1, i1
    %314 = comb.icmp bin eq %313, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_5_2_1"} : i4
    %315 = comb.concat %202, %216, %283, %291 {sv.namehint = "_decoded_andMatrixOutputs_T_94"} : i1, i1, i1, i1
    %316 = comb.icmp bin eq %315, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_8_2_1"} : i4
    %317 = comb.extract %io_input_instr from 25 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_51"} : (i32) -> i1
    %318 = comb.concat %213, %216, %219, %221, %233, %223, %283, %317, %237, %238, %239, %240, %244, %241 {sv.namehint = "_decoded_andMatrixOutputs_T_95"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %319 = comb.icmp bin eq %318, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_10_2_1"} : i14
    %320 = comb.extract %io_input_instr from 27 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_26"} : (i32) -> i1
    %321 = comb.concat %213, %216, %229, %258, %232, %233, %223, %272, %204, %320, %240, %244, %241 {sv.namehint = "_decoded_andMatrixOutputs_T_96"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %322 = comb.icmp bin eq %321, %c-1_i13 {sv.namehint = "decoded_andMatrixOutputs_6_2_1"} : i13
    %323 = comb.concat %207, %210, %226, %228, %231, %235, %243, %246, %248, %250, %255, %260, %267, %269, %274, %278, %280, %282, %285, %287, %289, %293, %296, %300, %302, %304, %308, %310, %319, %322 {sv.namehint = "_decoded_orMatrixOutputs_T_22"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %324 = comb.concat %226, %228, %243, %246, %248, %250, %253, %262, %267, %278, %285, %287, %289, %319 {sv.namehint = "_decoded_orMatrixOutputs_T_24"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %325 = comb.icmp bin ne %324, %c0_i14 {sv.namehint = "_wireNum_0_T_3"} : i14
    %326 = comb.concat %235, %280, %322 {sv.namehint = "_decoded_orMatrixOutputs_T_26"} : i1, i1, i1
    %327 = comb.icmp bin ne %326, %c0_i3 {sv.namehint = "_wireNum_0_T_4"} : i3
    %328 = comb.concat %231, %257, %264, %306 {sv.namehint = "_decoded_orMatrixOutputs_T_28"} : i1, i1, i1, i1
    %329 = comb.icmp bin ne %328, %c0_i4 {sv.namehint = "_wireNum_0_T_7"} : i4
    %330 = comb.concat %271, %282 {sv.namehint = "_decoded_orMatrixOutputs_T_30"} : i1, i1
    %331 = comb.icmp bin ne %330, %c0_i2 {sv.namehint = "_wireNum_0_T_8"} : i2
    %332 = comb.concat %215, %218, %276, %304 {sv.namehint = "_decoded_orMatrixOutputs_T_35"} : i1, i1, i1, i1
    %333 = comb.icmp bin ne %332, %c0_i4 {sv.namehint = "_wireNum_0_T_13"} : i4
    %334 = comb.concat %293, %296, %300, %302 {sv.namehint = "_decoded_orMatrixOutputs_T_37"} : i1, i1, i1, i1
    %335 = comb.icmp bin ne %334, %c0_i4 {sv.namehint = "_wireNum_0_T_14"} : i4
    %336 = comb.icmp bin eq %323, %c0_i30 {sv.namehint = "_decoded_invMatrixOutputs_T_19"} : i30
    %337 = comb.xor bin %io_input_instr, %c-1_i32 {sv.namehint = "decoded_invInputs_2"} : i32
    %338 = comb.extract %337 from 0 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_97"} : (i32) -> i1
    %339 = comb.extract %337 from 13 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1_97"} : (i32) -> i1
    %340 = comb.extract %337 from 14 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_95"} : (i32) -> i1
    %341 = comb.extract %337 from 15 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_88"} : (i32) -> i1
    %342 = comb.concat %338, %339, %340, %341 {sv.namehint = "_decoded_andMatrixOutputs_T_97"} : i1, i1, i1, i1
    %343 = comb.icmp bin eq %342, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_1_2_2"} : i4
    %344 = comb.extract %337 from 1 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_98"} : (i32) -> i1
    %345 = comb.concat %344, %339, %340, %341 {sv.namehint = "_decoded_andMatrixOutputs_T_98"} : i1, i1, i1, i1
    %346 = comb.icmp bin eq %345, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_8_2_2"} : i4
    %347 = comb.extract %io_input_instr from 0 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_99"} : (i32) -> i1
    %348 = comb.concat %347, %344, %341 {sv.namehint = "_decoded_andMatrixOutputs_T_99"} : i1, i1, i1
    %349 = comb.icmp bin eq %348, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_7_2_2"} : i3
    %350 = comb.extract %io_input_instr from 1 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1_100"} : (i32) -> i1
    %351 = comb.concat %338, %350, %339, %340 {sv.namehint = "_decoded_andMatrixOutputs_T_100"} : i1, i1, i1, i1
    %352 = comb.icmp bin eq %351, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_10_2_2"} : i4
    %353 = comb.extract %337 from 2 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_99"} : (i32) -> i1
    %354 = comb.extract %337 from 3 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_91"} : (i32) -> i1
    %355 = comb.extract %io_input_instr from 4 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_76"} : (i32) -> i1
    %356 = comb.extract %337 from 5 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_68"} : (i32) -> i1
    %357 = comb.extract %337 from 6 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_60"} : (i32) -> i1
    %358 = comb.extract %337 from 12 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_53"} : (i32) -> i1
    %359 = comb.concat %347, %350, %353, %354, %355, %356, %357, %358 {sv.namehint = "_decoded_andMatrixOutputs_T_101"} : i1, i1, i1, i1, i1, i1, i1, i1
    %360 = comb.icmp bin eq %359, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_3_2_2"} : i8
    %361 = comb.concat %347, %350, %353, %355, %356, %357, %358, %339, %340 {sv.namehint = "_decoded_andMatrixOutputs_T_102"} : i1, i1, i1, i1, i1, i1, i1, i1, i1
    %362 = comb.icmp bin eq %361, %c-1_i9 {sv.namehint = "decoded_andMatrixOutputs_23_2_2"} : i9
    %363 = comb.extract %io_input_instr from 2 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_101"} : (i32) -> i1
    %364 = comb.concat %347, %350, %363, %354, %355, %357 {sv.namehint = "_decoded_andMatrixOutputs_T_103"} : i1, i1, i1, i1, i1, i1
    %365 = comb.icmp bin eq %364, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_16_2_2"} : i6
    %366 = comb.extract %io_input_instr from 5 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_79"} : (i32) -> i1
    %367 = comb.extract %337 from 25 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_27"} : (i32) -> i1
    %368 = comb.extract %337 from 26 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_56"} : (i32) -> i1
    %369 = comb.extract %337 from 27 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_8_34"} : (i32) -> i1
    %370 = comb.extract %337 from 28 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_28"} : (i32) -> i1
    %371 = comb.extract %337 from 29 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_13_19"} : (i32) -> i1
    %372 = comb.extract %337 from 31 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_14_13"} : (i32) -> i1
    %373 = comb.concat %347, %350, %353, %355, %366, %357, %358, %339, %340, %367, %368, %369, %370, %371, %372 {sv.namehint = "_decoded_andMatrixOutputs_T_104"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %374 = comb.icmp bin eq %373, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_30_2_2"} : i15
    %375 = comb.extract %337 from 30 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_11_24"} : (i32) -> i1
    %376 = comb.concat %347, %350, %353, %354, %355, %366, %357, %368, %369, %370, %371, %375, %372 {sv.namehint = "_decoded_andMatrixOutputs_T_105"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %377 = comb.icmp bin eq %376, %c-1_i13 {sv.namehint = "decoded_andMatrixOutputs_12_2_2"} : i13
    %378 = comb.concat %347, %350, %353, %355, %366, %357, %358, %339, %340, %368, %369, %370, %371, %375, %372 {sv.namehint = "_decoded_andMatrixOutputs_T_106"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %379 = comb.icmp bin eq %378, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_25_2_2"} : i15
    %380 = comb.concat %347, %350, %353, %355, %366, %357, %339, %340, %367, %368, %369, %370, %371, %375, %372 {sv.namehint = "_decoded_andMatrixOutputs_T_107"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %381 = comb.icmp bin eq %380, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_14_2_2"} : i15
    %382 = comb.extract %337 from 4 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_83"} : (i32) -> i1
    %383 = comb.extract %io_input_instr from 6 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_66"} : (i32) -> i1
    %384 = comb.concat %347, %350, %353, %354, %382, %366, %383, %339 {sv.namehint = "_decoded_andMatrixOutputs_T_108"} : i1, i1, i1, i1, i1, i1, i1, i1
    %385 = comb.icmp bin eq %384, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_24_2_2"} : i8
    %386 = comb.concat %347, %350, %354, %382, %366, %383, %358, %339, %340 {sv.namehint = "_decoded_andMatrixOutputs_T_109"} : i1, i1, i1, i1, i1, i1, i1, i1, i1
    %387 = comb.icmp bin eq %386, %c-1_i9 {sv.namehint = "decoded_andMatrixOutputs_6_2_2"} : i9
    %388 = comb.concat %347, %350, %363, %354, %382, %366, %383, %358, %339, %340 {sv.namehint = "_decoded_andMatrixOutputs_T_110"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %389 = comb.icmp bin eq %388, %c-1_i10 {sv.namehint = "decoded_andMatrixOutputs_31_2_2"} : i10
    %390 = comb.extract %io_input_instr from 3 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_101"} : (i32) -> i1
    %391 = comb.concat %347, %350, %363, %390, %382, %366, %383 {sv.namehint = "_decoded_andMatrixOutputs_T_111"} : i1, i1, i1, i1, i1, i1, i1
    %392 = comb.icmp bin eq %391, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_26_2_2"} : i7
    %393 = comb.extract %io_input_instr from 12 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_70"} : (i32) -> i1
    %394 = comb.concat %347, %350, %353, %355, %356, %357, %393, %339, %368, %369, %370, %371, %375, %372 {sv.namehint = "_decoded_andMatrixOutputs_T_112"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %395 = comb.icmp bin eq %394, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_29_2_2"} : i14
    %396 = comb.concat %347, %350, %353, %354, %366, %383, %393, %339 {sv.namehint = "_decoded_andMatrixOutputs_T_113"} : i1, i1, i1, i1, i1, i1, i1, i1
    %397 = comb.icmp bin eq %396, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_22_2_2"} : i8
    %398 = comb.concat %347, %350, %353, %354, %355, %366, %383, %393, %340 {sv.namehint = "_decoded_andMatrixOutputs_T_114"} : i1, i1, i1, i1, i1, i1, i1, i1, i1
    %399 = comb.icmp bin eq %398, %c-1_i9 {sv.namehint = "decoded_andMatrixOutputs_20_2_2"} : i9
    %400 = comb.extract %io_input_instr from 13 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_65"} : (i32) -> i1
    %401 = comb.concat %347, %350, %353, %354, %355, %356, %357, %400 {sv.namehint = "_decoded_andMatrixOutputs_T_115"} : i1, i1, i1, i1, i1, i1, i1, i1
    %402 = comb.icmp bin eq %401, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_0_2_2"} : i8
    %403 = comb.concat %347, %350, %353, %354, %355, %366, %383, %400 {sv.namehint = "_decoded_andMatrixOutputs_T_116"} : i1, i1, i1, i1, i1, i1, i1, i1
    %404 = comb.icmp bin eq %403, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_9_2_2"} : i8
    %405 = comb.concat %347, %350, %353, %354, %355, %366, %383, %400, %340 {sv.namehint = "_decoded_andMatrixOutputs_T_117"} : i1, i1, i1, i1, i1, i1, i1, i1, i1
    %406 = comb.icmp bin eq %405, %c-1_i9 {sv.namehint = "decoded_andMatrixOutputs_28_2_2"} : i9
    %407 = comb.extract %io_input_instr from 14 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_68"} : (i32) -> i1
    %408 = comb.concat %347, %350, %353, %354, %382, %366, %383, %407 {sv.namehint = "_decoded_andMatrixOutputs_T_118"} : i1, i1, i1, i1, i1, i1, i1, i1
    %409 = comb.icmp bin eq %408, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_27_2_2"} : i8
    %410 = comb.concat %347, %350, %353, %355, %356, %357, %393, %339, %407, %368, %369, %370, %371, %372 {sv.namehint = "_decoded_andMatrixOutputs_T_119"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %411 = comb.icmp bin eq %410, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_5_2_2"} : i14
    %412 = comb.concat %347, %350, %353, %355, %366, %357, %393, %339, %407, %367, %368, %369, %370, %371, %372 {sv.namehint = "_decoded_andMatrixOutputs_T_120"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %413 = comb.icmp bin eq %412, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_21_2_2"} : i15
    %414 = comb.concat %347, %350, %353, %354, %355, %366, %383, %393, %407 {sv.namehint = "_decoded_andMatrixOutputs_T_121"} : i1, i1, i1, i1, i1, i1, i1, i1, i1
    %415 = comb.icmp bin eq %414, %c-1_i9 {sv.namehint = "decoded_andMatrixOutputs_19_2_2"} : i9
    %416 = comb.concat %347, %350, %353, %354, %355, %366, %383, %400, %407 {sv.namehint = "_decoded_andMatrixOutputs_T_122"} : i1, i1, i1, i1, i1, i1, i1, i1, i1
    %417 = comb.icmp bin eq %416, %c-1_i9 {sv.namehint = "decoded_andMatrixOutputs_11_2_2"} : i9
    %418 = comb.extract %337 from 10 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_121"} : (i32) -> i1
    %419 = comb.extract %io_input_instr from 15 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_90"} : (i32) -> i1
    %420 = comb.concat %347, %344, %418, %339, %340, %419 {sv.namehint = "_decoded_andMatrixOutputs_T_123"} : i1, i1, i1, i1, i1, i1
    %421 = comb.icmp bin eq %420, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_2_2_2"} : i6
    %422 = comb.extract %337 from 11 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_122"} : (i32) -> i1
    %423 = comb.concat %347, %344, %422, %339, %340, %419 {sv.namehint = "_decoded_andMatrixOutputs_T_124"} : i1, i1, i1, i1, i1, i1
    %424 = comb.icmp bin eq %423, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_4_2_2"} : i6
    %425 = comb.concat %338, %350, %339, %340, %419 {sv.namehint = "_decoded_andMatrixOutputs_T_125"} : i1, i1, i1, i1, i1
    %426 = comb.icmp bin eq %425, %c-1_i5 {sv.namehint = "decoded_andMatrixOutputs_15_2_2"} : i5
    %427 = comb.extract %io_input_instr from 10 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_116"} : (i32) -> i1
    %428 = comb.extract %io_input_instr from 11 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_101"} : (i32) -> i1
    %429 = comb.concat %347, %344, %357, %427, %428, %339, %340, %419 {sv.namehint = "_decoded_andMatrixOutputs_T_126"} : i1, i1, i1, i1, i1, i1, i1, i1
    %430 = comb.icmp bin eq %429, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_18_2_2"} : i8
    %431 = comb.concat %347, %344, %427, %428, %358, %339, %340, %419 {sv.namehint = "_decoded_andMatrixOutputs_T_127"} : i1, i1, i1, i1, i1, i1, i1, i1
    %432 = comb.icmp bin eq %431, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_17_2_2"} : i8
    %433 = comb.extract %io_input_instr from 25 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_75"} : (i32) -> i1
    %434 = comb.concat %347, %350, %353, %355, %366, %357, %407, %433, %368, %369, %370, %371, %375, %372 {sv.namehint = "_decoded_andMatrixOutputs_T_128"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %435 = comb.icmp bin eq %434, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_13_2_2"} : i14
    %436 = comb.concat %346, %349, %352, %360, %362, %365, %374, %377, %379, %381, %387, %392, %395, %397, %402, %404, %409, %411, %413, %421, %424, %430, %432, %435 {sv.namehint = "_decoded_orMatrixOutputs_T_40"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %437 = comb.concat %399, %406 {sv.namehint = "_decoded_orMatrixOutputs_T_42"} : i1, i1
    %438 = comb.icmp bin ne %437, %c0_i2 {sv.namehint = "_wireNum_1_T_3"} : i2
    %439 = comb.concat %374, %377, %379, %381, %385, %409, %413, %435 {sv.namehint = "_decoded_orMatrixOutputs_T_44"} : i1, i1, i1, i1, i1, i1, i1, i1
    %440 = comb.icmp bin ne %439, %c0_i8 {sv.namehint = "_wireNum_1_T_4"} : i8
    %441 = comb.concat %343, %349, %360, %362, %365, %395, %402, %411, %415, %417, %421, %424 {sv.namehint = "_decoded_orMatrixOutputs_T_46"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %442 = comb.icmp bin ne %441, %c0_i12 {sv.namehint = "_wireNum_1_T_5"} : i12
    %443 = comb.concat %389, %392 {sv.namehint = "_decoded_orMatrixOutputs_T_48"} : i1, i1
    %444 = comb.icmp bin ne %443, %c0_i2 {sv.namehint = "_wireNum_1_T_6"} : i2
    %445 = comb.concat %430, %432 {sv.namehint = "_decoded_orMatrixOutputs_T_51"} : i1, i1
    %446 = comb.icmp bin ne %445, %c0_i2 {sv.namehint = "_wireNum_1_T_12"} : i2
    %447 = comb.icmp bin eq %436, %c0_i24 {sv.namehint = "_decoded_invMatrixOutputs_T_35"} : i24
    %448 = comb.xor bin %io_input_instr, %c-1_i32 {sv.namehint = "decoded_invInputs_3"} : i32
    %449 = comb.extract %io_input_instr from 0 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_129"} : (i32) -> i1
    %450 = comb.extract %io_input_instr from 1 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1_129"} : (i32) -> i1
    %451 = comb.extract %448 from 2 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_127"} : (i32) -> i1
    %452 = comb.extract %448 from 3 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_119"} : (i32) -> i1
    %453 = comb.extract %448 from 4 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_104"} : (i32) -> i1
    %454 = comb.extract %448 from 5 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_95"} : (i32) -> i1
    %455 = comb.extract %448 from 6 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_84"} : (i32) -> i1
    %456 = comb.extract %448 from 12 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_76"} : (i32) -> i1
    %457 = comb.concat %449, %450, %451, %452, %453, %454, %455, %456 {sv.namehint = "_decoded_andMatrixOutputs_T_129"} : i1, i1, i1, i1, i1, i1, i1, i1
    %458 = comb.icmp bin eq %457, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_5_2_3"} : i8
    %459 = comb.extract %448 from 13 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_77"} : (i32) -> i1
    %460 = comb.concat %449, %450, %451, %452, %453, %454, %455, %459 {sv.namehint = "_decoded_andMatrixOutputs_T_130"} : i1, i1, i1, i1, i1, i1, i1, i1
    %461 = comb.icmp bin eq %460, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_0_2_3"} : i8
    %462 = comb.extract %448 from 14 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_86"} : (i32) -> i1
    %463 = comb.concat %449, %450, %451, %452, %453, %455, %462 {sv.namehint = "_decoded_andMatrixOutputs_T_131"} : i1, i1, i1, i1, i1, i1, i1
    %464 = comb.icmp bin eq %463, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_11_2_3"} : i7
    %465 = comb.extract %io_input_instr from 5 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_98"} : (i32) -> i1
    %466 = comb.concat %449, %450, %451, %452, %453, %465, %459, %462 {sv.namehint = "_decoded_andMatrixOutputs_T_132"} : i1, i1, i1, i1, i1, i1, i1, i1
    %467 = comb.icmp bin eq %466, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_2_2_3"} : i8
    %468 = comb.extract %io_input_instr from 6 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_88"} : (i32) -> i1
    %469 = comb.concat %449, %450, %451, %452, %453, %465, %468, %459 {sv.namehint = "_decoded_andMatrixOutputs_T_133"} : i1, i1, i1, i1, i1, i1, i1, i1
    %470 = comb.icmp bin eq %469, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_4_2_3"} : i8
    %471 = comb.concat %449, %450, %452, %453, %465, %468, %456, %459, %462 {sv.namehint = "_decoded_andMatrixOutputs_T_134"} : i1, i1, i1, i1, i1, i1, i1, i1, i1
    %472 = comb.icmp bin eq %471, %c-1_i9 {sv.namehint = "decoded_andMatrixOutputs_8_2_3"} : i9
    %473 = comb.extract %io_input_instr from 2 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_133"} : (i32) -> i1
    %474 = comb.extract %io_input_instr from 3 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_125"} : (i32) -> i1
    %475 = comb.concat %449, %450, %473, %474, %453, %465, %468 {sv.namehint = "_decoded_andMatrixOutputs_T_135"} : i1, i1, i1, i1, i1, i1, i1
    %476 = comb.icmp bin eq %475, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_12_2_3"} : i7
    %477 = comb.extract %io_input_instr from 13 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_81"} : (i32) -> i1
    %478 = comb.extract %448 from 27 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_36"} : (i32) -> i1
    %479 = comb.extract %448 from 28 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_10_33"} : (i32) -> i1
    %480 = comb.concat %449, %450, %473, %474, %453, %465, %455, %477, %462, %478, %479 {sv.namehint = "_decoded_andMatrixOutputs_T_136"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %481 = comb.icmp bin eq %480, %c-1_i11 {sv.namehint = "decoded_andMatrixOutputs_1_2_3"} : i11
    %482 = comb.extract %448 from 0 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_137"} : (i32) -> i1
    %483 = comb.extract %io_input_instr from 14 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_82"} : (i32) -> i1
    %484 = comb.concat %482, %483 {sv.namehint = "_decoded_andMatrixOutputs_T_137"} : i1, i1
    %485 = comb.icmp bin eq %484, %c-1_i2 {sv.namehint = "decoded_andMatrixOutputs_9_2_3"} : i2
    %486 = comb.extract %448 from 1 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1_138"} : (i32) -> i1
    %487 = comb.concat %482, %486, %483 {sv.namehint = "_decoded_andMatrixOutputs_T_138"} : i1, i1, i1
    %488 = comb.icmp bin eq %487, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_14_2_3"} : i3
    %489 = comb.concat %482, %450, %483 {sv.namehint = "_decoded_andMatrixOutputs_T_139"} : i1, i1, i1
    %490 = comb.icmp bin eq %489, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_16_2_3"} : i3
    %491 = comb.concat %449, %450, %451, %452, %453, %465, %468, %483 {sv.namehint = "_decoded_andMatrixOutputs_T_140"} : i1, i1, i1, i1, i1, i1, i1, i1
    %492 = comb.icmp bin eq %491, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_13_2_3"} : i8
    %493 = comb.extract %io_input_instr from 15 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_128"} : (i32) -> i1
    %494 = comb.concat %449, %486, %477, %493 {sv.namehint = "_decoded_andMatrixOutputs_T_141"} : i1, i1, i1, i1
    %495 = comb.icmp bin eq %494, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_10_2_3"} : i4
    %496 = comb.concat %486, %483, %493 {sv.namehint = "_decoded_andMatrixOutputs_T_142"} : i1, i1, i1
    %497 = comb.icmp bin eq %496, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_15_2_3"} : i3
    %498 = comb.concat %449, %486, %483, %493 {sv.namehint = "_decoded_andMatrixOutputs_T_143"} : i1, i1, i1, i1
    %499 = comb.icmp bin eq %498, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_6_2_3"} : i4
    %500 = comb.extract %io_input_instr from 27 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_37"} : (i32) -> i1
    %501 = comb.extract %448 from 29 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_16_5"} : (i32) -> i1
    %502 = comb.extract %448 from 30 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_17_5"} : (i32) -> i1
    %503 = comb.extract %448 from 31 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_18_5"} : (i32) -> i1
    %504 = comb.concat %449, %450, %473, %474, %453, %465, %455, %477, %462, %500, %501, %502, %503 {sv.namehint = "_decoded_andMatrixOutputs_T_144"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %505 = comb.icmp bin eq %504, %c-1_i13 {sv.namehint = "decoded_andMatrixOutputs_7_2_3"} : i13
    %506 = comb.extract %448 from 20 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_38"} : (i32) -> i1
    %507 = comb.extract %448 from 21 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_10_35"} : (i32) -> i1
    %508 = comb.extract %448 from 22 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_11_32"} : (i32) -> i1
    %509 = comb.extract %448 from 23 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_12_32"} : (i32) -> i1
    %510 = comb.extract %448 from 24 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_13_26"} : (i32) -> i1
    %511 = comb.extract %io_input_instr from 28 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_15_5"} : (i32) -> i1
    %512 = comb.concat %449, %450, %473, %474, %453, %465, %455, %477, %462, %506, %507, %508, %509, %510, %478, %511, %501, %502, %503 {sv.namehint = "_decoded_andMatrixOutputs_T_145"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %513 = comb.icmp bin eq %512, %c-1_i19 {sv.namehint = "decoded_andMatrixOutputs_3_2_3"} : i19
    %514 = comb.concat %458, %461, %464, %467, %472, %476, %481, %485, %492, %495, %497, %505, %513 {sv.namehint = "_decoded_orMatrixOutputs_T_53"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %515 = comb.concat %458, %461, %464, %481, %505, %513 {sv.namehint = "_decoded_orMatrixOutputs_T_55"} : i1, i1, i1, i1, i1, i1
    %516 = comb.icmp bin ne %515, %c0_i6 {sv.namehint = "_wireNum_2_T_3"} : i6
    %517 = comb.concat %470, %472, %476, %492, %495, %499 {sv.namehint = "_decoded_orMatrixOutputs_T_57"} : i1, i1, i1, i1, i1, i1
    %518 = comb.icmp bin ne %517, %c0_i6 {sv.namehint = "_wireNum_2_T_5"} : i6
    %519 = comb.icmp bin eq %514, %c0_i13 {sv.namehint = "_decoded_invMatrixOutputs_T_51"} : i13
    %520 = comb.extract %io_input_instr from 0 : (i32) -> i15
    %521 = comb.xor bin %520, %c-1_i15 {sv.namehint = "decoded_invInputs_4"} : i15
    %522 = comb.extract %io_input_instr from 0 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_146"} : (i32) -> i1
    %523 = comb.extract %io_input_instr from 1 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1_146"} : (i32) -> i1
    %524 = comb.extract %521 from 2 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_143"} : (i15) -> i1
    %525 = comb.extract %521 from 3 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_132"} : (i15) -> i1
    %526 = comb.extract %521 from 4 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_115"} : (i15) -> i1
    %527 = comb.extract %521 from 5 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_106"} : (i15) -> i1
    %528 = comb.extract %521 from 6 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_95"} : (i15) -> i1
    %529 = comb.extract %521 from 12 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_85"} : (i15) -> i1
    %530 = comb.concat %522, %523, %524, %525, %526, %527, %528, %529 {sv.namehint = "_decoded_andMatrixOutputs_T_146"} : i1, i1, i1, i1, i1, i1, i1, i1
    %531 = comb.icmp bin eq %530, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_2_2_4"} : i8
    %532 = comb.extract %521 from 13 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_86"} : (i15) -> i1
    %533 = comb.concat %522, %523, %524, %525, %526, %527, %528, %532 {sv.namehint = "_decoded_andMatrixOutputs_T_147"} : i1, i1, i1, i1, i1, i1, i1, i1
    %534 = comb.icmp bin eq %533, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_0_2_4"} : i8
    %535 = comb.extract %521 from 14 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_97"} : (i15) -> i1
    %536 = comb.concat %522, %523, %524, %525, %526, %528, %535 {sv.namehint = "_decoded_andMatrixOutputs_T_148"} : i1, i1, i1, i1, i1, i1, i1
    %537 = comb.icmp bin eq %536, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_1_2_4"} : i7
    %538 = comb.extract %521 from 0 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_149"} : (i15) -> i1
    %539 = comb.extract %io_input_instr from 14 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1_149"} : (i32) -> i1
    %540 = comb.concat %538, %539 {sv.namehint = "_decoded_andMatrixOutputs_T_149"} : i1, i1
    %541 = comb.icmp bin eq %540, %c-1_i2 {sv.namehint = "decoded_andMatrixOutputs_3_2_4"} : i2
    %542 = comb.extract %io_input_instr from 15 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_135"} : (i32) -> i1
    %543 = comb.concat %538, %523, %532, %542 {sv.namehint = "_decoded_andMatrixOutputs_T_150"} : i1, i1, i1, i1
    %544 = comb.icmp bin eq %543, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_5_2_4"} : i4
    %545 = comb.concat %538, %523, %532, %535, %542 {sv.namehint = "_decoded_andMatrixOutputs_T_151"} : i1, i1, i1, i1, i1
    %546 = comb.icmp bin eq %545, %c-1_i5 {sv.namehint = "decoded_andMatrixOutputs_4_2_4"} : i5
    %547 = comb.concat %531, %534, %537, %541, %544 {sv.namehint = "_decoded_orMatrixOutputs_T_61"} : i1, i1, i1, i1, i1
    %548 = comb.concat %531, %534, %537, %541 {sv.namehint = "_decoded_orMatrixOutputs_T_63"} : i1, i1, i1, i1
    %549 = comb.icmp bin ne %548, %c0_i4 {sv.namehint = "_wireNum_3_T_5"} : i4
    %550 = comb.icmp bin eq %547, %c0_i5 {sv.namehint = "_decoded_invMatrixOutputs_T_67"} : i5
    %551 = comb.xor bin %io_input_instr, %c-1_i32 {sv.namehint = "decoded_invInputs_5"} : i32
    %552 = comb.extract %551 from 1 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_152"} : (i32) -> i1
    %553 = comb.extract %551 from 13 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_88"} : (i32) -> i1
    %554 = comb.extract %551 from 14 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_8_51"} : (i32) -> i1
    %555 = comb.extract %551 from 15 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_137"} : (i32) -> i1
    %556 = comb.concat %552, %553, %554, %555 {sv.namehint = "_decoded_andMatrixOutputs_T_152"} : i1, i1, i1, i1
    %557 = comb.icmp bin eq %556, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_4_2_5"} : i4
    %558 = comb.extract %io_input_instr from 0 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_153"} : (i32) -> i1
    %559 = comb.concat %558, %552, %555 {sv.namehint = "_decoded_andMatrixOutputs_T_153"} : i1, i1, i1
    %560 = comb.icmp bin eq %559, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_61_2"} : i3
    %561 = comb.extract %551 from 0 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_154"} : (i32) -> i1
    %562 = comb.extract %io_input_instr from 1 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1_154"} : (i32) -> i1
    %563 = comb.concat %561, %562, %553, %554 {sv.namehint = "_decoded_andMatrixOutputs_T_154"} : i1, i1, i1, i1
    %564 = comb.icmp bin eq %563, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_70_2"} : i4
    %565 = comb.concat %561, %562, %553, %554, %555 {sv.namehint = "_decoded_andMatrixOutputs_T_155"} : i1, i1, i1, i1, i1
    %566 = comb.icmp bin eq %565, %c-1_i5 {sv.namehint = "decoded_andMatrixOutputs_78_2"} : i5
    %567 = comb.extract %551 from 2 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_152"} : (i32) -> i1
    %568 = comb.extract %551 from 3 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_140"} : (i32) -> i1
    %569 = comb.extract %io_input_instr from 4 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_120"} : (i32) -> i1
    %570 = comb.extract %551 from 5 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_109"} : (i32) -> i1
    %571 = comb.extract %551 from 6 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_98"} : (i32) -> i1
    %572 = comb.extract %551 from 12 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_87"} : (i32) -> i1
    %573 = comb.concat %558, %562, %567, %568, %569, %570, %571, %572 {sv.namehint = "_decoded_andMatrixOutputs_T_156"} : i1, i1, i1, i1, i1, i1, i1, i1
    %574 = comb.icmp bin eq %573, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_36_2_2"} : i8
    %575 = comb.concat %558, %562, %567, %569, %570, %571, %572, %553, %554 {sv.namehint = "_decoded_andMatrixOutputs_T_157"} : i1, i1, i1, i1, i1, i1, i1, i1, i1
    %576 = comb.icmp bin eq %575, %c-1_i9 {sv.namehint = "decoded_andMatrixOutputs_39_2_2"} : i9
    %577 = comb.extract %io_input_instr from 2 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_154"} : (i32) -> i1
    %578 = comb.concat %558, %562, %577, %568, %569, %571 {sv.namehint = "_decoded_andMatrixOutputs_T_158"} : i1, i1, i1, i1, i1, i1
    %579 = comb.icmp bin eq %578, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_23_2_3"} : i6
    %580 = comb.extract %551 from 4 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_123"} : (i32) -> i1
    %581 = comb.extract %io_input_instr from 5 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_112"} : (i32) -> i1
    %582 = comb.concat %558, %562, %567, %568, %580, %581, %571, %554 {sv.namehint = "_decoded_andMatrixOutputs_T_159"} : i1, i1, i1, i1, i1, i1, i1, i1
    %583 = comb.icmp bin eq %582, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_56_2"} : i8
    %584 = comb.extract %551 from 25 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_39"} : (i32) -> i1
    %585 = comb.extract %551 from 26 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_91"} : (i32) -> i1
    %586 = comb.extract %551 from 27 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_8_53"} : (i32) -> i1
    %587 = comb.extract %551 from 28 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_40"} : (i32) -> i1
    %588 = comb.extract %551 from 29 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_13_27"} : (i32) -> i1
    %589 = comb.extract %551 from 31 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_15_6"} : (i32) -> i1
    %590 = comb.concat %558, %562, %567, %569, %581, %571, %572, %553, %554, %584, %585, %586, %587, %588, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_160"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %591 = comb.icmp bin eq %590, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_76_2"} : i15
    %592 = comb.extract %551 from 30 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_15_9"} : (i32) -> i1
    %593 = comb.concat %558, %562, %567, %568, %569, %581, %571, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_161"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %594 = comb.icmp bin eq %593, %c-1_i13 {sv.namehint = "decoded_andMatrixOutputs_7_2_4"} : i13
    %595 = comb.concat %558, %562, %567, %569, %581, %571, %572, %553, %554, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_162"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %596 = comb.icmp bin eq %595, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_43_2_1"} : i15
    %597 = comb.concat %558, %562, %567, %569, %581, %571, %553, %554, %584, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_163"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %598 = comb.icmp bin eq %597, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_21_2_3"} : i15
    %599 = comb.concat %558, %562, %567, %569, %581, %571, %572, %553, %554, %584, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_164"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %600 = comb.icmp bin eq %599, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_30_2_3"} : i16
    %601 = comb.extract %io_input_instr from 6 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_106"} : (i32) -> i1
    %602 = comb.concat %558, %562, %577, %568, %580, %581, %601, %572, %553, %554 {sv.namehint = "_decoded_andMatrixOutputs_T_165"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %603 = comb.icmp bin eq %602, %c-1_i10 {sv.namehint = "decoded_andMatrixOutputs_77_2"} : i10
    %604 = comb.extract %io_input_instr from 3 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_150"} : (i32) -> i1
    %605 = comb.concat %558, %562, %577, %604, %580, %581, %601 {sv.namehint = "_decoded_andMatrixOutputs_T_166"} : i1, i1, i1, i1, i1, i1, i1
    %606 = comb.icmp bin eq %605, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_62_2"} : i7
    %607 = comb.extract %io_input_instr from 12 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_97"} : (i32) -> i1
    %608 = comb.concat %558, %562, %567, %569, %570, %571, %607, %553, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_167"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %609 = comb.icmp bin eq %608, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_73_2"} : i14
    %610 = comb.concat %558, %562, %567, %568, %569, %570, %571, %607, %553, %554, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_168"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %611 = comb.icmp bin eq %610, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_10_2_4"} : i16
    %612 = comb.concat %558, %562, %567, %604, %569, %570, %571, %607, %553, %554, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_169"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %613 = comb.icmp bin eq %612, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_53_2_1"} : i16
    %614 = comb.concat %558, %562, %567, %568, %569, %581, %571, %607, %553, %554, %584, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_170"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %615 = comb.icmp bin eq %614, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_74_2"} : i17
    %616 = comb.concat %558, %562, %567, %604, %569, %581, %571, %607, %553, %554, %584, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_171"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %617 = comb.icmp bin eq %616, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_54_2"} : i17
    %618 = comb.extract %io_input_instr from 13 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_8_63"} : (i32) -> i1
    %619 = comb.concat %558, %552, %618, %554 {sv.namehint = "_decoded_andMatrixOutputs_T_172"} : i1, i1, i1, i1
    %620 = comb.icmp bin eq %619, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_34_2_2"} : i4
    %621 = comb.concat %558, %562, %567, %568, %569, %570, %571, %618 {sv.namehint = "_decoded_andMatrixOutputs_T_173"} : i1, i1, i1, i1, i1, i1, i1, i1
    %622 = comb.icmp bin eq %621, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_14_2_4"} : i8
    %623 = comb.concat %558, %562, %567, %568, %569, %570, %571, %572, %618, %554 {sv.namehint = "_decoded_andMatrixOutputs_T_174"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %624 = comb.icmp bin eq %623, %c-1_i10 {sv.namehint = "decoded_andMatrixOutputs_51_2_1"} : i10
    %625 = comb.concat %558, %562, %577, %604, %580, %581, %571, %618, %554, %586, %587 {sv.namehint = "_decoded_andMatrixOutputs_T_175"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %626 = comb.icmp bin eq %625, %c-1_i11 {sv.namehint = "decoded_andMatrixOutputs_13_2_4"} : i11
    %627 = comb.concat %558, %562, %577, %604, %580, %581, %571, %618, %554, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_176"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %628 = comb.icmp bin eq %627, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_17_2_3"} : i14
    %629 = comb.concat %558, %562, %567, %568, %569, %581, %571, %572, %618, %554, %584, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_177"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %630 = comb.icmp bin eq %629, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_19_2_3"} : i17
    %631 = comb.concat %558, %562, %567, %568, %569, %570, %571, %607, %618, %554 {sv.namehint = "_decoded_andMatrixOutputs_T_178"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %632 = comb.icmp bin eq %631, %c-1_i10 {sv.namehint = "decoded_andMatrixOutputs_20_2_3"} : i10
    %633 = comb.concat %558, %562, %567, %568, %569, %581, %571, %607, %618, %554, %584, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_179"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %634 = comb.icmp bin eq %633, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_58_2"} : i17
    %635 = comb.extract %io_input_instr from 14 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_56"} : (i32) -> i1
    %636 = comb.concat %558, %562, %567, %568, %569, %570, %571, %572, %553, %635 {sv.namehint = "_decoded_andMatrixOutputs_T_180"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %637 = comb.icmp bin eq %636, %c-1_i10 {sv.namehint = "decoded_andMatrixOutputs_64_2"} : i10
    %638 = comb.concat %558, %562, %567, %568, %569, %581, %571, %572, %553, %635, %584, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_181"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %639 = comb.icmp bin eq %638, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_35_2_2"} : i17
    %640 = comb.concat %558, %562, %567, %569, %570, %571, %607, %553, %635, %585, %586, %587, %588, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_182"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %641 = comb.icmp bin eq %640, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_44_2_1"} : i14
    %642 = comb.concat %558, %562, %567, %568, %569, %570, %571, %607, %553, %635, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_183"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %643 = comb.icmp bin eq %642, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_6_2_4"} : i16
    %644 = comb.concat %558, %562, %567, %604, %569, %570, %571, %607, %553, %635, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_184"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %645 = comb.icmp bin eq %644, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_65_2"} : i16
    %646 = comb.concat %558, %562, %567, %569, %581, %571, %607, %553, %635, %584, %585, %586, %587, %588, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_185"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %647 = comb.icmp bin eq %646, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_41_2_2"} : i15
    %648 = comb.concat %558, %562, %567, %568, %569, %581, %571, %607, %553, %635, %584, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_186"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %649 = comb.icmp bin eq %648, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_38_2_2"} : i17
    %650 = comb.concat %558, %562, %567, %604, %569, %581, %571, %607, %553, %635, %584, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_187"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %651 = comb.icmp bin eq %650, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_0_2_5"} : i17
    %652 = comb.concat %558, %562, %567, %568, %569, %570, %571, %572, %618, %635 {sv.namehint = "_decoded_andMatrixOutputs_T_188"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %653 = comb.icmp bin eq %652, %c-1_i10 {sv.namehint = "decoded_andMatrixOutputs_57_2"} : i10
    %654 = comb.concat %558, %562, %567, %568, %569, %581, %571, %572, %618, %635, %584, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_189"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %655 = comb.icmp bin eq %654, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_45_2_1"} : i17
    %656 = comb.concat %558, %562, %567, %568, %569, %570, %571, %607, %618, %635 {sv.namehint = "_decoded_andMatrixOutputs_T_190"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %657 = comb.icmp bin eq %656, %c-1_i10 {sv.namehint = "decoded_andMatrixOutputs_11_2_4"} : i10
    %658 = comb.concat %558, %562, %567, %568, %569, %581, %571, %607, %618, %635, %584, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_191"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %659 = comb.icmp bin eq %658, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_59_2"} : i17
    %660 = comb.extract %551 from 10 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_188"} : (i32) -> i1
    %661 = comb.extract %io_input_instr from 15 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_8_81"} : (i32) -> i1
    %662 = comb.concat %558, %552, %660, %553, %554, %661 {sv.namehint = "_decoded_andMatrixOutputs_T_192"} : i1, i1, i1, i1, i1, i1
    %663 = comb.icmp bin eq %662, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_28_2_3"} : i6
    %664 = comb.extract %551 from 11 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_189"} : (i32) -> i1
    %665 = comb.concat %558, %552, %664, %553, %554, %661 {sv.namehint = "_decoded_andMatrixOutputs_T_193"} : i1, i1, i1, i1, i1, i1
    %666 = comb.icmp bin eq %665, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_3_2_5"} : i6
    %667 = comb.concat %558, %552, %660, %664, %553, %554, %661 {sv.namehint = "_decoded_andMatrixOutputs_T_194"} : i1, i1, i1, i1, i1, i1, i1
    %668 = comb.icmp bin eq %667, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_1_2_5"} : i7
    %669 = comb.concat %561, %562, %553, %661 {sv.namehint = "_decoded_andMatrixOutputs_T_195"} : i1, i1, i1, i1
    %670 = comb.icmp bin eq %669, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_22_2_3"} : i4
    %671 = comb.extract %io_input_instr from 10 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_192"} : (i32) -> i1
    %672 = comb.concat %558, %552, %671, %664, %553, %554, %661 {sv.namehint = "_decoded_andMatrixOutputs_T_196"} : i1, i1, i1, i1, i1, i1, i1
    %673 = comb.icmp bin eq %672, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_60_2"} : i7
    %674 = comb.extract %io_input_instr from 11 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_181"} : (i32) -> i1
    %675 = comb.concat %558, %552, %660, %674, %553, %554, %661 {sv.namehint = "_decoded_andMatrixOutputs_T_197"} : i1, i1, i1, i1, i1, i1, i1
    %676 = comb.icmp bin eq %675, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_26_2_3"} : i7
    %677 = comb.concat %558, %552, %571, %671, %674, %553, %554, %661 {sv.namehint = "_decoded_andMatrixOutputs_T_198"} : i1, i1, i1, i1, i1, i1, i1, i1
    %678 = comb.icmp bin eq %677, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_27_2_3"} : i8
    %679 = comb.concat %558, %552, %570, %571, %671, %674, %553, %554, %661 {sv.namehint = "_decoded_andMatrixOutputs_T_199"} : i1, i1, i1, i1, i1, i1, i1, i1, i1
    %680 = comb.icmp bin eq %679, %c-1_i9 {sv.namehint = "decoded_andMatrixOutputs_46_2_1"} : i9
    %681 = comb.concat %558, %552, %671, %674, %572, %553, %554, %661 {sv.namehint = "_decoded_andMatrixOutputs_T_200"} : i1, i1, i1, i1, i1, i1, i1, i1
    %682 = comb.icmp bin eq %681, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_25_2_3"} : i8
    %683 = comb.concat %558, %552, %581, %571, %671, %674, %572, %553, %554, %661 {sv.namehint = "_decoded_andMatrixOutputs_T_201"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %684 = comb.icmp bin eq %683, %c-1_i10 {sv.namehint = "decoded_andMatrixOutputs_32_2_2"} : i10
    %685 = comb.concat %558, %552, %570, %601, %671, %674, %572, %553, %554, %661 {sv.namehint = "_decoded_andMatrixOutputs_T_202"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %686 = comb.icmp bin eq %685, %c-1_i10 {sv.namehint = "decoded_andMatrixOutputs_37_2_2"} : i10
    %687 = comb.concat %558, %552, %581, %601, %671, %674, %572, %553, %554, %661 {sv.namehint = "_decoded_andMatrixOutputs_T_203"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %688 = comb.icmp bin eq %687, %c-1_i10 {sv.namehint = "decoded_andMatrixOutputs_67_2"} : i10
    %689 = comb.concat %558, %552, %581, %571, %671, %674, %607, %553, %554, %661 {sv.namehint = "_decoded_andMatrixOutputs_T_204"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %690 = comb.icmp bin eq %689, %c-1_i10 {sv.namehint = "decoded_andMatrixOutputs_72_2"} : i10
    %691 = comb.concat %561, %635, %661 {sv.namehint = "_decoded_andMatrixOutputs_T_205"} : i1, i1, i1
    %692 = comb.icmp bin eq %691, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_40_2_2"} : i3
    %693 = comb.extract %io_input_instr from 25 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_72"} : (i32) -> i1
    %694 = comb.concat %558, %562, %567, %569, %581, %571, %572, %553, %554, %693, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_206"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %695 = comb.icmp bin eq %694, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_48_2_1"} : i16
    %696 = comb.concat %558, %562, %567, %568, %569, %581, %571, %607, %554, %693, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_207"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %697 = comb.icmp bin eq %696, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_75_2"} : i16
    %698 = comb.concat %558, %562, %567, %568, %569, %581, %571, %618, %554, %693, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_208"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %699 = comb.icmp bin eq %698, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_42_2_2"} : i16
    %700 = comb.concat %558, %562, %567, %569, %581, %571, %635, %693, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_209"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %701 = comb.icmp bin eq %700, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_8_2_4"} : i14
    %702 = comb.concat %558, %562, %567, %568, %569, %581, %571, %572, %553, %635, %693, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_210"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %703 = comb.icmp bin eq %702, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_15_2_4"} : i17
    %704 = comb.concat %558, %562, %567, %604, %569, %581, %571, %572, %553, %635, %693, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_211"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %705 = comb.icmp bin eq %704, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_2_2_5"} : i17
    %706 = comb.concat %558, %562, %567, %568, %569, %581, %571, %607, %553, %635, %693, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_212"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %707 = comb.icmp bin eq %706, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_55_2"} : i17
    %708 = comb.concat %558, %562, %567, %604, %569, %581, %571, %607, %553, %635, %693, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_213"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %709 = comb.icmp bin eq %708, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_9_2_4"} : i17
    %710 = comb.concat %558, %562, %567, %568, %569, %581, %571, %572, %618, %635, %693, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_214"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %711 = comb.icmp bin eq %710, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_47_2_1"} : i17
    %712 = comb.concat %558, %562, %567, %604, %569, %581, %571, %572, %618, %635, %693, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_215"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %713 = comb.icmp bin eq %712, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_50_2_1"} : i17
    %714 = comb.concat %558, %562, %567, %568, %569, %581, %571, %607, %618, %635, %693, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_216"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %715 = comb.icmp bin eq %714, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_79_2"} : i17
    %716 = comb.concat %558, %562, %567, %604, %569, %581, %571, %607, %618, %635, %693, %585, %586, %587, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_217"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %717 = comb.icmp bin eq %716, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_66_2"} : i17
    %718 = comb.extract %551 from 20 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_84"} : (i32) -> i1
    %719 = comb.extract %551 from 21 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_10_71"} : (i32) -> i1
    %720 = comb.extract %551 from 22 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_11_67"} : (i32) -> i1
    %721 = comb.extract %551 from 23 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_12_67"} : (i32) -> i1
    %722 = comb.extract %551 from 24 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_13_60"} : (i32) -> i1
    %723 = comb.extract %io_input_instr from 28 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_15_31"} : (i32) -> i1
    %724 = comb.concat %558, %562, %577, %604, %580, %581, %571, %618, %554, %718, %719, %720, %721, %722, %586, %723, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_218"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %725 = comb.icmp bin eq %724, %c-1_i19 {sv.namehint = "decoded_andMatrixOutputs_33_2_2"} : i19
    %726 = comb.extract %io_input_instr from 27 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_85"} : (i32) -> i1
    %727 = comb.concat %558, %562, %577, %604, %580, %581, %571, %618, %554, %726, %723, %588, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_219"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %728 = comb.icmp bin eq %727, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_29_2_3"} : i14
    %729 = comb.extract %io_input_instr from 29 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_11_69"} : (i32) -> i1
    %730 = comb.concat %558, %562, %577, %604, %580, %581, %571, %618, %554, %586, %587, %729, %592, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_220"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %731 = comb.icmp bin eq %730, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_5_2_5"} : i14
    %732 = comb.extract %io_input_instr from 30 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_14_48"} : (i32) -> i1
    %733 = comb.concat %558, %562, %567, %569, %581, %571, %572, %553, %554, %584, %585, %586, %587, %588, %732, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_221"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %734 = comb.icmp bin eq %733, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_18_2_3"} : i16
    %735 = comb.concat %558, %562, %577, %604, %580, %581, %571, %618, %554, %586, %587, %588, %732, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_222"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %736 = comb.icmp bin eq %735, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_49_2_1"} : i14
    %737 = comb.concat %558, %562, %567, %568, %569, %570, %571, %607, %553, %635, %585, %586, %587, %588, %732, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_223"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %738 = comb.icmp bin eq %737, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_71_2"} : i16
    %739 = comb.concat %558, %562, %567, %604, %569, %570, %571, %607, %553, %635, %585, %586, %587, %588, %732, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_224"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %740 = comb.icmp bin eq %739, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_63_2"} : i16
    %741 = comb.concat %558, %562, %567, %568, %569, %581, %571, %607, %553, %635, %584, %585, %586, %587, %588, %732, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_225"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %742 = comb.icmp bin eq %741, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_24_2_3"} : i17
    %743 = comb.concat %558, %562, %567, %604, %569, %581, %571, %607, %553, %635, %584, %585, %586, %587, %588, %732, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_226"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %744 = comb.icmp bin eq %743, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_12_2_4"} : i17
    %745 = comb.concat %558, %562, %577, %604, %580, %581, %571, %618, %554, %586, %587, %729, %732, %589 {sv.namehint = "_decoded_andMatrixOutputs_T_227"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %746 = comb.icmp bin eq %745, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_69_2"} : i14
    %747 = comb.extract %io_input_instr from 31 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_13_70"} : (i32) -> i1
    %748 = comb.concat %558, %562, %577, %604, %580, %581, %571, %618, %554, %586, %587, %588, %592, %747 {sv.namehint = "_decoded_andMatrixOutputs_T_228"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %749 = comb.icmp bin eq %748, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_16_2_4"} : i14
    %750 = comb.concat %558, %562, %577, %604, %580, %581, %571, %618, %554, %586, %587, %729, %592, %747 {sv.namehint = "_decoded_andMatrixOutputs_T_229"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %751 = comb.icmp bin eq %750, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_31_2_3"} : i14
    %752 = comb.concat %558, %562, %577, %604, %580, %581, %571, %618, %554, %586, %587, %588, %732, %747 {sv.namehint = "_decoded_andMatrixOutputs_T_230"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %753 = comb.icmp bin eq %752, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_68_2"} : i14
    %754 = comb.concat %558, %562, %577, %604, %580, %581, %571, %618, %554, %586, %587, %729, %732, %747 {sv.namehint = "_decoded_andMatrixOutputs_T_231"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %755 = comb.icmp bin eq %754, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_52_2_1"} : i14
    %756 = comb.concat %557, %560, %564, %574, %576, %579, %583, %591, %594, %596, %598, %603, %606, %609, %620, %622, %626, %641, %647, %663, %666, %678, %682, %692, %701, %725, %728 {sv.namehint = "_decoded_orMatrixOutputs_T_66"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %757 = comb.concat %557, %560, %576, %579, %583, %600, %603, %606, %620, %628, %670, %690, %692 {sv.namehint = "_decoded_orMatrixOutputs_T_68"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %758 = comb.icmp bin ne %757, %c0_i13 {sv.namehint = "_decoded_invMatrixOutputs_T_84"} : i13
    %759 = comb.concat %680, %734 {sv.namehint = "_decoded_orMatrixOutputs_T_70"} : i1, i1
    %760 = comb.icmp bin ne %759, %c0_i2 {sv.namehint = "_decoded_invMatrixOutputs_T_85"} : i2
    %761 = comb.concat %657, %659, %676, %688, %746 {sv.namehint = "_decoded_orMatrixOutputs_T_72"} : i1, i1, i1, i1, i1
    %762 = comb.icmp bin ne %761, %c0_i5 {sv.namehint = "_decoded_invMatrixOutputs_T_86"} : i5
    %763 = comb.concat %653, %655, %686, %736 {sv.namehint = "_decoded_orMatrixOutputs_T_74"} : i1, i1, i1, i1
    %764 = comb.icmp bin ne %763, %c0_i4 {sv.namehint = "_decoded_invMatrixOutputs_T_87"} : i4
    %765 = comb.concat %637, %639, %684, %731 {sv.namehint = "_decoded_orMatrixOutputs_T_76"} : i1, i1, i1, i1
    %766 = comb.icmp bin ne %765, %c0_i4 {sv.namehint = "_decoded_invMatrixOutputs_T_88"} : i4
    %767 = comb.concat %566, %611, %615, %725 {sv.namehint = "_decoded_orMatrixOutputs_T_78"} : i1, i1, i1, i1
    %768 = comb.icmp bin ne %767, %c0_i4 {sv.namehint = "_decoded_invMatrixOutputs_T_90"} : i4
    %769 = comb.concat %673, %728, %738, %742 {sv.namehint = "_decoded_orMatrixOutputs_T_80"} : i1, i1, i1, i1
    %770 = comb.icmp bin ne %769, %c0_i4 {sv.namehint = "_decoded_invMatrixOutputs_T_91"} : i4
    %771 = comb.concat %643, %649, %668 {sv.namehint = "_decoded_orMatrixOutputs_T_82"} : i1, i1, i1
    %772 = comb.icmp bin ne %771, %c0_i3 {sv.namehint = "_decoded_invMatrixOutputs_T_92"} : i3
    %773 = comb.concat %624, %630 {sv.namehint = "_decoded_orMatrixOutputs_T_84"} : i1, i1
    %774 = comb.icmp bin ne %773, %c0_i2 {sv.namehint = "_decoded_invMatrixOutputs_T_93"} : i2
    %775 = comb.concat %632, %634 {sv.namehint = "_decoded_orMatrixOutputs_T_86"} : i1, i1
    %776 = comb.icmp bin ne %775, %c0_i2 {sv.namehint = "_decoded_invMatrixOutputs_T_94"} : i2
    %777 = comb.concat %613, %617 {sv.namehint = "_decoded_orMatrixOutputs_T_88"} : i1, i1
    %778 = comb.icmp bin ne %777, %c0_i2 {sv.namehint = "_decoded_invMatrixOutputs_T_95"} : i2
    %779 = comb.concat %645, %651 {sv.namehint = "_decoded_orMatrixOutputs_T_90"} : i1, i1
    %780 = comb.icmp bin ne %779, %c0_i2 {sv.namehint = "_decoded_invMatrixOutputs_T_96"} : i2
    %781 = comb.concat %740, %744 {sv.namehint = "_decoded_orMatrixOutputs_T_92"} : i1, i1
    %782 = comb.icmp bin ne %781, %c0_i2 {sv.namehint = "_decoded_invMatrixOutputs_T_97"} : i2
    %783 = comb.concat %697, %699 {sv.namehint = "_decoded_orMatrixOutputs_T_100"} : i1, i1
    %784 = comb.icmp bin ne %783, %c0_i2 {sv.namehint = "_decoded_invMatrixOutputs_T_104"} : i2
    %785 = comb.icmp bin eq %756, %c0_i27 {sv.namehint = "_decoded_invMatrixOutputs_T_83"} : i27
    %786 = comb.concat %c0_i2, %753, %755, %749, %751, %705, %717, %709, %784, %707, %715, %703, %711, %713, %695, %782, %780, %778, %776, %774, %772, %770, %768, %false, %766, %764, %762, %760, %758, %785 {sv.namehint = "decoded_5"} : i2, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %787 = comb.xor bin %io_input_instr, %c-1_i32 {sv.namehint = "decoded_invInputs_6"} : i32
    %788 = comb.extract %787 from 1 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_232"} : (i32) -> i1
    %789 = comb.extract %787 from 13 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1_232"} : (i32) -> i1
    %790 = comb.extract %787 from 15 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_228"} : (i32) -> i1
    %791 = comb.concat %788, %789, %790 {sv.namehint = "_decoded_andMatrixOutputs_T_232"} : i1, i1, i1
    %792 = comb.icmp bin eq %791, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_13_2_5"} : i3
    %793 = comb.extract %io_input_instr from 0 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_233"} : (i32) -> i1
    %794 = comb.concat %793, %788, %790 {sv.namehint = "_decoded_andMatrixOutputs_T_233"} : i1, i1, i1
    %795 = comb.icmp bin eq %794, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_24_2_4"} : i3
    %796 = comb.extract %787 from 0 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_234"} : (i32) -> i1
    %797 = comb.extract %io_input_instr from 1 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1_234"} : (i32) -> i1
    %798 = comb.extract %787 from 14 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_215"} : (i32) -> i1
    %799 = comb.concat %796, %797, %789, %798 {sv.namehint = "_decoded_andMatrixOutputs_T_234"} : i1, i1, i1, i1
    %800 = comb.icmp bin eq %799, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_9_2_5"} : i4
    %801 = comb.extract %787 from 2 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_231"} : (i32) -> i1
    %802 = comb.extract %787 from 3 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_216"} : (i32) -> i1
    %803 = comb.extract %787 from 5 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_193"} : (i32) -> i1
    %804 = comb.extract %787 from 6 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_182"} : (i32) -> i1
    %805 = comb.extract %787 from 12 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_168"} : (i32) -> i1
    %806 = comb.concat %793, %797, %801, %802, %803, %804, %805 {sv.namehint = "_decoded_andMatrixOutputs_T_235"} : i1, i1, i1, i1, i1, i1, i1
    %807 = comb.icmp bin eq %806, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_22_2_4"} : i7
    %808 = comb.extract %787 from 4 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_194"} : (i32) -> i1
    %809 = comb.concat %793, %797, %801, %802, %808, %803, %804, %789 {sv.namehint = "_decoded_andMatrixOutputs_T_236"} : i1, i1, i1, i1, i1, i1, i1, i1
    %810 = comb.icmp bin eq %809, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_11_2_5"} : i8
    %811 = comb.concat %793, %797, %801, %802, %808, %803, %804, %798 {sv.namehint = "_decoded_andMatrixOutputs_T_237"} : i1, i1, i1, i1, i1, i1, i1, i1
    %812 = comb.icmp bin eq %811, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_23_2_4"} : i8
    %813 = comb.extract %io_input_instr from 4 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_219"} : (i32) -> i1
    %814 = comb.concat %793, %797, %801, %813, %803, %804, %805, %789, %798 {sv.namehint = "_decoded_andMatrixOutputs_T_238"} : i1, i1, i1, i1, i1, i1, i1, i1, i1
    %815 = comb.icmp bin eq %814, %c-1_i9 {sv.namehint = "decoded_andMatrixOutputs_19_2_4"} : i9
    %816 = comb.extract %io_input_instr from 2 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_235"} : (i32) -> i1
    %817 = comb.concat %793, %797, %816, %802, %813, %804 {sv.namehint = "_decoded_andMatrixOutputs_T_239"} : i1, i1, i1, i1, i1, i1
    %818 = comb.icmp bin eq %817, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_16_2_5"} : i6
    %819 = comb.extract %io_input_instr from 5 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_198"} : (i32) -> i1
    %820 = comb.extract %787 from 25 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_98"} : (i32) -> i1
    %821 = comb.extract %787 from 26 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_10_85"} : (i32) -> i1
    %822 = comb.extract %787 from 27 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_11_81"} : (i32) -> i1
    %823 = comb.extract %787 from 28 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_99"} : (i32) -> i1
    %824 = comb.extract %787 from 29 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_13_74"} : (i32) -> i1
    %825 = comb.extract %787 from 31 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_18_7"} : (i32) -> i1
    %826 = comb.concat %793, %797, %801, %813, %819, %804, %805, %789, %798, %820, %821, %822, %823, %824, %825 {sv.namehint = "_decoded_andMatrixOutputs_T_240"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %827 = comb.icmp bin eq %826, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_27_2_4"} : i15
    %828 = comb.extract %787 from 30 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_17_7"} : (i32) -> i1
    %829 = comb.concat %793, %797, %801, %802, %813, %819, %804, %821, %822, %823, %824, %828, %825 {sv.namehint = "_decoded_andMatrixOutputs_T_241"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %830 = comb.icmp bin eq %829, %c-1_i13 {sv.namehint = "decoded_andMatrixOutputs_10_2_5"} : i13
    %831 = comb.concat %793, %797, %801, %813, %819, %804, %805, %789, %798, %821, %822, %823, %824, %828, %825 {sv.namehint = "_decoded_andMatrixOutputs_T_242"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %832 = comb.icmp bin eq %831, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_21_2_4"} : i15
    %833 = comb.concat %793, %797, %801, %813, %819, %804, %789, %798, %820, %821, %822, %823, %824, %828, %825 {sv.namehint = "_decoded_andMatrixOutputs_T_243"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %834 = comb.icmp bin eq %833, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_15_2_5"} : i15
    %835 = comb.extract %io_input_instr from 6 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_176"} : (i32) -> i1
    %836 = comb.concat %793, %797, %816, %802, %808, %819, %835, %805, %789, %798 {sv.namehint = "_decoded_andMatrixOutputs_T_244"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %837 = comb.icmp bin eq %836, %c-1_i10 {sv.namehint = "decoded_andMatrixOutputs_28_2_4"} : i10
    %838 = comb.extract %io_input_instr from 3 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_226"} : (i32) -> i1
    %839 = comb.concat %793, %797, %816, %838, %808, %819, %835 {sv.namehint = "_decoded_andMatrixOutputs_T_245"} : i1, i1, i1, i1, i1, i1, i1
    %840 = comb.icmp bin eq %839, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_8_2_5"} : i7
    %841 = comb.extract %io_input_instr from 12 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_178"} : (i32) -> i1
    %842 = comb.concat %793, %797, %801, %813, %803, %804, %841, %789, %821, %822, %823, %824, %828, %825 {sv.namehint = "_decoded_andMatrixOutputs_T_246"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %843 = comb.icmp bin eq %842, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_26_2_4"} : i14
    %844 = comb.concat %793, %797, %801, %802, %813, %819, %835, %841 {sv.namehint = "_decoded_andMatrixOutputs_T_247"} : i1, i1, i1, i1, i1, i1, i1, i1
    %845 = comb.icmp bin eq %844, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_25_2_4"} : i8
    %846 = comb.extract %io_input_instr from 13 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_163"} : (i32) -> i1
    %847 = comb.concat %793, %797, %801, %802, %813, %803, %804, %846 {sv.namehint = "_decoded_andMatrixOutputs_T_248"} : i1, i1, i1, i1, i1, i1, i1, i1
    %848 = comb.icmp bin eq %847, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_0_2_6"} : i8
    %849 = comb.concat %793, %797, %816, %838, %808, %819, %804, %846, %798, %822, %823 {sv.namehint = "_decoded_andMatrixOutputs_T_249"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %850 = comb.icmp bin eq %849, %c-1_i11 {sv.namehint = "decoded_andMatrixOutputs_14_2_5"} : i11
    %851 = comb.concat %793, %797, %801, %802, %813, %819, %835, %846 {sv.namehint = "_decoded_andMatrixOutputs_T_250"} : i1, i1, i1, i1, i1, i1, i1, i1
    %852 = comb.icmp bin eq %851, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_7_2_5"} : i8
    %853 = comb.extract %io_input_instr from 14 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1_251"} : (i32) -> i1
    %854 = comb.concat %796, %853, %790 {sv.namehint = "_decoded_andMatrixOutputs_T_251"} : i1, i1, i1
    %855 = comb.icmp bin eq %854, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_3_2_6"} : i3
    %856 = comb.concat %793, %797, %801, %813, %803, %804, %841, %789, %853, %821, %822, %823, %824, %825 {sv.namehint = "_decoded_andMatrixOutputs_T_252"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %857 = comb.icmp bin eq %856, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_5_2_6"} : i14
    %858 = comb.concat %793, %797, %801, %813, %819, %804, %841, %789, %853, %820, %821, %822, %823, %824, %825 {sv.namehint = "_decoded_andMatrixOutputs_T_253"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %859 = comb.icmp bin eq %858, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_20_2_4"} : i15
    %860 = comb.extract %787 from 10 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_250"} : (i32) -> i1
    %861 = comb.extract %io_input_instr from 15 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_200"} : (i32) -> i1
    %862 = comb.concat %793, %788, %860, %789, %798, %861 {sv.namehint = "_decoded_andMatrixOutputs_T_254"} : i1, i1, i1, i1, i1, i1
    %863 = comb.icmp bin eq %862, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_1_2_6"} : i6
    %864 = comb.extract %787 from 11 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_251"} : (i32) -> i1
    %865 = comb.concat %793, %788, %864, %789, %798, %861 {sv.namehint = "_decoded_andMatrixOutputs_T_255"} : i1, i1, i1, i1, i1, i1
    %866 = comb.icmp bin eq %865, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_4_2_6"} : i6
    %867 = comb.extract %io_input_instr from 10 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_236"} : (i32) -> i1
    %868 = comb.extract %io_input_instr from 11 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_213"} : (i32) -> i1
    %869 = comb.concat %793, %788, %804, %867, %868, %789, %798, %861 {sv.namehint = "_decoded_andMatrixOutputs_T_256"} : i1, i1, i1, i1, i1, i1, i1, i1
    %870 = comb.icmp bin eq %869, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_18_2_4"} : i8
    %871 = comb.concat %793, %788, %867, %868, %805, %789, %798, %861 {sv.namehint = "_decoded_andMatrixOutputs_T_257"} : i1, i1, i1, i1, i1, i1, i1, i1
    %872 = comb.icmp bin eq %871, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_17_2_4"} : i8
    %873 = comb.extract %io_input_instr from 25 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_170"} : (i32) -> i1
    %874 = comb.concat %793, %797, %801, %813, %819, %804, %853, %873, %821, %822, %823, %824, %828, %825 {sv.namehint = "_decoded_andMatrixOutputs_T_258"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %875 = comb.icmp bin eq %874, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_12_2_5"} : i14
    %876 = comb.extract %io_input_instr from 27 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_108"} : (i32) -> i1
    %877 = comb.concat %793, %797, %816, %838, %808, %819, %804, %846, %798, %876, %824, %828, %825 {sv.namehint = "_decoded_andMatrixOutputs_T_259"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %878 = comb.icmp bin eq %877, %c-1_i13 {sv.namehint = "decoded_andMatrixOutputs_6_2_5"} : i13
    %879 = comb.extract %787 from 20 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_109"} : (i32) -> i1
    %880 = comb.extract %787 from 21 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_10_95"} : (i32) -> i1
    %881 = comb.extract %787 from 22 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_11_90"} : (i32) -> i1
    %882 = comb.extract %787 from 23 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_12_90"} : (i32) -> i1
    %883 = comb.extract %787 from 24 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_13_81"} : (i32) -> i1
    %884 = comb.extract %io_input_instr from 28 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_15_37"} : (i32) -> i1
    %885 = comb.concat %793, %797, %816, %838, %808, %819, %804, %846, %798, %879, %880, %881, %882, %883, %822, %884, %824, %828, %825 {sv.namehint = "_decoded_andMatrixOutputs_T_260"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %886 = comb.icmp bin eq %885, %c-1_i19 {sv.namehint = "decoded_andMatrixOutputs_2_2_6"} : i19
    %887 = comb.concat %792, %795, %800, %807, %810, %812, %815, %818, %827, %830, %832, %834, %837, %840, %843, %845, %848, %850, %852, %855, %857, %859, %863, %866, %870, %872, %875, %878, %886 {sv.namehint = "_decoded_orMatrixOutputs_T_109"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %888 = comb.icmp bin ne %887, %c0_i29 {sv.namehint = "decoded_6"} : i29
    %889 = comb.xor bin %io_input_instr, %c-1_i32 {sv.namehint = "decoded_invInputs_7"} : i32
    %890 = comb.extract %889 from 1 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_261"} : (i32) -> i1
    %891 = comb.extract %889 from 13 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1_261"} : (i32) -> i1
    %892 = comb.extract %889 from 15 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_257"} : (i32) -> i1
    %893 = comb.concat %890, %891, %892 {sv.namehint = "_decoded_andMatrixOutputs_T_261"} : i1, i1, i1
    %894 = comb.icmp bin eq %893, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_7_2_6"} : i3
    %895 = comb.extract %889 from 0 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_262"} : (i32) -> i1
    %896 = comb.extract %io_input_instr from 1 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1_262"} : (i32) -> i1
    %897 = comb.concat %895, %896, %891 {sv.namehint = "_decoded_andMatrixOutputs_T_262"} : i1, i1, i1
    %898 = comb.icmp bin eq %897, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_26_2_5"} : i3
    %899 = comb.extract %io_input_instr from 0 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_0_263"} : (i32) -> i1
    %900 = comb.extract %889 from 2 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_259"} : (i32) -> i1
    %901 = comb.extract %889 from 3 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_241"} : (i32) -> i1
    %902 = comb.extract %889 from 5 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_218"} : (i32) -> i1
    %903 = comb.extract %889 from 6 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_207"} : (i32) -> i1
    %904 = comb.extract %889 from 12 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_190"} : (i32) -> i1
    %905 = comb.concat %899, %896, %900, %901, %902, %903, %904 {sv.namehint = "_decoded_andMatrixOutputs_T_263"} : i1, i1, i1, i1, i1, i1, i1
    %906 = comb.icmp bin eq %905, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_34_2_3"} : i7
    %907 = comb.extract %889 from 4 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_219"} : (i32) -> i1
    %908 = comb.concat %899, %896, %900, %901, %907, %902, %903, %904 {sv.namehint = "_decoded_andMatrixOutputs_T_264"} : i1, i1, i1, i1, i1, i1, i1, i1
    %909 = comb.icmp bin eq %908, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_37_2_3"} : i8
    %910 = comb.concat %899, %896, %900, %901, %907, %902, %903, %891 {sv.namehint = "_decoded_andMatrixOutputs_T_265"} : i1, i1, i1, i1, i1, i1, i1, i1
    %911 = comb.icmp bin eq %910, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_6_2_6"} : i8
    %912 = comb.extract %889 from 14 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_6_193"} : (i32) -> i1
    %913 = comb.concat %899, %896, %900, %901, %907, %903, %912 {sv.namehint = "_decoded_andMatrixOutputs_T_266"} : i1, i1, i1, i1, i1, i1, i1
    %914 = comb.icmp bin eq %913, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_14_2_6"} : i7
    %915 = comb.concat %899, %896, %900, %901, %907, %902, %903, %912 {sv.namehint = "_decoded_andMatrixOutputs_T_267"} : i1, i1, i1, i1, i1, i1, i1, i1
    %916 = comb.icmp bin eq %915, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_49_2_2"} : i8
    %917 = comb.extract %io_input_instr from 2 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_264"} : (i32) -> i1
    %918 = comb.extract %io_input_instr from 3 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_246"} : (i32) -> i1
    %919 = comb.concat %899, %896, %917, %918, %907, %902, %903, %904, %891, %912 {sv.namehint = "_decoded_andMatrixOutputs_T_268"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %920 = comb.icmp bin eq %919, %c-1_i10 {sv.namehint = "decoded_andMatrixOutputs_38_2_3"} : i10
    %921 = comb.extract %io_input_instr from 4 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_4_224"} : (i32) -> i1
    %922 = comb.concat %899, %896, %917, %901, %921, %903 {sv.namehint = "_decoded_andMatrixOutputs_T_269"} : i1, i1, i1, i1, i1, i1
    %923 = comb.icmp bin eq %922, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_0_2_7"} : i6
    %924 = comb.concat %899, %896, %900, %918, %921, %902, %903, %904, %891, %912 {sv.namehint = "_decoded_andMatrixOutputs_T_270"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %925 = comb.icmp bin eq %924, %c-1_i10 {sv.namehint = "decoded_andMatrixOutputs_20_2_5"} : i10
    %926 = comb.extract %io_input_instr from 5 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_215"} : (i32) -> i1
    %927 = comb.concat %899, %896, %900, %901, %907, %926, %903, %912 {sv.namehint = "_decoded_andMatrixOutputs_T_271"} : i1, i1, i1, i1, i1, i1, i1, i1
    %928 = comb.icmp bin eq %927, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_47_2_2"} : i8
    %929 = comb.extract %889 from 25 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_24_3"} : (i32) -> i1
    %930 = comb.extract %889 from 26 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_25_3"} : (i32) -> i1
    %931 = comb.extract %889 from 27 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_26_3"} : (i32) -> i1
    %932 = comb.extract %889 from 28 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_27_3"} : (i32) -> i1
    %933 = comb.extract %889 from 29 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_28_3"} : (i32) -> i1
    %934 = comb.extract %889 from 31 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_30_3"} : (i32) -> i1
    %935 = comb.concat %899, %896, %900, %901, %921, %926, %903, %904, %891, %912, %929, %930, %931, %932, %933, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_272"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %936 = comb.icmp bin eq %935, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_1_2_7"} : i16
    %937 = comb.extract %889 from 30 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_29_3"} : (i32) -> i1
    %938 = comb.concat %899, %896, %900, %901, %921, %926, %903, %930, %931, %932, %933, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_273"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %939 = comb.icmp bin eq %938, %c-1_i13 {sv.namehint = "decoded_andMatrixOutputs_5_2_7"} : i13
    %940 = comb.concat %899, %896, %900, %918, %921, %926, %903, %904, %891, %912, %929, %930, %931, %932, %933, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_274"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %941 = comb.icmp bin eq %940, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_13_2_6"} : i16
    %942 = comb.concat %899, %896, %900, %918, %921, %926, %903, %904, %891, %912, %930, %931, %932, %933, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_275"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %943 = comb.icmp bin eq %942, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_50_2_2"} : i16
    %944 = comb.concat %899, %896, %900, %918, %921, %926, %903, %891, %912, %929, %930, %931, %932, %933, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_276"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %945 = comb.icmp bin eq %944, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_45_2_2"} : i16
    %946 = comb.extract %io_input_instr from 6 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_221"} : (i32) -> i1
    %947 = comb.concat %899, %896, %901, %907, %926, %946, %904, %891, %912 {sv.namehint = "_decoded_andMatrixOutputs_T_277"} : i1, i1, i1, i1, i1, i1, i1, i1, i1
    %948 = comb.icmp bin eq %947, %c-1_i9 {sv.namehint = "decoded_andMatrixOutputs_48_2_2"} : i9
    %949 = comb.concat %899, %896, %918, %907, %926, %946 {sv.namehint = "_decoded_andMatrixOutputs_T_278"} : i1, i1, i1, i1, i1, i1
    %950 = comb.icmp bin eq %949, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_25_2_5"} : i6
    %951 = comb.concat %899, %896, %900, %918, %907, %926, %946 {sv.namehint = "_decoded_andMatrixOutputs_T_279"} : i1, i1, i1, i1, i1, i1, i1
    %952 = comb.icmp bin eq %951, %c-1_i7 {sv.namehint = "decoded_andMatrixOutputs_24_2_5"} : i7
    %953 = comb.extract %889 from 7 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_185"} : (i32) -> i1
    %954 = comb.extract %889 from 8 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_8_133"} : (i32) -> i1
    %955 = comb.extract %889 from 9 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_117"} : (i32) -> i1
    %956 = comb.extract %889 from 10 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_292"} : (i32) -> i1
    %957 = comb.extract %889 from 11 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_11_96"} : (i32) -> i1
    %958 = comb.extract %889 from 16 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_16_27"} : (i32) -> i1
    %959 = comb.extract %889 from 17 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_17_8"} : (i32) -> i1
    %960 = comb.extract %889 from 18 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_18_8"} : (i32) -> i1
    %961 = comb.extract %889 from 19 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_19_4"} : (i32) -> i1
    %962 = comb.extract %889 from 21 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_20_4"} : (i32) -> i1
    %963 = comb.extract %889 from 22 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_21_4"} : (i32) -> i1
    %964 = comb.extract %889 from 23 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_22_3"} : (i32) -> i1
    %965 = comb.extract %889 from 24 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_23_3"} : (i32) -> i1
    %966 = comb.concat %899, %896, %900, %901, %921, %926, %946, %953, %954, %955, %956, %957, %904, %891, %912, %892, %958, %959, %960, %961, %962, %963, %964, %965, %929, %930, %931, %932, %933, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_280"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %967 = comb.icmp bin eq %966, %c-1_i31 {sv.namehint = "decoded_andMatrixOutputs_29_2_4"} : i31
    %968 = comb.extract %889 from 20 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_20_5"} : (i32) -> i1
    %969 = comb.concat %899, %896, %900, %901, %921, %926, %946, %953, %954, %955, %956, %957, %904, %891, %912, %892, %958, %959, %960, %961, %968, %962, %963, %964, %965, %929, %930, %931, %932, %933, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_281"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %970 = comb.icmp bin eq %969, %c-1_i32 {sv.namehint = "decoded_andMatrixOutputs_11_2_6"} : i32
    %971 = comb.extract %io_input_instr from 12 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_7_187"} : (i32) -> i1
    %972 = comb.concat %899, %896, %917, %918, %907, %902, %903, %971, %891, %912 {sv.namehint = "_decoded_andMatrixOutputs_T_282"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %973 = comb.icmp bin eq %972, %c-1_i10 {sv.namehint = "decoded_andMatrixOutputs_10_2_6"} : i10
    %974 = comb.concat %899, %896, %900, %901, %921, %903, %971, %891, %930, %931, %932, %933, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_283"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %975 = comb.icmp bin eq %974, %c-1_i14 {sv.namehint = "decoded_andMatrixOutputs_46_2_2"} : i14
    %976 = comb.concat %899, %896, %900, %918, %921, %902, %903, %971, %891, %930, %931, %932, %933, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_284"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %977 = comb.icmp bin eq %976, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_43_2_2"} : i15
    %978 = comb.concat %899, %896, %900, %901, %926, %946, %971, %891 {sv.namehint = "_decoded_andMatrixOutputs_T_285"} : i1, i1, i1, i1, i1, i1, i1, i1
    %979 = comb.icmp bin eq %978, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_33_2_3"} : i8
    %980 = comb.extract %io_input_instr from 13 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_282"} : (i32) -> i1
    %981 = comb.concat %899, %890, %980, %912, %892 {sv.namehint = "_decoded_andMatrixOutputs_T_286"} : i1, i1, i1, i1, i1
    %982 = comb.icmp bin eq %981, %c-1_i5 {sv.namehint = "decoded_andMatrixOutputs_18_2_5"} : i5
    %983 = comb.concat %899, %896, %900, %901, %921, %902, %903, %980 {sv.namehint = "_decoded_andMatrixOutputs_T_287"} : i1, i1, i1, i1, i1, i1, i1, i1
    %984 = comb.icmp bin eq %983, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_9_2_6"} : i8
    %985 = comb.concat %899, %896, %917, %918, %907, %926, %903, %980, %912, %931, %932 {sv.namehint = "_decoded_andMatrixOutputs_T_288"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %986 = comb.icmp bin eq %985, %c-1_i11 {sv.namehint = "decoded_andMatrixOutputs_8_2_6"} : i11
    %987 = comb.concat %899, %896, %900, %901, %921, %926, %946, %980 {sv.namehint = "_decoded_andMatrixOutputs_T_289"} : i1, i1, i1, i1, i1, i1, i1, i1
    %988 = comb.icmp bin eq %987, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_52_2_2"} : i8
    %989 = comb.extract %io_input_instr from 14 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_1_290"} : (i32) -> i1
    %990 = comb.concat %895, %989 {sv.namehint = "_decoded_andMatrixOutputs_T_290"} : i1, i1
    %991 = comb.icmp bin eq %990, %c-1_i2 {sv.namehint = "decoded_andMatrixOutputs_4_2_7"} : i2
    %992 = comb.concat %890, %989 {sv.namehint = "_decoded_andMatrixOutputs_T_291"} : i1, i1
    %993 = comb.icmp bin eq %992, %c-1_i2 {sv.namehint = "decoded_andMatrixOutputs_30_2_4"} : i2
    %994 = comb.concat %895, %989, %892 {sv.namehint = "_decoded_andMatrixOutputs_T_292"} : i1, i1, i1
    %995 = comb.icmp bin eq %994, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_2_2_7"} : i3
    %996 = comb.concat %899, %896, %900, %901, %907, %926, %946, %989 {sv.namehint = "_decoded_andMatrixOutputs_T_293"} : i1, i1, i1, i1, i1, i1, i1, i1
    %997 = comb.icmp bin eq %996, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_3_2_7"} : i8
    %998 = comb.concat %899, %896, %900, %901, %921, %902, %903, %971, %891, %989, %930, %931, %932, %933, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_294"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %999 = comb.icmp bin eq %998, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_23_2_5"} : i15
    %1000 = comb.concat %899, %896, %900, %918, %921, %902, %903, %971, %891, %989, %930, %931, %932, %933, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_295"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1001 = comb.icmp bin eq %1000, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_17_2_5"} : i15
    %1002 = comb.concat %899, %896, %900, %901, %921, %926, %903, %971, %891, %989, %929, %930, %931, %932, %933, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_296"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1003 = comb.icmp bin eq %1002, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_22_2_5"} : i16
    %1004 = comb.concat %899, %896, %900, %918, %921, %926, %903, %971, %891, %989, %929, %930, %931, %932, %933, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_297"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1005 = comb.icmp bin eq %1004, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_40_2_3"} : i16
    %1006 = comb.extract %io_input_instr from 15 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_5_238"} : (i32) -> i1
    %1007 = comb.concat %899, %890, %956, %891, %912, %1006 {sv.namehint = "_decoded_andMatrixOutputs_T_298"} : i1, i1, i1, i1, i1, i1
    %1008 = comb.icmp bin eq %1007, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_19_2_5"} : i6
    %1009 = comb.concat %899, %890, %957, %891, %912, %1006 {sv.namehint = "_decoded_andMatrixOutputs_T_299"} : i1, i1, i1, i1, i1, i1
    %1010 = comb.icmp bin eq %1009, %c-1_i6 {sv.namehint = "decoded_andMatrixOutputs_27_2_5"} : i6
    %1011 = comb.extract %io_input_instr from 10 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_2_294"} : (i32) -> i1
    %1012 = comb.extract %io_input_instr from 11 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_3_275"} : (i32) -> i1
    %1013 = comb.concat %899, %890, %1011, %1012, %904, %891, %912, %1006 {sv.namehint = "_decoded_andMatrixOutputs_T_300"} : i1, i1, i1, i1, i1, i1, i1, i1
    %1014 = comb.icmp bin eq %1013, %c-1_i8 {sv.namehint = "decoded_andMatrixOutputs_15_2_6"} : i8
    %1015 = comb.concat %899, %890, %903, %1011, %1012, %971, %891, %912, %1006 {sv.namehint = "_decoded_andMatrixOutputs_T_301"} : i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1016 = comb.icmp bin eq %1015, %c-1_i9 {sv.namehint = "decoded_andMatrixOutputs_28_2_5"} : i9
    %1017 = comb.concat %899, %890, %980, %1006 {sv.namehint = "_decoded_andMatrixOutputs_T_302"} : i1, i1, i1, i1
    %1018 = comb.icmp bin eq %1017, %c-1_i4 {sv.namehint = "decoded_andMatrixOutputs_12_2_6"} : i4
    %1019 = comb.concat %895, %989, %1006 {sv.namehint = "_decoded_andMatrixOutputs_T_303"} : i1, i1, i1
    %1020 = comb.icmp bin eq %1019, %c-1_i3 {sv.namehint = "decoded_andMatrixOutputs_31_2_4"} : i3
    %1021 = comb.extract %io_input_instr from 25 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_127"} : (i32) -> i1
    %1022 = comb.concat %899, %896, %900, %901, %921, %926, %903, %980, %912, %1021, %930, %931, %932, %933, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_304"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1023 = comb.icmp bin eq %1022, %c-1_i16 {sv.namehint = "decoded_andMatrixOutputs_35_2_3"} : i16
    %1024 = comb.concat %899, %896, %900, %901, %921, %926, %903, %904, %980, %912, %1021, %930, %931, %932, %933, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_305"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1025 = comb.icmp bin eq %1024, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_39_2_3"} : i17
    %1026 = comb.concat %899, %896, %900, %901, %921, %926, %903, %971, %980, %912, %1021, %930, %931, %932, %933, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_306"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1027 = comb.icmp bin eq %1026, %c-1_i17 {sv.namehint = "decoded_andMatrixOutputs_32_2_3"} : i17
    %1028 = comb.concat %899, %896, %900, %918, %921, %926, %903, %989, %1021, %930, %931, %932, %933, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_307"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1029 = comb.icmp bin eq %1028, %c-1_i15 {sv.namehint = "decoded_andMatrixOutputs_36_2_3"} : i15
    %1030 = comb.extract %io_input_instr from 27 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_9_131"} : (i32) -> i1
    %1031 = comb.concat %899, %896, %917, %918, %907, %926, %903, %980, %912, %1030, %933, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_308"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1032 = comb.icmp bin eq %1031, %c-1_i13 {sv.namehint = "decoded_andMatrixOutputs_44_2_2"} : i13
    %1033 = comb.extract %io_input_instr from 28 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_28_5"} : (i32) -> i1
    %1034 = comb.concat %899, %896, %917, %918, %907, %926, %903, %980, %912, %968, %962, %963, %964, %965, %931, %1033, %933, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_309"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1035 = comb.icmp bin eq %1034, %c-1_i19 {sv.namehint = "decoded_andMatrixOutputs_21_2_5"} : i19
    %1036 = comb.extract %io_input_instr from 21 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_21_6"} : (i32) -> i1
    %1037 = comb.concat %899, %896, %900, %901, %921, %926, %946, %953, %954, %955, %956, %957, %904, %891, %912, %892, %958, %959, %960, %961, %968, %1036, %963, %964, %965, %929, %930, %931, %1033, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_310"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1038 = comb.icmp bin eq %1037, %c-1_i31 {sv.namehint = "decoded_andMatrixOutputs_51_2_2"} : i31
    %1039 = comb.concat %899, %896, %900, %901, %921, %926, %946, %953, %954, %955, %956, %957, %904, %891, %912, %892, %958, %959, %960, %961, %968, %1036, %963, %964, %965, %929, %930, %931, %1033, %933, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_311"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1040 = comb.icmp bin eq %1039, %c-1_i32 {sv.namehint = "decoded_andMatrixOutputs_16_2_6"} : i32
    %1041 = comb.extract %io_input_instr from 20 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_20_8"} : (i32) -> i1
    %1042 = comb.extract %io_input_instr from 22 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_22_7"} : (i32) -> i1
    %1043 = comb.concat %899, %896, %900, %901, %921, %926, %946, %953, %954, %955, %956, %957, %904, %891, %912, %892, %958, %959, %960, %961, %1041, %962, %1042, %964, %965, %929, %930, %931, %1033, %933, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_312"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1044 = comb.icmp bin eq %1043, %c-1_i32 {sv.namehint = "decoded_andMatrixOutputs_42_2_3"} : i32
    %1045 = comb.concat %899, %896, %900, %901, %921, %926, %946, %953, %954, %955, %956, %957, %904, %891, %912, %1021, %930, %931, %1033, %933, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_313"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1046 = comb.icmp bin eq %1045, %c-1_i22 {sv.namehint = "decoded_andMatrixOutputs_41_2_3"} : i22
    %1047 = comb.extract %io_input_instr from 29 {sv.namehint = "decoded_andMatrixOutputs_andMatrixInput_29_8"} : (i32) -> i1
    %1048 = comb.concat %899, %896, %900, %901, %921, %926, %946, %953, %954, %955, %956, %957, %904, %891, %912, %892, %958, %959, %960, %961, %968, %1036, %963, %964, %965, %929, %930, %931, %1033, %1047, %937, %934 {sv.namehint = "_decoded_andMatrixOutputs_T_314"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1049 = comb.icmp bin eq %1048, %c-1_i32 {sv.namehint = "decoded_andMatrixOutputs_53_2_2"} : i32
    %1050 = comb.concat %909, %911, %916, %925, %941, %943, %945, %952, %970, %977, %982, %986, %995, %1001, %1005, %1016, %1027, %1029, %1032, %1035, %1038 {sv.namehint = "_decoded_orMatrixOutputs_T_110"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1051 = comb.icmp bin ne %1050, %c0_i21 {sv.namehint = "_decoded_invMatrixOutputs_T_114"} : i21
    %1052 = comb.concat %928, %952, %970, %973, %986, %1020, %1025, %1032, %1035, %1049 {sv.namehint = "_decoded_orMatrixOutputs_T_112"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1053 = comb.icmp bin ne %1052, %c0_i10 {sv.namehint = "_decoded_invMatrixOutputs_T_115"} : i10
    %1054 = comb.concat %894, %898, %906, %911, %914, %920, %923, %936, %939, %948, %950, %970, %975, %979, %984, %988, %991, %993, %997, %999, %1003, %1008, %1010, %1014, %1018, %1044, %1046 {sv.namehint = "_decoded_orMatrixOutputs_T_114"} : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1055 = comb.concat %967, %973, %986, %1023, %1032, %1035, %1040 {sv.namehint = "_decoded_orMatrixOutputs_T_116"} : i1, i1, i1, i1, i1, i1, i1
    %1056 = comb.icmp bin ne %1055, %c0_i7 {sv.namehint = "_decoded_invMatrixOutputs_T_118"} : i7
    %1057 = comb.icmp bin eq %1054, %c0_i27 {sv.namehint = "_decoded_invMatrixOutputs_T_117"} : i27
    %1058 = comb.concat %1046, %1056, %1057, %1053, %1051 {sv.namehint = "decoded_7"} : i1, i1, i1, i1, i1
    %1059 = comb.extract %io_input_instr from 13 {sv.namehint = "wireFunct3c"} : (i32) -> i3
    %1060 = comb.extract %io_input_instr from 7 {sv.namehint = "wireRs1c"} : (i32) -> i5
    %1061 = comb.extract %io_input_instr from 2 {sv.namehint = "wireRs2c"} : (i32) -> i5
    %1062 = comb.extract %io_input_instr from 7 {sv.namehint = "_immMap_T_113"} : (i32) -> i3
    %1063 = comb.concat %true, %1062 {sv.namehint = "wireRs1p"} : i1, i3
    %1064 = comb.extract %io_input_instr from 2 {sv.namehint = "_immMap_T_99"} : (i32) -> i3
    %1065 = comb.concat %true, %1064 {sv.namehint = "wireRs2p"} : i1, i3
    %1066 = comb.concat %1449, %1447, %1464, %1462 {sv.namehint = "_isMemExcept_T"} : i1, i1, i1, i1
    %1067 = comb.icmp bin ne %1066, %c0_i4 {sv.namehint = "isMemExcept"} : i4
    %1068 = comb.icmp bin slt %io_gprsR_rdata_0, %io_gprsR_rdata_1 {sv.namehint = "lessthan"} : i64
    %1069 = comb.icmp bin ult %io_gprsR_rdata_0, %io_gprsR_rdata_1 {sv.namehint = "ulessthan"} : i64
    %1070 = comb.icmp bin eq %io_gprsR_rdata_0, %io_gprsR_rdata_1 {sv.namehint = "equal"} : i64
    %1071 = comb.extract %io_input_instr from 0 {sv.namehint = "_rvc_T"} : (i32) -> i2
    %1072 = comb.icmp bin eq %1071, %c-1_i2 {sv.namehint = "_willBranch_T_3"} : i2
    %1073 = comb.extract %io_input_instr from 12 {sv.namehint = "_op1_3_T_4"} : (i32) -> i3
    %1074 = comb.icmp bin ne %io_gprsR_rdata_0, %io_gprsR_rdata_1 {sv.namehint = "_willBranch_T_20"} : i64
    %1075 = comb.icmp bin sge %io_gprsR_rdata_0, %io_gprsR_rdata_1 {sv.namehint = "_willBranch_T_6"} : i64
    %1076 = comb.icmp bin uge %io_gprsR_rdata_0, %io_gprsR_rdata_1 {sv.namehint = "_willBranch_T_7"} : i64
    %1077 = hw.array_create %1076, %1069, %1075, %1068, %1070, %1070, %1074, %1070 : i1
    %1078 = hw.array_get %1077[%1073] {sv.namehint = "_willBranch_T_17"} : !hw.array<8xi1>, i3
    %1079 = comb.extract %io_input_instr from 13 {sv.namehint = "_jbCOffset_T"} : (i32) -> i2
    %1080 = comb.icmp bin eq %1079, %c-2_i2 {sv.namehint = "_willBranch_T_19"} : i2
    %1081 = comb.mux bin %1080, %1070, %1074 {sv.namehint = "_willBranch_T_21"} : i1
    %1082 = comb.mux bin %1072, %1078, %1081 {sv.namehint = "willBranch"} : i1
    %1083 = comb.extract %io_input_instr from 20 {sv.namehint = "io_csrsR_0_rcsr"} : (i32) -> i12
    %1084 = comb.concat %212, %335, %333, %312, %314, %316, %331, %329, %327, %325, %336 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1085 = comb.icmp bin eq %1084, %c2_i11 {sv.namehint = "_hasRsType_WIRE_0"} : i11
    %1086 = comb.concat %446, %426, %444, %442, %440, %438, %447 : i1, i1, i1, i1, i1, i1, i1
    %1087 = comb.icmp bin eq %1086, %c2_i7 {sv.namehint = "_hasRsType_WIRE_1"} : i7
    %1088 = comb.concat %490, %488, %518, %516, %519 : i1, i1, i1, i1, i1
    %1089 = comb.icmp bin eq %1088, %c2_i5 {sv.namehint = "_hasRsType_WIRE_2"} : i5
    %1090 = comb.concat %1089, %1087, %1085 : i1, i1, i1
    %1091 = comb.icmp bin ne %1090, %c0_i3 {sv.namehint = "hasRsType_7_2"} : i3
    %1092 = comb.concat %212, %335, %333, %312, %314, %316, %331, %329, %327, %325, %336 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1093 = comb.icmp bin eq %1092, %c4_i11 {sv.namehint = "_hasRsType_WIRE_1_0"} : i11
    %1094 = comb.concat %446, %426, %444, %442, %440, %438, %447 : i1, i1, i1, i1, i1, i1, i1
    %1095 = comb.icmp bin eq %1094, %c4_i7 {sv.namehint = "_hasRsType_WIRE_1_1"} : i7
    %1096 = comb.concat %1095, %1093 : i1, i1
    %1097 = comb.icmp bin ne %1096, %c0_i2 {sv.namehint = "hasRsType_1_2"} : i2
    %1098 = comb.concat %546, %549, %550 : i1, i1, i1
    %1099 = comb.icmp bin eq %1098, %c-4_i3 {sv.namehint = "_hasRsType_WIRE_2_3"} : i3
    %1100 = comb.concat %212, %335, %333, %312, %314, %316, %331, %329, %327, %325, %336 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1101 = comb.icmp bin eq %1100, %c32_i11 {sv.namehint = "_hasRsType_WIRE_3_0"} : i11
    %1102 = comb.concat %446, %426, %444, %442, %440, %438, %447 : i1, i1, i1, i1, i1, i1, i1
    %1103 = comb.icmp bin eq %1102, %c32_i7 {sv.namehint = "_hasRsType_WIRE_3_1"} : i7
    %1104 = comb.concat %1103, %1101 : i1, i1
    %1105 = comb.icmp bin ne %1104, %c0_i2 {sv.namehint = "hasRsType_6_2"} : i2
    %1106 = comb.concat %212, %335, %333, %312, %314, %316, %331, %329, %327, %325, %336 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1107 = comb.icmp bin eq %1106, %c64_i11 {sv.namehint = "_hasRsType_WIRE_4_0"} : i11
    %1108 = comb.concat %490, %488, %518, %516, %519 : i1, i1, i1, i1, i1
    %1109 = comb.icmp bin eq %1108, %c8_i5 {sv.namehint = "_hasRsType_WIRE_4_2"} : i5
    %1110 = comb.concat %1109, %1107 : i1, i1
    %1111 = comb.icmp bin ne %1110, %c0_i2 {sv.namehint = "hasRsType_3_2"} : i2
    %1112 = comb.concat %212, %335, %333, %312, %314, %316, %331, %329, %327, %325, %336 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1113 = comb.icmp bin eq %1112, %c128_i11 {sv.namehint = "_hasRsType_WIRE_5_0"} : i11
    %1114 = comb.concat %446, %426, %444, %442, %440, %438, %447 : i1, i1, i1, i1, i1, i1, i1
    %1115 = comb.icmp bin eq %1114, %c-64_i7 {sv.namehint = "_hasRsType_WIRE_5_1"} : i7
    %1116 = comb.concat %1115, %1113 : i1, i1
    %1117 = comb.icmp bin ne %1116, %c0_i2 {sv.namehint = "hasRsType_4_2"} : i2
    %1118 = comb.concat %212, %335, %333, %312, %314, %316, %331, %329, %327, %325, %336 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1119 = comb.icmp bin eq %1118, %c256_i11 {sv.namehint = "_hasRsType_WIRE_6_0"} : i11
    %1120 = comb.concat %212, %335, %333, %312, %314, %316, %331, %329, %327, %325, %336 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1121 = comb.icmp bin eq %1120, %c512_i11 {sv.namehint = "_hasRsType_WIRE_7_0"} : i11
    %1122 = comb.concat %212, %335, %333, %312, %314, %316, %331, %329, %327, %325, %336 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1123 = comb.icmp bin eq %1122, %c-1024_i11 {sv.namehint = "_hasRsType_WIRE_8_0"} : i11
    %1124 = comb.concat %490, %488, %518, %516, %519 : i1, i1, i1, i1, i1
    %1125 = comb.icmp bin eq %1124, %c-16_i5 {sv.namehint = "_hasRsType_WIRE_8_2"} : i5
    %1126 = comb.concat %1125, %1123 : i1, i1
    %1127 = comb.icmp bin ne %1126, %c0_i2 {sv.namehint = "hasRsType_8_2"} : i2
    %1128 = comb.concat %38, %150, %199, %167, %197, %165, %140, %169, %142, %200, %194, %192, %102, %74, %71, %190 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1129 = comb.icmp bin eq %1128, %c16384_i16 {sv.namehint = "_wireImm_T_15"} : i16
    %1130 = comb.icmp bin ne %1060, %c2_i5 {sv.namehint = "_immMap_T_48"} : i5
    %1131 = comb.and bin %1129, %1130 {sv.namehint = "_io_gprsR_raddr_0_T_2"} : i1
    %1132 = comb.mux bin %1131, %c0_i5, %1060 {sv.namehint = "_io_gprsR_raddr_0_T_3"} : i5
    %1133 = comb.concat %c0_i2, %1127, %false : i2, i1, i1
    %1134 = comb.mux bin %1121, %1063, %1133 {sv.namehint = "_io_gprsR_raddr_0_T_5"} : i4
    %1135 = comb.concat %false, %1134 : i1, i4
    %1136 = comb.mux bin %1119, %1132, %1135 {sv.namehint = "_io_gprsR_raddr_0_T_6"} : i5
    %1137 = comb.concat %c1_i2, %1062 : i2, i3
    %1138 = comb.mux bin %1111, %1137, %1136 {sv.namehint = "_io_gprsR_raddr_0_T_7"} : i5
    %1139 = comb.mux bin %1099, %1060, %1138 {sv.namehint = "_io_gprsR_raddr_0_T_8"} : i5
    %1140 = comb.mux bin %1091, %io_input_rs_0, %1139 {sv.namehint = "_io_gprsR_raddr_0_T_9"} : i5
    %1141 = comb.mux bin %1117, %1065, %c0_i4 {sv.namehint = "_io_gprsR_raddr_1_T"} : i4
    %1142 = comb.concat %false, %1141 : i1, i4
    %1143 = comb.mux bin %1105, %1061, %1142 {sv.namehint = "_io_gprsR_raddr_1_T_1"} : i5
    %1144 = comb.mux bin %1097, %io_input_rs_1, %1143 {sv.namehint = "io_gprsR_raddr_1"} : i5
    %1145 = comb.icmp bin eq %io_input_instrCode, %c-25_i7 {sv.namehint = "_instrJalr_T"} : i7
    %1146 = comb.mux bin %1145, %io_input_rs_0, %1060 {sv.namehint = "io_gprsR_raddr_2"} : i5
    %1147 = comb.icmp bin eq %io_input_instrCode, %c2_i7 {sv.namehint = "_isCJR_T"} : i7
    %1148 = comb.icmp bin eq %1059, %c-4_i3 {sv.namehint = "_isCJR_T_1"} : i3
    %1149 = comb.icmp bin ne %1060, %c0_i5 {sv.namehint = "_useRaddr2_T_6"} : i5
    %1150 = comb.and bin %1147, %1148, %1149 {sv.namehint = "_useRaddr2_T_7"} : i1
    %1151 = comb.or bin %1145, %1150 {sv.namehint = "useRaddr2"} : i1
    %1152 = comb.and bin %1147, %1148 {sv.namehint = "isCJR"} : i1
    %1153 = comb.mux bin %1152, %c2_i64, %io_gprsR_rdata_1 {sv.namehint = "_wireNum_3_T"} : i64
    %1154 = comb.mux bin %1152, %io_input_pc, %io_gprsR_rdata_0 {sv.namehint = "_wireNum_3_T_1"} : i64
    %1155 = comb.mux bin %325, %io_gprsR_rdata_0, %c0_i64 {sv.namehint = "_wireNum_0_T_30"} : i64
    %1156 = comb.mux bin %327, %io_gprsR_rdata_1, %c0_i64 {sv.namehint = "_wireNum_0_T_18"} : i64
    %1157 = comb.mux bin %329, %io_input_pc, %c0_i64 {sv.namehint = "_wireNum_0_T_21"} : i64
    %1158 = comb.mux bin %331, %io_csrsR_0_rdata, %c0_i64 {sv.namehint = "_wireNum_0_T_22"} : i64
    %1159 = comb.mux bin %316, %1153, %c0_i64 {sv.namehint = "_wireNum_0_T_24"} : i64
    %1160 = comb.mux bin %314, %io_gprsR_rdata_0, %c0_i64 {sv.namehint = "_wireNum_0_T_25"} : i64
    %1161 = comb.mux bin %312, %io_gprsR_rdata_1, %c0_i64 {sv.namehint = "_wireNum_0_T_26"} : i64
    %1162 = comb.mux bin %333, %1154, %c0_i64 {sv.namehint = "_wireNum_0_T_27"} : i64
    %1163 = comb.mux bin %335, %io_gprsR_rdata_0, %c0_i64 {sv.namehint = "_wireNum_0_T_28"} : i64
    %1164 = comb.mux bin %212, %io_gprsR_rdata_0, %c0_i64 {sv.namehint = "_wireNum_0_T_29"} : i64
    %1165 = comb.or bin %1155, %1156, %1157, %1158, %1159, %1160, %1161, %1162, %1163, %1164 {sv.namehint = "_wireNum_0_T_42"} : i64
    %1166 = comb.mux bin %438, %io_gprsR_rdata_0, %c0_i64 {sv.namehint = "_wireNum_1_T_30"} : i64
    %1167 = comb.mux bin %440, %io_gprsR_rdata_1, %c0_i64 {sv.namehint = "_wireNum_1_T_18"} : i64
    %1168 = comb.mux bin %442, %1300, %c0_i64 {sv.namehint = "_wireNum_1_T_19"} : i64
    %1169 = comb.concat %444, %c0_i2 {sv.namehint = "_wireNum_1_T_20"} : i1, i2
    %1170 = comb.mux bin %426, %1153, %c0_i64 {sv.namehint = "_wireNum_1_T_24"} : i64
    %1171 = comb.mux bin %446, %io_gprsR_rdata_1, %c0_i64 {sv.namehint = "_wireNum_1_T_26"} : i64
    %1172 = comb.or bin %1166, %1167, %1168 {sv.namehint = "_wireNum_1_T_32"} : i64
    %1173 = comb.extract %1172 from 3 : (i64) -> i61
    %1174 = comb.extract %1172 from 0 : (i64) -> i3
    %1175 = comb.or bin %1174, %1169 : i3
    %1176 = comb.concat %1173, %1175 {sv.namehint = "_wireNum_1_T_33"} : i61, i3
    %1177 = comb.or bin %1176, %1170, %1171 {sv.namehint = "_wireNum_1_T_39"} : i64
    %1178 = comb.mux bin %516, %io_gprsR_rdata_0, %c0_i64 {sv.namehint = "_wireNum_2_T_30"} : i64
    %1179 = comb.mux bin %518, %1300, %c0_i64 {sv.namehint = "_wireNum_2_T_19"} : i64
    %1180 = comb.mux bin %488, %io_gprsR_rdata_0, %c0_i64 {sv.namehint = "_wireNum_2_T_25"} : i64
    %1181 = comb.mux bin %490, %io_gprsR_rdata_0, %c0_i64 {sv.namehint = "_wireNum_2_T_29"} : i64
    %1182 = comb.or bin %1178, %1179, %1180, %1181 {sv.namehint = "_wireNum_2_T_42"} : i64
    %1183 = comb.mux bin %549, %1300, %c0_i64 {sv.namehint = "_wireNum_3_T_19"} : i64
    %1184 = comb.mux bin %546, %io_gprsR_rdata_0, %c0_i64 {sv.namehint = "_wireNum_3_T_23"} : i64
    %1185 = comb.or bin %1183, %1184 {sv.namehint = "_wireNum_3_T_36"} : i64
    %1186 = comb.extract %io_input_instr from 31 {sv.namehint = "_immMap_T_17"} : (i32) -> i1
    %1187 = comb.replicate %1186 {sv.namehint = "_immMap_T_1"} : (i1) -> i52
    %1188 = comb.concat %1187, %1083 {sv.namehint = "immMap_5_2"} : i52, i12
    %1189 = comb.replicate %1186 {sv.namehint = "_immMap_T_4"} : (i1) -> i32
    %1190 = comb.extract %io_input_instr from 12 {sv.namehint = "_immMap_T_5"} : (i32) -> i20
    %1191 = comb.concat %1189, %1190, %c0_i12 {sv.namehint = "immMap_4_2"} : i32, i20, i12
    %1192 = comb.replicate %1186 {sv.namehint = "_immMap_T_8"} : (i1) -> i44
    %1193 = comb.extract %io_input_instr from 12 {sv.namehint = "_immMap_T_9"} : (i32) -> i8
    %1194 = comb.extract %io_input_instr from 20 {sv.namehint = "_immMap_T_10"} : (i32) -> i1
    %1195 = comb.extract %io_input_instr from 21 {sv.namehint = "_immMap_T_11"} : (i32) -> i10
    %1196 = comb.concat %1192, %1193, %1194, %1195, %false {sv.namehint = "immMap_13_2"} : i44, i8, i1, i10, i1
    %1197 = comb.replicate %1186 {sv.namehint = "_immMap_T_13"} : (i1) -> i52
    %1198 = comb.extract %io_input_instr from 25 {sv.namehint = "_immMap_T_14"} : (i32) -> i7
    %1199 = comb.concat %1197, %1198, %1060 {sv.namehint = "immMap_11_2"} : i52, i7, i5
    %1200 = comb.replicate %1186 {sv.namehint = "_immMap_T_18"} : (i1) -> i52
    %1201 = comb.extract %io_input_instr from 7 {sv.namehint = "_immMap_T_73"} : (i32) -> i1
    %1202 = comb.extract %io_input_instr from 25 {sv.namehint = "_immMap_T_20"} : (i32) -> i6
    %1203 = comb.extract %io_input_instr from 8 {sv.namehint = "_immMap_T_21"} : (i32) -> i4
    %1204 = comb.concat %1200, %1201, %1202, %1203, %false {sv.namehint = "immMap_2_2"} : i52, i1, i6, i4, i1
    %1205 = comb.extract %io_input_instr from 15 {sv.namehint = "_immMap_T_22"} : (i32) -> i5
    %1206 = comb.concat %c0_i59, %1205 {sv.namehint = "immMap_10_2"} : i59, i5
    %1207 = comb.extract %io_input_instr from 7 {sv.namehint = "_immMap_T_23"} : (i32) -> i4
    %1208 = comb.extract %io_input_instr from 11 {sv.namehint = "_immMap_T_25"} : (i32) -> i2
    %1209 = comb.extract %io_input_instr from 5 {sv.namehint = "_immMap_T_58"} : (i32) -> i1
    %1210 = comb.extract %io_input_instr from 6 {sv.namehint = "_immMap_T_71"} : (i32) -> i1
    %1211 = comb.concat %c0_i54, %1207, %1208, %1209, %1210, %c0_i2 {sv.namehint = "immMap_8_2"} : i54, i4, i2, i1, i1, i2
    %1212 = comb.icmp bin eq %1079, %c-2_i2 {sv.namehint = "_immMap_T_32"} : i2
    %1213 = comb.extract %io_input_instr from 10 {sv.namehint = "_immMap_T_114"} : (i32) -> i3
    %1214 = comb.concat %false, %1209, %1213, %1210 {sv.namehint = "_immMap_T_38"} : i1, i1, i3, i1
    %1215 = comb.extract %io_input_instr from 5 {sv.namehint = "_immMap_T_102"} : (i32) -> i2
    %1216 = comb.concat %1215, %1213, %false {sv.namehint = "_immMap_T_42"} : i2, i3, i1
    %1217 = comb.mux bin %1212, %1214, %1216 {sv.namehint = "_immMap_T_43"} : i6
    %1218 = comb.concat %c0_i56, %1217, %c0_i2 {sv.namehint = "immMap_6_2"} : i56, i6, i2
    %1219 = comb.extract %io_input_instr from 12 {sv.namehint = "_wireCRd_T_3"} : (i32) -> i1
    %1220 = comb.replicate %1219 {sv.namehint = "_immMap_T_46"} : (i1) -> i59
    %1221 = comb.concat %1220, %1061 {sv.namehint = "immMap_0_2"} : i59, i5
    %1222 = comb.extract %io_input_instr from 3 {sv.namehint = "_immMap_T_89"} : (i32) -> i2
    %1223 = comb.extract %io_input_instr from 2 {sv.namehint = "_immMap_T_85"} : (i32) -> i1
    %1224 = comb.icmp bin eq %1060, %c2_i5 : i5
    %1225 = comb.replicate %1219 : (i1) -> i47
    %1226 = comb.replicate %1219 : (i1) -> i8
    %1227 = comb.concat %1226, %1222, %1209, %1223, %1210, %c0_i4 : i8, i2, i1, i1, i1, i4
    %1228 = comb.concat %1061, %c0_i12 : i5, i12
    %1229 = comb.mux bin %1224, %1227, %1228 : i17
    %1230 = comb.concat %1225, %1229 {sv.namehint = "immMap_15_2"} : i47, i17
    %1231 = comb.replicate %1219 {sv.namehint = "_immMap_T_66"} : (i1) -> i53
    %1232 = comb.extract %io_input_instr from 8 {sv.namehint = "_immMap_T_67"} : (i32) -> i1
    %1233 = comb.extract %io_input_instr from 9 {sv.namehint = "_immMap_T_69"} : (i32) -> i2
    %1234 = comb.extract %io_input_instr from 11 {sv.namehint = "_immMap_T_77"} : (i32) -> i1
    %1235 = comb.extract %io_input_instr from 3 {sv.namehint = "_immMap_T_79"} : (i32) -> i3
    %1236 = comb.concat %1231, %1232, %1233, %1210, %1201, %1223, %1234, %1235, %false {sv.namehint = "immMap_14_2"} : i53, i1, i2, i1, i1, i1, i1, i3, i1
    %1237 = comb.replicate %1219 {sv.namehint = "_immMap_T_82"} : (i1) -> i56
    %1238 = comb.extract %io_input_instr from 10 {sv.namehint = "_immMap_T_87"} : (i32) -> i2
    %1239 = comb.concat %1237, %1215, %1223, %1238, %1222, %false {sv.namehint = "immMap_12_2"} : i56, i2, i1, i2, i2, i1
    %1240 = comb.icmp bin eq %1079, %c-2_i2 {sv.namehint = "_immMap_T_92"} : i2
    %1241 = comb.extract %io_input_instr from 2 {sv.namehint = "_immMap_T_93"} : (i32) -> i2
    %1242 = comb.extract %io_input_instr from 4 {sv.namehint = "_immMap_T_97"} : (i32) -> i3
    %1243 = comb.concat %false, %1241, %1219, %1242 {sv.namehint = "_immMap_T_98"} : i1, i2, i1, i3
    %1244 = comb.concat %1064, %1219, %1215, %false {sv.namehint = "_immMap_T_104"} : i3, i1, i2, i1
    %1245 = comb.mux bin %1240, %1243, %1244 {sv.namehint = "_immMap_T_105"} : i7
    %1246 = comb.concat %c0_i55, %1245, %c0_i2 {sv.namehint = "immMap_9_2"} : i55, i7, i2
    %1247 = comb.icmp bin eq %1079, %c-2_i2 {sv.namehint = "_immMap_T_108"} : i2
    %1248 = comb.extract %io_input_instr from 7 {sv.namehint = "_immMap_T_109"} : (i32) -> i2
    %1249 = comb.extract %io_input_instr from 9 {sv.namehint = "_immMap_T_111"} : (i32) -> i4
    %1250 = comb.concat %false, %1248, %1249 {sv.namehint = "_immMap_T_112"} : i1, i2, i4
    %1251 = comb.concat %1062, %1213, %false {sv.namehint = "_immMap_T_116"} : i3, i3, i1
    %1252 = comb.mux bin %1247, %1250, %1251 {sv.namehint = "_immMap_T_117"} : i7
    %1253 = comb.concat %c0_i55, %1252, %c0_i2 {sv.namehint = "immMap_7_2"} : i55, i7, i2
    %1254 = comb.concat %38, %150, %199, %167, %197, %165, %140, %169, %142, %200, %194, %192, %102, %74, %71, %190 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1255 = comb.icmp bin eq %1254, %c-32768_i16 {sv.namehint = "_wireImm_T_8"} : i16
    %1256 = comb.concat %38, %150, %199, %167, %197, %165, %140, %169, %142, %200, %194, %192, %102, %74, %71, %190 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1257 = comb.icmp bin eq %1256, %c512_i16 {sv.namehint = "_wireImm_T_6"} : i16
    %1258 = comb.or bin %1255, %1257 {sv.namehint = "_wireCRd_T_2"} : i1
    %1259 = comb.concat %c0_i4, %1219 : i4, i1
    %1260 = comb.mux bin %1152, %1259, %io_input_rd {sv.namehint = "_wireCRd_T_4"} : i5
    %1261 = comb.concat %c1_i2, %1064 : i2, i3
    %1262 = comb.mux bin %1258, %1261, %1260 {sv.namehint = "_wireCRd_T_5"} : i5
    %1263 = comb.mux bin %1121, %1137, %1262 {sv.namehint = "wireCRd"} : i5
    %1264 = comb.concat %38, %150, %199, %167, %197, %165, %140, %169, %142, %200, %194, %192, %102, %74, %71, %190 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1265 = comb.icmp bin eq %1264, %c8192_i16 {sv.namehint = "_wireImm_T"} : i16
    %1266 = comb.concat %38, %150, %199, %167, %197, %165, %140, %169, %142, %200, %194, %192, %102, %74, %71, %190 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1267 = comb.icmp bin eq %1266, %c16_i16 {sv.namehint = "_wireImm_T_2"} : i16
    %1268 = comb.concat %38, %150, %199, %167, %197, %165, %140, %169, %142, %200, %194, %192, %102, %74, %71, %190 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1269 = comb.icmp bin eq %1268, %c2_i16 {sv.namehint = "_wireImm_T_4"} : i16
    %1270 = comb.concat %38, %150, %199, %167, %197, %165, %140, %169, %142, %200, %194, %192, %102, %74, %71, %190 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1271 = comb.icmp bin eq %1270, %c1_i16 {sv.namehint = "_wireImm_T_5"} : i16
    %1272 = comb.concat %38, %150, %199, %167, %197, %165, %140, %169, %142, %200, %194, %192, %102, %74, %71, %190 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1273 = comb.icmp bin eq %1272, %c256_i16 {sv.namehint = "_wireImm_T_7"} : i16
    %1274 = comb.concat %38, %150, %199, %167, %197, %165, %140, %169, %142, %200, %194, %192, %102, %74, %71, %190 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1275 = comb.icmp bin eq %1274, %c128_i16 {sv.namehint = "_wireImm_T_9"} : i16
    %1276 = comb.concat %38, %150, %199, %167, %197, %165, %140, %169, %142, %200, %194, %192, %102, %74, %71, %190 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1277 = comb.icmp bin eq %1276, %c32_i16 {sv.namehint = "_wireImm_T_10"} : i16
    %1278 = comb.concat %38, %150, %199, %167, %197, %165, %140, %169, %142, %200, %194, %192, %102, %74, %71, %190 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1279 = comb.icmp bin eq %1278, %c4_i16 {sv.namehint = "_wireImm_T_11"} : i16
    %1280 = comb.concat %38, %150, %199, %167, %197, %165, %140, %169, %142, %200, %194, %192, %102, %74, %71, %190 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1281 = comb.icmp bin eq %1280, %c4096_i16 {sv.namehint = "_wireImm_T_12"} : i16
    %1282 = comb.concat %38, %150, %199, %167, %197, %165, %140, %169, %142, %200, %194, %192, %102, %74, %71, %190 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1283 = comb.icmp bin eq %1282, %c8_i16 {sv.namehint = "_wireImm_T_13"} : i16
    %1284 = comb.concat %38, %150, %199, %167, %197, %165, %140, %169, %142, %200, %194, %192, %102, %74, %71, %190 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1285 = comb.icmp bin eq %1284, %c1024_i16 {sv.namehint = "_wireImm_T_14"} : i16
    %1286 = comb.mux bin %1271, %1188, %c0_i64 {sv.namehint = "_wireImm_T_32"} : i64
    %1287 = comb.mux bin %1285, %1236, %c0_i64 {sv.namehint = "_wireImm_T_18"} : i64
    %1288 = comb.mux bin %1277, %1206, %c0_i64 {sv.namehint = "_wireImm_T_19"} : i64
    %1289 = comb.mux bin %1281, %1239, %c0_i64 {sv.namehint = "_wireImm_T_20"} : i64
    %1290 = comb.mux bin %1269, %1191, %c0_i64 {sv.namehint = "_wireImm_T_21"} : i64
    %1291 = comb.mux bin %1283, %1196, %c0_i64 {sv.namehint = "_wireImm_T_22"} : i64
    %1292 = comb.mux bin %1275, %1246, %c0_i64 {sv.namehint = "_wireImm_T_23"} : i64
    %1293 = comb.mux bin %1255, %1211, %c0_i64 {sv.namehint = "_wireImm_T_24"} : i64
    %1294 = comb.mux bin %1257, %1218, %c0_i64 {sv.namehint = "_wireImm_T_25"} : i64
    %1295 = comb.mux bin %1279, %1199, %c0_i64 {sv.namehint = "_wireImm_T_26"} : i64
    %1296 = comb.mux bin %1273, %1253, %c0_i64 {sv.namehint = "_wireImm_T_28"} : i64
    %1297 = comb.mux bin %1129, %1230, %c0_i64 {sv.namehint = "_wireImm_T_29"} : i64
    %1298 = comb.mux bin %1265, %1221, %c0_i64 {sv.namehint = "_wireImm_T_30"} : i64
    %1299 = comb.mux bin %1267, %1204, %c0_i64 {sv.namehint = "_wireImm_T_31"} : i64
    %1300 = comb.or bin %1286, %1287, %1288, %1289, %1290, %1291, %1292, %1293, %1294, %1295, %1296, %1297, %1298, %1299 {sv.namehint = "wireImm"} : i64
    %1301 = comb.replicate %888 {sv.namehint = "_wireRd_T_1"} : (i1) -> i5
    %1302 = comb.icmp bin eq %1071, %c-1_i2 {sv.namehint = "_wireRd_T_5"} : i2
    %1303 = comb.mux bin %1302, %io_input_rd, %1263 {sv.namehint = "_wireRd_T_6"} : i5
    %1304 = comb.and bin %1301, %1303 {sv.namehint = "wireRd"} : i5
    %1305 = comb.icmp bin eq %1079, %c1_i2 {sv.namehint = "_jbCOffset_T_1"} : i2
    %1306 = comb.replicate %1219 : (i1) -> i53
    %1307 = comb.concat %1232, %1233, %1210, %1201, %1223, %1234, %1235 : i1, i2, i1, i1, i1, i1, i3
    %1308 = comb.replicate %1219 : (i1) -> i3
    %1309 = comb.concat %1308, %1215, %1223, %1238, %1222 : i3, i2, i1, i2, i2
    %1310 = comb.mux bin %1305, %1307, %1309 : i10
    %1311 = comb.icmp bin eq %1079, %c0_i2 {sv.namehint = "_jbCOffset_T_3"} : i2
    %1312 = comb.concat %1306, %1310 : i53, i10
    %1313 = comb.mux bin %1311, %c0_i63, %1312 {sv.namehint = "jbCOffset"} : i63
    %1314 = comb.icmp bin eq %1071, %c-1_i2 {sv.namehint = "_jbOffset_T_3"} : i2
    %1315 = comb.extract %io_input_instrCode from 2 {sv.namehint = "_jbOffset_T_4"} : (i7) -> i2
    %1316 = comb.icmp bin eq %1315, %c1_i2 {sv.namehint = "_jbOffset_T_5"} : i2
    %1317 = comb.replicate %1186 : (i1) -> i8
    %1318 = comb.extract %io_input_instr from 21 : (i32) -> i11
    %1319 = comb.concat %1317, %1318 : i8, i11
    %1320 = comb.concat %1193, %1194, %1195 : i8, i1, i10
    %1321 = comb.mux bin %1316, %1319, %1320 : i19
    %1322 = comb.icmp bin eq %1315, %c0_i2 {sv.namehint = "_jbOffset_T_7"} : i2
    %1323 = comb.replicate %1186 : (i1) -> i44
    %1324 = comb.replicate %1186 : (i1) -> i8
    %1325 = comb.concat %1324, %1201, %1202, %1203 : i8, i1, i6, i4
    %1326 = comb.mux bin %1322, %1325, %1321 : i19
    %1327 = comb.concat %1323, %1326 : i44, i19
    %1328 = comb.mux bin %1314, %1327, %1313 {sv.namehint = "jbOffset"} : i63
    %1329 = comb.extract %io_gprsR_rdata_2 from 1 {sv.namehint = "_tmpJbaddr_T"} : (i64) -> i63
    %1330 = comb.extract %io_input_pc from 1 {sv.namehint = "_tmpJbaddr_T_1"} : (i64) -> i63
    %1331 = comb.mux bin %1151, %1329, %1330 {sv.namehint = "_tmpJbaddr_T_2"} : i63
    %1332 = comb.add bin %1331, %1328 {sv.namehint = "_tmpJbaddr_T_4"} : i63
    %1333 = comb.concat %1332, %false {sv.namehint = "_wireJbAddr_T"} : i63, i1
    %1334 = comb.icmp bin eq %io_input_instrCode, %c-17_i7 {sv.namehint = "_instrJump_T"} : i7
    %1335 = comb.icmp bin eq %1071, %c1_i2 {sv.namehint = "_instrJump_T_2"} : i2
    %1336 = comb.icmp bin eq %1059, %c-3_i3 {sv.namehint = "_instrJump_T_6"} : i3
    %1337 = comb.and bin %1335, %1336 {sv.namehint = "_instrJump_T_8"} : i1
    %1338 = comb.icmp bin eq %io_input_instrCode, %c-29_i7 {sv.namehint = "_instrBranch_T"} : i7
    %1339 = comb.icmp bin eq %1071, %c1_i2 {sv.namehint = "_instrBranch_T_3"} : i2
    %1340 = comb.extract %io_input_instr from 14 {sv.namehint = "_instrBranch_T_4"} : (i32) -> i2
    %1341 = comb.icmp bin eq %1340, %c-1_i2 {sv.namehint = "_instrBranch_T_5"} : i2
    %1342 = comb.and bin %1339, %1341 {sv.namehint = "_instrBranch_T_6"} : i1
    %1343 = comb.or bin %1338, %1342 {sv.namehint = "instrBranch"} : i1
    %1344 = comb.and bin %1343, %1082 {sv.namehint = "_wireJmpBch_T_1"} : i1
    %1345 = comb.icmp bin eq %io_input_instrCode, %c-13_i7 {sv.namehint = "_isZicsr_T"} : i7
    %1346 = comb.extract %io_input_instr from 12 {sv.namehint = "_isZicsr_T_1"} : (i32) -> i2
    %1347 = comb.icmp bin ne %1346, %c0_i2 {sv.namehint = "_isZicsr_T_2"} : i2
    %1348 = comb.and bin %1345, %1347 {sv.namehint = "isZicsr"} : i1
    %1349 = comb.extract %io_input_instr from 28 : (i32) -> i4
    %1350 = comb.icmp bin eq %1349, %c0_i4 : i4
    %1351 = comb.icmp bin eq %1198, %c29_i7 : i7
    %1352 = comb.or bin %1350, %1351 : i1
    %1353 = comb.and %1348, %1352 : i1
    %1354 = comb.xor %1348, %true : i1
    %1355 = comb.or %1354, %1352 : i1
    %1356 = comb.mux bin %1355, %1058, %c6_i5 : i5
    %1357 = comb.xor bin %1352, %true : i1
    %1358 = comb.and %1348, %1357 : i1
    %1359 = comb.xor %1348, %true : i1
    %1360 = comb.or %1359, %1352 : i1
    %1361 = comb.mux bin %1360, %c-1_i12, %1083 : i12
    %1362 = comb.icmp bin eq %1642, %c384_i12 : i12
    %1363 = comb.xor %1352, %true : i1
    %1364 = comb.and %1348, %1363, %1362 : i1
    %1365 = comb.icmp bin eq %1058, %c4_i5 : i5
    %1366 = comb.or %1365, %1353 : i1
    %1367 = comb.icmp bin eq %1058, %c11_i5 : i5
    %1368 = comb.icmp bin eq %io_currentPriv, %c-1_i2 : i2
    %1369 = comb.and %1367, %1368 : i1
    %1370 = comb.icmp bin eq %io_currentPriv, %c1_i2 : i2
    %1371 = comb.and %1367, %1370 : i1
    %1372 = comb.icmp bin eq %io_currentPriv, %c0_i2 : i2
    %1373 = comb.and %1367, %1372 : i1
    %1374 = comb.icmp bin eq %1058, %c12_i5 : i5
    %1375 = comb.extract %io_input_instr from 0 {sv.namehint = "_badAddr_T_3"} : (i32) -> i16
    %1376 = comb.icmp bin eq %1375, %c-28670_i16 : i16
    %1377 = comb.or bin %1374, %1376 : i1
    %1378 = comb.icmp bin eq %1058, %c14_i5 : i5
    %1379 = comb.or %1378, %blocked : i1
    %1380 = comb.icmp bin eq %1058, %c7_i5 : i5
    %1381 = comb.xor bin %1368, %true : i1
    %1382 = comb.or %1381, %1365, %1353 : i1
    %1383 = comb.mux bin %1380, %1382, %1366 : i1
    %1384 = comb.and %1380, %1368 : i1
    %1385 = comb.and %1380, %1368 : i1
    %1386 = comb.and %1380, %1368 : i1
    %1387 = comb.and %1380, %1368 : i1
    %1388 = comb.mux bin %1387, %4, %io_currentPriv : i2
    %1389 = comb.and %1380, %1368 : i1
    %1390 = comb.and %1380, %1368 : i1
    %1391 = comb.mux bin %1390, %io_csrsR_8_rdata, %1333 : i64
    %1392 = comb.icmp bin eq %1058, %c13_i5 : i5
    %1393 = comb.icmp bin ne %io_currentPriv, %c1_i2 : i2
    %1394 = comb.and bin %1381, %1393 : i1
    %1395 = comb.or bin %1394, %5 : i1
    %1396 = comb.and bin %1392, %1395 : i1
    %1397 = comb.or %1396, %1383 : i1
    %1398 = comb.xor %1395, %true : i1
    %1399 = comb.and %1392, %1398 : i1
    %1400 = comb.or %1399, %1384, %1358 {sv.namehint = "wireIsWcsr"} : i1
    %1401 = comb.xor %1395, %true : i1
    %1402 = comb.and %1392, %1401 : i1
    %1403 = comb.or %1402, %1385 : i1
    %1404 = comb.mux bin %1403, %c768_i12, %1361 : i12
    %1405 = comb.xor %1395, %true : i1
    %1406 = comb.and %1392, %1405 : i1
    %1407 = comb.or %1406, %1386 : i1
    %1408 = comb.mux bin %1407, %io_csrsR_1_rdata, %1165 : i64
    %1409 = comb.concat %false, %3 : i1, i1
    %1410 = comb.xor %1392, %true : i1
    %1411 = comb.or %1410, %1395 : i1
    %1412 = comb.mux bin %1411, %1388, %1409 : i2
    %1413 = comb.xor %1395, %true : i1
    %1414 = comb.and %1392, %1413 : i1
    %1415 = comb.xor %1392, %true : i1
    %1416 = comb.or %1415, %1395 : i1
    %1417 = comb.mux bin %1416, %1391, %io_csrsR_9_rdata : i64
    %1418 = comb.icmp bin eq %1058, %c-16_i5 : i5
    %1419 = comb.or %1418, %1364 : i1
    %1420 = comb.icmp bin eq %1058, %c15_i5 : i5
    %1421 = comb.xor bin %amoStat, %true {sv.namehint = "_io_lastVR_READY_T_4"} : i1
    %1422 = comb.concat %753, %755, %749, %751, %705, %717, %709, %784, %707, %715, %703, %711, %713, %695, %782, %780, %778, %776, %774, %772, %770, %768, %766, %764, %762, %760, %758, %785 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1423 = comb.icmp bin ne %1422, %c64_i28 : i28
    %1424 = comb.concat %753, %755, %749, %751, %705, %717, %709, %784, %707, %715, %703, %711, %713, %695, %782, %780, %778, %776, %774, %772, %770, %768, %766, %764, %762, %760, %758, %785 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %1425 = comb.icmp bin ne %1424, %c128_i28 : i28
    %1426 = comb.and bin %1420, %1421, %1423, %1425 : i1
    %1427 = comb.mux bin %1426, %c1_i5, %1356 : i5
    %1428 = comb.xor bin %1426, %true : i1
    %1429 = comb.mux bin %amoStat, %rd, %1140 {sv.namehint = "io_gprsR_raddr_0"} : i5
    %1430 = comb.xor bin %io_isWait, %true : i1
    %1431 = comb.and bin %amoStat, %1430, %io_nextVR_READY : i1
    %1432 = comb.mux bin %1431, %io_gprsR_rdata_0, %num_1 : i64
    %1433 = comb.mux bin %1431, %c2_i5, %special : i5
    %1434 = comb.or %1431, %NVALID : i1
    %1435 = comb.or %1431, %retire : i1
    %1436 = comb.mux bin %1431, %c0_i5, %rd : i5
    %1437 = comb.or bin %io_revAmo, %1431 : i1
    %1438 = comb.xor %1437, %true : i1
    %1439 = comb.and %1438, %amoStat : i1
    %1440 = comb.icmp bin eq %io_input_cause, %c2_i4 : i4
    %1441 = comb.or %1440, %1396, %1383 : i1
    %1442 = comb.mux bin %io_input_except, %1441, %1397 {sv.namehint = "wireExcept_2"} : i1
    %1443 = comb.icmp bin eq %io_input_cause, %c3_i4 : i4
    %1444 = comb.and bin %io_input_except, %1443 : i1
    %1445 = comb.or %1444, %1377 {sv.namehint = "wireExcept_3"} : i1
    %1446 = comb.icmp bin eq %io_input_cause, %c4_i4 : i4
    %1447 = comb.and %io_input_except, %1446 {sv.namehint = "wireExcept_4"} : i1
    %1448 = comb.icmp bin eq %io_input_cause, %c6_i4 : i4
    %1449 = comb.and %io_input_except, %1448 {sv.namehint = "wireExcept_6"} : i1
    %1450 = comb.icmp bin eq %io_input_cause, %c-8_i4 : i4
    %1451 = comb.and bin %io_input_except, %1450 : i1
    %1452 = comb.or %1451, %1373 {sv.namehint = "wireExcept_8"} : i1
    %1453 = comb.icmp bin eq %io_input_cause, %c-7_i4 : i4
    %1454 = comb.and bin %io_input_except, %1453 : i1
    %1455 = comb.or %1454, %1371 {sv.namehint = "wireExcept_9"} : i1
    %1456 = comb.icmp bin eq %io_input_cause, %c-5_i4 : i4
    %1457 = comb.and bin %io_input_except, %1456 : i1
    %1458 = comb.or %1457, %1369 {sv.namehint = "wireExcept_11"} : i1
    %1459 = comb.icmp bin eq %io_input_cause, %c-4_i4 : i4
    %1460 = comb.and %io_input_except, %1459 {sv.namehint = "wireExcept_12"} : i1
    %1461 = comb.icmp bin eq %io_input_cause, %c-3_i4 : i4
    %1462 = comb.and %io_input_except, %1461 {sv.namehint = "wireExcept_13"} : i1
    %1463 = comb.icmp bin eq %io_input_cause, %c-1_i4 : i4
    %1464 = comb.and %io_input_except, %1463 {sv.namehint = "wireExcept_15"} : i1
    %1465 = comb.icmp bin ne %1514, %c-1_i4 {sv.namehint = "isInt"} : i4
    %1466 = comb.and bin %0, %1372 : i1
    %1467 = comb.and bin %1466, %10, %24 : i1
    %1468 = comb.xor bin %18, %true : i1
    %1469 = comb.and bin %1368, %1468, %10, %24 : i1
    %1470 = comb.or bin %1469, %1467 : i1
    %1471 = comb.mux bin %1470, %c4_i4, %c-1_i4 : i4
    %1472 = comb.and bin %1466, %7, %22 : i1
    %1473 = comb.xor bin %16, %true : i1
    %1474 = comb.and bin %1368, %1473, %7, %22 : i1
    %1475 = comb.or bin %1474, %1472 : i1
    %1476 = comb.mux bin %1475, %c0_i4, %1471 : i4
    %1477 = comb.and bin %1466, %13, %26 : i1
    %1478 = comb.xor bin %20, %true : i1
    %1479 = comb.and bin %1368, %1478, %13, %26 : i1
    %1480 = comb.or bin %1479, %1477 : i1
    %1481 = comb.mux bin %1480, %c-8_i4, %1476 : i4
    %1482 = comb.and bin %1372, %11, %25 : i1
    %1483 = comb.and bin %1, %1370 : i1
    %1484 = comb.and bin %1483, %11, %25 : i1
    %1485 = comb.xor bin %19, %true : i1
    %1486 = comb.and bin %1368, %1485, %11, %25 : i1
    %1487 = comb.or bin %1486, %1484, %1482 : i1
    %1488 = comb.mux bin %1487, %c5_i4, %1481 : i4
    %1489 = comb.and bin %1372, %8, %23 : i1
    %1490 = comb.and bin %1483, %8, %23 : i1
    %1491 = comb.xor bin %17, %true : i1
    %1492 = comb.and bin %1368, %1491, %8, %23 : i1
    %1493 = comb.or bin %1492, %1490, %1489 : i1
    %1494 = comb.mux bin %1493, %c1_i4, %1488 : i4
    %1495 = comb.and bin %1372, %14, %27 : i1
    %1496 = comb.and bin %1483, %14, %27 : i1
    %1497 = comb.xor bin %21, %true : i1
    %1498 = comb.and bin %1368, %1497, %14, %27 : i1
    %1499 = comb.or bin %1498, %1496, %1495 : i1
    %1500 = comb.mux bin %1499, %c-7_i4, %1494 : i4
    %1501 = comb.and bin %1381, %12, %io_mtip : i1
    %1502 = comb.and bin %2, %1368 : i1
    %1503 = comb.and bin %1502, %12, %io_mtip : i1
    %1504 = comb.or bin %1503, %1501 : i1
    %1505 = comb.mux bin %1504, %c7_i4, %1500 : i4
    %1506 = comb.and bin %1381, %9, %io_msip : i1
    %1507 = comb.and bin %1502, %9, %io_msip : i1
    %1508 = comb.or bin %1507, %1506 : i1
    %1509 = comb.mux bin %1508, %c3_i4, %1505 : i4
    %1510 = comb.and bin %1381, %15, %28 : i1
    %1511 = comb.and bin %1502, %15, %28 : i1
    %1512 = comb.or bin %1511, %1510 : i1
    %1513 = comb.mux bin %1512, %c-5_i4, %1509 : i4
    %1514 = comb.mux bin %amoStat, %c-1_i4, %1513 {sv.namehint = "intCode"} : i4
    %1515 = comb.mux bin %1462, %c13_i64, %c0_i64 : i64
    %1516 = comb.mux bin %1464, %c15_i64, %1515 : i64
    %1517 = comb.mux bin %1447, %c4_i64, %1516 : i64
    %1518 = comb.or %1449, %1447, %1464, %1462 : i1
    %1519 = comb.mux bin %1449, %c6_i64, %1517 : i64
    %1520 = comb.extract %io_currentPriv from 1 : (i2) -> i1
    %1521 = comb.extract %io_csrsR_4_rdata from 0 {sv.namehint = "_tmpNewPriv_WIRE_0"} : (i64) -> i1
    %1522 = comb.extract %io_csrsR_4_rdata from 1 {sv.namehint = "_tmpNewPriv_WIRE_1"} : (i64) -> i1
    %1523 = comb.extract %io_csrsR_4_rdata from 2 {sv.namehint = "_tmpNewPriv_WIRE_2"} : (i64) -> i1
    %1524 = comb.extract %io_csrsR_4_rdata from 3 {sv.namehint = "_tmpNewPriv_WIRE_3"} : (i64) -> i1
    %1525 = comb.extract %io_csrsR_4_rdata from 4 {sv.namehint = "_tmpNewPriv_WIRE_4"} : (i64) -> i1
    %1526 = comb.extract %io_csrsR_4_rdata from 5 {sv.namehint = "_tmpNewPriv_WIRE_5"} : (i64) -> i1
    %1527 = comb.extract %io_csrsR_4_rdata from 6 {sv.namehint = "_tmpNewPriv_WIRE_6"} : (i64) -> i1
    %1528 = comb.extract %io_csrsR_4_rdata from 7 {sv.namehint = "_tmpNewPriv_WIRE_7"} : (i64) -> i1
    %1529 = comb.extract %io_csrsR_4_rdata from 8 {sv.namehint = "_tmpNewPriv_WIRE_8"} : (i64) -> i1
    %1530 = comb.extract %io_csrsR_4_rdata from 9 {sv.namehint = "_tmpNewPriv_WIRE_9"} : (i64) -> i1
    %1531 = comb.extract %io_csrsR_4_rdata from 10 {sv.namehint = "_tmpNewPriv_WIRE_10"} : (i64) -> i1
    %1532 = comb.extract %io_csrsR_4_rdata from 11 {sv.namehint = "_tmpNewPriv_WIRE_11"} : (i64) -> i1
    %1533 = comb.extract %io_csrsR_4_rdata from 12 {sv.namehint = "_tmpNewPriv_WIRE_12"} : (i64) -> i1
    %1534 = comb.extract %io_csrsR_4_rdata from 13 {sv.namehint = "_tmpNewPriv_WIRE_13"} : (i64) -> i1
    %1535 = comb.extract %io_csrsR_4_rdata from 14 {sv.namehint = "_tmpNewPriv_WIRE_14"} : (i64) -> i1
    %1536 = comb.extract %io_csrsR_4_rdata from 15 {sv.namehint = "_tmpNewPriv_WIRE_15"} : (i64) -> i1
    %1537 = comb.extract %1563 from 0 {sv.namehint = "_tmpNewPriv_T_16"} : (i64) -> i4
    %1538 = hw.array_create %1536, %1535, %1534, %1533, %1532, %1531, %1530, %1529, %1528, %1527, %1526, %1525, %1524, %1523, %1522, %1521 : i1
    %1539 = hw.array_get %1538[%1537] : !hw.array<16xi1>, i4
    %1540 = comb.xor %1539, %true : i1
    %1541 = comb.concat %c-576460752303423488_i60, %1514 {sv.namehint = "_code_T_1"} : i60, i4
    %1542 = comb.extract %io_csrsR_3_rdata from 2 {sv.namehint = "_tmpNewPriv_WIRE_1_2"} : (i64) -> i1
    %1543 = comb.extract %io_csrsR_3_rdata from 3 {sv.namehint = "_tmpNewPriv_WIRE_1_3"} : (i64) -> i1
    %1544 = comb.extract %io_csrsR_3_rdata from 6 {sv.namehint = "_tmpNewPriv_WIRE_1_6"} : (i64) -> i1
    %1545 = comb.extract %io_csrsR_3_rdata from 7 {sv.namehint = "_tmpNewPriv_WIRE_1_7"} : (i64) -> i1
    %1546 = comb.extract %io_csrsR_3_rdata from 10 {sv.namehint = "_tmpNewPriv_WIRE_1_10"} : (i64) -> i1
    %1547 = comb.extract %io_csrsR_3_rdata from 11 {sv.namehint = "_tmpNewPriv_WIRE_1_11"} : (i64) -> i1
    %1548 = hw.array_create %16, %16, %16, %16, %1547, %1546, %21, %20, %1545, %1544, %19, %18, %1543, %1542, %17, %16 : i1
    %1549 = hw.array_get %1548[%1514] : !hw.array<16xi1>, i4
    %1550 = comb.xor %1549, %true : i1
    %1551 = comb.xor %1067, %true : i1
    %1552 = comb.and %1421, %1551, %1465 {sv.namehint = "wireIntr"} : i1
    %1553 = comb.mux bin %1445, %c3_i64, %c0_i64 : i64
    %1554 = comb.mux bin %1452, %c8_i64, %1553 : i64
    %1555 = comb.mux bin %1455, %c9_i64, %1554 : i64
    %1556 = comb.mux bin %1458, %c11_i64, %1555 : i64
    %1557 = comb.mux bin %1442, %c2_i64, %1556 : i64
    %1558 = comb.or %1465, %1460, %1442, %1458, %1455, %1452, %1444, %1377 : i1
    %1559 = comb.mux bin %1067, %1518, %1558 : i1
    %1560 = comb.mux bin %1460, %c12_i64, %1557 : i64
    %1561 = comb.mux bin %1465, %1541, %1560 : i64
    %1562 = comb.mux bin %1067, %1519, %1561 : i64
    %1563 = comb.mux bin %amoStat, %c0_i64, %1562 {sv.namehint = "code"} : i64
    %1564 = comb.extract %io_csrsR_4_rdata from 0 {sv.namehint = "_tmpNewPriv_WIRE_2_0"} : (i64) -> i1
    %1565 = comb.extract %io_csrsR_4_rdata from 1 {sv.namehint = "_tmpNewPriv_WIRE_2_1"} : (i64) -> i1
    %1566 = comb.extract %io_csrsR_4_rdata from 2 {sv.namehint = "_tmpNewPriv_WIRE_2_2"} : (i64) -> i1
    %1567 = comb.extract %io_csrsR_4_rdata from 3 {sv.namehint = "_tmpNewPriv_WIRE_2_3"} : (i64) -> i1
    %1568 = comb.extract %io_csrsR_4_rdata from 4 {sv.namehint = "_tmpNewPriv_WIRE_2_4"} : (i64) -> i1
    %1569 = comb.extract %io_csrsR_4_rdata from 5 {sv.namehint = "_tmpNewPriv_WIRE_2_5"} : (i64) -> i1
    %1570 = comb.extract %io_csrsR_4_rdata from 6 {sv.namehint = "_tmpNewPriv_WIRE_2_6"} : (i64) -> i1
    %1571 = comb.extract %io_csrsR_4_rdata from 7 {sv.namehint = "_tmpNewPriv_WIRE_2_7"} : (i64) -> i1
    %1572 = comb.extract %io_csrsR_4_rdata from 8 {sv.namehint = "_tmpNewPriv_WIRE_2_8"} : (i64) -> i1
    %1573 = comb.extract %io_csrsR_4_rdata from 9 {sv.namehint = "_tmpNewPriv_WIRE_2_9"} : (i64) -> i1
    %1574 = comb.extract %io_csrsR_4_rdata from 10 {sv.namehint = "_tmpNewPriv_WIRE_2_10"} : (i64) -> i1
    %1575 = comb.extract %io_csrsR_4_rdata from 11 {sv.namehint = "_tmpNewPriv_WIRE_2_11"} : (i64) -> i1
    %1576 = comb.extract %io_csrsR_4_rdata from 12 {sv.namehint = "_tmpNewPriv_WIRE_2_12"} : (i64) -> i1
    %1577 = comb.extract %io_csrsR_4_rdata from 13 {sv.namehint = "_tmpNewPriv_WIRE_2_13"} : (i64) -> i1
    %1578 = comb.extract %io_csrsR_4_rdata from 14 {sv.namehint = "_tmpNewPriv_WIRE_2_14"} : (i64) -> i1
    %1579 = comb.extract %io_csrsR_4_rdata from 15 {sv.namehint = "_tmpNewPriv_WIRE_2_15"} : (i64) -> i1
    %1580 = comb.extract %1563 from 0 {sv.namehint = "_tmpNewPriv_T_59"} : (i64) -> i4
    %1581 = hw.array_create %1579, %1578, %1577, %1576, %1575, %1574, %1573, %1572, %1571, %1570, %1569, %1568, %1567, %1566, %1565, %1564 : i1
    %1582 = hw.array_get %1581[%1580] : !hw.array<16xi1>, i4
    %1583 = comb.xor %1582, %true : i1
    %1584 = comb.mux %1465, %1550, %1583 : i1
    %1585 = comb.mux %1067, %1540, %1584 : i1
    %1586 = comb.concat %1585, %true : i1, i1
    %1587 = comb.or %amoStat, %1520 : i1
    %1588 = comb.mux bin %1587, %newPriv, %1586 {sv.namehint = "tmpNewPriv"} : i2
    %1589 = comb.extract %io_csrsR_1_rdata from 0 {sv.namehint = "_mstat_T_3"} : (i64) -> i59
    %1590 = comb.concat %6, %io_currentPriv, %1639, %1589 {sv.namehint = "mstat"} : i1, i2, i2, i59
    %1591 = comb.icmp bin eq %1563, %c1_i64 {sv.namehint = "_bad_T_1"} : i64
    %1592 = comb.icmp bin eq %1563, %c2_i64 {sv.namehint = "_badAddr_T"} : i64
    %1593 = comb.icmp bin eq %1563, %c3_i64 {sv.namehint = "_bad_T_4"} : i64
    %1594 = comb.icmp bin eq %1563, %c12_i64 {sv.namehint = "_bad_T_6"} : i64
    %1595 = comb.or bin %1591, %1592, %1593, %1594 {sv.namehint = "bad"} : i1
    %1596 = comb.icmp bin eq %1071, %c-1_i2 {sv.namehint = "_badAddr_T_2"} : i2
    %1597 = comb.concat %c0_i16, %1375 : i16, i16
    %1598 = comb.mux bin %1596, %io_input_instr, %1597 {sv.namehint = "_badAddr_T_4"} : i32
    %1599 = comb.add bin %io_input_pc, %c2_i64 {sv.namehint = "_badAddr_T_6"} : i64
    %1600 = comb.mux bin %io_input_crossCache, %1599, %io_input_pc {sv.namehint = "_badAddr_T_8"} : i64
    %1601 = comb.concat %c0_i32, %1598 : i32, i32
    %1602 = comb.mux bin %1592, %1601, %1600 {sv.namehint = "badAddr"} : i64
    %1603 = comb.icmp bin eq %1639, %c-1_i2 {sv.namehint = "_wireJbAddr_T_1"} : i2
    %1604 = comb.icmp bin eq %1639, %c1_i2 {sv.namehint = "_Xtval_T_1"} : i2
    %1605 = comb.icmp bin eq %1639, %c0_i2 {sv.namehint = "_Xtval_T_2"} : i2
    %1606 = comb.mux bin %1605, %c-63_i7, %c0_i7 {sv.namehint = "_Xepc_T_5"} : i7
    %1607 = comb.or bin %1603, %1604 : i1
    %1608 = comb.mux bin %1607, %c-191_i9, %c0_i9 : i9
    %1609 = comb.extract %1608 from 7 : (i9) -> i2
    %1610 = comb.extract %1608 from 0 : (i9) -> i7
    %1611 = comb.or bin %1610, %1606 : i7
    %1612 = comb.mux bin %1605, %c-62_i7, %c0_i7 {sv.namehint = "_Xcause_T_5"} : i7
    %1613 = comb.or bin %1603, %1604 : i1
    %1614 = comb.mux bin %1613, %c-190_i9, %c0_i9 : i9
    %1615 = comb.extract %1614 from 7 : (i9) -> i2
    %1616 = comb.extract %1614 from 0 : (i9) -> i7
    %1617 = comb.or bin %1616, %1612 : i7
    %1618 = comb.mux bin %1605, %c-61_i7, %c0_i7 {sv.namehint = "_Xtval_T_5"} : i7
    %1619 = comb.or bin %1603, %1604 : i1
    %1620 = comb.mux bin %1619, %c-189_i9, %c0_i9 : i9
    %1621 = comb.extract %1620 from 7 : (i9) -> i2
    %1622 = comb.extract %1620 from 0 : (i9) -> i7
    %1623 = comb.or bin %1622, %1618 : i7
    %1624 = comb.extract %io_csrsR_5_rdata from 0 {sv.namehint = "_mjaddr_T"} : (i64) -> i1
    %1625 = comb.and bin %1465, %1624 {sv.namehint = "_mjaddr_T_1"} : i1
    %1626 = comb.extract %io_csrsR_5_rdata from 2 {sv.namehint = "_mjaddr_T_6"} : (i64) -> i62
    %1627 = comb.extract %1563 from 0 {sv.namehint = "_sjaddr_T_3"} : (i64) -> i4
    %1628 = comb.concat %c0_i58, %1627 : i58, i4
    %1629 = comb.add bin %1626, %1628 {sv.namehint = "_mjaddr_T_4"} : i62
    %1630 = comb.mux bin %1625, %1629, %1626 {sv.namehint = "_mjaddr_T_7"} : i62
    %1631 = comb.extract %io_csrsR_6_rdata from 0 {sv.namehint = "_sjaddr_T"} : (i64) -> i1
    %1632 = comb.and bin %1465, %1631 {sv.namehint = "_sjaddr_T_1"} : i1
    %1633 = comb.extract %io_csrsR_6_rdata from 2 {sv.namehint = "_sjaddr_T_6"} : (i64) -> i62
    %1634 = comb.concat %c0_i58, %1627 : i58, i4
    %1635 = comb.add bin %1633, %1634 {sv.namehint = "_sjaddr_T_4"} : i62
    %1636 = comb.mux bin %1632, %1635, %1633 {sv.namehint = "_sjaddr_T_7"} : i62
    %1637 = comb.and bin %1421, %io_lastVR_VALID, %1559 : i1
    %1638 = comb.or %1637, %1414, %1389, %1334, %1337, %1145, %1152, %1344 {sv.namehint = "wireJmpBch"} : i1
    %1639 = comb.mux bin %1637, %1588, %1412 {sv.namehint = "wirePriv"} : i2
    %1640 = comb.mux bin %1637, %c8_i5, %1427 {sv.namehint = "wireSpecial"} : i5
    %1641 = comb.concat %c0_i2, %1603, %1609, %1611 : i2, i1, i2, i7
    %1642 = comb.mux bin %1637, %1641, %1404 {sv.namehint = "wireCsr_0"} : i12
    %1643 = comb.concat %c0_i2, %1603, %1615, %1617 : i2, i1, i2, i7
    %1644 = comb.mux bin %1637, %1643, %c-1_i12 {sv.namehint = "wireCsr_1"} : i12
    %1645 = comb.concat %c0_i2, %1603, %1621, %1623 : i2, i1, i2, i7
    %1646 = comb.mux bin %1637, %1645, %c-1_i12 {sv.namehint = "wireCsr_2"} : i12
    %1647 = comb.mux bin %1637, %c768_i12, %c-1_i12 {sv.namehint = "wireCsr_3"} : i12
    %1648 = comb.mux bin %1595, %1602, %c0_i64 : i64
    %1649 = comb.mux bin %1637, %io_input_pc, %1408 {sv.namehint = "wireNum_0"} : i64
    %1650 = comb.mux bin %1637, %1563, %1177 {sv.namehint = "wireNum_1"} : i64
    %1651 = comb.mux bin %1637, %1648, %1182 {sv.namehint = "wireNum_2"} : i64
    %1652 = comb.mux bin %1637, %1590, %1185 {sv.namehint = "wireNum_3"} : i64
    %1653 = comb.mux bin %1603, %1630, %1636 : i62
    %1654 = comb.concat %1653, %c0_i2 {sv.namehint = "_wireJbAddr_T_2"} : i62, i2
    %1655 = comb.mux bin %1637, %1654, %1417 {sv.namehint = "wireJbAddr"} : i64
    %1656 = comb.xor %1637, %true : i1
    %1657 = comb.and %1656, %1419 {sv.namehint = "wireIsSatp"} : i1
    %1658 = comb.xor %1637, %true : i1
    %1659 = comb.and %1658, %1379 {sv.namehint = "wireBlocked"} : i1
    %1660 = comb.xor %1637, %true : i1
    %1661 = comb.and %1660, %1426 : i1
    %1662 = comb.or %1661, %amoStat {sv.namehint = "wireAmoStat"} : i1
    %1663 = comb.or %1637, %1428 {sv.namehint = "wireRetire"} : i1
    %1664 = comb.xor bin %io_isWait, %true {sv.namehint = "_io_lastVR_READY_T"} : i1
    %1665 = comb.xor bin %blocked, %true {sv.namehint = "_io_lastVR_READY_T_2"} : i1
    %1666 = comb.and bin %io_nextVR_READY, %1664, %1665, %1421 {sv.namehint = "io_lastVR_READY"} : i1
    %1667 = comb.and bin %io_lastVR_VALID, %1666 : i1
    %1668 = comb.xor bin %jbPend, %true : i1
    %1669 = comb.icmp bin eq %jbAddr, %io_input_pc : i64
    %1670 = comb.or bin %1668, %1669 : i1
    %1671 = comb.concat %1670, %1449, %1447, %1464, %1462 : i1, i1, i1, i1, i1
    %1672 = comb.icmp bin ne %1671, %c0_i5 : i5
    %1673 = comb.mux bin %1672, %1304, %1436 : i5
    %1674 = comb.mux bin %1672, %1400, %isWcsr : i1
    %1675 = comb.mux bin %1672, %1642, %wcsr_0 : i12
    %1676 = comb.mux bin %1672, %1644, %wcsr_1 : i12
    %1677 = comb.mux bin %1672, %1646, %wcsr_2 : i12
    %1678 = comb.mux bin %1672, %1647, %wcsr_3 : i12
    %1679 = comb.mux bin %1672, %1649, %num_0 : i64
    %1680 = comb.mux bin %1672, %1650, %1432 : i64
    %1681 = comb.mux bin %1672, %1651, %num_2 : i64
    %1682 = comb.mux bin %1672, %1652, %num_3 : i64
    %1683 = comb.mux bin %1672, %786, %op1_2 : i31
    %1684 = comb.icmp bin eq %1071, %c-1_i2 {sv.namehint = "_op1_3_T_3"} : i2
    %1685 = comb.extract %io_input_instr from 13 {sv.namehint = "_op1_3_T_5"} : (i32) -> i2
    %1686 = comb.concat %false, %1685 {sv.namehint = "_op1_3_T_6"} : i1, i2
    %1687 = comb.mux bin %1684, %1073, %1686 {sv.namehint = "_op1_3_T_7"} : i3
    %1688 = comb.concat %c0_i28, %1687 : i28, i3
    %1689 = comb.mux bin %1672, %1688, %op1_3 : i31
    %1690 = comb.mux bin %1672, %1640, %1433 : i5
    %1691 = comb.icmp bin ne %1639, %io_currentPriv {sv.namehint = "_wireIsPriv_T"} : i2
    %1692 = comb.and bin %1667, %1672 : i1
    %1693 = comb.and %1692, %1691 {sv.namehint = "wireIsPriv"} : i1
    %1694 = comb.mux bin %1692, %1639, %newPriv : i2
    %1695 = comb.mux bin %1672, %1693, %isPriv : i1
    %1696 = comb.mux bin %1672, %1659, %blocked : i1
    %1697 = comb.mux bin %1672, %1657, %isSatp : i1
    %1698 = comb.mux bin %1692, %1662, %1439 : i1
    %1699 = comb.mux bin %1692, %1663, %1435 : i1
    %1700 = comb.mux bin %1692, %io_input_except, %except : i1
    %1701 = comb.mux bin %1692, %io_input_cause, %cause : i4
    %1702 = comb.mux bin %1692, %io_input_pc, %pc : i64
    %1703 = comb.mux bin %1692, %1655, %jbAddr : i64
    %1704 = comb.icmp bin eq %1071, %c-1_i2 : i2
    %1705 = comb.mux bin %1704, %c-4_i3, %c2_i3 : i3
    %1706 = comb.concat %c0_i61, %1705 : i61, i3
    %1707 = comb.add bin %io_input_pc, %1706 : i64
    %1708 = comb.icmp bin ne %1655, %1707 : i64
    %1709 = comb.and bin %1638, %1708 : i1
    %1710 = comb.and bin %1667, %1672, %1709 : i1
    %1711 = comb.or %1710, %jmpBch : i1
    %1712 = comb.mux bin %1692, %1709, %jbPend : i1
    %1713 = comb.icmp bin eq %1640, %c6_i5 {sv.namehint = "_rcsr_T"} : i5
    %1714 = comb.mux bin %1713, %1083, %c-1_i12 {sv.namehint = "_rcsr_T_2"} : i12
    %1715 = comb.mux bin %1692, %1714, %rcsr : i12
    %1716 = comb.mux bin %1692, %1552, %intr : i1
    %1717 = comb.icmp bin ne %1071, %c-1_i2 {sv.namehint = "_rvc_T_2"} : i2
    %1718 = comb.mux bin %1692, %1717, %rvc : i1
    %1719 = comb.and bin %io_isWait, %io_nextVR_READY, %1421 : i1
    %1720 = comb.or bin %1719, %1431 : i1
    %1721 = comb.mux bin %1720, %c0_i5, %rd : i5
    %1722 = comb.mux bin %1667, %1673, %1721 : i5
    %1723 = comb.xor %1719, %true : i1
    %1724 = comb.and %1723, %isWcsr : i1
    %1725 = comb.mux bin %1667, %1674, %1724 : i1
    %1726 = comb.mux bin %1719, %c-1_i12, %wcsr_0 : i12
    %1727 = comb.mux bin %1667, %1675, %1726 : i12
    %1728 = comb.mux bin %1719, %c-1_i12, %wcsr_1 : i12
    %1729 = comb.mux bin %1667, %1676, %1728 : i12
    %1730 = comb.mux bin %1719, %c-1_i12, %wcsr_2 : i12
    %1731 = comb.mux bin %1667, %1677, %1730 : i12
    %1732 = comb.mux bin %1719, %c-1_i12, %wcsr_3 : i12
    %1733 = comb.mux bin %1667, %1678, %1732 : i12
    %1734 = comb.mux bin %1719, %c0_i64, %num_0 : i64
    %1735 = comb.mux bin %1667, %1679, %1734 : i64
    %1736 = comb.mux bin %1719, %c0_i64, %1432 : i64
    %1737 = comb.mux bin %1667, %1680, %1736 : i64
    %1738 = comb.mux bin %1719, %c0_i64, %num_2 : i64
    %1739 = comb.mux bin %1667, %1681, %1738 : i64
    %1740 = comb.mux bin %1719, %c0_i64, %num_3 : i64
    %1741 = comb.mux bin %1667, %1682, %1740 : i64
    %1742 = comb.mux bin %1719, %c0_i31, %op1_2 : i31
    %1743 = comb.mux bin %1667, %1683, %1742 : i31
    %1744 = comb.mux bin %1719, %c0_i31, %op1_3 : i31
    %1745 = comb.mux bin %1667, %1689, %1744 : i31
    %1746 = comb.mux bin %1719, %c0_i5, %1433 : i5
    %1747 = comb.mux bin %1667, %1690, %1746 : i5
    %1748 = comb.and bin %io_nextVR_READY, %NVALID : i1
    %1749 = comb.or bin %1748, %1719 : i1
    %1750 = comb.xor %1749, %true : i1
    %1751 = comb.and %1750, %1434 : i1
    %1752 = comb.mux bin %1667, %1672, %1751 : i1
    %1753 = comb.xor %1748, %true : i1
    %1754 = comb.and %1753, %blocked : i1
    %1755 = comb.mux bin %1667, %1696, %1754 : i1
    %1756 = comb.xor %1748, %true : i1
    %1757 = comb.and %1756, %isSatp : i1
    %1758 = comb.mux bin %1667, %1697, %1757 : i1
    %1759 = comb.xor %1748, %true : i1
    %1760 = comb.and %1759, %isPriv : i1
    %1761 = comb.mux bin %1667, %1695, %1760 : i1
    %1762 = comb.xor %jmpBch, %true : i1
    %1763 = comb.and %1762, %1711 : i1
    hw.output %rd, %isWcsr, %wcsr_0, %wcsr_1, %wcsr_2, %wcsr_3, %num_0, %num_1, %num_2, %num_3, %op1_2, %op1_3, %special, %retire, %newPriv, %isPriv, %isSatp, %except, %cause, %pc, %rcsr, %intr, %rvc, %1429, %1144, %1146, %1083, %1666, %NVALID, %jmpBch, %jbAddr, %amoStat : i5, i1, i12, i12, i12, i12, i64, i64, i64, i64, i31, i31, i5, i1, i2, i1, i1, i1, i4, i64, i12, i1, i1, i5, i5, i5, i12, i1, i1, i1, i64, i1
  }
  hw.module private @BoothSext(in %io_op_0 : i64, in %io_sign : i1, in %io_input_0 : i3, in %io_input_1 : i3, in %io_input_2 : i3, in %io_input_3 : i3, in %io_input_4 : i3, in %io_input_5 : i3, in %io_input_6 : i3, in %io_input_7 : i3, in %io_input_8 : i3, in %io_input_9 : i3, in %io_input_10 : i3, in %io_input_11 : i3, in %io_input_12 : i3, in %io_input_13 : i3, in %io_input_14 : i3, in %io_input_15 : i3, in %io_input_16 : i3, out io_output_0 : i69, out io_output_1 : i69, out io_output_2 : i69, out io_output_3 : i69, out io_output_4 : i69, out io_output_5 : i69, out io_output_6 : i69, out io_output_7 : i69, out io_output_8 : i69, out io_output_9 : i69, out io_output_10 : i69, out io_output_11 : i69, out io_output_12 : i69, out io_output_13 : i69, out io_output_14 : i69, out io_output_15 : i69, out io_output_16 : i69) {
    %c-1_i64 = hw.constant -1 : i64
    %false = hw.constant false
    %true = hw.constant true
    %c0_i65 = hw.constant 0 : i65
    %c-1_i65 = hw.constant -1 : i65
    %c0_i2 = hw.constant 0 : i2
    %0 = comb.extract %io_op_0 from 63 {sv.namehint = "_op_sign_T"} : (i64) -> i1
    %1 = comb.and bin %0, %io_sign {sv.namehint = "op_sign"} : i1
    %2 = comb.concat %1, %io_op_0 {sv.namehint = "_main_num_T_375"} : i1, i64
    %3 = comb.concat %io_op_0, %false {sv.namehint = "_main_num_T_371"} : i64, i1
    %4 = comb.xor %io_op_0, %c-1_i64 : i64
    %5 = comb.concat %4, %true {sv.namehint = "_main_num_T_4"} : i64, i1
    %6 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_6"} : i65
    %7 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_8"} : i65
    %8 = hw.array_create %c-1_i65, %7, %6, %5, %3, %2, %2, %c0_i65 : i65
    %9 = hw.array_get %8[%io_input_0] {sv.namehint = "main_num"} : !hw.array<8xi65>, i3
    %10 = comb.extract %9 from 64 {sv.namehint = "_ext_sign_T"} : (i65) -> i1
    %11 = comb.xor bin %10, %true {sv.namehint = "_ext_sign_T_1"} : i1
    %12 = comb.and bin %io_sign, %11 {sv.namehint = "_ext_sign_T_2"} : i1
    %13 = comb.xor bin %io_sign, %true {sv.namehint = "_ext_sign_T_115"} : i1
    %14 = comb.extract %io_input_0 from 2 {sv.namehint = "last"} : (i3) -> i1
    %15 = comb.xor bin %14, %true {sv.namehint = "_ext_sign_T_5"} : i1
    %16 = comb.and bin %13, %15 {sv.namehint = "_ext_sign_T_6"} : i1
    %17 = comb.or bin %12, %16 {sv.namehint = "ext_sign"} : i1
    %18 = comb.concat %true, %17, %9, %c0_i2 {sv.namehint = "io_output_0"} : i1, i1, i65, i2
    %19 = comb.xor %io_op_0, %c-1_i64 : i64
    %20 = comb.concat %19, %true {sv.namehint = "_main_num_T_27"} : i64, i1
    %21 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_29"} : i65
    %22 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_31"} : i65
    %23 = hw.array_create %c-1_i65, %22, %21, %20, %3, %2, %2, %c0_i65 : i65
    %24 = hw.array_get %23[%io_input_1] {sv.namehint = "main_num_1"} : !hw.array<8xi65>, i3
    %25 = comb.extract %24 from 64 {sv.namehint = "_ext_sign_T_7"} : (i65) -> i1
    %26 = comb.xor bin %25, %true {sv.namehint = "_ext_sign_T_8"} : i1
    %27 = comb.and bin %io_sign, %26 {sv.namehint = "_ext_sign_T_9"} : i1
    %28 = comb.extract %io_input_1 from 2 {sv.namehint = "last_1"} : (i3) -> i1
    %29 = comb.xor bin %28, %true {sv.namehint = "_ext_sign_T_12"} : i1
    %30 = comb.and bin %13, %29 {sv.namehint = "_ext_sign_T_13"} : i1
    %31 = comb.or bin %27, %30 {sv.namehint = "ext_sign_1"} : i1
    %32 = comb.concat %true, %31, %24, %false, %14 {sv.namehint = "io_output_1"} : i1, i1, i65, i1, i1
    %33 = comb.xor %io_op_0, %c-1_i64 : i64
    %34 = comb.concat %33, %true {sv.namehint = "_main_num_T_50"} : i64, i1
    %35 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_52"} : i65
    %36 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_54"} : i65
    %37 = hw.array_create %c-1_i65, %36, %35, %34, %3, %2, %2, %c0_i65 : i65
    %38 = hw.array_get %37[%io_input_2] {sv.namehint = "main_num_2"} : !hw.array<8xi65>, i3
    %39 = comb.extract %38 from 64 {sv.namehint = "_ext_sign_T_14"} : (i65) -> i1
    %40 = comb.xor bin %39, %true {sv.namehint = "_ext_sign_T_15"} : i1
    %41 = comb.and bin %io_sign, %40 {sv.namehint = "_ext_sign_T_16"} : i1
    %42 = comb.extract %io_input_2 from 2 {sv.namehint = "last_2"} : (i3) -> i1
    %43 = comb.xor bin %42, %true {sv.namehint = "_ext_sign_T_19"} : i1
    %44 = comb.and bin %13, %43 {sv.namehint = "_ext_sign_T_20"} : i1
    %45 = comb.or bin %41, %44 {sv.namehint = "ext_sign_2"} : i1
    %46 = comb.concat %true, %45, %38, %false, %28 {sv.namehint = "io_output_2"} : i1, i1, i65, i1, i1
    %47 = comb.xor %io_op_0, %c-1_i64 : i64
    %48 = comb.concat %47, %true {sv.namehint = "_main_num_T_73"} : i64, i1
    %49 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_75"} : i65
    %50 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_77"} : i65
    %51 = hw.array_create %c-1_i65, %50, %49, %48, %3, %2, %2, %c0_i65 : i65
    %52 = hw.array_get %51[%io_input_3] {sv.namehint = "main_num_3"} : !hw.array<8xi65>, i3
    %53 = comb.extract %52 from 64 {sv.namehint = "_ext_sign_T_21"} : (i65) -> i1
    %54 = comb.xor bin %53, %true {sv.namehint = "_ext_sign_T_22"} : i1
    %55 = comb.and bin %io_sign, %54 {sv.namehint = "_ext_sign_T_23"} : i1
    %56 = comb.extract %io_input_3 from 2 {sv.namehint = "last_3"} : (i3) -> i1
    %57 = comb.xor bin %56, %true {sv.namehint = "_ext_sign_T_26"} : i1
    %58 = comb.and bin %13, %57 {sv.namehint = "_ext_sign_T_27"} : i1
    %59 = comb.or bin %55, %58 {sv.namehint = "ext_sign_3"} : i1
    %60 = comb.concat %true, %59, %52, %false, %42 {sv.namehint = "io_output_3"} : i1, i1, i65, i1, i1
    %61 = comb.xor %io_op_0, %c-1_i64 : i64
    %62 = comb.concat %61, %true {sv.namehint = "_main_num_T_96"} : i64, i1
    %63 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_98"} : i65
    %64 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_100"} : i65
    %65 = hw.array_create %c-1_i65, %64, %63, %62, %3, %2, %2, %c0_i65 : i65
    %66 = hw.array_get %65[%io_input_4] {sv.namehint = "main_num_4"} : !hw.array<8xi65>, i3
    %67 = comb.extract %66 from 64 {sv.namehint = "_ext_sign_T_28"} : (i65) -> i1
    %68 = comb.xor bin %67, %true {sv.namehint = "_ext_sign_T_29"} : i1
    %69 = comb.and bin %io_sign, %68 {sv.namehint = "_ext_sign_T_30"} : i1
    %70 = comb.extract %io_input_4 from 2 {sv.namehint = "last_4"} : (i3) -> i1
    %71 = comb.xor bin %70, %true {sv.namehint = "_ext_sign_T_33"} : i1
    %72 = comb.and bin %13, %71 {sv.namehint = "_ext_sign_T_34"} : i1
    %73 = comb.or bin %69, %72 {sv.namehint = "ext_sign_4"} : i1
    %74 = comb.concat %true, %73, %66, %false, %56 {sv.namehint = "io_output_4"} : i1, i1, i65, i1, i1
    %75 = comb.xor %io_op_0, %c-1_i64 : i64
    %76 = comb.concat %75, %true {sv.namehint = "_main_num_T_119"} : i64, i1
    %77 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_121"} : i65
    %78 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_123"} : i65
    %79 = hw.array_create %c-1_i65, %78, %77, %76, %3, %2, %2, %c0_i65 : i65
    %80 = hw.array_get %79[%io_input_5] {sv.namehint = "main_num_5"} : !hw.array<8xi65>, i3
    %81 = comb.extract %80 from 64 {sv.namehint = "_ext_sign_T_35"} : (i65) -> i1
    %82 = comb.xor bin %81, %true {sv.namehint = "_ext_sign_T_36"} : i1
    %83 = comb.and bin %io_sign, %82 {sv.namehint = "_ext_sign_T_37"} : i1
    %84 = comb.extract %io_input_5 from 2 {sv.namehint = "last_5"} : (i3) -> i1
    %85 = comb.xor bin %84, %true {sv.namehint = "_ext_sign_T_40"} : i1
    %86 = comb.and bin %13, %85 {sv.namehint = "_ext_sign_T_41"} : i1
    %87 = comb.or bin %83, %86 {sv.namehint = "ext_sign_5"} : i1
    %88 = comb.concat %true, %87, %80, %false, %70 {sv.namehint = "io_output_5"} : i1, i1, i65, i1, i1
    %89 = comb.xor %io_op_0, %c-1_i64 : i64
    %90 = comb.concat %89, %true {sv.namehint = "_main_num_T_142"} : i64, i1
    %91 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_144"} : i65
    %92 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_146"} : i65
    %93 = hw.array_create %c-1_i65, %92, %91, %90, %3, %2, %2, %c0_i65 : i65
    %94 = hw.array_get %93[%io_input_6] {sv.namehint = "main_num_6"} : !hw.array<8xi65>, i3
    %95 = comb.extract %94 from 64 {sv.namehint = "_ext_sign_T_42"} : (i65) -> i1
    %96 = comb.xor bin %95, %true {sv.namehint = "_ext_sign_T_43"} : i1
    %97 = comb.and bin %io_sign, %96 {sv.namehint = "_ext_sign_T_44"} : i1
    %98 = comb.extract %io_input_6 from 2 {sv.namehint = "last_6"} : (i3) -> i1
    %99 = comb.xor bin %98, %true {sv.namehint = "_ext_sign_T_47"} : i1
    %100 = comb.and bin %13, %99 {sv.namehint = "_ext_sign_T_48"} : i1
    %101 = comb.or bin %97, %100 {sv.namehint = "ext_sign_6"} : i1
    %102 = comb.concat %true, %101, %94, %false, %84 {sv.namehint = "io_output_6"} : i1, i1, i65, i1, i1
    %103 = comb.xor %io_op_0, %c-1_i64 : i64
    %104 = comb.concat %103, %true {sv.namehint = "_main_num_T_165"} : i64, i1
    %105 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_167"} : i65
    %106 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_169"} : i65
    %107 = hw.array_create %c-1_i65, %106, %105, %104, %3, %2, %2, %c0_i65 : i65
    %108 = hw.array_get %107[%io_input_7] {sv.namehint = "main_num_7"} : !hw.array<8xi65>, i3
    %109 = comb.extract %108 from 64 {sv.namehint = "_ext_sign_T_49"} : (i65) -> i1
    %110 = comb.xor bin %109, %true {sv.namehint = "_ext_sign_T_50"} : i1
    %111 = comb.and bin %io_sign, %110 {sv.namehint = "_ext_sign_T_51"} : i1
    %112 = comb.extract %io_input_7 from 2 {sv.namehint = "last_7"} : (i3) -> i1
    %113 = comb.xor bin %112, %true {sv.namehint = "_ext_sign_T_54"} : i1
    %114 = comb.and bin %13, %113 {sv.namehint = "_ext_sign_T_55"} : i1
    %115 = comb.or bin %111, %114 {sv.namehint = "ext_sign_7"} : i1
    %116 = comb.concat %true, %115, %108, %false, %98 {sv.namehint = "io_output_7"} : i1, i1, i65, i1, i1
    %117 = comb.xor %io_op_0, %c-1_i64 : i64
    %118 = comb.concat %117, %true {sv.namehint = "_main_num_T_188"} : i64, i1
    %119 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_190"} : i65
    %120 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_192"} : i65
    %121 = hw.array_create %c-1_i65, %120, %119, %118, %3, %2, %2, %c0_i65 : i65
    %122 = hw.array_get %121[%io_input_8] {sv.namehint = "main_num_8"} : !hw.array<8xi65>, i3
    %123 = comb.extract %122 from 64 {sv.namehint = "_ext_sign_T_56"} : (i65) -> i1
    %124 = comb.xor bin %123, %true {sv.namehint = "_ext_sign_T_57"} : i1
    %125 = comb.and bin %io_sign, %124 {sv.namehint = "_ext_sign_T_58"} : i1
    %126 = comb.extract %io_input_8 from 2 {sv.namehint = "last_8"} : (i3) -> i1
    %127 = comb.xor bin %126, %true {sv.namehint = "_ext_sign_T_61"} : i1
    %128 = comb.and bin %13, %127 {sv.namehint = "_ext_sign_T_62"} : i1
    %129 = comb.or bin %125, %128 {sv.namehint = "ext_sign_8"} : i1
    %130 = comb.concat %true, %129, %122, %false, %112 {sv.namehint = "io_output_8"} : i1, i1, i65, i1, i1
    %131 = comb.xor %io_op_0, %c-1_i64 : i64
    %132 = comb.concat %131, %true {sv.namehint = "_main_num_T_211"} : i64, i1
    %133 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_213"} : i65
    %134 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_215"} : i65
    %135 = hw.array_create %c-1_i65, %134, %133, %132, %3, %2, %2, %c0_i65 : i65
    %136 = hw.array_get %135[%io_input_9] {sv.namehint = "main_num_9"} : !hw.array<8xi65>, i3
    %137 = comb.extract %136 from 64 {sv.namehint = "_ext_sign_T_63"} : (i65) -> i1
    %138 = comb.xor bin %137, %true {sv.namehint = "_ext_sign_T_64"} : i1
    %139 = comb.and bin %io_sign, %138 {sv.namehint = "_ext_sign_T_65"} : i1
    %140 = comb.extract %io_input_9 from 2 {sv.namehint = "last_9"} : (i3) -> i1
    %141 = comb.xor bin %140, %true {sv.namehint = "_ext_sign_T_68"} : i1
    %142 = comb.and bin %13, %141 {sv.namehint = "_ext_sign_T_69"} : i1
    %143 = comb.or bin %139, %142 {sv.namehint = "ext_sign_9"} : i1
    %144 = comb.concat %true, %143, %136, %false, %126 {sv.namehint = "io_output_9"} : i1, i1, i65, i1, i1
    %145 = comb.xor %io_op_0, %c-1_i64 : i64
    %146 = comb.concat %145, %true {sv.namehint = "_main_num_T_234"} : i64, i1
    %147 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_236"} : i65
    %148 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_238"} : i65
    %149 = hw.array_create %c-1_i65, %148, %147, %146, %3, %2, %2, %c0_i65 : i65
    %150 = hw.array_get %149[%io_input_10] {sv.namehint = "main_num_10"} : !hw.array<8xi65>, i3
    %151 = comb.extract %150 from 64 {sv.namehint = "_ext_sign_T_70"} : (i65) -> i1
    %152 = comb.xor bin %151, %true {sv.namehint = "_ext_sign_T_71"} : i1
    %153 = comb.and bin %io_sign, %152 {sv.namehint = "_ext_sign_T_72"} : i1
    %154 = comb.extract %io_input_10 from 2 {sv.namehint = "last_10"} : (i3) -> i1
    %155 = comb.xor bin %154, %true {sv.namehint = "_ext_sign_T_75"} : i1
    %156 = comb.and bin %13, %155 {sv.namehint = "_ext_sign_T_76"} : i1
    %157 = comb.or bin %153, %156 {sv.namehint = "ext_sign_10"} : i1
    %158 = comb.concat %true, %157, %150, %false, %140 {sv.namehint = "io_output_10"} : i1, i1, i65, i1, i1
    %159 = comb.xor %io_op_0, %c-1_i64 : i64
    %160 = comb.concat %159, %true {sv.namehint = "_main_num_T_257"} : i64, i1
    %161 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_259"} : i65
    %162 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_261"} : i65
    %163 = hw.array_create %c-1_i65, %162, %161, %160, %3, %2, %2, %c0_i65 : i65
    %164 = hw.array_get %163[%io_input_11] {sv.namehint = "main_num_11"} : !hw.array<8xi65>, i3
    %165 = comb.extract %164 from 64 {sv.namehint = "_ext_sign_T_77"} : (i65) -> i1
    %166 = comb.xor bin %165, %true {sv.namehint = "_ext_sign_T_78"} : i1
    %167 = comb.and bin %io_sign, %166 {sv.namehint = "_ext_sign_T_79"} : i1
    %168 = comb.extract %io_input_11 from 2 {sv.namehint = "last_11"} : (i3) -> i1
    %169 = comb.xor bin %168, %true {sv.namehint = "_ext_sign_T_82"} : i1
    %170 = comb.and bin %13, %169 {sv.namehint = "_ext_sign_T_83"} : i1
    %171 = comb.or bin %167, %170 {sv.namehint = "ext_sign_11"} : i1
    %172 = comb.concat %true, %171, %164, %false, %154 {sv.namehint = "io_output_11"} : i1, i1, i65, i1, i1
    %173 = comb.xor %io_op_0, %c-1_i64 : i64
    %174 = comb.concat %173, %true {sv.namehint = "_main_num_T_280"} : i64, i1
    %175 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_282"} : i65
    %176 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_284"} : i65
    %177 = hw.array_create %c-1_i65, %176, %175, %174, %3, %2, %2, %c0_i65 : i65
    %178 = hw.array_get %177[%io_input_12] {sv.namehint = "main_num_12"} : !hw.array<8xi65>, i3
    %179 = comb.extract %178 from 64 {sv.namehint = "_ext_sign_T_84"} : (i65) -> i1
    %180 = comb.xor bin %179, %true {sv.namehint = "_ext_sign_T_85"} : i1
    %181 = comb.and bin %io_sign, %180 {sv.namehint = "_ext_sign_T_86"} : i1
    %182 = comb.extract %io_input_12 from 2 {sv.namehint = "last_12"} : (i3) -> i1
    %183 = comb.xor bin %182, %true {sv.namehint = "_ext_sign_T_89"} : i1
    %184 = comb.and bin %13, %183 {sv.namehint = "_ext_sign_T_90"} : i1
    %185 = comb.or bin %181, %184 {sv.namehint = "ext_sign_12"} : i1
    %186 = comb.concat %true, %185, %178, %false, %168 {sv.namehint = "io_output_12"} : i1, i1, i65, i1, i1
    %187 = comb.xor %io_op_0, %c-1_i64 : i64
    %188 = comb.concat %187, %true {sv.namehint = "_main_num_T_303"} : i64, i1
    %189 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_305"} : i65
    %190 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_307"} : i65
    %191 = hw.array_create %c-1_i65, %190, %189, %188, %3, %2, %2, %c0_i65 : i65
    %192 = hw.array_get %191[%io_input_13] {sv.namehint = "main_num_13"} : !hw.array<8xi65>, i3
    %193 = comb.extract %192 from 64 {sv.namehint = "_ext_sign_T_91"} : (i65) -> i1
    %194 = comb.xor bin %193, %true {sv.namehint = "_ext_sign_T_92"} : i1
    %195 = comb.and bin %io_sign, %194 {sv.namehint = "_ext_sign_T_93"} : i1
    %196 = comb.extract %io_input_13 from 2 {sv.namehint = "last_13"} : (i3) -> i1
    %197 = comb.xor bin %196, %true {sv.namehint = "_ext_sign_T_96"} : i1
    %198 = comb.and bin %13, %197 {sv.namehint = "_ext_sign_T_97"} : i1
    %199 = comb.or bin %195, %198 {sv.namehint = "ext_sign_13"} : i1
    %200 = comb.concat %true, %199, %192, %false, %182 {sv.namehint = "io_output_13"} : i1, i1, i65, i1, i1
    %201 = comb.xor %io_op_0, %c-1_i64 : i64
    %202 = comb.concat %201, %true {sv.namehint = "_main_num_T_326"} : i64, i1
    %203 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_328"} : i65
    %204 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_330"} : i65
    %205 = hw.array_create %c-1_i65, %204, %203, %202, %3, %2, %2, %c0_i65 : i65
    %206 = hw.array_get %205[%io_input_14] {sv.namehint = "main_num_14"} : !hw.array<8xi65>, i3
    %207 = comb.extract %206 from 64 {sv.namehint = "_ext_sign_T_98"} : (i65) -> i1
    %208 = comb.xor bin %207, %true {sv.namehint = "_ext_sign_T_99"} : i1
    %209 = comb.and bin %io_sign, %208 {sv.namehint = "_ext_sign_T_100"} : i1
    %210 = comb.extract %io_input_14 from 2 {sv.namehint = "last_14"} : (i3) -> i1
    %211 = comb.xor bin %210, %true {sv.namehint = "_ext_sign_T_103"} : i1
    %212 = comb.and bin %13, %211 {sv.namehint = "_ext_sign_T_104"} : i1
    %213 = comb.or bin %209, %212 {sv.namehint = "ext_sign_14"} : i1
    %214 = comb.concat %true, %213, %206, %false, %196 {sv.namehint = "io_output_14"} : i1, i1, i65, i1, i1
    %215 = comb.xor %io_op_0, %c-1_i64 : i64
    %216 = comb.concat %215, %true {sv.namehint = "_main_num_T_349"} : i64, i1
    %217 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_351"} : i65
    %218 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_353"} : i65
    %219 = hw.array_create %c-1_i65, %218, %217, %216, %3, %2, %2, %c0_i65 : i65
    %220 = hw.array_get %219[%io_input_15] {sv.namehint = "main_num_15"} : !hw.array<8xi65>, i3
    %221 = comb.extract %220 from 64 {sv.namehint = "_ext_sign_T_105"} : (i65) -> i1
    %222 = comb.xor bin %221, %true {sv.namehint = "_ext_sign_T_106"} : i1
    %223 = comb.and bin %io_sign, %222 {sv.namehint = "_ext_sign_T_107"} : i1
    %224 = comb.extract %io_input_15 from 2 {sv.namehint = "last_15"} : (i3) -> i1
    %225 = comb.xor bin %224, %true {sv.namehint = "_ext_sign_T_110"} : i1
    %226 = comb.and bin %13, %225 {sv.namehint = "_ext_sign_T_111"} : i1
    %227 = comb.or bin %223, %226 {sv.namehint = "ext_sign_15"} : i1
    %228 = comb.concat %true, %227, %220, %false, %210 {sv.namehint = "io_output_15"} : i1, i1, i65, i1, i1
    %229 = comb.xor %io_op_0, %c-1_i64 : i64
    %230 = comb.concat %229, %true {sv.namehint = "_main_num_T_372"} : i64, i1
    %231 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_374"} : i65
    %232 = comb.xor bin %2, %c-1_i65 {sv.namehint = "_main_num_T_376"} : i65
    %233 = hw.array_create %c-1_i65, %232, %231, %230, %3, %2, %2, %c0_i65 : i65
    %234 = hw.array_get %233[%io_input_16] {sv.namehint = "main_num_16"} : !hw.array<8xi65>, i3
    %235 = comb.extract %234 from 64 {sv.namehint = "_ext_sign_T_112"} : (i65) -> i1
    %236 = comb.xor bin %235, %true {sv.namehint = "_ext_sign_T_113"} : i1
    %237 = comb.and bin %io_sign, %236 {sv.namehint = "_ext_sign_T_114"} : i1
    %238 = comb.extract %io_input_16 from 2 {sv.namehint = "_ext_sign_T_116"} : (i3) -> i1
    %239 = comb.xor bin %238, %true {sv.namehint = "_ext_sign_T_117"} : i1
    %240 = comb.and bin %13, %239 {sv.namehint = "_ext_sign_T_118"} : i1
    %241 = comb.or bin %237, %240 {sv.namehint = "ext_sign_16"} : i1
    %242 = comb.concat %true, %241, %234, %false, %224 {sv.namehint = "io_output_16"} : i1, i1, i65, i1, i1
    hw.output %18, %32, %46, %60, %74, %88, %102, %116, %130, %144, %158, %172, %186, %200, %214, %228, %242 : i69, i69, i69, i69, i69, i69, i69, i69, i69, i69, i69, i69, i69, i69, i69, i69, i69
  }
  hw.module private @CSA(in %io_input_0 : i128, in %io_input_1 : i128, in %io_input_2 : i128, out io_output_0 : i128, out io_output_1 : i128) {
    %false = hw.constant false
    %0 = comb.xor bin %io_input_0, %io_input_1, %io_input_2 {sv.namehint = "io_output_0"} : i128
    %1 = comb.extract %io_input_0 from 0 {sv.namehint = "_io_output_1_T_8"} : (i128) -> i127
    %2 = comb.extract %io_input_1 from 0 {sv.namehint = "_io_output_1_T_3"} : (i128) -> i127
    %3 = comb.and bin %1, %2 {sv.namehint = "_io_output_1_T_2"} : i127
    %4 = comb.extract %io_input_2 from 0 {sv.namehint = "_io_output_1_T_7"} : (i128) -> i127
    %5 = comb.and bin %2, %4 {sv.namehint = "_io_output_1_T_5"} : i127
    %6 = comb.and bin %4, %1 {sv.namehint = "_io_output_1_T_9"} : i127
    %7 = comb.or bin %3, %5, %6 {sv.namehint = "_io_output_1_T_10"} : i127
    %8 = comb.concat %7, %false {sv.namehint = "io_output_1"} : i127, i1
    hw.output %0, %8 : i128, i128
  }
  hw.module private @Compressor_42(in %io_input_0 : i128, in %io_input_1 : i128, in %io_input_2 : i128, in %io_input_3 : i128, out io_output_0 : i128, out io_output_1 : i128) {
    %c-1_i127 = hw.constant -1 : i127
    %false = hw.constant false
    %0 = comb.xor bin %io_input_0, %io_input_1, %io_input_2, %io_input_3 {sv.namehint = "w1"} : i128
    %1 = comb.extract %io_input_0 from 0 {sv.namehint = "_w3_T"} : (i128) -> i127
    %2 = comb.extract %io_input_1 from 0 {sv.namehint = "_w3_T_1"} : (i128) -> i127
    %3 = comb.and bin %1, %2 {sv.namehint = "_w2_T_2"} : i127
    %4 = comb.extract %io_input_2 from 0 {sv.namehint = "_w3_T_3"} : (i128) -> i127
    %5 = comb.extract %io_input_3 from 0 {sv.namehint = "_w3_T_4"} : (i128) -> i127
    %6 = comb.and bin %4, %5 {sv.namehint = "_w2_T_5"} : i127
    %7 = comb.or bin %3, %6 {sv.namehint = "w2"} : i127
    %8 = comb.or bin %1, %2 {sv.namehint = "_w3_T_2"} : i127
    %9 = comb.or bin %4, %5 {sv.namehint = "_w3_T_5"} : i127
    %10 = comb.and bin %8, %9 {sv.namehint = "w3"} : i127
    %11 = comb.extract %0 from 0 {sv.namehint = "_io_output_0_T_4"} : (i128) -> i127
    %12 = comb.extract %8 from 0 : (i127) -> i126
    %13 = comb.extract %9 from 0 : (i127) -> i126
    %14 = comb.and bin %12, %13 {sv.namehint = "_io_output_0_T_1"} : i126
    %15 = comb.concat %14, %false {sv.namehint = "_io_output_0_T_2"} : i126, i1
    %16 = comb.and bin %11, %15 {sv.namehint = "_io_output_0_T_3"} : i127
    %17 = comb.xor bin %11, %c-1_i127 {sv.namehint = "_io_output_0_T_5"} : i127
    %18 = comb.and bin %17, %7 {sv.namehint = "_io_output_0_T_6"} : i127
    %19 = comb.or bin %16, %18 {sv.namehint = "_io_output_0_T_7"} : i127
    %20 = comb.concat %19, %false {sv.namehint = "io_output_0"} : i127, i1
    %21 = comb.concat %10, %false {sv.namehint = "_io_output_1_T"} : i127, i1
    %22 = comb.xor bin %0, %21 {sv.namehint = "io_output_1"} : i128
    hw.output %20, %22 : i128, i128
  }
  hw.module private @WalImproved(in %io_input_0 : i128, in %io_input_1 : i128, in %io_input_2 : i128, in %io_input_3 : i128, in %io_input_4 : i128, in %io_input_5 : i128, in %io_input_6 : i128, in %io_input_7 : i128, in %io_input_8 : i128, in %io_input_9 : i128, in %io_input_10 : i128, in %io_input_11 : i128, in %io_input_12 : i128, in %io_input_13 : i128, in %io_input_14 : i128, in %io_input_15 : i128, in %io_input_16 : i128, in %io_input_17 : i128, out io_output_0 : i128, out io_output_1 : i128) {
    %CSAs_0.io_output_0, %CSAs_0.io_output_1 = hw.instance "CSAs_0" @CSA(io_input_0: %io_input_0: i128, io_input_1: %io_input_1: i128, io_input_2: %io_input_2: i128) -> (io_output_0: i128, io_output_1: i128) {sv.namehint = "comp42s_0.io_input_1"}
    %CSAs_1.io_output_0, %CSAs_1.io_output_1 = hw.instance "CSAs_1" @CSA(io_input_0: %io_input_3: i128, io_input_1: %io_input_4: i128, io_input_2: %io_input_5: i128) -> (io_output_0: i128, io_output_1: i128) {sv.namehint = "comp42s_0.io_input_3"}
    %CSAs_2.io_output_0, %CSAs_2.io_output_1 = hw.instance "CSAs_2" @CSA(io_input_0: %io_input_6: i128, io_input_1: %io_input_7: i128, io_input_2: %io_input_8: i128) -> (io_output_0: i128, io_output_1: i128) {sv.namehint = "comp42s_1.io_input_1"}
    %CSAs_3.io_output_0, %CSAs_3.io_output_1 = hw.instance "CSAs_3" @CSA(io_input_0: %io_input_9: i128, io_input_1: %io_input_10: i128, io_input_2: %io_input_11: i128) -> (io_output_0: i128, io_output_1: i128) {sv.namehint = "comp42s_1.io_input_3"}
    %CSAs_4.io_output_0, %CSAs_4.io_output_1 = hw.instance "CSAs_4" @CSA(io_input_0: %io_input_12: i128, io_input_1: %io_input_13: i128, io_input_2: %io_input_14: i128) -> (io_output_0: i128, io_output_1: i128) {sv.namehint = "comp42s_2.io_input_1"}
    %CSAs_5.io_output_0, %CSAs_5.io_output_1 = hw.instance "CSAs_5" @CSA(io_input_0: %io_input_15: i128, io_input_1: %io_input_16: i128, io_input_2: %io_input_17: i128) -> (io_output_0: i128, io_output_1: i128) {sv.namehint = "comp42s_2.io_input_3"}
    %CSAs_6.io_output_0, %CSAs_6.io_output_1 = hw.instance "CSAs_6" @CSA(io_input_0: %comp42s_0.io_output_0: i128, io_input_1: %comp42s_0.io_output_1: i128, io_input_2: %comp42s_1.io_output_0: i128) -> (io_output_0: i128, io_output_1: i128) {sv.namehint = "comp42s_3.io_input_1"}
    %CSAs_7.io_output_0, %CSAs_7.io_output_1 = hw.instance "CSAs_7" @CSA(io_input_0: %comp42s_1.io_output_1: i128, io_input_1: %comp42s_2.io_output_0: i128, io_input_2: %comp42s_2.io_output_1: i128) -> (io_output_0: i128, io_output_1: i128) {sv.namehint = "comp42s_3.io_input_3"}
    %comp42s_0.io_output_0, %comp42s_0.io_output_1 = hw.instance "comp42s_0" @Compressor_42(io_input_0: %CSAs_0.io_output_0: i128, io_input_1: %CSAs_0.io_output_1: i128, io_input_2: %CSAs_1.io_output_0: i128, io_input_3: %CSAs_1.io_output_1: i128) -> (io_output_0: i128, io_output_1: i128) {sv.namehint = "CSAs_6.io_input_1"}
    %comp42s_1.io_output_0, %comp42s_1.io_output_1 = hw.instance "comp42s_1" @Compressor_42(io_input_0: %CSAs_2.io_output_0: i128, io_input_1: %CSAs_2.io_output_1: i128, io_input_2: %CSAs_3.io_output_0: i128, io_input_3: %CSAs_3.io_output_1: i128) -> (io_output_0: i128, io_output_1: i128) {sv.namehint = "CSAs_7.io_input_0"}
    %comp42s_2.io_output_0, %comp42s_2.io_output_1 = hw.instance "comp42s_2" @Compressor_42(io_input_0: %CSAs_4.io_output_0: i128, io_input_1: %CSAs_4.io_output_1: i128, io_input_2: %CSAs_5.io_output_0: i128, io_input_3: %CSAs_5.io_output_1: i128) -> (io_output_0: i128, io_output_1: i128) {sv.namehint = "CSAs_7.io_input_2"}
    %comp42s_3.io_output_0, %comp42s_3.io_output_1 = hw.instance "comp42s_3" @Compressor_42(io_input_0: %CSAs_6.io_output_0: i128, io_input_1: %CSAs_6.io_output_1: i128, io_input_2: %CSAs_7.io_output_0: i128, io_input_3: %CSAs_7.io_output_1: i128) -> (io_output_0: i128, io_output_1: i128) {sv.namehint = "io_output_1"}
    hw.output %comp42s_3.io_output_0, %comp42s_3.io_output_1 : i128, i128
  }
  hw.module private @MulTop(in %clock : !seq.clock, in %reset : i1, out io_input_ready : i1, in %io_input_valid : i1, in %io_input_bits_data_0 : i64, in %io_input_bits_data_1 : i64, in %io_input_bits_sign_0 : i1, in %io_input_bits_sign_1 : i1, in %io_output_ready : i1, out io_output_valid : i1, out io_output_bits : i128) {
    %c1_i63 = hw.constant 1 : i63
    %c0_i23 = hw.constant 0 : i23
    %c0_i60 = hw.constant 0 : i60
    %c0_i58 = hw.constant 0 : i58
    %c0_i3 = hw.constant 0 : i3
    %c0_i56 = hw.constant 0 : i56
    %c0_i5 = hw.constant 0 : i5
    %c0_i54 = hw.constant 0 : i54
    %c0_i7 = hw.constant 0 : i7
    %c0_i52 = hw.constant 0 : i52
    %c0_i9 = hw.constant 0 : i9
    %c0_i50 = hw.constant 0 : i50
    %c0_i11 = hw.constant 0 : i11
    %c0_i48 = hw.constant 0 : i48
    %c0_i13 = hw.constant 0 : i13
    %c0_i46 = hw.constant 0 : i46
    %c0_i15 = hw.constant 0 : i15
    %c0_i44 = hw.constant 0 : i44
    %c0_i17 = hw.constant 0 : i17
    %c0_i42 = hw.constant 0 : i42
    %c0_i40 = hw.constant 0 : i40
    %c0_i21 = hw.constant 0 : i21
    %c0_i38 = hw.constant 0 : i38
    %c0_i25 = hw.constant 0 : i25
    %c0_i27 = hw.constant 0 : i27
    %c0_i19 = hw.constant 0 : i19
    %c0_i62 = hw.constant 0 : i62
    %c0_i29 = hw.constant 0 : i29
    %c0_i30 = hw.constant 0 : i30
    %c0_i28 = hw.constant 0 : i28
    %c0_i33 = hw.constant 0 : i33
    %c0_i26 = hw.constant 0 : i26
    %c0_i35 = hw.constant 0 : i35
    %c0_i24 = hw.constant 0 : i24
    %c0_i37 = hw.constant 0 : i37
    %c0_i22 = hw.constant 0 : i22
    %c0_i39 = hw.constant 0 : i39
    %c0_i20 = hw.constant 0 : i20
    %c0_i41 = hw.constant 0 : i41
    %c0_i18 = hw.constant 0 : i18
    %c0_i43 = hw.constant 0 : i43
    %c0_i16 = hw.constant 0 : i16
    %c0_i45 = hw.constant 0 : i45
    %c0_i14 = hw.constant 0 : i14
    %c0_i47 = hw.constant 0 : i47
    %c0_i12 = hw.constant 0 : i12
    %c0_i49 = hw.constant 0 : i49
    %c0_i10 = hw.constant 0 : i10
    %c0_i51 = hw.constant 0 : i51
    %c0_i8 = hw.constant 0 : i8
    %c0_i53 = hw.constant 0 : i53
    %c0_i6 = hw.constant 0 : i6
    %c0_i55 = hw.constant 0 : i55
    %c0_i4 = hw.constant 0 : i4
    %c0_i57 = hw.constant 0 : i57
    %c0_i59 = hw.constant 0 : i59
    %c0_i61 = hw.constant 0 : i61
    %true = hw.constant true
    %c0_i2 = hw.constant 0 : i2
    %false = hw.constant false
    %c0_i31 = hw.constant 0 : i31
    %c0_i32 = hw.constant 0 : i32
    %c0_i34 = hw.constant 0 : i34
    %c-2_i2 = hw.constant -2 : i2
    %c1_i2 = hw.constant 1 : i2
    %isFree = seq.firreg %153 clock %clock reset sync %reset, %true {firrtl.random_init_start = 0 : ui64, sv.namehint = "isFree"} : i1
    %stage = seq.firreg %146 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1 : ui64} : i2
    %data_in_0 = seq.firreg %47 clock %clock {firrtl.random_init_start = 3 : ui64} : i64
    %data_in_1 = seq.firreg %48 clock %clock {firrtl.random_init_start = 67 : ui64} : i64
    %sign_in_0 = seq.firreg %49 clock %clock {firrtl.random_init_start = 131 : ui64} : i1
    %sign_in_1 = seq.firreg %50 clock %clock {firrtl.random_init_start = 132 : ui64} : i1
    %0 = comb.extract %67 from 63 {sv.namehint = "_op_1_T"} : (i64) -> i1
    %1 = comb.and bin %69, %0 {sv.namehint = "_walTree_io_input_17_T"} : i1
    %2 = comb.replicate %1 {sv.namehint = "_op_1_T_2"} : (i1) -> i2
    %boothSext.io_output_0, %boothSext.io_output_1, %boothSext.io_output_2, %boothSext.io_output_3, %boothSext.io_output_4, %boothSext.io_output_5, %boothSext.io_output_6, %boothSext.io_output_7, %boothSext.io_output_8, %boothSext.io_output_9, %boothSext.io_output_10, %boothSext.io_output_11, %boothSext.io_output_12, %boothSext.io_output_13, %boothSext.io_output_14, %boothSext.io_output_15, %boothSext.io_output_16 = hw.instance "boothSext" @BoothSext(io_op_0: %66: i64, io_sign: %68: i1, io_input_0: %74: i3, io_input_1: %78: i3, io_input_2: %80: i3, io_input_3: %84: i3, io_input_4: %88: i3, io_input_5: %92: i3, io_input_6: %96: i3, io_input_7: %100: i3, io_input_8: %104: i3, io_input_9: %108: i3, io_input_10: %112: i3, io_input_11: %116: i3, io_input_12: %120: i3, io_input_13: %124: i3, io_input_14: %129: i3, io_input_15: %135: i3, io_input_16: %37: i3) -> (io_output_0: i69, io_output_1: i69, io_output_2: i69, io_output_3: i69, io_output_4: i69, io_output_5: i69, io_output_6: i69, io_output_7: i69, io_output_8: i69, io_output_9: i69, io_output_10: i69, io_output_11: i69, io_output_12: i69, io_output_13: i69, io_output_14: i69, io_output_15: i69, io_output_16: i69)
    %walTree.io_output_0, %walTree.io_output_1 = hw.instance "walTree" @WalImproved(io_input_0: %72: i128, io_input_1: %76: i128, io_input_2: %137: i128, io_input_3: %82: i128, io_input_4: %86: i128, io_input_5: %90: i128, io_input_6: %94: i128, io_input_7: %98: i128, io_input_8: %102: i128, io_input_9: %106: i128, io_input_10: %110: i128, io_input_11: %114: i128, io_input_12: %118: i128, io_input_13: %122: i128, io_input_14: %127: i128, io_input_15: %132: i128, io_input_16: %138: i128, io_input_17: %139: i128) -> (io_output_0: i128, io_output_1: i128)
    %3 = comb.extract %67 from 0 {sv.namehint = "_boothSext_io_input_0_T"} : (i64) -> i2
    %4 = comb.concat %3, %false {sv.namehint = "_boothSext_io_input_0_T_1"} : i2, i1
    %5 = comb.extract %boothSext.io_output_0 from 2 {sv.namehint = "_walTree_io_input_0_T"} : (i69) -> i67
    %6 = comb.concat %c0_i61, %5 : i61, i67
    %7 = comb.extract %67 from 1 {sv.namehint = "_boothSext_io_input_1_T"} : (i64) -> i3
    %8 = comb.concat %c0_i59, %boothSext.io_output_1 : i59, i69
    %9 = comb.extract %67 from 3 {sv.namehint = "_boothSext_io_input_2_T"} : (i64) -> i3
    %10 = comb.concat %c0_i57, %boothSext.io_output_2, %c0_i2 : i57, i69, i2
    %11 = comb.extract %67 from 5 {sv.namehint = "_boothSext_io_input_3_T"} : (i64) -> i3
    %12 = comb.concat %c0_i55, %boothSext.io_output_3, %c0_i4 : i55, i69, i4
    %13 = comb.extract %67 from 7 {sv.namehint = "_boothSext_io_input_4_T"} : (i64) -> i3
    %14 = comb.concat %c0_i53, %boothSext.io_output_4, %c0_i6 : i53, i69, i6
    %15 = comb.extract %67 from 9 {sv.namehint = "_boothSext_io_input_5_T"} : (i64) -> i3
    %16 = comb.concat %c0_i51, %boothSext.io_output_5, %c0_i8 : i51, i69, i8
    %17 = comb.extract %67 from 11 {sv.namehint = "_boothSext_io_input_6_T"} : (i64) -> i3
    %18 = comb.concat %c0_i49, %boothSext.io_output_6, %c0_i10 : i49, i69, i10
    %19 = comb.extract %67 from 13 {sv.namehint = "_boothSext_io_input_7_T"} : (i64) -> i3
    %20 = comb.concat %c0_i47, %boothSext.io_output_7, %c0_i12 : i47, i69, i12
    %21 = comb.extract %67 from 15 {sv.namehint = "_boothSext_io_input_8_T"} : (i64) -> i3
    %22 = comb.concat %c0_i45, %boothSext.io_output_8, %c0_i14 : i45, i69, i14
    %23 = comb.extract %67 from 17 {sv.namehint = "_boothSext_io_input_9_T"} : (i64) -> i3
    %24 = comb.concat %c0_i43, %boothSext.io_output_9, %c0_i16 : i43, i69, i16
    %25 = comb.extract %67 from 19 {sv.namehint = "_boothSext_io_input_10_T"} : (i64) -> i3
    %26 = comb.concat %c0_i41, %boothSext.io_output_10, %c0_i18 : i41, i69, i18
    %27 = comb.extract %67 from 21 {sv.namehint = "_boothSext_io_input_11_T"} : (i64) -> i3
    %28 = comb.concat %c0_i39, %boothSext.io_output_11, %c0_i20 : i39, i69, i20
    %29 = comb.extract %67 from 23 {sv.namehint = "_boothSext_io_input_12_T"} : (i64) -> i3
    %30 = comb.concat %c0_i37, %boothSext.io_output_12, %c0_i22 : i37, i69, i22
    %31 = comb.extract %67 from 25 {sv.namehint = "_boothSext_io_input_13_T"} : (i64) -> i3
    %32 = comb.concat %c0_i35, %boothSext.io_output_13, %c0_i24 : i35, i69, i24
    %33 = comb.extract %67 from 27 {sv.namehint = "_boothSext_io_input_14_T"} : (i64) -> i3
    %34 = comb.concat %c0_i33, %boothSext.io_output_14, %c0_i26 : i33, i69, i26
    %35 = comb.extract %67 from 29 {sv.namehint = "_boothSext_io_input_15_T"} : (i64) -> i3
    %36 = comb.concat %c0_i31, %boothSext.io_output_15, %c0_i28 : i31, i69, i28
    %37 = comb.extract %67 from 31 {sv.namehint = "boothSext.io_input_16"} : (i64) -> i3
    %38 = comb.concat %c0_i29, %boothSext.io_output_16, %c0_i30 : i29, i69, i30
    %39 = comb.extract %67 from 33 {sv.namehint = "_walTree_io_input_17_T_2"} : (i64) -> i1
    %40 = comb.concat %c1_i63, %1, %c0_i31, %39, %c0_i32 : i63, i1, i31, i1, i32
    %part_sum_0 = seq.firreg %140 clock %clock {firrtl.random_init_start = 133 : ui64} : i128
    %part_sum_1 = seq.firreg %141 clock %clock {firrtl.random_init_start = 261 : ui64} : i128
    %out_valid = seq.firreg %152 clock %clock reset sync %reset, %false {firrtl.random_init_start = 389 : ui64} : i1
    %lo_34 = seq.firreg %52 clock %clock {firrtl.random_init_start = 390 : ui64} : i34
    %lo_34_in = seq.firreg %54 clock %clock {firrtl.random_init_start = 424 : ui64} : i1
    %hi_94 = seq.firreg %147 clock %clock {firrtl.random_init_start = 425 : ui64} : i94
    %41 = comb.extract %walTree.io_output_0 from 0 {sv.namehint = "_res_0_T"} : (i128) -> i34
    %42 = comb.extract %walTree.io_output_1 from 0 {sv.namehint = "_res_0_T_1"} : (i128) -> i34
    %43 = comb.concat %false, %41 : i1, i34
    %44 = comb.concat %false, %42 : i1, i34
    %45 = comb.add bin %43, %44 {sv.namehint = "res_0"} : i35
    %46 = comb.icmp bin eq %stage, %c0_i2 : i2
    %47 = comb.mux bin %46, %io_input_bits_data_0, %data_in_0 : i64
    %48 = comb.mux bin %46, %io_input_bits_data_1, %data_in_1 : i64
    %49 = comb.mux bin %46, %io_input_bits_sign_0, %sign_in_0 : i1
    %50 = comb.mux bin %46, %io_input_bits_sign_1, %sign_in_1 : i1
    %51 = comb.extract %45 from 0 {sv.namehint = "_lo_34_T"} : (i35) -> i34
    %52 = comb.mux bin %46, %51, %lo_34 : i34
    %53 = comb.extract %45 from 34 {sv.namehint = "_lo_34_in_T"} : (i35) -> i1
    %54 = comb.mux bin %46, %53, %lo_34_in : i1
    %55 = comb.extract %walTree.io_output_0 from 34 {sv.namehint = "_part_sum_0_T"} : (i128) -> i75
    %56 = comb.concat %c0_i19, %55, %c0_i34 : i19, i75, i34
    %57 = comb.mux bin %46, %56, %part_sum_0 : i128
    %58 = comb.extract %walTree.io_output_1 from 34 {sv.namehint = "_part_sum_1_T"} : (i128) -> i75
    %59 = comb.concat %c0_i19, %58, %c0_i34 : i19, i75, i34
    %60 = comb.mux bin %46, %59, %part_sum_1 : i128
    %61 = comb.and bin %46, %isFree, %io_input_valid : i1
    %62 = comb.xor %61, %true : i1
    %63 = comb.and %62, %isFree : i1
    %64 = comb.mux bin %61, %c1_i2, %stage : i2
    %65 = comb.icmp bin eq %stage, %c1_i2 : i2
    %66 = comb.mux bin %65, %data_in_0, %io_input_bits_data_0 {sv.namehint = "data_0"} : i64
    %67 = comb.mux bin %65, %data_in_1, %io_input_bits_data_1 {sv.namehint = "data_1"} : i64
    %68 = comb.mux bin %65, %sign_in_0, %io_input_bits_sign_0 {sv.namehint = "sign_0"} : i1
    %69 = comb.mux bin %65, %sign_in_1, %io_input_bits_sign_1 {sv.namehint = "sign_1"} : i1
    %70 = comb.mux bin %65, %c-2_i2, %64 : i2
    %71 = comb.concat %c0_i27, %boothSext.io_output_0, %c0_i32 : i27, i69, i32
    %72 = comb.mux bin %65, %71, %6 {sv.namehint = "walTree.io_input_0"} : i128
    %73 = comb.extract %67 from 33 {sv.namehint = "_boothSext_io_input_0_T_2"} : (i64) -> i3
    %74 = comb.mux bin %65, %73, %4 {sv.namehint = "boothSext.io_input_0"} : i3
    %75 = comb.concat %c0_i25, %boothSext.io_output_1, %c0_i34 : i25, i69, i34
    %76 = comb.mux bin %65, %75, %8 {sv.namehint = "walTree.io_input_1"} : i128
    %77 = comb.extract %67 from 35 {sv.namehint = "_boothSext_io_input_1_T_1"} : (i64) -> i3
    %78 = comb.mux bin %65, %77, %7 {sv.namehint = "boothSext.io_input_1"} : i3
    %79 = comb.extract %67 from 37 {sv.namehint = "_boothSext_io_input_2_T_1"} : (i64) -> i3
    %80 = comb.mux bin %65, %79, %9 {sv.namehint = "boothSext.io_input_2"} : i3
    %81 = comb.concat %c0_i21, %boothSext.io_output_3, %c0_i38 : i21, i69, i38
    %82 = comb.mux bin %65, %81, %12 {sv.namehint = "walTree.io_input_3"} : i128
    %83 = comb.extract %67 from 39 {sv.namehint = "_boothSext_io_input_3_T_1"} : (i64) -> i3
    %84 = comb.mux bin %65, %83, %11 {sv.namehint = "boothSext.io_input_3"} : i3
    %85 = comb.concat %c0_i19, %boothSext.io_output_4, %c0_i40 : i19, i69, i40
    %86 = comb.mux bin %65, %85, %14 {sv.namehint = "walTree.io_input_4"} : i128
    %87 = comb.extract %67 from 41 {sv.namehint = "_boothSext_io_input_4_T_1"} : (i64) -> i3
    %88 = comb.mux bin %65, %87, %13 {sv.namehint = "boothSext.io_input_4"} : i3
    %89 = comb.concat %c0_i17, %boothSext.io_output_5, %c0_i42 : i17, i69, i42
    %90 = comb.mux bin %65, %89, %16 {sv.namehint = "walTree.io_input_5"} : i128
    %91 = comb.extract %67 from 43 {sv.namehint = "_boothSext_io_input_5_T_1"} : (i64) -> i3
    %92 = comb.mux bin %65, %91, %15 {sv.namehint = "boothSext.io_input_5"} : i3
    %93 = comb.concat %c0_i15, %boothSext.io_output_6, %c0_i44 : i15, i69, i44
    %94 = comb.mux bin %65, %93, %18 {sv.namehint = "walTree.io_input_6"} : i128
    %95 = comb.extract %67 from 45 {sv.namehint = "_boothSext_io_input_6_T_1"} : (i64) -> i3
    %96 = comb.mux bin %65, %95, %17 {sv.namehint = "boothSext.io_input_6"} : i3
    %97 = comb.concat %c0_i13, %boothSext.io_output_7, %c0_i46 : i13, i69, i46
    %98 = comb.mux bin %65, %97, %20 {sv.namehint = "walTree.io_input_7"} : i128
    %99 = comb.extract %67 from 47 {sv.namehint = "_boothSext_io_input_7_T_1"} : (i64) -> i3
    %100 = comb.mux bin %65, %99, %19 {sv.namehint = "boothSext.io_input_7"} : i3
    %101 = comb.concat %c0_i11, %boothSext.io_output_8, %c0_i48 : i11, i69, i48
    %102 = comb.mux bin %65, %101, %22 {sv.namehint = "walTree.io_input_8"} : i128
    %103 = comb.extract %67 from 49 {sv.namehint = "_boothSext_io_input_8_T_1"} : (i64) -> i3
    %104 = comb.mux bin %65, %103, %21 {sv.namehint = "boothSext.io_input_8"} : i3
    %105 = comb.concat %c0_i9, %boothSext.io_output_9, %c0_i50 : i9, i69, i50
    %106 = comb.mux bin %65, %105, %24 {sv.namehint = "walTree.io_input_9"} : i128
    %107 = comb.extract %67 from 51 {sv.namehint = "_boothSext_io_input_9_T_1"} : (i64) -> i3
    %108 = comb.mux bin %65, %107, %23 {sv.namehint = "boothSext.io_input_9"} : i3
    %109 = comb.concat %c0_i7, %boothSext.io_output_10, %c0_i52 : i7, i69, i52
    %110 = comb.mux bin %65, %109, %26 {sv.namehint = "walTree.io_input_10"} : i128
    %111 = comb.extract %67 from 53 {sv.namehint = "_boothSext_io_input_10_T_1"} : (i64) -> i3
    %112 = comb.mux bin %65, %111, %25 {sv.namehint = "boothSext.io_input_10"} : i3
    %113 = comb.concat %c0_i5, %boothSext.io_output_11, %c0_i54 : i5, i69, i54
    %114 = comb.mux bin %65, %113, %28 {sv.namehint = "walTree.io_input_11"} : i128
    %115 = comb.extract %67 from 55 {sv.namehint = "_boothSext_io_input_11_T_1"} : (i64) -> i3
    %116 = comb.mux bin %65, %115, %27 {sv.namehint = "boothSext.io_input_11"} : i3
    %117 = comb.concat %c0_i3, %boothSext.io_output_12, %c0_i56 : i3, i69, i56
    %118 = comb.mux bin %65, %117, %30 {sv.namehint = "walTree.io_input_12"} : i128
    %119 = comb.extract %67 from 57 {sv.namehint = "_boothSext_io_input_12_T_1"} : (i64) -> i3
    %120 = comb.mux bin %65, %119, %29 {sv.namehint = "boothSext.io_input_12"} : i3
    %121 = comb.concat %false, %boothSext.io_output_13, %c0_i58 : i1, i69, i58
    %122 = comb.mux bin %65, %121, %32 {sv.namehint = "walTree.io_input_13"} : i128
    %123 = comb.extract %67 from 59 {sv.namehint = "_boothSext_io_input_13_T_1"} : (i64) -> i3
    %124 = comb.mux bin %65, %123, %31 {sv.namehint = "boothSext.io_input_13"} : i3
    %125 = comb.extract %boothSext.io_output_14 from 0 {sv.namehint = "_walTree_io_input_14_T_1"} : (i69) -> i68
    %126 = comb.concat %125, %c0_i60 {sv.namehint = "_walTree_io_input_14_T_2"} : i68, i60
    %127 = comb.mux bin %65, %126, %34 {sv.namehint = "walTree.io_input_14"} : i128
    %128 = comb.extract %67 from 61 {sv.namehint = "_boothSext_io_input_14_T_1"} : (i64) -> i3
    %129 = comb.mux bin %65, %128, %33 {sv.namehint = "boothSext.io_input_14"} : i3
    %130 = comb.extract %boothSext.io_output_15 from 0 {sv.namehint = "_walTree_io_input_15_T_1"} : (i69) -> i66
    %131 = comb.concat %130, %c0_i62 {sv.namehint = "_walTree_io_input_15_T_2"} : i66, i62
    %132 = comb.mux bin %65, %131, %36 {sv.namehint = "walTree.io_input_15"} : i128
    %133 = comb.extract %67 from 63 : (i64) -> i1
    %134 = comb.concat %2, %133 {sv.namehint = "_boothSext_io_input_15_T_1"} : i2, i1
    %135 = comb.mux bin %65, %134, %35 {sv.namehint = "boothSext.io_input_15"} : i3
    %136 = comb.concat %c0_i23, %boothSext.io_output_2, %false, %lo_34_in, %c0_i34 : i23, i69, i1, i1, i34
    %137 = comb.mux bin %65, %136, %10 {sv.namehint = "walTree.io_input_2"} : i128
    %138 = comb.mux bin %65, %part_sum_0, %38 {sv.namehint = "walTree.io_input_16"} : i128
    %139 = comb.mux bin %65, %part_sum_1, %40 {sv.namehint = "walTree.io_input_17"} : i128
    %140 = comb.mux bin %65, %walTree.io_output_0, %57 : i128
    %141 = comb.mux bin %65, %walTree.io_output_1, %60 : i128
    %142 = comb.icmp bin eq %stage, %c-2_i2 : i2
    %143 = comb.extract %part_sum_0 from 34 {sv.namehint = "_res_T"} : (i128) -> i94
    %144 = comb.extract %part_sum_1 from 34 {sv.namehint = "_res_T_1"} : (i128) -> i94
    %145 = comb.add bin %143, %144 {sv.namehint = "_res_T_2"} : i94
    %146 = comb.mux bin %142, %c0_i2, %70 : i2
    %147 = comb.mux bin %142, %145, %hi_94 : i94
    %148 = comb.concat %147, %lo_34 {sv.namehint = "io_output_bits"} : i94, i34
    %149 = comb.or %142, %out_valid {sv.namehint = "io_output_valid"} : i1
    %150 = comb.and bin %io_output_ready, %149 : i1
    %151 = comb.xor %150, %true : i1
    %152 = comb.and %151, %149 : i1
    %153 = comb.or %150, %63 : i1
    hw.output %isFree, %149, %148 : i1, i1, i128
  }
  hw.module private @DivTop(in %clock : !seq.clock, in %reset : i1, out io_input_ready : i1, in %io_input_valid : i1, in %io_input_bits_dividend : i64, in %io_input_bits_divisor : i64, in %io_input_bits_issigned : i1, in %io_output_ready : i1, out io_output_valid : i1, out io_output_bits_quotient : i64, out io_output_bits_remainder : i64) {
    %c1_i6 = hw.constant 1 : i6
    %true = hw.constant true
    %c0_i249 = hw.constant 0 : i249
    %c0_i127 = hw.constant 0 : i127
    %c0_i4 = hw.constant 0 : i4
    %c0_i8 = hw.constant 0 : i8
    %c0_i16 = hw.constant 0 : i16
    %c0_i32 = hw.constant 0 : i32
    %c0_i64 = hw.constant 0 : i64
    %c0_i3 = hw.constant 0 : i3
    %c-4_i3 = hw.constant -4 : i3
    %false = hw.constant false
    %c2_i3 = hw.constant 2 : i3
    %c-2_i2 = hw.constant -2 : i2
    %c-1_i2 = hw.constant -1 : i2
    %c-1_i6 = hw.constant -1 : i6
    %c3_i3 = hw.constant 3 : i3
    %c18446744073709551615_i65 = hw.constant 18446744073709551615 : i65
    %c0_i6 = hw.constant 0 : i6
    %c63_i7 = hw.constant 63 : i7
    %state = seq.firreg %376 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 0 : ui64} : i3
    %A = seq.firreg %369 clock %clock {firrtl.random_init_start = 3 : ui64} : i129
    %0 = comb.extract %A from 64 {sv.namehint = "hi"} : (i129) -> i65
    %1 = comb.extract %A from 0 {sv.namehint = "lo"} : (i129) -> i64
    %d = seq.firreg %31 clock %clock {firrtl.random_init_start = 132 : ui64} : i64
    %n = seq.firreg %371 clock %clock {firrtl.random_init_start = 196 : ui64} : i6
    %dividendSign = seq.firreg %15 clock %clock {firrtl.random_init_start = 202 : ui64} : i1
    %divisorSign = seq.firreg %19 clock %clock {firrtl.random_init_start = 203 : ui64} : i1
    %2 = comb.icmp bin eq %state, %c0_i3 {sv.namehint = "io_input_ready"} : i3
    %3 = comb.icmp bin eq %state, %c-4_i3 {sv.namehint = "io_output_valid"} : i3
    %4 = comb.xor bin %dividendSign, %divisorSign {sv.namehint = "_io_output_bits_quotient_T"} : i1
    %5 = comb.sub bin %c0_i64, %1 {sv.namehint = "_io_output_bits_quotient_T_2"} : i64
    %6 = comb.mux bin %4, %5, %1 {sv.namehint = "io_output_bits_quotient"} : i64
    %7 = comb.extract %A from 65 {sv.namehint = "_io_output_bits_remainder_T_3"} : (i129) -> i64
    %8 = comb.sub bin %c0_i64, %7 {sv.namehint = "_io_output_bits_remainder_T_2"} : i64
    %9 = comb.mux bin %dividendSign, %8, %7 {sv.namehint = "io_output_bits_remainder"} : i64
    %10 = comb.icmp bin eq %io_input_bits_divisor, %c0_i64 {sv.namehint = "_state_T"} : i64
    %11 = comb.concat %io_input_bits_dividend, %c18446744073709551615_i65 {sv.namehint = "_A_T_3"} : i64, i65
    %12 = comb.extract %io_input_bits_dividend from 63 {sv.namehint = "_dividendSign_T"} : (i64) -> i1
    %13 = comb.xor %10, %true : i1
    %14 = comb.and %13, %io_input_bits_issigned, %12 : i1
    %15 = comb.mux bin %2, %14, %dividendSign : i1
    %16 = comb.extract %io_input_bits_divisor from 63 {sv.namehint = "_divisorSign_T"} : (i64) -> i1
    %17 = comb.xor %10, %true : i1
    %18 = comb.and %17, %io_input_bits_issigned, %16 : i1
    %19 = comb.mux bin %2, %18, %divisorSign : i1
    %20 = comb.sub bin %c0_i64, %io_input_bits_dividend {sv.namehint = "_A_T_5"} : i64
    %21 = comb.and bin %io_input_bits_issigned, %12 : i1
    %22 = comb.mux bin %21, %20, %io_input_bits_dividend : i64
    %23 = comb.concat %c0_i64, %22, %false : i64, i64, i1
    %24 = comb.mux bin %10, %11, %23 : i129
    %25 = comb.mux bin %2, %24, %A : i129
    %26 = comb.sub bin %c0_i64, %io_input_bits_divisor {sv.namehint = "_d_T_1"} : i64
    %27 = comb.and bin %io_input_bits_issigned, %16 : i1
    %28 = comb.xor %27, %true : i1
    %29 = comb.or %10, %28 : i1
    %30 = comb.mux bin %29, %io_input_bits_divisor, %26 : i64
    %31 = comb.mux bin %2, %30, %d : i64
    %32 = comb.mux bin %10, %c-4_i3, %c2_i3 {sv.namehint = "_state_T_1"} : i3
    %33 = comb.and bin %2, %io_input_valid : i1
    %34 = comb.mux bin %33, %32, %state : i3
    %35 = comb.icmp bin eq %state, %c2_i3 : i3
    %36 = comb.extract %d from 32 {sv.namehint = "skip_hi"} : (i64) -> i32
    %37 = comb.icmp bin ne %36, %c0_i32 {sv.namehint = "skip_useHi"} : i32
    %38 = comb.extract %d from 48 {sv.namehint = "skip_hi_1"} : (i64) -> i16
    %39 = comb.icmp bin ne %38, %c0_i16 {sv.namehint = "skip_useHi_1"} : i16
    %40 = comb.extract %d from 56 {sv.namehint = "skip_hi_2"} : (i64) -> i8
    %41 = comb.icmp bin ne %40, %c0_i8 {sv.namehint = "skip_useHi_2"} : i8
    %42 = comb.extract %d from 60 {sv.namehint = "skip_hi_3"} : (i64) -> i4
    %43 = comb.icmp bin ne %42, %c0_i4 {sv.namehint = "skip_useHi_3"} : i4
    %44 = comb.extract %d from 63 {sv.namehint = "_skip_T"} : (i64) -> i1
    %45 = comb.extract %d from 62 {sv.namehint = "_skip_T_1"} : (i64) -> i1
    %46 = comb.extract %d from 61 {sv.namehint = "_skip_T_2"} : (i64) -> i1
    %47 = comb.concat %false, %46 : i1, i1
    %48 = comb.mux bin %45, %c-2_i2, %47 {sv.namehint = "_skip_T_3"} : i2
    %49 = comb.mux bin %44, %c-1_i2, %48 {sv.namehint = "_skip_T_4"} : i2
    %50 = comb.extract %d from 59 {sv.namehint = "_skip_T_5"} : (i64) -> i1
    %51 = comb.extract %d from 58 {sv.namehint = "_skip_T_6"} : (i64) -> i1
    %52 = comb.extract %d from 57 {sv.namehint = "_skip_T_7"} : (i64) -> i1
    %53 = comb.concat %false, %52 : i1, i1
    %54 = comb.mux bin %51, %c-2_i2, %53 {sv.namehint = "_skip_T_8"} : i2
    %55 = comb.mux bin %50, %c-1_i2, %54 {sv.namehint = "_skip_T_9"} : i2
    %56 = comb.mux bin %43, %49, %55 {sv.namehint = "_skip_T_10"} : i2
    %57 = comb.concat %43, %56 {sv.namehint = "_skip_T_11"} : i1, i2
    %58 = comb.extract %d from 52 {sv.namehint = "skip_hi_4"} : (i64) -> i4
    %59 = comb.icmp bin ne %58, %c0_i4 {sv.namehint = "skip_useHi_4"} : i4
    %60 = comb.extract %d from 55 {sv.namehint = "_skip_T_12"} : (i64) -> i1
    %61 = comb.extract %d from 54 {sv.namehint = "_skip_T_13"} : (i64) -> i1
    %62 = comb.extract %d from 53 {sv.namehint = "_skip_T_14"} : (i64) -> i1
    %63 = comb.concat %false, %62 : i1, i1
    %64 = comb.mux bin %61, %c-2_i2, %63 {sv.namehint = "_skip_T_15"} : i2
    %65 = comb.mux bin %60, %c-1_i2, %64 {sv.namehint = "_skip_T_16"} : i2
    %66 = comb.extract %d from 51 {sv.namehint = "_skip_T_17"} : (i64) -> i1
    %67 = comb.extract %d from 50 {sv.namehint = "_skip_T_18"} : (i64) -> i1
    %68 = comb.extract %d from 49 {sv.namehint = "_skip_T_19"} : (i64) -> i1
    %69 = comb.concat %false, %68 : i1, i1
    %70 = comb.mux bin %67, %c-2_i2, %69 {sv.namehint = "_skip_T_20"} : i2
    %71 = comb.mux bin %66, %c-1_i2, %70 {sv.namehint = "_skip_T_21"} : i2
    %72 = comb.mux bin %59, %65, %71 {sv.namehint = "_skip_T_22"} : i2
    %73 = comb.concat %59, %72 {sv.namehint = "_skip_T_23"} : i1, i2
    %74 = comb.mux bin %41, %57, %73 {sv.namehint = "_skip_T_24"} : i3
    %75 = comb.concat %41, %74 {sv.namehint = "_skip_T_25"} : i1, i3
    %76 = comb.extract %d from 40 {sv.namehint = "skip_hi_5"} : (i64) -> i8
    %77 = comb.icmp bin ne %76, %c0_i8 {sv.namehint = "skip_useHi_5"} : i8
    %78 = comb.extract %d from 44 {sv.namehint = "skip_hi_6"} : (i64) -> i4
    %79 = comb.icmp bin ne %78, %c0_i4 {sv.namehint = "skip_useHi_6"} : i4
    %80 = comb.extract %d from 47 {sv.namehint = "_skip_T_26"} : (i64) -> i1
    %81 = comb.extract %d from 46 {sv.namehint = "_skip_T_27"} : (i64) -> i1
    %82 = comb.extract %d from 45 {sv.namehint = "_skip_T_28"} : (i64) -> i1
    %83 = comb.concat %false, %82 : i1, i1
    %84 = comb.mux bin %81, %c-2_i2, %83 {sv.namehint = "_skip_T_29"} : i2
    %85 = comb.mux bin %80, %c-1_i2, %84 {sv.namehint = "_skip_T_30"} : i2
    %86 = comb.extract %d from 43 {sv.namehint = "_skip_T_31"} : (i64) -> i1
    %87 = comb.extract %d from 42 {sv.namehint = "_skip_T_32"} : (i64) -> i1
    %88 = comb.extract %d from 41 {sv.namehint = "_skip_T_33"} : (i64) -> i1
    %89 = comb.concat %false, %88 : i1, i1
    %90 = comb.mux bin %87, %c-2_i2, %89 {sv.namehint = "_skip_T_34"} : i2
    %91 = comb.mux bin %86, %c-1_i2, %90 {sv.namehint = "_skip_T_35"} : i2
    %92 = comb.mux bin %79, %85, %91 {sv.namehint = "_skip_T_36"} : i2
    %93 = comb.concat %79, %92 {sv.namehint = "_skip_T_37"} : i1, i2
    %94 = comb.extract %d from 36 {sv.namehint = "skip_hi_7"} : (i64) -> i4
    %95 = comb.icmp bin ne %94, %c0_i4 {sv.namehint = "skip_useHi_7"} : i4
    %96 = comb.extract %d from 39 {sv.namehint = "_skip_T_38"} : (i64) -> i1
    %97 = comb.extract %d from 38 {sv.namehint = "_skip_T_39"} : (i64) -> i1
    %98 = comb.extract %d from 37 {sv.namehint = "_skip_T_40"} : (i64) -> i1
    %99 = comb.concat %false, %98 : i1, i1
    %100 = comb.mux bin %97, %c-2_i2, %99 {sv.namehint = "_skip_T_41"} : i2
    %101 = comb.mux bin %96, %c-1_i2, %100 {sv.namehint = "_skip_T_42"} : i2
    %102 = comb.extract %d from 35 {sv.namehint = "_skip_T_43"} : (i64) -> i1
    %103 = comb.extract %d from 34 {sv.namehint = "_skip_T_44"} : (i64) -> i1
    %104 = comb.extract %d from 33 {sv.namehint = "_skip_T_45"} : (i64) -> i1
    %105 = comb.concat %false, %104 : i1, i1
    %106 = comb.mux bin %103, %c-2_i2, %105 {sv.namehint = "_skip_T_46"} : i2
    %107 = comb.mux bin %102, %c-1_i2, %106 {sv.namehint = "_skip_T_47"} : i2
    %108 = comb.mux bin %95, %101, %107 {sv.namehint = "_skip_T_48"} : i2
    %109 = comb.concat %95, %108 {sv.namehint = "_skip_T_49"} : i1, i2
    %110 = comb.mux bin %77, %93, %109 {sv.namehint = "_skip_T_50"} : i3
    %111 = comb.concat %77, %110 {sv.namehint = "_skip_T_51"} : i1, i3
    %112 = comb.mux bin %39, %75, %111 {sv.namehint = "_skip_T_52"} : i4
    %113 = comb.concat %39, %112 {sv.namehint = "_skip_T_53"} : i1, i4
    %114 = comb.extract %d from 16 {sv.namehint = "skip_hi_8"} : (i64) -> i16
    %115 = comb.icmp bin ne %114, %c0_i16 {sv.namehint = "skip_useHi_8"} : i16
    %116 = comb.extract %d from 24 {sv.namehint = "skip_hi_9"} : (i64) -> i8
    %117 = comb.icmp bin ne %116, %c0_i8 {sv.namehint = "skip_useHi_9"} : i8
    %118 = comb.extract %d from 28 {sv.namehint = "skip_hi_10"} : (i64) -> i4
    %119 = comb.icmp bin ne %118, %c0_i4 {sv.namehint = "skip_useHi_10"} : i4
    %120 = comb.extract %d from 31 {sv.namehint = "_skip_T_54"} : (i64) -> i1
    %121 = comb.extract %d from 30 {sv.namehint = "_skip_T_55"} : (i64) -> i1
    %122 = comb.extract %d from 29 {sv.namehint = "_skip_T_56"} : (i64) -> i1
    %123 = comb.concat %false, %122 : i1, i1
    %124 = comb.mux bin %121, %c-2_i2, %123 {sv.namehint = "_skip_T_57"} : i2
    %125 = comb.mux bin %120, %c-1_i2, %124 {sv.namehint = "_skip_T_58"} : i2
    %126 = comb.extract %d from 27 {sv.namehint = "_skip_T_59"} : (i64) -> i1
    %127 = comb.extract %d from 26 {sv.namehint = "_skip_T_60"} : (i64) -> i1
    %128 = comb.extract %d from 25 {sv.namehint = "_skip_T_61"} : (i64) -> i1
    %129 = comb.concat %false, %128 : i1, i1
    %130 = comb.mux bin %127, %c-2_i2, %129 {sv.namehint = "_skip_T_62"} : i2
    %131 = comb.mux bin %126, %c-1_i2, %130 {sv.namehint = "_skip_T_63"} : i2
    %132 = comb.mux bin %119, %125, %131 {sv.namehint = "_skip_T_64"} : i2
    %133 = comb.concat %119, %132 {sv.namehint = "_skip_T_65"} : i1, i2
    %134 = comb.extract %d from 20 {sv.namehint = "skip_hi_11"} : (i64) -> i4
    %135 = comb.icmp bin ne %134, %c0_i4 {sv.namehint = "skip_useHi_11"} : i4
    %136 = comb.extract %d from 23 {sv.namehint = "_skip_T_66"} : (i64) -> i1
    %137 = comb.extract %d from 22 {sv.namehint = "_skip_T_67"} : (i64) -> i1
    %138 = comb.extract %d from 21 {sv.namehint = "_skip_T_68"} : (i64) -> i1
    %139 = comb.concat %false, %138 : i1, i1
    %140 = comb.mux bin %137, %c-2_i2, %139 {sv.namehint = "_skip_T_69"} : i2
    %141 = comb.mux bin %136, %c-1_i2, %140 {sv.namehint = "_skip_T_70"} : i2
    %142 = comb.extract %d from 19 {sv.namehint = "_skip_T_71"} : (i64) -> i1
    %143 = comb.extract %d from 18 {sv.namehint = "_skip_T_72"} : (i64) -> i1
    %144 = comb.extract %d from 17 {sv.namehint = "_skip_T_73"} : (i64) -> i1
    %145 = comb.concat %false, %144 : i1, i1
    %146 = comb.mux bin %143, %c-2_i2, %145 {sv.namehint = "_skip_T_74"} : i2
    %147 = comb.mux bin %142, %c-1_i2, %146 {sv.namehint = "_skip_T_75"} : i2
    %148 = comb.mux bin %135, %141, %147 {sv.namehint = "_skip_T_76"} : i2
    %149 = comb.concat %135, %148 {sv.namehint = "_skip_T_77"} : i1, i2
    %150 = comb.mux bin %117, %133, %149 {sv.namehint = "_skip_T_78"} : i3
    %151 = comb.concat %117, %150 {sv.namehint = "_skip_T_79"} : i1, i3
    %152 = comb.extract %d from 8 {sv.namehint = "skip_hi_12"} : (i64) -> i8
    %153 = comb.icmp bin ne %152, %c0_i8 {sv.namehint = "skip_useHi_12"} : i8
    %154 = comb.extract %d from 12 {sv.namehint = "skip_hi_13"} : (i64) -> i4
    %155 = comb.icmp bin ne %154, %c0_i4 {sv.namehint = "skip_useHi_13"} : i4
    %156 = comb.extract %d from 15 {sv.namehint = "_skip_T_80"} : (i64) -> i1
    %157 = comb.extract %d from 14 {sv.namehint = "_skip_T_81"} : (i64) -> i1
    %158 = comb.extract %d from 13 {sv.namehint = "_skip_T_82"} : (i64) -> i1
    %159 = comb.concat %false, %158 : i1, i1
    %160 = comb.mux bin %157, %c-2_i2, %159 {sv.namehint = "_skip_T_83"} : i2
    %161 = comb.mux bin %156, %c-1_i2, %160 {sv.namehint = "_skip_T_84"} : i2
    %162 = comb.extract %d from 11 {sv.namehint = "_skip_T_85"} : (i64) -> i1
    %163 = comb.extract %d from 10 {sv.namehint = "_skip_T_86"} : (i64) -> i1
    %164 = comb.extract %d from 9 {sv.namehint = "_skip_T_87"} : (i64) -> i1
    %165 = comb.concat %false, %164 : i1, i1
    %166 = comb.mux bin %163, %c-2_i2, %165 {sv.namehint = "_skip_T_88"} : i2
    %167 = comb.mux bin %162, %c-1_i2, %166 {sv.namehint = "_skip_T_89"} : i2
    %168 = comb.mux bin %155, %161, %167 {sv.namehint = "_skip_T_90"} : i2
    %169 = comb.concat %155, %168 {sv.namehint = "_skip_T_91"} : i1, i2
    %170 = comb.extract %d from 4 {sv.namehint = "skip_hi_14"} : (i64) -> i4
    %171 = comb.icmp bin ne %170, %c0_i4 {sv.namehint = "skip_useHi_14"} : i4
    %172 = comb.extract %d from 7 {sv.namehint = "_skip_T_92"} : (i64) -> i1
    %173 = comb.extract %d from 6 {sv.namehint = "_skip_T_93"} : (i64) -> i1
    %174 = comb.extract %d from 5 {sv.namehint = "_skip_T_94"} : (i64) -> i1
    %175 = comb.concat %false, %174 : i1, i1
    %176 = comb.mux bin %173, %c-2_i2, %175 {sv.namehint = "_skip_T_95"} : i2
    %177 = comb.mux bin %172, %c-1_i2, %176 {sv.namehint = "_skip_T_96"} : i2
    %178 = comb.extract %d from 3 {sv.namehint = "_skip_T_97"} : (i64) -> i1
    %179 = comb.extract %d from 2 {sv.namehint = "_skip_T_98"} : (i64) -> i1
    %180 = comb.extract %d from 1 {sv.namehint = "_skip_T_99"} : (i64) -> i1
    %181 = comb.concat %false, %180 : i1, i1
    %182 = comb.mux bin %179, %c-2_i2, %181 {sv.namehint = "_skip_T_100"} : i2
    %183 = comb.mux bin %178, %c-1_i2, %182 {sv.namehint = "_skip_T_101"} : i2
    %184 = comb.mux bin %171, %177, %183 {sv.namehint = "_skip_T_102"} : i2
    %185 = comb.concat %171, %184 {sv.namehint = "_skip_T_103"} : i1, i2
    %186 = comb.mux bin %153, %169, %185 {sv.namehint = "_skip_T_104"} : i3
    %187 = comb.concat %153, %186 {sv.namehint = "_skip_T_105"} : i1, i3
    %188 = comb.mux bin %115, %151, %187 {sv.namehint = "_skip_T_106"} : i4
    %189 = comb.concat %115, %188 {sv.namehint = "_skip_T_107"} : i1, i4
    %190 = comb.mux bin %37, %113, %189 {sv.namehint = "_skip_T_108"} : i5
    %191 = comb.extract %A from 64 {sv.namehint = "skip_hi_15"} : (i129) -> i1
    %192 = comb.extract %A from 32 {sv.namehint = "skip_hi_16"} : (i129) -> i32
    %193 = comb.icmp bin ne %192, %c0_i32 {sv.namehint = "skip_useHi_16"} : i32
    %194 = comb.extract %A from 48 {sv.namehint = "skip_hi_17"} : (i129) -> i16
    %195 = comb.icmp bin ne %194, %c0_i16 {sv.namehint = "skip_useHi_17"} : i16
    %196 = comb.extract %A from 56 {sv.namehint = "skip_hi_18"} : (i129) -> i8
    %197 = comb.icmp bin ne %196, %c0_i8 {sv.namehint = "skip_useHi_18"} : i8
    %198 = comb.extract %A from 60 {sv.namehint = "skip_hi_19"} : (i129) -> i4
    %199 = comb.icmp bin ne %198, %c0_i4 {sv.namehint = "skip_useHi_19"} : i4
    %200 = comb.extract %A from 63 {sv.namehint = "_skip_T_112"} : (i129) -> i1
    %201 = comb.extract %A from 62 {sv.namehint = "_skip_T_113"} : (i129) -> i1
    %202 = comb.extract %A from 61 {sv.namehint = "_skip_T_114"} : (i129) -> i1
    %203 = comb.concat %false, %202 : i1, i1
    %204 = comb.mux bin %201, %c-2_i2, %203 {sv.namehint = "_skip_T_115"} : i2
    %205 = comb.mux bin %200, %c-1_i2, %204 {sv.namehint = "_skip_T_116"} : i2
    %206 = comb.extract %A from 59 {sv.namehint = "_skip_T_117"} : (i129) -> i1
    %207 = comb.extract %A from 58 {sv.namehint = "_skip_T_118"} : (i129) -> i1
    %208 = comb.extract %A from 57 {sv.namehint = "_skip_T_119"} : (i129) -> i1
    %209 = comb.concat %false, %208 : i1, i1
    %210 = comb.mux bin %207, %c-2_i2, %209 {sv.namehint = "_skip_T_120"} : i2
    %211 = comb.mux bin %206, %c-1_i2, %210 {sv.namehint = "_skip_T_121"} : i2
    %212 = comb.mux bin %199, %205, %211 {sv.namehint = "_skip_T_122"} : i2
    %213 = comb.concat %199, %212 {sv.namehint = "_skip_T_123"} : i1, i2
    %214 = comb.extract %A from 52 {sv.namehint = "skip_hi_20"} : (i129) -> i4
    %215 = comb.icmp bin ne %214, %c0_i4 {sv.namehint = "skip_useHi_20"} : i4
    %216 = comb.extract %A from 55 {sv.namehint = "_skip_T_124"} : (i129) -> i1
    %217 = comb.extract %A from 54 {sv.namehint = "_skip_T_125"} : (i129) -> i1
    %218 = comb.extract %A from 53 {sv.namehint = "_skip_T_126"} : (i129) -> i1
    %219 = comb.concat %false, %218 : i1, i1
    %220 = comb.mux bin %217, %c-2_i2, %219 {sv.namehint = "_skip_T_127"} : i2
    %221 = comb.mux bin %216, %c-1_i2, %220 {sv.namehint = "_skip_T_128"} : i2
    %222 = comb.extract %A from 51 {sv.namehint = "_skip_T_129"} : (i129) -> i1
    %223 = comb.extract %A from 50 {sv.namehint = "_skip_T_130"} : (i129) -> i1
    %224 = comb.extract %A from 49 {sv.namehint = "_skip_T_131"} : (i129) -> i1
    %225 = comb.concat %false, %224 : i1, i1
    %226 = comb.mux bin %223, %c-2_i2, %225 {sv.namehint = "_skip_T_132"} : i2
    %227 = comb.mux bin %222, %c-1_i2, %226 {sv.namehint = "_skip_T_133"} : i2
    %228 = comb.mux bin %215, %221, %227 {sv.namehint = "_skip_T_134"} : i2
    %229 = comb.concat %215, %228 {sv.namehint = "_skip_T_135"} : i1, i2
    %230 = comb.mux bin %197, %213, %229 {sv.namehint = "_skip_T_136"} : i3
    %231 = comb.concat %197, %230 {sv.namehint = "_skip_T_137"} : i1, i3
    %232 = comb.extract %A from 40 {sv.namehint = "skip_hi_21"} : (i129) -> i8
    %233 = comb.icmp bin ne %232, %c0_i8 {sv.namehint = "skip_useHi_21"} : i8
    %234 = comb.extract %A from 44 {sv.namehint = "skip_hi_22"} : (i129) -> i4
    %235 = comb.icmp bin ne %234, %c0_i4 {sv.namehint = "skip_useHi_22"} : i4
    %236 = comb.extract %A from 47 {sv.namehint = "_skip_T_138"} : (i129) -> i1
    %237 = comb.extract %A from 46 {sv.namehint = "_skip_T_139"} : (i129) -> i1
    %238 = comb.extract %A from 45 {sv.namehint = "_skip_T_140"} : (i129) -> i1
    %239 = comb.concat %false, %238 : i1, i1
    %240 = comb.mux bin %237, %c-2_i2, %239 {sv.namehint = "_skip_T_141"} : i2
    %241 = comb.mux bin %236, %c-1_i2, %240 {sv.namehint = "_skip_T_142"} : i2
    %242 = comb.extract %A from 43 {sv.namehint = "_skip_T_143"} : (i129) -> i1
    %243 = comb.extract %A from 42 {sv.namehint = "_skip_T_144"} : (i129) -> i1
    %244 = comb.extract %A from 41 {sv.namehint = "_skip_T_145"} : (i129) -> i1
    %245 = comb.concat %false, %244 : i1, i1
    %246 = comb.mux bin %243, %c-2_i2, %245 {sv.namehint = "_skip_T_146"} : i2
    %247 = comb.mux bin %242, %c-1_i2, %246 {sv.namehint = "_skip_T_147"} : i2
    %248 = comb.mux bin %235, %241, %247 {sv.namehint = "_skip_T_148"} : i2
    %249 = comb.concat %235, %248 {sv.namehint = "_skip_T_149"} : i1, i2
    %250 = comb.extract %A from 36 {sv.namehint = "skip_hi_23"} : (i129) -> i4
    %251 = comb.icmp bin ne %250, %c0_i4 {sv.namehint = "skip_useHi_23"} : i4
    %252 = comb.extract %A from 39 {sv.namehint = "_skip_T_150"} : (i129) -> i1
    %253 = comb.extract %A from 38 {sv.namehint = "_skip_T_151"} : (i129) -> i1
    %254 = comb.extract %A from 37 {sv.namehint = "_skip_T_152"} : (i129) -> i1
    %255 = comb.concat %false, %254 : i1, i1
    %256 = comb.mux bin %253, %c-2_i2, %255 {sv.namehint = "_skip_T_153"} : i2
    %257 = comb.mux bin %252, %c-1_i2, %256 {sv.namehint = "_skip_T_154"} : i2
    %258 = comb.extract %A from 35 {sv.namehint = "_skip_T_155"} : (i129) -> i1
    %259 = comb.extract %A from 34 {sv.namehint = "_skip_T_156"} : (i129) -> i1
    %260 = comb.extract %A from 33 {sv.namehint = "_skip_T_157"} : (i129) -> i1
    %261 = comb.concat %false, %260 : i1, i1
    %262 = comb.mux bin %259, %c-2_i2, %261 {sv.namehint = "_skip_T_158"} : i2
    %263 = comb.mux bin %258, %c-1_i2, %262 {sv.namehint = "_skip_T_159"} : i2
    %264 = comb.mux bin %251, %257, %263 {sv.namehint = "_skip_T_160"} : i2
    %265 = comb.concat %251, %264 {sv.namehint = "_skip_T_161"} : i1, i2
    %266 = comb.mux bin %233, %249, %265 {sv.namehint = "_skip_T_162"} : i3
    %267 = comb.concat %233, %266 {sv.namehint = "_skip_T_163"} : i1, i3
    %268 = comb.mux bin %195, %231, %267 {sv.namehint = "_skip_T_164"} : i4
    %269 = comb.concat %195, %268 {sv.namehint = "_skip_T_165"} : i1, i4
    %270 = comb.extract %A from 16 {sv.namehint = "skip_hi_24"} : (i129) -> i16
    %271 = comb.icmp bin ne %270, %c0_i16 {sv.namehint = "skip_useHi_24"} : i16
    %272 = comb.extract %A from 24 {sv.namehint = "skip_hi_25"} : (i129) -> i8
    %273 = comb.icmp bin ne %272, %c0_i8 {sv.namehint = "skip_useHi_25"} : i8
    %274 = comb.extract %A from 28 {sv.namehint = "skip_hi_26"} : (i129) -> i4
    %275 = comb.icmp bin ne %274, %c0_i4 {sv.namehint = "skip_useHi_26"} : i4
    %276 = comb.extract %A from 31 {sv.namehint = "_skip_T_166"} : (i129) -> i1
    %277 = comb.extract %A from 30 {sv.namehint = "_skip_T_167"} : (i129) -> i1
    %278 = comb.extract %A from 29 {sv.namehint = "_skip_T_168"} : (i129) -> i1
    %279 = comb.concat %false, %278 : i1, i1
    %280 = comb.mux bin %277, %c-2_i2, %279 {sv.namehint = "_skip_T_169"} : i2
    %281 = comb.mux bin %276, %c-1_i2, %280 {sv.namehint = "_skip_T_170"} : i2
    %282 = comb.extract %A from 27 {sv.namehint = "_skip_T_171"} : (i129) -> i1
    %283 = comb.extract %A from 26 {sv.namehint = "_skip_T_172"} : (i129) -> i1
    %284 = comb.extract %A from 25 {sv.namehint = "_skip_T_173"} : (i129) -> i1
    %285 = comb.concat %false, %284 : i1, i1
    %286 = comb.mux bin %283, %c-2_i2, %285 {sv.namehint = "_skip_T_174"} : i2
    %287 = comb.mux bin %282, %c-1_i2, %286 {sv.namehint = "_skip_T_175"} : i2
    %288 = comb.mux bin %275, %281, %287 {sv.namehint = "_skip_T_176"} : i2
    %289 = comb.concat %275, %288 {sv.namehint = "_skip_T_177"} : i1, i2
    %290 = comb.extract %A from 20 {sv.namehint = "skip_hi_27"} : (i129) -> i4
    %291 = comb.icmp bin ne %290, %c0_i4 {sv.namehint = "skip_useHi_27"} : i4
    %292 = comb.extract %A from 23 {sv.namehint = "_skip_T_178"} : (i129) -> i1
    %293 = comb.extract %A from 22 {sv.namehint = "_skip_T_179"} : (i129) -> i1
    %294 = comb.extract %A from 21 {sv.namehint = "_skip_T_180"} : (i129) -> i1
    %295 = comb.concat %false, %294 : i1, i1
    %296 = comb.mux bin %293, %c-2_i2, %295 {sv.namehint = "_skip_T_181"} : i2
    %297 = comb.mux bin %292, %c-1_i2, %296 {sv.namehint = "_skip_T_182"} : i2
    %298 = comb.extract %A from 19 {sv.namehint = "_skip_T_183"} : (i129) -> i1
    %299 = comb.extract %A from 18 {sv.namehint = "_skip_T_184"} : (i129) -> i1
    %300 = comb.extract %A from 17 {sv.namehint = "_skip_T_185"} : (i129) -> i1
    %301 = comb.concat %false, %300 : i1, i1
    %302 = comb.mux bin %299, %c-2_i2, %301 {sv.namehint = "_skip_T_186"} : i2
    %303 = comb.mux bin %298, %c-1_i2, %302 {sv.namehint = "_skip_T_187"} : i2
    %304 = comb.mux bin %291, %297, %303 {sv.namehint = "_skip_T_188"} : i2
    %305 = comb.concat %291, %304 {sv.namehint = "_skip_T_189"} : i1, i2
    %306 = comb.mux bin %273, %289, %305 {sv.namehint = "_skip_T_190"} : i3
    %307 = comb.concat %273, %306 {sv.namehint = "_skip_T_191"} : i1, i3
    %308 = comb.extract %A from 8 {sv.namehint = "skip_hi_28"} : (i129) -> i8
    %309 = comb.icmp bin ne %308, %c0_i8 {sv.namehint = "skip_useHi_28"} : i8
    %310 = comb.extract %A from 12 {sv.namehint = "skip_hi_29"} : (i129) -> i4
    %311 = comb.icmp bin ne %310, %c0_i4 {sv.namehint = "skip_useHi_29"} : i4
    %312 = comb.extract %A from 15 {sv.namehint = "_skip_T_192"} : (i129) -> i1
    %313 = comb.extract %A from 14 {sv.namehint = "_skip_T_193"} : (i129) -> i1
    %314 = comb.extract %A from 13 {sv.namehint = "_skip_T_194"} : (i129) -> i1
    %315 = comb.concat %false, %314 : i1, i1
    %316 = comb.mux bin %313, %c-2_i2, %315 {sv.namehint = "_skip_T_195"} : i2
    %317 = comb.mux bin %312, %c-1_i2, %316 {sv.namehint = "_skip_T_196"} : i2
    %318 = comb.extract %A from 11 {sv.namehint = "_skip_T_197"} : (i129) -> i1
    %319 = comb.extract %A from 10 {sv.namehint = "_skip_T_198"} : (i129) -> i1
    %320 = comb.extract %A from 9 {sv.namehint = "_skip_T_199"} : (i129) -> i1
    %321 = comb.concat %false, %320 : i1, i1
    %322 = comb.mux bin %319, %c-2_i2, %321 {sv.namehint = "_skip_T_200"} : i2
    %323 = comb.mux bin %318, %c-1_i2, %322 {sv.namehint = "_skip_T_201"} : i2
    %324 = comb.mux bin %311, %317, %323 {sv.namehint = "_skip_T_202"} : i2
    %325 = comb.concat %311, %324 {sv.namehint = "_skip_T_203"} : i1, i2
    %326 = comb.extract %A from 4 {sv.namehint = "skip_hi_30"} : (i129) -> i4
    %327 = comb.icmp bin ne %326, %c0_i4 {sv.namehint = "skip_useHi_30"} : i4
    %328 = comb.extract %A from 7 {sv.namehint = "_skip_T_204"} : (i129) -> i1
    %329 = comb.extract %A from 6 {sv.namehint = "_skip_T_205"} : (i129) -> i1
    %330 = comb.extract %A from 5 {sv.namehint = "_skip_T_206"} : (i129) -> i1
    %331 = comb.concat %false, %330 : i1, i1
    %332 = comb.mux bin %329, %c-2_i2, %331 {sv.namehint = "_skip_T_207"} : i2
    %333 = comb.mux bin %328, %c-1_i2, %332 {sv.namehint = "_skip_T_208"} : i2
    %334 = comb.extract %A from 3 {sv.namehint = "_skip_T_209"} : (i129) -> i1
    %335 = comb.extract %A from 2 {sv.namehint = "_skip_T_210"} : (i129) -> i1
    %336 = comb.extract %A from 1 {sv.namehint = "_skip_T_211"} : (i129) -> i1
    %337 = comb.concat %false, %336 : i1, i1
    %338 = comb.mux bin %335, %c-2_i2, %337 {sv.namehint = "_skip_T_212"} : i2
    %339 = comb.mux bin %334, %c-1_i2, %338 {sv.namehint = "_skip_T_213"} : i2
    %340 = comb.mux bin %327, %333, %339 {sv.namehint = "_skip_T_214"} : i2
    %341 = comb.concat %327, %340 {sv.namehint = "_skip_T_215"} : i1, i2
    %342 = comb.mux bin %309, %325, %341 {sv.namehint = "_skip_T_216"} : i3
    %343 = comb.concat %309, %342 {sv.namehint = "_skip_T_217"} : i1, i3
    %344 = comb.mux bin %271, %307, %343 {sv.namehint = "_skip_T_218"} : i4
    %345 = comb.concat %271, %344 {sv.namehint = "_skip_T_219"} : i1, i4
    %346 = comb.mux bin %193, %269, %345 {sv.namehint = "_skip_T_220"} : i5
    %347 = comb.concat %193, %346 {sv.namehint = "_skip_T_221"} : i1, i5
    %348 = comb.mux bin %191, %c0_i6, %347 {sv.namehint = "_skip_T_222"} : i6
    %349 = comb.concat %true, %37, %190 : i1, i1, i5
    %350 = comb.concat %191, %348 : i1, i6
    %351 = comb.sub bin %349, %350 {sv.namehint = "_skip_T_224"} : i7
    %352 = comb.extract %351 from 6 {sv.namehint = "_realSkip_T"} : (i7) -> i1
    %353 = comb.mux bin %352, %c63_i7, %351 {sv.namehint = "realSkip"} : i7
    %354 = comb.concat %c0_i127, %A : i127, i129
    %355 = comb.concat %c0_i249, %353 : i249, i7
    %356 = comb.shl bin %354, %355 {sv.namehint = "_A_T_7"} : i256
    %357 = comb.extract %356 from 0 : (i256) -> i129
    %358 = comb.mux bin %35, %357, %25 : i129
    %359 = comb.extract %353 from 0 : (i7) -> i6
    %360 = comb.mux bin %35, %359, %n : i6
    %361 = comb.mux bin %35, %c3_i3, %34 : i3
    %362 = comb.icmp bin eq %state, %c3_i3 : i3
    %363 = comb.concat %false, %d : i1, i64
    %364 = comb.icmp bin uge %0, %363 {sv.namehint = "_A_T_16"} : i65
    %365 = comb.extract %A from 64 {sv.namehint = "_A_T_13"} : (i129) -> i64
    %366 = comb.sub bin %365, %d {sv.namehint = "_A_T_11"} : i64
    %367 = comb.mux bin %364, %366, %365 {sv.namehint = "_A_T_14"} : i64
    %368 = comb.concat %367, %1, %364 {sv.namehint = "_A_T_17"} : i64, i64, i1
    %369 = comb.mux bin %362, %368, %358 : i129
    %370 = comb.add bin %n, %c1_i6 {sv.namehint = "_n_T"} : i6
    %371 = comb.mux bin %362, %370, %360 : i6
    %372 = comb.icmp bin eq %n, %c-1_i6 : i6
    %373 = comb.and bin %362, %372 : i1
    %374 = comb.mux bin %373, %c-4_i3, %361 : i3
    %375 = comb.and bin %3, %io_output_ready : i1
    %376 = comb.mux bin %375, %c0_i3, %374 : i3
    hw.output %2, %3, %6, %9 : i1, i1, i64, i64
  }
  hw.module private @ALU(in %clock : !seq.clock, in %reset : i1, out io_input_ready : i1, in %io_input_valid : i1, in %io_input_bits_op : i31, in %io_input_bits_a : i64, in %io_input_bits_b : i64, in %io_input_bits_word : i1, in %io_input_bits_sign : i2, in %io_output_ready : i1, out io_output_valid : i1, out io_output_bits : i64) {
    %true = hw.constant true
    %c0_i59 = hw.constant 0 : i59
    %c0_i58 = hw.constant 0 : i58
    %c0_i121 = hw.constant 0 : i121
    %c32768_i31 = hw.constant 32768 : i31
    %c2097152_i31 = hw.constant 2097152 : i31
    %c262144_i31 = hw.constant 262144 : i31
    %c16777216_i31 = hw.constant 16777216 : i31
    %c1048576_i31 = hw.constant 1048576 : i31
    %c4194304_i31 = hw.constant 4194304 : i31
    %c131072_i31 = hw.constant 131072 : i31
    %c65536_i31 = hw.constant 65536 : i31
    %c524288_i31 = hw.constant 524288 : i31
    %c8388608_i31 = hw.constant 8388608 : i31
    %c0_i32 = hw.constant 0 : i32
    %false = hw.constant false
    %c0_i63 = hw.constant 0 : i63
    %c1_i31 = hw.constant 1 : i31
    %c2_i31 = hw.constant 2 : i31
    %c4_i31 = hw.constant 4 : i31
    %c8_i31 = hw.constant 8 : i31
    %c16_i31 = hw.constant 16 : i31
    %c32_i31 = hw.constant 32 : i31
    %c128_i31 = hw.constant 128 : i31
    %c256_i31 = hw.constant 256 : i31
    %c512_i31 = hw.constant 512 : i31
    %c1024_i31 = hw.constant 1024 : i31
    %c2048_i31 = hw.constant 2048 : i31
    %c33554432_i31 = hw.constant 33554432 : i31
    %c67108864_i31 = hw.constant 67108864 : i31
    %c134217728_i31 = hw.constant 134217728 : i31
    %c268435456_i31 = hw.constant 268435456 : i31
    %c4096_i31 = hw.constant 4096 : i31
    %c8192_i31 = hw.constant 8192 : i31
    %c16384_i31 = hw.constant 16384 : i31
    %c0_i64 = hw.constant 0 : i64
    %0 = comb.icmp bin eq %io_input_bits_op, %c32768_i31 {sv.namehint = "_result_T_11"} : i31
    %1 = comb.icmp bin eq %io_input_bits_op, %c2097152_i31 {sv.namehint = "_result_T_16"} : i31
    %2 = comb.or bin %0, %1 {sv.namehint = "isMul"} : i1
    %mulTop.io_input_ready, %mulTop.io_output_valid, %mulTop.io_output_bits = hw.instance "mulTop" @MulTop(clock: %clock: !seq.clock, reset: %reset: i1, io_input_valid: %5: i1, io_input_bits_data_0: %io_input_bits_a: i64, io_input_bits_data_1: %io_input_bits_b: i64, io_input_bits_sign_0: %3: i1, io_input_bits_sign_1: %4: i1, io_output_ready: %io_output_ready: i1) -> (io_input_ready: i1, io_output_valid: i1, io_output_bits: i128)
    %3 = comb.extract %io_input_bits_sign from 0 {sv.namehint = "mulTop.io_input_bits_sign_0"} : (i2) -> i1
    %4 = comb.extract %io_input_bits_sign from 1 {sv.namehint = "mulTop.io_input_bits_sign_1"} : (i2) -> i1
    %5 = comb.and bin %2, %io_input_valid {sv.namehint = "mulTop.io_input_valid"} : i1
    %6 = comb.icmp bin eq %io_input_bits_op, %c262144_i31 {sv.namehint = "_result_T_13"} : i31
    %7 = comb.icmp bin eq %io_input_bits_op, %c16777216_i31 {sv.namehint = "_result_T_24"} : i31
    %8 = comb.icmp bin eq %io_input_bits_op, %c1048576_i31 {sv.namehint = "_result_T_15"} : i31
    %9 = comb.icmp bin eq %io_input_bits_op, %c4194304_i31 {sv.namehint = "_result_T_26"} : i31
    %10 = comb.icmp bin eq %io_input_bits_op, %c131072_i31 {sv.namehint = "_result_T_12"} : i31
    %11 = comb.icmp bin eq %io_input_bits_op, %c65536_i31 {sv.namehint = "_result_T_25"} : i31
    %12 = comb.icmp bin eq %io_input_bits_op, %c524288_i31 {sv.namehint = "_result_T_14"} : i31
    %13 = comb.icmp bin eq %io_input_bits_op, %c8388608_i31 {sv.namehint = "_result_T_27"} : i31
    %14 = comb.or bin %10, %11, %7, %6 {sv.namehint = "isSgn"} : i1
    %divTop.io_input_ready, %divTop.io_output_valid, %divTop.io_output_bits_quotient, %divTop.io_output_bits_remainder = hw.instance "divTop" @DivTop(clock: %clock: !seq.clock, reset: %reset: i1, io_input_valid: %28: i1, io_input_bits_dividend: %20: i64, io_input_bits_divisor: %26: i64, io_input_bits_issigned: %14: i1, io_output_ready: %io_output_ready: i1) -> (io_input_ready: i1, io_output_valid: i1, io_output_bits_quotient: i64, io_output_bits_remainder: i64)
    %15 = comb.extract %io_input_bits_a from 31 {sv.namehint = "_divTop_io_input_bits_dividend_T_1"} : (i64) -> i1
    %16 = comb.and bin %15, %14 {sv.namehint = "_divTop_io_input_bits_dividend_T_2"} : i1
    %17 = comb.replicate %16 {sv.namehint = "_divTop_io_input_bits_dividend_T_3"} : (i1) -> i32
    %18 = comb.extract %io_input_bits_a from 0 {sv.namehint = "_divTop_io_input_bits_dividend_T_4"} : (i64) -> i32
    %19 = comb.concat %17, %18 {sv.namehint = "_divTop_io_input_bits_dividend_T_5"} : i32, i32
    %20 = comb.mux bin %io_input_bits_word, %19, %io_input_bits_a {sv.namehint = "divTop.io_input_bits_dividend"} : i64
    %21 = comb.extract %io_input_bits_b from 31 {sv.namehint = "_divTop_io_input_bits_divisor_T_1"} : (i64) -> i1
    %22 = comb.and bin %21, %14 {sv.namehint = "_divTop_io_input_bits_divisor_T_2"} : i1
    %23 = comb.replicate %22 {sv.namehint = "_divTop_io_input_bits_divisor_T_3"} : (i1) -> i32
    %24 = comb.extract %io_input_bits_b from 0 {sv.namehint = "_divTop_io_input_bits_divisor_T_4"} : (i64) -> i32
    %25 = comb.concat %23, %24 {sv.namehint = "_divTop_io_input_bits_divisor_T_5"} : i32, i32
    %26 = comb.mux bin %io_input_bits_word, %25, %io_input_bits_b {sv.namehint = "divTop.io_input_bits_divisor"} : i64
    %27 = comb.or bin %6, %7, %8, %9, %10, %11, %12, %13 {sv.namehint = "_divTop_io_input_valid_T"} : i1
    %28 = comb.and bin %27, %io_input_valid {sv.namehint = "divTop.io_input_valid"} : i1
    %29 = comb.and bin %mulTop.io_input_ready, %divTop.io_input_ready {sv.namehint = "io_input_ready"} : i1
    %30 = comb.and bin %mulTop.io_input_ready, %5 : i1
    %31 = comb.and bin %divTop.io_input_ready, %28 : i1
    %32 = comb.or bin %30, %31 : i1
    %33 = comb.xor %32, %true : i1
    %34 = comb.and %33, %29, %io_input_valid : i1
    %35 = comb.mux bin %mulTop.io_input_ready, %34, %mulTop.io_output_valid : i1
    %36 = comb.mux bin %divTop.io_input_ready, %35, %divTop.io_output_valid {sv.namehint = "io_output_valid"} : i1
    %37 = comb.extract %io_input_bits_a from 0 {sv.namehint = "_operates_T_23"} : (i64) -> i32
    %38 = comb.extract %io_input_bits_b from 0 {sv.namehint = "_operates_T_25"} : (i64) -> i5
    %39 = comb.extract %io_input_bits_b from 0 {sv.namehint = "_operates_T_10"} : (i64) -> i6
    %40 = comb.concat %false, %38 : i1, i5
    %41 = comb.mux bin %io_input_bits_word, %40, %39 {sv.namehint = "shiftness"} : i6
    %42 = comb.concat %c0_i63, %io_input_bits_a : i63, i64
    %43 = comb.concat %c0_i121, %41 : i121, i6
    %44 = comb.shl bin %42, %43 {sv.namehint = "sl"} : i127
    %45 = comb.icmp bin slt %io_input_bits_a, %io_input_bits_b {sv.namehint = "lessthan"} : i64
    %46 = comb.icmp bin ult %io_input_bits_a, %io_input_bits_b {sv.namehint = "ulessthan"} : i64
    %47 = comb.add bin %io_input_bits_a, %io_input_bits_b {sv.namehint = "_operates_T"} : i64
    %48 = comb.sub bin %io_input_bits_a, %io_input_bits_b {sv.namehint = "_operates_T_2"} : i64
    %49 = comb.and bin %io_input_bits_a, %io_input_bits_b {sv.namehint = "_result_T_34"} : i64
    %50 = comb.or bin %io_input_bits_a, %io_input_bits_b {sv.namehint = "_result_T_36"} : i64
    %51 = comb.xor bin %io_input_bits_a, %io_input_bits_b {sv.namehint = "_result_T_38"} : i64
    %52 = comb.extract %44 from 0 {sv.namehint = "_result_T_40"} : (i127) -> i64
    %53 = comb.concat %c0_i58, %39 : i58, i6
    %54 = comb.shrs bin %io_input_bits_a, %53 {sv.namehint = "operates_7_2"} : i64
    %55 = comb.shru bin %io_input_bits_a, %53 {sv.namehint = "_result_T_44"} : i64
    %56 = comb.concat %c0_i63, %45 {sv.namehint = "_result_T_46"} : i63, i1
    %57 = comb.concat %c0_i63, %46 {sv.namehint = "_result_T_48"} : i63, i1
    %58 = comb.extract %mulTop.io_output_bits from 0 {sv.namehint = "_result_T_50"} : (i128) -> i64
    %59 = comb.extract %mulTop.io_output_bits from 64 {sv.namehint = "_result_T_60"} : (i128) -> i64
    %60 = comb.mux bin %45, %io_input_bits_b, %io_input_bits_a {sv.namehint = "operates_17_2"} : i64
    %61 = comb.mux bin %45, %io_input_bits_a, %io_input_bits_b {sv.namehint = "operates_18_2"} : i64
    %62 = comb.mux bin %46, %io_input_bits_b, %io_input_bits_a {sv.namehint = "operates_19_2"} : i64
    %63 = comb.mux bin %46, %io_input_bits_a, %io_input_bits_b {sv.namehint = "operates_20_2"} : i64
    %64 = comb.extract %44 from 0 {sv.namehint = "_result_T_70"} : (i127) -> i32
    %65 = comb.concat %c0_i32, %37 {sv.namehint = "_operates_T_18"} : i32, i32
    %66 = comb.concat %c0_i59, %38 : i59, i5
    %67 = comb.shru bin %65, %66 {sv.namehint = "_result_T_73"} : i64
    %68 = comb.extract %io_input_bits_a from 31 {sv.namehint = "_operates_T_21"} : (i64) -> i1
    %69 = comb.replicate %68 {sv.namehint = "_operates_T_22"} : (i1) -> i32
    %70 = comb.concat %69, %37 {sv.namehint = "_operates_T_24"} : i32, i32
    %71 = comb.shru bin %70, %66 {sv.namehint = "_result_T_75"} : i64
    %72 = comb.extract %divTop.io_output_bits_quotient from 0 {sv.namehint = "_result_T_83"} : (i64) -> i32
    %73 = comb.extract %divTop.io_output_bits_remainder from 0 {sv.namehint = "_result_T_86"} : (i64) -> i32
    %74 = comb.icmp bin eq %io_input_bits_op, %c1_i31 {sv.namehint = "_result_T"} : i31
    %75 = comb.icmp bin eq %io_input_bits_op, %c2_i31 {sv.namehint = "_result_T_1"} : i31
    %76 = comb.icmp bin eq %io_input_bits_op, %c4_i31 {sv.namehint = "_result_T_2"} : i31
    %77 = comb.icmp bin eq %io_input_bits_op, %c8_i31 {sv.namehint = "_result_T_3"} : i31
    %78 = comb.icmp bin eq %io_input_bits_op, %c16_i31 {sv.namehint = "_result_T_4"} : i31
    %79 = comb.icmp bin eq %io_input_bits_op, %c32_i31 {sv.namehint = "_result_T_5"} : i31
    %80 = comb.icmp bin eq %io_input_bits_op, %c128_i31 {sv.namehint = "_result_T_6"} : i31
    %81 = comb.icmp bin eq %io_input_bits_op, %c256_i31 {sv.namehint = "_result_T_7"} : i31
    %82 = comb.icmp bin eq %io_input_bits_op, %c512_i31 {sv.namehint = "_result_T_8"} : i31
    %83 = comb.icmp bin eq %io_input_bits_op, %c1024_i31 {sv.namehint = "_result_T_9"} : i31
    %84 = comb.icmp bin eq %io_input_bits_op, %c2048_i31 {sv.namehint = "_result_T_10"} : i31
    %85 = comb.icmp bin eq %io_input_bits_op, %c33554432_i31 {sv.namehint = "_result_T_17"} : i31
    %86 = comb.icmp bin eq %io_input_bits_op, %c67108864_i31 {sv.namehint = "_result_T_18"} : i31
    %87 = comb.icmp bin eq %io_input_bits_op, %c134217728_i31 {sv.namehint = "_result_T_19"} : i31
    %88 = comb.icmp bin eq %io_input_bits_op, %c268435456_i31 {sv.namehint = "_result_T_20"} : i31
    %89 = comb.icmp bin eq %io_input_bits_op, %c4096_i31 {sv.namehint = "_result_T_21"} : i31
    %90 = comb.icmp bin eq %io_input_bits_op, %c8192_i31 {sv.namehint = "_result_T_22"} : i31
    %91 = comb.icmp bin eq %io_input_bits_op, %c16384_i31 {sv.namehint = "_result_T_23"} : i31
    %92 = comb.extract %44 from 31 : (i127) -> i1
    %93 = comb.replicate %92 : (i1) -> i32
    %94 = comb.concat %93, %64 : i32, i32
    %95 = comb.extract %divTop.io_output_bits_quotient from 31 : (i64) -> i1
    %96 = comb.replicate %95 : (i1) -> i32
    %97 = comb.concat %96, %72 : i32, i32
    %98 = comb.extract %divTop.io_output_bits_remainder from 31 : (i64) -> i1
    %99 = comb.replicate %98 : (i1) -> i32
    %100 = comb.concat %99, %73 : i32, i32
    %101 = comb.mux bin %74, %io_input_bits_a, %c0_i64 {sv.namehint = "_result_T_89"} : i64
    %102 = comb.mux bin %75, %47, %c0_i64 {sv.namehint = "_result_T_90"} : i64
    %103 = comb.mux bin %76, %48, %c0_i64 {sv.namehint = "_result_T_91"} : i64
    %104 = comb.mux bin %77, %49, %c0_i64 {sv.namehint = "_result_T_92"} : i64
    %105 = comb.mux bin %78, %50, %c0_i64 {sv.namehint = "_result_T_93"} : i64
    %106 = comb.mux bin %79, %51, %c0_i64 {sv.namehint = "_result_T_94"} : i64
    %107 = comb.mux bin %80, %52, %c0_i64 {sv.namehint = "_result_T_95"} : i64
    %108 = comb.mux bin %81, %54, %c0_i64 {sv.namehint = "_result_T_96"} : i64
    %109 = comb.mux bin %82, %55, %c0_i64 {sv.namehint = "_result_T_97"} : i64
    %110 = comb.mux bin %83, %56, %c0_i64 {sv.namehint = "_result_T_98"} : i64
    %111 = comb.mux bin %84, %57, %c0_i64 {sv.namehint = "_result_T_99"} : i64
    %112 = comb.mux bin %0, %58, %c0_i64 {sv.namehint = "_result_T_100"} : i64
    %113 = comb.mux bin %10, %divTop.io_output_bits_remainder, %c0_i64 {sv.namehint = "_result_T_101"} : i64
    %114 = comb.mux bin %6, %divTop.io_output_bits_quotient, %c0_i64 {sv.namehint = "_result_T_102"} : i64
    %115 = comb.mux bin %12, %divTop.io_output_bits_remainder, %c0_i64 {sv.namehint = "_result_T_103"} : i64
    %116 = comb.mux bin %8, %divTop.io_output_bits_quotient, %c0_i64 {sv.namehint = "_result_T_104"} : i64
    %117 = comb.mux bin %1, %59, %c0_i64 {sv.namehint = "_result_T_105"} : i64
    %118 = comb.mux bin %85, %60, %c0_i64 {sv.namehint = "_result_T_106"} : i64
    %119 = comb.mux bin %86, %61, %c0_i64 {sv.namehint = "_result_T_107"} : i64
    %120 = comb.mux bin %87, %62, %c0_i64 {sv.namehint = "_result_T_108"} : i64
    %121 = comb.mux bin %88, %63, %c0_i64 {sv.namehint = "_result_T_109"} : i64
    %122 = comb.mux bin %89, %94, %c0_i64 {sv.namehint = "_result_T_110"} : i64
    %123 = comb.mux bin %90, %67, %c0_i64 {sv.namehint = "_result_T_111"} : i64
    %124 = comb.mux bin %91, %71, %c0_i64 {sv.namehint = "_result_T_112"} : i64
    %125 = comb.mux bin %7, %97, %c0_i64 {sv.namehint = "_result_T_113"} : i64
    %126 = comb.mux bin %11, %100, %c0_i64 {sv.namehint = "_result_T_114"} : i64
    %127 = comb.mux bin %9, %97, %c0_i64 {sv.namehint = "_result_T_115"} : i64
    %128 = comb.mux bin %13, %100, %c0_i64 {sv.namehint = "_result_T_116"} : i64
    %129 = comb.or bin %101, %102, %103, %104, %105, %106, %107, %108, %109, %110, %111, %112, %113, %114, %115, %116, %117, %118, %119, %120, %121, %122, %123, %124, %125, %126, %127, %128 {sv.namehint = "_result_T_171"} : i64
    %130 = comb.extract %129 from 31 {sv.namehint = "_io_output_bits_T"} : (i64) -> i1
    %131 = comb.replicate %130 {sv.namehint = "_io_output_bits_T_1"} : (i1) -> i32
    %132 = comb.extract %129 from 0 {sv.namehint = "_io_output_bits_T_2"} : (i64) -> i32
    %133 = comb.concat %131, %132 {sv.namehint = "_io_output_bits_T_3"} : i32, i32
    %134 = comb.mux bin %io_input_bits_word, %133, %129 {sv.namehint = "io_output_bits"} : i64
    hw.output %29, %36, %134 : i1, i1, i64
  }
  hw.module private @EX(in %clock : !seq.clock, in %reset : i1, in %io_input_rd : i5, in %io_input_isWcsr : i1, in %io_input_wcsr_0 : i12, in %io_input_wcsr_1 : i12, in %io_input_wcsr_2 : i12, in %io_input_wcsr_3 : i12, in %io_input_num_0 : i64, in %io_input_num_1 : i64, in %io_input_num_2 : i64, in %io_input_num_3 : i64, in %io_input_op1_2 : i31, in %io_input_op1_3 : i31, in %io_input_special : i5, in %io_input_retire : i1, in %io_input_priv : i2, in %io_input_isPriv : i1, in %io_input_isSatp : i1, in %io_input_memExpt : i1, in %io_input_cause : i4, in %io_input_pc : i64, in %io_input_debug_rcsr : i12, in %io_input_debug_intr : i1, in %io_input_debug_rvc : i1, in %io_lastVR_VALID : i1, out io_lastVR_READY : i1, out io_nextVR_VALID : i1, in %io_nextVR_READY : i1, out io_output_rd : i5, out io_output_data : i64, out io_output_isWcsr : i1, out io_output_wcsr_0 : i12, out io_output_wcsr_1 : i12, out io_output_wcsr_2 : i12, out io_output_wcsr_3 : i12, out io_output_csrData_0 : i64, out io_output_csrData_1 : i64, out io_output_csrData_2 : i64, out io_output_csrData_3 : i64, out io_output_isMem : i1, out io_output_isLd : i1, out io_output_addr : i64, out io_output_mask : i3, out io_output_retire : i1, out io_output_priv : i2, out io_output_isPriv : i1, out io_output_isSatp : i1, out io_output_memExpt : i1, out io_output_cause : i4, out io_output_fshTLB : i1, out io_output_pc : i64, out io_output_debug_exit : i3, out io_output_debug_rcsr : i12, out io_output_debug_intr : i1, out io_output_debug_rvc : i1, in %io_invIch_ready : i1, out io_invIch_valid : i1, in %io_wbDch_ready : i1, out io_wbDch_valid : i1, in %io_seip : i1, in %io_ueip : i1) {
    %c1_i2 = hw.constant 1 : i2
    %c324_i12 = hw.constant 324 : i12
    %c836_i12 = hw.constant 836 : i12
    %c-1_i64 = hw.constant -1 : i64
    %c0_i31 = hw.constant 0 : i31
    %c9_i5 = hw.constant 9 : i5
    %c10_i5 = hw.constant 10 : i5
    %c0_i5 = hw.constant 0 : i5
    %c0_i3 = hw.constant 0 : i3
    %c-1_i2 = hw.constant -1 : i2
    %c0_i4 = hw.constant 0 : i4
    %c1_i5 = hw.constant 1 : i5
    %c2_i5 = hw.constant 2 : i5
    %c-16_i5 = hw.constant -16 : i5
    %c0_i2 = hw.constant 0 : i2
    %c6_i5 = hw.constant 6 : i5
    %c7_i5 = hw.constant 7 : i5
    %c13_i5 = hw.constant 13 : i5
    %c8_i5 = hw.constant 8 : i5
    %c15_i5 = hw.constant 15 : i5
    %c128_i31 = hw.constant 128 : i31
    %c256_i31 = hw.constant 256 : i31
    %c3_i5 = hw.constant 3 : i5
    %c4_i5 = hw.constant 4 : i5
    %c14_i5 = hw.constant 14 : i5
    %c5_i5 = hw.constant 5 : i5
    %c-1_i12 = hw.constant -1 : i12
    %c0_i64 = hw.constant 0 : i64
    %true = hw.constant true
    %c0_i27 = hw.constant 0 : i27
    %c1_i64 = hw.constant 1 : i64
    %c1_i3 = hw.constant 1 : i3
    %false = hw.constant false
    %alu.io_input_ready, %alu.io_output_valid, %alu.io_output_bits = hw.instance "alu" @ALU(clock: %clock: !seq.clock, reset: %reset: i1, io_input_valid: %io_lastVR_VALID: i1, io_input_bits_op: %159: i31, io_input_bits_a: %io_input_num_0: i64, io_input_bits_b: %io_input_num_1: i64, io_input_bits_word: %161: i1, io_input_bits_sign: %3: i2, io_output_ready: %io_nextVR_READY: i1) -> (io_input_ready: i1, io_output_valid: i1, io_output_bits: i64)
    %op = seq.firreg %154 clock %clock reset sync %reset, %c0_i31 {firrtl.random_init_start = 0 : ui64} : i31
    %isWord = seq.firreg %155 clock %clock reset sync %reset, %false {firrtl.random_init_start = 31 : ui64} : i1
    %0 = comb.icmp bin ne %io_input_special, %c9_i5 {sv.namehint = "_alu_io_input_bits_sign_T_3"} : i5
    %1 = comb.icmp bin ne %io_input_special, %c10_i5 {sv.namehint = "_alu_io_input_bits_sign_T_1"} : i5
    %2 = comb.and bin %0, %1 {sv.namehint = "_alu_io_input_bits_sign_T_2"} : i1
    %3 = comb.concat %2, %0 {sv.namehint = "alu.io_input_bits_sign"} : i1, i1
    %NVALID = seq.firreg %183 clock %clock reset sync %reset, %false {firrtl.random_init_start = 32 : ui64, sv.namehint = "NVALID"} : i1
    %invalidateICache = seq.firreg %157 clock %clock reset sync %reset, %false {firrtl.random_init_start = 33 : ui64, sv.namehint = "invalidateICache"} : i1
    %writebackDCache = seq.firreg %158 clock %clock reset sync %reset, %false {firrtl.random_init_start = 34 : ui64, sv.namehint = "writebackDCache"} : i1
    %rd = seq.firreg %178 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 35 : ui64, sv.namehint = "rd"} : i5
    %pc = seq.firreg %122 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 40 : ui64, sv.namehint = "pc"} : i64
    %data = seq.firreg %179 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 104 : ui64, sv.namehint = "data"} : i64
    %isWcsr = seq.firreg %126 clock %clock reset sync %reset, %false {firrtl.random_init_start = 168 : ui64, sv.namehint = "isWcsr"} : i1
    %wcsr_0 = seq.firreg %127 clock %clock reset sync %reset, %c-1_i12 {firrtl.random_init_start = 169 : ui64, sv.namehint = "wcsr_0"} : i12
    %wcsr_1 = seq.firreg %128 clock %clock reset sync %reset, %c-1_i12 {firrtl.random_init_start = 181 : ui64, sv.namehint = "wcsr_1"} : i12
    %wcsr_2 = seq.firreg %129 clock %clock reset sync %reset, %c-1_i12 {firrtl.random_init_start = 193 : ui64, sv.namehint = "wcsr_2"} : i12
    %wcsr_3 = seq.firreg %130 clock %clock reset sync %reset, %c-1_i12 {firrtl.random_init_start = 205 : ui64, sv.namehint = "wcsr_3"} : i12
    %csrData_0 = seq.firreg %131 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 217 : ui64, sv.namehint = "csrData_0"} : i64
    %csrData_1 = seq.firreg %132 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 281 : ui64, sv.namehint = "csrData_1"} : i64
    %csrData_2 = seq.firreg %133 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 345 : ui64, sv.namehint = "csrData_2"} : i64
    %csrData_3 = seq.firreg %134 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 409 : ui64, sv.namehint = "csrData_3"} : i64
    %isMem = seq.firreg %181 clock %clock reset sync %reset, %false {firrtl.random_init_start = 473 : ui64, sv.namehint = "isMem"} : i1
    %isLd = seq.firreg %136 clock %clock reset sync %reset, %false {firrtl.random_init_start = 474 : ui64, sv.namehint = "isLd"} : i1
    %addr = seq.firreg %137 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 475 : ui64, sv.namehint = "addr"} : i64
    %mask = seq.firreg %138 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 539 : ui64, sv.namehint = "mask"} : i3
    %retire = seq.firreg %182 clock %clock reset sync %reset, %false {firrtl.random_init_start = 542 : ui64, sv.namehint = "retire"} : i1
    %lraddr = seq.firreg %141 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 543 : ui64} : i64
    %lrvalid = seq.firreg %143 clock %clock reset sync %reset, %false {firrtl.random_init_start = 607 : ui64} : i1
    %scState = seq.firreg %177 clock %clock reset sync %reset, %false {firrtl.random_init_start = 608 : ui64} : i1
    %tmpRd = seq.firreg %149 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 609 : ui64} : i5
    %priv = seq.firreg %150 clock %clock reset sync %reset, %c-1_i2 {firrtl.random_init_start = 614 : ui64, sv.namehint = "priv"} : i2
    %isPriv = seq.firreg %175 clock %clock reset sync %reset, %false {firrtl.random_init_start = 616 : ui64, sv.namehint = "isPriv"} : i1
    %isSatp = seq.firreg %172 clock %clock reset sync %reset, %false {firrtl.random_init_start = 617 : ui64, sv.namehint = "isSatp"} : i1
    %memExpt = seq.firreg %151 clock %clock reset sync %reset, %false {firrtl.random_init_start = 619 : ui64, sv.namehint = "memExpt"} : i1
    %cause = seq.firreg %152 clock %clock reset sync %reset, %c0_i4 {firrtl.random_init_start = 620 : ui64, sv.namehint = "cause"} : i4
    %fshTLB = seq.firreg %153 clock %clock reset sync %reset, %false {firrtl.random_init_start = 724 : ui64, sv.namehint = "fshTLB"} : i1
    %exit = seq.firreg %162 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 725 : ui64, sv.namehint = "exit"} : i3
    %rcsr = seq.firreg %163 clock %clock reset sync %reset, %c-1_i12 {firrtl.random_init_start = 728 : ui64, sv.namehint = "rcsr"} : i12
    %intr = seq.firreg %164 clock %clock reset sync %reset, %false {firrtl.random_init_start = 740 : ui64, sv.namehint = "intr"} : i1
    %rvc = seq.firreg %165 clock %clock reset sync %reset, %false {firrtl.random_init_start = 741 : ui64, sv.namehint = "rvc"} : i1
    %4 = comb.icmp bin eq %io_input_special, %c1_i5 {sv.namehint = "_wireIsLd_T_1"} : i5
    %5 = comb.icmp bin eq %io_input_special, %c2_i5 {sv.namehint = "_wireIsMem_T_1"} : i5
    %6 = comb.icmp bin eq %io_input_special, %c-16_i5 {sv.namehint = "_fshTLB_T"} : i5
    %7 = comb.add bin %io_input_num_2, %io_input_num_3 {sv.namehint = "_wireAddr_T_2"} : i64
    %8 = comb.extract %io_input_op1_3 from 0 {sv.namehint = "wireMask"} : (i31) -> i3
    %9 = comb.and bin %io_invIch_ready, %invalidateICache : i1
    %10 = comb.xor %9, %true : i1
    %11 = comb.and %10, %invalidateICache : i1
    %12 = comb.and bin %io_wbDch_ready, %writebackDCache : i1
    %13 = comb.xor %12, %true : i1
    %14 = comb.and %13, %writebackDCache : i1
    %15 = comb.icmp bin eq %io_input_special, %c6_i5 : i5
    %16 = comb.extract %io_input_num_0 from 8 {sv.namehint = "oldValue_UEIP"} : (i64) -> i1
    %17 = comb.extract %io_input_num_0 from 9 {sv.namehint = "oldValue_SEIP"} : (i64) -> i1
    %18 = comb.icmp bin eq %io_input_wcsr_0, %c836_i12 {sv.namehint = "_newValue_UEIP_T"} : i12
    %19 = comb.mux bin %18, %io_seip, %17 {sv.namehint = "newValue_SEIP"} : i1
    %20 = comb.icmp bin eq %io_input_wcsr_0, %c324_i12 {sv.namehint = "_newValue_UEIP_T_1"} : i12
    %21 = comb.or bin %18, %20 {sv.namehint = "_newValue_UEIP_T_2"} : i1
    %22 = comb.mux bin %21, %io_ueip, %16 {sv.namehint = "newValue_UEIP"} : i1
    %23 = comb.extract %io_input_op1_3 from 0 {sv.namehint = "_wireCsrData_0_T"} : (i31) -> i2
    %24 = comb.extract %io_input_num_0 from 10 : (i64) -> i54
    %25 = comb.extract %io_input_num_0 from 0 : (i64) -> i8
    %26 = comb.concat %24, %19, %22, %25 {sv.namehint = "_wireCsrData_0_T_3"} : i54, i1, i1, i8
    %27 = comb.or bin %26, %io_input_num_1 {sv.namehint = "_wireCsrData_0_T_2"} : i64
    %28 = comb.xor bin %io_input_num_1, %c-1_i64 {sv.namehint = "_wireCsrData_0_T_4"} : i64
    %29 = comb.and bin %26, %28 {sv.namehint = "_wireCsrData_0_T_5"} : i64
    %30 = hw.array_create %29, %27, %io_input_num_1, %c0_i64 : i64
    %31 = hw.array_get %30[%23] {sv.namehint = "_wireCsrData_0_T_11"} : !hw.array<4xi64>, i2
    %32 = comb.mux bin %15, %31, %io_input_num_0 : i64
    %33 = comb.icmp bin eq %io_input_special, %c7_i5 : i5
    %34 = comb.extract %io_input_num_0 from 13 {sv.namehint = "_wireCsrData_0_T_12"} : (i64) -> i51
    %35 = comb.extract %io_input_num_0 from 8 {sv.namehint = "_wireCsrData_0_T_13"} : (i64) -> i3
    %36 = comb.extract %io_input_num_0 from 4 {sv.namehint = "_wireCsrData_0_T_14"} : (i64) -> i3
    %37 = comb.extract %io_input_num_0 from 7 {sv.namehint = "_wireCsrData_0_T_15"} : (i64) -> i1
    %38 = comb.extract %io_input_num_0 from 0 {sv.namehint = "_wireCsrData_0_T_16"} : (i64) -> i3
    %39 = comb.concat %34, %c0_i2, %35, %true, %36, %37, %38 {sv.namehint = "_wireCsrData_0_T_17"} : i51, i2, i3, i1, i3, i1, i3
    %40 = comb.mux bin %33, %39, %32 : i64
    %41 = comb.icmp bin eq %io_input_special, %c13_i5 : i5
    %42 = comb.extract %io_input_num_0 from 0 {sv.namehint = "oldMstatus_UIE"} : (i64) -> i1
    %43 = comb.extract %io_input_num_0 from 5 {sv.namehint = "newMstatus_SIE"} : (i64) -> i1
    %44 = comb.extract %io_input_num_0 from 9 : (i64) -> i55
    %45 = comb.extract %io_input_num_0 from 6 : (i64) -> i2
    %46 = comb.extract %io_input_num_0 from 2 : (i64) -> i3
    %47 = comb.concat %44, %false, %45, %true, %46, %43, %42 {sv.namehint = "_wireCsrData_0_T_18"} : i55, i1, i2, i1, i3, i1, i1
    %48 = comb.mux bin %41, %47, %40 : i64
    %49 = comb.icmp bin eq %io_input_special, %c8_i5 : i5
    %50 = comb.mux bin %49, %io_input_num_0, %48 {sv.namehint = "wireCsrData_0"} : i64
    %51 = comb.extract %io_input_num_3 from 61 {sv.namehint = "currentPriv"} : (i64) -> i2
    %52 = comb.extract %io_input_num_3 from 59 {sv.namehint = "newPriv"} : (i64) -> i2
    %53 = comb.extract %io_input_num_3 from 0 {sv.namehint = "oldMstatus_1_UIE"} : (i64) -> i1
    %54 = comb.extract %io_input_num_3 from 1 {sv.namehint = "oldMstatus_1_SIE"} : (i64) -> i1
    %55 = comb.extract %io_input_num_3 from 2 {sv.namehint = "oldMstatus_1_WPRI_4"} : (i64) -> i1
    %56 = comb.extract %io_input_num_3 from 3 {sv.namehint = "oldMstatus_1_MIE"} : (i64) -> i1
    %57 = comb.extract %io_input_num_3 from 4 {sv.namehint = "oldMstatus_1_UPIE"} : (i64) -> i1
    %58 = comb.extract %io_input_num_3 from 5 {sv.namehint = "oldMstatus_1_SPIE"} : (i64) -> i1
    %59 = comb.extract %io_input_num_3 from 6 {sv.namehint = "oldMstatus_1_WPRI_3"} : (i64) -> i1
    %60 = comb.extract %io_input_num_3 from 7 {sv.namehint = "oldMstatus_1_MPIE"} : (i64) -> i1
    %61 = comb.extract %io_input_num_3 from 8 {sv.namehint = "oldMstatus_1_SPP"} : (i64) -> i1
    %62 = comb.extract %io_input_num_3 from 9 {sv.namehint = "oldMstatus_1_WPRI_2"} : (i64) -> i2
    %63 = comb.extract %io_input_num_3 from 11 {sv.namehint = "oldMstatus_1_MPP"} : (i64) -> i2
    %64 = comb.extract %io_input_num_3 from 63 {sv.namehint = "oldMstatus_1_SD"} : (i64) -> i1
    %65 = comb.icmp bin eq %52, %c-1_i2 : i2
    %66 = comb.mux bin %65, %51, %63 {sv.namehint = "newMstatus_1_MPP"} : i2
    %67 = comb.mux bin %65, %56, %60 {sv.namehint = "newMstatus_1_MPIE"} : i1
    %68 = comb.xor %65, %true : i1
    %69 = comb.and %68, %56 {sv.namehint = "newMstatus_1_MIE"} : i1
    %70 = comb.icmp bin eq %52, %c1_i2 : i2
    %71 = comb.extract %io_input_num_3 from 61 : (i64) -> i1
    %72 = comb.mux bin %70, %71, %61 {sv.namehint = "newMstatus_1_SPP"} : i1
    %73 = comb.mux bin %70, %54, %58 {sv.namehint = "newMstatus_1_SPIE"} : i1
    %74 = comb.xor %70, %true : i1
    %75 = comb.and %74, %54 {sv.namehint = "newMstatus_1_SIE"} : i1
    %76 = comb.icmp bin eq %52, %c0_i2 : i2
    %77 = comb.mux bin %76, %53, %57 {sv.namehint = "newMstatus_1_UPIE"} : i1
    %78 = comb.xor %76, %true : i1
    %79 = comb.and %78, %53 {sv.namehint = "newMstatus_1_UIE"} : i1
    %80 = comb.extract %io_input_num_3 from 13 : (i64) -> i23
    %81 = comb.concat %64, %c0_i27, %80, %66, %62, %72, %67, %59, %73, %77, %69, %55, %75, %79 {sv.namehint = "_wireCsrData_3_T"} : i1, i27, i23, i2, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    %82 = comb.mux bin %49, %81, %io_input_num_3 {sv.namehint = "wireCsrData_3"} : i64
    %83 = comb.or %49, %io_input_isWcsr {sv.namehint = "wireIsWcsr"} : i1
    %84 = comb.icmp bin eq %io_input_special, %c15_i5 : i5
    %85 = comb.icmp bin eq %io_input_op1_2, %c128_i31 : i31
    %86 = comb.and bin %84, %85 : i1
    %87 = comb.or %86, %4 {sv.namehint = "wireIsLd"} : i1
    %88 = comb.or %85, %lrvalid : i1
    %89 = comb.icmp bin eq %io_input_op1_2, %c256_i31 : i31
    %90 = comb.xor %89, %true : i1
    %91 = comb.and %90, %88 : i1
    %92 = comb.icmp bin ne %7, %lraddr : i64
    %93 = comb.xor bin %lrvalid, %true : i1
    %94 = comb.or bin %92, %93 : i1
    %95 = comb.and bin %84, %89, %94 : i1
    %96 = comb.mux bin %95, %c1_i64, %alu.io_output_bits {sv.namehint = "wireData"} : i64
    %97 = comb.xor %94, %true : i1
    %98 = comb.and bin %84, %89 : i1
    %99 = comb.xor %98, %true : i1
    %100 = comb.or %99, %94 : i1
    %101 = comb.and %100, %io_input_retire {sv.namehint = "wireRetire"} : i1
    %102 = comb.xor %94, %true : i1
    %103 = comb.and %98, %102 : i1
    %104 = comb.or %103, %49 : i1
    %105 = comb.mux bin %104, %c0_i5, %io_input_rd {sv.namehint = "wireRd"} : i5
    %106 = comb.xor %94, %true : i1
    %107 = comb.and %89, %106 : i1
    %108 = comb.or %107, %85 : i1
    %109 = comb.and %84, %108 : i1
    %110 = comb.or %109, %4, %5, %6 {sv.namehint = "wireIsMem"} : i1
    %111 = comb.icmp bin eq %io_input_special, %c3_i5 : i5
    %112 = comb.icmp bin eq %io_input_special, %c4_i5 : i5
    %113 = comb.concat %false, %112, %false : i1, i1, i1
    %114 = comb.mux bin %111, %c1_i3, %113 {sv.namehint = "wireExit"} : i3
    %115 = comb.xor bin %invalidateICache, %true {sv.namehint = "_io_lastVR_READY_T_1"} : i1
    %116 = comb.xor bin %writebackDCache, %true {sv.namehint = "_io_lastVR_READY_T_3"} : i1
    %117 = comb.xor bin %scState, %true {sv.namehint = "_io_lastVR_READY_T_5"} : i1
    %118 = comb.and bin %io_nextVR_READY, %alu.io_input_ready, %115, %116, %117 {sv.namehint = "io_lastVR_READY"} : i1
    %119 = comb.and bin %io_nextVR_READY, %alu.io_output_valid {sv.namehint = "_NVALID_T"} : i1
    %120 = comb.or %119, %NVALID : i1
    %121 = comb.and bin %io_lastVR_VALID, %118 : i1
    %122 = comb.mux bin %121, %io_input_pc, %pc : i64
    %123 = comb.mux bin %121, %105, %rd : i5
    %124 = comb.or bin %121, %119 : i1
    %125 = comb.mux bin %124, %96, %data : i64
    %126 = comb.mux bin %121, %83, %isWcsr : i1
    %127 = comb.mux bin %121, %io_input_wcsr_0, %wcsr_0 : i12
    %128 = comb.mux bin %121, %io_input_wcsr_1, %wcsr_1 : i12
    %129 = comb.mux bin %121, %io_input_wcsr_2, %wcsr_2 : i12
    %130 = comb.mux bin %121, %io_input_wcsr_3, %wcsr_3 : i12
    %131 = comb.mux bin %121, %50, %csrData_0 : i64
    %132 = comb.mux bin %121, %io_input_num_1, %csrData_1 : i64
    %133 = comb.mux bin %121, %io_input_num_2, %csrData_2 : i64
    %134 = comb.mux bin %121, %82, %csrData_3 : i64
    %135 = comb.mux bin %121, %110, %isMem : i1
    %136 = comb.mux bin %121, %87, %isLd : i1
    %137 = comb.mux bin %121, %7, %addr : i64
    %138 = comb.mux bin %121, %8, %mask : i3
    %139 = comb.mux bin %121, %101, %retire : i1
    %140 = comb.and bin %121, %86 : i1
    %141 = comb.mux bin %140, %7, %lraddr : i64
    %142 = comb.and bin %121, %84 : i1
    %143 = comb.mux bin %142, %91, %lrvalid : i1
    %144 = comb.and bin %121, %98 : i1
    %145 = comb.and %144, %97 : i1
    %146 = comb.or %145, %scState : i1
    %147 = comb.xor %144, %true : i1
    %148 = comb.or %147, %94 : i1
    %149 = comb.mux bin %148, %tmpRd, %io_input_rd : i5
    %150 = comb.mux bin %121, %io_input_priv, %priv : i2
    %151 = comb.mux bin %121, %io_input_memExpt, %memExpt : i1
    %152 = comb.mux bin %121, %io_input_cause, %cause : i4
    %153 = comb.mux bin %121, %6, %fshTLB : i1
    %154 = comb.mux bin %121, %io_input_op1_2, %op : i31
    %155 = comb.mux bin %121, %160, %isWord : i1
    %156 = comb.icmp bin eq %io_input_special, %c14_i5 {sv.namehint = "_writebackDCache_T_1"} : i5
    %157 = comb.mux bin %121, %156, %11 : i1
    %158 = comb.mux bin %121, %156, %14 : i1
    %159 = comb.mux bin %121, %io_input_op1_2, %op {sv.namehint = "wireOp"} : i31
    %160 = comb.icmp bin eq %io_input_special, %c5_i5 {sv.namehint = "_wireIsWord_T"} : i5
    %161 = comb.mux bin %121, %160, %isWord {sv.namehint = "wireIsWord"} : i1
    %162 = comb.mux bin %121, %114, %exit : i3
    %163 = comb.mux bin %121, %io_input_debug_rcsr, %rcsr : i12
    %164 = comb.mux bin %121, %io_input_debug_intr, %intr : i1
    %165 = comb.mux bin %121, %io_input_debug_rvc, %rvc : i1
    %166 = comb.and bin %io_nextVR_READY, %NVALID : i1
    %167 = comb.xor %166, %true : i1
    %168 = comb.and %167, %120 : i1
    %169 = comb.mux bin %121, %119, %168 : i1
    %170 = comb.xor %166, %true : i1
    %171 = comb.and %170, %isSatp : i1
    %172 = comb.mux bin %121, %io_input_isSatp, %171 : i1
    %173 = comb.xor %166, %true : i1
    %174 = comb.and %173, %isPriv : i1
    %175 = comb.mux bin %121, %io_input_isPriv, %174 : i1
    %176 = comb.xor %scState, %true : i1
    %177 = comb.and %176, %146 : i1
    %178 = comb.mux bin %scState, %tmpRd, %123 : i5
    %179 = comb.mux bin %scState, %c0_i64, %125 : i64
    %180 = comb.xor %scState, %true : i1
    %181 = comb.and %180, %135 : i1
    %182 = comb.or %scState, %139 : i1
    %183 = comb.or %scState, %169 : i1
    hw.output %118, %NVALID, %rd, %data, %isWcsr, %wcsr_0, %wcsr_1, %wcsr_2, %wcsr_3, %csrData_0, %csrData_1, %csrData_2, %csrData_3, %isMem, %isLd, %addr, %mask, %retire, %priv, %isPriv, %isSatp, %memExpt, %cause, %fshTLB, %pc, %exit, %rcsr, %intr, %rvc, %invalidateICache, %writebackDCache : i1, i1, i5, i64, i1, i12, i12, i12, i12, i64, i64, i64, i64, i1, i1, i64, i3, i1, i2, i1, i1, i1, i4, i1, i64, i3, i12, i1, i1, i1, i1
  }
  hw.module private @MEM(in %clock : !seq.clock, in %reset : i1, out io_dmmu_pipelineReq_cpuReq_addr : i64, out io_dmmu_pipelineReq_cpuReq_data : i64, out io_dmmu_pipelineReq_cpuReq_size : i3, out io_dmmu_pipelineReq_cpuReq_rw : i1, out io_dmmu_pipelineReq_cpuReq_wmask : i8, out io_dmmu_pipelineReq_cpuReq_valid : i1, out io_dmmu_pipelineReq_flush : i1, in %io_dmmu_pipelineResult_exception : i1, in %io_dmmu_pipelineResult_cause : i4, in %io_dmmu_pipelineResult_cpuResult_data : i64, in %io_dmmu_pipelineResult_cpuResult_ready : i1, in %io_dmmu_pipelineResult_isMMIO : i1, in %io_lastVR_VALID : i1, out io_lastVR_READY : i1, out io_nextVR_VALID : i1, in %io_input_rd : i5, in %io_input_data : i64, in %io_input_isWcsr : i1, in %io_input_wcsr_0 : i12, in %io_input_wcsr_1 : i12, in %io_input_wcsr_2 : i12, in %io_input_wcsr_3 : i12, in %io_input_csrData_0 : i64, in %io_input_csrData_1 : i64, in %io_input_csrData_2 : i64, in %io_input_csrData_3 : i64, in %io_input_isMem : i1, in %io_input_isLd : i1, in %io_input_addr : i64, in %io_input_mask : i3, in %io_input_retire : i1, in %io_input_priv : i2, in %io_input_isPriv : i1, in %io_input_isSatp : i1, in %io_input_memExpt : i1, in %io_input_cause : i4, in %io_input_fshTLB : i1, in %io_input_pc : i64, in %io_input_debug_exit : i3, in %io_input_debug_rcsr : i12, in %io_input_debug_intr : i1, in %io_input_debug_rvc : i1, out io_output_rd : i5, out io_output_data : i64, out io_output_isWcsr : i1, out io_output_wcsr_0 : i12, out io_output_wcsr_1 : i12, out io_output_wcsr_2 : i12, out io_output_wcsr_3 : i12, out io_output_csrData_0 : i64, out io_output_csrData_1 : i64, out io_output_csrData_2 : i64, out io_output_csrData_3 : i64, out io_output_retire : i1, out io_output_priv : i2, out io_output_isPriv : i1, out io_output_isSatp : i1, out io_output_except : i1, out io_output_debug_exit : i3, out io_output_debug_pc : i64, out io_output_debug_rcsr : i12, out io_output_debug_mmio : i1, out io_output_debug_intr : i1, out io_output_debug_rvc : i1) {
    %0 = hw.aggregate_constant [-1 : i8, 15 : i8, 3 : i8, 1 : i8] : !hw.array<4xi8>
    %c0_i5 = hw.constant 0 : i5
    %c-1_i2 = hw.constant -1 : i2
    %c0_i3 = hw.constant 0 : i3
    %c-1_i12 = hw.constant -1 : i12
    %c0_i6 = hw.constant 0 : i6
    %c0_i56 = hw.constant 0 : i56
    %c0_i48 = hw.constant 0 : i48
    %c0_i2 = hw.constant 0 : i2
    %c0_i8 = hw.constant 0 : i8
    %c0_i7 = hw.constant 0 : i7
    %c0_i16 = hw.constant 0 : i16
    %c0_i24 = hw.constant 0 : i24
    %c0_i40 = hw.constant 0 : i40
    %c0_i4 = hw.constant 0 : i4
    %true = hw.constant true
    %false = hw.constant false
    %c0_i32 = hw.constant 0 : i32
    %mask = seq.firreg %94 clock %clock {firrtl.random_init_start = 0 : ui64} : i8
    %addr = seq.firreg %86 clock %clock {firrtl.random_init_start = 8 : ui64} : i64
    %extType = seq.firreg %121 clock %clock {firrtl.random_init_start = 72 : ui64} : i3
    %rd = seq.firreg %58 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 75 : ui64, sv.namehint = "rd"} : i5
    %data = seq.firreg %91 clock %clock {firrtl.random_init_start = 80 : ui64, sv.namehint = "data"} : i64
    %isWcsr = seq.firreg %97 clock %clock reset sync %reset, %false {firrtl.random_init_start = 144 : ui64, sv.namehint = "isWcsr"} : i1
    %wcsr_0 = seq.firreg %100 clock %clock {firrtl.random_init_start = 145 : ui64, sv.namehint = "wcsr_0"} : i12
    %wcsr_1 = seq.firreg %103 clock %clock {firrtl.random_init_start = 157 : ui64, sv.namehint = "wcsr_1"} : i12
    %wcsr_2 = seq.firreg %106 clock %clock {firrtl.random_init_start = 169 : ui64, sv.namehint = "wcsr_2"} : i12
    %wcsr_3 = seq.firreg %109 clock %clock {firrtl.random_init_start = 181 : ui64, sv.namehint = "wcsr_3"} : i12
    %csrData_0 = seq.firreg %143 clock %clock {firrtl.random_init_start = 193 : ui64, sv.namehint = "csrData_0"} : i64
    %csrData_1 = seq.firreg %115 clock %clock {firrtl.random_init_start = 257 : ui64, sv.namehint = "csrData_1"} : i64
    %csrData_2 = seq.firreg %147 clock %clock {firrtl.random_init_start = 321 : ui64, sv.namehint = "csrData_2"} : i64
    %csrData_3 = seq.firreg %118 clock %clock {firrtl.random_init_start = 385 : ui64, sv.namehint = "csrData_3"} : i64
    %retire = seq.firreg %112 clock %clock {firrtl.random_init_start = 449 : ui64, sv.namehint = "retire"} : i1
    %priv = seq.firreg %124 clock %clock reset sync %reset, %c-1_i2 {firrtl.random_init_start = 450 : ui64, sv.namehint = "priv"} : i2
    %isPriv = seq.firreg %206 clock %clock reset sync %reset, %false {firrtl.random_init_start = 452 : ui64, sv.namehint = "isPriv"} : i1
    %isSatp = seq.firreg %204 clock %clock reset sync %reset, %false {firrtl.random_init_start = 453 : ui64, sv.namehint = "isSatp"} : i1
    %isWfe = seq.firreg %128 clock %clock reset sync %reset, %false {firrtl.random_init_start = 454 : ui64} : i1
    %cause = seq.firreg %49 clock %clock {firrtl.random_init_start = 455 : ui64} : i4
    %pc = seq.firreg %150 clock %clock {firrtl.random_init_start = 459 : ui64, sv.namehint = "pc"} : i64
    %except = seq.firreg %131 clock %clock reset sync %reset, %false {firrtl.random_init_start = 523 : ui64, sv.namehint = "except"} : i1
    %flush = seq.firreg %139 clock %clock reset sync %reset, %false {firrtl.random_init_start = 524 : ui64} : i1
    %exit = seq.firreg %153 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 525 : ui64, sv.namehint = "exit"} : i3
    %rcsr = seq.firreg %156 clock %clock reset sync %reset, %c-1_i12 {firrtl.random_init_start = 528 : ui64, sv.namehint = "rcsr"} : i12
    %mmio = seq.firreg %160 clock %clock reset sync %reset, %false {firrtl.random_init_start = 540 : ui64, sv.namehint = "mmio"} : i1
    %intr = seq.firreg %163 clock %clock reset sync %reset, %false {firrtl.random_init_start = 541 : ui64, sv.namehint = "intr"} : i1
    %rvc = seq.firreg %166 clock %clock reset sync %reset, %false {firrtl.random_init_start = 542 : ui64, sv.namehint = "rvc"} : i1
    %1 = comb.extract %addr from 0 {sv.namehint = "offset"} : (i64) -> i3
    %2 = comb.extract %io_input_addr from 0 {sv.namehint = "wireOff"} : (i64) -> i3
    %NVALID = seq.firreg %202 clock %clock reset sync %reset, %false {firrtl.random_init_start = 819 : ui64, sv.namehint = "NVALID"} : i1
    %LREADY = seq.firreg %199 clock %clock reset sync %reset, %true {firrtl.random_init_start = 820 : ui64, sv.namehint = "LREADY"} : i1
    %isMem = seq.firreg %171 clock %clock reset sync %reset, %false {firrtl.random_init_start = 821 : ui64} : i1
    %rw = seq.firreg %173 clock %clock reset sync %reset, %true {firrtl.random_init_start = 822 : ui64} : i1
    %3 = comb.and bin %io_lastVR_VALID, %LREADY {sv.namehint = "_wireAddr_T"} : i1
    %4 = comb.mux bin %3, %io_input_addr, %addr {sv.namehint = "wireAddr"} : i64
    %5 = comb.extract %io_dmmu_pipelineResult_cpuResult_data from 8 {sv.namehint = "_shiftRdata_T_1"} : (i64) -> i56
    %6 = comb.extract %io_dmmu_pipelineResult_cpuResult_data from 16 {sv.namehint = "_shiftRdata_T_2"} : (i64) -> i48
    %7 = comb.extract %io_dmmu_pipelineResult_cpuResult_data from 24 {sv.namehint = "_shiftRdata_T_3"} : (i64) -> i40
    %8 = comb.extract %io_dmmu_pipelineResult_cpuResult_data from 32 {sv.namehint = "_shiftRdata_T_4"} : (i64) -> i32
    %9 = comb.extract %io_dmmu_pipelineResult_cpuResult_data from 40 {sv.namehint = "_shiftRdata_T_5"} : (i64) -> i24
    %10 = comb.extract %io_dmmu_pipelineResult_cpuResult_data from 48 {sv.namehint = "_shiftRdata_T_6"} : (i64) -> i16
    %11 = comb.extract %io_dmmu_pipelineResult_cpuResult_data from 56 {sv.namehint = "_shiftRdata_T_7"} : (i64) -> i8
    %12 = comb.concat %c0_i8, %5 : i8, i56
    %13 = comb.concat %c0_i16, %6 : i16, i48
    %14 = comb.concat %c0_i24, %7 : i24, i40
    %15 = comb.concat %c0_i32, %8 : i32, i32
    %16 = comb.concat %c0_i40, %9 : i40, i24
    %17 = comb.concat %c0_i48, %10 : i48, i16
    %18 = comb.concat %c0_i56, %11 : i56, i8
    %19 = comb.extract %extType from 0 {sv.namehint = "_extRdata_T"} : (i3) -> i2
    %20 = hw.array_create %18, %17, %16, %15, %14, %13, %12, %io_dmmu_pipelineResult_cpuResult_data : i64
    %21 = hw.array_get %20[%1] : !hw.array<8xi64>, i3
    %22 = comb.extract %extType from 2 {sv.namehint = "_extRdata_T_16"} : (i3) -> i1
    %23 = comb.xor bin %22, %true {sv.namehint = "_extRdata_T_3"} : i1
    %24 = comb.extract %21 from 7 {sv.namehint = "_extRdata_T_4"} : (i64) -> i1
    %25 = comb.and bin %23, %24 {sv.namehint = "_extRdata_T_5"} : i1
    %26 = comb.replicate %25 {sv.namehint = "_extRdata_T_6"} : (i1) -> i56
    %27 = comb.extract %21 from 0 {sv.namehint = "_extRdata_T_7"} : (i64) -> i8
    %28 = comb.concat %26, %27 {sv.namehint = "_extRdata_T_8"} : i56, i8
    %29 = comb.xor bin %22, %true {sv.namehint = "_extRdata_T_10"} : i1
    %30 = comb.extract %21 from 15 {sv.namehint = "_extRdata_T_11"} : (i64) -> i1
    %31 = comb.and bin %29, %30 {sv.namehint = "_extRdata_T_12"} : i1
    %32 = comb.replicate %31 {sv.namehint = "_extRdata_T_13"} : (i1) -> i48
    %33 = comb.extract %21 from 0 {sv.namehint = "_extRdata_T_14"} : (i64) -> i16
    %34 = comb.concat %32, %33 {sv.namehint = "_extRdata_T_15"} : i48, i16
    %35 = comb.xor bin %22, %true {sv.namehint = "_extRdata_T_17"} : i1
    %36 = comb.extract %21 from 31 {sv.namehint = "_extRdata_T_18"} : (i64) -> i1
    %37 = comb.and bin %35, %36 {sv.namehint = "_extRdata_T_19"} : i1
    %38 = comb.replicate %37 {sv.namehint = "_extRdata_T_20"} : (i1) -> i32
    %39 = comb.extract %21 from 0 {sv.namehint = "_extRdata_T_21"} : (i64) -> i32
    %40 = comb.concat %38, %39 {sv.namehint = "_extRdata_T_22"} : i32, i32
    %41 = hw.array_create %21, %40, %34, %28 : i64
    %42 = hw.array_get %41[%19] {sv.namehint = "extRdata"} : !hw.array<4xi64>, i2
    %43 = comb.extract %io_input_mask from 0 {sv.namehint = "_rawStrb_T_3"} : (i3) -> i2
    %44 = comb.concat %false, %83 {sv.namehint = "io_dmmu_pipelineReq_cpuReq_size"} : i1, i2
    %45 = comb.xor bin %io_dmmu_pipelineResult_exception, %true {sv.namehint = "_NVALID_T"} : i1
    %46 = comb.mux bin %rw, %data, %42 : i64
    %47 = comb.or %io_dmmu_pipelineResult_exception, %isWfe : i1
    %48 = comb.and bin %io_dmmu_pipelineResult_cpuResult_ready, %io_dmmu_pipelineResult_exception : i1
    %49 = comb.mux bin %48, %io_dmmu_pipelineResult_cause, %cause : i4
    %50 = comb.mux bin %io_dmmu_pipelineResult_exception, %mmio, %io_dmmu_pipelineResult_isMMIO : i1
    %51 = comb.xor bin %io_input_memExpt, %true : i1
    %52 = comb.icmp bin ne %io_input_cause, %cause : i4
    %53 = comb.or bin %51, %52 : i1
    %54 = comb.and bin %isWfe, %53 : i1
    %55 = comb.or bin %io_dmmu_pipelineResult_cpuResult_ready, %54 : i1
    %56 = comb.xor %3, %true : i1
    %57 = comb.or %55, %56 : i1
    %58 = comb.mux bin %57, %rd, %io_input_rd : i5
    %59 = hw.array_get %0[%43] : !hw.array<4xi8>, i2
    %60 = comb.extract %59 from 0 {sv.namehint = "_wireMask_T"} : (i8) -> i7
    %61 = comb.concat %60, %false {sv.namehint = "_wireMask_WIRE_1"} : i7, i1
    %62 = comb.extract %59 from 0 {sv.namehint = "_wireMask_T_2"} : (i8) -> i6
    %63 = comb.concat %62, %c0_i2 {sv.namehint = "_wireMask_WIRE_2"} : i6, i2
    %64 = comb.extract %59 from 0 {sv.namehint = "_wireMask_T_4"} : (i8) -> i5
    %65 = comb.concat %64, %c0_i3 {sv.namehint = "_wireMask_WIRE_3"} : i5, i3
    %66 = comb.extract %59 from 0 {sv.namehint = "_wireMask_T_6"} : (i8) -> i4
    %67 = comb.concat %66, %c0_i4 {sv.namehint = "_wireMask_WIRE_4"} : i4, i4
    %68 = comb.extract %59 from 0 {sv.namehint = "_wireMask_T_8"} : (i8) -> i3
    %69 = comb.concat %68, %c0_i5 {sv.namehint = "_wireMask_WIRE_5"} : i3, i5
    %70 = comb.extract %59 from 0 {sv.namehint = "_wireMask_T_10"} : (i8) -> i2
    %71 = comb.concat %70, %c0_i6 {sv.namehint = "_wireMask_WIRE_6"} : i2, i6
    %72 = comb.extract %59 from 0 {sv.namehint = "_wireMask_T_12"} : (i8) -> i1
    %73 = comb.concat %72, %c0_i7 {sv.namehint = "_wireMask_WIRE_7"} : i1, i7
    %74 = hw.array_create %73, %71, %69, %67, %65, %63, %61, %59 : i8
    %75 = hw.array_get %74[%2] : !hw.array<8xi8>, i3
    %76 = comb.xor %3, %true : i1
    %77 = comb.or %55, %76 : i1
    %78 = comb.mux bin %77, %mask, %75 {sv.namehint = "wireMask"} : i8
    %79 = comb.xor %3, %true : i1
    %80 = comb.or %55, %79 : i1
    %81 = comb.extract %extType from 0 : (i3) -> i2
    %82 = comb.extract %io_input_mask from 0 : (i3) -> i2
    %83 = comb.mux bin %80, %81, %82 {sv.namehint = "wireReql"} : i2
    %84 = comb.xor %3, %true : i1
    %85 = comb.or %55, %84 : i1
    %86 = comb.mux bin %85, %addr, %io_input_addr : i64
    %87 = comb.xor %3, %true : i1
    %88 = comb.xor %3, %true : i1
    %89 = comb.or %54, %87, %55, %88 : i1
    %90 = comb.mux bin %89, %data, %190 : i64
    %91 = comb.mux bin %io_dmmu_pipelineResult_cpuResult_ready, %46, %90 : i64
    %92 = comb.xor %3, %true : i1
    %93 = comb.or %92, %77 : i1
    %94 = comb.mux bin %93, %mask, %75 : i8
    %95 = comb.xor %3, %true : i1
    %96 = comb.or %55, %95 : i1
    %97 = comb.mux bin %96, %isWcsr, %io_input_isWcsr : i1
    %98 = comb.xor %3, %true : i1
    %99 = comb.or %55, %98 : i1
    %100 = comb.mux bin %99, %wcsr_0, %io_input_wcsr_0 : i12
    %101 = comb.xor %3, %true : i1
    %102 = comb.or %55, %101 : i1
    %103 = comb.mux bin %102, %wcsr_1, %io_input_wcsr_1 : i12
    %104 = comb.xor %3, %true : i1
    %105 = comb.or %55, %104 : i1
    %106 = comb.mux bin %105, %wcsr_2, %io_input_wcsr_2 : i12
    %107 = comb.xor %3, %true : i1
    %108 = comb.or %55, %107 : i1
    %109 = comb.mux bin %108, %wcsr_3, %io_input_wcsr_3 : i12
    %110 = comb.xor %3, %true : i1
    %111 = comb.or %55, %110 : i1
    %112 = comb.mux bin %111, %retire, %io_input_retire : i1
    %113 = comb.xor %3, %true : i1
    %114 = comb.or %55, %113 : i1
    %115 = comb.mux bin %114, %csrData_1, %io_input_csrData_1 : i64
    %116 = comb.xor %3, %true : i1
    %117 = comb.or %55, %116 : i1
    %118 = comb.mux bin %117, %csrData_3, %io_input_csrData_3 : i64
    %119 = comb.xor %3, %true : i1
    %120 = comb.or %119, %80 : i1
    %121 = comb.mux bin %120, %extType, %io_input_mask : i3
    %122 = comb.xor %3, %true : i1
    %123 = comb.or %55, %122 : i1
    %124 = comb.mux bin %123, %priv, %io_input_priv : i2
    %125 = comb.xor %3, %true : i1
    %126 = comb.or %54, %125 : i1
    %127 = comb.and %126, %isWfe : i1
    %128 = comb.mux bin %io_dmmu_pipelineResult_cpuResult_ready, %47, %127 : i1
    %129 = comb.xor %3, %true : i1
    %130 = comb.or %55, %129 : i1
    %131 = comb.mux bin %130, %except, %isWfe : i1
    %132 = comb.xor %3, %true : i1
    %133 = comb.or %55, %132 : i1
    %134 = comb.mux bin %133, %flush, %io_input_fshTLB {sv.namehint = "wireFsh"} : i1
    %135 = comb.xor %3, %true : i1
    %136 = comb.or %54, %135, %133 : i1
    %137 = comb.mux bin %136, %flush, %io_input_fshTLB : i1
    %138 = comb.xor %io_dmmu_pipelineResult_cpuResult_ready, %true : i1
    %139 = comb.and %138, %137 : i1
    %140 = comb.mux bin %isWfe, %pc, %io_input_csrData_0 : i64
    %141 = comb.xor %3, %true : i1
    %142 = comb.or %55, %141 : i1
    %143 = comb.mux bin %142, %csrData_0, %140 : i64
    %144 = comb.mux bin %isWfe, %addr, %io_input_csrData_2 : i64
    %145 = comb.xor %3, %true : i1
    %146 = comb.or %55, %145 : i1
    %147 = comb.mux bin %146, %csrData_2, %144 : i64
    %148 = comb.xor %3, %true : i1
    %149 = comb.or %55, %148, %isWfe : i1
    %150 = comb.mux bin %149, %pc, %io_input_pc : i64
    %151 = comb.xor %3, %true : i1
    %152 = comb.or %55, %151 : i1
    %153 = comb.mux bin %152, %exit, %io_input_debug_exit : i3
    %154 = comb.xor %3, %true : i1
    %155 = comb.or %55, %154 : i1
    %156 = comb.mux bin %155, %rcsr, %io_input_debug_rcsr : i12
    %157 = comb.xor %3, %true : i1
    %158 = comb.or %54, %157 : i1
    %159 = comb.and %158, %mmio : i1
    %160 = comb.mux bin %io_dmmu_pipelineResult_cpuResult_ready, %50, %159 : i1
    %161 = comb.xor %3, %true : i1
    %162 = comb.or %55, %161 : i1
    %163 = comb.mux bin %162, %intr, %io_input_debug_intr : i1
    %164 = comb.xor %3, %true : i1
    %165 = comb.or %55, %164 : i1
    %166 = comb.mux bin %165, %rvc, %io_input_debug_rvc : i1
    %167 = comb.or bin %io_input_isMem, %io_input_isLd : i1
    %168 = comb.and bin %3, %167 : i1
    %169 = comb.mux bin %168, %io_input_isMem, %isMem : i1
    %170 = comb.xor %55, %true : i1
    %171 = comb.and %170, %169 {sv.namehint = "wireIsMem"} : i1
    %172 = comb.mux bin %168, %196, %rw : i1
    %173 = comb.or %55, %172 : i1
    %174 = comb.extract %io_input_data from 0 {sv.namehint = "_wireData_T"} : (i64) -> i56
    %175 = comb.concat %174, %c0_i8 {sv.namehint = "_wireData_WIRE_1"} : i56, i8
    %176 = comb.extract %io_input_data from 0 {sv.namehint = "_wireData_T_2"} : (i64) -> i48
    %177 = comb.concat %176, %c0_i16 {sv.namehint = "_wireData_WIRE_2"} : i48, i16
    %178 = comb.extract %io_input_data from 0 {sv.namehint = "_wireData_T_4"} : (i64) -> i40
    %179 = comb.concat %178, %c0_i24 {sv.namehint = "_wireData_WIRE_3"} : i40, i24
    %180 = comb.extract %io_input_data from 0 {sv.namehint = "_wireData_T_6"} : (i64) -> i32
    %181 = comb.concat %180, %c0_i32 {sv.namehint = "_wireData_WIRE_4"} : i32, i32
    %182 = comb.extract %io_input_data from 0 {sv.namehint = "_wireData_T_8"} : (i64) -> i24
    %183 = comb.concat %182, %c0_i40 {sv.namehint = "_wireData_WIRE_5"} : i24, i40
    %184 = comb.extract %io_input_data from 0 {sv.namehint = "_wireData_T_10"} : (i64) -> i16
    %185 = comb.concat %184, %c0_i48 {sv.namehint = "_wireData_WIRE_6"} : i16, i48
    %186 = comb.extract %io_input_data from 0 {sv.namehint = "_wireData_T_12"} : (i64) -> i8
    %187 = comb.concat %186, %c0_i56 {sv.namehint = "_wireData_WIRE_7"} : i8, i56
    %188 = hw.array_create %187, %185, %183, %181, %179, %177, %175, %io_input_data : i64
    %189 = hw.array_get %188[%2] : !hw.array<8xi64>, i3
    %190 = comb.mux bin %167, %189, %io_input_data : i64
    %191 = comb.xor %3, %true : i1
    %192 = comb.or %55, %191 : i1
    %193 = comb.mux bin %192, %data, %190 {sv.namehint = "wireData"} : i64
    %194 = comb.xor bin %io_input_isLd, %true {sv.namehint = "_wireRw_T"} : i1
    %195 = comb.mux bin %168, %194, %rw : i1
    %196 = comb.or %55, %195 {sv.namehint = "wireRw"} : i1
    %197 = comb.xor bin %167, %true : i1
    %198 = comb.mux bin %3, %197, %LREADY : i1
    %199 = comb.or %55, %198 : i1
    %200 = comb.xor %54, %true : i1
    %201 = comb.and %200, %3, %197 : i1
    %202 = comb.mux bin %io_dmmu_pipelineResult_cpuResult_ready, %45, %201 : i1
    %203 = comb.and %3, %io_input_isSatp : i1
    %204 = comb.mux bin %55, %isSatp, %203 : i1
    %205 = comb.and %3, %io_input_isPriv : i1
    %206 = comb.mux bin %55, %isPriv, %205 : i1
    hw.output %4, %193, %44, %196, %78, %171, %134, %LREADY, %NVALID, %rd, %data, %isWcsr, %wcsr_0, %wcsr_1, %wcsr_2, %wcsr_3, %csrData_0, %csrData_1, %csrData_2, %csrData_3, %retire, %priv, %isPriv, %isSatp, %except, %exit, %pc, %rcsr, %mmio, %intr, %rvc : i64, i64, i3, i1, i8, i1, i1, i1, i1, i5, i64, i1, i12, i12, i12, i12, i64, i64, i64, i64, i1, i2, i1, i1, i1, i3, i64, i12, i1, i1, i1
  }
  hw.module private @WB(in %clock : !seq.clock, in %reset : i1, out io_gprsW_wen : i1, out io_gprsW_waddr : i5, out io_gprsW_wdata : i64, out io_gprsW_retire : i1, out io_gprsW_except : i1, out io_csrsW_wen_0 : i1, out io_csrsW_wen_1 : i1, out io_csrsW_wen_2 : i1, out io_csrsW_wen_3 : i1, out io_csrsW_wcsr_0 : i12, out io_csrsW_wcsr_1 : i12, out io_csrsW_wcsr_2 : i12, out io_csrsW_wcsr_3 : i12, out io_csrsW_wdata_0 : i64, out io_csrsW_wdata_1 : i64, out io_csrsW_wdata_2 : i64, out io_csrsW_wdata_3 : i64, in %io_lastVR_VALID : i1, in %io_input_rd : i5, in %io_input_data : i64, in %io_input_wcsr_0 : i12, in %io_input_wcsr_1 : i12, in %io_input_wcsr_2 : i12, in %io_input_wcsr_3 : i12, in %io_input_csrData_0 : i64, in %io_input_csrData_1 : i64, in %io_input_csrData_2 : i64, in %io_input_csrData_3 : i64, in %io_input_retire : i1, in %io_input_priv : i2, in %io_input_isPriv : i1, in %io_input_except : i1, in %io_input_debug_exit : i3, in %io_input_debug_pc : i64, in %io_input_debug_rcsr : i12, in %io_input_debug_mmio : i1, in %io_input_debug_intr : i1, in %io_input_debug_rvc : i1, out io_retire : i1, out io_priv : i2, out io_isPriv : i1, out io_debug_pc : i64, out io_debug_exit : i3, out io_debug_rd : i5, out io_debug_rcsr : i12, out io_debug_mmio : i1, out io_debug_intr : i1, out io_debug_rvc : i1) {
    %c0_i64 = hw.constant 0 : i64
    %c0_i3 = hw.constant 0 : i3
    %c0_i5 = hw.constant 0 : i5
    %c-1_i12 = hw.constant -1 : i12
    %c-1_i2 = hw.constant -1 : i2
    %false = hw.constant false
    %pc = seq.firreg %12 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 0 : ui64, sv.namehint = "pc"} : i64
    %exit = seq.firreg %11 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 64 : ui64, sv.namehint = "exit"} : i3
    %rd = seq.firreg %13 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 67 : ui64, sv.namehint = "rd"} : i5
    %rcsr = seq.firreg %14 clock %clock reset sync %reset, %c-1_i12 {firrtl.random_init_start = 72 : ui64, sv.namehint = "rcsr"} : i12
    %mmio = seq.firreg %15 clock %clock reset sync %reset, %false {firrtl.random_init_start = 84 : ui64, sv.namehint = "mmio"} : i1
    %intr = seq.firreg %16 clock %clock reset sync %reset, %false {firrtl.random_init_start = 85 : ui64, sv.namehint = "intr"} : i1
    %rvc = seq.firreg %17 clock %clock reset sync %reset, %false {firrtl.random_init_start = 86 : ui64, sv.namehint = "rvc"} : i1
    %0 = comb.and bin %io_lastVR_VALID, %io_input_retire {sv.namehint = "_io_retire_T"} : i1
    %io_retire_REG = seq.firreg %0 clock %clock {firrtl.random_init_start = 87 : ui64, sv.namehint = "io_retire"} : i1
    %1 = comb.icmp bin ne %io_input_wcsr_0, %c-1_i12 {sv.namehint = "_io_csrsW_wen_0_T"} : i12
    %2 = comb.and %io_lastVR_VALID, %1 {sv.namehint = "io_csrsW_wen_0"} : i1
    %3 = comb.icmp bin ne %io_input_wcsr_1, %c-1_i12 {sv.namehint = "_io_csrsW_wen_1_T"} : i12
    %4 = comb.and %io_lastVR_VALID, %3 {sv.namehint = "io_csrsW_wen_1"} : i1
    %5 = comb.icmp bin ne %io_input_wcsr_2, %c-1_i12 {sv.namehint = "_io_csrsW_wen_2_T"} : i12
    %6 = comb.and %io_lastVR_VALID, %5 {sv.namehint = "io_csrsW_wen_2"} : i1
    %7 = comb.icmp bin ne %io_input_wcsr_3, %c-1_i12 {sv.namehint = "_io_csrsW_wen_3_T"} : i12
    %8 = comb.and %io_lastVR_VALID, %7 {sv.namehint = "io_csrsW_wen_3"} : i1
    %9 = comb.mux bin %io_lastVR_VALID, %io_input_priv, %c-1_i2 {sv.namehint = "io_priv"} : i2
    %10 = comb.and %io_lastVR_VALID, %io_input_isPriv {sv.namehint = "io_isPriv"} : i1
    %11 = comb.mux bin %io_lastVR_VALID, %io_input_debug_exit, %exit : i3
    %12 = comb.mux bin %io_lastVR_VALID, %io_input_debug_pc, %pc : i64
    %13 = comb.mux bin %io_lastVR_VALID, %io_input_rd, %rd : i5
    %14 = comb.mux bin %io_lastVR_VALID, %io_input_debug_rcsr, %rcsr : i12
    %15 = comb.mux bin %io_lastVR_VALID, %io_input_debug_mmio, %mmio : i1
    %16 = comb.mux bin %io_lastVR_VALID, %io_input_debug_intr, %intr : i1
    %17 = comb.mux bin %io_lastVR_VALID, %io_input_debug_rvc, %rvc : i1
    hw.output %io_lastVR_VALID, %io_input_rd, %io_input_data, %io_input_retire, %io_input_except, %2, %4, %6, %8, %io_input_wcsr_0, %io_input_wcsr_1, %io_input_wcsr_2, %io_input_wcsr_3, %io_input_csrData_0, %io_input_csrData_1, %io_input_csrData_2, %io_input_csrData_3, %io_retire_REG, %9, %10, %pc, %exit, %rd, %rcsr, %mmio, %intr, %rvc : i1, i5, i64, i1, i1, i1, i1, i1, i1, i12, i12, i12, i12, i64, i64, i64, i64, i1, i2, i1, i64, i3, i5, i12, i1, i1, i1
  }
  hw.module private @CPU(in %clock : !seq.clock, in %reset : i1, in %io_master_aw_ready : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__2__io_master_aw_ready>}, out io_master_aw_valid : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__3__io_master_aw_valid>}, out io_master_aw_bits_id : i4 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__4__io_master_aw_bits_id>}, out io_master_aw_bits_addr : i32 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__5__io_master_aw_bits_addr>}, out io_master_aw_bits_len : i8 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__6__io_master_aw_bits_len>}, out io_master_aw_bits_size : i3 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__7__io_master_aw_bits_size>}, out io_master_aw_bits_burst : i2 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__8__io_master_aw_bits_burst>}, in %io_master_ar_ready : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__15__io_master_ar_ready>}, out io_master_ar_valid : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__16__io_master_ar_valid>}, out io_master_ar_bits_id : i4 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__17__io_master_ar_bits_id>}, out io_master_ar_bits_addr : i32 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__18__io_master_ar_bits_addr>}, out io_master_ar_bits_len : i8 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__19__io_master_ar_bits_len>}, out io_master_ar_bits_size : i3 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__20__io_master_ar_bits_size>}, out io_master_ar_bits_burst : i2 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__21__io_master_ar_bits_burst>}, in %io_master_w_ready : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__28__io_master_w_ready>}, out io_master_w_valid : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__29__io_master_w_valid>}, out io_master_w_bits_data : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__30__io_master_w_bits_data>}, out io_master_w_bits_strb : i8 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__31__io_master_w_bits_strb>}, out io_master_w_bits_last : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__32__io_master_w_bits_last>}, out io_master_b_ready : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__34__io_master_b_ready>}, in %io_master_b_valid : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__35__io_master_b_valid>}, in %io_master_b_bits_id : i4 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__36__io_master_b_bits_id>}, in %io_master_b_bits_resp : i2 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__37__io_master_b_bits_resp>}, out io_master_r_ready : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__39__io_master_r_ready>}, in %io_master_r_valid : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__40__io_master_r_valid>}, in %io_master_r_bits_id : i4 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__41__io_master_r_bits_id>}, in %io_master_r_bits_data : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__42__io_master_r_bits_data>}, in %io_master_r_bits_resp : i2 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__43__io_master_r_bits_resp>}, in %io_master_r_bits_last : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__44__io_master_r_bits_last>}, out io_slave_aw_ready : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__46__io_slave_aw_ready>}, in %io_slave_aw_valid : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__47__io_slave_aw_valid>}, in %io_slave_aw_bits_id : i4 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__48__io_slave_aw_bits_id>}, in %io_slave_aw_bits_addr : i32 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__49__io_slave_aw_bits_addr>}, in %io_slave_aw_bits_len : i8 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__50__io_slave_aw_bits_len>}, in %io_slave_aw_bits_size : i3 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__51__io_slave_aw_bits_size>}, in %io_slave_aw_bits_burst : i2 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__52__io_slave_aw_bits_burst>}, out io_slave_ar_ready : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__59__io_slave_ar_ready>}, in %io_slave_ar_valid : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__60__io_slave_ar_valid>}, in %io_slave_ar_bits_id : i4 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__61__io_slave_ar_bits_id>}, in %io_slave_ar_bits_addr : i32 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__62__io_slave_ar_bits_addr>}, in %io_slave_ar_bits_len : i8 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__63__io_slave_ar_bits_len>}, in %io_slave_ar_bits_size : i3 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__64__io_slave_ar_bits_size>}, in %io_slave_ar_bits_burst : i2 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__65__io_slave_ar_bits_burst>}, out io_slave_w_ready : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__72__io_slave_w_ready>}, in %io_slave_w_valid : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__73__io_slave_w_valid>}, in %io_slave_w_bits_data : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__74__io_slave_w_bits_data>}, in %io_slave_w_bits_strb : i8 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__75__io_slave_w_bits_strb>}, in %io_slave_w_bits_last : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__76__io_slave_w_bits_last>}, in %io_slave_b_ready : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__78__io_slave_b_ready>}, out io_slave_b_valid : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__79__io_slave_b_valid>}, out io_slave_b_bits_id : i4 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__80__io_slave_b_bits_id>}, out io_slave_b_bits_resp : i2 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__81__io_slave_b_bits_resp>}, in %io_slave_r_ready : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__83__io_slave_r_ready>}, out io_slave_r_valid : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__84__io_slave_r_valid>}, out io_slave_r_bits_id : i4 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__85__io_slave_r_bits_id>}, out io_slave_r_bits_data : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__86__io_slave_r_bits_data>}, out io_slave_r_bits_resp : i2 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__87__io_slave_r_bits_resp>}, out io_slave_r_bits_last : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__88__io_slave_r_bits_last>}, in %io_interrupt : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__90__io_interrupt>}, out io_debug_exit : i3 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__91__io_debug_exit>}, out io_debug_wbPC : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__92__io_debug_wbPC>}, out io_debug_wbValid : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__93__io_debug_wbValid>}, out io_debug_wbRd : i5 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__94__io_debug_wbRd>}, out io_debug_wbRcsr : i12 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__95__io_debug_wbRcsr>}, out io_debug_wbMMIO : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__96__io_debug_wbMMIO>}, out io_debug_wbIntr : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__97__io_debug_wbIntr>}, out io_debug_wbRvc : i1 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__98__io_debug_wbRvc>}, out io_debug_gprs_0 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__99__io_debug_gprs_0>}, out io_debug_gprs_1 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__100__io_debug_gprs_1>}, out io_debug_gprs_2 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__101__io_debug_gprs_2>}, out io_debug_gprs_3 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__102__io_debug_gprs_3>}, out io_debug_gprs_4 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__103__io_debug_gprs_4>}, out io_debug_gprs_5 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__104__io_debug_gprs_5>}, out io_debug_gprs_6 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__105__io_debug_gprs_6>}, out io_debug_gprs_7 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__106__io_debug_gprs_7>}, out io_debug_gprs_8 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__107__io_debug_gprs_8>}, out io_debug_gprs_9 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__108__io_debug_gprs_9>}, out io_debug_gprs_10 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__109__io_debug_gprs_10>}, out io_debug_gprs_11 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__110__io_debug_gprs_11>}, out io_debug_gprs_12 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__111__io_debug_gprs_12>}, out io_debug_gprs_13 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__112__io_debug_gprs_13>}, out io_debug_gprs_14 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__113__io_debug_gprs_14>}, out io_debug_gprs_15 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__114__io_debug_gprs_15>}, out io_debug_gprs_16 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__115__io_debug_gprs_16>}, out io_debug_gprs_17 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__116__io_debug_gprs_17>}, out io_debug_gprs_18 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__117__io_debug_gprs_18>}, out io_debug_gprs_19 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__118__io_debug_gprs_19>}, out io_debug_gprs_20 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__119__io_debug_gprs_20>}, out io_debug_gprs_21 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__120__io_debug_gprs_21>}, out io_debug_gprs_22 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__121__io_debug_gprs_22>}, out io_debug_gprs_23 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__122__io_debug_gprs_23>}, out io_debug_gprs_24 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__123__io_debug_gprs_24>}, out io_debug_gprs_25 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__124__io_debug_gprs_25>}, out io_debug_gprs_26 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__125__io_debug_gprs_26>}, out io_debug_gprs_27 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__126__io_debug_gprs_27>}, out io_debug_gprs_28 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__127__io_debug_gprs_28>}, out io_debug_gprs_29 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__128__io_debug_gprs_29>}, out io_debug_gprs_30 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__129__io_debug_gprs_30>}, out io_debug_gprs_31 : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__130__io_debug_gprs_31>}, out io_debug_priv : i2 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__131__io_debug_priv>}, out io_debug_mstatus : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__132__io_debug_mstatus>}, out io_debug_mepc : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__133__io_debug_mepc>}, out io_debug_sepc : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__134__io_debug_sepc>}, out io_debug_mtvec : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__135__io_debug_mtvec>}, out io_debug_stvec : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__136__io_debug_stvec>}, out io_debug_mcause : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__137__io_debug_mcause>}, out io_debug_scause : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__138__io_debug_scause>}, out io_debug_mtval : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__139__io_debug_mtval>}, out io_debug_stval : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__140__io_debug_stval>}, out io_debug_mie : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__141__io_debug_mie>}, out io_debug_mscratch : i64 {hw.exportPort = #hw<innerSym@__CPU__DONTTOUCH__142__io_debug_mscratch>}) {
    %c0_i2 = hw.constant 0 : i2
    %c1_i2 = hw.constant 1 : i2
    %c0_i64 = hw.constant 0 : i64
    %c0_i4 = hw.constant 0 : i4
    %true = hw.constant true
    %moduleGPRs.io_rregs_1, %moduleGPRs.io_rregs_2, %moduleGPRs.io_rregs_3, %moduleGPRs.io_rregs_4, %moduleGPRs.io_rregs_5, %moduleGPRs.io_rregs_6, %moduleGPRs.io_rregs_7, %moduleGPRs.io_rregs_8, %moduleGPRs.io_rregs_9, %moduleGPRs.io_rregs_10, %moduleGPRs.io_rregs_11, %moduleGPRs.io_rregs_12, %moduleGPRs.io_rregs_13, %moduleGPRs.io_rregs_14, %moduleGPRs.io_rregs_15, %moduleGPRs.io_rregs_16, %moduleGPRs.io_rregs_17, %moduleGPRs.io_rregs_18, %moduleGPRs.io_rregs_19, %moduleGPRs.io_rregs_20, %moduleGPRs.io_rregs_21, %moduleGPRs.io_rregs_22, %moduleGPRs.io_rregs_23, %moduleGPRs.io_rregs_24, %moduleGPRs.io_rregs_25, %moduleGPRs.io_rregs_26, %moduleGPRs.io_rregs_27, %moduleGPRs.io_rregs_28, %moduleGPRs.io_rregs_29, %moduleGPRs.io_rregs_30, %moduleGPRs.io_rregs_31, %moduleGPRs.io_debug_gprs_1, %moduleGPRs.io_debug_gprs_2, %moduleGPRs.io_debug_gprs_3, %moduleGPRs.io_debug_gprs_4, %moduleGPRs.io_debug_gprs_5, %moduleGPRs.io_debug_gprs_6, %moduleGPRs.io_debug_gprs_7, %moduleGPRs.io_debug_gprs_8, %moduleGPRs.io_debug_gprs_9, %moduleGPRs.io_debug_gprs_10, %moduleGPRs.io_debug_gprs_11, %moduleGPRs.io_debug_gprs_12, %moduleGPRs.io_debug_gprs_13, %moduleGPRs.io_debug_gprs_14, %moduleGPRs.io_debug_gprs_15, %moduleGPRs.io_debug_gprs_16, %moduleGPRs.io_debug_gprs_17, %moduleGPRs.io_debug_gprs_18, %moduleGPRs.io_debug_gprs_19, %moduleGPRs.io_debug_gprs_20, %moduleGPRs.io_debug_gprs_21, %moduleGPRs.io_debug_gprs_22, %moduleGPRs.io_debug_gprs_23, %moduleGPRs.io_debug_gprs_24, %moduleGPRs.io_debug_gprs_25, %moduleGPRs.io_debug_gprs_26, %moduleGPRs.io_debug_gprs_27, %moduleGPRs.io_debug_gprs_28, %moduleGPRs.io_debug_gprs_29, %moduleGPRs.io_debug_gprs_30, %moduleGPRs.io_debug_gprs_31 = hw.instance "moduleGPRs" @GPRs(clock: %clock: !seq.clock, reset: %reset: i1, io_gprsW_wen: %moduleWB.io_gprsW_wen: i1, io_gprsW_waddr: %moduleWB.io_gprsW_waddr: i5, io_gprsW_wdata: %moduleWB.io_gprsW_wdata: i64, io_gprsW_retire: %moduleWB.io_gprsW_retire: i1, io_gprsW_except: %moduleWB.io_gprsW_except: i1) -> (io_rregs_1: i64, io_rregs_2: i64, io_rregs_3: i64, io_rregs_4: i64, io_rregs_5: i64, io_rregs_6: i64, io_rregs_7: i64, io_rregs_8: i64, io_rregs_9: i64, io_rregs_10: i64, io_rregs_11: i64, io_rregs_12: i64, io_rregs_13: i64, io_rregs_14: i64, io_rregs_15: i64, io_rregs_16: i64, io_rregs_17: i64, io_rregs_18: i64, io_rregs_19: i64, io_rregs_20: i64, io_rregs_21: i64, io_rregs_22: i64, io_rregs_23: i64, io_rregs_24: i64, io_rregs_25: i64, io_rregs_26: i64, io_rregs_27: i64, io_rregs_28: i64, io_rregs_29: i64, io_rregs_30: i64, io_rregs_31: i64, io_debug_gprs_1: i64, io_debug_gprs_2: i64, io_debug_gprs_3: i64, io_debug_gprs_4: i64, io_debug_gprs_5: i64, io_debug_gprs_6: i64, io_debug_gprs_7: i64, io_debug_gprs_8: i64, io_debug_gprs_9: i64, io_debug_gprs_10: i64, io_debug_gprs_11: i64, io_debug_gprs_12: i64, io_debug_gprs_13: i64, io_debug_gprs_14: i64, io_debug_gprs_15: i64, io_debug_gprs_16: i64, io_debug_gprs_17: i64, io_debug_gprs_18: i64, io_debug_gprs_19: i64, io_debug_gprs_20: i64, io_debug_gprs_21: i64, io_debug_gprs_22: i64, io_debug_gprs_23: i64, io_debug_gprs_24: i64, io_debug_gprs_25: i64, io_debug_gprs_26: i64, io_debug_gprs_27: i64, io_debug_gprs_28: i64, io_debug_gprs_29: i64, io_debug_gprs_30: i64, io_debug_gprs_31: i64) {sv.namehint = "moduleBypass.io_rregs_9"}
    %moduleCSRs.io_csrsR_0_rdata, %moduleCSRs.io_csrsR_1_rdata, %moduleCSRs.io_csrsR_2_rdata, %moduleCSRs.io_csrsR_3_rdata, %moduleCSRs.io_csrsR_4_rdata, %moduleCSRs.io_csrsR_5_rdata, %moduleCSRs.io_csrsR_6_rdata, %moduleCSRs.io_csrsR_7_rdata, %moduleCSRs.io_csrsR_8_rdata, %moduleCSRs.io_csrsR_9_rdata, %moduleCSRs.io_mmuRead_0_rdata, %moduleCSRs.io_mmuRead_1_rdata, %moduleCSRs.io_currentPriv, %moduleCSRs.io_bareSEIP, %moduleCSRs.io_bareUEIP, %moduleCSRs.io_debug_mstatus, %moduleCSRs.io_debug_mepc, %moduleCSRs.io_debug_sepc, %moduleCSRs.io_debug_mtvec, %moduleCSRs.io_debug_stvec, %moduleCSRs.io_debug_mcause, %moduleCSRs.io_debug_scause, %moduleCSRs.io_debug_mtval, %moduleCSRs.io_debug_stval, %moduleCSRs.io_debug_mie, %moduleCSRs.io_debug_mscratch = hw.instance "moduleCSRs" @CSRs(clock: %clock: !seq.clock, reset: %reset: i1, io_csrsW_wen_0: %moduleWB.io_csrsW_wen_0: i1, io_csrsW_wen_1: %moduleWB.io_csrsW_wen_1: i1, io_csrsW_wen_2: %moduleWB.io_csrsW_wen_2: i1, io_csrsW_wen_3: %moduleWB.io_csrsW_wen_3: i1, io_csrsW_wcsr_0: %moduleWB.io_csrsW_wcsr_0: i12, io_csrsW_wcsr_1: %moduleWB.io_csrsW_wcsr_1: i12, io_csrsW_wcsr_2: %moduleWB.io_csrsW_wcsr_2: i12, io_csrsW_wcsr_3: %moduleWB.io_csrsW_wcsr_3: i12, io_csrsW_wdata_0: %moduleWB.io_csrsW_wdata_0: i64, io_csrsW_wdata_1: %moduleWB.io_csrsW_wdata_1: i64, io_csrsW_wdata_2: %moduleWB.io_csrsW_wdata_2: i64, io_csrsW_wdata_3: %moduleWB.io_csrsW_wdata_3: i64, io_csrsR_0_rcsr: %moduleID.io_csrsR_0_rcsr: i12, io_meip: %modulePlic.io_meip: i1, io_seip: %modulePlic.io_seip: i1, io_retire: %moduleWB.io_retire: i1, io_changePriv: %moduleWB.io_isPriv: i1, io_newPriv: %moduleWB.io_priv: i2, io_mtime: %moduleClint.io_mtime: i64, io_mtip: %moduleClint.io_mtip: i1, io_msip: %moduleClint.io_msip: i1) -> (io_csrsR_0_rdata: i64, io_csrsR_1_rdata: i64, io_csrsR_2_rdata: i64, io_csrsR_3_rdata: i64, io_csrsR_4_rdata: i64, io_csrsR_5_rdata: i64, io_csrsR_6_rdata: i64, io_csrsR_7_rdata: i64, io_csrsR_8_rdata: i64, io_csrsR_9_rdata: i64, io_mmuRead_0_rdata: i64, io_mmuRead_1_rdata: i64, io_currentPriv: i2, io_bareSEIP: i1, io_bareUEIP: i1, io_debug_mstatus: i64, io_debug_mepc: i64, io_debug_sepc: i64, io_debug_mtvec: i64, io_debug_stvec: i64, io_debug_mcause: i64, io_debug_scause: i64, io_debug_mtval: i64, io_debug_stval: i64, io_debug_mie: i64, io_debug_mscratch: i64) {sv.namehint = "moduleEX.io_ueip"}
    %moduleBypass.io_receive_rdata_0, %moduleBypass.io_receive_rdata_1, %moduleBypass.io_receive_rdata_2, %moduleBypass.io_isWait = hw.instance "moduleBypass" @Bypass(io_receive_raddr_0: %moduleID.io_gprsR_raddr_0: i5, io_receive_raddr_1: %moduleID.io_gprsR_raddr_1: i5, io_receive_raddr_2: %moduleID.io_gprsR_raddr_2: i5, io_rregs_1: %moduleGPRs.io_rregs_1: i64, io_rregs_2: %moduleGPRs.io_rregs_2: i64, io_rregs_3: %moduleGPRs.io_rregs_3: i64, io_rregs_4: %moduleGPRs.io_rregs_4: i64, io_rregs_5: %moduleGPRs.io_rregs_5: i64, io_rregs_6: %moduleGPRs.io_rregs_6: i64, io_rregs_7: %moduleGPRs.io_rregs_7: i64, io_rregs_8: %moduleGPRs.io_rregs_8: i64, io_rregs_9: %moduleGPRs.io_rregs_9: i64, io_rregs_10: %moduleGPRs.io_rregs_10: i64, io_rregs_11: %moduleGPRs.io_rregs_11: i64, io_rregs_12: %moduleGPRs.io_rregs_12: i64, io_rregs_13: %moduleGPRs.io_rregs_13: i64, io_rregs_14: %moduleGPRs.io_rregs_14: i64, io_rregs_15: %moduleGPRs.io_rregs_15: i64, io_rregs_16: %moduleGPRs.io_rregs_16: i64, io_rregs_17: %moduleGPRs.io_rregs_17: i64, io_rregs_18: %moduleGPRs.io_rregs_18: i64, io_rregs_19: %moduleGPRs.io_rregs_19: i64, io_rregs_20: %moduleGPRs.io_rregs_20: i64, io_rregs_21: %moduleGPRs.io_rregs_21: i64, io_rregs_22: %moduleGPRs.io_rregs_22: i64, io_rregs_23: %moduleGPRs.io_rregs_23: i64, io_rregs_24: %moduleGPRs.io_rregs_24: i64, io_rregs_25: %moduleGPRs.io_rregs_25: i64, io_rregs_26: %moduleGPRs.io_rregs_26: i64, io_rregs_27: %moduleGPRs.io_rregs_27: i64, io_rregs_28: %moduleGPRs.io_rregs_28: i64, io_rregs_29: %moduleGPRs.io_rregs_29: i64, io_rregs_30: %moduleGPRs.io_rregs_30: i64, io_rregs_31: %moduleGPRs.io_rregs_31: i64, io_instr: %moduleIF.io_output_instr: i32, io_idOut_valid: %moduleID.io_nextVR_VALID: i1, io_idOut_index: %moduleID.io_output_rd: i5, io_exOut_valid: %moduleEX.io_nextVR_VALID: i1, io_exOut_index: %moduleEX.io_output_rd: i5, io_exOut_value: %moduleEX.io_output_data: i64, io_memOut_valid: %moduleMEM.io_nextVR_VALID: i1, io_memOut_index: %moduleMEM.io_output_rd: i5, io_memOut_value: %moduleMEM.io_output_data: i64, io_isLd: %moduleEX.io_output_isLd: i1, io_isAmo: %moduleID.io_isAmo: i1) -> (io_receive_rdata_0: i64, io_receive_rdata_1: i64, io_receive_rdata_2: i64, io_isWait: i1) {sv.namehint = "moduleID.io_gprsR_rdata_2"}
    %moduleBypassCsr.io_isWait, %moduleBypassCsr.io_isPriv, %moduleBypassCsr.io_isSatp = hw.instance "moduleBypassCsr" @BypassCsr(io_idIO_bits_isWcsr: %moduleID.io_output_isWcsr: i1, io_idIO_bits_special: %moduleID.io_output_special: i5, io_idIO_bits_isPriv: %moduleID.io_output_isPriv: i1, io_idIO_bits_isSatp: %moduleID.io_output_isSatp: i1, io_idIO_valid: %moduleID.io_nextVR_VALID: i1, io_exIO_bits_isWcsr: %moduleEX.io_output_isWcsr: i1, io_exIO_bits_isPriv: %moduleEX.io_output_isPriv: i1, io_exIO_bits_isSatp: %moduleEX.io_output_isSatp: i1, io_exIO_valid: %moduleEX.io_nextVR_VALID: i1, io_memIO_bits_isWcsr: %moduleMEM.io_output_isWcsr: i1, io_memIO_bits_isPriv: %moduleMEM.io_output_isPriv: i1, io_memIO_bits_isSatp: %moduleMEM.io_output_isSatp: i1, io_memIO_valid: %moduleMEM.io_nextVR_VALID: i1) -> (io_isWait: i1, io_isPriv: i1, io_isSatp: i1) {sv.namehint = "moduleIF.io_isSatp"}
    %moduleAXIRMux.io_axiRaIn0_ready, %moduleAXIRMux.io_axiRaIn1_ready, %moduleAXIRMux.io_axiRaOut_valid, %moduleAXIRMux.io_axiRaOut_bits_addr, %moduleAXIRMux.io_axiRaOut_bits_len, %moduleAXIRMux.io_axiRaOut_bits_size, %moduleAXIRMux.io_axiRdIn0_valid, %moduleAXIRMux.io_axiRdIn0_bits_data, %moduleAXIRMux.io_axiRdIn1_valid, %moduleAXIRMux.io_axiRdIn1_bits_data = hw.instance "moduleAXIRMux" @AXIRMux(clock: %clock: !seq.clock, reset: %reset: i1, io_axiRaIn0_valid: %moduleICache.io_memIO_ar_valid: i1, io_axiRaIn0_bits_addr: %moduleICache.io_memIO_ar_bits_addr: i32, io_axiRaIn0_bits_len: %moduleICache.io_memIO_ar_bits_len: i8, io_axiRaIn0_bits_size: %moduleICache.io_memIO_ar_bits_size: i3, io_axiRaIn1_valid: %moduleDCache.io_memIO_ar_valid: i1, io_axiRaIn1_bits_addr: %moduleDCache.io_memIO_ar_bits_addr: i32, io_axiRaIn1_bits_len: %moduleDCache.io_memIO_ar_bits_len: i8, io_axiRaIn1_bits_size: %moduleDCache.io_memIO_ar_bits_size: i3, io_axiRaOut_ready: %io_master_ar_ready: i1, io_axiRdOut_valid: %io_master_r_valid: i1, io_axiRdOut_bits_data: %io_master_r_bits_data: i64, io_axiRdOut_bits_last: %io_master_r_bits_last: i1) -> (io_axiRaIn0_ready: i1, io_axiRaIn1_ready: i1, io_axiRaOut_valid: i1, io_axiRaOut_bits_addr: i32, io_axiRaOut_bits_len: i8, io_axiRaOut_bits_size: i3, io_axiRdIn0_valid: i1, io_axiRdIn0_bits_data: i64, io_axiRdIn1_valid: i1, io_axiRdIn1_bits_data: i64) {sv.namehint = "io_master_ar_valid"}
    %moduleDCacheMux.io_cpuIO_cpuResult_data, %moduleDCacheMux.io_cpuIO_cpuResult_ready, %moduleDCacheMux.io_dmaIO_cpuResult_data, %moduleDCacheMux.io_dmaIO_cpuResult_ready, %moduleDCacheMux.io_dcacheIO_cpuReq_addr, %moduleDCacheMux.io_dcacheIO_cpuReq_data, %moduleDCacheMux.io_dcacheIO_cpuReq_size, %moduleDCacheMux.io_dcacheIO_cpuReq_rw, %moduleDCacheMux.io_dcacheIO_cpuReq_wmask, %moduleDCacheMux.io_dcacheIO_cpuReq_valid, %moduleDCacheMux.io_dcacheIO_cpuReq_revoke = hw.instance "moduleDCacheMux" @DCacheMux(clock: %clock: !seq.clock, reset: %reset: i1, io_cpuIO_cpuReq_addr: %moduleMMU.io_dcacheIO_cpuReq_addr: i32, io_cpuIO_cpuReq_data: %moduleMMU.io_dcacheIO_cpuReq_data: i64, io_cpuIO_cpuReq_size: %moduleMMU.io_dcacheIO_cpuReq_size: i3, io_cpuIO_cpuReq_rw: %moduleMMU.io_dcacheIO_cpuReq_rw: i1, io_cpuIO_cpuReq_wmask: %moduleMMU.io_dcacheIO_cpuReq_wmask: i8, io_cpuIO_cpuReq_valid: %moduleMMU.io_dcacheIO_cpuReq_valid: i1, io_cpuIO_cpuReq_revoke: %moduleMMU.io_dcacheIO_cpuReq_revoke: i1, io_dmaIO_cpuReq_addr: %moduleDMA.io_cpuIO_cpuReq_addr: i32, io_dmaIO_cpuReq_data: %moduleDMA.io_cpuIO_cpuReq_data: i64, io_dmaIO_cpuReq_size: %moduleDMA.io_cpuIO_cpuReq_size: i3, io_dmaIO_cpuReq_rw: %moduleDMA.io_cpuIO_cpuReq_rw: i1, io_dmaIO_cpuReq_wmask: %moduleDMA.io_cpuIO_cpuReq_wmask: i8, io_dmaIO_cpuReq_valid: %moduleDMA.io_cpuIO_cpuReq_valid: i1, io_dcacheIO_cpuResult_data: %moduleDCache.io_cpuIO_cpuResult_data: i64, io_dcacheIO_cpuResult_ready: %moduleDCache.io_cpuIO_cpuResult_ready: i1) -> (io_cpuIO_cpuResult_data: i64, io_cpuIO_cpuResult_ready: i1, io_dmaIO_cpuResult_data: i64, io_dmaIO_cpuResult_ready: i1, io_dcacheIO_cpuReq_addr: i32, io_dcacheIO_cpuReq_data: i64, io_dcacheIO_cpuReq_size: i3, io_dcacheIO_cpuReq_rw: i1, io_dcacheIO_cpuReq_wmask: i8, io_dcacheIO_cpuReq_valid: i1, io_dcacheIO_cpuReq_revoke: i1) {sv.namehint = "moduleDCache.io_cpuIO_cpuReq_rw"}
    %moduleDMA.io_cpuIO_cpuReq_addr, %moduleDMA.io_cpuIO_cpuReq_data, %moduleDMA.io_cpuIO_cpuReq_size, %moduleDMA.io_cpuIO_cpuReq_rw, %moduleDMA.io_cpuIO_cpuReq_wmask, %moduleDMA.io_cpuIO_cpuReq_valid, %moduleDMA.io_memIO_aw_ready, %moduleDMA.io_memIO_ar_ready, %moduleDMA.io_memIO_w_ready, %moduleDMA.io_memIO_b_valid, %moduleDMA.io_memIO_b_bits_id, %moduleDMA.io_memIO_r_valid, %moduleDMA.io_memIO_r_bits_id, %moduleDMA.io_memIO_r_bits_data, %moduleDMA.io_memIO_r_bits_last = hw.instance "moduleDMA" @DMA(clock: %clock: !seq.clock, reset: %reset: i1, io_cpuIO_cpuResult_data: %moduleDCacheMux.io_dmaIO_cpuResult_data: i64, io_cpuIO_cpuResult_ready: %moduleDCacheMux.io_dmaIO_cpuResult_ready: i1, io_memIO_aw_valid: %io_slave_aw_valid: i1, io_memIO_aw_bits_id: %io_slave_aw_bits_id: i4, io_memIO_aw_bits_addr: %io_slave_aw_bits_addr: i32, io_memIO_aw_bits_len: %io_slave_aw_bits_len: i8, io_memIO_aw_bits_size: %io_slave_aw_bits_size: i3, io_memIO_ar_valid: %io_slave_ar_valid: i1, io_memIO_ar_bits_id: %io_slave_ar_bits_id: i4, io_memIO_ar_bits_addr: %io_slave_ar_bits_addr: i32, io_memIO_ar_bits_len: %io_slave_ar_bits_len: i8, io_memIO_ar_bits_size: %io_slave_ar_bits_size: i3, io_memIO_w_valid: %io_slave_w_valid: i1, io_memIO_w_bits_data: %io_slave_w_bits_data: i64, io_memIO_w_bits_strb: %io_slave_w_bits_strb: i8, io_memIO_b_ready: %io_slave_b_ready: i1, io_memIO_r_ready: %io_slave_r_ready: i1) -> (io_cpuIO_cpuReq_addr: i32, io_cpuIO_cpuReq_data: i64, io_cpuIO_cpuReq_size: i3, io_cpuIO_cpuReq_rw: i1, io_cpuIO_cpuReq_wmask: i8, io_cpuIO_cpuReq_valid: i1, io_memIO_aw_ready: i1, io_memIO_ar_ready: i1, io_memIO_w_ready: i1, io_memIO_b_valid: i1, io_memIO_b_bits_id: i4, io_memIO_r_valid: i1, io_memIO_r_bits_id: i4, io_memIO_r_bits_data: i64, io_memIO_r_bits_last: i1) {sv.namehint = "io_slave_r_valid"}
    %moduleICache.io_cpuIO_cpuResult_data, %moduleICache.io_cpuIO_cpuResult_ready, %moduleICache.io_memIO_ar_valid, %moduleICache.io_memIO_ar_bits_addr, %moduleICache.io_memIO_ar_bits_len, %moduleICache.io_memIO_ar_bits_size, %moduleICache.io_inv_ready = hw.instance "moduleICache" @ICache(clock: %clock: !seq.clock, reset: %reset: i1, io_cpuIO_cpuReq_addr: %moduleMMU.io_icacheIO_cpuReq_addr: i32, io_cpuIO_cpuReq_valid: %moduleMMU.io_icacheIO_cpuReq_valid: i1, io_cpuIO_cpuReq_revoke: %moduleMMU.io_icacheIO_cpuReq_revoke: i1, io_memIO_ar_ready: %moduleAXIRMux.io_axiRaIn0_ready: i1, io_memIO_r_valid: %moduleAXIRMux.io_axiRdIn0_valid: i1, io_memIO_r_bits_data: %moduleAXIRMux.io_axiRdIn0_bits_data: i64, io_inv_valid: %moduleEX.io_invIch_valid: i1, io_jmpBch: %moduleID.io_jmpBch: i1) -> (io_cpuIO_cpuResult_data: i32, io_cpuIO_cpuResult_ready: i1, io_memIO_ar_valid: i1, io_memIO_ar_bits_addr: i32, io_memIO_ar_bits_len: i8, io_memIO_ar_bits_size: i3, io_inv_ready: i1) {sv.namehint = "moduleEX.io_invIch_ready"}
    %moduleDCache.io_cpuIO_cpuResult_data, %moduleDCache.io_cpuIO_cpuResult_ready, %moduleDCache.io_memIO_aw_valid, %moduleDCache.io_memIO_aw_bits_addr, %moduleDCache.io_memIO_aw_bits_len, %moduleDCache.io_memIO_aw_bits_size, %moduleDCache.io_memIO_ar_valid, %moduleDCache.io_memIO_ar_bits_addr, %moduleDCache.io_memIO_ar_bits_len, %moduleDCache.io_memIO_ar_bits_size, %moduleDCache.io_memIO_w_valid, %moduleDCache.io_memIO_w_bits_data, %moduleDCache.io_memIO_w_bits_strb, %moduleDCache.io_memIO_w_bits_last, %moduleDCache.io_clintIO_wen, %moduleDCache.io_clintIO_addr, %moduleDCache.io_clintIO_wdata, %moduleDCache.io_plicIO_wen, %moduleDCache.io_plicIO_addr, %moduleDCache.io_plicIO_wdata, %moduleDCache.io_wb_ready = hw.instance "moduleDCache" @DCache(clock: %clock: !seq.clock, reset: %reset: i1, io_cpuIO_cpuReq_addr: %moduleDCacheMux.io_dcacheIO_cpuReq_addr: i32, io_cpuIO_cpuReq_data: %moduleDCacheMux.io_dcacheIO_cpuReq_data: i64, io_cpuIO_cpuReq_size: %moduleDCacheMux.io_dcacheIO_cpuReq_size: i3, io_cpuIO_cpuReq_rw: %moduleDCacheMux.io_dcacheIO_cpuReq_rw: i1, io_cpuIO_cpuReq_wmask: %moduleDCacheMux.io_dcacheIO_cpuReq_wmask: i8, io_cpuIO_cpuReq_valid: %moduleDCacheMux.io_dcacheIO_cpuReq_valid: i1, io_cpuIO_cpuReq_revoke: %moduleDCacheMux.io_dcacheIO_cpuReq_revoke: i1, io_memIO_aw_ready: %io_master_aw_ready: i1, io_memIO_ar_ready: %moduleAXIRMux.io_axiRaIn1_ready: i1, io_memIO_w_ready: %io_master_w_ready: i1, io_memIO_b_valid: %io_master_b_valid: i1, io_memIO_r_valid: %moduleAXIRMux.io_axiRdIn1_valid: i1, io_memIO_r_bits_data: %moduleAXIRMux.io_axiRdIn1_bits_data: i64, io_clintIO_rdata: %moduleClint.io_clintIO_rdata: i64, io_plicIO_rdata: %modulePlic.io_plicIO_rdata: i32, io_wb_valid: %moduleEX.io_wbDch_valid: i1) -> (io_cpuIO_cpuResult_data: i64, io_cpuIO_cpuResult_ready: i1, io_memIO_aw_valid: i1, io_memIO_aw_bits_addr: i32, io_memIO_aw_bits_len: i8, io_memIO_aw_bits_size: i3, io_memIO_ar_valid: i1, io_memIO_ar_bits_addr: i32, io_memIO_ar_bits_len: i8, io_memIO_ar_bits_size: i3, io_memIO_w_valid: i1, io_memIO_w_bits_data: i64, io_memIO_w_bits_strb: i8, io_memIO_w_bits_last: i1, io_clintIO_wen: i1, io_clintIO_addr: i2, io_clintIO_wdata: i64, io_plicIO_wen: i1, io_plicIO_addr: i26, io_plicIO_wdata: i32, io_wb_ready: i1) {sv.namehint = "moduleEX.io_wbDch_ready"}
    %moduleMMU.io_ifIO_pipelineResult_exception, %moduleMMU.io_ifIO_pipelineResult_cause, %moduleMMU.io_ifIO_pipelineResult_cpuResult_data, %moduleMMU.io_ifIO_pipelineResult_cpuResult_ready, %moduleMMU.io_ifIO_pipelineResult_fromMem, %moduleMMU.io_ifIO_pipelineResult_crossCache, %moduleMMU.io_memIO_pipelineResult_exception, %moduleMMU.io_memIO_pipelineResult_cause, %moduleMMU.io_memIO_pipelineResult_cpuResult_data, %moduleMMU.io_memIO_pipelineResult_cpuResult_ready, %moduleMMU.io_memIO_pipelineResult_isMMIO, %moduleMMU.io_icacheIO_cpuReq_addr, %moduleMMU.io_icacheIO_cpuReq_valid, %moduleMMU.io_icacheIO_cpuReq_revoke, %moduleMMU.io_dcacheIO_cpuReq_addr, %moduleMMU.io_dcacheIO_cpuReq_data, %moduleMMU.io_dcacheIO_cpuReq_size, %moduleMMU.io_dcacheIO_cpuReq_rw, %moduleMMU.io_dcacheIO_cpuReq_wmask, %moduleMMU.io_dcacheIO_cpuReq_valid, %moduleMMU.io_dcacheIO_cpuReq_revoke, %moduleMMU.io_revAmo = hw.instance "moduleMMU" @RVMMU(clock: %clock: !seq.clock, reset: %reset: i1, io_ifIO_pipelineReq_cpuReq_addr: %moduleIF.io_immu_pipelineReq_cpuReq_addr: i64, io_ifIO_pipelineReq_cpuReq_valid: %moduleIF.io_immu_pipelineReq_cpuReq_valid: i1, io_ifIO_pipelineReq_cpuReq_revoke: %moduleIF.io_immu_pipelineReq_cpuReq_revoke: i1, io_ifIO_pipelineReq_offset: %moduleIF.io_immu_pipelineReq_offset: i4, io_memIO_pipelineReq_cpuReq_addr: %moduleMEM.io_dmmu_pipelineReq_cpuReq_addr: i64, io_memIO_pipelineReq_cpuReq_data: %moduleMEM.io_dmmu_pipelineReq_cpuReq_data: i64, io_memIO_pipelineReq_cpuReq_size: %moduleMEM.io_dmmu_pipelineReq_cpuReq_size: i3, io_memIO_pipelineReq_cpuReq_rw: %moduleMEM.io_dmmu_pipelineReq_cpuReq_rw: i1, io_memIO_pipelineReq_cpuReq_wmask: %moduleMEM.io_dmmu_pipelineReq_cpuReq_wmask: i8, io_memIO_pipelineReq_cpuReq_valid: %moduleMEM.io_dmmu_pipelineReq_cpuReq_valid: i1, io_memIO_pipelineReq_flush: %moduleMEM.io_dmmu_pipelineReq_flush: i1, io_icacheIO_cpuResult_data: %moduleICache.io_cpuIO_cpuResult_data: i32, io_icacheIO_cpuResult_ready: %moduleICache.io_cpuIO_cpuResult_ready: i1, io_dcacheIO_cpuResult_data: %moduleDCacheMux.io_cpuIO_cpuResult_data: i64, io_dcacheIO_cpuResult_ready: %moduleDCacheMux.io_cpuIO_cpuResult_ready: i1, io_csrIO_0_rdata: %moduleCSRs.io_mmuRead_0_rdata: i64, io_csrIO_1_rdata: %moduleCSRs.io_mmuRead_1_rdata: i64, io_priv: %moduleCSRs.io_currentPriv: i2, io_jmpBch: %moduleID.io_jmpBch: i1) -> (io_ifIO_pipelineResult_exception: i1, io_ifIO_pipelineResult_cause: i4, io_ifIO_pipelineResult_cpuResult_data: i32, io_ifIO_pipelineResult_cpuResult_ready: i1, io_ifIO_pipelineResult_fromMem: i1, io_ifIO_pipelineResult_crossCache: i1, io_memIO_pipelineResult_exception: i1, io_memIO_pipelineResult_cause: i4, io_memIO_pipelineResult_cpuResult_data: i64, io_memIO_pipelineResult_cpuResult_ready: i1, io_memIO_pipelineResult_isMMIO: i1, io_icacheIO_cpuReq_addr: i32, io_icacheIO_cpuReq_valid: i1, io_icacheIO_cpuReq_revoke: i1, io_dcacheIO_cpuReq_addr: i32, io_dcacheIO_cpuReq_data: i64, io_dcacheIO_cpuReq_size: i3, io_dcacheIO_cpuReq_rw: i1, io_dcacheIO_cpuReq_wmask: i8, io_dcacheIO_cpuReq_valid: i1, io_dcacheIO_cpuReq_revoke: i1, io_revAmo: i1) {sv.namehint = "moduleID.io_revAmo"}
    %moduleClint.io_clintIO_rdata, %moduleClint.io_mtime, %moduleClint.io_mtip, %moduleClint.io_msip = hw.instance "moduleClint" @Clint(clock: %clock: !seq.clock, reset: %reset: i1, io_clintIO_wen: %moduleDCache.io_clintIO_wen: i1, io_clintIO_addr: %moduleDCache.io_clintIO_addr: i2, io_clintIO_wdata: %moduleDCache.io_clintIO_wdata: i64) -> (io_clintIO_rdata: i64, io_mtime: i64, io_mtip: i1, io_msip: i1) {sv.namehint = "moduleID.io_msip"}
    %modulePlic.io_plicIO_rdata, %modulePlic.io_meip, %modulePlic.io_seip = hw.instance "modulePlic" @SimplePlic(clock: %clock: !seq.clock, reset: %reset: i1, io_plicIO_wen: %moduleDCache.io_plicIO_wen: i1, io_plicIO_addr: %moduleDCache.io_plicIO_addr: i26, io_plicIO_wdata: %moduleDCache.io_plicIO_wdata: i32, io_int: %io_interrupt: i1) -> (io_plicIO_rdata: i32, io_meip: i1, io_seip: i1) {sv.namehint = "moduleCSRs.io_seip"}
    %moduleIF.io_immu_pipelineReq_cpuReq_addr, %moduleIF.io_immu_pipelineReq_cpuReq_valid, %moduleIF.io_immu_pipelineReq_cpuReq_revoke, %moduleIF.io_immu_pipelineReq_offset, %moduleIF.io_nextVR_VALID, %moduleIF.io_output_instr, %moduleIF.io_output_instrCode, %moduleIF.io_output_rs_0, %moduleIF.io_output_rs_1, %moduleIF.io_output_rd, %moduleIF.io_output_pc, %moduleIF.io_output_except, %moduleIF.io_output_cause, %moduleIF.io_output_crossCache = hw.instance "moduleIF" @IF(clock: %clock: !seq.clock, reset: %reset: i1, io_immu_pipelineResult_exception: %moduleMMU.io_ifIO_pipelineResult_exception: i1, io_immu_pipelineResult_cause: %moduleMMU.io_ifIO_pipelineResult_cause: i4, io_immu_pipelineResult_cpuResult_data: %moduleMMU.io_ifIO_pipelineResult_cpuResult_data: i32, io_immu_pipelineResult_cpuResult_ready: %moduleMMU.io_ifIO_pipelineResult_cpuResult_ready: i1, io_immu_pipelineResult_fromMem: %moduleMMU.io_ifIO_pipelineResult_fromMem: i1, io_immu_pipelineResult_crossCache: %moduleMMU.io_ifIO_pipelineResult_crossCache: i1, io_nextVR_READY: %moduleID.io_lastVR_READY: i1, io_jmpBch: %moduleID.io_jmpBch: i1, io_jbAddr: %moduleID.io_jbAddr: i64, io_isPriv: %moduleBypassCsr.io_isPriv: i1, io_isSatp: %moduleBypassCsr.io_isSatp: i1) -> (io_immu_pipelineReq_cpuReq_addr: i64, io_immu_pipelineReq_cpuReq_valid: i1, io_immu_pipelineReq_cpuReq_revoke: i1, io_immu_pipelineReq_offset: i4, io_nextVR_VALID: i1, io_output_instr: i32, io_output_instrCode: i7, io_output_rs_0: i5, io_output_rs_1: i5, io_output_rd: i5, io_output_pc: i64, io_output_except: i1, io_output_cause: i4, io_output_crossCache: i1) {sv.namehint = "moduleBypass.io_instr"}
    %moduleID.io_output_rd, %moduleID.io_output_isWcsr, %moduleID.io_output_wcsr_0, %moduleID.io_output_wcsr_1, %moduleID.io_output_wcsr_2, %moduleID.io_output_wcsr_3, %moduleID.io_output_num_0, %moduleID.io_output_num_1, %moduleID.io_output_num_2, %moduleID.io_output_num_3, %moduleID.io_output_op1_2, %moduleID.io_output_op1_3, %moduleID.io_output_special, %moduleID.io_output_retire, %moduleID.io_output_priv, %moduleID.io_output_isPriv, %moduleID.io_output_isSatp, %moduleID.io_output_memExpt, %moduleID.io_output_cause, %moduleID.io_output_pc, %moduleID.io_output_debug_rcsr, %moduleID.io_output_debug_intr, %moduleID.io_output_debug_rvc, %moduleID.io_gprsR_raddr_0, %moduleID.io_gprsR_raddr_1, %moduleID.io_gprsR_raddr_2, %moduleID.io_csrsR_0_rcsr, %moduleID.io_lastVR_READY, %moduleID.io_nextVR_VALID, %moduleID.io_jmpBch, %moduleID.io_jbAddr, %moduleID.io_isAmo = hw.instance "moduleID" @RVID(clock: %clock: !seq.clock, reset: %reset: i1, io_gprsR_rdata_0: %moduleBypass.io_receive_rdata_0: i64, io_gprsR_rdata_1: %moduleBypass.io_receive_rdata_1: i64, io_gprsR_rdata_2: %moduleBypass.io_receive_rdata_2: i64, io_csrsR_0_rdata: %moduleCSRs.io_csrsR_0_rdata: i64, io_csrsR_1_rdata: %moduleCSRs.io_csrsR_1_rdata: i64, io_csrsR_2_rdata: %moduleCSRs.io_csrsR_2_rdata: i64, io_csrsR_3_rdata: %moduleCSRs.io_csrsR_3_rdata: i64, io_csrsR_4_rdata: %moduleCSRs.io_csrsR_4_rdata: i64, io_csrsR_5_rdata: %moduleCSRs.io_csrsR_5_rdata: i64, io_csrsR_6_rdata: %moduleCSRs.io_csrsR_6_rdata: i64, io_csrsR_7_rdata: %moduleCSRs.io_csrsR_7_rdata: i64, io_csrsR_8_rdata: %moduleCSRs.io_csrsR_8_rdata: i64, io_csrsR_9_rdata: %moduleCSRs.io_csrsR_9_rdata: i64, io_lastVR_VALID: %moduleIF.io_nextVR_VALID: i1, io_nextVR_READY: %moduleEX.io_lastVR_READY: i1, io_input_instr: %moduleIF.io_output_instr: i32, io_input_instrCode: %moduleIF.io_output_instrCode: i7, io_input_rs_0: %moduleIF.io_output_rs_0: i5, io_input_rs_1: %moduleIF.io_output_rs_1: i5, io_input_rd: %moduleIF.io_output_rd: i5, io_input_pc: %moduleIF.io_output_pc: i64, io_input_except: %moduleIF.io_output_except: i1, io_input_cause: %moduleIF.io_output_cause: i4, io_input_crossCache: %moduleIF.io_output_crossCache: i1, io_isWait: %0: i1, io_currentPriv: %moduleCSRs.io_currentPriv: i2, io_mtip: %moduleClint.io_mtip: i1, io_msip: %moduleClint.io_msip: i1, io_revAmo: %moduleMMU.io_revAmo: i1) -> (io_output_rd: i5, io_output_isWcsr: i1, io_output_wcsr_0: i12, io_output_wcsr_1: i12, io_output_wcsr_2: i12, io_output_wcsr_3: i12, io_output_num_0: i64, io_output_num_1: i64, io_output_num_2: i64, io_output_num_3: i64, io_output_op1_2: i31, io_output_op1_3: i31, io_output_special: i5, io_output_retire: i1, io_output_priv: i2, io_output_isPriv: i1, io_output_isSatp: i1, io_output_memExpt: i1, io_output_cause: i4, io_output_pc: i64, io_output_debug_rcsr: i12, io_output_debug_intr: i1, io_output_debug_rvc: i1, io_gprsR_raddr_0: i5, io_gprsR_raddr_1: i5, io_gprsR_raddr_2: i5, io_csrsR_0_rcsr: i12, io_lastVR_READY: i1, io_nextVR_VALID: i1, io_jmpBch: i1, io_jbAddr: i64, io_isAmo: i1) {sv.namehint = "moduleIF.io_jbAddr"}
    %moduleEX.io_lastVR_READY, %moduleEX.io_nextVR_VALID, %moduleEX.io_output_rd, %moduleEX.io_output_data, %moduleEX.io_output_isWcsr, %moduleEX.io_output_wcsr_0, %moduleEX.io_output_wcsr_1, %moduleEX.io_output_wcsr_2, %moduleEX.io_output_wcsr_3, %moduleEX.io_output_csrData_0, %moduleEX.io_output_csrData_1, %moduleEX.io_output_csrData_2, %moduleEX.io_output_csrData_3, %moduleEX.io_output_isMem, %moduleEX.io_output_isLd, %moduleEX.io_output_addr, %moduleEX.io_output_mask, %moduleEX.io_output_retire, %moduleEX.io_output_priv, %moduleEX.io_output_isPriv, %moduleEX.io_output_isSatp, %moduleEX.io_output_memExpt, %moduleEX.io_output_cause, %moduleEX.io_output_fshTLB, %moduleEX.io_output_pc, %moduleEX.io_output_debug_exit, %moduleEX.io_output_debug_rcsr, %moduleEX.io_output_debug_intr, %moduleEX.io_output_debug_rvc, %moduleEX.io_invIch_valid, %moduleEX.io_wbDch_valid = hw.instance "moduleEX" @EX(clock: %clock: !seq.clock, reset: %reset: i1, io_input_rd: %moduleID.io_output_rd: i5, io_input_isWcsr: %moduleID.io_output_isWcsr: i1, io_input_wcsr_0: %moduleID.io_output_wcsr_0: i12, io_input_wcsr_1: %moduleID.io_output_wcsr_1: i12, io_input_wcsr_2: %moduleID.io_output_wcsr_2: i12, io_input_wcsr_3: %moduleID.io_output_wcsr_3: i12, io_input_num_0: %moduleID.io_output_num_0: i64, io_input_num_1: %moduleID.io_output_num_1: i64, io_input_num_2: %moduleID.io_output_num_2: i64, io_input_num_3: %moduleID.io_output_num_3: i64, io_input_op1_2: %moduleID.io_output_op1_2: i31, io_input_op1_3: %moduleID.io_output_op1_3: i31, io_input_special: %moduleID.io_output_special: i5, io_input_retire: %moduleID.io_output_retire: i1, io_input_priv: %moduleID.io_output_priv: i2, io_input_isPriv: %moduleID.io_output_isPriv: i1, io_input_isSatp: %moduleID.io_output_isSatp: i1, io_input_memExpt: %moduleID.io_output_memExpt: i1, io_input_cause: %moduleID.io_output_cause: i4, io_input_pc: %moduleID.io_output_pc: i64, io_input_debug_rcsr: %moduleID.io_output_debug_rcsr: i12, io_input_debug_intr: %moduleID.io_output_debug_intr: i1, io_input_debug_rvc: %moduleID.io_output_debug_rvc: i1, io_lastVR_VALID: %moduleID.io_nextVR_VALID: i1, io_nextVR_READY: %moduleMEM.io_lastVR_READY: i1, io_invIch_ready: %moduleICache.io_inv_ready: i1, io_wbDch_ready: %moduleDCache.io_wb_ready: i1, io_seip: %moduleCSRs.io_bareSEIP: i1, io_ueip: %moduleCSRs.io_bareUEIP: i1) -> (io_lastVR_READY: i1, io_nextVR_VALID: i1, io_output_rd: i5, io_output_data: i64, io_output_isWcsr: i1, io_output_wcsr_0: i12, io_output_wcsr_1: i12, io_output_wcsr_2: i12, io_output_wcsr_3: i12, io_output_csrData_0: i64, io_output_csrData_1: i64, io_output_csrData_2: i64, io_output_csrData_3: i64, io_output_isMem: i1, io_output_isLd: i1, io_output_addr: i64, io_output_mask: i3, io_output_retire: i1, io_output_priv: i2, io_output_isPriv: i1, io_output_isSatp: i1, io_output_memExpt: i1, io_output_cause: i4, io_output_fshTLB: i1, io_output_pc: i64, io_output_debug_exit: i3, io_output_debug_rcsr: i12, io_output_debug_intr: i1, io_output_debug_rvc: i1, io_invIch_valid: i1, io_wbDch_valid: i1) {sv.namehint = "moduleBypass.io_isLd"}
    %moduleMEM.io_dmmu_pipelineReq_cpuReq_addr, %moduleMEM.io_dmmu_pipelineReq_cpuReq_data, %moduleMEM.io_dmmu_pipelineReq_cpuReq_size, %moduleMEM.io_dmmu_pipelineReq_cpuReq_rw, %moduleMEM.io_dmmu_pipelineReq_cpuReq_wmask, %moduleMEM.io_dmmu_pipelineReq_cpuReq_valid, %moduleMEM.io_dmmu_pipelineReq_flush, %moduleMEM.io_lastVR_READY, %moduleMEM.io_nextVR_VALID, %moduleMEM.io_output_rd, %moduleMEM.io_output_data, %moduleMEM.io_output_isWcsr, %moduleMEM.io_output_wcsr_0, %moduleMEM.io_output_wcsr_1, %moduleMEM.io_output_wcsr_2, %moduleMEM.io_output_wcsr_3, %moduleMEM.io_output_csrData_0, %moduleMEM.io_output_csrData_1, %moduleMEM.io_output_csrData_2, %moduleMEM.io_output_csrData_3, %moduleMEM.io_output_retire, %moduleMEM.io_output_priv, %moduleMEM.io_output_isPriv, %moduleMEM.io_output_isSatp, %moduleMEM.io_output_except, %moduleMEM.io_output_debug_exit, %moduleMEM.io_output_debug_pc, %moduleMEM.io_output_debug_rcsr, %moduleMEM.io_output_debug_mmio, %moduleMEM.io_output_debug_intr, %moduleMEM.io_output_debug_rvc = hw.instance "moduleMEM" @MEM(clock: %clock: !seq.clock, reset: %reset: i1, io_dmmu_pipelineResult_exception: %moduleMMU.io_memIO_pipelineResult_exception: i1, io_dmmu_pipelineResult_cause: %moduleMMU.io_memIO_pipelineResult_cause: i4, io_dmmu_pipelineResult_cpuResult_data: %moduleMMU.io_memIO_pipelineResult_cpuResult_data: i64, io_dmmu_pipelineResult_cpuResult_ready: %moduleMMU.io_memIO_pipelineResult_cpuResult_ready: i1, io_dmmu_pipelineResult_isMMIO: %moduleMMU.io_memIO_pipelineResult_isMMIO: i1, io_lastVR_VALID: %moduleEX.io_nextVR_VALID: i1, io_input_rd: %moduleEX.io_output_rd: i5, io_input_data: %moduleEX.io_output_data: i64, io_input_isWcsr: %moduleEX.io_output_isWcsr: i1, io_input_wcsr_0: %moduleEX.io_output_wcsr_0: i12, io_input_wcsr_1: %moduleEX.io_output_wcsr_1: i12, io_input_wcsr_2: %moduleEX.io_output_wcsr_2: i12, io_input_wcsr_3: %moduleEX.io_output_wcsr_3: i12, io_input_csrData_0: %moduleEX.io_output_csrData_0: i64, io_input_csrData_1: %moduleEX.io_output_csrData_1: i64, io_input_csrData_2: %moduleEX.io_output_csrData_2: i64, io_input_csrData_3: %moduleEX.io_output_csrData_3: i64, io_input_isMem: %moduleEX.io_output_isMem: i1, io_input_isLd: %moduleEX.io_output_isLd: i1, io_input_addr: %moduleEX.io_output_addr: i64, io_input_mask: %moduleEX.io_output_mask: i3, io_input_retire: %moduleEX.io_output_retire: i1, io_input_priv: %moduleEX.io_output_priv: i2, io_input_isPriv: %moduleEX.io_output_isPriv: i1, io_input_isSatp: %moduleEX.io_output_isSatp: i1, io_input_memExpt: %moduleEX.io_output_memExpt: i1, io_input_cause: %moduleEX.io_output_cause: i4, io_input_fshTLB: %moduleEX.io_output_fshTLB: i1, io_input_pc: %moduleEX.io_output_pc: i64, io_input_debug_exit: %moduleEX.io_output_debug_exit: i3, io_input_debug_rcsr: %moduleEX.io_output_debug_rcsr: i12, io_input_debug_intr: %moduleEX.io_output_debug_intr: i1, io_input_debug_rvc: %moduleEX.io_output_debug_rvc: i1) -> (io_dmmu_pipelineReq_cpuReq_addr: i64, io_dmmu_pipelineReq_cpuReq_data: i64, io_dmmu_pipelineReq_cpuReq_size: i3, io_dmmu_pipelineReq_cpuReq_rw: i1, io_dmmu_pipelineReq_cpuReq_wmask: i8, io_dmmu_pipelineReq_cpuReq_valid: i1, io_dmmu_pipelineReq_flush: i1, io_lastVR_READY: i1, io_nextVR_VALID: i1, io_output_rd: i5, io_output_data: i64, io_output_isWcsr: i1, io_output_wcsr_0: i12, io_output_wcsr_1: i12, io_output_wcsr_2: i12, io_output_wcsr_3: i12, io_output_csrData_0: i64, io_output_csrData_1: i64, io_output_csrData_2: i64, io_output_csrData_3: i64, io_output_retire: i1, io_output_priv: i2, io_output_isPriv: i1, io_output_isSatp: i1, io_output_except: i1, io_output_debug_exit: i3, io_output_debug_pc: i64, io_output_debug_rcsr: i12, io_output_debug_mmio: i1, io_output_debug_intr: i1, io_output_debug_rvc: i1) {sv.namehint = "moduleWB.io_input_rd"}
    %moduleWB.io_gprsW_wen, %moduleWB.io_gprsW_waddr, %moduleWB.io_gprsW_wdata, %moduleWB.io_gprsW_retire, %moduleWB.io_gprsW_except, %moduleWB.io_csrsW_wen_0, %moduleWB.io_csrsW_wen_1, %moduleWB.io_csrsW_wen_2, %moduleWB.io_csrsW_wen_3, %moduleWB.io_csrsW_wcsr_0, %moduleWB.io_csrsW_wcsr_1, %moduleWB.io_csrsW_wcsr_2, %moduleWB.io_csrsW_wcsr_3, %moduleWB.io_csrsW_wdata_0, %moduleWB.io_csrsW_wdata_1, %moduleWB.io_csrsW_wdata_2, %moduleWB.io_csrsW_wdata_3, %moduleWB.io_retire, %moduleWB.io_priv, %moduleWB.io_isPriv, %moduleWB.io_debug_pc, %moduleWB.io_debug_exit, %moduleWB.io_debug_rd, %moduleWB.io_debug_rcsr, %moduleWB.io_debug_mmio, %moduleWB.io_debug_intr, %moduleWB.io_debug_rvc = hw.instance "moduleWB" @WB(clock: %clock: !seq.clock, reset: %reset: i1, io_lastVR_VALID: %moduleMEM.io_nextVR_VALID: i1, io_input_rd: %moduleMEM.io_output_rd: i5, io_input_data: %moduleMEM.io_output_data: i64, io_input_wcsr_0: %moduleMEM.io_output_wcsr_0: i12, io_input_wcsr_1: %moduleMEM.io_output_wcsr_1: i12, io_input_wcsr_2: %moduleMEM.io_output_wcsr_2: i12, io_input_wcsr_3: %moduleMEM.io_output_wcsr_3: i12, io_input_csrData_0: %moduleMEM.io_output_csrData_0: i64, io_input_csrData_1: %moduleMEM.io_output_csrData_1: i64, io_input_csrData_2: %moduleMEM.io_output_csrData_2: i64, io_input_csrData_3: %moduleMEM.io_output_csrData_3: i64, io_input_retire: %moduleMEM.io_output_retire: i1, io_input_priv: %moduleMEM.io_output_priv: i2, io_input_isPriv: %moduleMEM.io_output_isPriv: i1, io_input_except: %moduleMEM.io_output_except: i1, io_input_debug_exit: %moduleMEM.io_output_debug_exit: i3, io_input_debug_pc: %moduleMEM.io_output_debug_pc: i64, io_input_debug_rcsr: %moduleMEM.io_output_debug_rcsr: i12, io_input_debug_mmio: %moduleMEM.io_output_debug_mmio: i1, io_input_debug_intr: %moduleMEM.io_output_debug_intr: i1, io_input_debug_rvc: %moduleMEM.io_output_debug_rvc: i1) -> (io_gprsW_wen: i1, io_gprsW_waddr: i5, io_gprsW_wdata: i64, io_gprsW_retire: i1, io_gprsW_except: i1, io_csrsW_wen_0: i1, io_csrsW_wen_1: i1, io_csrsW_wen_2: i1, io_csrsW_wen_3: i1, io_csrsW_wcsr_0: i12, io_csrsW_wcsr_1: i12, io_csrsW_wcsr_2: i12, io_csrsW_wcsr_3: i12, io_csrsW_wdata_0: i64, io_csrsW_wdata_1: i64, io_csrsW_wdata_2: i64, io_csrsW_wdata_3: i64, io_retire: i1, io_priv: i2, io_isPriv: i1, io_debug_pc: i64, io_debug_exit: i3, io_debug_rd: i5, io_debug_rcsr: i12, io_debug_mmio: i1, io_debug_intr: i1, io_debug_rvc: i1) {sv.namehint = "moduleCSRs.io_retire"}
    %0 = comb.or bin %moduleBypass.io_isWait, %moduleBypassCsr.io_isWait {sv.namehint = "moduleID.io_isWait"} : i1
    hw.output %moduleDCache.io_memIO_aw_valid, %c0_i4, %moduleDCache.io_memIO_aw_bits_addr, %moduleDCache.io_memIO_aw_bits_len, %moduleDCache.io_memIO_aw_bits_size, %c1_i2, %moduleAXIRMux.io_axiRaOut_valid, %c0_i4, %moduleAXIRMux.io_axiRaOut_bits_addr, %moduleAXIRMux.io_axiRaOut_bits_len, %moduleAXIRMux.io_axiRaOut_bits_size, %c1_i2, %moduleDCache.io_memIO_w_valid, %moduleDCache.io_memIO_w_bits_data, %moduleDCache.io_memIO_w_bits_strb, %moduleDCache.io_memIO_w_bits_last, %true, %true, %moduleDMA.io_memIO_aw_ready, %moduleDMA.io_memIO_ar_ready, %moduleDMA.io_memIO_w_ready, %moduleDMA.io_memIO_b_valid, %moduleDMA.io_memIO_b_bits_id, %c0_i2, %moduleDMA.io_memIO_r_valid, %moduleDMA.io_memIO_r_bits_id, %moduleDMA.io_memIO_r_bits_data, %c0_i2, %moduleDMA.io_memIO_r_bits_last, %moduleWB.io_debug_exit, %moduleWB.io_debug_pc, %moduleWB.io_retire, %moduleWB.io_debug_rd, %moduleWB.io_debug_rcsr, %moduleWB.io_debug_mmio, %moduleWB.io_debug_intr, %moduleWB.io_debug_rvc, %c0_i64, %moduleGPRs.io_debug_gprs_1, %moduleGPRs.io_debug_gprs_2, %moduleGPRs.io_debug_gprs_3, %moduleGPRs.io_debug_gprs_4, %moduleGPRs.io_debug_gprs_5, %moduleGPRs.io_debug_gprs_6, %moduleGPRs.io_debug_gprs_7, %moduleGPRs.io_debug_gprs_8, %moduleGPRs.io_debug_gprs_9, %moduleGPRs.io_debug_gprs_10, %moduleGPRs.io_debug_gprs_11, %moduleGPRs.io_debug_gprs_12, %moduleGPRs.io_debug_gprs_13, %moduleGPRs.io_debug_gprs_14, %moduleGPRs.io_debug_gprs_15, %moduleGPRs.io_debug_gprs_16, %moduleGPRs.io_debug_gprs_17, %moduleGPRs.io_debug_gprs_18, %moduleGPRs.io_debug_gprs_19, %moduleGPRs.io_debug_gprs_20, %moduleGPRs.io_debug_gprs_21, %moduleGPRs.io_debug_gprs_22, %moduleGPRs.io_debug_gprs_23, %moduleGPRs.io_debug_gprs_24, %moduleGPRs.io_debug_gprs_25, %moduleGPRs.io_debug_gprs_26, %moduleGPRs.io_debug_gprs_27, %moduleGPRs.io_debug_gprs_28, %moduleGPRs.io_debug_gprs_29, %moduleGPRs.io_debug_gprs_30, %moduleGPRs.io_debug_gprs_31, %moduleCSRs.io_currentPriv, %moduleCSRs.io_debug_mstatus, %moduleCSRs.io_debug_mepc, %moduleCSRs.io_debug_sepc, %moduleCSRs.io_debug_mtvec, %moduleCSRs.io_debug_stvec, %moduleCSRs.io_debug_mcause, %moduleCSRs.io_debug_scause, %moduleCSRs.io_debug_mtval, %moduleCSRs.io_debug_stval, %moduleCSRs.io_debug_mie, %moduleCSRs.io_debug_mscratch : i1, i4, i32, i8, i3, i2, i1, i4, i32, i8, i3, i2, i1, i64, i8, i1, i1, i1, i1, i1, i1, i1, i4, i2, i1, i4, i64, i2, i1, i3, i64, i1, i5, i12, i1, i1, i1, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i2, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64
  }
  hw.module.extern private @RamRead(in %clock : !seq.clock, in %addr : i64, out data : i64) attributes {verilogName = "RamRead"}
  hw.module.extern private @RamWrite(in %clock : !seq.clock, in %wen : i1, in %addr : i64, in %data : i64, in %mask : i8) attributes {verilogName = "RamWrite"}
  hw.module private @RAM(in %io_basic_ACLK : !seq.clock, in %io_basic_ARESETn : i1, out io_channel_aw_ready : i1, in %io_channel_aw_valid : i1, in %io_channel_aw_bits_id : i4, in %io_channel_aw_bits_addr : i32, in %io_channel_aw_bits_len : i8, in %io_channel_aw_bits_size : i3, out io_channel_ar_ready : i1, in %io_channel_ar_valid : i1, in %io_channel_ar_bits_id : i4, in %io_channel_ar_bits_addr : i32, in %io_channel_ar_bits_len : i8, in %io_channel_ar_bits_size : i3, out io_channel_w_ready : i1, in %io_channel_w_valid : i1, in %io_channel_w_bits_data : i64, in %io_channel_w_bits_strb : i8, in %io_channel_b_ready : i1, out io_channel_b_valid : i1, out io_channel_b_bits_id : i4, in %io_channel_r_ready : i1, out io_channel_r_valid : i1, out io_channel_r_bits_id : i4, out io_channel_r_bits_data : i64, out io_channel_r_bits_last : i1) {
    %c-2147483648_i32 = hw.constant -2147483648 : i32
    %c-1_i8 = hw.constant -1 : i8
    %c0_i127 = hw.constant 0 : i127
    %false = hw.constant false
    %true = hw.constant true
    %c0_i3 = hw.constant 0 : i3
    %c0_i8 = hw.constant 0 : i8
    %c0_i4 = hw.constant 0 : i4
    %c0_i32 = hw.constant 0 : i32
    %c2_i128 = hw.constant 2 : i128
    %c4_i128 = hw.constant 4 : i128
    %c8_i128 = hw.constant 8 : i128
    %c16_i128 = hw.constant 16 : i128
    %c32_i128 = hw.constant 32 : i128
    %c64_i128 = hw.constant 64 : i128
    %c128_i128 = hw.constant 128 : i128
    %0 = comb.xor bin %io_basic_ARESETn, %true : i1
    %AWREADY = seq.firreg %71 clock %io_basic_ACLK reset sync %0, %true {firrtl.random_init_start = 0 : ui64, sv.namehint = "AWREADY"} : i1
    %WREADY = seq.firreg %59 clock %io_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 1 : ui64, sv.namehint = "WREADY"} : i1
    %BVALID = seq.firreg %73 clock %io_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 2 : ui64, sv.namehint = "BVALID"} : i1
    %ARREADY = seq.firreg %36 clock %io_basic_ACLK reset sync %0, %true {firrtl.random_init_start = 3 : ui64, sv.namehint = "ARREADY"} : i1
    %RVALID = seq.firreg %38 clock %io_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 4 : ui64, sv.namehint = "RVALID"} : i1
    %ARSIZE = seq.firreg %41 clock %io_basic_ACLK reset sync %0, %c0_i3 {firrtl.random_init_start = 5 : ui64} : i3
    %ARLEN = seq.firreg %43 clock %io_basic_ACLK reset sync %0, %c0_i8 {firrtl.random_init_start = 8 : ui64} : i8
    %AWSIZE = seq.firreg %53 clock %io_basic_ACLK reset sync %0, %c0_i3 {firrtl.random_init_start = 16 : ui64} : i3
    %AWLEN = seq.firreg %69 clock %io_basic_ACLK reset sync %0, %c0_i8 {firrtl.random_init_start = 19 : ui64} : i8
    %RID = seq.firreg %26 clock %io_basic_ACLK reset sync %0, %c0_i4 {firrtl.random_init_start = 27 : ui64, sv.namehint = "RID"} : i4
    %BID = seq.firreg %49 clock %io_basic_ACLK reset sync %0, %c0_i4 {firrtl.random_init_start = 31 : ui64, sv.namehint = "BID"} : i4
    %ARADDR = seq.firreg %33 clock %io_basic_ACLK reset sync %0, %c0_i32 {firrtl.random_init_start = 35 : ui64} : i32
    %AWADDR = seq.firreg %65 clock %io_basic_ACLK reset sync %0, %c0_i32 {firrtl.random_init_start = 67 : ui64} : i32
    %1 = comb.icmp bin eq %ARSIZE, %c0_i3 : i3
    %2 = comb.concat %c0_i127, %1 : i127, i1
    %3 = comb.icmp bin eq %AWSIZE, %c0_i3 : i3
    %4 = comb.concat %c0_i127, %3 : i127, i1
    %5 = hw.array_create %c128_i128, %c64_i128, %c32_i128, %c16_i128, %c8_i128, %c4_i128, %c2_i128, %2 : i128
    %6 = hw.array_get %5[%ARSIZE] {sv.namehint = "wireRStep"} : !hw.array<8xi128>, i3
    %7 = hw.array_create %c128_i128, %c64_i128, %c32_i128, %c16_i128, %c8_i128, %c4_i128, %c2_i128, %4 : i128
    %8 = hw.array_get %7[%AWSIZE] {sv.namehint = "wireWStep"} : !hw.array<8xi128>, i3
    %ram_read.data = hw.instance "ram_read" @RamRead(clock: %io_basic_ACLK: !seq.clock, addr: %9: i64) -> (data: i64) {sv.namehint = "io_channel_r_bits_data"}
    %9 = comb.concat %c0_i32, %31 : i32, i32
    hw.instance "ram_write" @RamWrite(clock: %io_basic_ACLK: !seq.clock, wen: %55: i1, addr: %10: i64, data: %io_channel_w_bits_data: i64, mask: %io_channel_w_bits_strb: i8) -> ()
    %10 = comb.concat %c0_i32, %AWADDR : i32, i32
    %11 = comb.and bin %io_channel_r_ready, %RVALID : i1
    %12 = comb.icmp bin eq %ARLEN, %c0_i8 : i8
    %13 = comb.xor %12, %true : i1
    %14 = comb.and %13, %RVALID : i1
    %15 = comb.or %12, %ARREADY : i1
    %16 = comb.and %11, %12 {sv.namehint = "io_channel_r_bits_last"} : i1
    %17 = comb.extract %6 from 0 : (i128) -> i32
    %18 = comb.add bin %ARADDR, %17 {sv.namehint = "_wireARADDR_T"} : i32
    %19 = comb.mux bin %12, %ARADDR, %18 : i32
    %20 = comb.mux bin %12, %ARADDR, %31 : i32
    %21 = comb.add %ARLEN, %c-1_i8 {sv.namehint = "_ARLEN_T"} : i8
    %22 = comb.mux bin %12, %ARLEN, %21 : i8
    %23 = comb.and bin %ARREADY, %io_channel_ar_valid : i1
    %24 = comb.xor %23, %true : i1
    %25 = comb.or %11, %24 : i1
    %26 = comb.mux bin %25, %RID, %io_channel_ar_bits_id : i4
    %27 = comb.extract %io_channel_ar_bits_addr from 3 {sv.namehint = "_wireARADDR_T_2"} : (i32) -> i29
    %28 = comb.concat %27, %c0_i3 : i29, i3
    %29 = comb.add %28, %c-2147483648_i32 {sv.namehint = "_wireARADDR_T_4"} : i32
    %30 = comb.mux bin %23, %29, %ARADDR : i32
    %31 = comb.mux bin %11, %19, %30 {sv.namehint = "wireARADDR"} : i32
    %32 = comb.mux bin %23, %31, %ARADDR : i32
    %33 = comb.mux bin %11, %20, %32 : i32
    %34 = comb.xor %23, %true : i1
    %35 = comb.and %34, %ARREADY : i1
    %36 = comb.mux bin %11, %15, %35 : i1
    %37 = comb.or %23, %RVALID : i1
    %38 = comb.mux bin %11, %14, %37 : i1
    %39 = comb.xor %23, %true : i1
    %40 = comb.or %11, %39 : i1
    %41 = comb.mux bin %40, %ARSIZE, %io_channel_ar_bits_size : i3
    %42 = comb.mux bin %23, %io_channel_ar_bits_len, %ARLEN : i8
    %43 = comb.mux bin %11, %22, %42 : i8
    %44 = comb.and bin %AWREADY, %io_channel_aw_valid : i1
    %45 = comb.extract %io_channel_aw_bits_addr from 3 {sv.namehint = "_AWADDR_T"} : (i32) -> i29
    %46 = comb.concat %45, %c0_i3 : i29, i3
    %47 = comb.add %46, %c-2147483648_i32 {sv.namehint = "_AWADDR_T_2"} : i32
    %48 = comb.mux bin %44, %47, %AWADDR : i32
    %49 = comb.mux bin %44, %io_channel_aw_bits_id, %BID : i4
    %50 = comb.xor %44, %true : i1
    %51 = comb.and %50, %AWREADY : i1
    %52 = comb.or %44, %WREADY : i1
    %53 = comb.mux bin %44, %io_channel_aw_bits_size, %AWSIZE : i3
    %54 = comb.mux bin %44, %io_channel_aw_bits_len, %AWLEN : i8
    %55 = comb.and bin %WREADY, %io_channel_w_valid : i1
    %56 = comb.icmp bin eq %AWLEN, %c0_i8 : i8
    %57 = comb.and bin %55, %56 : i1
    %58 = comb.xor %57, %true : i1
    %59 = comb.and %58, %52 : i1
    %60 = comb.or %57, %BVALID : i1
    %61 = comb.extract %8 from 0 : (i128) -> i32
    %62 = comb.add bin %AWADDR, %61 {sv.namehint = "_AWADDR_T_4"} : i32
    %63 = comb.xor %55, %true : i1
    %64 = comb.or %63, %56 : i1
    %65 = comb.mux bin %64, %48, %62 : i32
    %66 = comb.add %AWLEN, %c-1_i8 {sv.namehint = "_AWLEN_T"} : i8
    %67 = comb.xor %55, %true : i1
    %68 = comb.or %67, %56 : i1
    %69 = comb.mux bin %68, %54, %66 : i8
    %70 = comb.and bin %io_channel_b_ready, %BVALID : i1
    %71 = comb.or %70, %51 : i1
    %72 = comb.xor %70, %true : i1
    %73 = comb.and %72, %60 : i1
    hw.output %AWREADY, %ARREADY, %WREADY, %BVALID, %BID, %RVALID, %RID, %ram_read.data, %16 : i1, i1, i1, i1, i4, i1, i4, i64, i1
  }
  hw.module.extern private @UartRead(in %clock : !seq.clock, in %getc : i1, in %addr : i8, out ch : i8) attributes {verilogName = "UartRead"}
  hw.module.extern private @UartWrite(in %clock : !seq.clock, in %wen : i1, in %waddr : i8, in %wdata : i8) attributes {verilogName = "UartWrite"}
  hw.module.extern private @UartInt(in %clock : !seq.clock, out inter : i1) attributes {verilogName = "UartInt"}
  hw.module private @UartSim(in %io_basic_ACLK : !seq.clock, in %io_basic_ARESETn : i1, out io_channel_aw_ready : i1, in %io_channel_aw_valid : i1, in %io_channel_aw_bits_id : i4, in %io_channel_aw_bits_addr : i32, out io_channel_ar_ready : i1, in %io_channel_ar_valid : i1, in %io_channel_ar_bits_id : i4, in %io_channel_ar_bits_addr : i32, out io_channel_w_ready : i1, in %io_channel_w_valid : i1, in %io_channel_w_bits_data : i64, in %io_channel_b_ready : i1, out io_channel_b_valid : i1, out io_channel_b_bits_id : i4, in %io_channel_r_ready : i1, out io_channel_r_valid : i1, out io_channel_r_bits_id : i4, out io_channel_r_bits_data : i64, out io_interrupt : i1) {
    %c0_i56 = hw.constant 0 : i56
    %c0_i48 = hw.constant 0 : i48
    %c0_i40 = hw.constant 0 : i40
    %c0_i32 = hw.constant 0 : i32
    %c0_i24 = hw.constant 0 : i24
    %c0_i16 = hw.constant 0 : i16
    %c0_i8 = hw.constant 0 : i8
    %c0_i5 = hw.constant 0 : i5
    %false = hw.constant false
    %c0_i4 = hw.constant 0 : i4
    %c0_i3 = hw.constant 0 : i3
    %true = hw.constant true
    %0 = comb.xor bin %io_basic_ARESETn, %true : i1
    %AWREADY = seq.firreg %62 clock %io_basic_ACLK reset sync %0, %true {firrtl.random_init_start = 0 : ui64, sv.namehint = "AWREADY"} : i1
    %WREADY = seq.firreg %59 clock %io_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 1 : ui64, sv.namehint = "WREADY"} : i1
    %BVALID = seq.firreg %64 clock %io_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 2 : ui64, sv.namehint = "BVALID"} : i1
    %ARREADY = seq.firreg %46 clock %io_basic_ACLK reset sync %0, %true {firrtl.random_init_start = 3 : ui64, sv.namehint = "ARREADY"} : i1
    %RVALID = seq.firreg %49 clock %io_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 4 : ui64, sv.namehint = "RVALID"} : i1
    %RID = seq.firreg %43 clock %io_basic_ACLK reset sync %0, %c0_i4 {firrtl.random_init_start = 5 : ui64, sv.namehint = "RID"} : i4
    %BID = seq.firreg %53 clock %io_basic_ACLK reset sync %0, %c0_i4 {firrtl.random_init_start = 9 : ui64, sv.namehint = "BID"} : i4
    %ARADDR = seq.firreg %40 clock %io_basic_ACLK reset sync %0, %c0_i3 {firrtl.random_init_start = 13 : ui64} : i3
    %AWADDR = seq.firreg %52 clock %io_basic_ACLK reset sync %0, %c0_i3 {firrtl.random_init_start = 16 : ui64} : i3
    %uart_read.ch = hw.instance "uart_read" @UartRead(clock: %io_basic_ACLK: !seq.clock, getc: %33: i1, addr: %1: i8) -> (ch: i8)
    %1 = comb.concat %c0_i5, %37 : i5, i3
    %2 = comb.concat %uart_read.ch, %c0_i56 {sv.namehint = "_io_channel_r_bits_data_WIRE_7"} : i8, i56
    %3 = comb.concat %c0_i56, %uart_read.ch : i56, i8
    %4 = comb.concat %c0_i48, %uart_read.ch, %c0_i8 : i48, i8, i8
    %5 = comb.concat %c0_i40, %uart_read.ch, %c0_i16 : i40, i8, i16
    %6 = comb.concat %c0_i32, %uart_read.ch, %c0_i24 : i32, i8, i24
    %7 = comb.concat %c0_i24, %uart_read.ch, %c0_i32 : i24, i8, i32
    %8 = comb.concat %c0_i16, %uart_read.ch, %c0_i40 : i16, i8, i40
    %9 = comb.concat %c0_i8, %uart_read.ch, %c0_i48 : i8, i8, i48
    %10 = hw.array_create %2, %9, %8, %7, %6, %5, %4, %3 : i64
    %11 = hw.array_get %10[%ARADDR] {sv.namehint = "io_channel_r_bits_data"} : !hw.array<8xi64>, i3
    hw.instance "uart_write" @UartWrite(clock: %io_basic_ACLK: !seq.clock, wen: %57: i1, waddr: %12: i8, wdata: %29: i8) -> ()
    %12 = comb.concat %c0_i5, %AWADDR : i5, i3
    %13 = comb.extract %io_channel_w_bits_data from 8 {sv.namehint = "_uart_write_io_wdata_T_1"} : (i64) -> i56
    %14 = comb.extract %io_channel_w_bits_data from 16 {sv.namehint = "_uart_write_io_wdata_T_2"} : (i64) -> i48
    %15 = comb.extract %io_channel_w_bits_data from 24 {sv.namehint = "_uart_write_io_wdata_T_3"} : (i64) -> i40
    %16 = comb.extract %io_channel_w_bits_data from 32 {sv.namehint = "_uart_write_io_wdata_T_4"} : (i64) -> i32
    %17 = comb.extract %io_channel_w_bits_data from 40 {sv.namehint = "_uart_write_io_wdata_T_5"} : (i64) -> i24
    %18 = comb.extract %io_channel_w_bits_data from 48 {sv.namehint = "_uart_write_io_wdata_T_6"} : (i64) -> i16
    %19 = comb.extract %io_channel_w_bits_data from 56 {sv.namehint = "_uart_write_io_wdata_T_7"} : (i64) -> i8
    %20 = comb.concat %c0_i8, %13 : i8, i56
    %21 = comb.concat %c0_i16, %14 : i16, i48
    %22 = comb.concat %c0_i24, %15 : i24, i40
    %23 = comb.concat %c0_i32, %16 : i32, i32
    %24 = comb.concat %c0_i40, %17 : i40, i24
    %25 = comb.concat %c0_i48, %18 : i48, i16
    %26 = comb.concat %c0_i56, %19 : i56, i8
    %27 = hw.array_create %26, %25, %24, %23, %22, %21, %20, %io_channel_w_bits_data : i64
    %28 = hw.array_get %27[%AWADDR] : !hw.array<8xi64>, i3
    %29 = comb.extract %28 from 0 : (i64) -> i8
    %uart_int.inter = hw.instance "uart_int" @UartInt(clock: %io_basic_ACLK: !seq.clock) -> (inter: i1) {sv.namehint = "io_interrupt"}
    %30 = comb.and bin %io_channel_r_ready, %RVALID : i1
    %31 = comb.and bin %ARREADY, %io_channel_ar_valid : i1
    %32 = comb.xor %30, %true : i1
    %33 = comb.and %32, %31 : i1
    %34 = comb.extract %io_channel_ar_bits_addr from 0 : (i32) -> i3
    %35 = comb.xor %31, %true : i1
    %36 = comb.or %30, %35 : i1
    %37 = comb.mux bin %36, %ARADDR, %34 {sv.namehint = "wireARADDR"} : i3
    %38 = comb.xor %31, %true : i1
    %39 = comb.or %38, %36 : i1
    %40 = comb.mux bin %39, %ARADDR, %34 : i3
    %41 = comb.xor %31, %true : i1
    %42 = comb.or %30, %41 : i1
    %43 = comb.mux bin %42, %RID, %io_channel_ar_bits_id : i4
    %44 = comb.xor %31, %true : i1
    %45 = comb.and %44, %ARREADY : i1
    %46 = comb.or %30, %45 : i1
    %47 = comb.or %31, %RVALID : i1
    %48 = comb.xor %30, %true : i1
    %49 = comb.and %48, %47 : i1
    %50 = comb.and bin %AWREADY, %io_channel_aw_valid : i1
    %51 = comb.extract %io_channel_aw_bits_addr from 0 : (i32) -> i3
    %52 = comb.mux bin %50, %51, %AWADDR : i3
    %53 = comb.mux bin %50, %io_channel_aw_bits_id, %BID : i4
    %54 = comb.xor %50, %true : i1
    %55 = comb.and %54, %AWREADY : i1
    %56 = comb.or %50, %WREADY : i1
    %57 = comb.and bin %WREADY, %io_channel_w_valid : i1
    %58 = comb.xor %57, %true : i1
    %59 = comb.and %58, %56 : i1
    %60 = comb.or %57, %BVALID : i1
    %61 = comb.and bin %io_channel_b_ready, %BVALID : i1
    %62 = comb.or %61, %55 : i1
    %63 = comb.xor %61, %true : i1
    %64 = comb.and %63, %60 : i1
    hw.output %AWREADY, %ARREADY, %WREADY, %BVALID, %BID, %RVALID, %RID, %11, %uart_int.inter : i1, i1, i1, i1, i4, i1, i4, i64, i1
  }
  hw.module.extern private @spiFlash(in %spi_clk : i1, in %spi_cs : i1, in %spi_mosi : i1, out spi_miso : i1, in %spi_irq_out : i1) attributes {verilogName = "spiFlash"}
  hw.module.extern private @spi_flash<flash_addr_end: ui32, flash_addr_start: ui32, spi_cs_num: ui32>(in %presetn : i1, in %pclk : !seq.clock, in %psel : i1, in %penable : i1, out pready : i1, out pslverr : i1, in %paddr : i32, in %pwrite : i1, out prdata : i32, in %pwdata : i32, in %pwstrb : i4, out spi_clk : i1, out spi_cs : i1, out spi_mosi : i1, in %spi_miso : i1, out spi_irq_out : i1) attributes {verilogName = "spi_flash"}
  hw.module.extern private @inner_axi2apb(in %ACLK : i1, in %ARESETn : i1, in %AWID : i4, in %AWADDR : i32, in %AWLEN : i4, in %AWSIZE : i2, in %AWVALID : i1, out AWREADY : i1, in %WDATA : i32, in %WSTRB : i4, in %WLAST : i1, in %WVALID : i1, out WREADY : i1, out BID : i4, out BRESP : i2, out BVALID : i1, in %BREADY : i1, in %ARID : i4, in %ARADDR : i32, in %ARLEN : i4, in %ARSIZE : i2, in %ARVALID : i1, out ARREADY : i1, out RID : i4, out RDATA : i32, out RRESP : i2, out RLAST : i1, out RVALID : i1, in %RREADY : i1, out pclk : i1, out presetn : i1, out psel : i1, out penable : i1, out pwrite : i1, out paddr : i32, out pwdata : i32, out pwstrb : i4, in %prdata : i32, in %pslverr : i1, in %pready : i1) attributes {verilogName = "inner_axi2apb"}
  hw.module private @Axi2Apb(in %io_axi_s_basic_ACLK : !seq.clock, in %io_axi_s_basic_ARESETn : i1, out io_axi_s_channel_aw_ready : i1, in %io_axi_s_channel_aw_valid : i1, in %io_axi_s_channel_aw_bits_id : i4, in %io_axi_s_channel_aw_bits_addr : i32, in %io_axi_s_channel_aw_bits_size : i3, out io_axi_s_channel_ar_ready : i1, in %io_axi_s_channel_ar_valid : i1, in %io_axi_s_channel_ar_bits_id : i4, in %io_axi_s_channel_ar_bits_addr : i32, in %io_axi_s_channel_ar_bits_size : i3, out io_axi_s_channel_w_ready : i1, in %io_axi_s_channel_w_valid : i1, in %io_axi_s_channel_w_bits_data : i64, in %io_axi_s_channel_b_ready : i1, out io_axi_s_channel_b_valid : i1, out io_axi_s_channel_b_bits_id : i4, in %io_axi_s_channel_r_ready : i1, out io_axi_s_channel_r_valid : i1, out io_axi_s_channel_r_bits_id : i4, out io_axi_s_channel_r_bits_data : i64, out io_apb_m_presetn : i1, out io_apb_m_pclk : !seq.clock, out io_apb_m_psel : i1, out io_apb_m_penable : i1, in %io_apb_m_pready : i1, in %io_apb_m_pslverr : i1, out io_apb_m_paddr : i32, out io_apb_m_pwrite : i1, in %io_apb_m_prdata : i32, out io_apb_m_pwdata : i32, out io_apb_m_pwstrb : i4) {
    %c4_i32 = hw.constant 4 : i32
    %c2_i3 = hw.constant 2 : i3
    %c3_i3 = hw.constant 3 : i3
    %true = hw.constant true
    %c0_i2 = hw.constant 0 : i2
    %c0_i32 = hw.constant 0 : i32
    %c0_i3 = hw.constant 0 : i3
    %c1_i2 = hw.constant 1 : i2
    %c-2_i2 = hw.constant -2 : i2
    %c0_i8 = hw.constant 0 : i8
    %c0_i64 = hw.constant 0 : i64
    %c0_i4 = hw.constant 0 : i4
    %false = hw.constant false
    %0 = seq.from_clock %io_axi_s_basic_ACLK
    %1 = comb.xor bin %io_axi_s_basic_ARESETn, %true : i1
    %state = seq.firreg %126 clock %io_axi_s_basic_ACLK reset sync %1, %c0_i2 {firrtl.random_init_start = 0 : ui64} : i2
    %wFirst = seq.firreg %2 clock %io_axi_s_basic_ACLK reset sync %1, %false {firrtl.random_init_start = 2 : ui64} : i1
    %2 = comb.xor bin %wFirst, %true {sv.namehint = "_wFirst_T"} : i1
    %inner_ARADDR = seq.firreg %78 clock %io_axi_s_basic_ACLK reset sync %1, %c0_i32 {firrtl.random_init_start = 3 : ui64} : i32
    %inner_ARID = seq.firreg %21 clock %io_axi_s_basic_ACLK reset sync %1, %c0_i4 {firrtl.random_init_start = 35 : ui64, sv.namehint = "inner_ARID"} : i4
    %inner_AWADDR = seq.firreg %114 clock %io_axi_s_basic_ACLK reset sync %1, %c0_i32 {firrtl.random_init_start = 39 : ui64} : i32
    %inner_AWID = seq.firreg %35 clock %io_axi_s_basic_ACLK reset sync %1, %c0_i4 {firrtl.random_init_start = 71 : ui64, sv.namehint = "inner_AWID"} : i4
    %inner_RDATA_0 = seq.firreg %66 clock %io_axi_s_basic_ACLK reset sync %1, %c0_i32 {firrtl.random_init_start = 75 : ui64} : i32
    %inner_RDATA_1 = seq.firreg %68 clock %io_axi_s_basic_ACLK reset sync %1, %c0_i32 {firrtl.random_init_start = 107 : ui64} : i32
    %inner_WDATA = seq.firreg %99 clock %io_axi_s_basic_ACLK reset sync %1, %c0_i64 {firrtl.random_init_start = 139 : ui64} : i64
    %inner_WSTRB = seq.firreg %102 clock %io_axi_s_basic_ACLK reset sync %1, %c0_i8 {firrtl.random_init_start = 203 : ui64} : i8
    %inner_ARVALID = seq.firreg %74 clock %io_axi_s_basic_ACLK reset sync %1, %false {firrtl.random_init_start = 211 : ui64} : i1
    %inner_AWVALID = seq.firreg %108 clock %io_axi_s_basic_ACLK reset sync %1, %false {firrtl.random_init_start = 212 : ui64} : i1
    %inner_WVALID = seq.firreg %111 clock %io_axi_s_basic_ACLK reset sync %1, %false {firrtl.random_init_start = 213 : ui64} : i1
    %regARREADY = seq.firreg %90 clock %io_axi_s_basic_ACLK reset sync %1, %true {firrtl.random_init_start = 214 : ui64} : i1
    %regRVALID = seq.firreg %88 clock %io_axi_s_basic_ACLK reset sync %1, %false {firrtl.random_init_start = 215 : ui64, sv.namehint = "regRVALID"} : i1
    %regAWREADY = seq.firreg %122 clock %io_axi_s_basic_ACLK reset sync %1, %true {firrtl.random_init_start = 216 : ui64} : i1
    %regWREADY = seq.firreg %123 clock %io_axi_s_basic_ACLK reset sync %1, %true {firrtl.random_init_start = 217 : ui64} : i1
    %regBVALID = seq.firreg %120 clock %io_axi_s_basic_ACLK reset sync %1, %false {firrtl.random_init_start = 218 : ui64, sv.namehint = "regBVALID"} : i1
    %read_pending = seq.firreg %117 clock %io_axi_s_basic_ACLK reset sync %1, %false {firrtl.random_init_start = 219 : ui64} : i1
    %write_pending = seq.firreg %41 clock %io_axi_s_basic_ACLK reset sync %1, %false {firrtl.random_init_start = 220 : ui64} : i1
    %read_counter = seq.firreg %85 clock %io_axi_s_basic_ACLK reset sync %1, %false {firrtl.random_init_start = 221 : ui64} : i1
    %inner_Axi2Apb.AWREADY, %inner_Axi2Apb.WREADY, %inner_Axi2Apb.BID, %inner_Axi2Apb.BRESP, %inner_Axi2Apb.BVALID, %inner_Axi2Apb.ARREADY, %inner_Axi2Apb.RID, %inner_Axi2Apb.RDATA, %inner_Axi2Apb.RRESP, %inner_Axi2Apb.RLAST, %inner_Axi2Apb.RVALID, %inner_Axi2Apb.pclk, %inner_Axi2Apb.presetn, %inner_Axi2Apb.psel, %inner_Axi2Apb.penable, %inner_Axi2Apb.pwrite, %inner_Axi2Apb.paddr, %inner_Axi2Apb.pwdata, %inner_Axi2Apb.pwstrb = hw.instance "inner_Axi2Apb" @inner_axi2apb(ACLK: %0: i1, ARESETn: %io_axi_s_basic_ARESETn: i1, AWID: %inner_AWID: i4, AWADDR: %inner_AWADDR: i32, AWLEN: %c0_i4: i4, AWSIZE: %c-2_i2: i2, AWVALID: %inner_AWVALID: i1, WDATA: %3: i32, WSTRB: %4: i4, WLAST: %true: i1, WVALID: %inner_WVALID: i1, BREADY: %true: i1, ARID: %inner_ARID: i4, ARADDR: %inner_ARADDR: i32, ARLEN: %c0_i4: i4, ARSIZE: %c-2_i2: i2, ARVALID: %inner_ARVALID: i1, RREADY: %true: i1, prdata: %io_apb_m_prdata: i32, pslverr: %io_apb_m_pslverr: i1, pready: %io_apb_m_pready: i1) -> (AWREADY: i1, WREADY: i1, BID: i4, BRESP: i2, BVALID: i1, ARREADY: i1, RID: i4, RDATA: i32, RRESP: i2, RLAST: i1, RVALID: i1, pclk: i1, presetn: i1, psel: i1, penable: i1, pwrite: i1, paddr: i32, pwdata: i32, pwstrb: i4) {sv.namehint = "io_apb_m_psel"}
    %3 = comb.extract %inner_WDATA from 0 {sv.namehint = "_inner_Axi2Apb_io_WDATA_T"} : (i64) -> i32
    %4 = comb.extract %inner_WSTRB from 0 {sv.namehint = "_inner_Axi2Apb_io_WSTRB_T"} : (i8) -> i4
    %5 = seq.to_clock %inner_Axi2Apb.pclk {sv.namehint = "io_apb_m_pclk"}
    %6 = comb.concat %inner_RDATA_1, %inner_RDATA_0 {sv.namehint = "io_axi_s_channel_r_bits_data"} : i32, i32
    %7 = comb.and bin %regAWREADY, %io_axi_s_channel_aw_valid {sv.namehint = "writeAddrReq"} : i1
    %8 = comb.and bin %regWREADY, %io_axi_s_channel_w_valid {sv.namehint = "writeDataReq"} : i1
    %9 = comb.and bin %53, %io_axi_s_channel_ar_valid {sv.namehint = "readAddrAcpt"} : i1
    %10 = comb.and bin %io_axi_s_channel_r_ready, %regRVALID {sv.namehint = "readDataAcpt"} : i1
    %11 = comb.and bin %57, %io_axi_s_channel_aw_valid {sv.namehint = "writeAddrAcpt"} : i1
    %12 = comb.and bin %60, %io_axi_s_channel_w_valid {sv.namehint = "writeDataAcpt"} : i1
    %13 = comb.and bin %io_axi_s_channel_b_ready, %regBVALID {sv.namehint = "writeRespAcpt"} : i1
    %14 = comb.and bin %inner_Axi2Apb.ARREADY, %inner_ARVALID {sv.namehint = "inner_readAddrAcpt"} : i1
    %15 = comb.and bin %inner_Axi2Apb.AWREADY, %inner_AWVALID {sv.namehint = "inner_WriteAddrAcpt"} : i1
    %16 = comb.and bin %inner_Axi2Apb.WREADY, %inner_WVALID {sv.namehint = "inner_WriteDataAcpt"} : i1
    %17 = comb.mux bin %9, %c1_i2, %state : i2
    %18 = comb.xor %9, %true : i1
    %19 = comb.and %18, %regARREADY : i1
    %20 = comb.or %9, %inner_ARVALID : i1
    %21 = comb.mux bin %9, %io_axi_s_channel_ar_bits_id, %inner_ARID : i4
    %22 = comb.extract %io_axi_s_channel_ar_bits_addr from 3 {sv.namehint = "_inner_ARADDR_T"} : (i32) -> i29
    %23 = comb.concat %22, %c0_i3 {sv.namehint = "_inner_ARADDR_T_1"} : i29, i3
    %24 = comb.mux bin %9, %23, %inner_ARADDR : i32
    %25 = comb.xor %9, %true : i1
    %26 = comb.and %25, %read_counter : i1
    %27 = comb.icmp bin ugt %io_axi_s_channel_ar_bits_size, %c2_i3 : i3
    %28 = comb.and %27, %read_pending : i1
    %29 = comb.icmp bin eq %io_axi_s_channel_ar_bits_size, %c3_i3 : i3
    %30 = comb.or %29, %28 : i1
    %31 = comb.mux bin %9, %30, %read_pending : i1
    %32 = comb.xor %11, %true : i1
    %33 = comb.and %32, %regAWREADY : i1
    %34 = comb.or %11, %inner_AWVALID : i1
    %35 = comb.mux bin %11, %io_axi_s_channel_aw_bits_id, %inner_AWID : i4
    %36 = comb.mux bin %11, %io_axi_s_channel_aw_bits_addr, %inner_AWADDR : i32
    %37 = comb.icmp bin ugt %io_axi_s_channel_aw_bits_size, %c2_i3 : i3
    %38 = comb.and %37, %write_pending : i1
    %39 = comb.icmp bin eq %io_axi_s_channel_aw_bits_size, %c3_i3 : i3
    %40 = comb.or %39, %38 : i1
    %41 = comb.mux bin %11, %40, %write_pending : i1
    %42 = comb.or bin %12, %11 : i1
    %43 = comb.mux bin %42, %c-2_i2, %17 : i2
    %44 = comb.xor %12, %true : i1
    %45 = comb.and %44, %regWREADY : i1
    %46 = comb.or %12, %inner_WVALID : i1
    %47 = comb.mux bin %12, %io_axi_s_channel_w_bits_data, %inner_WDATA : i64
    %48 = comb.icmp bin eq %state, %c0_i2 : i2
    %49 = comb.or bin %7, %8 : i1
    %50 = comb.and bin %regARREADY, %io_axi_s_channel_ar_valid, %49 : i1
    %51 = comb.and bin %48, %50, %wFirst : i1
    %52 = comb.xor %51, %true : i1
    %53 = comb.and %52, %regARREADY {sv.namehint = "wireARREADY"} : i1
    %54 = comb.and bin %48, %50 : i1
    %55 = comb.xor %54, %true : i1
    %56 = comb.or %55, %wFirst : i1
    %57 = comb.and %56, %regAWREADY {sv.namehint = "wireAWREADY"} : i1
    %58 = comb.xor %54, %true : i1
    %59 = comb.or %58, %wFirst : i1
    %60 = comb.and %59, %regWREADY {sv.namehint = "wireWREADY"} : i1
    %61 = comb.icmp bin eq %state, %c1_i2 : i2
    %62 = comb.xor %14, %true : i1
    %63 = comb.and %62, %20 : i1
    %64 = comb.xor bin %read_counter, %true : i1
    %65 = comb.and bin %61, %inner_Axi2Apb.RVALID, %64 : i1
    %66 = comb.mux bin %65, %inner_Axi2Apb.RDATA, %inner_RDATA_0 : i32
    %67 = comb.and bin %61, %inner_Axi2Apb.RVALID, %read_counter : i1
    %68 = comb.mux bin %67, %inner_Axi2Apb.RDATA, %inner_RDATA_1 : i32
    %69 = comb.xor bin %read_pending, %true : i1
    %70 = comb.and bin %inner_Axi2Apb.RVALID, %69 : i1
    %71 = comb.or %70, %regRVALID : i1
    %72 = comb.and %inner_Axi2Apb.RVALID, %read_pending : i1
    %73 = comb.or %72, %63 : i1
    %74 = comb.mux bin %61, %73, %20 : i1
    %75 = comb.add bin %inner_ARADDR, %c4_i32 {sv.namehint = "_inner_ARADDR_T_2"} : i32
    %76 = comb.and bin %61, %inner_Axi2Apb.RVALID : i1
    %77 = comb.and %76, %read_pending : i1
    %78 = comb.mux bin %77, %75, %24 : i32
    %79 = comb.xor %read_pending, %true : i1
    %80 = comb.xor %76, %true : i1
    %81 = comb.or %80, %79 : i1
    %82 = comb.and %81, %31 : i1
    %83 = comb.add bin %read_counter, %true {sv.namehint = "_read_counter_T"} : i1
    %84 = comb.and %76, %read_pending : i1
    %85 = comb.mux bin %84, %83, %26 : i1
    %86 = comb.xor %10, %true : i1
    %87 = comb.and %86, %71 : i1
    %88 = comb.mux bin %61, %87, %regRVALID : i1
    %89 = comb.and bin %61, %10 : i1
    %90 = comb.or %89, %19 : i1
    %91 = comb.icmp bin eq %state, %c-2_i2 : i2
    %92 = comb.xor %15, %true : i1
    %93 = comb.and %92, %34 : i1
    %94 = comb.xor %16, %true : i1
    %95 = comb.and %94, %46 : i1
    %96 = comb.extract %inner_WDATA from 32 : (i64) -> i32
    %97 = comb.concat %c0_i32, %96 : i32, i32
    %98 = comb.and bin %91, %inner_Axi2Apb.BVALID : i1
    %99 = comb.mux bin %98, %97, %47 : i64
    %100 = comb.extract %inner_WSTRB from 4 : (i8) -> i4
    %101 = comb.concat %c0_i4, %100 : i4, i4
    %102 = comb.mux bin %98, %101, %inner_WSTRB : i8
    %103 = comb.xor bin %write_pending, %true : i1
    %104 = comb.and bin %inner_Axi2Apb.BVALID, %103 : i1
    %105 = comb.or %104, %regBVALID : i1
    %106 = comb.and %inner_Axi2Apb.BVALID, %write_pending : i1
    %107 = comb.or %106, %93 : i1
    %108 = comb.mux bin %91, %107, %34 : i1
    %109 = comb.and %inner_Axi2Apb.BVALID, %write_pending : i1
    %110 = comb.or %109, %95 : i1
    %111 = comb.mux bin %91, %110, %46 : i1
    %112 = comb.add bin %inner_AWADDR, %c4_i32 {sv.namehint = "_inner_AWADDR_T"} : i32
    %113 = comb.and %98, %write_pending : i1
    %114 = comb.mux bin %113, %112, %36 : i32
    %115 = comb.add %read_pending, %true {sv.namehint = "_read_pending_T_2"} : i1
    %116 = comb.and %98, %write_pending : i1
    %117 = comb.mux bin %116, %115, %82 : i1
    %118 = comb.xor %13, %true : i1
    %119 = comb.and %118, %105 : i1
    %120 = comb.mux bin %91, %119, %regBVALID : i1
    %121 = comb.and bin %91, %13 : i1
    %122 = comb.or %121, %33 : i1
    %123 = comb.or %121, %45 : i1
    %124 = comb.and %91, %13 : i1
    %125 = comb.or %124, %89 : i1
    %126 = comb.mux bin %125, %c0_i2, %43 : i2
    hw.output %57, %53, %60, %regBVALID, %inner_AWID, %regRVALID, %inner_ARID, %6, %inner_Axi2Apb.presetn, %5, %inner_Axi2Apb.psel, %inner_Axi2Apb.penable, %inner_Axi2Apb.paddr, %inner_Axi2Apb.pwrite, %inner_Axi2Apb.pwdata, %inner_Axi2Apb.pwstrb : i1, i1, i1, i1, i4, i1, i4, i64, i1, !seq.clock, i1, i1, i32, i1, i32, i4
  }
  hw.module private @spi_axi_flash(in %io_axi_s_basic_ACLK : !seq.clock, in %io_axi_s_basic_ARESETn : i1, out io_axi_s_channel_aw_ready : i1, in %io_axi_s_channel_aw_valid : i1, in %io_axi_s_channel_aw_bits_id : i4, in %io_axi_s_channel_aw_bits_addr : i32, in %io_axi_s_channel_aw_bits_size : i3, out io_axi_s_channel_ar_ready : i1, in %io_axi_s_channel_ar_valid : i1, in %io_axi_s_channel_ar_bits_id : i4, in %io_axi_s_channel_ar_bits_addr : i32, in %io_axi_s_channel_ar_bits_size : i3, out io_axi_s_channel_w_ready : i1, in %io_axi_s_channel_w_valid : i1, in %io_axi_s_channel_w_bits_data : i64, in %io_axi_s_channel_b_ready : i1, out io_axi_s_channel_b_valid : i1, out io_axi_s_channel_b_bits_id : i4, in %io_axi_s_channel_r_ready : i1, out io_axi_s_channel_r_valid : i1, out io_axi_s_channel_r_bits_id : i4, out io_axi_s_channel_r_bits_data : i64, out io_spi_m_spi_clk : i1, out io_spi_m_spi_cs : i1, out io_spi_m_spi_mosi : i1, in %io_spi_m_spi_miso : i1, out io_spi_m_spi_irq_out : i1) {
    %spiFlash.pready, %spiFlash.pslverr, %spiFlash.prdata, %spiFlash.spi_clk, %spiFlash.spi_cs, %spiFlash.spi_mosi, %spiFlash.spi_irq_out = hw.instance "spiFlash" @spi_flash<flash_addr_end: ui32 = 1073741823, flash_addr_start: ui32 = 805306368, spi_cs_num: ui32 = 1>(presetn: %axi2apb.io_apb_m_presetn: i1, pclk: %axi2apb.io_apb_m_pclk: !seq.clock, psel: %axi2apb.io_apb_m_psel: i1, penable: %axi2apb.io_apb_m_penable: i1, paddr: %axi2apb.io_apb_m_paddr: i32, pwrite: %axi2apb.io_apb_m_pwrite: i1, pwdata: %axi2apb.io_apb_m_pwdata: i32, pwstrb: %axi2apb.io_apb_m_pwstrb: i4, spi_miso: %io_spi_m_spi_miso: i1) -> (pready: i1, pslverr: i1, prdata: i32, spi_clk: i1, spi_cs: i1, spi_mosi: i1, spi_irq_out: i1) {sv.namehint = "axi2apb.io_apb_m_prdata"}
    %axi2apb.io_axi_s_channel_aw_ready, %axi2apb.io_axi_s_channel_ar_ready, %axi2apb.io_axi_s_channel_w_ready, %axi2apb.io_axi_s_channel_b_valid, %axi2apb.io_axi_s_channel_b_bits_id, %axi2apb.io_axi_s_channel_r_valid, %axi2apb.io_axi_s_channel_r_bits_id, %axi2apb.io_axi_s_channel_r_bits_data, %axi2apb.io_apb_m_presetn, %axi2apb.io_apb_m_pclk, %axi2apb.io_apb_m_psel, %axi2apb.io_apb_m_penable, %axi2apb.io_apb_m_paddr, %axi2apb.io_apb_m_pwrite, %axi2apb.io_apb_m_pwdata, %axi2apb.io_apb_m_pwstrb = hw.instance "axi2apb" @Axi2Apb(io_axi_s_basic_ACLK: %io_axi_s_basic_ACLK: !seq.clock, io_axi_s_basic_ARESETn: %io_axi_s_basic_ARESETn: i1, io_axi_s_channel_aw_valid: %io_axi_s_channel_aw_valid: i1, io_axi_s_channel_aw_bits_id: %io_axi_s_channel_aw_bits_id: i4, io_axi_s_channel_aw_bits_addr: %io_axi_s_channel_aw_bits_addr: i32, io_axi_s_channel_aw_bits_size: %io_axi_s_channel_aw_bits_size: i3, io_axi_s_channel_ar_valid: %io_axi_s_channel_ar_valid: i1, io_axi_s_channel_ar_bits_id: %io_axi_s_channel_ar_bits_id: i4, io_axi_s_channel_ar_bits_addr: %io_axi_s_channel_ar_bits_addr: i32, io_axi_s_channel_ar_bits_size: %io_axi_s_channel_ar_bits_size: i3, io_axi_s_channel_w_valid: %io_axi_s_channel_w_valid: i1, io_axi_s_channel_w_bits_data: %io_axi_s_channel_w_bits_data: i64, io_axi_s_channel_b_ready: %io_axi_s_channel_b_ready: i1, io_axi_s_channel_r_ready: %io_axi_s_channel_r_ready: i1, io_apb_m_pready: %spiFlash.pready: i1, io_apb_m_pslverr: %spiFlash.pslverr: i1, io_apb_m_prdata: %spiFlash.prdata: i32) -> (io_axi_s_channel_aw_ready: i1, io_axi_s_channel_ar_ready: i1, io_axi_s_channel_w_ready: i1, io_axi_s_channel_b_valid: i1, io_axi_s_channel_b_bits_id: i4, io_axi_s_channel_r_valid: i1, io_axi_s_channel_r_bits_id: i4, io_axi_s_channel_r_bits_data: i64, io_apb_m_presetn: i1, io_apb_m_pclk: !seq.clock, io_apb_m_psel: i1, io_apb_m_penable: i1, io_apb_m_paddr: i32, io_apb_m_pwrite: i1, io_apb_m_pwdata: i32, io_apb_m_pwstrb: i4) {sv.namehint = "io_axi_s_channel_r_valid"}
    hw.output %axi2apb.io_axi_s_channel_aw_ready, %axi2apb.io_axi_s_channel_ar_ready, %axi2apb.io_axi_s_channel_w_ready, %axi2apb.io_axi_s_channel_b_valid, %axi2apb.io_axi_s_channel_b_bits_id, %axi2apb.io_axi_s_channel_r_valid, %axi2apb.io_axi_s_channel_r_bits_id, %axi2apb.io_axi_s_channel_r_bits_data, %spiFlash.spi_clk, %spiFlash.spi_cs, %spiFlash.spi_mosi, %spiFlash.spi_irq_out : i1, i1, i1, i1, i4, i1, i4, i64, i1, i1, i1, i1
  }
  hw.module private @AxiFlash(in %io_basic_ACLK : !seq.clock, in %io_basic_ARESETn : i1, out io_channel_aw_ready : i1, in %io_channel_aw_valid : i1, in %io_channel_aw_bits_id : i4, in %io_channel_aw_bits_addr : i32, in %io_channel_aw_bits_size : i3, out io_channel_ar_ready : i1, in %io_channel_ar_valid : i1, in %io_channel_ar_bits_id : i4, in %io_channel_ar_bits_addr : i32, in %io_channel_ar_bits_size : i3, out io_channel_w_ready : i1, in %io_channel_w_valid : i1, in %io_channel_w_bits_data : i64, in %io_channel_b_ready : i1, out io_channel_b_valid : i1, out io_channel_b_bits_id : i4, in %io_channel_r_ready : i1, out io_channel_r_valid : i1, out io_channel_r_bits_id : i4, out io_channel_r_bits_data : i64) {
    %moduleSpiFlash.spi_miso = hw.instance "moduleSpiFlash" @spiFlash(spi_clk: %spiAxiFlash.io_spi_m_spi_clk: i1, spi_cs: %spiAxiFlash.io_spi_m_spi_cs: i1, spi_mosi: %spiAxiFlash.io_spi_m_spi_mosi: i1, spi_irq_out: %spiAxiFlash.io_spi_m_spi_irq_out: i1) -> (spi_miso: i1) {sv.namehint = "spiAxiFlash.io_spi_m_spi_miso"}
    %spiAxiFlash.io_axi_s_channel_aw_ready, %spiAxiFlash.io_axi_s_channel_ar_ready, %spiAxiFlash.io_axi_s_channel_w_ready, %spiAxiFlash.io_axi_s_channel_b_valid, %spiAxiFlash.io_axi_s_channel_b_bits_id, %spiAxiFlash.io_axi_s_channel_r_valid, %spiAxiFlash.io_axi_s_channel_r_bits_id, %spiAxiFlash.io_axi_s_channel_r_bits_data, %spiAxiFlash.io_spi_m_spi_clk, %spiAxiFlash.io_spi_m_spi_cs, %spiAxiFlash.io_spi_m_spi_mosi, %spiAxiFlash.io_spi_m_spi_irq_out = hw.instance "spiAxiFlash" @spi_axi_flash(io_axi_s_basic_ACLK: %io_basic_ACLK: !seq.clock, io_axi_s_basic_ARESETn: %io_basic_ARESETn: i1, io_axi_s_channel_aw_valid: %io_channel_aw_valid: i1, io_axi_s_channel_aw_bits_id: %io_channel_aw_bits_id: i4, io_axi_s_channel_aw_bits_addr: %io_channel_aw_bits_addr: i32, io_axi_s_channel_aw_bits_size: %io_channel_aw_bits_size: i3, io_axi_s_channel_ar_valid: %io_channel_ar_valid: i1, io_axi_s_channel_ar_bits_id: %io_channel_ar_bits_id: i4, io_axi_s_channel_ar_bits_addr: %io_channel_ar_bits_addr: i32, io_axi_s_channel_ar_bits_size: %io_channel_ar_bits_size: i3, io_axi_s_channel_w_valid: %io_channel_w_valid: i1, io_axi_s_channel_w_bits_data: %io_channel_w_bits_data: i64, io_axi_s_channel_b_ready: %io_channel_b_ready: i1, io_axi_s_channel_r_ready: %io_channel_r_ready: i1, io_spi_m_spi_miso: %moduleSpiFlash.spi_miso: i1) -> (io_axi_s_channel_aw_ready: i1, io_axi_s_channel_ar_ready: i1, io_axi_s_channel_w_ready: i1, io_axi_s_channel_b_valid: i1, io_axi_s_channel_b_bits_id: i4, io_axi_s_channel_r_valid: i1, io_axi_s_channel_r_bits_id: i4, io_axi_s_channel_r_bits_data: i64, io_spi_m_spi_clk: i1, io_spi_m_spi_cs: i1, io_spi_m_spi_mosi: i1, io_spi_m_spi_irq_out: i1) {sv.namehint = "io_channel_r_valid"}
    hw.output %spiAxiFlash.io_axi_s_channel_aw_ready, %spiAxiFlash.io_axi_s_channel_ar_ready, %spiAxiFlash.io_axi_s_channel_w_ready, %spiAxiFlash.io_axi_s_channel_b_valid, %spiAxiFlash.io_axi_s_channel_b_bits_id, %spiAxiFlash.io_axi_s_channel_r_valid, %spiAxiFlash.io_axi_s_channel_r_bits_id, %spiAxiFlash.io_axi_s_channel_r_bits_data : i1, i1, i1, i1, i4, i1, i4, i64
  }
  hw.module.extern private @SDCardRead(in %clock : !seq.clock, in %ren : i1, in %addr : i64, out rdata : i32) attributes {verilogName = "SDCardRead"}
  hw.module.extern private @SDCardWrite(in %clock : !seq.clock, in %wen : i1, in %waddr : i8, in %wdata : i8) attributes {verilogName = "SDCardWrite"}
  hw.module private @SDCard(in %io_basic_ACLK : !seq.clock, in %io_basic_ARESETn : i1, out io_channel_aw_ready : i1, in %io_channel_aw_valid : i1, in %io_channel_aw_bits_id : i4, in %io_channel_aw_bits_addr : i32, out io_channel_ar_ready : i1, in %io_channel_ar_valid : i1, in %io_channel_ar_bits_id : i4, in %io_channel_ar_bits_addr : i32, out io_channel_w_ready : i1, in %io_channel_w_valid : i1, in %io_channel_w_bits_data : i64, in %io_channel_b_ready : i1, out io_channel_b_valid : i1, out io_channel_b_bits_id : i4, in %io_channel_r_ready : i1, out io_channel_r_valid : i1, out io_channel_r_bits_id : i4, out io_channel_r_bits_data : i64) {
    %c0_i48 = hw.constant 0 : i48
    %c0_i40 = hw.constant 0 : i40
    %c0_i32 = hw.constant 0 : i32
    %c0_i24 = hw.constant 0 : i24
    %c0_i16 = hw.constant 0 : i16
    %c0_i56 = hw.constant 0 : i56
    %false = hw.constant false
    %c0_i4 = hw.constant 0 : i4
    %c0_i8 = hw.constant 0 : i8
    %true = hw.constant true
    %0 = comb.xor bin %io_basic_ARESETn, %true : i1
    %AWREADY = seq.firreg %64 clock %io_basic_ACLK reset sync %0, %true {firrtl.random_init_start = 0 : ui64, sv.namehint = "AWREADY"} : i1
    %WREADY = seq.firreg %61 clock %io_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 1 : ui64, sv.namehint = "WREADY"} : i1
    %BVALID = seq.firreg %66 clock %io_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 2 : ui64, sv.namehint = "BVALID"} : i1
    %ARREADY = seq.firreg %48 clock %io_basic_ACLK reset sync %0, %true {firrtl.random_init_start = 3 : ui64, sv.namehint = "ARREADY"} : i1
    %RVALID = seq.firreg %51 clock %io_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 4 : ui64, sv.namehint = "RVALID"} : i1
    %RID = seq.firreg %45 clock %io_basic_ACLK reset sync %0, %c0_i4 {firrtl.random_init_start = 5 : ui64, sv.namehint = "RID"} : i4
    %BID = seq.firreg %55 clock %io_basic_ACLK reset sync %0, %c0_i4 {firrtl.random_init_start = 9 : ui64, sv.namehint = "BID"} : i4
    %ARADDR = seq.firreg %42 clock %io_basic_ACLK reset sync %0, %c0_i8 {firrtl.random_init_start = 13 : ui64} : i8
    %AWADDR = seq.firreg %54 clock %io_basic_ACLK reset sync %0, %c0_i8 {firrtl.random_init_start = 21 : ui64} : i8
    %sdcard_read.rdata = hw.instance "sdcard_read" @SDCardRead(clock: %io_basic_ACLK: !seq.clock, ren: %35: i1, addr: %1: i64) -> (rdata: i32)
    %1 = comb.concat %c0_i56, %39 : i56, i8
    %2 = comb.concat %sdcard_read.rdata, %c0_i56 {sv.namehint = "_io_channel_r_bits_data_WIRE_7"} : i32, i56
    %3 = comb.concat %c0_i56, %sdcard_read.rdata : i56, i32
    %4 = comb.concat %c0_i48, %sdcard_read.rdata, %c0_i8 : i48, i32, i8
    %5 = comb.concat %c0_i40, %sdcard_read.rdata, %c0_i16 : i40, i32, i16
    %6 = comb.concat %c0_i32, %sdcard_read.rdata, %c0_i24 : i32, i32, i24
    %7 = comb.concat %c0_i24, %sdcard_read.rdata, %c0_i32 : i24, i32, i32
    %8 = comb.concat %c0_i16, %sdcard_read.rdata, %c0_i40 : i16, i32, i40
    %9 = comb.concat %c0_i8, %sdcard_read.rdata, %c0_i48 : i8, i32, i48
    %10 = comb.extract %ARADDR from 0 {sv.namehint = "_io_channel_r_bits_data_T_8"} : (i8) -> i3
    %11 = hw.array_create %2, %9, %8, %7, %6, %5, %4, %3 : i88
    %12 = hw.array_get %11[%10] : !hw.array<8xi88>, i3
    %13 = comb.extract %12 from 0 {sv.namehint = "io_channel_r_bits_data"} : (i88) -> i64
    hw.instance "sdcard_write" @SDCardWrite(clock: %io_basic_ACLK: !seq.clock, wen: %59: i1, waddr: %AWADDR: i8, wdata: %31: i8) -> ()
    %14 = comb.extract %io_channel_w_bits_data from 8 {sv.namehint = "_sdcard_write_io_wdata_T_1"} : (i64) -> i56
    %15 = comb.extract %io_channel_w_bits_data from 16 {sv.namehint = "_sdcard_write_io_wdata_T_2"} : (i64) -> i48
    %16 = comb.extract %io_channel_w_bits_data from 24 {sv.namehint = "_sdcard_write_io_wdata_T_3"} : (i64) -> i40
    %17 = comb.extract %io_channel_w_bits_data from 32 {sv.namehint = "_sdcard_write_io_wdata_T_4"} : (i64) -> i32
    %18 = comb.extract %io_channel_w_bits_data from 40 {sv.namehint = "_sdcard_write_io_wdata_T_5"} : (i64) -> i24
    %19 = comb.extract %io_channel_w_bits_data from 48 {sv.namehint = "_sdcard_write_io_wdata_T_6"} : (i64) -> i16
    %20 = comb.extract %io_channel_w_bits_data from 56 {sv.namehint = "_sdcard_write_io_wdata_T_7"} : (i64) -> i8
    %21 = comb.concat %c0_i8, %14 : i8, i56
    %22 = comb.concat %c0_i16, %15 : i16, i48
    %23 = comb.concat %c0_i24, %16 : i24, i40
    %24 = comb.concat %c0_i32, %17 : i32, i32
    %25 = comb.concat %c0_i40, %18 : i40, i24
    %26 = comb.concat %c0_i48, %19 : i48, i16
    %27 = comb.concat %c0_i56, %20 : i56, i8
    %28 = comb.extract %AWADDR from 0 {sv.namehint = "_sdcard_write_io_wdata_T_8"} : (i8) -> i3
    %29 = hw.array_create %27, %26, %25, %24, %23, %22, %21, %io_channel_w_bits_data : i64
    %30 = hw.array_get %29[%28] : !hw.array<8xi64>, i3
    %31 = comb.extract %30 from 0 : (i64) -> i8
    %32 = comb.and bin %io_channel_r_ready, %RVALID : i1
    %33 = comb.and bin %ARREADY, %io_channel_ar_valid : i1
    %34 = comb.xor %32, %true : i1
    %35 = comb.and %34, %33 : i1
    %36 = comb.extract %io_channel_ar_bits_addr from 0 : (i32) -> i8
    %37 = comb.xor %33, %true : i1
    %38 = comb.or %32, %37 : i1
    %39 = comb.mux bin %38, %ARADDR, %36 {sv.namehint = "wireARADDR"} : i8
    %40 = comb.xor %33, %true : i1
    %41 = comb.or %40, %38 : i1
    %42 = comb.mux bin %41, %ARADDR, %36 : i8
    %43 = comb.xor %33, %true : i1
    %44 = comb.or %32, %43 : i1
    %45 = comb.mux bin %44, %RID, %io_channel_ar_bits_id : i4
    %46 = comb.xor %33, %true : i1
    %47 = comb.and %46, %ARREADY : i1
    %48 = comb.or %32, %47 : i1
    %49 = comb.or %33, %RVALID : i1
    %50 = comb.xor %32, %true : i1
    %51 = comb.and %50, %49 : i1
    %52 = comb.and bin %AWREADY, %io_channel_aw_valid : i1
    %53 = comb.extract %io_channel_aw_bits_addr from 0 : (i32) -> i8
    %54 = comb.mux bin %52, %53, %AWADDR : i8
    %55 = comb.mux bin %52, %io_channel_aw_bits_id, %BID : i4
    %56 = comb.xor %52, %true : i1
    %57 = comb.and %56, %AWREADY : i1
    %58 = comb.or %52, %WREADY : i1
    %59 = comb.and bin %WREADY, %io_channel_w_valid : i1
    %60 = comb.xor %59, %true : i1
    %61 = comb.and %60, %58 : i1
    %62 = comb.or %59, %BVALID : i1
    %63 = comb.and bin %io_channel_b_ready, %BVALID : i1
    %64 = comb.or %63, %57 : i1
    %65 = comb.xor %63, %true : i1
    %66 = comb.and %65, %62 : i1
    hw.output %AWREADY, %ARREADY, %WREADY, %BVALID, %BID, %RVALID, %RID, %13 : i1, i1, i1, i1, i4, i1, i4, i64
  }
  hw.module private @Nemu_Uart(in %io_basic_ACLK : !seq.clock, in %io_basic_ARESETn : i1, out io_channel_aw_ready : i1, in %io_channel_aw_valid : i1, in %io_channel_aw_bits_id : i4, out io_channel_ar_ready : i1, in %io_channel_ar_valid : i1, in %io_channel_ar_bits_id : i4, out io_channel_w_ready : i1, in %io_channel_w_valid : i1, in %io_channel_w_bits_data : i64, in %io_channel_b_ready : i1, out io_channel_b_valid : i1, out io_channel_b_bits_id : i4, in %io_channel_r_ready : i1, out io_channel_r_valid : i1, out io_channel_r_bits_id : i4) attributes {emit.fragments = [@PRINTF_COND_FRAGMENT]} {
    %c-2147483646_i32 = hw.constant -2147483646 : i32
    %true = hw.constant true
    %c0_i4 = hw.constant 0 : i4
    %false = hw.constant false
    %0 = seq.from_clock %io_basic_ACLK
    %1 = comb.xor bin %io_basic_ARESETn, %true : i1
    %AWREADY = seq.firreg %25 clock %io_basic_ACLK reset sync %1, %true {firrtl.random_init_start = 0 : ui64, sv.namehint = "AWREADY"} : i1
    %WREADY = seq.firreg %22 clock %io_basic_ACLK reset sync %1, %false {firrtl.random_init_start = 1 : ui64, sv.namehint = "WREADY"} : i1
    %BVALID = seq.firreg %27 clock %io_basic_ACLK reset sync %1, %false {firrtl.random_init_start = 2 : ui64, sv.namehint = "BVALID"} : i1
    %ARREADY = seq.firreg %9 clock %io_basic_ACLK reset sync %1, %true {firrtl.random_init_start = 3 : ui64, sv.namehint = "ARREADY"} : i1
    %RVALID = seq.firreg %12 clock %io_basic_ACLK reset sync %1, %false {firrtl.random_init_start = 4 : ui64, sv.namehint = "RVALID"} : i1
    %RID = seq.firreg %6 clock %io_basic_ACLK reset sync %1, %c0_i4 {firrtl.random_init_start = 5 : ui64, sv.namehint = "RID"} : i4
    %BID = seq.firreg %14 clock %io_basic_ACLK reset sync %1, %c0_i4 {firrtl.random_init_start = 9 : ui64, sv.namehint = "BID"} : i4
    %2 = comb.and bin %io_channel_r_ready, %RVALID : i1
    %3 = comb.and bin %ARREADY, %io_channel_ar_valid : i1
    %4 = comb.xor %3, %true : i1
    %5 = comb.or %2, %4 : i1
    %6 = comb.mux bin %5, %RID, %io_channel_ar_bits_id : i4
    %7 = comb.xor %3, %true : i1
    %8 = comb.and %7, %ARREADY : i1
    %9 = comb.or %2, %8 : i1
    %10 = comb.or %3, %RVALID : i1
    %11 = comb.xor %2, %true : i1
    %12 = comb.and %11, %10 : i1
    %13 = comb.and bin %AWREADY, %io_channel_aw_valid : i1
    %14 = comb.mux bin %13, %io_channel_aw_bits_id, %BID : i4
    %15 = comb.xor %13, %true : i1
    %16 = comb.and %15, %AWREADY : i1
    %17 = comb.or %13, %WREADY : i1
    %18 = comb.and bin %WREADY, %io_channel_w_valid : i1
    %19 = comb.extract %io_channel_w_bits_data from 0 : (i64) -> i8
    %20 = comb.and bin %18, %io_basic_ARESETn : i1
    sv.ifdef  @SYNTHESIS {
    } else {
      sv.always posedge %0 {
        %PRINTF_COND_ = sv.macro.ref.expr @PRINTF_COND_() : () -> i1
        %28 = comb.and bin %PRINTF_COND_, %20 : i1
        sv.if %28 {
          sv.fwrite %c-2147483646_i32, "%c"(%19) : i8
        }
      }
    }
    %21 = comb.xor %18, %true : i1
    %22 = comb.and %21, %17 : i1
    %23 = comb.or %18, %BVALID : i1
    %24 = comb.and bin %io_channel_b_ready, %BVALID : i1
    %25 = comb.or %24, %16 : i1
    %26 = comb.xor %24, %true : i1
    %27 = comb.and %26, %23 : i1
    hw.output %AWREADY, %ARREADY, %WREADY, %BVALID, %BID, %RVALID, %RID : i1, i1, i1, i1, i4, i1, i4
  }
  hw.module private @Zmb_Uart(in %io_basic_ACLK : !seq.clock, in %io_basic_ARESETn : i1, out io_channel_aw_ready : i1, in %io_channel_aw_valid : i1, in %io_channel_aw_bits_id : i4, in %io_channel_aw_bits_addr : i32, out io_channel_ar_ready : i1, in %io_channel_ar_valid : i1, in %io_channel_ar_bits_id : i4, out io_channel_w_ready : i1, in %io_channel_w_valid : i1, in %io_channel_w_bits_data : i64, in %io_channel_b_ready : i1, out io_channel_b_valid : i1, out io_channel_b_bits_id : i4, in %io_channel_r_ready : i1, out io_channel_r_valid : i1, out io_channel_r_bits_id : i4) attributes {emit.fragments = [@PRINTF_COND_FRAGMENT]} {
    %c-2147483646_i32 = hw.constant -2147483646 : i32
    %true = hw.constant true
    %c-4_i4 = hw.constant -4 : i4
    %c0_i4 = hw.constant 0 : i4
    %false = hw.constant false
    %0 = seq.from_clock %io_basic_ACLK
    %1 = comb.xor bin %io_basic_ARESETn, %true : i1
    %AWREADY = seq.firreg %28 clock %io_basic_ACLK reset sync %1, %true {firrtl.random_init_start = 0 : ui64, sv.namehint = "AWREADY"} : i1
    %WREADY = seq.firreg %25 clock %io_basic_ACLK reset sync %1, %false {firrtl.random_init_start = 1 : ui64, sv.namehint = "WREADY"} : i1
    %BVALID = seq.firreg %30 clock %io_basic_ACLK reset sync %1, %false {firrtl.random_init_start = 2 : ui64, sv.namehint = "BVALID"} : i1
    %ARREADY = seq.firreg %9 clock %io_basic_ACLK reset sync %1, %true {firrtl.random_init_start = 3 : ui64, sv.namehint = "ARREADY"} : i1
    %RVALID = seq.firreg %12 clock %io_basic_ACLK reset sync %1, %false {firrtl.random_init_start = 4 : ui64, sv.namehint = "RVALID"} : i1
    %RID = seq.firreg %6 clock %io_basic_ACLK reset sync %1, %c0_i4 {firrtl.random_init_start = 5 : ui64, sv.namehint = "RID"} : i4
    %BID = seq.firreg %16 clock %io_basic_ACLK reset sync %1, %c0_i4 {firrtl.random_init_start = 9 : ui64, sv.namehint = "BID"} : i4
    %AWADDR = seq.firreg %15 clock %io_basic_ACLK reset sync %1, %c0_i4 {firrtl.random_init_start = 17 : ui64} : i4
    %2 = comb.and bin %io_channel_r_ready, %RVALID : i1
    %3 = comb.and bin %ARREADY, %io_channel_ar_valid : i1
    %4 = comb.xor %3, %true : i1
    %5 = comb.or %2, %4 : i1
    %6 = comb.mux bin %5, %RID, %io_channel_ar_bits_id : i4
    %7 = comb.xor %3, %true : i1
    %8 = comb.and %7, %ARREADY : i1
    %9 = comb.or %2, %8 : i1
    %10 = comb.or %3, %RVALID : i1
    %11 = comb.xor %2, %true : i1
    %12 = comb.and %11, %10 : i1
    %13 = comb.and bin %AWREADY, %io_channel_aw_valid : i1
    %14 = comb.extract %io_channel_aw_bits_addr from 0 : (i32) -> i4
    %15 = comb.mux bin %13, %14, %AWADDR : i4
    %16 = comb.mux bin %13, %io_channel_aw_bits_id, %BID : i4
    %17 = comb.xor %13, %true : i1
    %18 = comb.and %17, %AWREADY : i1
    %19 = comb.or %13, %WREADY : i1
    %20 = comb.and bin %WREADY, %io_channel_w_valid : i1
    %21 = comb.icmp bin ne %AWADDR, %c-4_i4 : i4
    %22 = comb.extract %io_channel_w_bits_data from 32 : (i64) -> i8
    %23 = comb.and bin %20, %21, %io_basic_ARESETn : i1
    sv.ifdef  @SYNTHESIS {
    } else {
      sv.always posedge %0 {
        %PRINTF_COND_ = sv.macro.ref.expr @PRINTF_COND_() : () -> i1
        %31 = comb.and bin %PRINTF_COND_, %23 : i1
        sv.if %31 {
          sv.fwrite %c-2147483646_i32, "%c"(%22) : i8
        }
      }
    }
    %24 = comb.xor %20, %true : i1
    %25 = comb.and %24, %19 : i1
    %26 = comb.or %20, %BVALID : i1
    %27 = comb.and bin %io_channel_b_ready, %BVALID : i1
    %28 = comb.or %27, %18 : i1
    %29 = comb.xor %27, %true : i1
    %30 = comb.and %29, %26 : i1
    hw.output %AWREADY, %ARREADY, %WREADY, %BVALID, %BID, %RVALID, %RID : i1, i1, i1, i1, i4, i1, i4
  }
  hw.module private @Queue(in %clock : !seq.clock, in %reset : i1, out io_enq_ready : i1, in %io_enq_valid : i1, in %io_enq_bits : i64, in %io_deq_ready : i1, out io_deq_valid : i1, out io_deq_bits : i64) {
    %c1_i3 = hw.constant 1 : i3
    %false = hw.constant false
    %true = hw.constant true
    %c0_i3 = hw.constant 0 : i3
    %ram = seq.firmem 0, 1, undefined, port_order : <8 x 64>
    seq.firmem.write_port %ram[%enq_ptr_value] = %io_enq_bits, clock %clock enable %5 : <8 x 64>
    %0 = seq.firmem.read_port %ram[%deq_ptr_value], clock %clock {sv.namehint = "io_deq_bits"} : <8 x 64>
    %enq_ptr_value = seq.firreg %8 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 0 : ui64} : i3
    %deq_ptr_value = seq.firreg %10 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 3 : ui64} : i3
    %maybe_full = seq.firreg %12 clock %clock reset sync %reset, %false {firrtl.random_init_start = 6 : ui64} : i1
    %1 = comb.icmp bin eq %enq_ptr_value, %deq_ptr_value {sv.namehint = "ptr_match"} : i3
    %2 = comb.xor bin %maybe_full, %true {sv.namehint = "_empty_T"} : i1
    %3 = comb.and bin %1, %2 {sv.namehint = "empty"} : i1
    %4 = comb.and bin %1, %maybe_full {sv.namehint = "full"} : i1
    %5 = comb.and bin %14, %io_enq_valid {sv.namehint = "do_enq"} : i1
    %6 = comb.and bin %io_deq_ready, %13 {sv.namehint = "do_deq"} : i1
    %7 = comb.add bin %enq_ptr_value, %c1_i3 {sv.namehint = "_value_T"} : i3
    %8 = comb.mux bin %5, %7, %enq_ptr_value : i3
    %9 = comb.add bin %deq_ptr_value, %c1_i3 {sv.namehint = "_value_T_2"} : i3
    %10 = comb.mux bin %6, %9, %deq_ptr_value : i3
    %11 = comb.icmp bin eq %5, %6 : i1
    %12 = comb.mux bin %11, %maybe_full, %5 : i1
    %13 = comb.xor bin %3, %true {sv.namehint = "io_deq_valid"} : i1
    %14 = comb.xor bin %4, %true {sv.namehint = "io_enq_ready"} : i1
    hw.output %14, %13, %0 : i1, i1, i64
  }
  hw.module private @DMAC(in %io_toCPU_aw_ready : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__0__io_toCPU_aw_ready>}, out io_toCPU_aw_valid : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__1__io_toCPU_aw_valid>}, out io_toCPU_aw_bits_id : i4 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__2__io_toCPU_aw_bits_id>}, out io_toCPU_aw_bits_addr : i32 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__3__io_toCPU_aw_bits_addr>}, out io_toCPU_aw_bits_len : i8 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__4__io_toCPU_aw_bits_len>}, out io_toCPU_aw_bits_size : i3 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__5__io_toCPU_aw_bits_size>}, out io_toCPU_aw_bits_burst : i2 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__6__io_toCPU_aw_bits_burst>}, in %io_toCPU_ar_ready : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__13__io_toCPU_ar_ready>}, out io_toCPU_ar_valid : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__14__io_toCPU_ar_valid>}, out io_toCPU_ar_bits_id : i4 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__15__io_toCPU_ar_bits_id>}, out io_toCPU_ar_bits_addr : i32 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__16__io_toCPU_ar_bits_addr>}, out io_toCPU_ar_bits_len : i8 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__17__io_toCPU_ar_bits_len>}, out io_toCPU_ar_bits_size : i3 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__18__io_toCPU_ar_bits_size>}, out io_toCPU_ar_bits_burst : i2 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__19__io_toCPU_ar_bits_burst>}, in %io_toCPU_w_ready : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__26__io_toCPU_w_ready>}, out io_toCPU_w_valid : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__27__io_toCPU_w_valid>}, out io_toCPU_w_bits_data : i64 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__28__io_toCPU_w_bits_data>}, out io_toCPU_w_bits_strb : i8 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__29__io_toCPU_w_bits_strb>}, out io_toCPU_w_bits_last : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__30__io_toCPU_w_bits_last>}, out io_toCPU_b_ready : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__32__io_toCPU_b_ready>}, in %io_toCPU_b_valid : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__33__io_toCPU_b_valid>}, in %io_toCPU_b_bits_id : i4 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__34__io_toCPU_b_bits_id>}, in %io_toCPU_b_bits_resp : i2 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__35__io_toCPU_b_bits_resp>}, out io_toCPU_r_ready : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__37__io_toCPU_r_ready>}, in %io_toCPU_r_valid : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__38__io_toCPU_r_valid>}, in %io_toCPU_r_bits_id : i4 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__39__io_toCPU_r_bits_id>}, in %io_toCPU_r_bits_data : i64 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__40__io_toCPU_r_bits_data>}, in %io_toCPU_r_bits_resp : i2 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__41__io_toCPU_r_bits_resp>}, in %io_toCPU_r_bits_last : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__42__io_toCPU_r_bits_last>}, in %io_fromCPU_basic_ACLK : !seq.clock {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__44__io_fromCPU_basic_ACLK>}, in %io_fromCPU_basic_ARESETn : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__45__io_fromCPU_basic_ARESETn>}, out io_fromCPU_channel_aw_ready : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__46__io_fromCPU_channel_aw_ready>}, in %io_fromCPU_channel_aw_valid : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__47__io_fromCPU_channel_aw_valid>}, in %io_fromCPU_channel_aw_bits_id : i4 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__48__io_fromCPU_channel_aw_bits_id>}, in %io_fromCPU_channel_aw_bits_addr : i32 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__49__io_fromCPU_channel_aw_bits_addr>}, in %io_fromCPU_channel_aw_bits_len : i8 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__50__io_fromCPU_channel_aw_bits_len>}, in %io_fromCPU_channel_aw_bits_size : i3 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__51__io_fromCPU_channel_aw_bits_size>}, in %io_fromCPU_channel_aw_bits_burst : i2 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__52__io_fromCPU_channel_aw_bits_burst>}, out io_fromCPU_channel_ar_ready : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__59__io_fromCPU_channel_ar_ready>}, in %io_fromCPU_channel_ar_valid : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__60__io_fromCPU_channel_ar_valid>}, in %io_fromCPU_channel_ar_bits_id : i4 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__61__io_fromCPU_channel_ar_bits_id>}, in %io_fromCPU_channel_ar_bits_addr : i32 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__62__io_fromCPU_channel_ar_bits_addr>}, in %io_fromCPU_channel_ar_bits_len : i8 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__63__io_fromCPU_channel_ar_bits_len>}, in %io_fromCPU_channel_ar_bits_size : i3 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__64__io_fromCPU_channel_ar_bits_size>}, in %io_fromCPU_channel_ar_bits_burst : i2 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__65__io_fromCPU_channel_ar_bits_burst>}, out io_fromCPU_channel_w_ready : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__72__io_fromCPU_channel_w_ready>}, in %io_fromCPU_channel_w_valid : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__73__io_fromCPU_channel_w_valid>}, in %io_fromCPU_channel_w_bits_data : i64 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__74__io_fromCPU_channel_w_bits_data>}, in %io_fromCPU_channel_w_bits_strb : i8 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__75__io_fromCPU_channel_w_bits_strb>}, in %io_fromCPU_channel_w_bits_last : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__76__io_fromCPU_channel_w_bits_last>}, in %io_fromCPU_channel_b_ready : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__78__io_fromCPU_channel_b_ready>}, out io_fromCPU_channel_b_valid : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__79__io_fromCPU_channel_b_valid>}, out io_fromCPU_channel_b_bits_id : i4 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__80__io_fromCPU_channel_b_bits_id>}, out io_fromCPU_channel_b_bits_resp : i2 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__81__io_fromCPU_channel_b_bits_resp>}, in %io_fromCPU_channel_r_ready : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__83__io_fromCPU_channel_r_ready>}, out io_fromCPU_channel_r_valid : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__84__io_fromCPU_channel_r_valid>}, out io_fromCPU_channel_r_bits_id : i4 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__85__io_fromCPU_channel_r_bits_id>}, out io_fromCPU_channel_r_bits_data : i64 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__86__io_fromCPU_channel_r_bits_data>}, out io_fromCPU_channel_r_bits_resp : i2 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__87__io_fromCPU_channel_r_bits_resp>}, out io_fromCPU_channel_r_bits_last : i1 {hw.exportPort = #hw<innerSym@__DMAC__DONTTOUCH__88__io_fromCPU_channel_r_bits_last>}) {
    %c0_i31 = hw.constant 0 : i31
    %c-1_i32 = hw.constant -1 : i32
    %c1342177304_i32 = hw.constant 1342177304 : i32
    %c1342177296_i32 = hw.constant 1342177296 : i32
    %c1342177288_i32 = hw.constant 1342177288 : i32
    %c1342177280_i32 = hw.constant 1342177280 : i32
    %false = hw.constant false
    %c0_i64 = hw.constant 0 : i64
    %c0_i32 = hw.constant 0 : i32
    %c0_i4 = hw.constant 0 : i4
    %c-1_i8 = hw.constant -1 : i8
    %c1_i2 = hw.constant 1 : i2
    %c2_i4 = hw.constant 2 : i4
    %c3_i3 = hw.constant 3 : i3
    %true = hw.constant true
    %c0_i2 = hw.constant 0 : i2
    %0 = comb.xor bin %io_fromCPU_basic_ARESETn, %true : i1
    %regRAddr = seq.firreg %69 clock %io_fromCPU_basic_ACLK reset sync %0, %c0_i64 {firrtl.random_init_start = 0 : ui64} : i64
    %regWAddr = seq.firreg %74 clock %io_fromCPU_basic_ACLK reset sync %0, %c0_i64 {firrtl.random_init_start = 64 : ui64} : i64
    %regTransLen = seq.firreg %79 clock %io_fromCPU_basic_ACLK reset sync %0, %c0_i64 {firrtl.random_init_start = 128 : ui64} : i64
    %regFree = seq.firreg %85 clock %io_fromCPU_basic_ACLK reset sync %0, %true {firrtl.random_init_start = 192 : ui64} : i1
    %fifo.io_enq_ready, %fifo.io_deq_valid, %fifo.io_deq_bits = hw.instance "fifo" @Queue(clock: %io_fromCPU_basic_ACLK: !seq.clock, reset: %0: i1, io_enq_valid: %1: i1, io_enq_bits: %io_toCPU_r_bits_data: i64, io_deq_ready: %2: i1) -> (io_enq_ready: i1, io_deq_valid: i1, io_deq_bits: i64) {sv.namehint = "io_toCPU_w_bits_data"}
    %1 = comb.and bin %4, %io_toCPU_r_valid {sv.namehint = "fifo.io_enq_valid"} : i1
    %2 = comb.and bin %io_toCPU_w_ready, %3 {sv.namehint = "fifo.io_deq_ready"} : i1
    %AWVALID = seq.firreg %101 clock %io_fromCPU_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 193 : ui64, sv.namehint = "AWVALID"} : i1
    %WVALID = seq.firreg %104 clock %io_fromCPU_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 194 : ui64} : i1
    %3 = comb.and bin %WVALID, %fifo.io_deq_valid {sv.namehint = "io_toCPU_w_valid"} : i1
    %BREADY = seq.firreg %22 clock %io_fromCPU_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 195 : ui64, sv.namehint = "BREADY"} : i1
    %ARVALID = seq.firreg %98 clock %io_fromCPU_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 196 : ui64, sv.namehint = "ARVALID"} : i1
    %RREADY = seq.firreg %31 clock %io_fromCPU_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 197 : ui64} : i1
    %4 = comb.and bin %RREADY, %fifo.io_enq_ready {sv.namehint = "io_toCPU_r_ready"} : i1
    %originLen = seq.firreg %91 clock %io_fromCPU_basic_ACLK reset sync %0, %c0_i32 {firrtl.random_init_start = 198 : ui64} : i32
    %len = seq.firreg %95 clock %io_fromCPU_basic_ACLK reset sync %0, %c0_i32 {firrtl.random_init_start = 230 : ui64} : i32
    %5 = comb.and bin %io_toCPU_aw_ready, %AWVALID : i1
    %6 = comb.xor %5, %true : i1
    %7 = comb.and %6, %AWVALID : i1
    %8 = comb.or %5, %BREADY : i1
    %9 = comb.icmp bin eq %len, %c0_i32 : i32
    %10 = comb.and bin %2, %9 : i1
    %11 = comb.xor %10, %true : i1
    %12 = comb.and %11, %WVALID : i1
    %13 = comb.or %9, %5, %BREADY : i1
    %14 = comb.mux bin %2, %13, %8 : i1
    %15 = comb.and %2, %9 {sv.namehint = "wireWLAST"} : i1
    %16 = comb.add %len, %c-1_i32 {sv.namehint = "_len_T"} : i32
    %17 = comb.xor %2, %true : i1
    %18 = comb.or %17, %9 : i1
    %19 = comb.mux bin %18, %len, %16 : i32
    %20 = comb.and bin %BREADY, %io_toCPU_b_valid : i1
    %21 = comb.xor %20, %true : i1
    %22 = comb.and %21, %14 : i1
    %23 = comb.or %20, %regFree : i1
    %24 = comb.xor %io_toCPU_r_bits_last, %true : i1
    %25 = comb.and %24, %RREADY : i1
    %26 = comb.and bin %io_toCPU_ar_ready, %ARVALID : i1
    %27 = comb.xor %26, %true : i1
    %28 = comb.or %1, %27 : i1
    %29 = comb.and %28, %ARVALID : i1
    %30 = comb.or %26, %RREADY : i1
    %31 = comb.mux bin %1, %25, %30 : i1
    %32 = comb.extract %regWAddr from 0 {sv.namehint = "io_toCPU_aw_bits_addr"} : (i64) -> i32
    %33 = comb.extract %originLen from 0 {sv.namehint = "io_toCPU_ar_bits_len"} : (i32) -> i8
    %34 = comb.extract %regRAddr from 0 {sv.namehint = "io_toCPU_ar_bits_addr"} : (i64) -> i32
    %AWREADY = seq.firreg %109 clock %io_fromCPU_basic_ACLK reset sync %0, %true {firrtl.random_init_start = 262 : ui64, sv.namehint = "AWREADY"} : i1
    %WREADY = seq.firreg %106 clock %io_fromCPU_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 263 : ui64, sv.namehint = "WREADY"} : i1
    %BVALID = seq.firreg %111 clock %io_fromCPU_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 264 : ui64, sv.namehint = "BVALID"} : i1
    %ARREADY = seq.firreg %56 clock %io_fromCPU_basic_ACLK reset sync %0, %true {firrtl.random_init_start = 265 : ui64, sv.namehint = "ARREADY"} : i1
    %RVALID = seq.firreg %59 clock %io_fromCPU_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 266 : ui64, sv.namehint = "RVALID"} : i1
    %RID = seq.firreg %53 clock %io_fromCPU_basic_ACLK reset sync %0, %c0_i4 {firrtl.random_init_start = 267 : ui64, sv.namehint = "RID"} : i4
    %BID = seq.firreg %62 clock %io_fromCPU_basic_ACLK reset sync %0, %c0_i4 {firrtl.random_init_start = 271 : ui64, sv.namehint = "BID"} : i4
    %AWADDR = seq.firreg %61 clock %io_fromCPU_basic_ACLK reset sync %0, %c0_i32 {firrtl.random_init_start = 275 : ui64} : i32
    %RDATA = seq.firreg %50 clock %io_fromCPU_basic_ACLK reset sync %0, %c0_i64 {firrtl.random_init_start = 307 : ui64, sv.namehint = "RDATA"} : i64
    %35 = comb.icmp bin eq %io_fromCPU_channel_ar_bits_addr, %c1342177280_i32 : i32
    %36 = comb.icmp bin eq %io_fromCPU_channel_ar_bits_addr, %c1342177288_i32 : i32
    %37 = comb.icmp bin eq %io_fromCPU_channel_ar_bits_addr, %c1342177296_i32 : i32
    %38 = comb.extract %regTransLen from 0 : (i64) -> i32
    %39 = comb.icmp bin eq %io_fromCPU_channel_ar_bits_addr, %c1342177304_i32 : i32
    %40 = comb.concat %c0_i31, %regFree : i31, i1
    %41 = comb.mux bin %39, %40, %c0_i32 : i32
    %42 = comb.mux bin %37, %38, %41 : i32
    %43 = comb.mux bin %36, %32, %42 : i32
    %44 = comb.mux bin %35, %34, %43 {sv.namehint = "wireRawRData"} : i32
    %45 = comb.and bin %io_fromCPU_channel_r_ready, %RVALID : i1
    %46 = comb.and bin %ARREADY, %io_fromCPU_channel_ar_valid : i1
    %47 = comb.concat %c0_i32, %44 : i32, i32
    %48 = comb.xor %46, %true : i1
    %49 = comb.or %45, %48 : i1
    %50 = comb.mux bin %49, %RDATA, %47 : i64
    %51 = comb.xor %46, %true : i1
    %52 = comb.or %45, %51 : i1
    %53 = comb.mux bin %52, %RID, %io_fromCPU_channel_ar_bits_id : i4
    %54 = comb.xor %46, %true : i1
    %55 = comb.and %54, %ARREADY : i1
    %56 = comb.or %45, %55 : i1
    %57 = comb.or %46, %RVALID : i1
    %58 = comb.xor %45, %true : i1
    %59 = comb.and %58, %57 : i1
    %60 = comb.and bin %AWREADY, %io_fromCPU_channel_aw_valid : i1
    %61 = comb.mux bin %60, %io_fromCPU_channel_aw_bits_addr, %AWADDR : i32
    %62 = comb.mux bin %60, %io_fromCPU_channel_aw_bits_id, %BID : i4
    %63 = comb.xor %60, %true : i1
    %64 = comb.and %63, %AWREADY : i1
    %65 = comb.or %60, %WREADY : i1
    %66 = comb.and bin %WREADY, %io_fromCPU_channel_w_valid : i1
    %67 = comb.icmp bin eq %AWADDR, %c1342177280_i32 : i32
    %68 = comb.and bin %66, %67 : i1
    %69 = comb.mux bin %68, %io_fromCPU_channel_w_bits_data, %regRAddr : i64
    %70 = comb.icmp bin eq %AWADDR, %c1342177288_i32 : i32
    %71 = comb.xor %70, %true : i1
    %72 = comb.xor %66, %true : i1
    %73 = comb.or %72, %67, %71 : i1
    %74 = comb.mux bin %73, %regWAddr, %io_fromCPU_channel_w_bits_data : i64
    %75 = comb.icmp bin eq %AWADDR, %c1342177296_i32 : i32
    %76 = comb.xor %75, %true : i1
    %77 = comb.xor %66, %true : i1
    %78 = comb.or %77, %67, %70, %76 : i1
    %79 = comb.mux bin %78, %regTransLen, %io_fromCPU_channel_w_bits_data : i64
    %80 = comb.icmp bin eq %AWADDR, %c1342177304_i32 : i32
    %81 = comb.xor %80, %true : i1
    %82 = comb.or bin %67, %70, %75 : i1
    %83 = comb.xor %66, %true : i1
    %84 = comb.or %83, %82, %81 : i1
    %85 = comb.and %84, %23 : i1
    %86 = comb.extract %regTransLen from 0 : (i64) -> i32
    %87 = comb.add %86, %c-1_i32 {sv.namehint = "_len_T_2"} : i32
    %88 = comb.xor %80, %true : i1
    %89 = comb.xor %66, %true : i1
    %90 = comb.or %89, %82, %88 : i1
    %91 = comb.mux bin %90, %originLen, %87 : i32
    %92 = comb.xor %80, %true : i1
    %93 = comb.xor %66, %true : i1
    %94 = comb.or %93, %82, %92 : i1
    %95 = comb.mux bin %94, %19, %87 : i32
    %96 = comb.xor %82, %true : i1
    %97 = comb.and %66, %96, %80 : i1
    %98 = comb.or %97, %29 : i1
    %99 = comb.xor %82, %true : i1
    %100 = comb.and %66, %99, %80 : i1
    %101 = comb.or %100, %7 : i1
    %102 = comb.xor %82, %true : i1
    %103 = comb.and %66, %102, %80 : i1
    %104 = comb.or %103, %12 : i1
    %105 = comb.xor %66, %true : i1
    %106 = comb.and %105, %65 : i1
    %107 = comb.or %66, %BVALID : i1
    %108 = comb.and bin %io_fromCPU_channel_b_ready, %BVALID : i1
    %109 = comb.or %108, %64 : i1
    %110 = comb.xor %108, %true : i1
    %111 = comb.and %110, %107 : i1
    hw.output %AWVALID, %c2_i4, %32, %33, %c3_i3, %c1_i2, %ARVALID, %c2_i4, %34, %33, %c3_i3, %c1_i2, %3, %fifo.io_deq_bits, %c-1_i8, %15, %BREADY, %4, %AWREADY, %ARREADY, %WREADY, %BVALID, %BID, %c0_i2, %RVALID, %RID, %RDATA, %c0_i2, %true : i1, i4, i32, i8, i3, i2, i1, i4, i32, i8, i3, i2, i1, i64, i8, i1, i1, i1, i1, i1, i1, i1, i4, i2, i1, i4, i64, i2, i1
  }
  hw.module private @ROUTER(in %io_basic_ACLK : !seq.clock, in %io_basic_ARESETn : i1, out io_input_aw_ready : i1, in %io_input_aw_valid : i1, in %io_input_aw_bits_id : i4, in %io_input_aw_bits_addr : i32, in %io_input_aw_bits_len : i8, in %io_input_aw_bits_size : i3, in %io_input_aw_bits_burst : i2, out io_input_ar_ready : i1, in %io_input_ar_valid : i1, in %io_input_ar_bits_id : i4, in %io_input_ar_bits_addr : i32, in %io_input_ar_bits_len : i8, in %io_input_ar_bits_size : i3, in %io_input_ar_bits_burst : i2, out io_input_w_ready : i1, in %io_input_w_valid : i1, in %io_input_w_bits_data : i64, in %io_input_w_bits_strb : i8, in %io_input_w_bits_last : i1, in %io_input_b_ready : i1, out io_input_b_valid : i1, out io_input_b_bits_id : i4, out io_input_b_bits_resp : i2, in %io_input_r_ready : i1, out io_input_r_valid : i1, out io_input_r_bits_id : i4, out io_input_r_bits_data : i64, out io_input_r_bits_resp : i2, out io_input_r_bits_last : i1, in %io_DramIO_aw_ready : i1, out io_DramIO_aw_valid : i1, out io_DramIO_aw_bits_id : i4, out io_DramIO_aw_bits_addr : i32, out io_DramIO_aw_bits_len : i8, out io_DramIO_aw_bits_size : i3, in %io_DramIO_ar_ready : i1, out io_DramIO_ar_valid : i1, out io_DramIO_ar_bits_id : i4, out io_DramIO_ar_bits_addr : i32, out io_DramIO_ar_bits_len : i8, out io_DramIO_ar_bits_size : i3, in %io_DramIO_w_ready : i1, out io_DramIO_w_valid : i1, out io_DramIO_w_bits_data : i64, out io_DramIO_w_bits_strb : i8, out io_DramIO_b_ready : i1, in %io_DramIO_b_valid : i1, in %io_DramIO_b_bits_id : i4, out io_DramIO_r_ready : i1, in %io_DramIO_r_valid : i1, in %io_DramIO_r_bits_id : i4, in %io_DramIO_r_bits_data : i64, in %io_DramIO_r_bits_last : i1, in %io_UartIO_aw_ready : i1, out io_UartIO_aw_valid : i1, out io_UartIO_aw_bits_id : i4, out io_UartIO_aw_bits_addr : i32, in %io_UartIO_ar_ready : i1, out io_UartIO_ar_valid : i1, out io_UartIO_ar_bits_id : i4, out io_UartIO_ar_bits_addr : i32, in %io_UartIO_w_ready : i1, out io_UartIO_w_valid : i1, out io_UartIO_w_bits_data : i64, out io_UartIO_b_ready : i1, in %io_UartIO_b_valid : i1, in %io_UartIO_b_bits_id : i4, out io_UartIO_r_ready : i1, in %io_UartIO_r_valid : i1, in %io_UartIO_r_bits_id : i4, in %io_UartIO_r_bits_data : i64, in %io_SpiIO_aw_ready : i1, out io_SpiIO_aw_valid : i1, out io_SpiIO_aw_bits_id : i4, out io_SpiIO_aw_bits_addr : i32, out io_SpiIO_aw_bits_size : i3, in %io_SpiIO_ar_ready : i1, out io_SpiIO_ar_valid : i1, out io_SpiIO_ar_bits_id : i4, out io_SpiIO_ar_bits_addr : i32, out io_SpiIO_ar_bits_size : i3, in %io_SpiIO_w_ready : i1, out io_SpiIO_w_valid : i1, out io_SpiIO_w_bits_data : i64, out io_SpiIO_b_ready : i1, in %io_SpiIO_b_valid : i1, in %io_SpiIO_b_bits_id : i4, out io_SpiIO_r_ready : i1, in %io_SpiIO_r_valid : i1, in %io_SpiIO_r_bits_id : i4, in %io_SpiIO_r_bits_data : i64, in %io_Nemu_UartIO_aw_ready : i1, out io_Nemu_UartIO_aw_valid : i1, out io_Nemu_UartIO_aw_bits_id : i4, in %io_Nemu_UartIO_ar_ready : i1, out io_Nemu_UartIO_ar_valid : i1, out io_Nemu_UartIO_ar_bits_id : i4, in %io_Nemu_UartIO_w_ready : i1, out io_Nemu_UartIO_w_valid : i1, out io_Nemu_UartIO_w_bits_data : i64, out io_Nemu_UartIO_b_ready : i1, in %io_Nemu_UartIO_b_valid : i1, in %io_Nemu_UartIO_b_bits_id : i4, out io_Nemu_UartIO_r_ready : i1, in %io_Nemu_UartIO_r_valid : i1, in %io_Nemu_UartIO_r_bits_id : i4, in %io_Zmb_UartIO_aw_ready : i1, out io_Zmb_UartIO_aw_valid : i1, out io_Zmb_UartIO_aw_bits_id : i4, out io_Zmb_UartIO_aw_bits_addr : i32, in %io_Zmb_UartIO_ar_ready : i1, out io_Zmb_UartIO_ar_valid : i1, out io_Zmb_UartIO_ar_bits_id : i4, in %io_Zmb_UartIO_w_ready : i1, out io_Zmb_UartIO_w_valid : i1, out io_Zmb_UartIO_w_bits_data : i64, out io_Zmb_UartIO_b_ready : i1, in %io_Zmb_UartIO_b_valid : i1, in %io_Zmb_UartIO_b_bits_id : i4, out io_Zmb_UartIO_r_ready : i1, in %io_Zmb_UartIO_r_valid : i1, in %io_Zmb_UartIO_r_bits_id : i4, in %io_Dmac_aw_ready : i1, out io_Dmac_aw_valid : i1, out io_Dmac_aw_bits_id : i4, out io_Dmac_aw_bits_addr : i32, out io_Dmac_aw_bits_len : i8, out io_Dmac_aw_bits_size : i3, out io_Dmac_aw_bits_burst : i2, in %io_Dmac_ar_ready : i1, out io_Dmac_ar_valid : i1, out io_Dmac_ar_bits_id : i4, out io_Dmac_ar_bits_addr : i32, out io_Dmac_ar_bits_len : i8, out io_Dmac_ar_bits_size : i3, out io_Dmac_ar_bits_burst : i2, in %io_Dmac_w_ready : i1, out io_Dmac_w_valid : i1, out io_Dmac_w_bits_data : i64, out io_Dmac_w_bits_strb : i8, out io_Dmac_w_bits_last : i1, out io_Dmac_b_ready : i1, in %io_Dmac_b_valid : i1, in %io_Dmac_b_bits_id : i4, in %io_Dmac_b_bits_resp : i2, out io_Dmac_r_ready : i1, in %io_Dmac_r_valid : i1, in %io_Dmac_r_bits_id : i4, in %io_Dmac_r_bits_data : i64, in %io_Dmac_r_bits_resp : i2, in %io_Dmac_r_bits_last : i1, in %io_SdIO_aw_ready : i1, out io_SdIO_aw_valid : i1, out io_SdIO_aw_bits_id : i4, out io_SdIO_aw_bits_addr : i32, in %io_SdIO_ar_ready : i1, out io_SdIO_ar_valid : i1, out io_SdIO_ar_bits_id : i4, out io_SdIO_ar_bits_addr : i32, in %io_SdIO_w_ready : i1, out io_SdIO_w_valid : i1, out io_SdIO_w_bits_data : i64, out io_SdIO_b_ready : i1, in %io_SdIO_b_valid : i1, in %io_SdIO_b_bits_id : i4, out io_SdIO_r_ready : i1, in %io_SdIO_r_valid : i1, in %io_SdIO_r_bits_id : i4, in %io_SdIO_r_bits_data : i64) {
    %c33685503_i32 = hw.constant 33685503 : i32
    %c1342177279_i32 = hw.constant 1342177279 : i32
    %c1080033279_i32 = hw.constant 1080033279 : i32
    %c33619967_i32 = hw.constant 33619967 : i32
    %c805306367_i32 = hw.constant 805306367 : i32
    %c0_i4 = hw.constant 0 : i4
    %c33689600_i32 = hw.constant 33689600 : i32
    %c1342181376_i32 = hw.constant 1342181376 : i32
    %c1080037376_i32 = hw.constant 1080037376 : i32
    %c33619969_i32 = hw.constant 33619969 : i32
    %c1073741824_i32 = hw.constant 1073741824 : i32
    %c268439552_i32 = hw.constant 268439552 : i32
    %false = hw.constant false
    %c0_i3 = hw.constant 0 : i3
    %c1_i3 = hw.constant 1 : i3
    %c2_i3 = hw.constant 2 : i3
    %c3_i3 = hw.constant 3 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c-2_i3 = hw.constant -2 : i3
    %c0_i64 = hw.constant 0 : i64
    %true = hw.constant true
    %c0_i2 = hw.constant 0 : i2
    %0 = comb.xor bin %io_basic_ARESETn, %true : i1
    %AWREADY = seq.firreg %224 clock %io_basic_ACLK reset sync %0, %true {firrtl.random_init_start = 0 : ui64} : i1
    %WREADY = seq.firreg %225 clock %io_basic_ACLK reset sync %0, %true {firrtl.random_init_start = 1 : ui64} : i1
    %BVALID = seq.firreg %227 clock %io_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 2 : ui64} : i1
    %ARREADY = seq.firreg %209 clock %io_basic_ACLK reset sync %0, %true {firrtl.random_init_start = 3 : ui64} : i1
    %RVALID = seq.firreg %211 clock %io_basic_ACLK reset sync %0, %false {firrtl.random_init_start = 4 : ui64} : i1
    %rdevice = seq.firreg %214 clock %io_basic_ACLK reset sync %0, %c0_i3 {firrtl.random_init_start = 5 : ui64} : i3
    %wdevice = seq.firreg %218 clock %io_basic_ACLK reset sync %0, %c0_i3 {firrtl.random_init_start = 8 : ui64} : i3
    %1 = comb.icmp bin eq %197, %c0_i3 : i3
    %2 = comb.and bin %1, %ARREADY : i1
    %3 = comb.and %2, %io_input_ar_valid {sv.namehint = "io_DramIO_ar_valid"} : i1
    %4 = comb.and %2, %io_DramIO_ar_ready : i1
    %5 = comb.icmp bin eq %rdevice, %c0_i3 : i3
    %6 = comb.and %5, %io_input_r_ready {sv.namehint = "io_DramIO_r_ready"} : i1
    %7 = comb.xor %5, %true : i1
    %8 = comb.and %5, %RVALID, %io_DramIO_r_valid : i1
    %9 = comb.icmp bin eq %201, %c0_i3 : i3
    %10 = comb.and bin %9, %AWREADY : i1
    %11 = comb.and %10, %io_input_aw_valid {sv.namehint = "io_DramIO_aw_valid"} : i1
    %12 = comb.and %10, %io_input_aw_valid, %io_DramIO_aw_ready : i1
    %13 = comb.and bin %9, %WREADY : i1
    %14 = comb.and %13, %io_input_w_valid {sv.namehint = "io_DramIO_w_valid"} : i1
    %15 = comb.and %13, %io_input_w_valid, %io_DramIO_w_ready : i1
    %16 = comb.icmp bin eq %wdevice, %c0_i3 : i3
    %17 = comb.and %16, %io_input_b_ready {sv.namehint = "io_DramIO_b_ready"} : i1
    %18 = comb.and %16, %BVALID, %io_DramIO_b_valid : i1
    %19 = comb.icmp bin eq %197, %c1_i3 : i3
    %20 = comb.and bin %19, %ARREADY : i1
    %21 = comb.and %20, %io_input_ar_valid {sv.namehint = "io_UartIO_ar_valid"} : i1
    %22 = comb.mux bin %20, %io_UartIO_ar_ready, %4 : i1
    %23 = comb.icmp bin eq %rdevice, %c1_i3 : i3
    %24 = comb.and %23, %io_input_r_ready {sv.namehint = "io_UartIO_r_ready"} : i1
    %25 = comb.and bin %RVALID, %io_UartIO_r_valid {sv.namehint = "_io_input_r_valid_T_1"} : i1
    %26 = comb.icmp bin eq %201, %c1_i3 : i3
    %27 = comb.and bin %26, %AWREADY : i1
    %28 = comb.and %27, %io_input_aw_valid {sv.namehint = "io_UartIO_aw_valid"} : i1
    %29 = comb.and bin %io_input_aw_valid, %io_UartIO_aw_ready {sv.namehint = "_io_input_aw_ready_T_1"} : i1
    %30 = comb.mux bin %27, %29, %12 : i1
    %31 = comb.and bin %26, %WREADY : i1
    %32 = comb.and %31, %io_input_w_valid {sv.namehint = "io_UartIO_w_valid"} : i1
    %33 = comb.and bin %io_input_w_valid, %io_UartIO_w_ready {sv.namehint = "_io_input_w_ready_T_1"} : i1
    %34 = comb.mux bin %31, %33, %15 : i1
    %35 = comb.icmp bin eq %wdevice, %c1_i3 : i3
    %36 = comb.and %35, %io_input_b_ready {sv.namehint = "io_UartIO_b_ready"} : i1
    %37 = comb.and bin %BVALID, %io_UartIO_b_valid {sv.namehint = "_io_input_b_valid_T_1"} : i1
    %38 = comb.extract %io_input_ar_bits_addr from 28 : (i32) -> i4
    %39 = comb.icmp bin ne %38, %c0_i4 : i4
    %40 = comb.icmp bin ult %io_input_ar_bits_addr, %c268439552_i32 : i32
    %41 = comb.and bin %39, %40 : i1
    %42 = comb.concat %c0_i2, %41 : i2, i1
    %43 = comb.extract %io_input_aw_bits_addr from 28 : (i32) -> i4
    %44 = comb.icmp bin ne %43, %c0_i4 : i4
    %45 = comb.icmp bin ult %io_input_aw_bits_addr, %c268439552_i32 : i32
    %46 = comb.and bin %44, %45 : i1
    %47 = comb.concat %c0_i2, %46 : i2, i1
    %48 = comb.icmp bin eq %197, %c2_i3 : i3
    %49 = comb.and bin %48, %ARREADY : i1
    %50 = comb.and %49, %io_input_ar_valid {sv.namehint = "io_SpiIO_ar_valid"} : i1
    %51 = comb.mux bin %49, %io_SpiIO_ar_ready, %22 : i1
    %52 = comb.icmp bin eq %rdevice, %c2_i3 : i3
    %53 = comb.and %52, %io_input_r_ready {sv.namehint = "io_SpiIO_r_ready"} : i1
    %54 = comb.and bin %RVALID, %io_SpiIO_r_valid {sv.namehint = "_io_input_r_valid_T_2"} : i1
    %55 = comb.icmp bin eq %201, %c2_i3 : i3
    %56 = comb.and bin %55, %AWREADY : i1
    %57 = comb.and %56, %io_input_aw_valid {sv.namehint = "io_SpiIO_aw_valid"} : i1
    %58 = comb.and bin %io_input_aw_valid, %io_SpiIO_aw_ready {sv.namehint = "_io_input_aw_ready_T_2"} : i1
    %59 = comb.mux bin %56, %58, %30 : i1
    %60 = comb.and bin %55, %WREADY : i1
    %61 = comb.and %60, %io_input_w_valid {sv.namehint = "io_SpiIO_w_valid"} : i1
    %62 = comb.and bin %io_input_w_valid, %io_SpiIO_w_ready {sv.namehint = "_io_input_w_ready_T_2"} : i1
    %63 = comb.mux bin %60, %62, %34 : i1
    %64 = comb.icmp bin eq %wdevice, %c2_i3 : i3
    %65 = comb.and %64, %io_input_b_ready {sv.namehint = "io_SpiIO_b_ready"} : i1
    %66 = comb.and bin %BVALID, %io_SpiIO_b_valid {sv.namehint = "_io_input_b_valid_T_2"} : i1
    %67 = comb.icmp bin ugt %io_input_ar_bits_addr, %c805306367_i32 : i32
    %68 = comb.icmp bin ult %io_input_ar_bits_addr, %c1073741824_i32 : i32
    %69 = comb.and bin %67, %68 : i1
    %70 = comb.mux bin %69, %c2_i3, %42 : i3
    %71 = comb.icmp bin ugt %io_input_aw_bits_addr, %c805306367_i32 : i32
    %72 = comb.icmp bin ult %io_input_aw_bits_addr, %c1073741824_i32 : i32
    %73 = comb.and bin %71, %72 : i1
    %74 = comb.mux bin %73, %c2_i3, %47 : i3
    %75 = comb.icmp bin eq %197, %c3_i3 : i3
    %76 = comb.and bin %75, %ARREADY : i1
    %77 = comb.and %76, %io_input_ar_valid {sv.namehint = "io_Nemu_UartIO_ar_valid"} : i1
    %78 = comb.mux bin %76, %io_Nemu_UartIO_ar_ready, %51 : i1
    %79 = comb.icmp bin eq %rdevice, %c3_i3 : i3
    %80 = comb.and %79, %io_input_r_ready {sv.namehint = "io_Nemu_UartIO_r_ready"} : i1
    %81 = comb.and bin %RVALID, %io_Nemu_UartIO_r_valid {sv.namehint = "_io_input_r_valid_T_3"} : i1
    %82 = comb.icmp bin eq %201, %c3_i3 : i3
    %83 = comb.and bin %82, %AWREADY : i1
    %84 = comb.and %83, %io_input_aw_valid {sv.namehint = "io_Nemu_UartIO_aw_valid"} : i1
    %85 = comb.and bin %io_input_aw_valid, %io_Nemu_UartIO_aw_ready {sv.namehint = "_io_input_aw_ready_T_3"} : i1
    %86 = comb.mux bin %83, %85, %59 : i1
    %87 = comb.and bin %82, %WREADY : i1
    %88 = comb.and %87, %io_input_w_valid {sv.namehint = "io_Nemu_UartIO_w_valid"} : i1
    %89 = comb.and bin %io_input_w_valid, %io_Nemu_UartIO_w_ready {sv.namehint = "_io_input_w_ready_T_3"} : i1
    %90 = comb.mux bin %87, %89, %63 : i1
    %91 = comb.icmp bin eq %wdevice, %c3_i3 : i3
    %92 = comb.and %91, %io_input_b_ready {sv.namehint = "io_Nemu_UartIO_b_ready"} : i1
    %93 = comb.and bin %BVALID, %io_Nemu_UartIO_b_valid {sv.namehint = "_io_input_b_valid_T_3"} : i1
    %94 = comb.icmp bin ugt %io_input_ar_bits_addr, %c33619967_i32 : i32
    %95 = comb.icmp bin ult %io_input_ar_bits_addr, %c33619969_i32 : i32
    %96 = comb.and bin %94, %95 : i1
    %97 = comb.mux bin %96, %c3_i3, %70 : i3
    %98 = comb.icmp bin ugt %io_input_aw_bits_addr, %c33619967_i32 : i32
    %99 = comb.icmp bin ult %io_input_aw_bits_addr, %c33619969_i32 : i32
    %100 = comb.and bin %98, %99 : i1
    %101 = comb.mux bin %100, %c3_i3, %74 : i3
    %102 = comb.icmp bin eq %197, %c-4_i3 : i3
    %103 = comb.and bin %102, %ARREADY : i1
    %104 = comb.and %103, %io_input_ar_valid {sv.namehint = "io_Zmb_UartIO_ar_valid"} : i1
    %105 = comb.mux bin %103, %io_Zmb_UartIO_ar_ready, %78 : i1
    %106 = comb.icmp bin eq %rdevice, %c-4_i3 : i3
    %107 = comb.and %106, %io_input_r_ready {sv.namehint = "io_Zmb_UartIO_r_ready"} : i1
    %108 = comb.or %106, %79, %52, %23, %7, %io_DramIO_r_bits_last : i1
    %109 = comb.and bin %RVALID, %io_Zmb_UartIO_r_valid {sv.namehint = "_io_input_r_valid_T_4"} : i1
    %110 = comb.icmp bin eq %201, %c-4_i3 : i3
    %111 = comb.and bin %110, %AWREADY : i1
    %112 = comb.and %111, %io_input_aw_valid {sv.namehint = "io_Zmb_UartIO_aw_valid"} : i1
    %113 = comb.and bin %io_input_aw_valid, %io_Zmb_UartIO_aw_ready {sv.namehint = "_io_input_aw_ready_T_4"} : i1
    %114 = comb.mux bin %111, %113, %86 : i1
    %115 = comb.and bin %110, %WREADY : i1
    %116 = comb.and %115, %io_input_w_valid {sv.namehint = "io_Zmb_UartIO_w_valid"} : i1
    %117 = comb.and bin %io_input_w_valid, %io_Zmb_UartIO_w_ready {sv.namehint = "_io_input_w_ready_T_4"} : i1
    %118 = comb.mux bin %115, %117, %90 : i1
    %119 = comb.icmp bin eq %wdevice, %c-4_i3 : i3
    %120 = comb.and %119, %io_input_b_ready {sv.namehint = "io_Zmb_UartIO_b_ready"} : i1
    %121 = comb.and bin %BVALID, %io_Zmb_UartIO_b_valid {sv.namehint = "_io_input_b_valid_T_4"} : i1
    %122 = comb.icmp bin ugt %io_input_ar_bits_addr, %c1080033279_i32 : i32
    %123 = comb.icmp bin ult %io_input_ar_bits_addr, %c1080037376_i32 : i32
    %124 = comb.and bin %122, %123 : i1
    %125 = comb.mux bin %124, %c-4_i3, %97 : i3
    %126 = comb.icmp bin ugt %io_input_aw_bits_addr, %c1080033279_i32 : i32
    %127 = comb.icmp bin ult %io_input_aw_bits_addr, %c1080037376_i32 : i32
    %128 = comb.and bin %126, %127 : i1
    %129 = comb.mux bin %128, %c-4_i3, %101 : i3
    %130 = comb.icmp bin eq %197, %c-3_i3 : i3
    %131 = comb.and bin %130, %ARREADY : i1
    %132 = comb.and %131, %io_input_ar_valid {sv.namehint = "io_Dmac_ar_valid"} : i1
    %133 = comb.mux bin %131, %io_Dmac_ar_ready, %105 : i1
    %134 = comb.icmp bin eq %rdevice, %c-3_i3 : i3
    %135 = comb.and %134, %io_input_r_ready {sv.namehint = "io_Dmac_r_ready"} : i1
    %136 = comb.mux bin %134, %io_Dmac_r_bits_last, %108 : i1
    %137 = comb.and bin %RVALID, %io_Dmac_r_valid {sv.namehint = "_io_input_r_valid_T_5"} : i1
    %138 = comb.icmp bin eq %201, %c-3_i3 : i3
    %139 = comb.and bin %138, %AWREADY : i1
    %140 = comb.and %139, %io_input_aw_valid {sv.namehint = "io_Dmac_aw_valid"} : i1
    %141 = comb.and bin %io_input_aw_valid, %io_Dmac_aw_ready {sv.namehint = "_io_input_aw_ready_T_5"} : i1
    %142 = comb.mux bin %139, %141, %114 : i1
    %143 = comb.and bin %138, %WREADY : i1
    %144 = comb.and %143, %io_input_w_valid {sv.namehint = "io_Dmac_w_valid"} : i1
    %145 = comb.and bin %io_input_w_valid, %io_Dmac_w_ready {sv.namehint = "_io_input_w_ready_T_5"} : i1
    %146 = comb.mux bin %143, %145, %118 : i1
    %147 = comb.icmp bin eq %wdevice, %c-3_i3 : i3
    %148 = comb.and %147, %io_input_b_ready {sv.namehint = "io_Dmac_b_ready"} : i1
    %149 = comb.and bin %BVALID, %io_Dmac_b_valid {sv.namehint = "_io_input_b_valid_T_5"} : i1
    %150 = comb.icmp bin ugt %io_input_ar_bits_addr, %c1342177279_i32 : i32
    %151 = comb.icmp bin ult %io_input_ar_bits_addr, %c1342181376_i32 : i32
    %152 = comb.and bin %150, %151 : i1
    %153 = comb.mux bin %152, %c-3_i3, %125 : i3
    %154 = comb.icmp bin ugt %io_input_aw_bits_addr, %c1342177279_i32 : i32
    %155 = comb.icmp bin ult %io_input_aw_bits_addr, %c1342181376_i32 : i32
    %156 = comb.and bin %154, %155 : i1
    %157 = comb.mux bin %156, %c-3_i3, %129 : i3
    %158 = comb.icmp bin eq %197, %c-2_i3 : i3
    %159 = comb.and bin %158, %ARREADY : i1
    %160 = comb.and %159, %io_input_ar_valid {sv.namehint = "io_SdIO_ar_valid"} : i1
    %161 = comb.mux bin %159, %io_SdIO_ar_ready, %133 {sv.namehint = "io_input_ar_ready"} : i1
    %162 = comb.icmp bin eq %rdevice, %c-2_i3 : i3
    %163 = comb.and %162, %io_input_r_ready {sv.namehint = "io_SdIO_r_ready"} : i1
    %164 = hw.array_create %io_SdIO_r_bits_id, %io_SdIO_r_bits_id, %io_Dmac_r_bits_id, %io_Zmb_UartIO_r_bits_id, %io_Nemu_UartIO_r_bits_id, %io_SpiIO_r_bits_id, %io_UartIO_r_bits_id, %io_DramIO_r_bits_id : i4
    %165 = hw.array_get %164[%rdevice] {sv.namehint = "io_input_r_bits_id"} : !hw.array<8xi4>, i3
    %166 = hw.array_create %io_SdIO_r_bits_data, %io_SdIO_r_bits_data, %io_Dmac_r_bits_data, %c0_i64, %c0_i64, %io_SpiIO_r_bits_data, %io_UartIO_r_bits_data, %io_DramIO_r_bits_data : i64
    %167 = hw.array_get %166[%rdevice] {sv.namehint = "io_input_r_bits_data"} : !hw.array<8xi64>, i3
    %168 = comb.xor %134, %true : i1
    %169 = comb.or %162, %168 : i1
    %170 = comb.mux bin %169, %c0_i2, %io_Dmac_r_bits_resp {sv.namehint = "io_input_r_bits_resp"} : i2
    %171 = comb.or %162, %136 {sv.namehint = "io_input_r_bits_last"} : i1
    %172 = comb.and bin %RVALID, %io_SdIO_r_valid {sv.namehint = "_io_input_r_valid_T_6"} : i1
    %173 = hw.array_create %8, %172, %137, %109, %81, %54, %25, %8 : i1
    %174 = hw.array_get %173[%rdevice] {sv.namehint = "io_input_r_valid"} : !hw.array<8xi1>, i3
    %175 = comb.icmp bin eq %201, %c-2_i3 : i3
    %176 = comb.and bin %175, %AWREADY : i1
    %177 = comb.and %176, %io_input_aw_valid {sv.namehint = "io_SdIO_aw_valid"} : i1
    %178 = comb.and bin %io_input_aw_valid, %io_SdIO_aw_ready {sv.namehint = "_io_input_aw_ready_T_6"} : i1
    %179 = comb.mux bin %176, %178, %142 {sv.namehint = "io_input_aw_ready"} : i1
    %180 = comb.and bin %175, %WREADY : i1
    %181 = comb.and %180, %io_input_w_valid {sv.namehint = "io_SdIO_w_valid"} : i1
    %182 = comb.and bin %io_input_w_valid, %io_SdIO_w_ready {sv.namehint = "_io_input_w_ready_T_6"} : i1
    %183 = comb.mux bin %180, %182, %146 {sv.namehint = "io_input_w_ready"} : i1
    %184 = comb.icmp bin eq %wdevice, %c-2_i3 : i3
    %185 = comb.and %184, %io_input_b_ready {sv.namehint = "io_SdIO_b_ready"} : i1
    %186 = hw.array_create %io_SdIO_b_bits_id, %io_SdIO_b_bits_id, %io_Dmac_b_bits_id, %io_Zmb_UartIO_b_bits_id, %io_Nemu_UartIO_b_bits_id, %io_SpiIO_b_bits_id, %io_UartIO_b_bits_id, %io_DramIO_b_bits_id : i4
    %187 = hw.array_get %186[%wdevice] {sv.namehint = "io_input_b_bits_id"} : !hw.array<8xi4>, i3
    %188 = comb.xor %147, %true : i1
    %189 = comb.or %184, %188 : i1
    %190 = comb.mux bin %189, %c0_i2, %io_Dmac_b_bits_resp {sv.namehint = "io_input_b_bits_resp"} : i2
    %191 = comb.and bin %BVALID, %io_SdIO_b_valid {sv.namehint = "_io_input_b_valid_T_6"} : i1
    %192 = hw.array_create %18, %191, %149, %121, %93, %66, %37, %18 : i1
    %193 = hw.array_get %192[%wdevice] {sv.namehint = "io_input_b_valid"} : !hw.array<8xi1>, i3
    %194 = comb.icmp bin ugt %io_input_ar_bits_addr, %c33685503_i32 : i32
    %195 = comb.icmp bin ult %io_input_ar_bits_addr, %c33689600_i32 : i32
    %196 = comb.and bin %194, %195 : i1
    %197 = comb.mux bin %196, %c-2_i3, %153 {sv.namehint = "wireRdevice"} : i3
    %198 = comb.icmp bin ugt %io_input_aw_bits_addr, %c33685503_i32 : i32
    %199 = comb.icmp bin ult %io_input_aw_bits_addr, %c33689600_i32 : i32
    %200 = comb.and bin %198, %199 : i1
    %201 = comb.mux bin %200, %c-2_i3, %157 {sv.namehint = "wireWdevice"} : i3
    %202 = comb.and bin %io_input_r_ready, %174 : i1
    %203 = comb.or %171, %ARREADY : i1
    %204 = comb.xor %171, %true : i1
    %205 = comb.and %204, %RVALID : i1
    %206 = comb.and bin %161, %io_input_ar_valid : i1
    %207 = comb.xor %206, %true : i1
    %208 = comb.and %207, %ARREADY : i1
    %209 = comb.mux bin %202, %203, %208 : i1
    %210 = comb.or %206, %RVALID : i1
    %211 = comb.mux bin %202, %205, %210 : i1
    %212 = comb.xor %206, %true : i1
    %213 = comb.or %202, %212 : i1
    %214 = comb.mux bin %213, %rdevice, %197 : i3
    %215 = comb.and bin %179, %io_input_aw_valid : i1
    %216 = comb.xor %215, %true : i1
    %217 = comb.and %216, %AWREADY : i1
    %218 = comb.mux bin %215, %201, %wdevice : i3
    %219 = comb.and bin %183, %io_input_w_valid, %io_input_w_bits_last : i1
    %220 = comb.xor %219, %true : i1
    %221 = comb.and %220, %WREADY : i1
    %222 = comb.or %219, %BVALID : i1
    %223 = comb.and bin %io_input_b_ready, %193 : i1
    %224 = comb.or %223, %217 : i1
    %225 = comb.or %223, %221 : i1
    %226 = comb.xor %223, %true : i1
    %227 = comb.and %226, %222 : i1
    hw.output %179, %161, %183, %193, %187, %190, %174, %165, %167, %170, %171, %11, %io_input_aw_bits_id, %io_input_aw_bits_addr, %io_input_aw_bits_len, %io_input_aw_bits_size, %3, %io_input_ar_bits_id, %io_input_ar_bits_addr, %io_input_ar_bits_len, %io_input_ar_bits_size, %14, %io_input_w_bits_data, %io_input_w_bits_strb, %17, %6, %28, %io_input_aw_bits_id, %io_input_aw_bits_addr, %21, %io_input_ar_bits_id, %io_input_ar_bits_addr, %32, %io_input_w_bits_data, %36, %24, %57, %io_input_aw_bits_id, %io_input_aw_bits_addr, %io_input_aw_bits_size, %50, %io_input_ar_bits_id, %io_input_ar_bits_addr, %io_input_ar_bits_size, %61, %io_input_w_bits_data, %65, %53, %84, %io_input_aw_bits_id, %77, %io_input_ar_bits_id, %88, %io_input_w_bits_data, %92, %80, %112, %io_input_aw_bits_id, %io_input_aw_bits_addr, %104, %io_input_ar_bits_id, %116, %io_input_w_bits_data, %120, %107, %140, %io_input_aw_bits_id, %io_input_aw_bits_addr, %io_input_aw_bits_len, %io_input_aw_bits_size, %io_input_aw_bits_burst, %132, %io_input_ar_bits_id, %io_input_ar_bits_addr, %io_input_ar_bits_len, %io_input_ar_bits_size, %io_input_ar_bits_burst, %144, %io_input_w_bits_data, %io_input_w_bits_strb, %io_input_w_bits_last, %148, %135, %177, %io_input_aw_bits_id, %io_input_aw_bits_addr, %160, %io_input_ar_bits_id, %io_input_ar_bits_addr, %181, %io_input_w_bits_data, %185, %163 : i1, i1, i1, i1, i4, i2, i1, i4, i64, i2, i1, i1, i4, i32, i8, i3, i1, i4, i32, i8, i3, i1, i64, i8, i1, i1, i1, i4, i32, i1, i4, i32, i1, i64, i1, i1, i1, i4, i32, i3, i1, i4, i32, i3, i1, i64, i1, i1, i1, i4, i1, i4, i1, i64, i1, i1, i1, i4, i32, i1, i4, i1, i64, i1, i1, i1, i4, i32, i8, i3, i2, i1, i4, i32, i8, i3, i2, i1, i64, i8, i1, i1, i1, i1, i4, i32, i1, i4, i32, i1, i64, i1, i1
  }
  hw.module @TestTop(in %clock : !seq.clock, in %reset : i1, out io_exit : i3, out io_wbPC : i64, out io_wbValid : i1, out io_wbRd : i5, out io_wbRcsr : i12, out io_wbMMIO : i1, out io_wbIntr : i1, out io_wbRvc : i1, out io_gprs_0 : i64, out io_gprs_1 : i64, out io_gprs_2 : i64, out io_gprs_3 : i64, out io_gprs_4 : i64, out io_gprs_5 : i64, out io_gprs_6 : i64, out io_gprs_7 : i64, out io_gprs_8 : i64, out io_gprs_9 : i64, out io_gprs_10 : i64, out io_gprs_11 : i64, out io_gprs_12 : i64, out io_gprs_13 : i64, out io_gprs_14 : i64, out io_gprs_15 : i64, out io_gprs_16 : i64, out io_gprs_17 : i64, out io_gprs_18 : i64, out io_gprs_19 : i64, out io_gprs_20 : i64, out io_gprs_21 : i64, out io_gprs_22 : i64, out io_gprs_23 : i64, out io_gprs_24 : i64, out io_gprs_25 : i64, out io_gprs_26 : i64, out io_gprs_27 : i64, out io_gprs_28 : i64, out io_gprs_29 : i64, out io_gprs_30 : i64, out io_gprs_31 : i64, out io_priv : i2, out io_mstatus : i64, out io_mepc : i64, out io_sepc : i64, out io_mtvec : i64, out io_stvec : i64, out io_mcause : i64, out io_scause : i64, out io_mtval : i64, out io_stval : i64, out io_mie : i64, out io_mscratch : i64) {
    %true = hw.constant true
    %cpu.io_master_aw_valid, %cpu.io_master_aw_bits_id, %cpu.io_master_aw_bits_addr, %cpu.io_master_aw_bits_len, %cpu.io_master_aw_bits_size, %cpu.io_master_aw_bits_burst, %cpu.io_master_ar_valid, %cpu.io_master_ar_bits_id, %cpu.io_master_ar_bits_addr, %cpu.io_master_ar_bits_len, %cpu.io_master_ar_bits_size, %cpu.io_master_ar_bits_burst, %cpu.io_master_w_valid, %cpu.io_master_w_bits_data, %cpu.io_master_w_bits_strb, %cpu.io_master_w_bits_last, %cpu.io_master_b_ready, %cpu.io_master_r_ready, %cpu.io_slave_aw_ready, %cpu.io_slave_ar_ready, %cpu.io_slave_w_ready, %cpu.io_slave_b_valid, %cpu.io_slave_b_bits_id, %cpu.io_slave_b_bits_resp, %cpu.io_slave_r_valid, %cpu.io_slave_r_bits_id, %cpu.io_slave_r_bits_data, %cpu.io_slave_r_bits_resp, %cpu.io_slave_r_bits_last, %cpu.io_debug_exit, %cpu.io_debug_wbPC, %cpu.io_debug_wbValid, %cpu.io_debug_wbRd, %cpu.io_debug_wbRcsr, %cpu.io_debug_wbMMIO, %cpu.io_debug_wbIntr, %cpu.io_debug_wbRvc, %cpu.io_debug_gprs_0, %cpu.io_debug_gprs_1, %cpu.io_debug_gprs_2, %cpu.io_debug_gprs_3, %cpu.io_debug_gprs_4, %cpu.io_debug_gprs_5, %cpu.io_debug_gprs_6, %cpu.io_debug_gprs_7, %cpu.io_debug_gprs_8, %cpu.io_debug_gprs_9, %cpu.io_debug_gprs_10, %cpu.io_debug_gprs_11, %cpu.io_debug_gprs_12, %cpu.io_debug_gprs_13, %cpu.io_debug_gprs_14, %cpu.io_debug_gprs_15, %cpu.io_debug_gprs_16, %cpu.io_debug_gprs_17, %cpu.io_debug_gprs_18, %cpu.io_debug_gprs_19, %cpu.io_debug_gprs_20, %cpu.io_debug_gprs_21, %cpu.io_debug_gprs_22, %cpu.io_debug_gprs_23, %cpu.io_debug_gprs_24, %cpu.io_debug_gprs_25, %cpu.io_debug_gprs_26, %cpu.io_debug_gprs_27, %cpu.io_debug_gprs_28, %cpu.io_debug_gprs_29, %cpu.io_debug_gprs_30, %cpu.io_debug_gprs_31, %cpu.io_debug_priv, %cpu.io_debug_mstatus, %cpu.io_debug_mepc, %cpu.io_debug_sepc, %cpu.io_debug_mtvec, %cpu.io_debug_stvec, %cpu.io_debug_mcause, %cpu.io_debug_scause, %cpu.io_debug_mtval, %cpu.io_debug_stval, %cpu.io_debug_mie, %cpu.io_debug_mscratch = hw.instance "cpu" @CPU(clock: %clock: !seq.clock, reset: %reset: i1, io_master_aw_ready: %router.io_input_aw_ready: i1, io_master_ar_ready: %router.io_input_ar_ready: i1, io_master_w_ready: %router.io_input_w_ready: i1, io_master_b_valid: %router.io_input_b_valid: i1, io_master_b_bits_id: %router.io_input_b_bits_id: i4, io_master_b_bits_resp: %router.io_input_b_bits_resp: i2, io_master_r_valid: %router.io_input_r_valid: i1, io_master_r_bits_id: %router.io_input_r_bits_id: i4, io_master_r_bits_data: %router.io_input_r_bits_data: i64, io_master_r_bits_resp: %router.io_input_r_bits_resp: i2, io_master_r_bits_last: %router.io_input_r_bits_last: i1, io_slave_aw_valid: %dmac.io_toCPU_aw_valid: i1, io_slave_aw_bits_id: %dmac.io_toCPU_aw_bits_id: i4, io_slave_aw_bits_addr: %dmac.io_toCPU_aw_bits_addr: i32, io_slave_aw_bits_len: %dmac.io_toCPU_aw_bits_len: i8, io_slave_aw_bits_size: %dmac.io_toCPU_aw_bits_size: i3, io_slave_aw_bits_burst: %dmac.io_toCPU_aw_bits_burst: i2, io_slave_ar_valid: %dmac.io_toCPU_ar_valid: i1, io_slave_ar_bits_id: %dmac.io_toCPU_ar_bits_id: i4, io_slave_ar_bits_addr: %dmac.io_toCPU_ar_bits_addr: i32, io_slave_ar_bits_len: %dmac.io_toCPU_ar_bits_len: i8, io_slave_ar_bits_size: %dmac.io_toCPU_ar_bits_size: i3, io_slave_ar_bits_burst: %dmac.io_toCPU_ar_bits_burst: i2, io_slave_w_valid: %dmac.io_toCPU_w_valid: i1, io_slave_w_bits_data: %dmac.io_toCPU_w_bits_data: i64, io_slave_w_bits_strb: %dmac.io_toCPU_w_bits_strb: i8, io_slave_w_bits_last: %dmac.io_toCPU_w_bits_last: i1, io_slave_b_ready: %dmac.io_toCPU_b_ready: i1, io_slave_r_ready: %dmac.io_toCPU_r_ready: i1, io_interrupt: %uart.io_interrupt: i1) -> (io_master_aw_valid: i1, io_master_aw_bits_id: i4, io_master_aw_bits_addr: i32, io_master_aw_bits_len: i8, io_master_aw_bits_size: i3, io_master_aw_bits_burst: i2, io_master_ar_valid: i1, io_master_ar_bits_id: i4, io_master_ar_bits_addr: i32, io_master_ar_bits_len: i8, io_master_ar_bits_size: i3, io_master_ar_bits_burst: i2, io_master_w_valid: i1, io_master_w_bits_data: i64, io_master_w_bits_strb: i8, io_master_w_bits_last: i1, io_master_b_ready: i1, io_master_r_ready: i1, io_slave_aw_ready: i1, io_slave_ar_ready: i1, io_slave_w_ready: i1, io_slave_b_valid: i1, io_slave_b_bits_id: i4, io_slave_b_bits_resp: i2, io_slave_r_valid: i1, io_slave_r_bits_id: i4, io_slave_r_bits_data: i64, io_slave_r_bits_resp: i2, io_slave_r_bits_last: i1, io_debug_exit: i3, io_debug_wbPC: i64, io_debug_wbValid: i1, io_debug_wbRd: i5, io_debug_wbRcsr: i12, io_debug_wbMMIO: i1, io_debug_wbIntr: i1, io_debug_wbRvc: i1, io_debug_gprs_0: i64, io_debug_gprs_1: i64, io_debug_gprs_2: i64, io_debug_gprs_3: i64, io_debug_gprs_4: i64, io_debug_gprs_5: i64, io_debug_gprs_6: i64, io_debug_gprs_7: i64, io_debug_gprs_8: i64, io_debug_gprs_9: i64, io_debug_gprs_10: i64, io_debug_gprs_11: i64, io_debug_gprs_12: i64, io_debug_gprs_13: i64, io_debug_gprs_14: i64, io_debug_gprs_15: i64, io_debug_gprs_16: i64, io_debug_gprs_17: i64, io_debug_gprs_18: i64, io_debug_gprs_19: i64, io_debug_gprs_20: i64, io_debug_gprs_21: i64, io_debug_gprs_22: i64, io_debug_gprs_23: i64, io_debug_gprs_24: i64, io_debug_gprs_25: i64, io_debug_gprs_26: i64, io_debug_gprs_27: i64, io_debug_gprs_28: i64, io_debug_gprs_29: i64, io_debug_gprs_30: i64, io_debug_gprs_31: i64, io_debug_priv: i2, io_debug_mstatus: i64, io_debug_mepc: i64, io_debug_sepc: i64, io_debug_mtvec: i64, io_debug_stvec: i64, io_debug_mcause: i64, io_debug_scause: i64, io_debug_mtval: i64, io_debug_stval: i64, io_debug_mie: i64, io_debug_mscratch: i64) {sv.namehint = "io_mie"}
    %mem.io_channel_aw_ready, %mem.io_channel_ar_ready, %mem.io_channel_w_ready, %mem.io_channel_b_valid, %mem.io_channel_b_bits_id, %mem.io_channel_r_valid, %mem.io_channel_r_bits_id, %mem.io_channel_r_bits_data, %mem.io_channel_r_bits_last = hw.instance "mem" @RAM(io_basic_ACLK: %clock: !seq.clock, io_basic_ARESETn: %0: i1, io_channel_aw_valid: %router.io_DramIO_aw_valid: i1, io_channel_aw_bits_id: %router.io_DramIO_aw_bits_id: i4, io_channel_aw_bits_addr: %router.io_DramIO_aw_bits_addr: i32, io_channel_aw_bits_len: %router.io_DramIO_aw_bits_len: i8, io_channel_aw_bits_size: %router.io_DramIO_aw_bits_size: i3, io_channel_ar_valid: %router.io_DramIO_ar_valid: i1, io_channel_ar_bits_id: %router.io_DramIO_ar_bits_id: i4, io_channel_ar_bits_addr: %router.io_DramIO_ar_bits_addr: i32, io_channel_ar_bits_len: %router.io_DramIO_ar_bits_len: i8, io_channel_ar_bits_size: %router.io_DramIO_ar_bits_size: i3, io_channel_w_valid: %router.io_DramIO_w_valid: i1, io_channel_w_bits_data: %router.io_DramIO_w_bits_data: i64, io_channel_w_bits_strb: %router.io_DramIO_w_bits_strb: i8, io_channel_b_ready: %router.io_DramIO_b_ready: i1, io_channel_r_ready: %router.io_DramIO_r_ready: i1) -> (io_channel_aw_ready: i1, io_channel_ar_ready: i1, io_channel_w_ready: i1, io_channel_b_valid: i1, io_channel_b_bits_id: i4, io_channel_r_valid: i1, io_channel_r_bits_id: i4, io_channel_r_bits_data: i64, io_channel_r_bits_last: i1) {sv.namehint = "router.io_DramIO_r_valid"}
    %uart.io_channel_aw_ready, %uart.io_channel_ar_ready, %uart.io_channel_w_ready, %uart.io_channel_b_valid, %uart.io_channel_b_bits_id, %uart.io_channel_r_valid, %uart.io_channel_r_bits_id, %uart.io_channel_r_bits_data, %uart.io_interrupt = hw.instance "uart" @UartSim(io_basic_ACLK: %clock: !seq.clock, io_basic_ARESETn: %0: i1, io_channel_aw_valid: %router.io_UartIO_aw_valid: i1, io_channel_aw_bits_id: %router.io_UartIO_aw_bits_id: i4, io_channel_aw_bits_addr: %router.io_UartIO_aw_bits_addr: i32, io_channel_ar_valid: %router.io_UartIO_ar_valid: i1, io_channel_ar_bits_id: %router.io_UartIO_ar_bits_id: i4, io_channel_ar_bits_addr: %router.io_UartIO_ar_bits_addr: i32, io_channel_w_valid: %router.io_UartIO_w_valid: i1, io_channel_w_bits_data: %router.io_UartIO_w_bits_data: i64, io_channel_b_ready: %router.io_UartIO_b_ready: i1, io_channel_r_ready: %router.io_UartIO_r_ready: i1) -> (io_channel_aw_ready: i1, io_channel_ar_ready: i1, io_channel_w_ready: i1, io_channel_b_valid: i1, io_channel_b_bits_id: i4, io_channel_r_valid: i1, io_channel_r_bits_id: i4, io_channel_r_bits_data: i64, io_interrupt: i1) {sv.namehint = "cpu.io_interrupt"}
    %spi.io_channel_aw_ready, %spi.io_channel_ar_ready, %spi.io_channel_w_ready, %spi.io_channel_b_valid, %spi.io_channel_b_bits_id, %spi.io_channel_r_valid, %spi.io_channel_r_bits_id, %spi.io_channel_r_bits_data = hw.instance "spi" @AxiFlash(io_basic_ACLK: %clock: !seq.clock, io_basic_ARESETn: %0: i1, io_channel_aw_valid: %router.io_SpiIO_aw_valid: i1, io_channel_aw_bits_id: %router.io_SpiIO_aw_bits_id: i4, io_channel_aw_bits_addr: %router.io_SpiIO_aw_bits_addr: i32, io_channel_aw_bits_size: %router.io_SpiIO_aw_bits_size: i3, io_channel_ar_valid: %router.io_SpiIO_ar_valid: i1, io_channel_ar_bits_id: %router.io_SpiIO_ar_bits_id: i4, io_channel_ar_bits_addr: %router.io_SpiIO_ar_bits_addr: i32, io_channel_ar_bits_size: %router.io_SpiIO_ar_bits_size: i3, io_channel_w_valid: %router.io_SpiIO_w_valid: i1, io_channel_w_bits_data: %router.io_SpiIO_w_bits_data: i64, io_channel_b_ready: %router.io_SpiIO_b_ready: i1, io_channel_r_ready: %router.io_SpiIO_r_ready: i1) -> (io_channel_aw_ready: i1, io_channel_ar_ready: i1, io_channel_w_ready: i1, io_channel_b_valid: i1, io_channel_b_bits_id: i4, io_channel_r_valid: i1, io_channel_r_bits_id: i4, io_channel_r_bits_data: i64) {sv.namehint = "router.io_SpiIO_r_valid"}
    %sd.io_channel_aw_ready, %sd.io_channel_ar_ready, %sd.io_channel_w_ready, %sd.io_channel_b_valid, %sd.io_channel_b_bits_id, %sd.io_channel_r_valid, %sd.io_channel_r_bits_id, %sd.io_channel_r_bits_data = hw.instance "sd" @SDCard(io_basic_ACLK: %clock: !seq.clock, io_basic_ARESETn: %0: i1, io_channel_aw_valid: %router.io_SdIO_aw_valid: i1, io_channel_aw_bits_id: %router.io_SdIO_aw_bits_id: i4, io_channel_aw_bits_addr: %router.io_SdIO_aw_bits_addr: i32, io_channel_ar_valid: %router.io_SdIO_ar_valid: i1, io_channel_ar_bits_id: %router.io_SdIO_ar_bits_id: i4, io_channel_ar_bits_addr: %router.io_SdIO_ar_bits_addr: i32, io_channel_w_valid: %router.io_SdIO_w_valid: i1, io_channel_w_bits_data: %router.io_SdIO_w_bits_data: i64, io_channel_b_ready: %router.io_SdIO_b_ready: i1, io_channel_r_ready: %router.io_SdIO_r_ready: i1) -> (io_channel_aw_ready: i1, io_channel_ar_ready: i1, io_channel_w_ready: i1, io_channel_b_valid: i1, io_channel_b_bits_id: i4, io_channel_r_valid: i1, io_channel_r_bits_id: i4, io_channel_r_bits_data: i64) {sv.namehint = "router.io_SdIO_r_valid"}
    %nemu_uart.io_channel_aw_ready, %nemu_uart.io_channel_ar_ready, %nemu_uart.io_channel_w_ready, %nemu_uart.io_channel_b_valid, %nemu_uart.io_channel_b_bits_id, %nemu_uart.io_channel_r_valid, %nemu_uart.io_channel_r_bits_id = hw.instance "nemu_uart" @Nemu_Uart(io_basic_ACLK: %clock: !seq.clock, io_basic_ARESETn: %0: i1, io_channel_aw_valid: %router.io_Nemu_UartIO_aw_valid: i1, io_channel_aw_bits_id: %router.io_Nemu_UartIO_aw_bits_id: i4, io_channel_ar_valid: %router.io_Nemu_UartIO_ar_valid: i1, io_channel_ar_bits_id: %router.io_Nemu_UartIO_ar_bits_id: i4, io_channel_w_valid: %router.io_Nemu_UartIO_w_valid: i1, io_channel_w_bits_data: %router.io_Nemu_UartIO_w_bits_data: i64, io_channel_b_ready: %router.io_Nemu_UartIO_b_ready: i1, io_channel_r_ready: %router.io_Nemu_UartIO_r_ready: i1) -> (io_channel_aw_ready: i1, io_channel_ar_ready: i1, io_channel_w_ready: i1, io_channel_b_valid: i1, io_channel_b_bits_id: i4, io_channel_r_valid: i1, io_channel_r_bits_id: i4) {sv.namehint = "router.io_Nemu_UartIO_r_valid"}
    %zmb_uart.io_channel_aw_ready, %zmb_uart.io_channel_ar_ready, %zmb_uart.io_channel_w_ready, %zmb_uart.io_channel_b_valid, %zmb_uart.io_channel_b_bits_id, %zmb_uart.io_channel_r_valid, %zmb_uart.io_channel_r_bits_id = hw.instance "zmb_uart" @Zmb_Uart(io_basic_ACLK: %clock: !seq.clock, io_basic_ARESETn: %0: i1, io_channel_aw_valid: %router.io_Zmb_UartIO_aw_valid: i1, io_channel_aw_bits_id: %router.io_Zmb_UartIO_aw_bits_id: i4, io_channel_aw_bits_addr: %router.io_Zmb_UartIO_aw_bits_addr: i32, io_channel_ar_valid: %router.io_Zmb_UartIO_ar_valid: i1, io_channel_ar_bits_id: %router.io_Zmb_UartIO_ar_bits_id: i4, io_channel_w_valid: %router.io_Zmb_UartIO_w_valid: i1, io_channel_w_bits_data: %router.io_Zmb_UartIO_w_bits_data: i64, io_channel_b_ready: %router.io_Zmb_UartIO_b_ready: i1, io_channel_r_ready: %router.io_Zmb_UartIO_r_ready: i1) -> (io_channel_aw_ready: i1, io_channel_ar_ready: i1, io_channel_w_ready: i1, io_channel_b_valid: i1, io_channel_b_bits_id: i4, io_channel_r_valid: i1, io_channel_r_bits_id: i4) {sv.namehint = "router.io_Zmb_UartIO_r_valid"}
    %dmac.io_toCPU_aw_valid, %dmac.io_toCPU_aw_bits_id, %dmac.io_toCPU_aw_bits_addr, %dmac.io_toCPU_aw_bits_len, %dmac.io_toCPU_aw_bits_size, %dmac.io_toCPU_aw_bits_burst, %dmac.io_toCPU_ar_valid, %dmac.io_toCPU_ar_bits_id, %dmac.io_toCPU_ar_bits_addr, %dmac.io_toCPU_ar_bits_len, %dmac.io_toCPU_ar_bits_size, %dmac.io_toCPU_ar_bits_burst, %dmac.io_toCPU_w_valid, %dmac.io_toCPU_w_bits_data, %dmac.io_toCPU_w_bits_strb, %dmac.io_toCPU_w_bits_last, %dmac.io_toCPU_b_ready, %dmac.io_toCPU_r_ready, %dmac.io_fromCPU_channel_aw_ready, %dmac.io_fromCPU_channel_ar_ready, %dmac.io_fromCPU_channel_w_ready, %dmac.io_fromCPU_channel_b_valid, %dmac.io_fromCPU_channel_b_bits_id, %dmac.io_fromCPU_channel_b_bits_resp, %dmac.io_fromCPU_channel_r_valid, %dmac.io_fromCPU_channel_r_bits_id, %dmac.io_fromCPU_channel_r_bits_data, %dmac.io_fromCPU_channel_r_bits_resp, %dmac.io_fromCPU_channel_r_bits_last = hw.instance "dmac" @DMAC(io_toCPU_aw_ready: %cpu.io_slave_aw_ready: i1, io_toCPU_ar_ready: %cpu.io_slave_ar_ready: i1, io_toCPU_w_ready: %cpu.io_slave_w_ready: i1, io_toCPU_b_valid: %cpu.io_slave_b_valid: i1, io_toCPU_b_bits_id: %cpu.io_slave_b_bits_id: i4, io_toCPU_b_bits_resp: %cpu.io_slave_b_bits_resp: i2, io_toCPU_r_valid: %cpu.io_slave_r_valid: i1, io_toCPU_r_bits_id: %cpu.io_slave_r_bits_id: i4, io_toCPU_r_bits_data: %cpu.io_slave_r_bits_data: i64, io_toCPU_r_bits_resp: %cpu.io_slave_r_bits_resp: i2, io_toCPU_r_bits_last: %cpu.io_slave_r_bits_last: i1, io_fromCPU_basic_ACLK: %clock: !seq.clock, io_fromCPU_basic_ARESETn: %0: i1, io_fromCPU_channel_aw_valid: %router.io_Dmac_aw_valid: i1, io_fromCPU_channel_aw_bits_id: %router.io_Dmac_aw_bits_id: i4, io_fromCPU_channel_aw_bits_addr: %router.io_Dmac_aw_bits_addr: i32, io_fromCPU_channel_aw_bits_len: %router.io_Dmac_aw_bits_len: i8, io_fromCPU_channel_aw_bits_size: %router.io_Dmac_aw_bits_size: i3, io_fromCPU_channel_aw_bits_burst: %router.io_Dmac_aw_bits_burst: i2, io_fromCPU_channel_ar_valid: %router.io_Dmac_ar_valid: i1, io_fromCPU_channel_ar_bits_id: %router.io_Dmac_ar_bits_id: i4, io_fromCPU_channel_ar_bits_addr: %router.io_Dmac_ar_bits_addr: i32, io_fromCPU_channel_ar_bits_len: %router.io_Dmac_ar_bits_len: i8, io_fromCPU_channel_ar_bits_size: %router.io_Dmac_ar_bits_size: i3, io_fromCPU_channel_ar_bits_burst: %router.io_Dmac_ar_bits_burst: i2, io_fromCPU_channel_w_valid: %router.io_Dmac_w_valid: i1, io_fromCPU_channel_w_bits_data: %router.io_Dmac_w_bits_data: i64, io_fromCPU_channel_w_bits_strb: %router.io_Dmac_w_bits_strb: i8, io_fromCPU_channel_w_bits_last: %router.io_Dmac_w_bits_last: i1, io_fromCPU_channel_b_ready: %router.io_Dmac_b_ready: i1, io_fromCPU_channel_r_ready: %router.io_Dmac_r_ready: i1) -> (io_toCPU_aw_valid: i1, io_toCPU_aw_bits_id: i4, io_toCPU_aw_bits_addr: i32, io_toCPU_aw_bits_len: i8, io_toCPU_aw_bits_size: i3, io_toCPU_aw_bits_burst: i2, io_toCPU_ar_valid: i1, io_toCPU_ar_bits_id: i4, io_toCPU_ar_bits_addr: i32, io_toCPU_ar_bits_len: i8, io_toCPU_ar_bits_size: i3, io_toCPU_ar_bits_burst: i2, io_toCPU_w_valid: i1, io_toCPU_w_bits_data: i64, io_toCPU_w_bits_strb: i8, io_toCPU_w_bits_last: i1, io_toCPU_b_ready: i1, io_toCPU_r_ready: i1, io_fromCPU_channel_aw_ready: i1, io_fromCPU_channel_ar_ready: i1, io_fromCPU_channel_w_ready: i1, io_fromCPU_channel_b_valid: i1, io_fromCPU_channel_b_bits_id: i4, io_fromCPU_channel_b_bits_resp: i2, io_fromCPU_channel_r_valid: i1, io_fromCPU_channel_r_bits_id: i4, io_fromCPU_channel_r_bits_data: i64, io_fromCPU_channel_r_bits_resp: i2, io_fromCPU_channel_r_bits_last: i1) {sv.namehint = "cpu.io_slave_r_ready"}
    %router.io_input_aw_ready, %router.io_input_ar_ready, %router.io_input_w_ready, %router.io_input_b_valid, %router.io_input_b_bits_id, %router.io_input_b_bits_resp, %router.io_input_r_valid, %router.io_input_r_bits_id, %router.io_input_r_bits_data, %router.io_input_r_bits_resp, %router.io_input_r_bits_last, %router.io_DramIO_aw_valid, %router.io_DramIO_aw_bits_id, %router.io_DramIO_aw_bits_addr, %router.io_DramIO_aw_bits_len, %router.io_DramIO_aw_bits_size, %router.io_DramIO_ar_valid, %router.io_DramIO_ar_bits_id, %router.io_DramIO_ar_bits_addr, %router.io_DramIO_ar_bits_len, %router.io_DramIO_ar_bits_size, %router.io_DramIO_w_valid, %router.io_DramIO_w_bits_data, %router.io_DramIO_w_bits_strb, %router.io_DramIO_b_ready, %router.io_DramIO_r_ready, %router.io_UartIO_aw_valid, %router.io_UartIO_aw_bits_id, %router.io_UartIO_aw_bits_addr, %router.io_UartIO_ar_valid, %router.io_UartIO_ar_bits_id, %router.io_UartIO_ar_bits_addr, %router.io_UartIO_w_valid, %router.io_UartIO_w_bits_data, %router.io_UartIO_b_ready, %router.io_UartIO_r_ready, %router.io_SpiIO_aw_valid, %router.io_SpiIO_aw_bits_id, %router.io_SpiIO_aw_bits_addr, %router.io_SpiIO_aw_bits_size, %router.io_SpiIO_ar_valid, %router.io_SpiIO_ar_bits_id, %router.io_SpiIO_ar_bits_addr, %router.io_SpiIO_ar_bits_size, %router.io_SpiIO_w_valid, %router.io_SpiIO_w_bits_data, %router.io_SpiIO_b_ready, %router.io_SpiIO_r_ready, %router.io_Nemu_UartIO_aw_valid, %router.io_Nemu_UartIO_aw_bits_id, %router.io_Nemu_UartIO_ar_valid, %router.io_Nemu_UartIO_ar_bits_id, %router.io_Nemu_UartIO_w_valid, %router.io_Nemu_UartIO_w_bits_data, %router.io_Nemu_UartIO_b_ready, %router.io_Nemu_UartIO_r_ready, %router.io_Zmb_UartIO_aw_valid, %router.io_Zmb_UartIO_aw_bits_id, %router.io_Zmb_UartIO_aw_bits_addr, %router.io_Zmb_UartIO_ar_valid, %router.io_Zmb_UartIO_ar_bits_id, %router.io_Zmb_UartIO_w_valid, %router.io_Zmb_UartIO_w_bits_data, %router.io_Zmb_UartIO_b_ready, %router.io_Zmb_UartIO_r_ready, %router.io_Dmac_aw_valid, %router.io_Dmac_aw_bits_id, %router.io_Dmac_aw_bits_addr, %router.io_Dmac_aw_bits_len, %router.io_Dmac_aw_bits_size, %router.io_Dmac_aw_bits_burst, %router.io_Dmac_ar_valid, %router.io_Dmac_ar_bits_id, %router.io_Dmac_ar_bits_addr, %router.io_Dmac_ar_bits_len, %router.io_Dmac_ar_bits_size, %router.io_Dmac_ar_bits_burst, %router.io_Dmac_w_valid, %router.io_Dmac_w_bits_data, %router.io_Dmac_w_bits_strb, %router.io_Dmac_w_bits_last, %router.io_Dmac_b_ready, %router.io_Dmac_r_ready, %router.io_SdIO_aw_valid, %router.io_SdIO_aw_bits_id, %router.io_SdIO_aw_bits_addr, %router.io_SdIO_ar_valid, %router.io_SdIO_ar_bits_id, %router.io_SdIO_ar_bits_addr, %router.io_SdIO_w_valid, %router.io_SdIO_w_bits_data, %router.io_SdIO_b_ready, %router.io_SdIO_r_ready = hw.instance "router" @ROUTER(io_basic_ACLK: %clock: !seq.clock, io_basic_ARESETn: %0: i1, io_input_aw_valid: %cpu.io_master_aw_valid: i1, io_input_aw_bits_id: %cpu.io_master_aw_bits_id: i4, io_input_aw_bits_addr: %cpu.io_master_aw_bits_addr: i32, io_input_aw_bits_len: %cpu.io_master_aw_bits_len: i8, io_input_aw_bits_size: %cpu.io_master_aw_bits_size: i3, io_input_aw_bits_burst: %cpu.io_master_aw_bits_burst: i2, io_input_ar_valid: %cpu.io_master_ar_valid: i1, io_input_ar_bits_id: %cpu.io_master_ar_bits_id: i4, io_input_ar_bits_addr: %cpu.io_master_ar_bits_addr: i32, io_input_ar_bits_len: %cpu.io_master_ar_bits_len: i8, io_input_ar_bits_size: %cpu.io_master_ar_bits_size: i3, io_input_ar_bits_burst: %cpu.io_master_ar_bits_burst: i2, io_input_w_valid: %cpu.io_master_w_valid: i1, io_input_w_bits_data: %cpu.io_master_w_bits_data: i64, io_input_w_bits_strb: %cpu.io_master_w_bits_strb: i8, io_input_w_bits_last: %cpu.io_master_w_bits_last: i1, io_input_b_ready: %cpu.io_master_b_ready: i1, io_input_r_ready: %cpu.io_master_r_ready: i1, io_DramIO_aw_ready: %mem.io_channel_aw_ready: i1, io_DramIO_ar_ready: %mem.io_channel_ar_ready: i1, io_DramIO_w_ready: %mem.io_channel_w_ready: i1, io_DramIO_b_valid: %mem.io_channel_b_valid: i1, io_DramIO_b_bits_id: %mem.io_channel_b_bits_id: i4, io_DramIO_r_valid: %mem.io_channel_r_valid: i1, io_DramIO_r_bits_id: %mem.io_channel_r_bits_id: i4, io_DramIO_r_bits_data: %mem.io_channel_r_bits_data: i64, io_DramIO_r_bits_last: %mem.io_channel_r_bits_last: i1, io_UartIO_aw_ready: %uart.io_channel_aw_ready: i1, io_UartIO_ar_ready: %uart.io_channel_ar_ready: i1, io_UartIO_w_ready: %uart.io_channel_w_ready: i1, io_UartIO_b_valid: %uart.io_channel_b_valid: i1, io_UartIO_b_bits_id: %uart.io_channel_b_bits_id: i4, io_UartIO_r_valid: %uart.io_channel_r_valid: i1, io_UartIO_r_bits_id: %uart.io_channel_r_bits_id: i4, io_UartIO_r_bits_data: %uart.io_channel_r_bits_data: i64, io_SpiIO_aw_ready: %spi.io_channel_aw_ready: i1, io_SpiIO_ar_ready: %spi.io_channel_ar_ready: i1, io_SpiIO_w_ready: %spi.io_channel_w_ready: i1, io_SpiIO_b_valid: %spi.io_channel_b_valid: i1, io_SpiIO_b_bits_id: %spi.io_channel_b_bits_id: i4, io_SpiIO_r_valid: %spi.io_channel_r_valid: i1, io_SpiIO_r_bits_id: %spi.io_channel_r_bits_id: i4, io_SpiIO_r_bits_data: %spi.io_channel_r_bits_data: i64, io_Nemu_UartIO_aw_ready: %nemu_uart.io_channel_aw_ready: i1, io_Nemu_UartIO_ar_ready: %nemu_uart.io_channel_ar_ready: i1, io_Nemu_UartIO_w_ready: %nemu_uart.io_channel_w_ready: i1, io_Nemu_UartIO_b_valid: %nemu_uart.io_channel_b_valid: i1, io_Nemu_UartIO_b_bits_id: %nemu_uart.io_channel_b_bits_id: i4, io_Nemu_UartIO_r_valid: %nemu_uart.io_channel_r_valid: i1, io_Nemu_UartIO_r_bits_id: %nemu_uart.io_channel_r_bits_id: i4, io_Zmb_UartIO_aw_ready: %zmb_uart.io_channel_aw_ready: i1, io_Zmb_UartIO_ar_ready: %zmb_uart.io_channel_ar_ready: i1, io_Zmb_UartIO_w_ready: %zmb_uart.io_channel_w_ready: i1, io_Zmb_UartIO_b_valid: %zmb_uart.io_channel_b_valid: i1, io_Zmb_UartIO_b_bits_id: %zmb_uart.io_channel_b_bits_id: i4, io_Zmb_UartIO_r_valid: %zmb_uart.io_channel_r_valid: i1, io_Zmb_UartIO_r_bits_id: %zmb_uart.io_channel_r_bits_id: i4, io_Dmac_aw_ready: %dmac.io_fromCPU_channel_aw_ready: i1, io_Dmac_ar_ready: %dmac.io_fromCPU_channel_ar_ready: i1, io_Dmac_w_ready: %dmac.io_fromCPU_channel_w_ready: i1, io_Dmac_b_valid: %dmac.io_fromCPU_channel_b_valid: i1, io_Dmac_b_bits_id: %dmac.io_fromCPU_channel_b_bits_id: i4, io_Dmac_b_bits_resp: %dmac.io_fromCPU_channel_b_bits_resp: i2, io_Dmac_r_valid: %dmac.io_fromCPU_channel_r_valid: i1, io_Dmac_r_bits_id: %dmac.io_fromCPU_channel_r_bits_id: i4, io_Dmac_r_bits_data: %dmac.io_fromCPU_channel_r_bits_data: i64, io_Dmac_r_bits_resp: %dmac.io_fromCPU_channel_r_bits_resp: i2, io_Dmac_r_bits_last: %dmac.io_fromCPU_channel_r_bits_last: i1, io_SdIO_aw_ready: %sd.io_channel_aw_ready: i1, io_SdIO_ar_ready: %sd.io_channel_ar_ready: i1, io_SdIO_w_ready: %sd.io_channel_w_ready: i1, io_SdIO_b_valid: %sd.io_channel_b_valid: i1, io_SdIO_b_bits_id: %sd.io_channel_b_bits_id: i4, io_SdIO_r_valid: %sd.io_channel_r_valid: i1, io_SdIO_r_bits_id: %sd.io_channel_r_bits_id: i4, io_SdIO_r_bits_data: %sd.io_channel_r_bits_data: i64) -> (io_input_aw_ready: i1, io_input_ar_ready: i1, io_input_w_ready: i1, io_input_b_valid: i1, io_input_b_bits_id: i4, io_input_b_bits_resp: i2, io_input_r_valid: i1, io_input_r_bits_id: i4, io_input_r_bits_data: i64, io_input_r_bits_resp: i2, io_input_r_bits_last: i1, io_DramIO_aw_valid: i1, io_DramIO_aw_bits_id: i4, io_DramIO_aw_bits_addr: i32, io_DramIO_aw_bits_len: i8, io_DramIO_aw_bits_size: i3, io_DramIO_ar_valid: i1, io_DramIO_ar_bits_id: i4, io_DramIO_ar_bits_addr: i32, io_DramIO_ar_bits_len: i8, io_DramIO_ar_bits_size: i3, io_DramIO_w_valid: i1, io_DramIO_w_bits_data: i64, io_DramIO_w_bits_strb: i8, io_DramIO_b_ready: i1, io_DramIO_r_ready: i1, io_UartIO_aw_valid: i1, io_UartIO_aw_bits_id: i4, io_UartIO_aw_bits_addr: i32, io_UartIO_ar_valid: i1, io_UartIO_ar_bits_id: i4, io_UartIO_ar_bits_addr: i32, io_UartIO_w_valid: i1, io_UartIO_w_bits_data: i64, io_UartIO_b_ready: i1, io_UartIO_r_ready: i1, io_SpiIO_aw_valid: i1, io_SpiIO_aw_bits_id: i4, io_SpiIO_aw_bits_addr: i32, io_SpiIO_aw_bits_size: i3, io_SpiIO_ar_valid: i1, io_SpiIO_ar_bits_id: i4, io_SpiIO_ar_bits_addr: i32, io_SpiIO_ar_bits_size: i3, io_SpiIO_w_valid: i1, io_SpiIO_w_bits_data: i64, io_SpiIO_b_ready: i1, io_SpiIO_r_ready: i1, io_Nemu_UartIO_aw_valid: i1, io_Nemu_UartIO_aw_bits_id: i4, io_Nemu_UartIO_ar_valid: i1, io_Nemu_UartIO_ar_bits_id: i4, io_Nemu_UartIO_w_valid: i1, io_Nemu_UartIO_w_bits_data: i64, io_Nemu_UartIO_b_ready: i1, io_Nemu_UartIO_r_ready: i1, io_Zmb_UartIO_aw_valid: i1, io_Zmb_UartIO_aw_bits_id: i4, io_Zmb_UartIO_aw_bits_addr: i32, io_Zmb_UartIO_ar_valid: i1, io_Zmb_UartIO_ar_bits_id: i4, io_Zmb_UartIO_w_valid: i1, io_Zmb_UartIO_w_bits_data: i64, io_Zmb_UartIO_b_ready: i1, io_Zmb_UartIO_r_ready: i1, io_Dmac_aw_valid: i1, io_Dmac_aw_bits_id: i4, io_Dmac_aw_bits_addr: i32, io_Dmac_aw_bits_len: i8, io_Dmac_aw_bits_size: i3, io_Dmac_aw_bits_burst: i2, io_Dmac_ar_valid: i1, io_Dmac_ar_bits_id: i4, io_Dmac_ar_bits_addr: i32, io_Dmac_ar_bits_len: i8, io_Dmac_ar_bits_size: i3, io_Dmac_ar_bits_burst: i2, io_Dmac_w_valid: i1, io_Dmac_w_bits_data: i64, io_Dmac_w_bits_strb: i8, io_Dmac_w_bits_last: i1, io_Dmac_b_ready: i1, io_Dmac_r_ready: i1, io_SdIO_aw_valid: i1, io_SdIO_aw_bits_id: i4, io_SdIO_aw_bits_addr: i32, io_SdIO_ar_valid: i1, io_SdIO_ar_bits_id: i4, io_SdIO_ar_bits_addr: i32, io_SdIO_w_valid: i1, io_SdIO_w_bits_data: i64, io_SdIO_b_ready: i1, io_SdIO_r_ready: i1) {sv.namehint = "sd.io_channel_r_ready"}
    %0 = comb.xor bin %reset, %true {sv.namehint = "sd.io_basic_ARESETn"} : i1
    hw.output %cpu.io_debug_exit, %cpu.io_debug_wbPC, %cpu.io_debug_wbValid, %cpu.io_debug_wbRd, %cpu.io_debug_wbRcsr, %cpu.io_debug_wbMMIO, %cpu.io_debug_wbIntr, %cpu.io_debug_wbRvc, %cpu.io_debug_gprs_0, %cpu.io_debug_gprs_1, %cpu.io_debug_gprs_2, %cpu.io_debug_gprs_3, %cpu.io_debug_gprs_4, %cpu.io_debug_gprs_5, %cpu.io_debug_gprs_6, %cpu.io_debug_gprs_7, %cpu.io_debug_gprs_8, %cpu.io_debug_gprs_9, %cpu.io_debug_gprs_10, %cpu.io_debug_gprs_11, %cpu.io_debug_gprs_12, %cpu.io_debug_gprs_13, %cpu.io_debug_gprs_14, %cpu.io_debug_gprs_15, %cpu.io_debug_gprs_16, %cpu.io_debug_gprs_17, %cpu.io_debug_gprs_18, %cpu.io_debug_gprs_19, %cpu.io_debug_gprs_20, %cpu.io_debug_gprs_21, %cpu.io_debug_gprs_22, %cpu.io_debug_gprs_23, %cpu.io_debug_gprs_24, %cpu.io_debug_gprs_25, %cpu.io_debug_gprs_26, %cpu.io_debug_gprs_27, %cpu.io_debug_gprs_28, %cpu.io_debug_gprs_29, %cpu.io_debug_gprs_30, %cpu.io_debug_gprs_31, %cpu.io_debug_priv, %cpu.io_debug_mstatus, %cpu.io_debug_mepc, %cpu.io_debug_sepc, %cpu.io_debug_mtvec, %cpu.io_debug_stvec, %cpu.io_debug_mcause, %cpu.io_debug_scause, %cpu.io_debug_mtval, %cpu.io_debug_stval, %cpu.io_debug_mie, %cpu.io_debug_mscratch : i3, i64, i1, i5, i12, i1, i1, i1, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i2, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64
  }
  emit.file "./S011HD1P_X32Y2D128_BW.v" sym @blackbox_S011HD1P_X32Y2D128_BW.v {
    emit.verbatim "module S011HD1P_X32Y2D128_BW(\0A  output reg [127:0]                Q,\0A  input                                     CLK,\0A  input                                     CEN,\0A  input                                     WEN,\0A  input      [127:0]                BWEN,\0A  input      [5:0] A,\0A  input      [127:0]                D\0A);\0A  reg [127:0] ram [0:63];\0A  always @(posedge CLK) begin\0A    if (!CEN && !WEN) begin\0A      ram[A] <= (D & ~BWEN) | (ram[A] & BWEN);\0A    end\0A    Q <= !CEN ? (WEN ? ram[A] : (D & ~BWEN) | (ram[A] & BWEN)) : {4{32'hdead_feed}};\0A  end\0Aendmodule\0A    "
  }
  emit.file "./RamRead.v" sym @blackbox_RamRead.v {
    emit.verbatim "\0Aimport \22DPI-C\22 function longint ram_read(input longint addr);\0A\0Amodule RamRead (\0A  input  clock,\0A  input  [63:0] addr,\0A  output reg [63:0] data\0A);\0A\0A  always@(posedge clock) begin\0A    data <= ram_read(addr);\0A  end\0A\0Aendmodule\0A  "
  }
  emit.file "./RamWrite.v" sym @blackbox_RamWrite.v {
    emit.verbatim "\0Aimport \22DPI-C\22 function void ram_write(input longint addr, input longint data, input byte mask);\0A\0Amodule RamWrite (\0A  input  clock,\0A  input  wen,\0A  input  [63:0] addr,\0A  input  [63:0] data,\0A  input  [ 7:0] mask\0A);\0A\0A  always@(posedge clock) begin\0A    if (wen) ram_write(addr, data, mask);\0A  end\0A\0Aendmodule\0A  "
  }
  emit.file "./UartRead.v" sym @blackbox_UartRead.v {
    emit.verbatim "\0Aimport \22DPI-C\22 function void uart_read(input byte addr, output byte ch);\0A\0Amodule UartRead (\0A  input  clock,\0A  input  getc,\0A  input  [7:0] addr,\0A  output reg [7:0] ch\0A);\0A\0A  always@(posedge clock) begin\0A    if (getc) uart_read(addr, ch);\0A  end\0A\0Aendmodule\0A  "
  }
  emit.file "./UartWrite.v" sym @blackbox_UartWrite.v {
    emit.verbatim "\0Aimport \22DPI-C\22 function void uart_write(input byte addr, input byte data);\0A\0Amodule UartWrite (\0A  input clock,\0A  input wen,\0A  input [7:0] waddr,\0A  input [7:0] wdata\0A);\0A\0A  always@(posedge clock) begin\0A    if (wen) uart_write(waddr, wdata);\0A  end\0A\0Aendmodule\0A  "
  }
  emit.file "./UartInt.v" sym @blackbox_UartInt.v {
    emit.verbatim "\0Aimport \22DPI-C\22 function void uart_int(output bit inter);\0A\0Amodule UartInt (\0A  input  clock,\0A  output inter\0A);\0A\0A  always@(posedge clock) begin\0A    uart_int(inter);\0A  end\0A\0Aendmodule\0A  "
  }
  emit.file "./SDCardRead.v" sym @blackbox_SDCardRead.v {
    emit.verbatim "\0Aimport \22DPI-C\22 function void sdcard_read(input longint addr, output int rdata);\0A\0Amodule SDCardRead (\0A  input  clock,\0A  input  ren,\0A  input  [63:0] addr,\0A  output reg [31:0] rdata\0A);\0A\0A  always@(posedge clock) begin\0A    if (ren) sdcard_read(addr, rdata);\0A  end\0A\0Aendmodule\0A  "
  }
  emit.file "./SDCardWrite.v" sym @blackbox_SDCardWrite.v {
    emit.verbatim "\0Aimport \22DPI-C\22 function void sdcard_write(input longint addr, input int data);\0A\0Amodule SDCardWrite (\0A  input clock,\0A  input wen,\0A  input [63:0] waddr,\0A  input [31:0] wdata\0A);\0A\0A  always@(posedge clock) begin\0A    if (wen) sdcard_write(waddr, wdata);\0A  end\0A\0Aendmodule\0A  "
  }
  om.class @TestTop_Class(%basepath: !om.basepath) {
    om.class.fields 
  }
}
