# HWSplitSeqComb Pass

This document captures the behaviour implemented in
`lib/Dialect/HW/Transforms/HWSplitSeqComb.cpp`. The pass rewrites a selected
flattened `hw.module` so that sequential state is isolated from combinational
logic while the original interface is preserved through a wrapper.

## High-Level Goals

- Accept a `--module-name` option (default `__corvus_top`) to pick the
  `hw.module` that will be rewritten.
- Clone the original module into two private siblings named `__corvus_seq`
  (sequential partition) and `__corvus_comb` (combinational partition).
- Move every `seq` state operation into `__corvus_seq`, keeping only the
  surrounding combinational logic in `__corvus_comb`.
- Materialise the boundary between the two partitions as explicit ports using
  the existing sequential/combinational naming conventions.
- Rewrite the original module body into a wrapper that instantiates
  `__corvus_seq` and `__corvus_comb`, wiring them via SSA while maintaining the
  original interface and attributes.

## Processing Flow

### Pass Entry

1. The pass looks up the first `hw.module` whose symbol matches the
   `--module-name` option (default `__corvus_top`). If no match is found—or if
   multiple modules share the requested name—it emits an error.
2. It verifies that `__corvus_seq` and `__corvus_comb` do not already exist in
   the IR to avoid name clashes.
3. Two clones of the matched module are inserted immediately after it and
   renamed to `__corvus_seq` and `__corvus_comb`, both marked private. The
   original module remains in place and will become the wrapper.

### Building the Sequential Module (`__corvus_seq`)

1. Remove the original output ports and replace the terminator with an empty
   `hw.output`. This clears the port list before new boundary ports are added.
2. Walk every sequential boundary op:
   - Sequential ops are `seq::FirRegOp`, `seq::FirMemReadOp`,
     `seq::FirMemWriteOp`, and `seq::FirMemReadWriteOp`. Their accompanying
     `seq::FirMemOp` declarations are considered state anchors.
   - For each operand, append a new input port named `s_in_<N>` unless the
     operand is a constant or a memory declaration handle. Uses of the operand
     are rewritten to the newly created block argument.
   - For each result, append a new output port named `s_out_<N>`.
3. Collect and erase every operation that is neither a sequential boundary op,
   a `seq::FirMemOp`, an `hw::ConstantOp`, nor the final `hw.output`. The body
   is reduced to state operations plus constants.
4. Drop the original input ports and corresponding block arguments; `__corvus_seq`
   exposes only dynamically created boundary ports.

### Building the Combinational Module (`__corvus_comb`)

1. Cache all sequential boundary ops and `seq::FirMemOp` declarations before
   mutating the body.
2. For each operand of the cached sequential ops, append a port named
   `to_s_<N>`. These ports drive the matching inputs on `<orig>_S`.
3. For each result of the cached sequential ops, append a port named
   `from_s_<N>`, and replace every SSA use of that result with the new block
   argument. These inputs receive state outputs from `<orig>_S`.
4. Erase the sequential ops and memory declarations from the body. The
   remaining operations are combinational (plus any constants).
5. Original inputs and outputs are retained so `__corvus_comb` still conforms to
   the user-visible interface.

### Rebuilding the Wrapper (original module)

1. Erase the existing operations in the original module body (except for the
   terminator) but keep the block arguments, preserving the original port list,
   visibility, and attributes.
2. Instantiate `__corvus_comb`, wiring its leading operands with the wrapper
   inputs. For each appended `from_s_*` input, create a temporary SSA backedge.
3. Instantiate `__corvus_seq`, wiring each of its inputs with the appended
   `to_s_*` results coming out of the combinational instance.
4. Resolve the backedges by connecting them to the outputs produced by
   `__corvus_seq`.
5. Emit an `hw.output` forwarding the first `__corvus_comb` results so the
   wrapper’s interface remains identical to the original module.

### Result

After the pass, the IR contains:

- `__corvus_seq`: a private module exporting sequential state through newly
  generated boundary ports.
- `__corvus_comb`: a private module containing the combinational logic with
  additional ports to communicate with the sequential partition.
- The original module, now acting as a wrapper, instantiating the two partitions
  and reconnecting them purely via SSA while keeping the original signature and
  attributes intact.
