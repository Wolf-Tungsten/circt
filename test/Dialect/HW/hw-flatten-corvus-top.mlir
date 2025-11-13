// RUN: circt-opt --hw-flatten-corvus-top %s | FileCheck %s

module {
  hw.module private @__corvus_seq(in %clk : i1, out seq2comb : i1) {
    %seq2comb = hw.instance "__seq_p0" @__corvus_seq_P0(clk: %clk: i1) -> (state: i1)
    hw.output %seq2comb : i1
  }

  hw.module private @__corvus_comb(in %clk : i1, in %seq_state : i1,
                                   out comb2seq : i1, out top_out : i1) {
    %comb2seq, %combOut = hw.instance "__comb_p0" @__corvus_comb_P0(clk: %clk: i1, seq_state: %seq_state: i1)
      -> (comb2seq: i1, top_out: i1)
    hw.output %comb2seq, %combOut : i1, i1
  }

  hw.module private @__corvus_seq_P0(in %clk : i1, out state : i1) {
    hw.output %clk : i1
  }

  hw.module private @__corvus_comb_P0(in %clk : i1, in %seq_state : i1,
                                      out comb2seq : i1, out top_out : i1) {
    hw.output %seq_state, %seq_state : i1, i1
  }

  hw.module private @__corvus_top(in %clk : i1, out top_out : i1) {
    %seq2comb = hw.instance "__corvus_seq_inst" @__corvus_seq(clk: %clk: i1) -> (seq2comb: i1)
    %comb2seq, %topResult = hw.instance "__corvus_comb_inst"
      @__corvus_comb(clk: %clk: i1, seq_state: %seq2comb: i1)
      -> (comb2seq: i1, top_out: i1)
    hw.output %topResult : i1
  }
}

// CHECK-NOT: hw.module private @__corvus_seq(
// CHECK-NOT: hw.module private @__corvus_comb(
// CHECK-LABEL: hw.module private @__corvus_seq_P0
// CHECK: hw.output %clk : i1
// CHECK-LABEL: hw.module private @__corvus_comb_P0
// CHECK: hw.output %seq_state, %seq_state : i1, i1
// CHECK-LABEL: hw.module private @__corvus_top
// CHECK: hw.instance "__corvus_seq_inst.__seq_p0" @__corvus_seq_P0
// CHECK: hw.instance "__corvus_comb_inst.__comb_p0" @__corvus_comb_P0
