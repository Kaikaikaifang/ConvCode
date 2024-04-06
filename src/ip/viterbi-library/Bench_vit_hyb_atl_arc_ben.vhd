-------------------------------------------------------------------------
-- Description	:  Architecture declaration for Viterbi Hybrid Decoder Bench  
--
-- Copyright 2008 (c) Altera Corporation
-- All rights reserved
--
-------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.math_real.all;
library work;
use work.vi_interface.all;
use work.vi_functions.all;
use work.vi_bench.all;
use Std.TextIO.all;


Architecture Bench of bench_vit_hyb_atl is

	Constant dummy   : BOOLEAN := Check_generics(test_for, node_sync, BER);
	Constant L_max   : NATURAL := constraint_length_m_1+1;
	Constant ncodes  : NATURAL := Get_ncodes(n);
	Constant n_list  : NATURAL_ARRAY(1 to ncodes) := Get_n_list(n => n, ncodes => ncodes);
	Constant L_list  : NATURAL_ARRAY(1 to ncodes) := Get_n_list(n => L, ncodes => ncodes);
	Constant m_list  : NATURAL_ARRAY(1 to ncodes) := Get_modes_list(modes => dec_modes, ncodes => ncodes);
	
	Constant clockPeriod : TIME := String_2_Time(n => clock_period);
	Constant clockOffset : TIME := String_2_Time(n => clock_offset);
	Constant time_lapse_max : TIME := 1 ms;

	COMPONENT auk_vit_var_enc
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
	END COMPONENT;
	
	
	Subtype data_vector is Std_Logic_Vector(rr_size downto 1);
	Subtype eras_vector is Std_Logic_Vector(n_max downto 1);
	type data_vector_2D is array(NATURAL RANGE <>) of data_vector;
	type eras_vector_2D is array(NATURAL RANGE <>) of eras_vector;

	--Type atl_buffer_fsm is (out_idle, out_dav, out_active, out_hold, out_hold_last, out_last_ena,
	--												out_dav_s, out_dav_m, dav_toggling);
	-- introducing a simpler version of Atlantic source controller.
	-- dav is now obsoleted as it is superfluous
	Type atl_buffer_fsm is (S0, out_idle, out_active, out_hold);
												
	signal atl_buffer_state, atl_buffer_next_state : atl_buffer_fsm;

	Signal time_lapse : TIME;
	
	Signal ben_2_dec_data_pipe : data_vector_2D(3 downto 1);
	Signal ben_2_dec_eras_pipe : eras_vector_2D(3 downto 1);
	Signal sop_source_pipe, eop_source_pipe : Std_Logic_Vector(3 downto 1);
	
	Signal bench_2_decoder_s, bench_2_decoder_shunt : Std_Logic_Vector(rr_size downto 1);
	Signal eras_sym_s, eras_sym_shunt  : Std_Logic_Vector(n_max downto 1);
	Signal lfsr_conv_enc : Std_Logic_Vector(L_max downto 1);
	Signal sop_source_gen, eop_source_gen : Std_Logic;
	Signal sop_source_shunt, eop_source_shunt : Std_Logic;
	Signal allow_val_assert, allow_ena_assert : Std_Logic;
	Signal keep_clk_running, data_available : BOOLEAN := TRUE;
	Signal clk_int, reset_int  : Std_Logic;
	Signal decbit_dec_q : Std_Logic;
	Signal sink_val_q, sink_sop_q, sink_eop_q : Std_Logic;
	Signal sel_code_sig : NATURAL;
	Signal enc_bits_rx : Vector_2D(ncodes downto 1);
	Signal m_sel_fifo, c_sel_fifo  : NATURAL_ARRAY(1 to 8);
	Signal m_sel_wr_cursor, m_sel_rd_cursor : NATURAL := 1;
	Signal sink_eop_counter, source_eop_counter : NATURAL := 0;
	Signal source_ena, data_val_pipe, data_val_shunt, val_source_q : std_logic;
	Signal dav_source_int_gen, dav_source_int, ena_data_sourcing : Std_Logic;
	--signal out_fsm_buf : Std_Logic_Vector(3 downto 1);


