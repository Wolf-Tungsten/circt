# HWStripExternalModule Pass

This document explains the transformation implemented in
`lib/Dialect/HW/Transforms/HWStripExternalModule.cpp`. The pass rewrites the
single public `hw.module` in the input (referred to as `user_top`) into a set of
modules that separate user logic from externally handled instances while also
producing a wrapper that preserves the original interface.

## High-Level Goals

- Turn the original public module into a private implementation module named
  `__corvus_top`.
- Create a private companion module `__corvus_external` that contains the
  original instances with their connectivity exposed through ports.
- Generate a public wrapper module whose symbol matches the original `user_top`
  so the external interface remains identical.
- Remove all `sv.bind` operations so that no obsolete bindings remain.

## Processing Flow

### Pass Entry

1. The pass runs on the top-level `mlir::ModuleOp` and expects exactly one
   public `hw.module`.
2. It renames that module to `__corvus_top`, clones it twice inside the same
   `mlir::ModuleOp`, and renames the clones to `__corvus_external` and to the
   original module name.
3. The renamed original module (`__corvus_top`) and `__corvus_external` are
   marked private, while the wrapper (now back under the original symbol name)
   remains public.

### Rewriting the Source Module (`__corvus_top`)

The goal is to surface all instance connections while erasing the instances.

1. Walk all `hw::InstanceOp` operations.
2. For each operand of each instance, append an output port to `__corvus_top`
   using the naming pattern `extp_<instance>_in_<index>` and record the bridge
   ordering.
3. For each result of each instance, append an input port named
   `extp_<instance>_out_<index>`, replace the original SSA result with the new
   block argument, and record the bridge ordering.
4. Erase the instances once their connectivity has been surfaced.

After this rewrite the `__corvus_top` module drives and receives all instance
connections through its interface.

### Rewriting the Cloned Module (`__corvus_external`)

1. Keep the cloned instances and append new input ports (following the recorded
   ordering) for each instance operand. The existing operand uses are updated to
   the new block arguments.
2. Append new output ports for each instance result, forwarding the instance
   results to the appended ports.
3. Remove any pre-existing operations except the instances, strip the original
   ports, and drop the old block arguments.
4. The resulting module contains only the instances and an `hw.output`.

### Building the Wrapper (original module name)

1. Start from the wrapper clone, erase all operations in its body
   except for the terminator, and keep the original block arguments (which still
   match the `user_top` interface).
2. Prepare the operand list for a new `hw.instance` of `__corvus_top` by:
   - Forwarding the original block arguments for the first `user_top` inputs.
   - Creating temporary backedges (SSA placeholders) for each bridge input that
     will later be driven by `__corvus_external`.
3. Instantiate `__corvus_top` with the collected operands. The extra results on
   this instance correspond to the bridge inputs recorded earlier.
4. Instantiate `__corvus_external`, wiring its operands with the bridge results
   produced by the `__corvus_top` instance.
5. Resolve the backedges by setting them to the matching results coming back
   from `__corvus_external`. This connects the two private modules purely through
   SSA values without introducing SystemVerilog ops.
6. Emit an `hw.output` operation that forwards the leading results from the
   `__corvus_top` instance so the wrapper matches the behaviour and signature of
   the original `user_top`.

### Cleanup

After all modules are processed the pass erases every `sv::BindOp` in the
top-level module. This prevents stale binds from referencing the now-removed
internal structure.

## Result

The pass leaves:

- `__corvus_top`: a private module containing the original logic with extra
  ports for every instance connection.
- `__corvus_external`: a private module comprising the extracted instances and
  matching bridge ports.
- A public wrapper under the original `user_top` name that instantiates the
  previous two modules, wires their ports using SSA values (no SystemVerilog ops
  are introduced), and preserves the original IO behaviour of `user_top`.
- No remaining `sv.bind` ops.
