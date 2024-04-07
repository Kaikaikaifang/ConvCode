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
    input clk20M_sig,
    input reset_sig,   // 复位信号 低电平有效

    output wire       clk10M_sig,
    output wire [0:0] q_sig,                      // 信源信号
    output wire [1:0] encode_sig,                 // 编码后信号
    output wire [0:0] serial_encode_sig,          // 编码后串行信号
    output wire [0:0] noise_sig,                  // 噪声信号
    output wire [0:0] encode_noise_sig,           // 编码后串行加噪信号
    output wire [1:0] parallel_encode_noise_sig,  // 编码后并行加噪信号
    output wire [0:0] decode_sig
);
    wire [10:0] address_sig;
    wire [ 0:0] reset_sig_p;
    // (2, 1, 3) Viterbi decoder
    wire [ 0:0] tb_en;
    wire [ 0:0] error;
    wire [ 0:0] Dx_oe;

    assign reset_sig_p      = ~reset_sig;
    assign encode_noise_sig = serial_encode_sig ^ noise_sig;

    // 0. 二分频生成 10 MHz 时钟信号
    div #(
        .NUM (2),
        .DUTY(1)
    ) div_inst (
        .clk_sig(clk20M_sig),
        .div_sig(clk10M_sig)
    );

    // 1. 生成 ROM 的地址信号
    counter #(
        .NUM(2048)
    ) counter_inst (
        .clk_sig    (clk10M_sig),
        .reset_sig  (reset_sig),
        .counter_sig(address_sig)
    );
    // 2. 获取 ROM 中存储的数据
    rom rom_inst (
        .address(address_sig),
        .clock  (clk10M_sig),
        .q      (q_sig)
    );

    // 3. 信道编码：(2, 1, 3) 卷积码
    VIT_ENC viterbi_enc_inst (
        .clock(clk10M_sig),
        .reset(reset_sig_p),
        .Ux   (q_sig),
        .tb_en(tb_en),
        .Vx   (encode_sig)
    );

    // 4. 并串转换：将编码后的信号转换为串行信号
    parallel2serial #(
        .WIDTH(2)
    ) parallel2serial_inst (
        .clk_sig     (clk20M_sig),        // 2 * WIDTH * 5 MHz = 20 MHz
        .reset_sig   (reset_sig),
        .parallel_sig(encode_sig),        // 编码后并行信号 2 位 5 MHz
        .serial_sig  (serial_encode_sig)  // 串行信号 1 位 10 MHz
    );

    // 5. 加噪声信号
    noise #(
        .INTERVAL(15)
    ) noise_inst (
        .clk_sig  (clk20M_sig),
        .reset_sig(reset_sig),
        .noise_sig(noise_sig)
    );

    // 6. 串并转换：将串行信号转换为并行信号
    serial2parallel #(
        .WIDTH(2)
    ) serial2parallel_inst (
        .clk_sig     (clk20M_sig),                // 20 MHz
        .reset_sig   (reset_sig),
        .serial_sig  (encode_noise_sig),          // 编码后加噪信号 10 MHz
        .parallel_sig(parallel_encode_noise_sig)  // 编码后加噪并行信号 2 位 5 MHz
    );

    // // 7. 信道解码
    // viterbi viterbi_inst (
    //     .clk           (clk10M_sig),
    //     .reset         (reset_sig),
    //     .source_rdy    (1),
    //     .sink_val      (1),
    //     .rr            (parallel_encode_noise_sig),
    //     .eras_sym      (2'b00),
    //     .sink_rdy      (),
    //     .source_val    (),
    //     .decbit        (decode_sig),
    //     .normalizations()
    // );

    // 7. (2, 1, 3) 卷积码解码
    eVITERBI_213 viterbi_inst (
        .clock(clk10M_sig),
        .reset(reset_sig_p),
        .Rx   (encode_sig),

        .error(error),
        .Dx_oe(Dx_oe),

        .Dx(decode_sig)
    );

endmodule
