// ************************************************************
// Engineer: kaikai
//
// Create Date: 2024/04/05
// Design Name: ConvCode
// Module Name: encode.v
// Tool versions: VsCode
// Description: (2, 1, 2) 卷积码编码器
// Parameter:
// 1. 
// Input:
// 1. clk_sig: 时钟信号
// 2. reset_sig: 复位信号
// 3. q_sig: 信息信号
// Output:
// 1. encode_sig: 编码后的信号
// ************************************************************
module encode (
    input clk_sig,
    input reset_sig,  // 复位信号 低电平有效
    input q_sig,      // 信息信号

    output reg [1:0] encode_sig  // 编码后信号
);
    reg [1:2] state_sig;

    initial begin
        state_sig  <= 2'b00;
        encode_sig <= 2'b00;
    end

    // 1. 状态机 存储状态的最大延迟为 2
    always @(posedge clk_sig) begin
        if (!reset_sig) begin
            state_sig <= 2'b00;
        end else begin
            state_sig <= {q_sig, state_sig[1]};
        end
    end

    // 2. 编码器
    always @(posedge clk_sig) begin
        if (!reset_sig) begin
            encode_sig <= 2'b00;
        end else begin
            encode_sig <= {q_sig + state_sig[1] + state_sig[2], q_sig + state_sig[2]};
        end
    end
endmodule
