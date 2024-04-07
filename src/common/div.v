// ************************************************************
// Engineer: kaikai
//
// Create Date: 2024/04/05
// Design Name: ConvCode
// Module Name: div.v
// Tool versions: VsCode
// Description: 分频器
// Parameter:
// 1. NUM: 分频数
// 2. DUTY: 占空比
// Input:
// 1. clk_sig: 时钟信号
// Output:
// 1. div_sig: 分频后的信号
// ************************************************************
module div #(
    parameter NUM  = 4,  // 分频数
    parameter DUTY = 2   // 占空比: 2/4 = 50%
) (
    input  wire clk_sig,
    output reg  div_sig
);
    initial begin
        div_sig = 0;
    end

    wire [($clog2(NUM - 1) - 1):0] counter_sig;
    counter #(
        .NUM(NUM)
    ) counter_inst (
        .clk_sig  (clk_sig),
        .reset_sig(1'b1),

        .counter_sig(counter_sig)
    );

    always @(posedge clk_sig)
        if (counter_sig < DUTY)  // 4 分频 * 50% 占空比
            div_sig <= 1;
        else div_sig <= 0;
endmodule
