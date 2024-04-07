// ************************************************************
// Engineer: kaikai
//
// Create Date: 2024/04/05
// Design Name: ConvCode
// Module Name: parallel2serial.v
// Tool versions: VsCode
// Description: 并串转换
// Parameter:
// 1. WIDTH: 并行信号的宽度
// Input:
// 1. clk_sig: 时钟信号
// 2. reset_sig: 复位信号
// 3. parallel_sig: 并行信号
// Output:
// 1. serial_sig: 串行信号
// Notice:
// 1. serial_sig 的频率是 parallel_sig 的 WIDTH 倍
// 2. ***clk_sig 的频率应当为 parallel_sig 的 2*WIDTH 倍***
// ************************************************************
module parallel2serial #(
    parameter WIDTH = 2
) (
    input                     clk_sig,
    input                     reset_sig,     // 复位信号 低电平有效
    input       [WIDTH - 1:0] parallel_sig,  // 并行信号
    output wire [        0:0] serial_sig     // 串行信号
);

    reg  [            0:WIDTH - 1] parallel_r;
    wire [$clog2(WIDTH - 1) - 1:0] counter_sig;

    // 1. 初始化
    initial begin
        parallel_r <= 0;
    end

    // 2. 记数
    counter #(
        .NUM(WIDTH)
    ) counter_inst (
        .clk_sig    (clk_sig),
        .reset_sig  (reset_sig),
        .counter_sig(counter_sig)
    );

    // 3. 缓存
    always @(posedge clk_sig) begin
        if (!reset_sig) begin
            parallel_r <= 0;
        end else if (counter_sig == 0) begin
            parallel_r <= parallel_sig;
        end else begin
            parallel_r <= {parallel_r[1:(WIDTH-1)], parallel_r[0]};
        end
    end

    // 4. 串行信号
    assign serial_sig = parallel_r[0];
endmodule
