`timescale 1 ns / 1 ns

module viterbi_tb;

    `include "params_e213.v"



    reg     [2536:0] vector_memory[0:0];
    reg              clock;
    reg              clk_2;
    reg              reset;
    reg     [`k-1:0] Ux;

    wire    [`n-1:0] Vx;
    wire    [`n-1:0] Rx;
    wire    [`k-1:0] Dx;
    wire             tb_en;
    wire             error;
    wire             Dx_oe;

    integer          vector;
    integer          fail;



    /*===  Instantiate a model of the (2,1,3) encoder ===*/

    VIT_ENC TB_U1 (
        .Vx   (Vx),
        .Ux   (Ux),
        .clock(clk_2),
        .reset(reset),
        .tb_en(tb_en)
    );

    /*===  Instantiate a the (2,1,3) decoder ===*/
    eVITERBI_213 TB_U2 (
        .Dx   (Dx),
        .Dx_oe(Dx_oe),
        .error(error),
        .Rx   (Vx),
        .clock(clk_2),
        .reset(reset),
        .tb_en(tb_en)
    );


    /*=== Create Free Running Clock ===*/

    always begin
        #(0.5 * `CLOCK_PERIOD);  // 100 ns clock period = 10 MHz
        clock = ~clock;
    end

    always @(posedge clock) begin
        clk_2 = ~clk_2;
    end

    initial $readmemb("assets/codeFile.txt", vector_memory);

    /*=== Clock data into the encoder ===*/
    initial begin
        clock  = 0;
        clk_2  = 0;
        Ux     = 0;
        reset  = 1;  //Apply reset
        fail   = 0;
        vector = 0;

        #`CLOCK_PERIOD reset = 0;  //Disable reset after one clock period

        for (vector = 0; vector < 2056; vector = vector + 1) begin
            Ux = vector_memory[0][2055-vector];
            #`CLOCK_PERIOD;
        end  // for (vector=0; vector<10; vector=vector+1)
    end  // initial begin


    /*=== Create Simulation Waveforms ===*/

    /*iverilog */
    initial begin
        $dumpfile("viterbi_tb.vcd");  //生成的vcd文件名称
        $dumpvars(0, viterbi_tb);  //tb模块名称
    end
    /*iverilog */

    initial #13600 $finish;

endmodule
