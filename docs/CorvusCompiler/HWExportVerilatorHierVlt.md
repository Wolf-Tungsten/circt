# HWExportVerilatorHierVlt Pass

## TODO

这个 pass 生成 verilator vlt 文件指导 verilator 进行层次化编译。

Verilator Control Files 配置并行编译的模板如下:

```
`verilator_config

hier_block -module "<modulename0>"
hier_workers -module "<modulename0>" -workers n
hier_block -module "<modulename1>"
hier_workers -module "<modulename1>" -workers n
...

```

- HWPartitionModules Pass 为每个生成的并行分区都添加了 hw.corvus_partition 属性，值为分区 ID。
- 该 pass 遍历所有 hw.module，寻找带有 hw.corvus_partition 属性的模块，每个模块生成对应的一行 hier_block 和一行 hier_workers 。
- vlt 文件头部包含一行 "\`verilator_config" (注意带一个前导反引号)，之后写入模块的 hier_block 和 hier_workers 行。
- hier_block 和 hier_workers 行的顺序不重要。
- 该 pass 只判断 hw.module 是否具有 hw.corvus_partition 属性，不关心具体的ID。
- 该 pass 插入在 corvus-compiler 的 HWPartitionModules Pass 之后，通过 --verilator-hier-vlt-output 参数选项指定输出文件路径。
- --verilator-hier-vlt-output 参数不是必须的，默认值为空字符串，如果为空串则不生成 vlt 文件。
- --verilator-hier-vlt-output 参数指定的文件如果不存在则创建，如果存在则覆盖。
- --verilator-hier-vlt-workers 参数指定 workers 数量，默认值为 1，对应于 -workers 的 n