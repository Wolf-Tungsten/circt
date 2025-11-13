// RUN: circt-opt --hw-aggregate-corvus-partitions %s | FileCheck %s

module {
  hw.module private @__corvus_seq_P0(in %clk : i1, in %comb_next0 : i3,
                                     in %comb_next1 : i5, out seq_state0 : i2,
                                     out seq_state1 : i4, out passthru : i1) {
    %state0 = comb.extract %comb_next0 from 0 : (i3) -> i2
    %state1 = comb.extract %comb_next1 from 0 : (i5) -> i4
    hw.output %state0, %state1, %clk : i2, i4, i1
  }

  hw.module private @__corvus_comb_P0(in %clk : i1, in %seq_state0 : i2,
                                      in %seq_state1 : i4,
                                      out comb_to_seq0 : i3,
                                      out comb_to_seq1 : i5,
                                      out comb_top : i1) {
    %c0_i1 = hw.constant 0 : i1
    %comb0 = comb.concat %seq_state0, %c0_i1 : i2, i1
    %comb1 = comb.concat %seq_state1, %c0_i1 : i4, i1
    hw.output %comb0, %comb1, %clk : i3, i5, i1
  }

  hw.module @__corvus_top(in %clk : i1, out top : i1) {
    %comb_to_seq0, %comb_to_seq1, %comb_top = hw.instance "__comb" @__corvus_comb_P0(
      clk: %clk: i1, seq_state0: %seq_state0: i2, seq_state1: %seq_state1: i4
    ) -> (comb_to_seq0: i3, comb_to_seq1: i5, comb_top: i1)
    %seq_state0, %seq_state1, %seq_passthru = hw.instance "__seq" @__corvus_seq_P0(
      clk: %clk: i1, comb_next0: %comb_to_seq0: i3, comb_next1: %comb_to_seq1: i5
    ) -> (seq_state0: i2, seq_state1: i4, passthru: i1)
    hw.output %comb_top : i1
  }
}

// CHECK-LABEL: hw.module private @__corvus_seq_P0
// CHECK-SAME: in %clk : i1
// CHECK-SAME: in %__corvus_bundle_c2s_P0 : i8
// CHECK-SAME: out passthru : i1
// CHECK-SAME: out __corvus_bundle_s2c_P0 : i6
// CHECK: comb.extract %__corvus_bundle_c2s_P0 from 0
// CHECK: comb.extract %__corvus_bundle_c2s_P0 from 3
// CHECK: comb.concat

// CHECK-LABEL: hw.module private @__corvus_comb_P0
// CHECK-SAME: in %clk : i1
// CHECK-SAME: in %__corvus_bundle_s2c_P0 : i6
// CHECK-SAME: out comb_top : i1
// CHECK-SAME: out __corvus_bundle_c2s_P0 : i8
// CHECK: comb.extract %__corvus_bundle_s2c_P0 from 0
// CHECK: comb.extract %__corvus_bundle_s2c_P0 from 2
// CHECK: comb.concat

// CHECK-LABEL: hw.module @__corvus_top
// CHECK: %[[COMB:.*]], %[[C2S_BUNDLE:.*]] = hw.instance "__comb" @__corvus_comb_P0
// CHECK: %[[SEQ:.*]] = hw.instance "__seq" @__corvus_seq_P0
// CHECK-SAME: __corvus_bundle_c2s_P0: %[[C2S_BUNDLE]]
// CHECK: hw.output %[[COMB]] : i1
