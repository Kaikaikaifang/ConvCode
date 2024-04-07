# ConvCode

> 基于 Verilog 的 (2, 1, 3) 卷积码的编译码实验

## Tree

> 项目目录结构

```shell
.
├── README.md     # 本文件
├── ConvCode.qpf  # 项目文件
├── ConvCode.qsf  # 项目配置文件
├── ConvCode.sdc  # 时序约束文件
├── assets        # 静态资源(数据源文件)
│   ├── codeFile.txt
│   ├── data.mif
│   └── testvectors_213.txt
├── params_e213.v # efficient viterbi params 
├── scripts       # 脚本
│   └── text2mif.py
├── src           # 源代码
│   ├── ConvCode.v  # 入口文件
│   ├── common      # 通用模块
│   │   ├── counter.v
│   │   ├── div.v
│   │   ├── mseries.v
│   │   ├── noise.v
│   │   ├── parallel2serial.v
│   │   └── serial2parallel.v
│   ├── ip          # ip 核
│   │   └── rom
│   │       ├── rom.qip
│   │       ├── rom.v
│   │       └── rom_bb.v
│   └── service     # 服务
│       ├── VIT_ENC.v  # (2, 1, 3) conv encode
│       ├── eACSU_213.v
│       ├── eACS_213.v
│       ├── eBMU_213.v
│       ├── eCONTROL_213.v
│       ├── eSYNCERR_213.v
│       ├── eTBDECISION_213.v
│       ├── eVITERBI_213.v  # (2, 1, 3) viterbi decode
│       └── encode.v   # (2, 1, 2) conv encode
└── test            # testbench
    ├── ConvCode_tb.v
    ├── counter_tb.v
    ├── div_tb.v
    ├── e213_tb.v
    ├── mseries_tb.v
    ├── noise_tb.v
    └── viterbi_tb.v
```

## ROM

> 使用 ROM IP 核

ROM 中存储位宽为 1 的 2048 个数据

### 生成 `.mif` 数据源文件

编写 `python` 脚本：[text2mif.py](scripts/text2mif.py)

## 编码流程

(2, 1, 2) 卷积编码

1. $v^{1}=u_{i}+ u_{i-1} + u_{i-2}$
2. $v^{0}=u_{i}+ u_{i-2}$

(2, 1, 3) 卷积编码

1. $v^{1}=u_{i}+ u_{i-1} + u_{i-3}$
2. $v^{0}= u_{i}+ u_{i-1} + u_{i-2} + u_{i-3}$

分析输出波形：

(2, 1, 2) 卷积编码

前 4 位信息信号为 `4'b0101`，可作如下分析：

1. 最初，`q_sig` 为 0，编码信号为 `2'b00`, 状态为 `2'b00`
2. `q_sig` 变为 1，编码输出 `2'b11`, 状态转移为 `2'b10`
3. `q_sig` 变为 0，编码输出 `2'b10`, 状态转移为 `2'b01`
4. `q_sig` 变为 1，编码输出 `2'b00`, 状态转移为 `2'b10`

(2, 1, 3) 卷积编码

前 4 位信息信号为 `4'b0101`，可作如下分析：

1. 最初，`q_sig` 为 0，编码信号为 `2'b00`, 状态为 `2'b000`
2. `q_sig` 变为 1，编码输出 `2'b11`, 状态转移为 `2'b100`
3. `q_sig` 变为 0，编码输出 `2'b01`, 状态转移为 `2'b010`
4. `q_sig` 变为 1，编码输出 `2'b00`, 状态转移为 `2'b101`

## parallel2serial

> 并串转换

通过并串转换将 2 位并行信号 `encode_sig` 转为串行信号 `serial_encode_sig` 。

## + Noise

> 通过 M 序列发生器以及计数器产生噪声信号

## efficient viterbi decode

### 参考文献

1. [FPGA Based Storage Efficient Viterbi Decoders](https://github.com/jfoshea/Viterbi-Decoder-in-Verilog/blob/master/docs/FPGA%20Based%20Storage%20Efficient%20Viterbi%20Decoders.pdf)
2. [MastersThesis](https://github.com/jfoshea/Viterbi-Decoder-in-Verilog/blob/master/docs/MastersThesis.pdf)
