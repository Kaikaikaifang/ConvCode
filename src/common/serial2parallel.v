// ************************************************************
// Engineer: kaikai
//
// Create Date: 2024/04/06
// Design Name: ConvCode
// Module Name: serial2parallel.v
// Tool versions: VsCode
// Description: 串行转并行
// Parameter:
// 1. WIDTH: 并行数据宽度
// Input:
// 1. clk_sig: 时钟信号
// 2. reset_sig: 复位信号
// 3. serial_sig: 串行信号
// Output:
// 1. parallel_sig: 并行信号
// ************************************************************
module serial2parallel #(
    parameter WIDTH = 2
) (
    input  wire             clk_sig,
    input  wire             reset_sig,
    input  wire [      0:0] serial_sig,
    output wire [WIDTH-1:0] parallel_sig
);

    reg [WIDTH-1:0] parallel_r;
    // wire [$clog2(WIDTH - 1) - 1:0] counter_sig;

    initial begin
        parallel_r = 0;
    end

    always @(posedge clk_sig) begin
        if (reset_sig == 0) begin
            parallel_r <= 0;
        end else begin
            parallel_r <= {parallel_r[(WIDTH-2):0], serial_sig};
        end
    end
    assign parallel_sig = parallel_r;
endmodule
