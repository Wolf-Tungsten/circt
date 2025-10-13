# RUN: circt-opt --hw-partition-modules="module-name=target" %s | FileCheck %s

module {
  hw.module @target(%a: i1, %b: i1) -> (i1, i1)
      attributes {sym_visibility = "public"} {
    %and = comb.and %a, %b : i1 {repcut_partitions = [0]}
    %or = comb.or %a, %b : i1 {repcut_partitions = [1]}
    hw.output %and, %or : i1, i1
  }
}

// CHECK-LABEL: hw.module @target(
// CHECK: %[[P0:.*]] = hw.instance "target_P0_inst" @target_P0(%{{.*}})
// CHECK: %[[P1:.*]] = hw.instance "target_P1_inst" @target_P1(%{{.*}})
// CHECK: hw.output %[[P0]], %[[P1]] : i1, i1

// CHECK-LABEL: hw.module @target_P0(
// CHECK-SAME: attributes {sym_visibility = "private"}
// CHECK: comb.and
// CHECK: hw.output

// CHECK-LABEL: hw.module @target_P1(
// CHECK-SAME: attributes {sym_visibility = "private"}
// CHECK: comb.or
// CHECK: hw.output
