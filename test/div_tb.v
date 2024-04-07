//~ `New testbench
`timescale 1ns / 1ps

module div_tb;

    // div Parameters
    parameter PERIOD = 50;
    parameter NUM = 2;
    parameter DUTY = 1;

    /*iverilog */
    initial begin
        $dumpfile("div.vcd");  //生成的vcd文件名称
        $dumpvars(0, div_tb);  //tb模块名称
    end
    /*iverilog */

    // div Inputs
    reg  clk_sig = 0;
    reg  rst_sig = 0;

    // div Outputs
    wire div_sig;
    reg  clk_2_sig = 0;

    always begin
        #(PERIOD / 2) clk_sig = ~clk_sig;
    end

    initial begin
        #(PERIOD * 2) rst_sig = 1;
    end

    always @(posedge clk_sig) clk_2_sig <= ~clk_2_sig;

    div #(
        .NUM (NUM),
        .DUTY(DUTY)
    ) u_div (
        .clk_sig(clk_sig),

        .div_sig(div_sig)
    );

    initial begin
        #10000 $finish;
    end

endmodule
