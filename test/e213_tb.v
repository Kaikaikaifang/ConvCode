/*============================================================================
   module tb_e213.v

   Test bench for efficient (2,1,3) backward label  Viterbi Decoder.

===========================================================================*/

`timescale 1 ns / 1 ns

module e213_tb;

    `include "params_e213.v"



    reg     [`BLOCK_LEN-1:0] vector_memory[0:9];
    reg     [`BLOCK_LEN-1:0] U_data;
    reg     [`BLOCK_LEN-1:0] D_data;
    reg                      clock;
    reg                      reset;
    reg     [        `k-1:0] Ux;

    wire    [        `n-1:0] Vx;
    wire    [        `n-1:0] Rx;
    wire    [        `k-1:0] Dx;
    wire    [          63:0] HD;
    wire                     tb_en;
    wire                     error;
    wire                     Dx_oe;

    integer                  vector_bit;
    integer                  vector;
    integer                  fail;



    /*===  Instantiate a model of the (2,1,3) encoder ===*/

    VIT_ENC TB_U1 (
        .Vx   (Vx),
        .Ux   (Ux),
        .clock(clock),
        .reset(reset),
        .tb_en(tb_en)
    );

    /*===  Instantiate a the (2,1,3) decoder ===*/
    eVITERBI_213 TB_U2 (
        .Dx   (Dx),
        .Dx_oe(Dx_oe),
        .error(error),
        .Rx   (Vx),
        .clock(clock),
        .reset(reset),
        .tb_en(tb_en)
    );


    /*=== Create Free Running Clock ===*/

    always begin
        #(0.5 * `CLOCK_PERIOD);  // 100 ns clock period = 10 MHz
        clock = ~clock;
    end


    initial $readmemb("assets/testvectors_213.txt", vector_memory);

    //U_data=20'b0110_1100_1010_0011_0010


    /*=== Clock data into the encoder ===*/
    initial begin
        clock  = 0;
        Ux     = 0;
        reset  = 1;  //Apply reset
        fail   = 0;
        D_data = 0;
        vector = 0;
        U_data = vector_memory[vector];

        #`CLOCK_PERIOD reset = 0;  //Disable reset after one clock period

        for (vector = 0; vector < 10; vector = vector + 1) begin
            U_data = vector_memory[vector];
            //$display ("# Input Message U =%b #",U_data);
            D_data = 0;

            for (vector_bit = `BLOCK_LEN - 1; vector_bit >= 0; vector_bit = vector_bit - 1) begin
                Ux = U_data[vector_bit];
                #`CLOCK_PERIOD;  // 
            end

        end  // for (vector=0; vector<10; vector=vector+1)
    end  // initial begin


    /*=== Create Simulation Waveforms ===*/

    /*iverilog */
    initial begin
        $dumpfile("e213_tb.vcd");  //生成的vcd文件名称
        $dumpvars(0, e213_tb);  //tb模块名称
    end
    /*iverilog */

    initial #13600 $finish;



    /*=== Monitor Viterbi Decoder Responses ===*/
endmodule





