//~ `New testbench
`timescale 1ns / 1ps

module counter_tb;

    // counter Parameters
    parameter PERIOD = 50;
    parameter NUM = 16;

    // counter Inputs
    reg                        clk_sig = 0;
    reg                        reset_sig = 0;

    // counter Outputs
    wire [$clog2(NUM- 1)- 1:0] counter_sig;

    /*iverilog */
    initial begin
        $dumpfile("counter.vcd");  //生成的vcd文件名称
        $dumpvars(0, counter_tb);  //tb模块名称
    end
    /*iverilog */

    always begin
        #(PERIOD / 2) clk_sig = ~clk_sig;
    end

    initial begin
        #(PERIOD * 2) reset_sig = 1;
    end

    counter #(
        .NUM(NUM)
    ) u_counter (
        .clk_sig  (clk_sig),
        .reset_sig(reset_sig),

        .counter_sig(counter_sig[$clog2(NUM-1)-1:0])
    );

    initial begin
        #(PERIOD * NUM * 2) $finish;
    end
endmodule
