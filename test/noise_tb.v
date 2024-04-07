//~ `New testbench
`timescale 1ns / 1ps

module noise_tb;

    // noise Parameters
    parameter PERIOD = 10;
    parameter INTERVAL = 15;

    // noise Inputs
    reg        clk_sig = 0;
    reg        reset_sig = 0;

    // noise Outputs
    wire [0:0] noise_sig;

    /*iverilog */
    initial begin
        $dumpfile("noise_tb.vcd");  //生成的vcd文件名称
        $dumpvars(0, noise_tb);  //tb模块名称
    end
    /*iverilog */

    always begin
        #(PERIOD / 2) clk_sig = ~clk_sig;
    end

    initial begin
        #(PERIOD * 2) reset_sig = 1;
    end

    noise #(
        .INTERVAL(INTERVAL)
    ) u_noise (
        .clk_sig  (clk_sig),
        .reset_sig(reset_sig),

        .noise_sig(noise_sig[0:0])
    );

    initial begin
        #10000 $finish;
    end

endmodule
