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
library Viterbi;
use Viterbi.vi_interface.all;
library STD;
use STD.TEXTIO.all;

package  vi_bench  is

Type real_array is array(NATURAL RANGE <>) of REAL;

function get_units(item : STRING) return TIME;
function String_2_Time(n: STRING) return TIME;

function generate_list_thresholds (softbits : NATURAL; threshold : REAL ) return real_array;

function Check_generics(test_for, node_sync, BER : STRING) return BOOLEAN;

function make_blank_hex (width, widthadd : NATURAL) return STRING;

function natural_2_sv (ARG, SIZE: NATURAL) return Std_Logic_vector;

function To_Character (Value: Std_logic) return Character;
function To_String (Value: INTEGER) return STRING;
function To_String (Value: Std_logic_vector) return STRING;
function evec2Hex(value: std_logic_vector; size: natural) return STRING;
function Hex2slv (Value: STRING; size: NATURAL) return Std_logic_vector;

-- this functions come and are for the high speed model of the lpm_ram_dp:

function int_to_str (value : integer) return STRING;
function hex_str_to_int (str : STRING) return INTEGER;
procedure Shrink_line(L : inout LINE; pos : in integer);

end vi_bench;


package body vi_bench is


function get_units(item : STRING) return TIME is

	variable time_unit : TIME;
	Subtype two_chars is STRING(1 TO 2);
	Subtype thr_chars is STRING(1 TO 3);

begin
	time_unit := 0 ns;
		if item="hr" then
			time_unit := 1 hr;
		elsif item="min" then
			time_unit := 1 min;
		elsif item="sec" then
			time_unit := 1 sec;
		elsif item="ms" then
			time_unit := 1 ms;
		elsif item="us" then
			time_unit := 1 us;
		elsif item="ns" then
			time_unit := 1 ns;
		elsif item="ps" then
			time_unit := 1 ps;
		elsif item="fs" then
			time_unit := 1 fs;
		else
			time_unit := 0 ns;
			ASSERT FALSE
			REPORT "vi_bench.get_units : Time unit not recognized"
			severity ERROR;
		end if;

	return time_unit;

end get_units;


function String_2_Time(n: STRING) return TIME is

	Type succ_stages is (looking_4_numbers, looking_4_spaces, finished);

	Variable stage : succ_stages;

  variable extracted_value : STRING(n'LOW to n'HIGH);
	variable item : character;
	variable I_ext, value : NATURAL;
	variable time_value, time_unit : TIME;

