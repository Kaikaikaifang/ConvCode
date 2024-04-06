-------------------------------------------------------------------------
-------------------------------------------------------------------------
-- Description	: top level testbench for the parallel Viterbi decoder  
--
-- Copyright 2003 (c) Altera Corporation
-- All rights reserved
--
-------------------------------------------------------------------------
-------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
-- The following library Viterbi clause is needed because this file
-- is to be compiled in a library other than Viterbi by the tcl script.
library Viterbi;

entity testbench is
-- Here will be the items that the MW will customize. For VHDL in the form
-- of constants

Constant N : STRING := "2";
Constant L : STRING := "3";
Constant DEC_MODE : STRING := "V";
Constant NCODES : NATURAL := 1;
Constant N_MAX : NATURAL := 2;
Constant LOG2_N_MAX : NATURAL := 1;
Constant RR_SIZE : NATURAL := 2;
Constant CONSTRAINT_LENGTH_M_1 : NATURAL := 2;
Constant V : NATURAL := 18;
Constant SOFTBITS : NATURAL := 1;
Constant BMGWIDE : NATURAL := 6;
Constant VLOG_WIDE : NATURAL := 6;
Constant SEL_CODE_SIZE : NATURAL := 1;
Constant ga : STRING := "5";
Constant gb : STRING := "7";
Constant gc : STRING := "0";
Constant gd : STRING := "0";
Constant ge : STRING := "0";
Constant gf : STRING := "0";
Constant gg : STRING := "0";
Constant BER : STRING := "unused";
Constant best_state_finder : STRING := "unused";
Constant parallel_optimization : STRING := "continuous";
Constant NODE_SYNC : STRING := "unused";
Constant NUMERR_SIZE : NATURAL := 8;
Constant test_for : STRING := "BER";
end entity testbench;

library work;

architecture only_arch of testbench is

Constant input_file : STRING := "a_rcvsym.txt"; 
Constant output_file : STRING := "decoded.txt"; 

component viterbi
    port (
			clk : in Std_Logic;
			reset : in Std_Logic;
			sink_rdy        : out Std_Logic; 
			sink_val        : in  Std_Logic; 
			--sink_sop        : in  Std_Logic; 
			rr : in Std_Logic_Vector(rr_size downto 1);
			eras_sym : in Std_Logic_Vector(n_max downto 1);
  
--  these two out
--			bm_init_state : in Std_Logic_Vector(constraint_length_m_1 downto 1);
--			bm_init_value : in Std_Logic_Vector(bmgwide downto 1);
			
			source_rdy : in Std_Logic; 
			source_val : out Std_Logic; 
			decbit : out Std_Logic;
			normalizations : out Std_Logic_Vector(8 downto 1)
	 		);
end component;

 
COMPONENT bench_vit_par_atl
	Generic (
		n           : STRING;
		L 					: STRING;
		dec_modes 	: STRING;
		ga 					: STRING; 
		gb 					: STRING;
		gc 					: STRING;
		gd 					: STRING;
		ge 					: STRING;
		gf 					: STRING;
		gg 					: STRING;
		n_max       : NATURAL;
		log2_n_max  : NATURAL;
		constraint_length_m_1   : NATURAL;
		v           : NATURAL;
		softbits		: NATURAL;
		bmgwide			: NATURAL;
		vlog_wide : NATURAL;
		rr_size     : NATURAL;
		sel_code_size : NATURAL;
		numerr_size  : NATURAL;
		parallel_optimization : STRING;
		best_state_finder : STRING;
		node_sync 	: STRING;
		BER 				: STRING;
		test_for     : STRING;  
		input_file   : STRING;
		blocks_file  : STRING;
		tcmsec_file  : STRING;
		output_file  : STRING;
		clock_period : STRING := "30 ns";
		clock_offset : STRING := "5 ns"	);
	Port (
		clk : out Std_Logic;
		reset  : out Std_Logic;
		source_ena_slave : in  Std_Logic; 
		source_val       : out Std_Logic;  
		source_sop       : out Std_Logic;  
		source_eop       : out Std_Logic;  

		bench_2_decoder : out Std_Logic_Vector(rr_size downto 1);
		eras_sym : out Std_Logic_Vector(n_max downto 1);

		sel_code : out Std_Logic_Vector(sel_code_size downto 1);
		tr_init_state : out Std_Logic_Vector(constraint_length_m_1 downto 1);
		tb_type : out Std_Logic;
--		bm_init_state : out Std_Logic_Vector(constraint_length_m_1 downto 1);
--		bm_init_value : out Std_Logic_Vector(bmgwide downto 1);
		tb_length     : out Std_Logic_Vector(vlog_wide downto 1);
		state_node_sync : out Std_Logic_Vector(log2_n_max downto 1);

		-- source side control signals
		sink_ena_master : out Std_Logic; 
		sink_val       : in  Std_Logic; 
		sink_sop       : in  Std_Logic; 
		sink_eop       : in  Std_Logic; 

		bestmet : in Std_Logic_Vector(bmgwide downto 1);
		bestadd : in Std_Logic_Vector(constraint_length_m_1 downto 1);
		normalizations_reg : in Std_Logic_Vector(8 downto 1);
		numerr : in Std_Logic_Vector(numerr_size downto 1);
		decbit_dec : in Std_Logic
		);
