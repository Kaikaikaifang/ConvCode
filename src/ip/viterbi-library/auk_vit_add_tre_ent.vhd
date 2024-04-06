-------------------------------------------------------------------------
-------------------------------------------------------------------------
-- Description	:  BER for the serial block decoder
--                 with multicode support.
--
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

Entity auk_vit_add_tre is
	Generic (
				n : NATURAL := 2
	);
		Port (
			  diffs : in Std_Logic_Vector(n downto 1);
			  errs : out Std_Logic_Vector(LOG2_ceil_table(n+1) downto 1)
	);
end entity auk_vit_add_tre;
