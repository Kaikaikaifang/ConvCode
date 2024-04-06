-------------------------------------------------------------------------
-------------------------------------------------------------------------
-- Description	:  BER for the serial block decoder
--                 with multicode support.
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library viterbi;
use viterbi.vi_interface.all;
use viterbi.vi_functions.all;


Architecture rtl of auk_vit_add_tre is

--constant tree_arch : NATURAL_ARRAY(0 to 3) := (5, 3, 2, 1);
constant tree_arch : NATURAL_ARRAY(0 to LOG2_ceil_table(n)) := Build_tree_arch(n);
Constant log2_n : NATURAL := LOG2_ceil_table(n);
Constant errs_size : NATURAL := LOG2_ceil_table(n+1);

--  n_max is 15 here
--  so LOG2_ceil_table(15+1)=4
Subtype vector_1D is Std_Logic_Vector(4 downto 1);
type matrix_2D_4 is array(NATURAL RANGE <>) of vector_1D;
-- second dim n_max 15
Subtype matrix_2D_15_4 is matrix_2D_4(15 downto 1);
Type vector_3D is array(NATURAL RANGE <>) of matrix_2D_15_4;

Signal tree : vector_3D(0 to log2_n);

begin

--- first enter different bits in tree
fg1: for I in 1 to n generate

	tree(0)(I)(1) <= diffs(I);
	tree(0)(I)(2) <= '0'; -- 0 bit expansion : unsigned

end generate fg1;

fg2: for I in 1 to log2_n generate
	fg3: for J in 1 to tree_arch(I) generate
		ifg1: if (tree_arch(I-1) > (2*J-1)) or (tree_arch(I-1) = 2*J) generate
			tree(I)(J)(I+1 downto 1) <=
			unsigned(tree(I-1)(2*J)(I+1 downto 1)) +
			unsigned(tree(I-1)(2*J-1)(I+1 downto 1));
			-- zero extension
			ifg2: If I+1 < 4 generate  -- 4 is the maximum in 1D dimension
				tree(I)(J)(I+2) <='0';
			end generate ifg2;
		end generate ifg1;
		ifg3: if (tree_arch(I-1) = (2*J-1)) generate
			tree(I)(J)(I+1 downto 1) <=
			tree(I-1)(2*J-1)(I+1 downto 1);
			-- zero extension
			ifg4: If I+1 < 4 generate  -- 4 is the maximum in 1D dimension
				tree(I)(J)(I+2) <='0';
			end generate ifg4;
		end generate ifg3;
	end generate fg3;
end generate fg2;

--output

errs <= tree(log2_n)(1)(errs_size downto 1);

end architecture rtl; 
