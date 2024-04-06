-------------------------------------------------------------------------
-------------------------------------------------------------------------
-- Description	:  Convolutional Encoder function for Viterbi Decoder
--                 with multicode support
--
-- Legal Notice: (C)2006 Altera Corporation. All rights reserved. Your
-- use of Altera Corporation's design tools, logic functions and other
-- software and tools, and its AMPP partner logic functions, and any
-- output files any of the foregoing (including device programming or
-- simulation files), and any associated documentation or information are
-- expressly subject to the terms and conditions of the Altera Program
-- License Subscription Agreement or other applicable license agreement,
-- including, without limitation, that your use is for the sole purpose
-- of programming logic devices manufactured by Altera and sold by Altera
-- or its authorized distributors. Please refer to the applicable
-- agreement for further details. 
--
-------------------------------------------------------------------------
-------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

Entity auk_vit_var_enc is
	Generic (
		n : NATURAL := 2;
		L_max : NATURAL := 7;
		L_code	: NATURAL  := 7;
		pol_sel : NATURAL := 1; 
		ga : STRING := "91_91";
		gb : STRING := "121_101";
		gc : STRING := "0_125";
		gd : STRING := "0_0";
		ge : STRING := "0_0";
		gf : STRING := "0_0";
		gg : STRING := "0_0"
	);
	Port (
		state : in Std_Logic_Vector(L_max downto 1);
 		vector : out Std_Logic_Vector(n downto 1)
	);	
end entity auk_vit_var_enc;	
