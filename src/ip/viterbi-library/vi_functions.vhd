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
Library viterbi;
use viterbi.vi_interface.all;

package  vi_functions  is

--Constant NO_WARNING: BOOLEAN := FALSE;

-- It's got to be 32 to allow to have ACS units =32
-- 14/02/2004 I have aim for types that do not require 
-- these _max constant. types like the ones 
--   Std_Logic_3D_CUBE in vi_interface.
Constant BMG_MAX : NATURAL := 32;

Constant MAX_N : NATURAL := 7;

type INTEGER_ARRAY is array(NATURAL RANGE <>) of INTEGER;
--type NATURAL_ARRAY is array(NATURAL RANGE <>) of NATURAL;
type BOOLEAN_ARRAY is array(NATURAL RANGE <>) of BOOLEAN;
--type std_logic_matrix is array (natural range <>, natural range <>) of std_logic;
--type std_logic_cube is array (natural range <>, natural range <>, natural range <>) of std_logic;

--  this Constant is the maximum to value for n+LOG2_ceil_table(n)
--  which happens when n=7
Constant N_log2n_max : NATURAL := 10;

Subtype group_signals is Std_Logic_Vector(N_log2n_max downto 1);
Type mini_rom is ARRAY(NATURAL RANGE <>) of group_signals;

Constant max_two_pow_input : NATURAL := 2**6;

Subtype L_vector is Std_Logic_Vector(BMG_MAX downto 1);
type vector_2D is array(NATURAL RANGE <>) of L_vector;

Constant row_size_max: NATURAL := 31;

-- the previous value allows bitsout max of 26 which in turn allows V max to be about 207
-- combinations of L and ACS_units "on the rim" : L=4 ACS=1 ; L=5 and ACS=2 and so on.
Type pla_element is ('1', '0', '-', ' ');
type pla_vector is array (NATURAL range <>) of pla_element;
subtype pla_row is pla_vector(row_size_max downto 1);
Type pla_table_t is array (NATURAL range <>) of pla_row;
Subtype max_pla_table is pla_table_t(max_two_pow_input downto 1);
-- this type to substitute std_logic_cube 
Type array_of_pla_tables_t is array (NATURAL RANGE <>) of max_pla_table;


--function Ceil_DIV(a, d: in NATURAL) return NATURAL;
--function check_base(item : character; base : STRING) return BOOLEAN;
--function Convert_str_nat(pol_value, base : STRING) return NATURAL;
--function LOG2_ceil_table(x: in NATURAL) return NATURAL;
--function Get_ncodes(n: NATURAL_ARRAY) return NATURAL;
--function Get_n_max(n : NATURAL_ARRAY) return NATURAL;
--function Get_rr_size(n, softbits: in NATURAL; punctured_rate : in STRING) return NATURAL;
--function LOG2_ceil_avoid_one(n : in NATURAL) return NATURAL;
--function mul(a, b: in NATURAL) return NATURAL;

Function Trellis_constructor(n, L : NATURAL; ga, gb, gc, gd, ge, gf, gg : STRING) return NATURAL_ARRAY;
function Trellis_constructor_ncodes(ncodes, n_max, L_max : NATURAL; hypobit : Std_Logic;
                                    n, L, ga, gb, gc, gd, ge, gf, gg : STRING) return NATURAL_2D_ARRAY;

function a_ge_b(a, b : NATURAL) return NATURAL;

procedure pla_table(signal invec: in std_logic_vector;
										variable outvec: out std_logic_vector;
										Constant table: pla_table_t);

procedure pla_table_v(variable invec_v: in std_logic_vector;
										variable outvec: out std_logic_vector;
										Constant table: pla_table_t);

function get_polynomials(n, L_max, L_code : NATURAL; gen_pols : NATURAL_ARRAY) return vector_2D;

function Extract_item(list : NATURAL_ARRAY; index : NATURAL) return NATURAL;

-- Alex 18-01-2007  I want to eliminate usage of natural_2_m everywhere
--function natural_2_m (ARG, SIZE: NATURAL) return Std_Logic_vector;
function natural_2_m (ARG, SIZE: NATURAL) return pla_vector;

--function bin_mod(a, d: in NATURAL) return NATURAL;

function Get_pol(pols : STRING;  index : NATURAL) return NATURAL;
--function Get_pol(pols : NATURAL_ARRAY; base : STRING;  index : NATURAL) return NATURAL;

function Get_n_min(n : NATURAL_ARRAY) return NATURAL;

function Get_max_of_three(param_1, param_2, param_3 : NATURAL) return NATURAL;

function Get_min(param_1, param_2 : NATURAL) return NATURAL;

--function Transform_punctured_rate(punctured_rate : STRING) return NATURAL_ARRAY;

--function Calc_puncturing_rate(n : NATURAL; punctured_rate_fraction : NATURAL_ARRAY) return NATURAL_ARRAY;

--function Transform_pattern_2_mini_rom(n : NATURAL;
--																			punctured_rate, puncturing_pattern : STRING)
--																			return mini_rom;

