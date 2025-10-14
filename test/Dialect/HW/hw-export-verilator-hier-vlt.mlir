// RUN: circt-opt %s --hw-export-verilator-hier-vlt="verilator-hier-vlt-output=%t.vlt verilator-hier-vlt-workers=4" >/dev/null
// RUN: FileCheck %s --input-file=%t.vlt --check-prefix=FILE

module {
  hw.module @foo(in %in : i1)
      attributes {hw.corvus_partition = 0 : i64} {
    hw.output
  }

  hw.module @bar(in %in : i1) {
    hw.output
  }

  hw.module @baz(in %in : i1)
      attributes {hw.corvus_partition = 1 : i64} {
    hw.output
  }
}

// FILE: `verilator_config
// FILE-EMPTY:
// FILE-NEXT: hier_block -module "foo"
// FILE-NEXT: hier_workers -module "foo" -workers 4
// FILE-NEXT: hier_block -module "baz"
// FILE-NEXT: hier_workers -module "baz" -workers 4