begin

	clk <= clk_int;
	reset <= reset_int;
	
	Osc: process
	begin
	
		while keep_clk_running loop
			clk_int <= '1';
			wait for clockPeriod/2;  -- half de clock period
			clk_int <= '0';
			wait for clockPeriod/2;
		end loop; 	
	wait;

	end process Osc;


	stim_atlantic: process
	
		FILE F: TEXT open READ_MODE is INPUT_FILE;
		FILE FBLK: TEXT open READ_MODE is BLOCKS_FILE;
		variable L, L_selcode, L_bm_init_state, L_tb_length, L_tr_init_state : Line;
		variable L_tb_type, L_size_of_block : Line;
		variable seed1, seed2: positive := 1;
		variable x: real;
		Constant times_four : NATURAL := Ceil_DIV(softbits, 4);
		--	Constant n_hex : NATURAL := n_sel*times_four;
		Variable n_hex, n_sel, number_of_blocks : NATURAL;
		--	variable tmp : STRING(n_hex downto 1);
		variable tmp : STRING(14 downto 1);
		variable car : CHARACTER;
		variable good_read : BOOLEAN;
		variable cursor, cnt_outvalids : NATURAL;
		variable bench_2_decoder_var : Std_Logic_Vector(n_max*4*times_four downto 1);
		variable eras_sym_var : Std_Logic_Vector(n_max downto 1);
		variable bit_in_block, block_size, sel_code_var : natural;
		variable bm_init_state_var, tb_length_var : natural;
		variable tr_init_state_var, tb_type_var, m_sel_var : natural;
		variable last_symbol : boolean;

	begin
	
		-- because of verilog that an extra line is added at the beginning: number_of_blocks
		-- later on if there is time I will introduce mods to this bench to use that
		-- variable to remove the while loops
		READLINE(FBLK, L_selcode);
		READ(L_selcode, number_of_blocks, good_read);
		READLINE(FBLK, L_selcode);
		READLINE(FBLK, L_bm_init_state);
		READLINE(FBLK, L_tb_length);
		READLINE(FBLK, L_tr_init_state);
		READLINE(FBLK, L_tb_type);
		READLINE(FBLK, L_size_of_block);
		
		-- this signals change on block periodicity.
		-- they are to be loaded from file block_period_stim.txt
		data_available <= TRUE;
		m_sel_wr_cursor <= 1;
		READ(L_selcode, sel_code_var, good_read);
		sel_code_sig <= sel_code_var+1;
		n_sel := n_list(sel_code_var+1);
		m_sel_var := m_list(sel_code_var+1); -- signal for memory and inter-process communication
		m_sel_fifo(m_sel_wr_cursor) <= m_list(sel_code_var+1);
		c_sel_fifo(m_sel_wr_cursor) <= sel_code_var+1;
		
		m_sel_wr_cursor <= m_sel_wr_cursor+1;	

		if m_list(sel_code_var+1)=0 then
			n_hex := n_sel*times_four;
		else
			n_sel := 4;
			n_hex := 4*times_four; -- n_sel = 4 for TCM
		end if;
		tb_type <= '0';
		tr_init_state <= (others => '0');
		state_node_sync <= (others => '0');
		sel_code <= CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => sel_code_var, SIZE => sel_code_size), SIZE => sel_code_size); 
		READ(L_bm_init_state, bm_init_state_var, good_read);
		bm_init_state <= CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => bm_init_state_var, SIZE => constraint_length_m_1), SIZE => constraint_length_m_1);
		bm_init_value <= CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => 2**(bmgwide-2), SIZE => bmgwide), SIZE => bmgwide);
		READ(L_tb_length, tb_length_var, good_read);
		tb_length <= CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => tb_length_var, SIZE => vlog_wide), SIZE => vlog_wide);
		
		last_symbol := FALSE;
		reset_int <= '1';
		ber_clear <= '1';
		dav_source_int_gen <= '0';
		bench_2_decoder_s <= (others => '0');
		eras_sym_s <= (others => '0');

		sop_source_gen <= '0';
		eop_source_gen <= '0';
		bit_in_block := 1;
		wait for clockPeriod;
		reset_int <= '0' after clockOffset;

		if ena_data_sourcing='0' then
			wait until ena_data_sourcing='1';
			wait for clockPeriod;
		end if;
		dav_source_int_gen <= '1';
		ber_clear <= '0' after clockOffset;
		
		main: while (not ENDFILE(F)) and keep_clk_running loop
			--wait for clockPeriod;
			cursor := 0;
			READLINE(F, L);
			tmp := (others => '0');
			if	bit_in_block=1 then
				READ(L_size_of_block, block_size, good_read);
				if not good_read then
					-- last symbol being read
					ASSERT FALSE
					REPORT "Not good reading of block size" severity Note;
					exit;
				end if;
			end if;
			nested_1: while (cursor < 20) and keep_clk_running loop
				
				if ena_data_sourcing='1' then
					eras_sym_var := (others => '0');
					nested_2: for J in 1 to n_hex+1 loop
						READ(L, car, good_read);
						if car /=' ' and good_read then
							tmp(n_hex+1-J) := car;
							if car='X' then
								eras_sym_var((n_hex-J)/times_four + 1) := '1';
							end if;
						elsif J /= n_hex+1 then
							tmp(n_hex+1-J) := '0';
						elsif not good_read then
							exit nested_2;
						end if;
					end loop nested_2;
					-- transformation Slv to hex by groups of size times_four
					bench_2_decoder_var(n_sel*4*times_four downto 1):= Hex2slv (Value => tmp(n_hex downto 1), size => n_sel*4*times_four);
					if test_for="dav_sink1" or test_for="both_sides1" then
						if ena_data_sourcing='1' then
							dav_source_int_gen <= '0';
							wait for 2*clockPeriod;
						elsif ena_data_sourcing='0' then
							wait until ena_data_sourcing='1';
						end if;
						dav_source_int_gen <= '1';
					elsif (test_for="dav_sink2" or test_for="both_sides2") then
						uniform (seed1, seed2, x);
						x := x - 0.3;
						if (x < 0.0) then
							uniform (seed1, seed2, x);
							-- dav_source_int_gen shouldn't change when ena_data_sourcing is de-asserted.
							if 5.0 * x >= 1.0 and ena_data_sourcing='1' then
								dav_source_int_gen <= '0';
								wait for natural(5.0 * x)*clockPeriod;
							elsif ena_data_sourcing='0' then
								wait until ena_data_sourcing='1';
							end if;
							dav_source_int_gen <= '1';
						end if;
					end if;
					if ena_data_sourcing='0' then
						wait until ena_data_sourcing='1';
					end if;
					for I in 1 to n_sel loop
						bench_2_decoder_s(I*softbits downto (I-1)*softbits+1) <=
						bench_2_decoder_var(softbits+(I-1)*4*times_four downto (I-1)*4*times_four+1) after clockOffset;
					end loop;
					eras_sym_s <= eras_sym_var after clockOffset; 
					bench_2_decoder_var := (others => '0');
					if (n_sel<n_max) and m_sel_var=0 then
						bench_2_decoder_s(n_max*softbits downto n_sel*softbits+1) <= (others => '0') after clockOffset;
					end if;

					if bit_in_block = 1 then
						sop_source_gen <= '1' after clockOffset;
						eop_source_gen <= '0' after clockOffset;
						wait for clockPeriod;
					elsif bit_in_block = block_size then
						sop_source_gen <= '0' after clockOffset;
						eop_source_gen <= '1' after clockOffset;
						READ(L_tr_init_state, tr_init_state_var, good_read);
						tr_init_state <= CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => tr_init_state_var, SIZE => constraint_length_m_1), SIZE => constraint_length_m_1) after clockOffset;
						READ(L_tb_type, tb_type_var, good_read);
						if tb_type_var=0 then
							tb_type <= '0' after clockOffset;
						else
							tb_type <= '1' after clockOffset;
						end if;
						wait for clockPeriod;
						if test_for="dav_sink3" or test_for="both_sides3" then
							-- still I have to enforce the rule that dav_source_int cannot change if ena_data_sourcing 
							-- is de-asserted.
							if ena_data_sourcing='0' then
								wait until ena_data_sourcing='1';
								wait for clockPeriod;
								dav_source_int_gen <= '0';
							else
								dav_source_int_gen <= '0';
							end if;
							wait for 8*source_eop_counter*clockPeriod;
							if ena_data_sourcing='0' then
								wait until ena_data_sourcing='1';
								wait for clockPeriod;
								dav_source_int_gen <= '1';
							else
								dav_source_int_gen <= '1';
							end if;
						end if;
						-- this signals change on block period.
						-- they are to be loaded from file block_period_stim.txt
						READ(L_selcode, sel_code_var, good_read);
						sel_code_sig <= sel_code_var+1;
						n_sel := n_list(sel_code_var+1);
						m_sel_var := m_list(sel_code_var+1); 
						m_sel_fifo(m_sel_wr_cursor) <= m_list(sel_code_var+1);
						c_sel_fifo(m_sel_wr_cursor) <= sel_code_var+1;
						source_eop_counter <= source_eop_counter + 1;
						if m_sel_wr_cursor=8 then
							m_sel_wr_cursor <= 1;
						else
							m_sel_wr_cursor <= m_sel_wr_cursor+1;
						end if;
						if m_list(sel_code_var+1)=0 then
							n_hex := n_sel*times_four;
						else
							n_sel := 4;
							n_hex := 4*times_four; -- n_sel = 4 for TCM
						end if;
						sel_code <= CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => sel_code_var, SIZE => sel_code_size), SIZE => sel_code_size) after clockOffset;
						READ(L_bm_init_state, bm_init_state_var, good_read);
						READ(L_tb_length, tb_length_var, good_read);
						tb_length <= CONV_STD_LOGIC_VECTOR(ARG => CONV_UNSIGNED(ARG => tb_length_var, SIZE => vlog_wide), SIZE => vlog_wide) after clockOffset;
					else
						if ena_data_sourcing='1' then
							sop_source_gen <= '0' after clockOffset;
							eop_source_gen <= '0' after clockOffset;
						end if;
						wait for clockPeriod;
					end if; 
					cursor := cursor + 1;
					if bit_in_block = block_size then
						bit_in_block := 1;
						cursor := 20;  -- that will provoke exit of nested_1 while loop
					else
						bit_in_block := bit_in_block + 1;
					end if;
			
					exit when good_read=FALSE;
				else
					wait for clockPeriod;
				end if; -- ena sourcing
	
			end loop nested_1;

		end loop main;

		-- In this new version of the bench, the file is going to be read and then when finish reading
		-- the running time is going to extend to allow all the decoding bits to come out.
		
		-- if I add after clockOffset then I get an extra spurious cycle of dav, ena and val.
		if ena_data_sourcing='0' then
			wait until ena_data_sourcing='1';
			wait for clockPeriod;
		end if;
		dav_source_int_gen <= '0'; -- after clockOffset;
		
		-- if I don't add clockoffset, the last eop pulse gets lost
		sop_source_gen <= '0' after clockOffset;
		eop_source_gen <= '0' after clockOffset;
		if keep_clk_running then
			if sink_eop_counter < source_eop_counter then
				wait until sink_eop_q='1';
			end if;
			wait for 2*clockPeriod;
		end if;

		-- need to wait until the eop_source comes out to gather all the data!!
		data_available <= FALSE;
		FILE_CLOSE(F);
		FILE_CLOSE(FBLK);
		wait;

	end process stim_atlantic;


	end_block_stim: Process 
	
	begin

		m_sel_rd_cursor <= 1;
		
		while keep_clk_running loop
			
			wait until Rising_edge(sink_eop_q);
			wait for clockPeriod;
			wait for clockPeriod/2;
			
			if m_sel_rd_cursor=8 then
				m_sel_rd_cursor <= 1;
			else
				m_sel_rd_cursor <= m_sel_rd_cursor+1;
			end if;
			sink_eop_counter <= sink_eop_counter + 1;
			
			wait for clockPeriod;
		end loop; 	
		wait;
	end process end_block_stim;

	-- This is to avoid hang ups in regtest
	monitor_toggling_activity: Process(clk_int, reset_int, --sink_dav_master_q, 
																	 sink_val_q, sink_sop_q, sink_eop_q, decbit_dec_q)
	begin
		if reset_int='1' then
			time_lapse <= 0 ns;
		elsif sink_val_q'event or sink_sop_q'event or sink_eop_q'event or decbit_dec_q'event then
			time_lapse <= 0 ns;
		elsif rising_edge(clk_int) then
			time_lapse <= time_lapse + clockPeriod;
		end if;
	end process monitor_toggling_activity;



	clk_running_ctrl: Process(reset_int, source_eop_counter, 
												sink_eop_counter, data_available, time_lapse)
	begin
		if reset_int='1' then
			keep_clk_running <= TRUE;
		elsif (source_eop_counter = sink_eop_counter) and not data_available then
			keep_clk_running <= FALSE after 3*clockPeriod;
		elsif (time_lapse > time_lapse_max) then
			ASSERT FALSE
			REPORT "Reached time_lapse_max without activity, probable hang up" severity Error;
			keep_clk_running <= FALSE;
		end if;
	end process clk_running_ctrl;

	-- START ATLANTIC SOURCE CONTROL LOGIC

	clk_FSM_atl: Process (clk_int, reset_int)
	begin
		if reset_int='1' then
			atl_buffer_state <= S0; --out_idle;
		elsif Rising_edge(clk_int) then
			atl_buffer_state <= atl_buffer_next_state;
		end if;
	end process clk_FSM_atl;

	-- still I have to enforce the rule that dav_source_int cannot change if ena_data_sourcing 
	-- is de-asserted.
	dav_source_int <= dav_source_int_gen; -- and ena_data_sourcing;
	source_ena <= source_ena_slave;
	
	FSM_out : process(atl_buffer_state, dav_source_int, source_ena)
	
		variable atl_buffer_next_state_var : atl_buffer_fsm;
		
	begin
	
		atl_buffer_next_state_var := atl_buffer_state;
		case atl_buffer_state is
		
			when S0 =>
				atl_buffer_next_state_var := out_idle;
			when out_idle =>
				if dav_source_int='1' and source_ena='1' then
					atl_buffer_next_state_var := out_active;
				elsif dav_source_int='1' and source_ena='0' then
					atl_buffer_next_state_var := out_hold;
				end if;
			when out_hold =>
				if dav_source_int='1' and source_ena='1' then 
					atl_buffer_next_state_var := out_active;
				elsif dav_source_int='0' and source_ena='1' then 
					atl_buffer_next_state_var := out_idle;
				end if;
			when out_active =>
				if source_ena='0' then 
					atl_buffer_next_state_var := out_hold;
				elsif dav_source_int='0' then
					atl_buffer_next_state_var := out_idle;
				end if;
			
			-- coverage off
			when others => atl_buffer_next_state_var := out_idle;
			-- coverage on
		end case;
		atl_buffer_next_state <= atl_buffer_next_state_var;
	
	end process FSM_out;

	--  impending conflict here with allow_val_assert
	--allow_val_assert <= out_fsm_buf(1);
	--ena_data_sourcing <= out_fsm_buf(2);
	--source_dav_slave <= '1'; --out_fsm_buf(3) after clockOffset;
	
	
	outputs_FSM_atl: process(atl_buffer_state, dav_source_int) 
	
	begin
		case atl_buffer_state is
			when S0 =>
				allow_val_assert <= '0';
				ena_data_sourcing <= '0';
			when out_idle =>
				allow_val_assert <= dav_source_int;
				ena_data_sourcing <= '1';
			when out_active =>
				allow_val_assert <= dav_source_int;
				ena_data_sourcing <= '1';
			when out_hold =>
				allow_val_assert <= '1';
				ena_data_sourcing <= '0';
			-- coverage off
			when others => 
				allow_val_assert <= '0';
				ena_data_sourcing <= '0';
			-- coverage on
		end case;
		
	end process outputs_FSM_atl;


	-- latching atlantic ports for slave source to be connected to master sink
	clk_atl_sink: Process (clk_int, reset_int)
	begin
		if reset_int='1' then
			val_source_q <= '0'; 
		elsif Rising_edge(clk_int) then
			val_source_q <= source_ena_slave and allow_val_assert;
		end if;
	end process clk_atl_sink;

	source_val <= val_source_q and data_val_pipe after clockOffset;

	clk_atl_data_sink: Process (clk_int, reset_int)
		
		variable bench_2_decoder_d : Std_Logic_Vector(rr_size downto 1);
		variable eras_sym_d  : Std_Logic_Vector(n_max downto 1);
		variable sop_source_d, eop_source_d, data_val_d : Std_Logic;
		
	begin
		if reset_int='1' then
			bench_2_decoder_shunt <= (others => '0');
			eras_sym_shunt	 <= (others => '0');
			ben_2_dec_data_pipe <= (others => (others => '0'));
			ben_2_dec_eras_pipe <= (others => (others => '0'));
			sop_source_pipe <= (others => '0');
			eop_source_pipe <= (others => '0');
			sop_source_shunt <= '0';
			eop_source_shunt <= '0';
			data_val_pipe <= '0';
			data_val_shunt <= '0';
		elsif Rising_edge(clk_int) then
			if ena_data_sourcing='1' then
				bench_2_decoder_d := bench_2_decoder_s; --ben_2_dec_data_pipe(2); 
				eras_sym_d := eras_sym_s; --ben_2_dec_eras_pipe(2);
				data_val_d := dav_source_int;
				sop_source_d := sop_source_gen; --sop_source_pipe(2);
				eop_source_d := eop_source_gen; --eop_source_pipe(2);
			else
				bench_2_decoder_d := bench_2_decoder_shunt; 
				eras_sym_d := eras_sym_shunt;
				data_val_d := data_val_shunt;
				sop_source_d := sop_source_shunt;
				eop_source_d := eop_source_shunt;
			end if;
			if ena_data_sourcing='1' then				
				bench_2_decoder_shunt <= bench_2_decoder_s; --ben_2_dec_data_pipe(2); 
				eras_sym_shunt <= eras_sym_s; --ben_2_dec_eras_pipe(2);
				data_val_shunt <= dav_source_int;				
				sop_source_shunt <= sop_source_gen; --sop_source_pipe(2);
				eop_source_shunt <= eop_source_gen; --eop_source_pipe(2);
			end if;
			if source_ena_slave='1' then
				ben_2_dec_data_pipe(3) <= bench_2_decoder_d; 
				ben_2_dec_eras_pipe(3) <= eras_sym_d;
				data_val_pipe <= data_val_d;
				sop_source_pipe(3) <= sop_source_d;
				eop_source_pipe(3) <= eop_source_d;
			end if;
		end if;
	end process clk_atl_data_sink;

	bench_2_decoder <= ben_2_dec_data_pipe(3) after clockOffset;
	eras_sym <= ben_2_dec_eras_pipe(3) after clockOffset;
	source_sop <= sop_source_pipe(3) after clockOffset;
	source_eop <= eop_source_pipe(3) after clockOffset;

	-- END ATLANTIC SOURCE CONTROL LOGIC

	clk_atl_data_source: Process (clk_int, reset_int)
	begin
		if reset_int='1' then
			decbit_dec_q <= '0';
		elsif Rising_edge(clk_int) then
			if sink_val='1' then
				decbit_dec_q <= decbit_dec;
			end if;
		end if;
	end process clk_atl_data_source;

	clk_atl_source: Process (clk_int, reset_int)
	begin
		if reset_int='1' then	
			sink_ena_master	 <= '0';
			sink_val_q <= '0';
			sink_sop_q <= '0';
			sink_eop_q <= '0';
		elsif Rising_edge(clk_int) then			
			sink_ena_master   <= allow_ena_assert after clockOffset;
			sink_val_q <= sink_val;
			sink_sop_q <= sink_sop;
			sink_eop_q <= sink_eop;
		end if;
	end process clk_atl_source;


	ena_source_process: process
		variable seed1, seed2: positive := 1;
		variable x: real;
	begin
		if test_for="ena_source2" or test_for="both_sides2" then
			allow_ena_assert <= '1';
			looping: while keep_clk_running loop
				if sink_val_q/='1' then
					wait until Rising_edge(sink_val_q);
				end if;
				uniform (seed1, seed2, x);
				if x < 0.2 then
					allow_ena_assert <= '0';
					wait for clockPeriod;
					allow_ena_assert <= '1';
					wait for clockPeriod;
					allow_ena_assert <= '0';--				
					wait for clockPeriod;
					allow_ena_assert <= '1';
					wait for clockPeriod;
					allow_ena_assert <= '0';
					wait for clockPeriod;
					allow_ena_assert <= '1';
				elsif (0.2 <= x) and (x < 0.5) then
					allow_ena_assert <= '0';
					wait for clockPeriod;
					allow_ena_assert <= '1';
					wait for clockPeriod;
					allow_ena_assert <= '0';
					wait for 2*clockPeriod;
					allow_ena_assert <= '1';
					wait for 3*clockPeriod;
					allow_ena_assert <= '0';
					wait for clockPeriod;
					allow_ena_assert <= '1';
				elsif (0.5 <= x) and  (x < 0.85) then
					allow_ena_assert <= '1';
				else
					-- long time without sinking capability
					allow_ena_assert <= '0';				
					wait for natural(10 * v)*clockPeriod;
					allow_ena_assert <= '1';
				end if;
			end loop looping;
		elsif test_for="ena_source1" or test_for="both_sides1" then
			allow_ena_assert <= '1';
			looping2: while keep_clk_running loop
				wait for clockPeriod;
				allow_ena_assert <= '0';
				wait for clockPeriod;
				allow_ena_assert <= '1';
			end loop looping2;
		elsif test_for="ena_source3" or test_for="both_sides3" then
			-- re-define to implement ever increasing gaps after eop
			allow_ena_assert <= '1';
			looping3: while keep_clk_running loop
				if sink_eop/='1' then
					wait until sink_eop='1';
				end if;
				allow_ena_assert <= '0';
				-- as it is hybrid I need bigger gaps!
				-- adding one more delay to prevent issue from limit iteration
				wait for clockPeriod;
				wait for 79*source_eop_counter*clockPeriod;
				allow_ena_assert <= '1';
			end loop looping3;
		else
			allow_ena_assert <= '1';
		end if;
		wait;
	end process ena_source_process;


	monitor_vit_mode: process
	
		FILE F: TEXT open WRITE_MODE is OUTPUT_FILE;
		FILE BER_rpt: TEXT open WRITE_MODE is "BER_rpt.txt";
		variable L : Line;
		Constant single_space : STRING := " ";
		Constant strA: String(1 to 39) := "The number of errors in port numerr is ";
		Constant strB: String(1 to 30) := "The Viterbi decoder is IN sync";
		Constant strC: String(1 to 34) := "The Viterbi decoder is OUT of sync";
		Constant strD: String(1 to 52) := "Error : Unexpected state of signals insync & outsync";
		Constant strF: String(1 to 47) := "Cannot read numerr port as ber is set to unused";
		variable index : NATURAL;
		variable single_bit : CHARACTER;
		
	begin

		index := 0;
		
		reading: while keep_clk_running loop
			if m_sel_fifo(m_sel_rd_cursor)=0 then
				if sink_val_q='1' then
					if decbit_dec_q='1' then
						single_bit:='1';
					elsif decbit_dec_q='0' then
						single_bit:='0';
					elsif decbit_dec_q='X' then
						single_bit:='X';
					else
						ASSERT FALSE
						REPORT "Decoded bit in Viterbi is different than 1, 0 and X" severity Warning;
					end if;
					WRITE(L, single_bit);
					WRITE(L, single_space);
					index := index+1;
					if index=20 or sink_eop_q='1' then
						WRITELINE(F, L);
						index:=0;
						if (ber="used" or ber="USED") and sink_eop_q='1' then
							WRITE(L, strA);
							WRITE(L, conv_integer(arg => unsigned(numerr)) );
							WRITELINE(BER_rpt, L);
						end if;
					end if;
				end if;
			end if;
			wait until rising_edge(clk_int) or not keep_clk_running;
		end loop reading;

		if m_sel_fifo(m_sel_rd_cursor)=0 then
			WRITELINE(F, L);
		end if;

		if test_for="BER" then
			if ber/="used" and ber/="USED" then
				WRITE(L, strF);
				WRITELINE(BER_rpt, L);
			end if;
		end if;
		
		FILE_CLOSE(F);
		FILE_CLOSE(BER_rpt);
		wait;

	end process monitor_vit_mode;


	------------------
	-- Trellis mode logic
	------------------
	
	lfsr_clk: Process (clk_int, reset_int)
		begin
			if reset_int='1' then
				lfsr_conv_enc <= (others => '0');
			elsif Rising_edge(clk_int) then
				if sink_val='1' then
					lfsr_conv_enc(L_max) <= decbit_dec;
					if sink_sop='0' then
						lfsr_conv_enc(L_max-1 downto 1 ) <= lfsr_conv_enc(L_max downto 2);
					else
						lfsr_conv_enc(L_max-1 downto 1 ) <= (others => '0');
					end if;
				end if;
			end if;		
	end process lfsr_clk;


	fg3a: For I in 1 to ncodes generate

		if_tcm1: if m_list(I)=1 generate
			encoding: auk_vit_var_enc
	 		Generic map (n => n_list(I), L_max => L_max, L_code => L_list(I), pol_sel => I, 
	 								 ga => ga, gb => gb, gc => gc, gd => gd, ge => ge, gf => gf, gg => gg)
	 		Port map (state => lfsr_conv_enc(L_max downto 1),
	 						vector => enc_bits_rx(I)(n_list(I) downto 1) );  -- n_list will be just 2 for TCM
		end generate if_tcm1;
 	
	end generate fg3a;


	monitor_tcm_mode: process
	
		FILE F: TEXT open WRITE_MODE is OUTPUT_FILE;
		FILE FSEC: TEXT open READ_MODE is TCMSEC_FILE;
		variable L, L_sector : Line;
		variable good_read : BOOLEAN;
		Constant single_space : STRING := " ";
		variable index, sector : NATURAL;
		variable unenc_bit, enc_bit : CHARACTER;
		variable two_re_enc_bits : Std_Logic_Vector(2 downto 1);
		variable sel_code_tcm_rx : NATURAL;
	
	begin

		index := 0;
		
		if not ENDFILE(FSEC) then
			READLINE(FSEC, L_sector);
		end if;
		
		reading: while keep_clk_running loop
			if m_sel_fifo(m_sel_rd_cursor)=1 then
				if sink_val_q='1' then
					-- read sector number
					READ(L_sector, sector, good_read);
					if decbit_dec_q='1' then
						enc_bit:='1';
					elsif decbit_dec_q='0' then
						enc_bit:='0';
					elsif decbit_dec_q='X' then
						enc_bit:='X';
					else
						ASSERT FALSE
						REPORT "Decoded bit in Viterbi is different than 1, 0 and X" severity Warning;
					end if;
					-- unencoded bit calculation
					-- sel_code has to be delayed or latched with sop_source 
					-- in order to be used consistently!
					sel_code_tcm_rx := c_sel_fifo(m_sel_rd_cursor);
					two_re_enc_bits := enc_bits_rx(sel_code_tcm_rx)(2 downto 1);
					unenc_bit := un_encoded_bit_extract(two_re_enc_bits, sector);
					WRITE(L, unenc_bit);
					WRITE(L, enc_bit);
					WRITE(L, single_space);
					index := index+1;
					if index=20 or sink_eop_q='1' then
						if not ENDFILE(FSEC) then
							READLINE(FSEC, L_sector);
						end if;
						WRITELINE(F, L);
						index:=0;
					end if;
				end if;
			end if;
			wait until rising_edge(clk_int) or not keep_clk_running;
			
		end loop reading;

		if m_sel_fifo(m_sel_rd_cursor)=1 then
			WRITELINE(F, L);
		end if;
		
		FILE_CLOSE(F);
		FILE_CLOSE(FSEC);
		
		wait;

	end process monitor_tcm_mode;

end architecture Bench;	