END COMPONENT;



signal clk, reset : Std_Logic;
Signal decbit_dec, tb_type : Std_Logic; 

Signal ena_vit_ben, val_ben_vit, sop_ben_vit, eop_ben_vit : Std_Logic;
signal ena_ben_vit, val_vit_ben, sop_vit_ben, eop_vit_ben : Std_Logic;
signal normalizations_reg : Std_Logic_Vector(8 downto 1);

-- down here replace generics with corresponding values.

signal BER_clear : Std_Logic;
signal numerr : Std_Logic_Vector(numerr_size downto 1);

signal sel_code : Std_Logic_Vector(sel_code_size downto 1);
signal bench_2_decoder : Std_Logic_Vector(rr_size downto 1);
Signal eras_sym : Std_Logic_Vector(n_max downto 1);
Signal bestmet : Std_Logic_Vector(bmgwide downto 1);
Signal bestadd : Std_Logic_Vector(constraint_length_m_1 downto 1);
Signal tr_init_state : Std_Logic_Vector(constraint_length_m_1 downto 1);
--signal bm_init_state : Std_Logic_Vector(constraint_length_m_1 downto 1);
--Signal bm_init_value : Std_Logic_Vector(bmgwide downto 1);
signal state_node_sync : Std_Logic_Vector(log2_n_max downto 1);
Signal tb_length     : Std_Logic_Vector(vlog_wide downto 1);





begin

-- wrapper_vit_hyb_atl would have to be replaced by the user wrapper name

wrapper_inst : entity work.viterbi
port map (
		clk => clk, 
		reset => reset, 

		sink_rdy => ena_vit_ben,
		sink_val => val_ben_vit, 
		 

		source_rdy => ena_ben_vit,
		source_val => val_vit_ben,

 		rr => bench_2_decoder, 
		normalizations => normalizations_reg, 
 		decbit => decbit_dec, 
 		eras_sym => eras_sym
 		);


test_controller: entity work.bench_vit_par_atl(Bench)
	Generic map (
		n => n, -- replace right side with value
		L => L, 
		dec_modes => dec_mode,
		rr_size => rr_size,
		n_max => n_max,
		constraint_length_m_1 => constraint_length_m_1, 
		softbits	=> softbits, 
		v => v,
		bmgwide => bmgwide, 
		vlog_wide => vlog_wide,
		log2_n_max => log2_n_max,
		sel_code_size	=> sel_code_size,
		numerr_size => numerr_size, 
		ga => ga, 
		gb => gb, 
		gc => gc, 
		gd => gd, 
		ge => ge, 
		gf => gf, 
		gg => gg,
		parallel_optimization => parallel_optimization,
		best_state_finder => best_state_finder,
		node_sync => node_sync, 
		BER => BER,
		test_for => test_for,
		input_file => input_file, 
		output_file	=> output_file, 
		blocks_file => "block_period_stim.txt",
		tcmsec_file => "tcm_rcv_sector.txt")
		-- I am thinking for Verilog .. These two generics below may give trouble
		-- at the end of the day the default values are always used
		-- not configuration from GUI takes place so ... Out
--		clock_period => clock_period,  
--		clock_offset => clock_offset)

	Port map (
				clk => clk, 
				reset => reset,

				source_ena_slave => ena_vit_ben,
				source_val => val_ben_vit,
				source_sop => sop_ben_vit,
				source_eop => eop_ben_vit,

				sink_ena_master => ena_ben_vit,
				sink_val => val_vit_ben,
				sink_sop => sop_vit_ben,
				sink_eop => eop_vit_ben,

				sel_code => sel_code, 
--				bm_init_state => bm_init_state, 
--				bm_init_value => bm_init_value,
				tb_length => tb_length, 
				tr_init_state => tr_init_state, 
				tb_type => tb_type,
				state_node_sync => state_node_sync,  

				normalizations_reg => normalizations_reg,
				bestmet => bestmet, 
				bestadd => bestadd, 
				numerr => numerr,

				bench_2_decoder => bench_2_decoder,
				eras_sym => eras_sym,
				decbit_dec => decbit_dec);

end architecture only_arch;

-- The following library Viterbi clause is needed because this file
-- is to be compiled in a library other than Viterbi by the tcl script.
library Viterbi;
configuration cfg_testbench of testbench is
    for only_arch
    end for;
end cfg_testbench;

