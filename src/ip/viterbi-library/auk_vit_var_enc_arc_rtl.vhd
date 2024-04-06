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
library viterbi;
use viterbi.vi_interface.all;
use viterbi.vi_functions.all;


Architecture rtl of auk_vit_var_enc is

Subtype gen_pol_con Is NATURAL_ARRAY(1 to 7);

Constant g_a : NATURAL := Get_pol(pols => ga, index => pol_sel);
Constant g_b : NATURAL := Get_pol(pols => gb, index => pol_sel);
Constant g_c : NATURAL := Get_pol(pols => gc, index => pol_sel);
Constant g_d : NATURAL := Get_pol(pols => gd, index => pol_sel);
Constant g_e : NATURAL := Get_pol(pols => ge, index => pol_sel);
Constant g_f : NATURAL := Get_pol(pols => gf, index => pol_sel);
Constant g_g : NATURAL := Get_pol(pols => gg, index => pol_sel);
Constant gen_pols : NATURAL_ARRAY(1 TO 7) := gen_pol_con'(g_a, g_b, g_c, g_d, g_e, g_f, g_g);

-- I have to change this Vector_2D with std_logic_matrix.
Constant genvec : Vector_2D(n downto 1) := get_polynomials(n=>n, L_max=>L_max, L_code=>L_code, gen_pols=>gen_pols);

signal vecnode : Vector_2D(n downto 1);

begin

-- I think I should be changing to this code to process with variables.
fg1: FOR k IN 1 TO n GENERATE
   vecnode(k)(1) <= state(1) and genvec(k)(1);
  fg2: FOR j IN 2 TO L_max GENERATE
	  vecnode(k)(j) <= (state(j) and genvec(k)(j)) xor vecnode(k)(j-1); 
  END GENERATE fg2;
  --***********************
  --*** LSB FIRST !!!!! ***
  --***********************
	vector(k) <= vecnode(n-k+1)(L_max);
END GENERATE fg1;


end architecture rtl;	
