-------------------------------------------------------------------------
-------------------------------------------------------------------------
-- Description	:  This package contains all the functions that are required
--                 at the interface of the Viterbi entities
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

package  vi_interface  is

	constant NO_WARNING: BOOLEAN := FALSE; -- default to emit warnings

	type NATURAL_ARRAY is array(NATURAL RANGE <>) of NATURAL;
	type NATURAL_2D_ARRAY is array(NATURAL RANGE <>, NATURAL RANGE <>) of NATURAL;
	type std_logic_matrix is array (natural range <>, natural range <>) of std_logic;
	type Std_Logic_3D_CUBE is array(NATURAL RANGE <>, NATURAL RANGE <>, NATURAL RANGE <>) of Std_Logic;

	function LOG2_ceil_table(x: in NATURAL) return NATURAL;
	function Ceil_DIV(a, d: in NATURAL) return NATURAL;
	function check_base(item : character; base : STRING) return BOOLEAN;
	function Convert_str_nat(pol_value, base : STRING) return NATURAL;
	function Get_ncodes(n: STRING) return NATURAL;
	function Get_n_list(n: STRING; ncodes : NATURAL) return NATURAL_ARRAY;
	function Get_modes_list(modes: STRING; ncodes : NATURAL) return NATURAL_ARRAY;
	function Get_n_max(n : STRING) return NATURAL;
	function Get_n_max_modes(n, m : STRING) return NATURAL;
	function Get_rr_size(n, softbits: in NATURAL; punctured_rate : in STRING) return NATURAL;
	function LOG2_ceil_avoid_one(n : in NATURAL) return NATURAL;
	function mul(a, b: in NATURAL) return NATURAL;
	function j_init_function(opt_par: in STRING) return NATURAL;

end vi_interface;


package body  vi_interface  is


function LOG2_ceil_table(x: in NATURAL) return NATURAL is

  variable result : NATURAL;

begin
	
	if x=1 then
	  result:=0;
	elsif x=2 then
	  result:=1;
	elsif x>2 and x<5 then
	  result:=2;
	elsif x>4 and x<9 then
	  result:=3;
	elsif x>8 and x<17 then
	  result:=4;
	elsif x>16 and x<33 then
	  result:=5;
	elsif x>32 and x<65 then
	  result:=6;
	elsif x>64 and x<129 then
	  result:=7;
	elsif x>128 and x<257 then
	  result:=8;
	elsif x>256 and x<513 then
	  result:=9;
	elsif x>512 and x<1025 then
	  result:=10;
	elsif x>1024 and x<2049 then
	  result:=11;
	elsif x>2048 and x<4097 then
	  result:=12;
	else
	  assert NO_WARNING
          report "vi_interface.LOG2_ceil_table: x out of range"
          severity WARNING;
  end if;
	return result;

end LOG2_ceil_table;


function Ceil_DIV(a, d: in NATURAL) return NATURAL is

  variable result : NATURAL;

begin

  result := a/d;
	if (a mod d)/=0 then
		result := result + 1;
	end if;
	return result;
	
end function Ceil_DIV;

function check_base(item : character; base : STRING) return BOOLEAN is

begin

if base="OCT" then
	if item = '0' or item = '1' or item = '2' or item = '3' or
	   item = '4' or item = '5' or item = '6' or item = '7' then
		 return TRUE;
	else
		ASSERT FALSE
		  report "Error: String character is not OCTAL."
		  severity Error;
		return FALSE;
	end if;
elsif base="DEC" then
	if item = '0' or item = '1' or item = '2' or item = '3' or item = '4' or
	   item = '5' or item = '6' or item = '7' or item = '8' or item = '9' then
		 return TRUE;
	else
		ASSERT FALSE
		  report "Error: String character is not DECIMAL."
		  severity Error;
		return FALSE;
	end if;
else
	ASSERT FALSE
	  report "Error: base parameter isn't either DEC or OCT."
	  severity Error;
	return FALSE;
end if;
	
end check_base;

function Convert_str_nat(pol_value, base : STRING) return NATURAL is
	variable base_factor : NATURAL;
	variable digit : NATURAL;
	variable result : NATURAL;