begin

	I_ext := n'LOW;
	stage := looking_4_numbers;
	time_value := 1 ns;
	main: For I_n in n'LOW to n'HIGH loop
	  item := n(I_n);
		if (I_n=n'LOW) and (item=' ') then
			ASSERT NO_WARNING
				REPORT "vi_bench.String_2_Time : Bad format, First item is space"
				severity ERROR;
				return time_value;
		elsif item /= ' ' and (stage = looking_4_numbers) then
			if check_base(item => item, base => "DEC") then
				extracted_value(I_ext) := n(I_n);
			else
				ASSERT NO_WARNING
				REPORT "vi_bench.String_2_Time : mismatch base - digit"
				severity ERROR;
				return time_value;
			end if;
			I_ext := I_ext + 1;
		elsif item /= ' ' and (stage=looking_4_spaces) then
			stage := finished;
			extracted_value(n'LOW to n'HIGH - I_n + 1) := n(I_n to n'HIGH);
			time_unit := get_units(item => extracted_value(n'LOW to n'HIGH - I_n + 1));
		elsif I_n=n'HIGH or (stage = finished) then
		 -- this is finished
			time_value := value * time_unit;
			return time_value;
--  fs-ps-ns-us-ms-sec-min-hr
--  fpnumsecihr
			
		elsif (item=' ') and (stage = looking_4_spaces) then
			I_ext := n'LOW;
		elsif (item=' ') and (stage = looking_4_numbers) then
			value := Convert_str_nat(pol_value => extracted_value(n'LOW to I_ext-1), base => "DEC");
			stage := looking_4_spaces;
			I_ext := n'LOW;
		end if;
	end loop main;
 	
end String_2_Time;


function generate_list_thresholds (softbits : NATURAL; threshold : REAL ) return real_array is

	Constant  size : NATURAL := 2**(softbits-1)-1;

	variable  result: real_array(size downto 1);
	variable  aux, aux1, aux2: REAL;

begin

	for I in 1 to size loop
--		aux1 := (int_2_re(x => integer'(I)) - 1.0)/(2.0**(softbits-1)-1.0);
		aux1 := (REAL(integer'(I)) - 1.0)/(2.0**(softbits-1)-1.0);
		aux2 := 1.0/(2.0**softbits-2.0);
		aux := aux1 + aux2;
		result(I) := aux;
	end loop;

	return result;

end function generate_list_thresholds;


function Check_generics(test_for, node_sync, BER : STRING) return BOOLEAN is
	variable result : BOOLEAN;
begin

result := TRUE;
if (test_for="node_sync" AND BER="unused") then
	ASSERT FALSE  
  report "It's not possible to test node synchronization feature without using BER block"
	severity ERROR;
	result := FALSE;
end if;
--if (test_for="BER" AND BER="unused") then
--	ASSERT FALSE  
--  report "It's not possible to test BER feature if BER is set to unused"
--	severity ERROR;
--	result := FALSE;
--end if;
if (test_for="node_sync" AND node_sync="unused") then
	ASSERT FALSE
  report "It's not possible to test node synchronization feature setting node_sync to unused"
	severity ERROR;
	result := FALSE;
end if;
if (node_sync="used" AND BER="unused") then
	ASSERT FALSE  
  report "It's not possible to have node synchronization feature without using then BER block"
	severity ERROR;
	result := FALSE;
end if;
return result;

end Check_generics;

function make_blank_hex (width, widthadd : NATURAL) return STRING is

		Constant FILE_NAME: STRING := "blank_"&To_String(INTEGER'(width))&"_"&To_String(INTEGER'(widthadd))&".hex";
		Constant colon : STRING := ":";
		constant zero_two : STRING := "02";
		constant zero_one : STRING := "01";
		Constant zero_zero : STRING := "00";
		Constant Hex_header : STRING := ":020000020000FC";
		Constant End_of_file_record : STRING := ":00000001FF";

		FILE F: TEXT open WRITE_MODE is FILE_NAME;

		Variable L: Line;
		Variable m_offset, l_offset: NATURAL := 0;
		Variable l_offset_str, m_offset_str, chksum_str, rlen_str : STRING(1 to 2) := "00";
		variable check_sum_nat: NATURAL := 0;

	begin

		WRITE(L, Hex_header, left);
		WRITELINE(F, L);		
		for offset in 0 to 2**widthadd-1 loop
			WRITE(L, colon, left);
			check_sum_nat := Ceil_DIV(width, 8);
			rlen_str := evec2Hex(value => natural_2_sv(arg => check_sum_nat, size => 8), size => 2);
			WRITE(L, rlen_str, left);
--			if width<=16 and width>8 then
--				WRITE(L, zero_two, left);
--			else
--				WRITE(L, zero_one, left);
--			end if;
			m_offset := offset/256;
			m_offset_str := evec2Hex(value => natural_2_sv(arg => m_offset, size => 8), size => 2);
			l_offset := offset mod 256;
			l_offset_str := evec2Hex(value => natural_2_sv(arg => l_offset, size => 8), size => 2);
			WRITE(L, m_offset_str, left);
			WRITE(L, l_offset_str, left);
			WRITE(L, zero_zero, left);  -- separator
			for I in 1 to check_sum_nat loop
				WRITE(L, zero_zero, left);
			end loop;
--			if width<=16 and width>8 then
--			  WRITE(L, zero_zero, left);  -- if m> 8 LSB data
--				check_sum_nat := 2;
--			else
--			  check_sum_nat := 1;
--			end if;
			check_sum_nat := check_sum_nat+m_offset+l_offset;
			-- calculate checksum
			check_sum_nat := check_sum_nat mod 256;
			check_sum_nat := 255 - check_sum_nat + 1;
			check_sum_nat := check_sum_nat mod 256;
			chksum_str := evec2Hex(value => natural_2_sv(arg => check_sum_nat, size => 8), size => 2);
			-- drop checksum
			WRITE(L, chksum_str, left);
			WRITELINE(F, L);
		end loop;
		WRITE(L, End_of_file_record, left);
		WRITELINE(F, L);

		return FILE_NAME;


end make_blank_hex;


function natural_2_sv (ARG, SIZE: NATURAL) return Std_Logic_vector is
    variable RESULT: Std_Logic_vector(SIZE-1 downto 0);
    variable I_VAL: NATURAL := ARG;
  begin
    --if (SIZE < 1) then return NASV;
    --end if;
    for I in 0 to RESULT'LEFT loop
      if (I_VAL mod 2) = 0 then
        RESULT(I) := '0';
      else RESULT(I) := '1';
      end if;
      I_VAL := I_VAL/2;
    end loop;
    if not(I_VAL =0) then
      assert NO_WARNING
          report "RS_functions.Natural_2_sv: vector truncated"
          severity WARNING;
    end if;
    return RESULT;
end natural_2_sv;


function To_String (Value: Integer) return String is
  variable V: Integer;
  variable Result: String(1 to 11);
  variable Width: Natural := 0;
begin
  V := abs Value;
  for I in Result'Reverse_range loop
    case V mod 10 is
    when 0 => Result(I) := '0';
    when 1 => Result(I) := '1';
    when 2 => Result(I) := '2';
    when 3 => Result(I) := '3';
    when 4 => Result(I) := '4';
    when 5 => Result(I) := '5';
    when 6 => Result(I) := '6';
    when 7 => Result(I) := '7';
    when 8 => Result(I) := '8';
    when 9 => Result(I) := '9';
    when others =>
              Result(I) := '?';
    end case;
    if V > 0 then
       Width := Width + 1;
    end if;
    V := V / 10;
  end loop;
  if Width = 0 then
    Width := 1;
  end if;
  if Value < 0 then
    Result(Result'Length - Width) := '-';
    Width := Width + 1;
  end if;
  return Result(Result'Length - Width + 1 to Result'Length);
end To_String;

function To_Character (Value: Std_logic) return Character is
begin
  case Value is
  when 'U' => return 'U';
  when 'X' => return 'X';
  when '0' => return '0';
  when '1' => return '1';
  when 'W' => return 'W';
  when 'L' => return 'L';
  when 'H' => return 'H';
  when 'Z' => return 'Z';
  when '-' => return '-';
  end case;    
end To_Character;


function To_String (Value: Std_logic_vector) return String is
  constant V: Std_logic_vector(1 to Value'Length) := Value;
  variable Result: String(1 to Value'Length);
begin
  for I in Result'Range loop
    Result(I) := To_character(V(I));
  end loop;
  return Result;
end To_String;


function evec2Hex(value: std_logic_vector; size: natural) return string is
--	Subtype Quartet is Std_logic_vector(3+value'LOW downto value'LOW);
	Subtype Quartet is Std_logic_vector(3 downto 0);
	variable result : string(size downto 1);

begin
	for I in 1 to size loop

      case Quartet'(value((4*(I-1))+(3+value'LOW) downto 4*(I-1)+value'LOW )) is
      when "0000" => Result(I) := '0';
      when "0001" => Result(I) := '1';
      when "0010" => Result(I) := '2';
      when "0011" => Result(I) := '3';
      when "0100" => Result(I) := '4';
      when "0101" => Result(I) := '5';
      when "0110" => Result(I) := '6';
      when "0111" => Result(I) := '7';
      when "1000" => Result(I) := '8';
      when "1001" => Result(I) := '9';
      when "1010" => Result(I) := 'A';
      when "1011" => Result(I) := 'B';
      when "1100" => Result(I) := 'C';
      when "1101" => Result(I) := 'D';
      when "1110" => Result(I) := 'E';
      when "1111" => Result(I) := 'F';
      when others =>
          Result(I) := '?';
					assert FALSE
						report "value in evec2Hex function cannot be translated to Hex"
						severity WARNING;
      end case;			

	end loop;
	return result;			 
end evec2Hex;

function Hex2slv (Value: String; size: natural) return Std_logic_vector is
	variable result: Std_logic_vector(size downto 1);
begin
	For I in 1 to size/4 loop
	case Value(I) is
	when '0' => result(4*I downto 4*(I-1)+1):="0000";
	when '1' => result(4*I downto 4*(I-1)+1):="0001";
	when '2' => result(4*I downto 4*(I-1)+1):="0010";
	when '3' => result(4*I downto 4*(I-1)+1):="0011";
	when '4' => result(4*I downto 4*(I-1)+1):="0100";
	when '5' => result(4*I downto 4*(I-1)+1):="0101";
	when '6' => result(4*I downto 4*(I-1)+1):="0110";
	when '7' => result(4*I downto 4*(I-1)+1):="0111";
	when '8' => result(4*I downto 4*(I-1)+1):="1000";
	when '9' => result(4*I downto 4*(I-1)+1):="1001";
	when 'A'|'a' => result(4*I downto 4*(I-1)+1):="1010";
	when 'B'|'b' => result(4*I downto 4*(I-1)+1):="1011";
	when 'C'|'c' => result(4*I downto 4*(I-1)+1):="1100";
	when 'D'|'d' => result(4*I downto 4*(I-1)+1):="1101";
	when 'E'|'e'=> result(4*I downto 4*(I-1)+1):="1110";
	when 'F'|'f' => result(4*I downto 4*(I-1)+1):="1111";
	when others => result(4*I downto 4*(I-1)+1):="XXXX";
	end case;
	end loop;
	return result;
end Hex2slv;

function int_to_str( value : integer ) return string is
variable ivalue,index : integer;
variable digit : integer;
variable line_no: string(8 downto 1) := "        ";  
begin
	ivalue := value;
	index := 1;
	while (ivalue > 0) loop
		digit := ivalue MOD 10;
		ivalue := ivalue/10;
		case digit is
			when 0 =>
				line_no(index) := '0';
			when 1 =>
				line_no(index) := '1';
			when 2 =>
				line_no(index) := '2';
			when 3 =>
				line_no(index) := '3';
			when 4 =>
				line_no(index) := '4';
			when 5 =>
				line_no(index) := '5';
			when 6 =>
				line_no(index) := '6';
			when 7 =>
				line_no(index) := '7';
			when 8 =>
				line_no(index) := '8';
			when 9 =>
				line_no(index) := '9';
			when others =>
				ASSERT FALSE
				REPORT "Illegal number!"
				SEVERITY ERROR;
		end case;
		index := index + 1;
	end loop;
	return line_no;
end int_to_str;


function hex_str_to_int( str : string ) return integer is
variable len : integer := str'length;
variable ivalue : integer := 0;
variable digit : integer;
begin
	for i in len downto 1 loop
		case str(i) is
			when '0' =>
				digit := 0;
			when '1' =>
				digit := 1;
			when '2' =>
				digit := 2;
			when '3' =>
				digit := 3;
			when '4' =>
				digit := 4;
			when '5' =>
				digit := 5;
			when '6' =>
				digit := 6;
			when '7' =>
				digit := 7;
			when '8' =>
				digit := 8;
			when '9' =>
				digit := 9;
			when 'A' =>
				digit := 10;
			when 'a' =>
				digit := 10;
			when 'B' =>
				digit := 11;
			when 'b' =>
				digit := 11;
			when 'C' =>
				digit := 12;
			when 'c' =>
				digit := 12;
			when 'D' =>
				digit := 13;
			when 'd' =>
				digit := 13;
			when 'E' =>
				digit := 14;
			when 'e' =>
				digit := 14;
			when 'F' =>
				digit := 15;
			when 'f' =>
				digit := 15;
			when others =>
				ASSERT FALSE
				REPORT "Illegal character "&  str(i) & "in Intel Hex File! "
				SEVERITY ERROR;
		end case;
		ivalue := ivalue * 16 + digit;
	end loop;
	return ivalue;
end hex_str_to_int;


procedure Shrink_line(L : inout LINE; pos : in integer) is
	subtype nstring is string(1 to pos);
	variable stmp : nstring;
begin
	if pos >= 1 then
		read(l, stmp);
	end if;
end Shrink_line;


end vi_bench;
