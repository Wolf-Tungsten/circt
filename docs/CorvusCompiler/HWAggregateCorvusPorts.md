# HWAggregateCorvusPorts Pass

This document describes the behaviour implemented in
`lib/Dialect/HW/Transforms/HWAggregateCorvusPorts.cpp`. The pass bundles the
direct connections between `corvus_comb_P*` and `corvus_seq_P*` partitions
instantiated by `corvus_top`. Signals driven by one partition and consumed
exclusively by partitions of the opposite kind are concatenated into a single
bundle per source-partition/destination-set/direction tuple. The producer
exports the bundle, while every consumer in the set receives the same bundle
and immediately extracts its slices into wires to avoid repeated work.

## High-Level Goals

- Discover matching combinational and sequential partition modules and their
  instances under the chosen top module.
- Group signals by their source partition and the complete set of opposite-kind
  destination partitions they feed, allowing one-to-many fan-out.
- Append a bundle port per group and direction, remove the original singleton
  ports, and keep packing/unpacking self-contained within the partition
  modules.
- Rewrite the top-level wiring so downstream passes see the simplified
  interfaces.

## Preconditions and Options

- `--top-module-name` (default `"corvus_top"`) identifies the module whose body
  contains the partition instances. The pass is a no-op if the option is empty
  or the module cannot be found.
- `--comb-partition-prefix` and `--seq-partition-prefix` (defaults
  `"corvus_comb_P"`/`"corvus_seq_P"`) describe how partition modules and
  instances are named. Matching numeric suffixes define partition IDs.
- Every partition ID must have both a combinational and a sequential module
  definition plus exactly one instance of each under the top module. Duplicate
  IDs or missing modules cause pass failure.
- A signal is aggregated only when *all* of its uses are operands of
  opposite-kind partition instances. Any use that targets the top-level IO,
  external modules, or same-kind partitions leaves the signal untouched.

## Processing Flow

1. **Partition discovery.** The pass scans all `hw.module`s for names that match
   the configured prefixes and builds comb/seq module maps keyed by ID. It then
   walks the top module body to locate the corresponding instances and records
   direct comb-to-seq and seq-to-comb uses.
2. **Connection grouping.** Each partition output is examined: if every use
   reaches only opposite-kind partitions, the signal is grouped by its source
   partition, direction, and sorted destination partition set. Every group
   reserves a bundle name of the form `C<source>_to_S<dest1>_<dest2>_bundle` or
   `S<source>_to_C<dest1>_<dest2>_bundle`.
3. **Module rewrite.** For each participating producer module, the grouped
   signals are concatenated (in ascending source port index) into an appended
   bundle output and the original outputs are removed. Every consumer module in
   the destination set receives a matching input port; it extracts each signal
   once into an `hw.wire` and replaces the original input ports before erasing
   them.
4. **Top-level instance rewrite.** Instances under the top module are cloned
   with the new signatures. Kept operands/results are remapped, bundled operands
   are wired from the producer to every consumer in the group, and removed
   ports drop their corresponding operands/results.

## Diagnostics and Limitations

- Missing modules or multiple instances per partition ID are reported as
  `hw`-style errors with the offending operation location.
- Signals that reach anything other than opposite-kind partition instances are
  ignored and left unbundled.
- The concatenation order is fixed by sorting the affected source ports by
  index before packing. Because `comb.concat` concatenates MSB-first, lower
  indices occupy the least-significant bits of the bundle.
- Bundle ports are simple integers; there is no custom maximum width limit
  beyond what `IntegerType` supports.

## Bundle Naming

Every aggregated connection is identified by its source partition and the full
destination set. A bundle that carries signals from `corvus_comb_Px` to
`corvus_seq_Py` and `corvus_seq_Pz` is named `Cx_to_Sy_z_bundle`. The same
label appears on the producer output and on every consumer input participating
in that group.

## Usage

Run the pass either standalone or as part of the Corvus compiler pipeline:

```sh
circt-opt corvus.mlir \
  --hw-aggregate-corvus-ports=top-module-name=corvus_top,
                          seq-partition-prefix=corvus_seq_P,
                          comb-partition-prefix=corvus_comb_P
```

The lit test `test/Dialect/HW/hw-aggregate-corvus-ports.mlir` provides concrete
examples of how the pass rewrites modules and instances.
