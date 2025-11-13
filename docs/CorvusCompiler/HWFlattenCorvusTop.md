# HWFlattenCorvusTop Pass

This document captures the behaviour implemented in
`lib/Dialect/HW/Transforms/HWFlattenCorvusTop.cpp`. The pass rewrites the
`hw.module` specified by `--top-module-name` (default `__corvus_top`) by
flattening any instances of the sequential and combinational wrapper modules
(`__corvus_seq` and `__corvus_comb` by default). The goal is to remove the extra
hierarchy level that `HWPartitionModules` introduces so that the top module
directly instantiates every partition clone.

## High-Level Goals

- Accept options to identify the top module plus the sequential and
  combinational wrappers that should be inlined (`--seq-wrapper-name` and
  `--comb-wrapper-name`).
- Inline the wrapper bodies *only* when they are instantiated inside the top
  module, leaving other uses untouched, and delete the wrappers once they
  become unused.
- Preserve the original interface of `__corvus_top` while ensuring its body
  consists solely of `hw.instance` operations whose operands/results are wired
  via SSA.

## Processing Flow

1. Look up the top module, sequential wrapper, and combinational wrapper by the
   configured names. If the top module is missing, the pass fails. Missing
   wrappers are silently ignored so the pass can run even when partitioning was
   skipped.
2. For each wrapper (`__corvus_seq` and `__corvus_comb`):
   - Gather all `hw.instance` operations inside the top module that reference
     the wrapper.
   - For every such instance, clone the wrapper body into the top module using
     an `IRMapping` that binds the wrapper inputs to the instance operands.
     Only `hw.instance` operations are allowed inside the wrapper body; the pass
     errors out if other operations are encountered.
   - Connect the cloned instances' results to the consumers of the original
     wrapper instance outputs, then erase the wrapper instance.
3. The output values of the wrapper are remapped through SSA, keeping the top
   module ports unchanged and avoiding any extra wiring operations.

## Result

After the pass runs:

- `__corvus_top` no longer instantiates `__corvus_seq` and `__corvus_comb`.
  Instead it contains the `_P*` partition instances directly.
- All inter-instance connections remain SSA wires; no extra `hw` ops (besides
  `hw.instance` and the final `hw.output`) are introduced.
- Wrapper modules are removed entirely once they no longer have users, so the
  IR only contains the `_P*` clones and the flattened `__corvus_top`.
