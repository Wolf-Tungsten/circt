// RUN: circt-opt --hw-partition-modules="module-name=target" %s | FileCheck %s

module {
  hw.module @target(in %a : i1, in %b : i1,
                    out target_out0 : i1, out target_out1 : i1)
      attributes {sym_visibility = "public"} {
    %and = comb.and %a, %b {hw.repcut_partitions = [0 : ui32]} : i1
    %or = comb.or %a, %b {hw.repcut_partitions = [1 : ui32]} : i1
    hw.output %and, %or : i1, i1
  }
}

// CHECK-LABEL: hw.module public @target(
// CHECK-SAME: in %{{.*}} : i1, in %{{.*}} : i1, out target_out0 : i1, out target_out1 : i1
// CHECK: %[[P0:.*]] = hw.instance "target_P0_inst" @target_P0
// CHECK: %[[P1:.*]] = hw.instance "target_P1_inst" @target_P1
// CHECK: hw.output %[[P0]], %[[P1]] : i1, i1

// CHECK-LABEL: hw.module private @target_P1(
// CHECK-SAME: in %{{.*}} : i1, in %{{.*}} : i1, out target_out1 : i1
// CHECK: comb.or
// CHECK: hw.output

// CHECK-LABEL: hw.module private @target_P0(
// CHECK-SAME: in %{{.*}} : i1, in %{{.*}} : i1, out target_out0 : i1
// CHECK: comb.and
// CHECK: hw.output
