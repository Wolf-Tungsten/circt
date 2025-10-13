# HWPartitionModules Pass

This document captures the behaviour implemented in
`lib/Dialect/HW/Transforms/HWPartitionModules.cpp`. The pass duplicates the
`hw.module` referenced by `--module-name`, producing one clone per
`repcut_partitions` identifier and rewriting the original module into a wrapper
that instantiates all partition clones.

## High-Level Goals

- Require a `--module-name` option to pick the single `hw.module` that will be
  partitioned; other modules are left untouched.
- Discover every partition identifier recorded in `repcut_partitions`
  attributes within the selected module.
- Produce one clone per partition, remove operations that do not belong to that
  partition, and shrink the port list to the signals that remain in use.
- Keep the original module, transforming it into a wrapper that instantiates
  all partition clones using SSA wiring while preserving the original name,
  visibility, and port ordering.

## Preconditions

- Operations that should survive in a particular partition must carry a
  `repcut_partitions` array attribute whose entries are integer IDs. Multiple
  IDs indicate that the operation should appear in every listed partition.
- `hw.output` is treated as belonging to every partition so terminators are
  always preserved.
- Modules with no operations tagged by `repcut_partitions` are left untouched.

## Processing Flow

### Pass Entry

1. The pass walks every `hw.module` inside the top-level `mlir::ModuleOp`. If
   `--module-name` is omitted the pass becomes a no-op; otherwise, only the
   matching symbol is processed.
2. For each module, gather the distinct partition IDs by visiting all
   operations and inspecting their `repcut_partitions` attribute. A debug
   message is emitted via `llvm::errs()` with the number of discovered
   partitions.
3. Modules without any partition IDs are skipped entirely.

### Building the Partitioned Clones

1. For every discovered partition ID, clone the source module and insert the
   clone immediately after the original.
2. Rename the clone to `<original>_P<partitionId>` so that each partition is
   uniquely identified.
3. Record which results of the original `hw.output` are driven by operations
   that belong to the current partition (or by block arguments); only those
   results are preserved in the clone.
4. Walk the clone's body. Any operation (except the module, `hw.output`, and
   block arguments) whose `repcut_partitions` does not contain the current ID
   is queued for removal. The helper treats missing attributes as "does not
   belong".
5. Erase the queued operations, rewriting uses to drop them safely.
6. Rebuild the `hw.output` with just the retained results identified in step 3.
7. Remove input ports whose block arguments are now unused and discard output
   ports that were not retained. Matching block arguments are erased so the
   clone exposes only the signals that remain relevant to the partition.
8. Store the surviving input and output indices so the wrapper can rewire the
   clones to the original port order.

### Rewriting the Wrapper Module

1. Erase the original operations inside the selected module, leaving the block
   arguments and the terminator in place.
2. Instantiate every partition clone in a deterministic order, feeding each
   instance with the original block arguments corresponding to the stored input
   indices. Instance names follow `<module>_P<ID>_inst`, and the clones are
   marked private.
3. Collect every instance result and map it back to the original module outputs
   using the recorded indices. The wrapper simply forwards the first available
   SSA value for each output slot.
4. Emit a new `hw.output` with the reordered results and erase the original
   terminator. The wrapper's signature, symbol name, and visibility remain
   unchanged.

## Result

- For each partition ID found in a module, the IR contains a clone named
  `<module>_P<ID>` that includes only the operations attributed to that
  partition.
- Each clone has a pruned interface: unused inputs are dropped, and only
  outputs whose producers survived are emitted.
- The original module continues to exist as the wrapper that instantiates all
  partition clones using SSA values only.
- Modules lacking partition annotations remain unchanged, and no new modules
  are emitted for them.