--function Have_same_elements(hypo, ref : INTEGER_ARRAY) return BOOLEAN;

--function Are_they_aligned(hypo, ref : INTEGER_ARRAY) return BOOLEAN;

function Build_tree_arch(n : NATURAL) return NATURAL_ARRAY;

function Build_binary_table(n : NATURAL) return Vector_2D;

function Build_binary_table_evenodd(n, parity : NATURAL) return Vector_2D;

function Build_two_power_L_list(L, ACS_units : NATURAL) return NATURAL_ARRAY;

--function gen_mcode_selector(n : NATURAL_ARRAY; n_max, ncodes : NATURAL) return pla_table_t;

--function Set_bmdeep(n_max, ncodes : NATURAL) return NATURAL; --LOG2_ceil_table(n_max+1)+1;

function gen_node_sync_mux_ctrl(n, m : STRING; n_max : NATURAL)	return array_of_pla_tables_t;

--function gen_num_bit_errors(m : NATURAL) return pla_table_t;

function Get_log2_n_list(n_list : NATURAL_ARRAY) return NATURAL_ARRAY;

function set_sequencer_count(arg : NATURAL) return Std_Logic_Vector;

--function gen_read_trellis_seq(arg : NATURAL) return pla_table_t;

--function gen_wr_trellis_even_seq(arg : NATURAL) return pla_table_t;

--function gen_wr_trellis_odd_seq(arg : NATURAL) return pla_table_t;

function set_sequencer_width(arg : NATURAL) return NATURAL;

function Calc_bitsout(L, ACS, V : NATURAL) return NATURAL;

function un_encoded_bit_extract(two_re_enc_bits : Std_Logic_Vector(2 downto 1); sector: natural) return CHARACTER;

function init_state_metric_constructor(L_max, ncodes, bmgwide : NATURAL; L : STRING) return Std_Logic_3D_CUBE;

end vi_functions;


package body  vi_functions  is


-- function natural_2_m (ARG, SIZE: NATURAL) return Std_Logic_vector is
    -- variable RESULT: Std_Logic_vector(SIZE downto 1);
    -- variable I_VAL: NATURAL;
  -- begin
  	-- I_VAL := ARG;
    -- for I in 1 to RESULT'LEFT loop
      -- if (I_VAL mod 2) = 0 then
        -- RESULT(I) := '0';
      -- else RESULT(I) := '1';
      -- end if;
      -- I_VAL := I_VAL/2;
    -- end loop;
    -- if not(I_VAL =0) then
      -- assert NO_WARNING
          -- report "vi_functions.Natural_2_m: vector truncated"
          -- severity WARNING;
    -- end if;
    -- return RESULT;
-- end natural_2_m;


-- overloading 
function natural_2_m (ARG, SIZE: NATURAL) return pla_vector is
    variable RESULT: pla_vector(SIZE downto 1);
    variable I_VAL: NATURAL;
  begin
  	I_VAL := ARG;
    for I in 1 to RESULT'LEFT loop
      if (I_VAL mod 2) = 0 then
        RESULT(I) := '0';
      else RESULT(I) := '1';
      end if;
      I_VAL := I_VAL/2;
    end loop;
    if not(I_VAL =0) then
      assert NO_WARNING
          report "vi_functions.Natural_2_m: vector truncated"
          severity WARNING;
    end if;
    return RESULT;
end natural_2_m;


--  trying to make it FPGA Express compliant
--   Avoid while loops
function Get_pol(pols : STRING;  index : NATURAL) return NATURAL is
  variable extracted_value : STRING(pols'LOW to pols'HIGH);
	variable item : character;
	variable I_ext, count_spaces : NATURAL; -- indexes
	variable result : NATURAL;
	variable not_finished, looking_for_more_spaces : BOOLEAN;
	Constant base : STRING := "DEC";  -- DEC -> decimal or OCT -> octal base

