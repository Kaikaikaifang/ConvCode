-------------------------------------------------------------------------
-------------------------------------------------------------------------
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


ARCHITECTURE rtl OF auk_vit_sel IS

	--signal comps, calcs : vector_2D(outwidth downto 1);
	
	Subtype vector_in is Std_Logic_Vector(inwidth downto 1);
	type matrix_in is array(NATURAL RANGE <>) of vector_in;
	
	signal comps, calcs : matrix_in(outwidth downto 1);


BEGIN
	
	g1: For K in 1 to outwidth generate
		comps(k)(inwidth downto 1) <= --natural_2_m(arg => K-1, SIZE => inwidth);
									 CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => K-1, SIZE => inwidth), SIZE => inwidth);
		calcs(k)(1) <= comps(k)(1) xor selin(1);
		g2: For J in 2 to inwidth generate
			calcs(K)(J) <= calcs(K)(J-1) or (comps(K)(J) xor selin(J));
		end generate g2;
		selout(K) <= not calcs(K)(inwidth);
	end generate g1;
	
END rtl;
