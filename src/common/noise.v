// ************************************************************
// Engineer: kaikai
//
// Create Date: 2024/04/06
// Design Name: ConvCode
// Module Name: noise.v
// Tool versions: VsCode
// Description: 信道噪声 借助 M 序列生成
// Parameter:
// 1. INTERVAL: 信道噪声的间隔
// Input:
// 1. clk_sig: 时钟信号
// 2. reset_sig: 复位信号
// Output:
// 1. noise_sig: 噪声信号
// ************************************************************
module noise #(
    parameter INTERVAL = 15
) (
    input  wire       clk_sig,
    input  wire       reset_sig,
    output reg  [0:0] noise_sig
);
    wire [                     0:0] m_sig;
    wire [($clog2(INTERVAL) - 1):0] counter_sig;

    // 1. 生成 M 序列
    mseries #(
        .M(4)
    ) mseries_inst (
        .clk_sig(clk_sig),
        .rst_sig(reset_sig),
        .m_sig  (m_sig)
    );

    // 2. 记数
    counter #(
        .NUM(INTERVAL + 1)
    ) counter_inst (
        .clk_sig    (clk_sig),
        .reset_sig  (reset_sig),
        .counter_sig(counter_sig)
    );

    // 2. 信道噪声
    always @(posedge clk_sig) begin
        if (!reset_sig) begin
            noise_sig <= 0;
        end else if (counter_sig == INTERVAL) begin
            noise_sig <= m_sig;
        end else begin
            noise_sig <= 0;
        end
    end
endmodule