begin

  count_spaces := 0;
	I_ext := pols'LOW;
	not_finished := TRUE;
	looking_for_more_spaces := FALSE;
	main: For I_pols in pols'LOW to pols'HIGH loop
	  item := pols(I_pols);
		if (I_pols=pols'LOW) and ((item=' ') or (item='_')) and not_finished then
			ASSERT NO_WARNING
				REPORT "vi_functions.Get_pol : Bad format on STRING of pols. First item is space"
				severity ERROR;
				return 0;
		elsif (item /= ' ') and (item /= '_') and not_finished then
			if check_base(item => item, base => base) then
				extracted_value(I_ext) := pols(I_pols);
			else
				ASSERT NO_WARNING
				REPORT "vi_functions.Get_pol : mismatch base - digit"
				severity ERROR;
				return 0;
			end if;
			-- finish here if last
			if count_spaces=index-1 and (I_pols=pols'HIGH) then
		 -- this is finished
			  not_finished := FALSE;
				result := Convert_str_nat(pol_value => extracted_value(pols'LOW to I_ext), base => base);
			else
				I_ext := I_ext + 1;
				looking_for_more_spaces := FALSE;
			end if;
		elsif ((item=' ') or (item='_')) and (not looking_for_more_spaces) and not_finished then
			count_spaces := count_spaces+1;
			looking_for_more_spaces := TRUE;
			if count_spaces=index then
		 -- this is finished
			  not_finished := FALSE;
				result := Convert_str_nat(pol_value => extracted_value(pols'LOW to I_ext-1), base => base);
			else
				I_ext := pols'LOW;
			end if;
		end if;
	end loop main;
	if not not_finished then
		return result;
	else
		ASSERT NO_WARNING
			REPORT "vi_functions.Get_pol : main loop has finished without a value : check ncodes and polynomials"
			severity ERROR;
		return 0;
	end if;
  	
end Get_pol;


function get_polynomials(n, L_max, L_code : NATURAL; gen_pols : NATURAL_ARRAY) return vector_2D is

	variable  result: vector_2D(n downto 1);

  begin

	for I in 1 to n loop
		result(I)(L_max downto 1) := --natural_2_m(arg => gen_pols(I)*(2**(L_max-L_code)), size => L_max);
		    CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => gen_pols(I)*(2**(L_max-L_code)), SIZE => L_max), SIZE => L_max);
	end loop;
	
	return result;

end get_polynomials;


-- This function used in the parallel, not hybrid.
function Trellis_constructor(n, L : NATURAL; ga, gb, gc, gd, ge, gf, gg : STRING) return NATURAL_ARRAY is

	Subtype gen_pol_con Is NATURAL_ARRAY(1 to 7);

	Constant pol_sel : NATURAL := 1; 
	Constant halfstates : NATURAL := 2**(L-2);

	Constant g_a : NATURAL := Get_pol(pols => ga, index => pol_sel);
	Constant g_b : NATURAL := Get_pol(pols => gb, index => pol_sel);
	Constant g_c : NATURAL := Get_pol(pols => gc, index => pol_sel);
	Constant g_d : NATURAL := Get_pol(pols => gd, index => pol_sel);
	Constant g_e : NATURAL := Get_pol(pols => ge, index => pol_sel);
	Constant g_f : NATURAL := Get_pol(pols => gf, index => pol_sel);
	Constant g_g : NATURAL := Get_pol(pols => gg, index => pol_sel);
	Constant gen_pols : NATURAL_ARRAY(1 TO 7) := gen_pol_con'(g_a, g_b, g_c, g_d, g_e, g_f, g_g);
	Constant genvec : Vector_2D(n downto 1) := get_polynomials(n=>n, L_max=>L, L_code=>L, gen_pols=>gen_pols);

	Variable vecnode : Vector_2D(n downto 1);
	Variable state : Std_Logic_Vector(L downto 1);
 	variable vector : Std_Logic_Vector(n downto 1);
	variable trellis_hypo : NATURAL_ARRAY(halfstates downto 1);

	begin

----------

gha: FOR I IN 0 TO (halfstates-1) loop

	state(L downto 2) := --natural_2_m(arg => I, size => L-1);
	  CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => I, SIZE => L-1), SIZE => L-1);
	state(1) := '0';

	fg1: FOR k IN 1 TO n loop
	   vecnode(k)(1) := state(1) and genvec(k)(1);
	  fg2: FOR j IN 2 TO L loop
		  vecnode(k)(j) := (state(j) and genvec(k)(j)) xor vecnode(k)(j-1); 
	  END loop fg2;
	END loop fg1;
	fg3: FOR k IN 1 TO n loop
		--***********************
	  --*** LSB FIRST !!!!! ***
	  --***********************
		vector(k) := vecnode(n-k+1)(L);
	end loop fg3;
	trellis_hypo(I+1) := 1 + NATURAL'(conv_integer(arg => unsigned(vector)));

end loop gha;

  return trellis_hypo;
		
end function Trellis_constructor;


function Trellis_constructor_ncodes(ncodes, n_max, L_max : NATURAL; hypobit : Std_Logic;
                                    n, L, ga, gb, gc, gd, ge, gf, gg : STRING)
                                    return NATURAL_2D_ARRAY is

	Subtype gen_pol_con Is NATURAL_ARRAY(1 to 7);

	
--	Constant halfstates : NATURAL := 2**(L_max-2);
	Constant maxstates : NATURAL := 2**(L_max-1);
	Constant n_list : NATURAL_ARRAY(1 to ncodes) := Get_n_list(n => n, ncodes => ncodes);
	Constant L_list : NATURAL_ARRAY(1 to ncodes) := Get_n_list(n => L, ncodes => ncodes);
	
	
	Variable pol_sel : NATURAL;
	Variable g_a, g_b, g_c, g_d, g_e, g_f, g_g : NATURAL;
	Variable gen_pols : NATURAL_ARRAY(1 TO 7);
	Variable vecnode, genvec : Vector_2D(n_max downto 1);
	Variable state : Std_Logic_Vector(L_max downto 1);
 	variable vector : Std_Logic_Vector(n_max downto 1);
	variable trellis_hypo : NATURAL_2D_ARRAY(ncodes downto 1, maxstates downto 1);

	begin

----------

nc_loop: for H in 1 to ncodes loop

  pol_sel := H;
	g_a := Get_pol(pols => ga, index => pol_sel);
	g_b := Get_pol(pols => gb, index => pol_sel);
	g_c := Get_pol(pols => gc, index => pol_sel);
	g_d := Get_pol(pols => gd, index => pol_sel);
	g_e := Get_pol(pols => ge, index => pol_sel);
	g_f := Get_pol(pols => gf, index => pol_sel);
	g_g := Get_pol(pols => gg, index => pol_sel);
	gen_pols := gen_pol_con'(g_a, g_b, g_c, g_d, g_e, g_f, g_g);
	genvec := get_polynomials(n=>n_max, L_max=>L_max, L_code=>L_list(H), gen_pols=>gen_pols);


	gha: FOR I IN 0 TO (maxstates-1) loop

		state(L_max downto 2) := --natural_2_m(arg => I, size => L_max-1);
		    CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => I, SIZE => L_max-1), SIZE => L_max-1);
		state(1) := hypobit;

		fg1: FOR k IN 1 TO n_list(H) loop
		   vecnode(k)(1) := state(1) and genvec(k)(1);
		  fg2: FOR j IN 2 TO L_max loop
			  vecnode(k)(j) := (state(j) and genvec(k)(j)) xor vecnode(k)(j-1); 
		  END loop fg2;
		END loop fg1;
		fg3: FOR k IN 1 TO n_list(H) loop
			--***********************
		  --*** LSB FIRST !!!!! ***
		  --***********************
			vector(k) := vecnode(n_list(H)-k+1)(L_max);
		end loop fg3;
		trellis_hypo(H, I+1) := 1 + NATURAL'(conv_integer(arg => unsigned(vector(n_list(H) downto 1))));

	end loop gha;
