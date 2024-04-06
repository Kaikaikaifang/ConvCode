// ************************************************************
// Engineer: kaikai
//
// Create Date: 2024/04/05
// Design Name: ConvCode
// Module Name: counter.v
// Tool versions: VsCode
// Description: 计数器
// Parameter:
// 1. NUM: 计数器的最大值
// Input:
// 1. clk_sig: 时钟信号
// 2. reset_sig: 复位信号
// Output:
// 1. counter_sig: 计数器的值
// Notice:
// 1. 计数器的值从 0 开始
// ************************************************************
module counter #(
    parameter NUM = 11'b111_1111_1111
) (
    input                            clk_sig,
    input                            reset_sig,   // 复位信号 低电平有效
    output reg [($clog2(NUM) - 1):0] counter_sig  // 计数器的值
);
    initial begin
        counter_sig <= 0;
    end

    always @(posedge clk_sig) begin
        if (!reset_sig || counter_sig == NUM) begin
            counter_sig <= 0;
        end else begin
            counter_sig <= counter_sig + 1;
        end
    end
endmodule
