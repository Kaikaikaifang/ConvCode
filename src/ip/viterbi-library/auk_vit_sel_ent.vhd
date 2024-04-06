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

ENTITY auk_vit_sel IS
	generic ( inwidth : NATURAL := 4;
						outwidth: NATURAL := 16
					);
	port (
		selin : in Std_Logic_Vector(inwidth downto 1);
		selout : out Std_Logic_Vector(outwidth downto 1)
		);
END auk_vit_sel;	
