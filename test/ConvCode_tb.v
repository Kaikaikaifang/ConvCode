//~ `new testbench
`timescale 1ns / 1ps

module ConvCode_tb;

    // ConvCode Parameters
    parameter PERIOD = 50;  // 50 * 1ns = 50ns per period -> 20MHz


    // ConvCode Inputs
    reg        clk20M_sig = 0;
    reg        reset_sig = 0;

    // ConvCode Outputs
    wire [1:0] encode_sig;
    // wire [0:0] decode_sig;
    // wire [0:0] noise_sig;
    // wire [0:0] encode_noise_sig;
    wire [0:0] q_sig;

    /*iverilog */
    initial begin
        $dumpfile("ConvCode_tb.vcd");  //生成的vcd文件名称
        $dumpvars(0, ConvCode_tb);  //tb模块名称
    end
    /*iverilog */

    always begin
        #(PERIOD / 2) clk20M_sig = ~clk20M_sig;
    end

    initial begin
        #(PERIOD * 2) reset_sig = 1;
    end

    ConvCode u_ConvCode (
        .clk20M_sig(clk20M_sig),
        .reset_sig (reset_sig),

        .encode_sig(encode_sig[1:0]),
        // .decode_sig      (decode_sig[0:0]),
        // .noise_sig       (noise_sig[0:0]),
        // .encode_noise_sig(encode_noise_sig[0:0]),

        .q_sig(q_sig[0:0])
    );

    initial begin
        #(PERIOD * 4096) $finish;  // 4096 * 50ns = 204.8us
    end

endmodule