end loop nc_loop;


return trellis_hypo;
		
end function Trellis_constructor_ncodes;



function a_ge_b(a, b : NATURAL) return NATURAL is

	variable result : NATURAL;

begin
	if a >= b then
	  result := 1;
	else
		result := 0;
	end if;
	return result;

end function a_ge_b;



procedure pla_table(signal invec: in std_logic_vector;
										variable outvec: out std_logic_vector;
										Constant table: pla_table_t) is

	subtype result_type is Std_Logic_Vector(outvec'HIGH downto outvec'LOW);
	Constant nil_row : pla_row := (others => pla_element'(' '));
	variable row: pla_row;
	variable match: boolean;
	variable in_pos: NATURAL;


begin
	
outvec := result_type'(others => Std_Logic'( '0' ));
for i in table'range loop
  row := table(i);
	if row /= nil_row then
    match := true;
    in_pos := invec'HIGH+1;
    for j in outvec'HIGH+invec'HIGH+1 downto outvec'HIGH+invec'LOW+1 loop
      in_pos := in_pos - 1;
      if(row(j) = pla_element'( '1' )) then
      	match := match and
      	(invec(in_pos) = Std_Logic'( '1' ));
      elsif(row(j) = pla_element'( '0' )) then
      	match := match and
      	(invec(in_pos) = Std_Logic'( '0' ));
      else
      	null;
      end if;
    end loop;
    if(match) then
    	for j in outvec'range loop
    		if (row(j) = pla_element'('1')) then
    			outvec(j) := Std_Logic'('1');
    		end if;
  		end loop;
  	end if;
	end if;
end loop;

end pla_table;

procedure pla_table_v(variable invec_v: in std_logic_vector;
										variable outvec: out std_logic_vector;
										Constant table: pla_table_t) is

	subtype result_type is Std_Logic_Vector(outvec'HIGH downto outvec'LOW);
	Constant nil_row : pla_row := (others => pla_element'(' '));
	variable row: pla_row;
	variable match: boolean;
	variable in_pos: NATURAL;


begin
	
outvec := result_type'(others => Std_Logic'( '0' ));
for i in table'range loop
  row := table(i);
	if row /= nil_row then
    match := true;
    in_pos := invec_v'HIGH+1;
    for j in outvec'HIGH+invec_v'HIGH+1 downto outvec'HIGH+invec_v'LOW+1 loop
      in_pos := in_pos - 1;
      if(row(j) = pla_element'( '1' )) then
      	match := match and
      	(invec_v(in_pos) = Std_Logic'( '1' ));
      elsif(row(j) = pla_element'( '0' )) then
      	match := match and
      	(invec_v(in_pos) = Std_Logic'( '0' ));
      else
      	null;
      end if;
    end loop;
    if(match) then
    	for j in outvec'range loop
    		if (row(j) = pla_element'('1')) then
    			outvec(j) := Std_Logic'('1');
    		end if;
  		end loop;
  	end if;
	end if;
end loop;

end pla_table_v;


function Extract_item(list : NATURAL_ARRAY; index : NATURAL) return NATURAL is

  variable item : NATURAL;

begin
	if list'HIGH < index then
	  item := 0;
	else
	  item := list(index);
	end if;
	return item;
end Extract_item;



-- function bin_mod(a, d: in NATURAL) return NATURAL is
-- 
  -- variable result : NATURAL;
-- 
-- begin
-- 
	-- if (a mod d)/=0 then
		-- result := 1;
	-- else
		-- result := 0;
	-- end if;
	-- return result;
	-- 
-- end function bin_mod;


function Get_n_min(n : NATURAL_ARRAY) return NATURAL is

	variable n_min : NATURAL;

begin

	if n(n'LOW) >= 2 then
		n_min := n(n'LOW);
	else
	  n_min := 2;
	end if;
	For I in n'LOW to n'HIGH loop
		if (n(I) < n_min) and (n(I) >= 2) then
			n_min := n(I);
		end if;
	end loop;
	return n_min;
	
end Get_n_min;

function Get_max_of_three(param_1, param_2, param_3 : NATURAL) return NATURAL is

  variable max : NATURAL;

begin

	max := param_1;
	if param_2 > max then
		max := param_2;
	end if;
	if param_3 > max then
		max := param_3;
	end if;
	return max;

end Get_max_of_three;


function Get_min(param_1, param_2 : NATURAL) return NATURAL is

  variable min : NATURAL;

begin

	min := param_1;
	if param_2 < min then
		min := param_2;
	end if;
	return min;

end Get_min;
 

-- function Transform_punctured_rate(punctured_rate : STRING) return NATURAL_ARRAY is
-- 
  -- variable fraction : NATURAL_ARRAY(2 downto 1);
	-- variable extracted_value : STRING(punctured_rate'HIGH downto 1);
	-- variable item : character;
	-- variable I_ext, I_n : NATURAL; -- indexes
-- 
-- begin
-- 
-- --	variable n_list : NATURAL_ARRAY(1 to ncodes);
-- --	variable not_finished : BOOLEAN;
-- 
-- --  count_items := 1;
	-- I_ext := 1;
	-- I_n := 1;
	-- item := punctured_rate(I_n);
-- --	second: while (item /= '/') and (I_n <= punctured_rate'HIGH) loop
	-- first: while (item /= '/') loop
		-- if check_base(item => item, base => "DEC") then
			-- extracted_value(I_ext) := punctured_rate(I_n);
		-- end if;
		-- I_ext := I_ext + 1;
		-- I_n := I_n + 1;
		-- if I_n <= punctured_rate'HIGH then
			-- item := punctured_rate(I_n);
		-- end if;
	-- end loop first;  -- numerator
	-- fraction(2) := Convert_str_nat(pol_value => extracted_value(I_ext downto 1), base => "DEC");
	-- I_n := I_n+1;
	-- I_ext := 1;
	-- if I_n <= punctured_rate'HIGH then
		-- item := punctured_rate(I_n);
	-- end if;
	-- second: while (item /= '/') and (I_n <= punctured_rate'HIGH) loop
-- --	first: while (item /= '/') loop
		-- if check_base(item => item, base => "DEC") then
			-- extracted_value(I_ext) := punctured_rate(I_n);
		-- end if;
		-- I_ext := I_ext + 1;
		-- I_n := I_n + 1;
		-- if I_n <= punctured_rate'HIGH then
			-- item := punctured_rate(I_n);
		-- end if;
	-- end loop second;  -- denominator
	-- fraction(1) := Convert_str_nat(pol_value => extracted_value(I_ext downto 1), base => "DEC");
-- 
	-- return fraction;
-- 
-- end function Transform_punctured_rate;

-- function Calc_puncturing_rate(n : NATURAL; punctured_rate_fraction : NATURAL_ARRAY) return NATURAL_ARRAY is
-- 
	-- variable fraction : NATURAL_ARRAY(2 downto 1);
-- 
-- begin
	-- 
	-- fraction(2) := punctured_rate_fraction(1);
	-- fraction(1) := punctured_rate_fraction(2)*n;
	-- return fraction;
-- 
-- end function Calc_puncturing_rate;


-- function Transform_pattern_2_mini_rom(n : NATURAL;
																			-- punctured_rate, puncturing_pattern : STRING)
																			-- return mini_rom is
-- 
	-- Constant punctured_rate_fraction : NATURAL_ARRAY(2 downto 1) := 
				 -- Transform_punctured_rate(punctured_rate);  -- 2 numerator, 1 denominator
-- 
	-- Constant puncturing_rate_fraction : NATURAL_ARRAY(2 downto 1) := 
				 -- Calc_puncturing_rate(n, punctured_rate_fraction);  -- 2 numerator, 1 denominator
-- 
	-- Constant top_sequencer_val : NATURAL := 
				 -- puncturing_rate_fraction(2)*puncturing_pattern'HIGH/puncturing_rate_fraction(1);
-- 
	-- variable ser_2_par_ref : INTEGER_ARRAY(1 to n*top_sequencer_val);
	-- variable pun_operation : INTEGER_ARRAY(1 to n*top_sequencer_val);
	-- variable ref, hypo : INTEGER_ARRAY(1 to n);
	-- variable pat_cursor, pattern_order : NATURAL;
	-- variable result : mini_rom(0 to top_sequencer_val);
	-- variable upgrade_hypo : BOOLEAN;
-- 
-- 
-- begin
	-- 
	-- upgrade_hypo := TRUE;
	-- --  First build reference for serial to parallel conversion.
	-- first : For I in 1 to top_sequencer_val loop
		-- second : For J in 0 to n-1 loop
			-- if J >= I then
				-- ser_2_par_ref(I*n-J) := 0;
			-- else
				-- ser_2_par_ref(I*n-J) := I-J;
			-- end if;
		-- end loop second;
	-- end loop first;
	-- --  Build puncturing operation implementation
	-- pat_cursor := 1;
	-- --ref_cursor := 1;
	-- pattern_order := 1;
	-- f3 : For ref_cursor in 1 to top_sequencer_val loop
  	-- -- Extract reference and hypotesis partial strings
  	-- ref := ser_2_par_ref(n*(ref_cursor-1)+1 to n*ref_cursor);
		-- if upgrade_hypo then
    	-- third: For I in 1 to n loop
    		-- if puncturing_pattern(n*(pat_cursor-1)+I)='0' then
    			-- hypo(I) := pattern_order;
    			-- pattern_order := pattern_order+1;
    		-- else -- puncturing code = -1
    			-- hypo(I) := -1;
    		-- end if;
    	-- end loop third;
		-- end if;
  	-- if Have_same_elements(hypo, ref) then
  		-- pun_operation(n*(ref_cursor-1)+1 to n*ref_cursor) := hypo;
  		-- pat_cursor := pat_cursor+1;
			-- upgrade_hypo := TRUE;
  	-- else -- code -2 introduce : Freeze operation as serial data still to come
  		-- -- this others may not work in FPGA Express : loop will be needed.
  		-- pun_operation(n*(ref_cursor-1)+1 to n*ref_cursor) := (others => -2);
			-- upgrade_hypo := FALSE;
  	-- end if;
	-- end loop f3;
	-- --  Now I have to fill in the mini_rom table according to the data in 
	-- --  pun_operation and ser_2_par_ref
	-- -- at 0 result = all 1
	-- result(0) := (others => '1');
	-- f4 : For J in 1 to top_sequencer_val loop
		-- swap : For I in 1 to n loop
			-- if (pun_operation(n*(J-1)+I)=-2) or (pun_operation(n*(J-1)+I)=-1)	then
				-- result(J)(n-I+1) := '1';
			-- else
				-- result(J)(n-I+1) := '0';
			-- end if;
			-- hypo(I) := pun_operation(n*(J-1)+I);
			-- ref(I)  := ser_2_par_ref(n*(J-1)+I);
		-- end loop swap;
		-- if Are_they_aligned(hypo, ref) then
			-- result(J)(3) := '0';
		-- else
			-- result(J)(3) := '1';
		-- end if;
	-- end loop f4;
-- 
	-- return result;
	-- 
-- end function Transform_pattern_2_mini_rom;

-- function Have_same_elements(hypo, ref : INTEGER_ARRAY) return BOOLEAN is
-- 
	-- variable hypo_check : BOOLEAN_ARRAY(1 to hypo'HIGH);
	-- variable result, found_match : BOOLEAN;
	-- variable posibility_of_using_wild_card : BOOLEAN;
	-- variable position_wirl_card : NATURAL;
-- 
-- begin
	-- result := TRUE;
	-- hypo_check := (others => FALSE);
	-- posibility_of_using_wild_card := FALSE;
	-- found_match := FALSE;
	-- first: For I in 1 to ref'HIGH loop
		-- if result then
  		-- second: For J in 1 to hypo'HIGH loop
  			-- if hypo_check(J)=FALSE and (ref(I)=hypo(J)) then
  				-- found_match := TRUE;
  				-- hypo_check(J) := TRUE;
  			-- elsif hypo_check(J)=FALSE and (hypo(J)=-1) then
  				-- posibility_of_using_wild_card := TRUE;
  				-- position_wirl_card := J;
  			-- end if;
  		-- end loop second;
  		-- if found_match then
  			-- found_match := FALSE;
  		-- elsif posibility_of_using_wild_card then
  			-- posibility_of_using_wild_card := FALSE;
  			-- hypo_check(position_wirl_card) := TRUE;
  		-- else -- cannot have same items
  			-- result := FALSE;
  		-- end if;
		-- end if;
	-- end loop first;
	-- 
	-- return result;
-- 
-- end function Have_same_elements;


-- function Are_they_aligned(hypo, ref : INTEGER_ARRAY) return BOOLEAN is
-- 
	-- variable result : BOOLEAN;
-- 
-- begin
	-- result := TRUE;
	-- first: For I in 1 to ref'HIGH loop
		-- if result then
 			-- if (hypo(I)/=-1) and (hypo(I)/=-2) and (ref(I)/=hypo(I)) then
				-- result := FALSE;
 			-- end if;
		-- end if;
	-- end loop first;
	-- 
	-- return result;
-- 
-- end function Are_they_aligned;

function Build_tree_arch(n : NATURAL) return NATURAL_ARRAY is

	Constant log2_n : NATURAL := LOG2_ceil_table(n);
	variable tmp : NATURAL;
	variable tree_arch : NATURAL_ARRAY(0 to log2_n);

begin

tree_arch(0):=n;
tmp := n;
if log2_n>0 then 
	for I in 1 to log2_n loop
		tmp := tmp/2 + (tmp mod 2);
		tree_arch(I):=tmp;
	end loop;
end if;
return tree_arch;

end function Build_tree_arch;


function Build_binary_table(n : NATURAL) return Vector_2D is

	Constant log_size : NATURAL := LOG2_ceil_avoid_one(n);
	variable binary_table : Vector_2D(0 to n-1);

begin

for I in 0 to n-1 loop
	binary_table(I)(log_size downto 1) := --natural_2_m(arg => I, size => log_size);
	    CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => I, SIZE => log_size), SIZE => log_size);
end loop;
return binary_table;

end function Build_binary_table;


function Build_binary_table_evenodd(n, parity : NATURAL) return Vector_2D is

	Constant log_size : NATURAL := LOG2_ceil_table(n);
	variable binary_table : Vector_2D(0 to n-1);

begin
	for I in 0 to n-1 loop
		if log_size>0 then
			binary_table(I)(log_size+1 downto 2) := --natural_2_m(arg => I, size => log_size);
			    CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => I, SIZE => log_size), SIZE => log_size);
		end if;
		if parity=0 then
			binary_table(I)(1) := '0';
		else
			binary_table(I)(1) := '1';
		end if;
	end loop;
return binary_table;

end function Build_binary_table_evenodd;


function Build_two_power_L_list(L, ACS_units : NATURAL) return NATURAL_ARRAY is

	Constant log2_ACS_units : NATURAL := LOG2_ceil_table(ACS_units);
	variable states_fractions : NATURAL_ARRAY(0 to log2_ACS_units+1);

begin

for I in 0 to log2_ACS_units+1 loop
	states_fractions(I) := 2**(L-1-I);
end loop;
return states_fractions;
	
end function Build_two_power_L_list;



function gen_node_sync_mux_ctrl(n, m : STRING; n_max : NATURAL)	return array_of_pla_tables_t is

	Constant ncodes : NATURAL := Get_ncodes(n);
	Constant log2_ncodes : NATURAL := LOG2_ceil_table(ncodes);
  Constant log2_n_max : NATURAL := LOG2_ceil_table(n_max);
  Constant m_list : NATURAL_ARRAY(1 to ncodes) := Get_modes_list(modes => m, ncodes => ncodes);

	variable n_list : NATURAL_ARRAY(1 to ncodes);
  Variable node_synch_ctrl_matrix : array_of_pla_tables_t(n_max downto 1);
	
	variable tmp : pla_vector(log2_n_max downto 1);
	variable tmp2 : pla_vector(log2_n_max+log2_ncodes downto 1);
	variable in_pla, out_pla, n_sel : NATURAL;

begin

  n_list := Get_n_list(n => n, ncodes => ncodes);
  for I in 1 to n_max loop -- every PLA controlling every MUX between rrff and rrffa in hyb_bmp_cnt
		for J in 0 to 2**log2_ncodes-1 loop -- sel_code
		--  need to consider here the case that ncodes_max now is 5!!
			if (J+1<=ncodes) then
			  if m_list(J+1)=0 then
					n_sel := n_list(J+1);
				elsif m_list(J+1)=1 then
					n_sel := 4;  -- TCM
				end if;
			else
				n_sel := 2;
			end if;
		  for K in 0 to 2**log2_n_max-1 loop  -- state synch
				if K > n_sel-1 then
				-- output to 0
					tmp := (others => '-');
				else
					out_pla := (I-1+K) mod n_sel;
					tmp := natural_2_m(arg => out_pla, size => log2_n_max);
				end if;
				in_pla := J*(2**(log2_n_max)) + K;
				tmp2 := natural_2_m(arg => in_pla, size => log2_n_max+log2_ncodes);
				if 2*log2_n_max+log2_ncodes+1 <= row_size_max then
					-- output first
					for b in log2_n_max downto 1 loop
 						node_synch_ctrl_matrix(I)(in_pla+1)(b) := tmp(b);
  				end loop;
					node_synch_ctrl_matrix(I)(in_pla+1)(log2_n_max+1) := pla_element'(' ');
					-- now the input
					for b in 2*log2_n_max+log2_ncodes+1 downto log2_n_max+2 loop
  					node_synch_ctrl_matrix(I)(in_pla+1)(b) := tmp2(b-log2_n_max-1);
  				end loop;
					if 2*log2_n_max+log2_ncodes+1 < row_size_max then
						for b in row_size_max downto 2*log2_n_max+log2_ncodes+2 loop
  						node_synch_ctrl_matrix(I)(in_pla+1)(b) := pla_element'(' ');
  					end loop;
					end if;
				else
					assert NO_WARNING
          	report "vi_functions.gen_node_sync_mux_ctrl: row_size_max not big enough!!"
          	severity ERROR;
				end if;
			end loop;
		end loop;
		-- Fill the remaining positions in the tables with spaces
		for J in 2**(log2_ncodes+log2_n_max)+1 to max_two_pow_input loop
		  for b in row_size_max downto 1 loop
				node_synch_ctrl_matrix(I)(J)(b) := pla_element'(' ');
			end loop;
		end loop;
	end loop;

return node_synch_ctrl_matrix;

end function gen_node_sync_mux_ctrl;


function Get_log2_n_list(n_list : NATURAL_ARRAY) return NATURAL_ARRAY is

	variable log2_n_list : NATURAL_ARRAY(n_list'LOW to n_list'HIGH);

begin

	For I in n_list'LOW to n_list'HIGH loop
		log2_n_list(I) := LOG2_ceil_table(n_list(I)+1);
	end loop;
	return log2_n_list;
	
end Get_log2_n_list;

function set_sequencer_count(arg : NATURAL) return Std_Logic_Vector is

	variable result : Std_Logic_Vector(arg+1 downto 1);

begin
-- if log2_cc=3 then 10-1 , else 2**log2_cc-1
	if arg=3 then
		result :=	--natural_2_m(arg => 9, size => arg+1);
		   CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => 9, SIZE => arg+1), SIZE => arg+1);
	else
		result :=	--natural_2_m(arg => 2**arg-1, size => arg+1);
		   CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => 2**arg-1, SIZE => arg+1), SIZE => arg+1);
	end if;
	return result;

end set_sequencer_count;


function set_sequencer_width(arg : NATURAL) return NATURAL is

	variable result : NATURAL;

begin
	if arg=3 then
		result :=	3;
	else
		result :=	arg+1;
	end if;
	return result;

end set_sequencer_width;


function Calc_bitsout(L, ACS, V : NATURAL) return NATURAL is

	variable log2_cc, bitsout, bitsout_tmp, divisor : NATURAL;

begin
	log2_cc := L-2-LOG2_ceil_table(ACS);
	if log2_cc = 3 then
		divisor := 10;
	else
		divisor := 2** log2_cc;
	end if;
	bitsout_tmp := ceil_DIV(v+1, divisor);
	bitsout     := ceil_DIV(v+1+bitsout_tmp, divisor);
	if bitsout < 4 then
		bitsout := 4;
	end if;
	--bitsout := bitsout + 1;
	-- SPR 191124  limit bitsout to 31!!
	if bitsout > 31 then
		bitsout := 31;
		-- coverage on
		ASSERT FALSE
		-- coverage off
			REPORT 		"Calc_bitsout function: bitsout had to be clipped to 31!! Watch out what V is being set!" 
			SEVERITY		WARNING;
	end if;
	return bitsout;
end function Calc_bitsout;


function un_encoded_bit_extract(two_re_enc_bits : Std_Logic_Vector(2 downto 1); sector: natural) return CHARACTER is

  variable unenc_bit : CHARACTER;

begin

if two_re_enc_bits="00" then
  if sector=1 or sector=0 or sector=7 or sector=6 then 
    unenc_bit:='0';
  else
    unenc_bit:='1';
  end if;
elsif two_re_enc_bits="01" then
	if sector=0 or sector=1 or sector=2 or sector=7 then 
    unenc_bit:='0';
  else
    unenc_bit:='1';
  end if;
elsif two_re_enc_bits="10" then
  if sector=4 or sector=1 or sector=2 or sector=3 then 
    unenc_bit:='0';
  else
    unenc_bit:='1';
  end if;
elsif two_re_enc_bits="11" then
  if sector=0 or sector=1 or sector=2 or sector=3 then 
    unenc_bit:='0';
  else
    unenc_bit:='1';
  end if;
else 
  unenc_bit :='X';
end if;
return unenc_bit;

end function un_encoded_bit_extract;


function init_state_metric_constructor(L_max, ncodes, bmgwide : NATURAL; L : STRING) return Std_Logic_3D_CUBE is

	Constant halfstates : NATURAL := 2**(L_max-2);
	Constant L_list  : NATURAL_ARRAY(1 to ncodes) := Get_n_list(n => L, ncodes => ncodes);
--	Constant bm_init_val : Std_Logic_Vector(bmgwide downto 1) := natural_2_m(arg => 2**(bmgwide-2), size => bmgwide);
	variable states_selection : NATURAL;
	variable bm_init_matrix : Std_Logic_3D_CUBE(ncodes downto 1, halfstates downto 1, bmgwide downto 1);

begin
	for I in 1 to ncodes loop
		states_selection := 2**(L_max - l_list(I));
		for J in 1 to halfstates loop
			if J=1 or J<= states_selection then
				for K in 1 to bmgwide loop
				-- value 2**(bmgwide-2) added
					if K=(bmgwide-1) then
						bm_init_matrix(I, J, K) := '1';
					else
						bm_init_matrix(I, J, K) := '0';
					end if;
				end loop;
			else
				for K in 1 to bmgwide loop
					bm_init_matrix(I, J, K) := '0';
				end loop;
			end if;
		end loop;
	end loop;

	return bm_init_matrix;

end function init_state_metric_constructor;


end vi_functions;
