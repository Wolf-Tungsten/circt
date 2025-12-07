// RUN: circt-opt --hw-aggregate-corvus-ports %s | FileCheck %s

module {
  hw.module private @corvus_seq_P0(in %clk : i1, in %comb_a : i2,
                                   in %comb_b : i3,
                                   out seq_to_comb_a : i2,
                                   out seq_to_comb_b : i3,
                                   out seq_passthru : i1) {
    %a0 = comb.extract %comb_a from 0 : (i2) -> i1
    %b0 = comb.extract %comb_b from 0 : (i3) -> i1
    %passthru = comb.or %a0, %b0 : i1
    hw.output %comb_a, %comb_b, %passthru : i2, i3, i1
  }

  hw.module private @corvus_seq_P1(in %clk : i1, in %comb_a : i2,
                                   in %comb_b : i3,
                                   out seq1_passthru : i1) {
    %a0 = comb.extract %comb_a from 0 : (i2) -> i1
    hw.output %a0 : i1
  }

  hw.module private @corvus_comb_P0(in %clk : i1, in %seq_to_comb_a : i2,
                                    in %seq_to_comb_b : i3,
                                    out comb_to_seq_a : i2,
                                    out comb_to_seq_b : i3,
                                    out comb_top : i1) {
    %a0 = comb.extract %seq_to_comb_a from 0 : (i2) -> i1
    %b0 = comb.extract %seq_to_comb_b from 0 : (i3) -> i1
    %top = comb.or %a0, %b0 : i1
    hw.output %seq_to_comb_a, %seq_to_comb_b, %top : i2, i3, i1
  }

  hw.module private @corvus_comb_P1(in %clk : i1, in %seq_to_comb_a : i2,
                                    in %seq_to_comb_b : i3,
                                    out comb1_top : i1) {
    %a0 = comb.extract %seq_to_comb_a from 0 : (i2) -> i1
    %b0 = comb.extract %seq_to_comb_b from 0 : (i3) -> i1
    %res = comb.xor %a0, %b0 : i1
    hw.output %res : i1
  }

  hw.module @corvus_top(in %clk : i1, out top : i1) {
    %c0_to_s_a, %c0_to_s_b, %comb_top = hw.instance "__comb0" @corvus_comb_P0(
      clk: %clk: i1, seq_to_comb_a: %s0_to_comb_a: i2,
      seq_to_comb_b: %s0_to_comb_b: i3
    ) -> (comb_to_seq_a: i2, comb_to_seq_b: i3, comb_top: i1)
    %s0_to_comb_a, %s0_to_comb_b, %seq0_passthru = hw.instance "__seq0" @corvus_seq_P0(
      clk: %clk: i1, comb_a: %c0_to_s_a: i2, comb_b: %c0_to_s_b: i3
    ) -> (seq_to_comb_a: i2, seq_to_comb_b: i3, seq_passthru: i1)
    %seq1_passthru = hw.instance "__seq1" @corvus_seq_P1(
      clk: %clk: i1, comb_a: %c0_to_s_a: i2, comb_b: %c0_to_s_b: i3
    ) -> (seq1_passthru: i1)
    %comb1_top = hw.instance "__comb1" @corvus_comb_P1(
      clk: %clk: i1, seq_to_comb_a: %s0_to_comb_a: i2,
      seq_to_comb_b: %s0_to_comb_b: i3
    ) -> (comb1_top: i1)
    hw.output %comb_top : i1
  }
}

// CHECK-LABEL: hw.module private @corvus_seq_P0
// CHECK-SAME: in %clk : i1
// CHECK-SAME: in %C0_to_S0_1_bundle : i35
// CHECK-SAME: out seq_passthru : i1
// CHECK-SAME: out S0_to_C0_1_bundle : i35
// CHECK: comb.extract %C0_to_S0_1_bundle from 0
// CHECK: hw.wire %{{.*}} sym @C0_to_S0_1_bundle_slice0_sym0
// CHECK: comb.extract %C0_to_S0_1_bundle from 32
// CHECK: hw.wire %{{.*}} sym @C0_to_S0_1_bundle_slice1_sym1
// CHECK: hw.constant 0 : i30
// CHECK: comb.concat

// CHECK-LABEL: hw.module private @corvus_seq_P1
// CHECK-SAME: in %C0_to_S0_1_bundle : i35
// CHECK: comb.extract %C0_to_S0_1_bundle from 0
// CHECK: comb.extract %C0_to_S0_1_bundle from 32

// CHECK-LABEL: hw.module private @corvus_comb_P0
// CHECK-SAME: in %S0_to_C0_1_bundle : i35
// CHECK-SAME: out comb_top : i1
// CHECK-SAME: out C0_to_S0_1_bundle : i35
// CHECK: comb.extract %S0_to_C0_1_bundle from 0
// CHECK: comb.extract %S0_to_C0_1_bundle from 32
// CHECK: hw.constant 0 : i30
// CHECK: comb.concat

// CHECK-LABEL: hw.module private @corvus_comb_P1
// CHECK-SAME: in %S0_to_C0_1_bundle : i35
// CHECK: comb.extract %S0_to_C0_1_bundle from 0
// CHECK: comb.extract %S0_to_C0_1_bundle from 32

// CHECK-LABEL: hw.module @corvus_top
// CHECK: %[[COMB0_TOP:.*]], %[[C_TO_S:.*]] = hw.instance "__comb0" @corvus_comb_P0
// CHECK: %[[SEQ0_PASS:.*]], %[[S_TO_C:.*]] = hw.instance "__seq0" @corvus_seq_P0
// CHECK-SAME: C0_to_S0_1_bundle: %[[C_TO_S]]
// CHECK: hw.instance "__seq1" @corvus_seq_P1
// CHECK-SAME: C0_to_S0_1_bundle: %[[C_TO_S]]
// CHECK: hw.instance "__comb1" @corvus_comb_P1
// CHECK-SAME: S0_to_C0_1_bundle: %[[S_TO_C]]
// CHECK: hw.output %[[COMB0_TOP]] : i1