begin
	
	result:=0;
	digit:=0;
	if base="OCT" then
		base_factor:=8;
	elsif base="DEC" then
		base_factor:=10;
	end if;
	For I in 1 to pol_value'HIGH loop
  	case pol_value(I) is
    	when '0' => digit:=0;
    	when '1' => digit:=1;
    	when '2' => digit:=2;
    	when '3' => digit:=3;
    	when '4' => digit:=4;
    	when '5' => digit:=5;
    	when '6' => digit:=6;
    	when '7' => digit:=7;
    	when '8' => digit:=8;
    	when '9' => digit:=9;
    	when others => digit:=0;
    end case;
		result := result + digit*(base_factor**(pol_value'HIGH-I));
	end loop;
	return result;
	
end Convert_str_nat;


--function Get_ncodes(n: STRING) return NATURAL is
--
--  variable extracted_value : STRING(n'HIGH downto 1);
--	variable item : character;
--	variable I_ext, I_n, count_spaces : NATURAL; -- indexes
--	variable result : NATURAL;
--	variable not_finished : BOOLEAN;
--
--begin
--
--  count_spaces := 0;
--	I_ext := 1;
--	I_n := 1;
--	item := n(I_n);
--	not_finished := TRUE;
--	main: while not_finished loop
--		second: while (item /= ' ') and (I_n <= n'HIGH) loop
--			if check_base(item => item, base => "DEC") then
--				extracted_value(I_ext) := n(I_n);
--			else
--				return 1;
--			end if;
--			I_ext := I_ext + 1;
--			I_n := I_n + 1;
--			if I_n <= n'HIGH then
--				item := n(I_n);
--			else
--				not_finished := FALSE;
--			end if;
--		end loop second;
--		third : while item=' ' and (I_n <= n'HIGH) loop
--			I_n := I_n+1;
--			if I_n <= n'HIGH then
--				item := n(I_n);
--			else
--				not_finished := FALSE;
--			end if;
--		end loop third;
--		I_ext := 1;
--		count_spaces := count_spaces+1;
--	end loop main;
--	return count_spaces;  -- the number of codes is the number of spaces + 1
--	
--end Get_ncodes;


-- to be rewritten in order to make it FPGA Express complaint.
function Get_ncodes(n: STRING) return NATURAL is

	variable item : character;
	variable count_spaces : NATURAL; -- indexes
	variable not_finished, looking_for_more_spaces : BOOLEAN;

begin

  count_spaces := 0;
	not_finished := TRUE;
	looking_for_more_spaces := FALSE;
	main: For I_n in n'LOW to n'HIGH loop
	  item := n(I_n);
		if (I_n=n'LOW) and ((item=' ') or (item='_')) and not_finished then
			ASSERT NO_WARNING
				REPORT "vi_interface.Get_ncodes : Bad format on STRING of n's. First item is space"
				severity ERROR;
			return 0;
		elsif (item /= ' ') and (item /= '_') and not_finished then
			if not check_base(item => item, base => "DEC") then
				ASSERT NO_WARNING
					REPORT "vi_interface.Get_ncodes : mismatch base - digit"
					severity ERROR;
				return 0;
			end if;
			-- finish here if last
			if I_n=n'HIGH then
		 -- this is finished
			  not_finished := FALSE;
			else
				looking_for_more_spaces := FALSE;
			end if;
		elsif ((item=' ') or (item='_')) and (not looking_for_more_spaces) and not_finished then
			count_spaces := count_spaces+1;
			looking_for_more_spaces := TRUE;
		end if;
	end loop main;
	count_spaces := count_spaces+1;
	return count_spaces;
  -- the number of codes is the number of spaces + 1
	
end Get_ncodes;



-- to be rewritten to make it compliant with FPGA Express
function Get_n_list(n: STRING; ncodes : NATURAL) return NATURAL_ARRAY is

  variable extracted_value : STRING(n'LOW to n'HIGH);
	variable item : character;
	variable I_ext, count_items : NATURAL; -- indexes
	variable n_list : NATURAL_ARRAY(1 to ncodes);
	variable not_finished, looking_for_more_spaces : BOOLEAN;

begin

  count_items := 1;
	I_ext := n'LOW;
	not_finished := TRUE;
	looking_for_more_spaces := FALSE;
	n_list := (others => 0);
	main: For I_n in n'LOW to n'HIGH loop
	  item := n(I_n);
		if (I_n=n'LOW) and ((item=' ') or (item='_')) and not_finished then
			ASSERT NO_WARNING
				REPORT "vi_interface.Get_n_list : Bad format on STRING of pols. First item is space"
				severity ERROR;
				return n_list;
		elsif (item /= ' ') and (item /= '_') and not_finished then
			if check_base(item => item, base => "DEC") then
				extracted_value(I_ext) := n(I_n);
			else
				ASSERT NO_WARNING
				REPORT "vi_interface.Get_n_list : mismatch base - digit"
				severity ERROR;
				return n_list;
			end if;
			-- finish here
			if I_n=n'HIGH then
		 -- this is finished
			  not_finished := FALSE;
				n_list(count_items) := Convert_str_nat(pol_value => extracted_value(n'LOW to I_ext), base => "DEC");
			else
				I_ext := I_ext + 1;
				looking_for_more_spaces := FALSE;
			end if;
		elsif ((item=' ') or (item='_')) and (not looking_for_more_spaces) and not_finished then
			n_list(count_items) := Convert_str_nat(pol_value => extracted_value(n'LOW to I_ext-1), base => "DEC");
			count_items := count_items+1;
			looking_for_more_spaces := TRUE;
			I_ext := n'LOW;
		end if;
	end loop main;
	if not not_finished then
		return n_list;
	else
		ASSERT NO_WARNING
			REPORT "vi_interface.Get_n_list : main loop has finished unproperly: check format in n list"
			severity ERROR;
		return n_list;
	end if;
 	
end Get_n_list;


function Get_modes_list(modes: STRING; ncodes : NATURAL) return NATURAL_ARRAY is

	variable item : character;
	variable count_items : NATURAL; -- indexes
	variable m_list : NATURAL_ARRAY(1 to ncodes);
	variable not_finished, looking_for_more_spaces : BOOLEAN;

begin

  count_items := 1;
	not_finished := TRUE;
	looking_for_more_spaces := FALSE;
	m_list := (others => 0);
	main: For I_n in modes'LOW to modes'HIGH loop
	  item := modes(I_n);
		if (I_n=modes'LOW) and ((item=' ') or (item='_')) and not_finished then
			ASSERT NO_WARNING
				REPORT "vi_interface.Get_modes_list : Bad format on STRING of modes. First item is space"
				severity ERROR;
				return m_list;
		elsif (item /= ' ') and (item /= '_') and not_finished then
			if item='V' then -- Viterbi mode = 0
				m_list(count_items) := 0;
			elsif item='T' then -- Trellis mode = 1
				m_list(count_items) := 1;
			else
				ASSERT NO_WARNING
				REPORT "vi_interface.Get_modes_list : character not recognized"
				severity ERROR;
				return m_list;
			end if;
			-- finish here
			if I_n=modes'HIGH then
		 -- this is finished
			  not_finished := FALSE;
			else
				looking_for_more_spaces := FALSE;
			end if;
		elsif ((item=' ') or (item='_')) and (not looking_for_more_spaces) and not_finished then
			count_items := count_items+1;
			looking_for_more_spaces := TRUE;
		end if;
	end loop main;
	if not not_finished then
		return m_list;
	else
		ASSERT NO_WARNING
			REPORT "vi_interface.Get_modes_list : main loop has finished unproperly: check format in modes list"
			severity ERROR;
		return m_list;
	end if;
 	
end Get_modes_list;



function Get_n_max(n : STRING) return NATURAL is

  Constant ncodes : NATURAL := Get_ncodes(n);
	variable n_list : NATURAL_ARRAY(1 to ncodes);
	variable n_max : NATURAL;

begin

	n_list := Get_n_list(n => n, ncodes => ncodes);
	n_max := n_list(1);
	For I in 1 to ncodes loop
		if n_list(I) > n_max then
			n_max := n_list(I);
		end if;
	end loop;
	return n_max;
	
end Get_n_max;


function Get_n_max_modes(n, m : STRING) return NATURAL is

  Constant ncodes : NATURAL := Get_ncodes(n);
	Constant m_list : NATURAL_ARRAY(1 to ncodes) := Get_modes_list(modes => m, ncodes => ncodes);
	variable n_list : NATURAL_ARRAY(1 to ncodes);
	variable n_max : NATURAL;

begin

	n_list := Get_n_list(n => n, ncodes => ncodes);
	n_max := 2;
	For I in 1 to ncodes loop
		if m_list(I)=1 then -- tCM
			n_list(I):=4;
		end if;
		if n_list(I) > n_max then
			n_max := n_list(I);
		end if;
	end loop;
	return n_max;
	
end Get_n_max_modes;

function Get_rr_size(n, softbits: in NATURAL; punctured_rate : in STRING) return NATURAL is

	variable rr_size : NATURAL;

begin
  
	if punctured_rate="unpunctured" then
		rr_size := n*softbits;
	else
		rr_size := softbits;
	end if;
	return rr_size;

end function Get_rr_size;

function LOG2_ceil_avoid_one(n : in NATURAL) return NATURAL is

	variable sel_code_size : NATURAL;

begin


--ncodes := Get_ncodes(n);
if n > 1 then
	sel_code_size := LOG2_ceil_table(n);
else
	sel_code_size := 1;
end if;
return sel_code_size;
	
end function LOG2_ceil_avoid_one;

function mul(a, b: in NATURAL) return NATURAL is
	variable result : NATURAL;
begin
	result := a*b;
	return result;
end mul;


function j_init_function(opt_par: in STRING) return NATURAL is
	variable result: NATURAL;
begin
	if opt_par="continuous" or opt_par="CONTINUOUS" then
		result := 1;
	else
		result := 0;
	end if;
	return result;
end j_init_function;

end vi_interface;
