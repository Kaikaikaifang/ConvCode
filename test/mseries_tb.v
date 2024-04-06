//~ `New testbench
`timescale 1ns / 1ps

module mseries_tb;

    // mseries Parameters
    parameter PERIOD = 50;
    parameter M = 16;

    // mseries Inputs
    reg  clk_sig = 0;
    reg  rst_sig = 0;

    // mseries Outputs
    wire m_sig;

    /*iverilog */
    initial begin
        $dumpfile("mseries.vcd");  //生成的vcd文件名称
        $dumpvars(0, mseries_tb);  //tb模块名称
    end
    /*iverilog */

    always begin
        #(PERIOD / 2) clk_sig = ~clk_sig;
    end

    initial begin
        #(PERIOD * 2) rst_sig = 1;
    end

    mseries #(
        .M(M)
    ) u_mseries (
        .clk_sig(clk_sig),
        .rst_sig(rst_sig),

        .m_sig(m_sig)
    );

    initial begin
        #10000 $finish;
    end

endmodule
