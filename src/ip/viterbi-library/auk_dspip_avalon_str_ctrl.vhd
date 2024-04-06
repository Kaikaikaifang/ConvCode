-------------------------------------------------------------------------
-------------------------------------------------------------------------
-- Description	:  Avalon Streaming (Source) controller
--                 This is for Ready Latency=1 at the moment
--                 Only for 1 channel support? 
--                 Although same desing ought to server for multichannel?
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


Entity auk_dspip_avalon_str_ctrl is
	Generic (
				ready_latency : natural := 1
	);
		Port (
			clk  						: in std_logic;
			reset						: in std_logic;
			----------------- DESIGN SIDE SOURCE SIGNALS
			data_available	: in std_logic;
			sop_source_int	: in std_logic;
			eop_source_int	: in std_logic;
			enable_source 	: out std_logic;
			----------------- AVALON_STREAMING SOURCE SIDE SIGNALS 
			source_ready		: in std_logic;
			source_val			: out std_logic;
			source_sop			: out std_logic;
			source_eop			: out std_logic
	);
end entity auk_dspip_avalon_str_ctrl;



Architecture rtl of auk_dspip_avalon_str_ctrl is

Type atl_buffer_fsm is (S0, out_idle, out_active, out_hold);

signal atl_buffer_state, atl_buffer_next_state : atl_buffer_fsm;

--signal eop_source_pipe 	: std_logic_vector(2 downto 0);
--signal sop_source_pipe 	: Std_Logic_Vector(2 downto 0);
Signal data_val_pipe 		: Std_Logic;
signal data_val_shunt   : std_logic;
Signal sop_source_shunt : std_logic;
signal eop_source_shunt : std_logic; 
Signal val_source_q  		: std_logic;
Signal enable_source_int : std_logic;
signal allow_val_assert : std_logic;

begin

clk_FSM_atl: Process (clk, reset)
	begin
		if reset='1' then
			atl_buffer_state <= S0;
		elsif Rising_edge(clk) then
			atl_buffer_state <= atl_buffer_next_state;
		end if;
end process clk_FSM_atl;


FSM_definition : process(atl_buffer_state, data_available, source_ready)

	variable atl_buffer_next_state_var : atl_buffer_fsm;

begin

  atl_buffer_next_state_var := atl_buffer_state;
  case atl_buffer_state is
	
	when S0 =>
		allow_val_assert <= '0';
		enable_source_int <= '0';
		atl_buffer_next_state_var := out_idle;
	when out_idle =>
		allow_val_assert <= data_available;
		enable_source_int <= '1';
		if data_available='1' and source_ready='1' then
			atl_buffer_next_state_var := out_active;
		elsif data_available='1' and source_ready='0' then
			atl_buffer_next_state_var := out_hold;
		end if;
	when out_hold =>
	-- FSM outputs
		allow_val_assert <= '1';
		enable_source_int <= '0';
	-- next state FSM
		if data_available='1' and source_ready='1' then 
			atl_buffer_next_state_var := out_active;
		elsif data_available='0' and source_ready='1' then 
			atl_buffer_next_state_var := out_idle;
		end if;
	when out_active =>
		allow_val_assert <= data_available;
		enable_source_int <= '1';
		if source_ready='0' then 
      atl_buffer_next_state_var := out_hold;
		elsif data_available='0' then
      atl_buffer_next_state_var := out_idle;
    end if;
	
	-- coverage off
	when others => 
		allow_val_assert <= '0';
		enable_source_int <= '0';
		atl_buffer_next_state_var := out_idle;
	-- coverage on
	end case;
	atl_buffer_next_state <= atl_buffer_next_state_var;
	
end process FSM_definition;


--  Data paths for val, sop and eop signals
avalon_streaming_datapaths : Process(clk, reset)

	variable sop_source_d, eop_source_d : Std_Logic;
	variable data_val_d : Std_Logic;
  
begin
if reset = '1' then
	data_val_shunt <= '0';
	val_source_q <= '0';
	sop_source_shunt <= '0';
  eop_source_shunt <= '0';
	data_val_pipe <= '0';
	--eop_source_pipe <= (others => '0');
	--sop_source_pipe <= (others => '0');
	source_eop <= '0';
	source_sop <= '0';
elsif Rising_edge(clk) then

  if enable_source_int='1' then
		data_val_d := data_available; 
		--eop_source_d := eop_source_pipe(1);
		--sop_source_d := sop_source_pipe(1);
		eop_source_d := eop_source_int;
		sop_source_d := sop_source_int;
	else
		data_val_d := data_val_shunt;
		eop_source_d := eop_source_shunt;
		sop_source_d := sop_source_shunt;
	end if;
  if enable_source_int='1' then
		--eop_source_pipe(0) <= eop_source_int;
		-- Alex 22-01 -2007  I thikn this "allow_next_sop" has to be moved
		--  yes, it can remain the trb because  sop_source_gen <= (dav_top_eng or dav_bot_eng) and allow_next_sop;
		--sop_source_pipe(0) <= sop_source_int; --(dav_top_eng or dav_bot_eng) and allow_next_sop;
		data_val_shunt <= data_available; 
		--eop_source_pipe(1) <= eop_source_pipe(0);
		--sop_source_pipe(1) <= sop_source_pipe(0);

		eop_source_shunt <= eop_source_int; --eop_source_pipe(1);
		sop_source_shunt <= sop_source_int; --sop_source_pipe(1);
  end if;
	if source_ready='1' then
		data_val_pipe      <= data_val_d;
		--eop_source_pipe(2) <= eop_source_d;
		--sop_source_pipe(2) <= sop_source_d;
		source_eop <= eop_source_d;
		source_sop <= sop_source_d;
	end if;

  val_source_q <= source_ready and allow_val_assert;

	-- if enable_source_int='1' then
		-- if eop_source_int='1' then 
			-- allow_next_sop <= '1';
		-- elsif sop_source_int='1' then
			-- allow_next_sop <= '0';
		-- end if;
	-- end if;
		
end if;
end process avalon_streaming_datapaths;


-- Outputs
source_val <= val_source_q and data_val_pipe;
--source_sop <= eop_source_pipe(2);
--source_eop <= sop_source_pipe(2);
enable_source <= enable_source_int;


end architecture rtl;

