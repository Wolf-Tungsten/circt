# HWAggregateCorvusPorts Pass

This document describes the behaviour implemented in
`lib/Dialect/HW/Transforms/HWAggregateCorvusPorts.cpp`. The pass bundles the
one-to-one connections that exist between `__corvus_comb_P*`/
`__corvus_seq_P*` partitions instantiated by `__corvus_top`, regardless of
whether the producer and consumer share the same partition ID. Instead of
thousands of tiny single-bit ports, the pass creates an aggregate port per
partition pair and direction, concatenates the producer signals, and extracts them
inside the consumer. The module interfaces grow by at most two ports per
partition while the number of cross-partition wires drops significantly.

## High-Level Goals

- Detect paired combinational and sequential partition modules that are both
  instantiated under the chosen top module, even when their numeric IDs differ.
- Prove that each partition pair communicates solely through direct SSA uses
  between the two instances (no fan-out, no other consumers).
- Append a bundle port per data flow direction when such direct connections
  exist, remove the original singleton ports, and update instance wiring to use
  the bundles instead.
- Keep every partition module self-contained: bundling happens inside the
  partition modules and the top-level wiring is updated afterwards so that
  downstream passes interact with a cleaned-up interface.

## Preconditions and Options

- `--top-module-name` (default `"__corvus_top"`) identifies the module whose
  body contains the partition instances. The pass is a no-op if the option is
  empty or the module cannot be found.
- `--comb-partition-prefix` and `--seq-partition-prefix` (defaults
  `"__corvus_comb_P"`/`"__corvus_seq_P"`) describe how partition modules and
  instances are named. Matching numeric suffixes define partition IDs.
- Every partition ID must have both a combinational and a sequential module
  definition plus exactly one instance of each under the top module. Duplicate
  IDs or missing modules cause pass failure.
- Only direct SSA uses between the two instances are aggregated. Each result
  must have exactly one use and that use must be an operand of the matching
  partner instance. Any other wiring leaves the signal untouched.

## Processing Flow

1. **Partition discovery.** The pass scans all `hw.module`s for names that match
   the configured prefixes and builds comb/seq module maps keyed by ID. It then
   walks the top module body to locate the corresponding instances and records
   every direct one-to-one connection between a comb partition `Px` and a seq
   partition `Py`. Each `(Px, Py)` pair becomes a candidate bundle and reserves
   the port names `CPx_to_SPy` and `SPy_to_CPx`.
2. **Signal analysis.** For each candidate partition the pass collects two
   ordered lists:
   - `combToSeq`: combinational instance outputs that are consumed solely by the
     sequential instance.
   - `seqToComb`: sequential instance outputs used only by the combinational
     instance.
   Bit widths are summed to build the integer bundle type; zero-width or
   non-integer signals trigger diagnostics.
3. **Module rewrite.** For each module that participates in at least one bundle
   direction:
   - The original ports that make up the bundle are removed (along with their
     block arguments or `hw.output` operands) and their indices are recorded.
   - A single appended port carrying the packed bundle value is added. Packing
     uses `comb.concat` of integer-casted signals so bit layout is deterministic.
   - The module body is updated to unpack the bundle via `comb.extract` followed
     by optional `hw.bitcast` back to the original types. The metadata keeps
     track of which original ports were removed and how existing ports were
     shifted, enabling callers to remap uses.
4. **Top-level instance rewrite.** Once all affected modules have updated
   signatures, the top module revisits each partition pair:
   - Instances are cloned with the new signature, their operands/results are
     remapped using the bookkeeping information, and the bundled operands are
     plumbed between the comb and seq instances.
   - Any original results/operands that disappeared are dropped and users are
     rewired to the new instance results.
   - If no bundles were introduced for a partition, its instances remain
     untouched.

## Diagnostics and Limitations

- Missing modules or multiple instances per partition ID are reported as
  `hw`-style errors with the offending operation location.
- The pass ignores partitions whose signals are not strictly one-to-one; those
  ports remain as-is. This conservative requirement ensures the aggregation does
  not change observable behaviour.
- The concatenation order is fixed by sorting the affected ports by their
  original index before packing. The most significant bits correspond to higher
  indices because `comb.concat` concatenates MSB-first.
- Bundle ports are simple integers. The pass intentionally avoids creating
  `hw.struct` or nested aggregates to keep downstream Verilog emission simple
  and to match the expectations of the Corvus backend.

## Bundle Naming

Every aggregated connection is identified by its source and destination
partition IDs plus the source partition type. A bundle that carries signals
from `__corvus_comb_Px` to `__corvus_seq_Py` is named `CPx_to_SPy`. The same
label is used on both modules participating in that direction (the comb module
exposes the bundle as an output, while the seq module consumes it as an input).
The reverse direction uses the flipped name `SPy_to_CPx`. This scheme avoids
collisions across different partition pairs and makes it obvious which pair of
instances the bundle belongs to.

## Usage

Run the pass either standalone or as part of the Corvus compiler pipeline:

```sh
circt-opt corvus.mlir \
  --hw-aggregate-corvus-ports=top-module-name=__corvus_top,
                          seq-partition-prefix=__corvus_seq_P,
                          comb-partition-prefix=__corvus_comb_P
```

The lit test `test/Dialect/HW/hw-aggregate-corvus-ports.mlir` provides concrete
examples of how the pass rewrites modules and instances.
