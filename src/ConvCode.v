// ************************************************************
// Engineer: kaikai
//
// Create Date: 2024/04/05
// Design Name: ConvCode
// Module Name: ConvCode.v
// Tool versions: VsCode
// Description: (2, 1, 2) 卷积码的编译码
// Parameter:
// 1. None
// Input:
// 1. clk_sig: 时钟信号 20 MHz
// 2. reset_sig: 复位信号
// Output:
// 1. encode_sig: 编码后的信号
// 2. decode_sig: 解码后的信号
// 3. noise_sig: 噪声信号
// 4. encode_noise_sig: 编码后的信号加噪声
// 5. q_sig: ROM 中的数据
// ************************************************************

module ConvCode (
    input             clk20M_sig,
    input             reset_sig,          // 复位信号 低电平有效
    output wire [1:0] encode_sig,         // 编码后信号
    output wire [0:0] serial_encode_sig,
    // output reg [ 0:0] decode_sig,
    // output reg [ 0:0] noise_sig,
    // output reg [ 0:0] encode_noise_sig,
    output wire [0:0] q_sig               // 信源信号
);
    wire [10:0] address_sig;
    wire        clk10M_sig;

    // 0. 二分频生成 10 MHz 时钟信号

    // 1. 生成 ROM 的地址信号
    counter #(
        .NUM(11'b111_1111_1111)
    ) counter_inst (
        .clk_sig    (clk20M_sig),
        .reset_sig  (reset_sig),
        .counter_sig(address_sig)
    );
    // 2. 获取 ROM 中存储的数据
    rom rom_inst (
        .address(address_sig),
        .clock  (clk20M_sig),
        .q      (q_sig)
    );
    // 3. 信道编码：(2, 1, 2) 卷积码
    encode encode_inst (
        .clk_sig   (clk20M_sig),
        .reset_sig (reset_sig),
        .q_sig     (q_sig),
        .encode_sig(encode_sig)   // 编码后信号 2 位 10 MHz
    );
    // 4. 并串转换：将编码后的信号转换为串行信号
    parallel2serial #(
        .WIDTH(2)
    ) parallel2serial_inst (
        .clk_sig     (clk20M_sig),        // 2 * WIDTH * 10 MHz = 40 MHz
        .reset_sig   (reset_sig),
        .parallel_sig(encode_sig),
        .serial_sig  (serial_encode_sig)
    );
endmodule
