// ************************************************************
// Engineer: kaikai
//
// Create Date: 2024/04/06
// Design Name: ConvCode
// Module Name: mseries.v
// Tool versions: VsCode
// Description: M 序列发生器
// Parameter:
// 1. M: M 序列的阶数 2-16
// Input:
// 1. clk_sig: 时钟信号
// 2. reset_sig: 复位信号
// Output:
// 1. m_sig: M 序列
// ************************************************************
module mseries #(
    parameter M = 4  // parameter range from 2 to 16
) (
    input  wire clk_sig,
    input  wire rst_sig,
    output wire m_sig
);

    reg [(M-1):0] m_r;

    initial begin
        m_r = ~(0);
    end

    always @(posedge clk_sig) begin
        if (rst_sig == 0) begin  // negedge reset
            m_r <= ~(0);
        end else begin
            m_r <= m_r << 1;  // shift reg
            case (M)
                2: m_r[0] <= m_r[1] ^ m_r[0];
                3: m_r[0] <= m_r[2] ^ m_r[1];
                4: m_r[0] <= m_r[3] ^ m_r[2];
                5: m_r[0] <= m_r[4] ^ m_r[2];
                6: m_r[0] <= m_r[5] ^ m_r[4];
                7: m_r[0] <= m_r[6] ^ m_r[3];
                8: m_r[0] <= m_r[7] ^ m_r[5] ^ m_r[4] ^ m_r[3];
                9: m_r[0] <= m_r[8] ^ m_r[4];
                10: m_r[0] <= m_r[9] ^ m_r[6];
                11: m_r[0] <= m_r[10] ^ m_r[8];
                12: m_r[0] <= m_r[11] ^ m_r[10] ^ m_r[7] ^ m_r[5];
                13: m_r[0] <= m_r[12] ^ m_r[11] ^ m_r[9] ^ m_r[8];
                14: m_r[0] <= m_r[13] ^ m_r[12] ^ m_r[7] ^ m_r[3];
                15: m_r[0] <= m_r[14] ^ m_r[13];
                16: m_r[0] <= m_r[15] ^ m_r[14] ^ m_r[12] ^ m_r[3];
                default: m_r[0] <= m_r[0];
            endcase
        end
    end

    assign m_sig = m_r[(M-1)];
endmodule
