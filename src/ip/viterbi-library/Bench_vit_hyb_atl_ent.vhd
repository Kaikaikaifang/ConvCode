-------------------------------------------------------------------------
-------------------------------------------------------------------------
-- Description	:  Entity declaration for Viterbi Hybrid Decoder Bench  
--
-- Copyright 2003 (c) Altera Corporation
-- All rights reserved
--
-------------------------------------------------------------------------
-------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


Entity bench_vit_hyb_atl is
	Generic (
		n           : STRING := "2_2";
		L 					: STRING := "4_5"; --"5 7";
		dec_modes 	: STRING := "V_T";
		ga 					: STRING := "13_19"; --"19 91"; 
		gb 					: STRING := "15_29"; --"29 121";
		gc 					: STRING := "0_0"; --"0 0";
		gd 					: STRING := "0_0"; --"0 0";
		ge 					: STRING := "0_0"; --"0 0";
		gf 					: STRING := "0_0"; --"0 0";
		gg 					: STRING := "0_0"; --"0 0";

		n_max       : NATURAL := 2;
		log2_n_max  : NATURAL := 1;
		constraint_length_m_1   : NATURAL := 8;
		v           : NATURAL := 45;
		softbits		: NATURAL := 3;
		bmgwide			: NATURAL := 8;
		vlog_wide : NATURAL := 6;
		rr_size     : NATURAL := 6;
		sel_code_size : NATURAL := 1;
		numerr_size  : NATURAL := 12; -- depens on how big the block is going to be
		
		node_sync 	: STRING := "used";
		ber 				: STRING := "used";
		test_for     : STRING := "BER";  -- BER or node_sync
		INPUT_FILE   : STRING := "a_rcvsym.txt";
		BLOCKS_FILE  : STRING := "block_period_stim.txt";
		TCMSEC_FILE  : STRING := "tcm_rcv_sector.txt";
		OUTPUT_FILE  : STRING := "decoded.txt";
		clock_period : STRING := "30 ns";
		clock_offset : STRING := "5 ns"	);
	Port (
		clk    : out std_logic;
		reset  : out Std_Logic;
		ber_clear     : out std_logic;
		-- shouldn't this signals be named "source" Yes they ought to for the sake of consistency!!
		--source_dav_slave : out Std_Logic;  
		source_ena_slave : in  Std_Logic; 
		source_val       : out Std_Logic;  
		source_sop       : out Std_Logic;  
		source_eop       : out Std_Logic;  

		tr_init_state : out Std_Logic_Vector(constraint_length_m_1 downto 1);
		tb_type : out Std_Logic;
		bm_init_state : out Std_Logic_Vector(constraint_length_m_1 downto 1);
		bm_init_value : out Std_Logic_Vector(bmgwide downto 1);
		tb_length     : out Std_Logic_Vector(vlog_wide downto 1);
		state_node_sync : out Std_Logic_Vector(log2_n_max downto 1);

		normalizations_reg : in Std_Logic_Vector(8 downto 1);
		-- source side control signals
		-- shouldn't this signals be named "sink" YEs for the sake of consistency
		--sink_dav_master : in  Std_Logic;  
		sink_ena_master : out Std_Logic; 
		sink_val       : in  Std_Logic; 
		sink_sop       : in  Std_Logic; 
		sink_eop       : in  Std_Logic; 

 		numerr : in Std_Logic_Vector(numerr_size downto 1);
		sel_code : out Std_Logic_Vector(sel_code_size downto 1);
		bench_2_decoder : out Std_Logic_Vector(rr_size downto 1);
		eras_sym : out Std_Logic_Vector(n_max downto 1);

		bestmet : in Std_Logic_Vector(bmgwide downto 1);
		bestadd : in Std_Logic_Vector(constraint_length_m_1 downto 1);
		decbit_dec : in Std_Logic
		);
end entity bench_vit_hyb_atl;	


