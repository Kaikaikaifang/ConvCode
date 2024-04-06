// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// VENDOR "Altera"
// PROGRAM "Quartus II 64-Bit"
// VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

// DATE "04/06/2024 21:27:03"

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module viterbi (
	clk,
	reset,
	source_rdy,
	sink_val,
	rr,
	eras_sym,
	sink_rdy,
	source_val,
	decbit,
	normalizations)/* synthesis synthesis_greybox=1 */;
input 	clk;
input 	reset;
input 	source_rdy;
input 	sink_val;
input 	[2:1] rr;
input 	[2:1] eras_sym;
output 	sink_rdy;
output 	source_val;
output 	decbit;
output 	[8:1] normalizations;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \auk_vit_par_top_atl_inst|metric_processing|normalizations_int[2]~q ;
wire \auk_vit_par_top_atl_inst|metric_processing|normalizations_int[3]~q ;
wire \auk_vit_par_top_atl_inst|metric_processing|normalizations_int[4]~q ;
wire \auk_vit_par_top_atl_inst|metric_processing|normalizations_int[5]~q ;
wire \auk_vit_par_top_atl_inst|metric_processing|normalizations_int[6]~q ;
wire \auk_vit_par_top_atl_inst|metric_processing|normalizations_int[7]~q ;
wire \auk_vit_par_top_atl_inst|metric_processing|normalizations_int[8]~q ;
wire \auk_vit_par_top_atl_inst|Avalon_streaming_control|enable_source_int~0_combout ;
wire \auk_vit_par_top_atl_inst|Avalon_streaming_control|source_val~combout ;
wire \auk_vit_par_top_atl_inst|decbit_q~q ;
wire \auk_vit_par_top_atl_inst|metric_processing|normalizations_int[1]~q ;
wire \source_rdy~input_o ;
wire \clk~input_o ;
wire \reset~input_o ;
wire \sink_val~input_o ;
wire \rr[1]~input_o ;
wire \rr[2]~input_o ;
wire \eras_sym[1]~input_o ;
wire \eras_sym[2]~input_o ;


viterbi_auk_vit_par_top_atl auk_vit_par_top_atl_inst(
	.normalizations_int_2(\auk_vit_par_top_atl_inst|metric_processing|normalizations_int[2]~q ),
	.normalizations_int_3(\auk_vit_par_top_atl_inst|metric_processing|normalizations_int[3]~q ),
	.normalizations_int_4(\auk_vit_par_top_atl_inst|metric_processing|normalizations_int[4]~q ),
	.normalizations_int_5(\auk_vit_par_top_atl_inst|metric_processing|normalizations_int[5]~q ),
	.normalizations_int_6(\auk_vit_par_top_atl_inst|metric_processing|normalizations_int[6]~q ),
	.normalizations_int_7(\auk_vit_par_top_atl_inst|metric_processing|normalizations_int[7]~q ),
	.normalizations_int_8(\auk_vit_par_top_atl_inst|metric_processing|normalizations_int[8]~q ),
	.enable_source_int(\auk_vit_par_top_atl_inst|Avalon_streaming_control|enable_source_int~0_combout ),
	.source_val(\auk_vit_par_top_atl_inst|Avalon_streaming_control|source_val~combout ),
	.decbit_q1(\auk_vit_par_top_atl_inst|decbit_q~q ),
	.normalizations_int_1(\auk_vit_par_top_atl_inst|metric_processing|normalizations_int[1]~q ),
	.source_rdy(\source_rdy~input_o ),
	.clk(\clk~input_o ),
	.reset(\reset~input_o ),
	.sink_val(\sink_val~input_o ),
	.rr({\rr[2]~input_o ,\rr[1]~input_o }),
	.eras_sym({\eras_sym[2]~input_o ,\eras_sym[1]~input_o }));

assign \source_rdy~input_o  = source_rdy;

assign \clk~input_o  = clk;

assign \reset~input_o  = reset;

assign \sink_val~input_o  = sink_val;

assign \rr[1]~input_o  = rr[1];

assign \rr[2]~input_o  = rr[2];

assign \eras_sym[1]~input_o  = eras_sym[1];

assign \eras_sym[2]~input_o  = eras_sym[2];

assign sink_rdy = ~ \auk_vit_par_top_atl_inst|Avalon_streaming_control|enable_source_int~0_combout ;

assign source_val = \auk_vit_par_top_atl_inst|Avalon_streaming_control|source_val~combout ;

assign decbit = \auk_vit_par_top_atl_inst|decbit_q~q ;

assign normalizations[1] = \auk_vit_par_top_atl_inst|metric_processing|normalizations_int[1]~q ;

assign normalizations[2] = \auk_vit_par_top_atl_inst|metric_processing|normalizations_int[2]~q ;

assign normalizations[3] = \auk_vit_par_top_atl_inst|metric_processing|normalizations_int[3]~q ;

assign normalizations[4] = \auk_vit_par_top_atl_inst|metric_processing|normalizations_int[4]~q ;

assign normalizations[5] = \auk_vit_par_top_atl_inst|metric_processing|normalizations_int[5]~q ;

assign normalizations[6] = \auk_vit_par_top_atl_inst|metric_processing|normalizations_int[6]~q ;

assign normalizations[7] = \auk_vit_par_top_atl_inst|metric_processing|normalizations_int[7]~q ;

assign normalizations[8] = \auk_vit_par_top_atl_inst|metric_processing|normalizations_int[8]~q ;

endmodule

module viterbi_auk_vit_par_top_atl (
	normalizations_int_2,
	normalizations_int_3,
	normalizations_int_4,
	normalizations_int_5,
	normalizations_int_6,
	normalizations_int_7,
	normalizations_int_8,
	enable_source_int,
	source_val,
	decbit_q1,
	normalizations_int_1,
	source_rdy,
	clk,
	reset,
	sink_val,
	rr,
	eras_sym)/* synthesis synthesis_greybox=1 */;
output 	normalizations_int_2;
output 	normalizations_int_3;
output 	normalizations_int_4;
output 	normalizations_int_5;
output 	normalizations_int_6;
output 	normalizations_int_7;
output 	normalizations_int_8;
output 	enable_source_int;
output 	source_val;
output 	decbit_q1;
output 	normalizations_int_1;
input 	source_rdy;
input 	clk;
input 	reset;
input 	sink_val;
input 	[2:1] rr;
input 	[2:1] eras_sym;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \ifg_cont:tracing_back_cont|decbit_RAM|auto_generated|q_b[0] ;
wire \Avalon_streaming_control|atl_buffer_state.out_hold~q ;
wire \Avalon_streaming_control|atl_buffer_state.S0~q ;
wire \ifg_cont:tracing_back_cont|outvalidnode_q~q ;
wire \metric_processing|val_sink_del[4]~q ;
wire \ifg_cont:tracing_back_cont|data_available~0_combout ;
wire \metric_processing|survff_q[2]~q ;
wire \metric_processing|survff_q[4]~q ;
wire \sink_ready_q~q ;
wire \sink_val_int~combout ;
wire \metric_processing|survff_q[3]~q ;
wire \metric_processing|survff_q[1]~q ;
wire \rrff_q[1][1]~q ;
wire \rrff_q[2][1]~q ;
wire \rrff_q[1][2]~q ;
wire \rrff_q[2][2]~q ;
wire \sink_ready_q~0_combout ;
wire \decbit_shunt~q ;
wire \decbit_d~0_combout ;


viterbi_auk_dspip_avalon_str_ctrl Avalon_streaming_control(
	.atl_buffer_stateout_hold(\Avalon_streaming_control|atl_buffer_state.out_hold~q ),
	.atl_buffer_stateS0(\Avalon_streaming_control|atl_buffer_state.S0~q ),
	.enable_source_int(enable_source_int),
	.source_val1(source_val),
	.data_available(\ifg_cont:tracing_back_cont|data_available~0_combout ),
	.source_ready(source_rdy),
	.clk(clk),
	.reset(reset));

viterbi_auk_vit_par_trb_atl \ifg_cont:tracing_back_cont (
	.q_b_0(\ifg_cont:tracing_back_cont|decbit_RAM|auto_generated|q_b[0] ),
	.atl_buffer_stateout_hold(\Avalon_streaming_control|atl_buffer_state.out_hold~q ),
	.atl_buffer_stateS0(\Avalon_streaming_control|atl_buffer_state.S0~q ),
	.enable_source_int(enable_source_int),
	.outvalidnode_q1(\ifg_cont:tracing_back_cont|outvalidnode_q~q ),
	.survready(\metric_processing|val_sink_del[4]~q ),
	.data_available(\ifg_cont:tracing_back_cont|data_available~0_combout ),
	.survive({\metric_processing|survff_q[4]~q ,\metric_processing|survff_q[3]~q ,\metric_processing|survff_q[2]~q ,\metric_processing|survff_q[1]~q }),
	.clk(clk),
	.reset(reset));

viterbi_auk_vit_par_bmp_atl metric_processing(
	.normalizations_int_2(normalizations_int_2),
	.normalizations_int_3(normalizations_int_3),
	.normalizations_int_4(normalizations_int_4),
	.normalizations_int_5(normalizations_int_5),
	.normalizations_int_6(normalizations_int_6),
	.normalizations_int_7(normalizations_int_7),
	.normalizations_int_8(normalizations_int_8),
	.normalizations_int_1(normalizations_int_1),
	.val_sink_del_4(\metric_processing|val_sink_del[4]~q ),
	.survff_q_2(\metric_processing|survff_q[2]~q ),
	.survff_q_4(\metric_processing|survff_q[4]~q ),
	.sink_val_int(\sink_val_int~combout ),
	.survff_q_3(\metric_processing|survff_q[3]~q ),
	.survff_q_1(\metric_processing|survff_q[1]~q ),
	.rrff_1_1(\rrff_q[1][1]~q ),
	.rrff_2_1(\rrff_q[2][1]~q ),
	.rrff_1_2(\rrff_q[1][2]~q ),
	.rrff_2_2(\rrff_q[2][2]~q ),
	.clk(clk),
	.reset(reset));

dffeas sink_ready_q(
	.clk(clk),
	.d(\sink_ready_q~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\sink_ready_q~q ),
	.prn(vcc));
defparam sink_ready_q.is_wysiwyg = "true";
defparam sink_ready_q.power_up = "low";

cycloneiii_lcell_comb sink_val_int(
	.dataa(sink_val),
	.datab(\sink_ready_q~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\sink_val_int~combout ),
	.cout());
defparam sink_val_int.lut_mask = 16'hEEEE;
defparam sink_val_int.sum_lutc_input = "datac";

dffeas \rrff_q[1][1] (
	.clk(clk),
	.d(rr[1]),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_val_int~combout ),
	.q(\rrff_q[1][1]~q ),
	.prn(vcc));
defparam \rrff_q[1][1] .is_wysiwyg = "true";
defparam \rrff_q[1][1] .power_up = "low";

dffeas \rrff_q[2][1] (
	.clk(clk),
	.d(rr[2]),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_val_int~combout ),
	.q(\rrff_q[2][1]~q ),
	.prn(vcc));
defparam \rrff_q[2][1] .is_wysiwyg = "true";
defparam \rrff_q[2][1] .power_up = "low";

dffeas \rrff_q[1][2] (
	.clk(clk),
	.d(eras_sym[1]),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_val_int~combout ),
	.q(\rrff_q[1][2]~q ),
	.prn(vcc));
defparam \rrff_q[1][2] .is_wysiwyg = "true";
defparam \rrff_q[1][2] .power_up = "low";

dffeas \rrff_q[2][2] (
	.clk(clk),
	.d(eras_sym[2]),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\sink_val_int~combout ),
	.q(\rrff_q[2][2]~q ),
	.prn(vcc));
defparam \rrff_q[2][2] .is_wysiwyg = "true";
defparam \rrff_q[2][2] .power_up = "low";

cycloneiii_lcell_comb \sink_ready_q~0 (
	.dataa(enable_source_int),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\sink_ready_q~0_combout ),
	.cout());
defparam \sink_ready_q~0 .lut_mask = 16'h5555;
defparam \sink_ready_q~0 .sum_lutc_input = "datac";

dffeas decbit_q(
	.clk(clk),
	.d(\decbit_d~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_rdy),
	.q(decbit_q1),
	.prn(vcc));
defparam decbit_q.is_wysiwyg = "true";
defparam decbit_q.power_up = "low";

dffeas decbit_shunt(
	.clk(clk),
	.d(\decbit_d~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\decbit_shunt~q ),
	.prn(vcc));
defparam decbit_shunt.is_wysiwyg = "true";
defparam decbit_shunt.power_up = "low";

cycloneiii_lcell_comb \decbit_d~0 (
	.dataa(\decbit_shunt~q ),
	.datab(\ifg_cont:tracing_back_cont|outvalidnode_q~q ),
	.datac(\ifg_cont:tracing_back_cont|decbit_RAM|auto_generated|q_b[0] ),
	.datad(enable_source_int),
	.cin(gnd),
	.combout(\decbit_d~0_combout ),
	.cout());
defparam \decbit_d~0 .lut_mask = 16'hFAFC;
defparam \decbit_d~0 .sum_lutc_input = "datac";

endmodule

module viterbi_auk_dspip_avalon_str_ctrl (
	atl_buffer_stateout_hold,
	atl_buffer_stateS0,
	enable_source_int,
	source_val1,
	data_available,
	source_ready,
	clk,
	reset)/* synthesis synthesis_greybox=1 */;
output 	atl_buffer_stateout_hold;
output 	atl_buffer_stateS0;
output 	enable_source_int;
output 	source_val1;
input 	data_available;
input 	source_ready;
input 	clk;
input 	reset;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \Selector2~0_combout ;
wire \Selector2~1_combout ;
wire \atl_buffer_state.out_idle~q ;
wire \Selector3~0_combout ;
wire \atl_buffer_state.out_active~q ;
wire \Selector4~0_combout ;
wire \Selector4~1_combout ;
wire \val_source_q~0_combout ;
wire \val_source_q~1_combout ;
wire \val_source_q~q ;
wire \data_val_shunt~q ;
wire \data_val_shunt~2_combout ;
wire \data_val_pipe~q ;


dffeas \atl_buffer_state.out_hold (
	.clk(clk),
	.d(\Selector4~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(atl_buffer_stateout_hold),
	.prn(vcc));
defparam \atl_buffer_state.out_hold .is_wysiwyg = "true";
defparam \atl_buffer_state.out_hold .power_up = "low";

dffeas \atl_buffer_state.S0 (
	.clk(clk),
	.d(vcc),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(atl_buffer_stateS0),
	.prn(vcc));
defparam \atl_buffer_state.S0 .is_wysiwyg = "true";
defparam \atl_buffer_state.S0 .power_up = "low";

cycloneiii_lcell_comb \enable_source_int~0 (
	.dataa(atl_buffer_stateout_hold),
	.datab(gnd),
	.datac(gnd),
	.datad(atl_buffer_stateS0),
	.cin(gnd),
	.combout(enable_source_int),
	.cout());
defparam \enable_source_int~0 .lut_mask = 16'hAAFF;
defparam \enable_source_int~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb source_val(
	.dataa(\val_source_q~q ),
	.datab(\data_val_pipe~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(source_val1),
	.cout());
defparam source_val.lut_mask = 16'hEEEE;
defparam source_val.sum_lutc_input = "datac";

cycloneiii_lcell_comb \Selector2~0 (
	.dataa(gnd),
	.datab(gnd),
	.datac(atl_buffer_stateout_hold),
	.datad(\atl_buffer_state.out_active~q ),
	.cin(gnd),
	.combout(\Selector2~0_combout ),
	.cout());
defparam \Selector2~0 .lut_mask = 16'h0FFF;
defparam \Selector2~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Selector2~1 (
	.dataa(\Selector2~0_combout ),
	.datab(source_ready),
	.datac(\atl_buffer_state.out_idle~q ),
	.datad(data_available),
	.cin(gnd),
	.combout(\Selector2~1_combout ),
	.cout());
defparam \Selector2~1 .lut_mask = 16'hEFFF;
defparam \Selector2~1 .sum_lutc_input = "datac";

dffeas \atl_buffer_state.out_idle (
	.clk(clk),
	.d(\Selector2~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\atl_buffer_state.out_idle~q ),
	.prn(vcc));
defparam \atl_buffer_state.out_idle .is_wysiwyg = "true";
defparam \atl_buffer_state.out_idle .power_up = "low";

cycloneiii_lcell_comb \Selector3~0 (
	.dataa(source_ready),
	.datab(data_available),
	.datac(\atl_buffer_state.out_idle~q ),
	.datad(\Selector2~0_combout ),
	.cin(gnd),
	.combout(\Selector3~0_combout ),
	.cout());
defparam \Selector3~0 .lut_mask = 16'hFEFF;
defparam \Selector3~0 .sum_lutc_input = "datac";

dffeas \atl_buffer_state.out_active (
	.clk(clk),
	.d(\Selector3~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\atl_buffer_state.out_active~q ),
	.prn(vcc));
defparam \atl_buffer_state.out_active .is_wysiwyg = "true";
defparam \atl_buffer_state.out_active .power_up = "low";

cycloneiii_lcell_comb \Selector4~0 (
	.dataa(atl_buffer_stateout_hold),
	.datab(\atl_buffer_state.out_active~q ),
	.datac(gnd),
	.datad(source_ready),
	.cin(gnd),
	.combout(\Selector4~0_combout ),
	.cout());
defparam \Selector4~0 .lut_mask = 16'hEEFF;
defparam \Selector4~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Selector4~1 (
	.dataa(\Selector4~0_combout ),
	.datab(\atl_buffer_state.out_idle~q ),
	.datac(data_available),
	.datad(source_ready),
	.cin(gnd),
	.combout(\Selector4~1_combout ),
	.cout());
defparam \Selector4~1 .lut_mask = 16'hFEFF;
defparam \Selector4~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \val_source_q~0 (
	.dataa(gnd),
	.datab(gnd),
	.datac(\atl_buffer_state.out_idle~q ),
	.datad(\atl_buffer_state.out_active~q ),
	.cin(gnd),
	.combout(\val_source_q~0_combout ),
	.cout());
defparam \val_source_q~0 .lut_mask = 16'h0FFF;
defparam \val_source_q~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \val_source_q~1 (
	.dataa(source_ready),
	.datab(atl_buffer_stateout_hold),
	.datac(data_available),
	.datad(\val_source_q~0_combout ),
	.cin(gnd),
	.combout(\val_source_q~1_combout ),
	.cout());
defparam \val_source_q~1 .lut_mask = 16'hFEFF;
defparam \val_source_q~1 .sum_lutc_input = "datac";

dffeas val_source_q(
	.clk(clk),
	.d(\val_source_q~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\val_source_q~q ),
	.prn(vcc));
defparam val_source_q.is_wysiwyg = "true";
defparam val_source_q.power_up = "low";

dffeas data_val_shunt(
	.clk(clk),
	.d(\data_val_shunt~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\data_val_shunt~q ),
	.prn(vcc));
defparam data_val_shunt.is_wysiwyg = "true";
defparam data_val_shunt.power_up = "low";

cycloneiii_lcell_comb \data_val_shunt~2 (
	.dataa(atl_buffer_stateout_hold),
	.datab(atl_buffer_stateS0),
	.datac(\data_val_shunt~q ),
	.datad(data_available),
	.cin(gnd),
	.combout(\data_val_shunt~2_combout ),
	.cout());
defparam \data_val_shunt~2 .lut_mask = 16'hFFF6;
defparam \data_val_shunt~2 .sum_lutc_input = "datac";

dffeas data_val_pipe(
	.clk(clk),
	.d(\data_val_shunt~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(source_ready),
	.q(\data_val_pipe~q ),
	.prn(vcc));
defparam data_val_pipe.is_wysiwyg = "true";
defparam data_val_pipe.power_up = "low";

endmodule

module viterbi_auk_vit_par_bmp_atl (
	normalizations_int_2,
	normalizations_int_3,
	normalizations_int_4,
	normalizations_int_5,
	normalizations_int_6,
	normalizations_int_7,
	normalizations_int_8,
	normalizations_int_1,
	val_sink_del_4,
	survff_q_2,
	survff_q_4,
	sink_val_int,
	survff_q_3,
	survff_q_1,
	rrff_1_1,
	rrff_2_1,
	rrff_1_2,
	rrff_2_2,
	clk,
	reset)/* synthesis synthesis_greybox=1 */;
output 	normalizations_int_2;
output 	normalizations_int_3;
output 	normalizations_int_4;
output 	normalizations_int_5;
output 	normalizations_int_6;
output 	normalizations_int_7;
output 	normalizations_int_8;
output 	normalizations_int_1;
output 	val_sink_del_4;
output 	survff_q_2;
output 	survff_q_4;
input 	sink_val_int;
output 	survff_q_3;
output 	survff_q_1;
input 	rrff_1_1;
input 	rrff_2_1;
input 	rrff_1_2;
input 	rrff_2_2;
input 	clk;
input 	reset;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \normalizations_int[2]~8_combout ;
wire \val_sink_del[1]~q ;
wire \val_sink_del[2]~q ;
wire \val_sink_del[3]~q ;
wire \rrffa_q[1][2]~q ;
wire \rrffa_q[1][1]~q ;
wire \rrffa_q[2][2]~q ;
wire \rrffa_q[2][1]~q ;
wire \Add0~0_combout ;
wire \addtop_q[1][1][2]~q ;
wire \Add0~1_combout ;
wire \addtop_q[1][1][1]~q ;
wire \bms_q[1][1]~48_combout ;
wire \Add3~1_combout ;
wire \addtop_q[1][4][1]~q ;
wire \bms_q[3][1]~24_combout ;
wire \Add15~0_combout ;
wire \Add3~0_combout ;
wire \addtop_q[1][4][2]~q ;
wire \bms_q[3][1]~25 ;
wire \bms_q[3][2]~27 ;
wire \bms_q[3][3]~29 ;
wire \bms_q[3][4]~31 ;
wire \bms_q[3][5]~32_combout ;
wire \bms_q[3][4]~30_combout ;
wire \bms_q[3][3]~28_combout ;
wire \bms_q[3][2]~26_combout ;
wire \Add1~0_combout ;
wire \addtop_q[1][2][2]~q ;
wire \Add1~1_combout ;
wire \addtop_q[1][2][1]~q ;
wire \bms_q[2][1]~61 ;
wire \bms_q[2][2]~62_combout ;
wire \Add2~0_combout ;
wire \addtop_q[1][3][2]~q ;
wire \Add2~1_combout ;
wire \addtop_q[1][3][1]~q ;
wire \bms_q[4][1]~37 ;
wire \bms_q[4][2]~38_combout ;
wire \bms_q[4][1]~36_combout ;
wire \Add19~0_combout ;
wire \bms_q[4][2]~39 ;
wire \bms_q[4][3]~41 ;
wire \bms_q[4][4]~43 ;
wire \bms_q[4][5]~45 ;
wire \bms_q[4][6]~46_combout ;
wire \bms_q[4][5]~44_combout ;
wire \bms_q[4][4]~42_combout ;
wire \bms_q[4][3]~40_combout ;
wire \Add19~3 ;
wire \Add19~4_combout ;
wire \bms_q[4][3]~q ;
wire \Add19~5 ;
wire \Add19~6_combout ;
wire \bms_q[4][4]~q ;
wire \Add19~7 ;
wire \Add19~8_combout ;
wire \bms_q[4][5]~q ;
wire \Add19~9 ;
wire \Add19~10_combout ;
wire \bms_q[4][6]~q ;
wire \Add20~1 ;
wire \Add20~3 ;
wire \Add20~5 ;
wire \Add20~7 ;
wire \Add20~9 ;
wire \Add20~11 ;
wire \Add20~12_combout ;
wire \Add7~0_combout ;
wire \bmdiff_mux_q[4][3]~q ;
wire \Add20~10_combout ;
wire \Add20~8_combout ;
wire \Add20~6_combout ;
wire \Add20~4_combout ;
wire \Add20~2_combout ;
wire \Add7~1_combout ;
wire \bmdiff_mux_q[4][2]~q ;
wire \Add20~0_combout ;
wire \Add6~2_combout ;
wire \bmdiff_mux_q[4][1]~q ;
wire \Add21~1_cout ;
wire \Add21~3_cout ;
wire \Add21~5_cout ;
wire \Add21~7_cout ;
wire \Add21~9_cout ;
wire \Add21~11_cout ;
wire \Add21~13_cout ;
wire \Add21~14_combout ;
wire \bms_q[4][1]~q ;
wire \Add19~1 ;
wire \Add19~2_combout ;
wire \bms_q[4][2]~q ;
wire \Add12~1 ;
wire \Add12~2_combout ;
wire \Add5~0_combout ;
wire \bmdiff_mux_q[2][3]~q ;
wire \Add5~1_combout ;
wire \bmdiff_mux_q[2][2]~q ;
wire \Add13~1_cout ;
wire \Add13~3_cout ;
wire \Add13~5_cout ;
wire \Add13~7_cout ;
wire \Add13~9_cout ;
wire \Add13~11_cout ;
wire \Add13~13_cout ;
wire \Add13~14_combout ;
wire \bms_q[2][2]~q ;
wire \Add15~1 ;
wire \Add15~2_combout ;
wire \bms_q[3][2]~q ;
wire \bms_q[2][2]~63 ;
wire \bms_q[2][3]~64_combout ;
wire \Add12~3 ;
wire \Add12~4_combout ;
wire \bms_q[2][3]~q ;
wire \Add15~3 ;
wire \Add15~4_combout ;
wire \bms_q[3][3]~q ;
wire \bms_q[2][3]~65 ;
wire \bms_q[2][4]~66_combout ;
wire \Add12~5 ;
wire \Add12~6_combout ;
wire \bms_q[2][4]~q ;
wire \Add15~5 ;
wire \Add15~6_combout ;
wire \bms_q[3][4]~q ;
wire \bms_q[2][4]~67 ;
wire \bms_q[2][5]~68_combout ;
wire \Add12~7 ;
wire \Add12~8_combout ;
wire \bms_q[2][5]~q ;
wire \Add15~7 ;
wire \Add15~8_combout ;
wire \bms_q[3][5]~q ;
wire \bms_q[2][5]~69 ;
wire \bms_q[2][6]~70_combout ;
wire \Add12~9 ;
wire \Add12~10_combout ;
wire \bms_q[2][6]~q ;
wire \Add16~1 ;
wire \Add16~3 ;
wire \Add16~5 ;
wire \Add16~7 ;
wire \Add16~9 ;
wire \Add16~11 ;
wire \Add16~12_combout ;
wire \Add6~0_combout ;
wire \bmdiff_mux_q[3][3]~q ;
wire \Add16~10_combout ;
wire \Add16~8_combout ;
wire \Add16~6_combout ;
wire \Add16~4_combout ;
wire \Add16~2_combout ;
wire \Add6~1_combout ;
wire \bmdiff_mux_q[3][2]~q ;
wire \Add16~0_combout ;
wire \bmdiff_mux_q[3][1]~q ;
wire \Add17~1_cout ;
wire \Add17~3_cout ;
wire \Add17~5_cout ;
wire \Add17~7_cout ;
wire \Add17~9_cout ;
wire \Add17~11_cout ;
wire \Add17~13_cout ;
wire \Add17~14_combout ;
wire \bms_q[3][1]~q ;
wire \bms_q[2][1]~60_combout ;
wire \Add12~0_combout ;
wire \bms_q[2][1]~q ;
wire \Add9~0_combout ;
wire \Add4~0_combout ;
wire \bmdiff_mux_q[1][3]~q ;
wire \Add4~1_combout ;
wire \bmdiff_mux_q[1][2]~q ;
wire \Add10~1_cout ;
wire \Add10~3_cout ;
wire \Add10~5_cout ;
wire \Add10~7_cout ;
wire \Add10~9_cout ;
wire \Add10~11_cout ;
wire \Add10~13_cout ;
wire \Add10~14_combout ;
wire \bms_q[1][1]~q ;
wire \bms_q[1][1]~49 ;
wire \bms_q[1][2]~50_combout ;
wire \Add9~1 ;
wire \Add9~2_combout ;
wire \bms_q[1][2]~q ;
wire \bms_q[1][2]~51 ;
wire \bms_q[1][3]~52_combout ;
wire \Add9~3 ;
wire \Add9~4_combout ;
wire \bms_q[1][3]~q ;
wire \bms_q[1][3]~53 ;
wire \bms_q[1][4]~54_combout ;
wire \Add9~5 ;
wire \Add9~6_combout ;
wire \bms_q[1][4]~q ;
wire \bms_q[1][4]~55 ;
wire \bms_q[1][5]~56_combout ;
wire \Add9~7 ;
wire \Add9~8_combout ;
wire \Add9~8_wirecell_combout ;
wire \bms_q[1][5]~q ;
wire \bms_q[1][5]~57 ;
wire \bms_q[1][6]~58_combout ;
wire \Add9~9 ;
wire \Add9~10_combout ;
wire \bms_q[1][6]~q ;
wire \bms_q[3][5]~33 ;
wire \bms_q[3][6]~34_combout ;
wire \Add15~9 ;
wire \Add15~10_combout ;
wire \bms_q[3][6]~q ;
wire \overhold_and_q~1_combout ;
wire \overhold_and_q[2]~q ;
wire \overhold_and_q~2_combout ;
wire \overhold_and_q[1]~q ;
wire \overhold_and_q~0_combout ;
wire \overhold_and_q[3]~q ;
wire \normalizations_int[1]~10_combout ;
wire \normalizations_int[2]~9 ;
wire \normalizations_int[3]~11_combout ;
wire \normalizations_int[3]~12 ;
wire \normalizations_int[4]~13_combout ;
wire \normalizations_int[4]~14 ;
wire \normalizations_int[5]~15_combout ;
wire \normalizations_int[5]~16 ;
wire \normalizations_int[6]~17_combout ;
wire \normalizations_int[6]~18 ;
wire \normalizations_int[7]~19_combout ;
wire \normalizations_int[7]~20 ;
wire \normalizations_int[8]~21_combout ;
wire \normalizations_int[1]~7_combout ;


dffeas \normalizations_int[2] (
	.clk(clk),
	.d(\normalizations_int[2]~8_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\normalizations_int[1]~10_combout ),
	.q(normalizations_int_2),
	.prn(vcc));
defparam \normalizations_int[2] .is_wysiwyg = "true";
defparam \normalizations_int[2] .power_up = "low";

dffeas \normalizations_int[3] (
	.clk(clk),
	.d(\normalizations_int[3]~11_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\normalizations_int[1]~10_combout ),
	.q(normalizations_int_3),
	.prn(vcc));
defparam \normalizations_int[3] .is_wysiwyg = "true";
defparam \normalizations_int[3] .power_up = "low";

dffeas \normalizations_int[4] (
	.clk(clk),
	.d(\normalizations_int[4]~13_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\normalizations_int[1]~10_combout ),
	.q(normalizations_int_4),
	.prn(vcc));
defparam \normalizations_int[4] .is_wysiwyg = "true";
defparam \normalizations_int[4] .power_up = "low";

dffeas \normalizations_int[5] (
	.clk(clk),
	.d(\normalizations_int[5]~15_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\normalizations_int[1]~10_combout ),
	.q(normalizations_int_5),
	.prn(vcc));
defparam \normalizations_int[5] .is_wysiwyg = "true";
defparam \normalizations_int[5] .power_up = "low";

dffeas \normalizations_int[6] (
	.clk(clk),
	.d(\normalizations_int[6]~17_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\normalizations_int[1]~10_combout ),
	.q(normalizations_int_6),
	.prn(vcc));
defparam \normalizations_int[6] .is_wysiwyg = "true";
defparam \normalizations_int[6] .power_up = "low";

dffeas \normalizations_int[7] (
	.clk(clk),
	.d(\normalizations_int[7]~19_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\normalizations_int[1]~10_combout ),
	.q(normalizations_int_7),
	.prn(vcc));
defparam \normalizations_int[7] .is_wysiwyg = "true";
defparam \normalizations_int[7] .power_up = "low";

dffeas \normalizations_int[8] (
	.clk(clk),
	.d(\normalizations_int[8]~21_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\normalizations_int[1]~10_combout ),
	.q(normalizations_int_8),
	.prn(vcc));
defparam \normalizations_int[8] .is_wysiwyg = "true";
defparam \normalizations_int[8] .power_up = "low";

dffeas \normalizations_int[1] (
	.clk(clk),
	.d(\normalizations_int[1]~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(normalizations_int_1),
	.prn(vcc));
defparam \normalizations_int[1] .is_wysiwyg = "true";
defparam \normalizations_int[1] .power_up = "low";

dffeas \val_sink_del[4] (
	.clk(clk),
	.d(\val_sink_del[3]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(val_sink_del_4),
	.prn(vcc));
defparam \val_sink_del[4] .is_wysiwyg = "true";
defparam \val_sink_del[4] .power_up = "low";

dffeas \survff_q[2] (
	.clk(clk),
	.d(\Add13~14_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[3]~q ),
	.q(survff_q_2),
	.prn(vcc));
defparam \survff_q[2] .is_wysiwyg = "true";
defparam \survff_q[2] .power_up = "low";

dffeas \survff_q[4] (
	.clk(clk),
	.d(\Add21~14_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[3]~q ),
	.q(survff_q_4),
	.prn(vcc));
defparam \survff_q[4] .is_wysiwyg = "true";
defparam \survff_q[4] .power_up = "low";

dffeas \survff_q[3] (
	.clk(clk),
	.d(\Add17~14_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[3]~q ),
	.q(survff_q_3),
	.prn(vcc));
defparam \survff_q[3] .is_wysiwyg = "true";
defparam \survff_q[3] .power_up = "low";

dffeas \survff_q[1] (
	.clk(clk),
	.d(\Add10~14_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[3]~q ),
	.q(survff_q_1),
	.prn(vcc));
defparam \survff_q[1] .is_wysiwyg = "true";
defparam \survff_q[1] .power_up = "low";

cycloneiii_lcell_comb \normalizations_int[2]~8 (
	.dataa(normalizations_int_2),
	.datab(normalizations_int_1),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\normalizations_int[2]~8_combout ),
	.cout(\normalizations_int[2]~9 ));
defparam \normalizations_int[2]~8 .lut_mask = 16'h66EE;
defparam \normalizations_int[2]~8 .sum_lutc_input = "datac";

dffeas \val_sink_del[1] (
	.clk(clk),
	.d(sink_val_int),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\val_sink_del[1]~q ),
	.prn(vcc));
defparam \val_sink_del[1] .is_wysiwyg = "true";
defparam \val_sink_del[1] .power_up = "low";

dffeas \val_sink_del[2] (
	.clk(clk),
	.d(\val_sink_del[1]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\val_sink_del[2]~q ),
	.prn(vcc));
defparam \val_sink_del[2] .is_wysiwyg = "true";
defparam \val_sink_del[2] .power_up = "low";

dffeas \val_sink_del[3] (
	.clk(clk),
	.d(\val_sink_del[2]~q ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\val_sink_del[3]~q ),
	.prn(vcc));
defparam \val_sink_del[3] .is_wysiwyg = "true";
defparam \val_sink_del[3] .power_up = "low";

dffeas \rrffa_q[1][2] (
	.clk(clk),
	.d(rrff_1_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[1]~q ),
	.q(\rrffa_q[1][2]~q ),
	.prn(vcc));
defparam \rrffa_q[1][2] .is_wysiwyg = "true";
defparam \rrffa_q[1][2] .power_up = "low";

dffeas \rrffa_q[1][1] (
	.clk(clk),
	.d(rrff_1_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[1]~q ),
	.q(\rrffa_q[1][1]~q ),
	.prn(vcc));
defparam \rrffa_q[1][1] .is_wysiwyg = "true";
defparam \rrffa_q[1][1] .power_up = "low";

dffeas \rrffa_q[2][2] (
	.clk(clk),
	.d(rrff_2_2),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[1]~q ),
	.q(\rrffa_q[2][2]~q ),
	.prn(vcc));
defparam \rrffa_q[2][2] .is_wysiwyg = "true";
defparam \rrffa_q[2][2] .power_up = "low";

dffeas \rrffa_q[2][1] (
	.clk(clk),
	.d(rrff_2_1),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[1]~q ),
	.q(\rrffa_q[2][1]~q ),
	.prn(vcc));
defparam \rrffa_q[2][1] .is_wysiwyg = "true";
defparam \rrffa_q[2][1] .power_up = "low";

cycloneiii_lcell_comb \Add0~0 (
	.dataa(\rrffa_q[1][2]~q ),
	.datab(\rrffa_q[1][1]~q ),
	.datac(\rrffa_q[2][2]~q ),
	.datad(\rrffa_q[2][1]~q ),
	.cin(gnd),
	.combout(\Add0~0_combout ),
	.cout());
defparam \Add0~0 .lut_mask = 16'h7FFF;
defparam \Add0~0 .sum_lutc_input = "datac";

dffeas \addtop_q[1][1][2] (
	.clk(clk),
	.d(\Add0~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\addtop_q[1][1][2]~q ),
	.prn(vcc));
defparam \addtop_q[1][1][2] .is_wysiwyg = "true";
defparam \addtop_q[1][1][2] .power_up = "low";

cycloneiii_lcell_comb \Add0~1 (
	.dataa(\rrffa_q[1][2]~q ),
	.datab(\rrffa_q[2][2]~q ),
	.datac(\rrffa_q[2][1]~q ),
	.datad(\rrffa_q[1][1]~q ),
	.cin(gnd),
	.combout(\Add0~1_combout ),
	.cout());
defparam \Add0~1 .lut_mask = 16'h6996;
defparam \Add0~1 .sum_lutc_input = "datac";

dffeas \addtop_q[1][1][1] (
	.clk(clk),
	.d(\Add0~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\addtop_q[1][1][1]~q ),
	.prn(vcc));
defparam \addtop_q[1][1][1] .is_wysiwyg = "true";
defparam \addtop_q[1][1][1] .power_up = "low";

cycloneiii_lcell_comb \bms_q[1][1]~48 (
	.dataa(\bms_q[1][1]~q ),
	.datab(\addtop_q[1][1][1]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\bms_q[1][1]~48_combout ),
	.cout(\bms_q[1][1]~49 ));
defparam \bms_q[1][1]~48 .lut_mask = 16'h66EE;
defparam \bms_q[1][1]~48 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add3~1 (
	.dataa(\rrffa_q[1][1]~q ),
	.datab(\rrffa_q[2][1]~q ),
	.datac(\rrffa_q[1][2]~q ),
	.datad(\rrffa_q[2][2]~q ),
	.cin(gnd),
	.combout(\Add3~1_combout ),
	.cout());
defparam \Add3~1 .lut_mask = 16'h6996;
defparam \Add3~1 .sum_lutc_input = "datac";

dffeas \addtop_q[1][4][1] (
	.clk(clk),
	.d(\Add3~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\addtop_q[1][4][1]~q ),
	.prn(vcc));
defparam \addtop_q[1][4][1] .is_wysiwyg = "true";
defparam \addtop_q[1][4][1] .power_up = "low";

cycloneiii_lcell_comb \bms_q[3][1]~24 (
	.dataa(\bms_q[1][1]~q ),
	.datab(\addtop_q[1][4][1]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\bms_q[3][1]~24_combout ),
	.cout(\bms_q[3][1]~25 ));
defparam \bms_q[3][1]~24 .lut_mask = 16'h66EE;
defparam \bms_q[3][1]~24 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add15~0 (
	.dataa(\bms_q[2][1]~q ),
	.datab(\addtop_q[1][1][1]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\Add15~0_combout ),
	.cout(\Add15~1 ));
defparam \Add15~0 .lut_mask = 16'h66EE;
defparam \Add15~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add3~0 (
	.dataa(\rrffa_q[1][1]~q ),
	.datab(\rrffa_q[2][1]~q ),
	.datac(\rrffa_q[1][2]~q ),
	.datad(\rrffa_q[2][2]~q ),
	.cin(gnd),
	.combout(\Add3~0_combout ),
	.cout());
defparam \Add3~0 .lut_mask = 16'hEFFF;
defparam \Add3~0 .sum_lutc_input = "datac";

dffeas \addtop_q[1][4][2] (
	.clk(clk),
	.d(\Add3~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\addtop_q[1][4][2]~q ),
	.prn(vcc));
defparam \addtop_q[1][4][2] .is_wysiwyg = "true";
defparam \addtop_q[1][4][2] .power_up = "low";

cycloneiii_lcell_comb \bms_q[3][2]~26 (
	.dataa(\bms_q[1][2]~q ),
	.datab(\addtop_q[1][4][2]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\bms_q[3][1]~25 ),
	.combout(\bms_q[3][2]~26_combout ),
	.cout(\bms_q[3][2]~27 ));
defparam \bms_q[3][2]~26 .lut_mask = 16'h967F;
defparam \bms_q[3][2]~26 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \bms_q[3][3]~28 (
	.dataa(\bms_q[1][3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\bms_q[3][2]~27 ),
	.combout(\bms_q[3][3]~28_combout ),
	.cout(\bms_q[3][3]~29 ));
defparam \bms_q[3][3]~28 .lut_mask = 16'h5AAF;
defparam \bms_q[3][3]~28 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \bms_q[3][4]~30 (
	.dataa(\bms_q[1][4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\bms_q[3][3]~29 ),
	.combout(\bms_q[3][4]~30_combout ),
	.cout(\bms_q[3][4]~31 ));
defparam \bms_q[3][4]~30 .lut_mask = 16'h5A5F;
defparam \bms_q[3][4]~30 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \bms_q[3][5]~32 (
	.dataa(\bms_q[1][5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\bms_q[3][4]~31 ),
	.combout(\bms_q[3][5]~32_combout ),
	.cout(\bms_q[3][5]~33 ));
defparam \bms_q[3][5]~32 .lut_mask = 16'h5A5F;
defparam \bms_q[3][5]~32 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add1~0 (
	.dataa(\rrffa_q[1][1]~q ),
	.datab(\rrffa_q[1][2]~q ),
	.datac(\rrffa_q[2][2]~q ),
	.datad(\rrffa_q[2][1]~q ),
	.cin(gnd),
	.combout(\Add1~0_combout ),
	.cout());
defparam \Add1~0 .lut_mask = 16'hBFFF;
defparam \Add1~0 .sum_lutc_input = "datac";

dffeas \addtop_q[1][2][2] (
	.clk(clk),
	.d(\Add1~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\addtop_q[1][2][2]~q ),
	.prn(vcc));
defparam \addtop_q[1][2][2] .is_wysiwyg = "true";
defparam \addtop_q[1][2][2] .power_up = "low";

cycloneiii_lcell_comb \Add1~1 (
	.dataa(\rrffa_q[1][2]~q ),
	.datab(\rrffa_q[2][2]~q ),
	.datac(\rrffa_q[2][1]~q ),
	.datad(\rrffa_q[1][1]~q ),
	.cin(gnd),
	.combout(\Add1~1_combout ),
	.cout());
defparam \Add1~1 .lut_mask = 16'h6996;
defparam \Add1~1 .sum_lutc_input = "datac";

dffeas \addtop_q[1][2][1] (
	.clk(clk),
	.d(\Add1~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\addtop_q[1][2][1]~q ),
	.prn(vcc));
defparam \addtop_q[1][2][1] .is_wysiwyg = "true";
defparam \addtop_q[1][2][1] .power_up = "low";

cycloneiii_lcell_comb \bms_q[2][1]~60 (
	.dataa(\bms_q[3][1]~q ),
	.datab(\addtop_q[1][2][1]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\bms_q[2][1]~60_combout ),
	.cout(\bms_q[2][1]~61 ));
defparam \bms_q[2][1]~60 .lut_mask = 16'h66EE;
defparam \bms_q[2][1]~60 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \bms_q[2][2]~62 (
	.dataa(\bms_q[3][2]~q ),
	.datab(\addtop_q[1][2][2]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\bms_q[2][1]~61 ),
	.combout(\bms_q[2][2]~62_combout ),
	.cout(\bms_q[2][2]~63 ));
defparam \bms_q[2][2]~62 .lut_mask = 16'h967F;
defparam \bms_q[2][2]~62 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add2~0 (
	.dataa(\rrffa_q[2][1]~q ),
	.datab(\rrffa_q[1][2]~q ),
	.datac(\rrffa_q[1][1]~q ),
	.datad(\rrffa_q[2][2]~q ),
	.cin(gnd),
	.combout(\Add2~0_combout ),
	.cout());
defparam \Add2~0 .lut_mask = 16'hBFFF;
defparam \Add2~0 .sum_lutc_input = "datac";

dffeas \addtop_q[1][3][2] (
	.clk(clk),
	.d(\Add2~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\addtop_q[1][3][2]~q ),
	.prn(vcc));
defparam \addtop_q[1][3][2] .is_wysiwyg = "true";
defparam \addtop_q[1][3][2] .power_up = "low";

cycloneiii_lcell_comb \Add2~1 (
	.dataa(\rrffa_q[2][2]~q ),
	.datab(\rrffa_q[1][2]~q ),
	.datac(\rrffa_q[1][1]~q ),
	.datad(\rrffa_q[2][1]~q ),
	.cin(gnd),
	.combout(\Add2~1_combout ),
	.cout());
defparam \Add2~1 .lut_mask = 16'h6996;
defparam \Add2~1 .sum_lutc_input = "datac";

dffeas \addtop_q[1][3][1] (
	.clk(clk),
	.d(\Add2~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\addtop_q[1][3][1]~q ),
	.prn(vcc));
defparam \addtop_q[1][3][1] .is_wysiwyg = "true";
defparam \addtop_q[1][3][1] .power_up = "low";

cycloneiii_lcell_comb \bms_q[4][1]~36 (
	.dataa(\bms_q[3][1]~q ),
	.datab(\addtop_q[1][3][1]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\bms_q[4][1]~36_combout ),
	.cout(\bms_q[4][1]~37 ));
defparam \bms_q[4][1]~36 .lut_mask = 16'h66EE;
defparam \bms_q[4][1]~36 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \bms_q[4][2]~38 (
	.dataa(\bms_q[3][2]~q ),
	.datab(\addtop_q[1][3][2]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\bms_q[4][1]~37 ),
	.combout(\bms_q[4][2]~38_combout ),
	.cout(\bms_q[4][2]~39 ));
defparam \bms_q[4][2]~38 .lut_mask = 16'h967F;
defparam \bms_q[4][2]~38 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add19~0 (
	.dataa(\bms_q[4][1]~q ),
	.datab(\addtop_q[1][2][1]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\Add19~0_combout ),
	.cout(\Add19~1 ));
defparam \Add19~0 .lut_mask = 16'h66EE;
defparam \Add19~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \bms_q[4][3]~40 (
	.dataa(\bms_q[3][3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\bms_q[4][2]~39 ),
	.combout(\bms_q[4][3]~40_combout ),
	.cout(\bms_q[4][3]~41 ));
defparam \bms_q[4][3]~40 .lut_mask = 16'h5AAF;
defparam \bms_q[4][3]~40 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \bms_q[4][4]~42 (
	.dataa(\bms_q[3][4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\bms_q[4][3]~41 ),
	.combout(\bms_q[4][4]~42_combout ),
	.cout(\bms_q[4][4]~43 ));
defparam \bms_q[4][4]~42 .lut_mask = 16'h5A5F;
defparam \bms_q[4][4]~42 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \bms_q[4][5]~44 (
	.dataa(\bms_q[3][5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\bms_q[4][4]~43 ),
	.combout(\bms_q[4][5]~44_combout ),
	.cout(\bms_q[4][5]~45 ));
defparam \bms_q[4][5]~44 .lut_mask = 16'h5AAF;
defparam \bms_q[4][5]~44 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \bms_q[4][6]~46 (
	.dataa(\bms_q[3][6]~q ),
	.datab(\overhold_and_q[3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(\bms_q[4][5]~45 ),
	.combout(\bms_q[4][6]~46_combout ),
	.cout());
defparam \bms_q[4][6]~46 .lut_mask = 16'h9696;
defparam \bms_q[4][6]~46 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add19~2 (
	.dataa(\bms_q[4][2]~q ),
	.datab(\addtop_q[1][2][2]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add19~1 ),
	.combout(\Add19~2_combout ),
	.cout(\Add19~3 ));
defparam \Add19~2 .lut_mask = 16'h967F;
defparam \Add19~2 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add19~4 (
	.dataa(\bms_q[4][3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add19~3 ),
	.combout(\Add19~4_combout ),
	.cout(\Add19~5 ));
defparam \Add19~4 .lut_mask = 16'h5AAF;
defparam \Add19~4 .sum_lutc_input = "cin";

dffeas \bms_q[4][3] (
	.clk(clk),
	.d(\bms_q[4][3]~40_combout ),
	.asdata(\Add19~4_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add21~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[4][3]~q ),
	.prn(vcc));
defparam \bms_q[4][3] .is_wysiwyg = "true";
defparam \bms_q[4][3] .power_up = "low";

cycloneiii_lcell_comb \Add19~6 (
	.dataa(\bms_q[4][4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add19~5 ),
	.combout(\Add19~6_combout ),
	.cout(\Add19~7 ));
defparam \Add19~6 .lut_mask = 16'h5A5F;
defparam \Add19~6 .sum_lutc_input = "cin";

dffeas \bms_q[4][4] (
	.clk(clk),
	.d(\bms_q[4][4]~42_combout ),
	.asdata(\Add19~6_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add21~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[4][4]~q ),
	.prn(vcc));
defparam \bms_q[4][4] .is_wysiwyg = "true";
defparam \bms_q[4][4] .power_up = "low";

cycloneiii_lcell_comb \Add19~8 (
	.dataa(\bms_q[4][5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add19~7 ),
	.combout(\Add19~8_combout ),
	.cout(\Add19~9 ));
defparam \Add19~8 .lut_mask = 16'h5AAF;
defparam \Add19~8 .sum_lutc_input = "cin";

dffeas \bms_q[4][5] (
	.clk(clk),
	.d(\bms_q[4][5]~44_combout ),
	.asdata(\Add19~8_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add21~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[4][5]~q ),
	.prn(vcc));
defparam \bms_q[4][5] .is_wysiwyg = "true";
defparam \bms_q[4][5] .power_up = "low";

cycloneiii_lcell_comb \Add19~10 (
	.dataa(\bms_q[4][6]~q ),
	.datab(\overhold_and_q[3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add19~9 ),
	.combout(\Add19~10_combout ),
	.cout());
defparam \Add19~10 .lut_mask = 16'h9696;
defparam \Add19~10 .sum_lutc_input = "cin";

dffeas \bms_q[4][6] (
	.clk(clk),
	.d(\bms_q[4][6]~46_combout ),
	.asdata(\Add19~10_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add21~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[4][6]~q ),
	.prn(vcc));
defparam \bms_q[4][6] .is_wysiwyg = "true";
defparam \bms_q[4][6] .power_up = "low";

cycloneiii_lcell_comb \Add20~0 (
	.dataa(\bms_q[4][1]~q ),
	.datab(\bms_q[3][1]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\Add20~0_combout ),
	.cout(\Add20~1 ));
defparam \Add20~0 .lut_mask = 16'h66DD;
defparam \Add20~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add20~2 (
	.dataa(\bms_q[4][2]~q ),
	.datab(\bms_q[3][2]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add20~1 ),
	.combout(\Add20~2_combout ),
	.cout(\Add20~3 ));
defparam \Add20~2 .lut_mask = 16'h96BF;
defparam \Add20~2 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add20~4 (
	.dataa(\bms_q[4][3]~q ),
	.datab(\bms_q[3][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add20~3 ),
	.combout(\Add20~4_combout ),
	.cout(\Add20~5 ));
defparam \Add20~4 .lut_mask = 16'h96DF;
defparam \Add20~4 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add20~6 (
	.dataa(\bms_q[4][4]~q ),
	.datab(\bms_q[3][4]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add20~5 ),
	.combout(\Add20~6_combout ),
	.cout(\Add20~7 ));
defparam \Add20~6 .lut_mask = 16'h96BF;
defparam \Add20~6 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add20~8 (
	.dataa(\bms_q[4][5]~q ),
	.datab(\bms_q[3][5]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add20~7 ),
	.combout(\Add20~8_combout ),
	.cout(\Add20~9 ));
defparam \Add20~8 .lut_mask = 16'h96DF;
defparam \Add20~8 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add20~10 (
	.dataa(\bms_q[4][6]~q ),
	.datab(\bms_q[3][6]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add20~9 ),
	.combout(\Add20~10_combout ),
	.cout(\Add20~11 ));
defparam \Add20~10 .lut_mask = 16'h96BF;
defparam \Add20~10 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add20~12 (
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add20~11 ),
	.combout(\Add20~12_combout ),
	.cout());
defparam \Add20~12 .lut_mask = 16'h0F0F;
defparam \Add20~12 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add7~0 (
	.dataa(\rrffa_q[1][2]~q ),
	.datab(\rrffa_q[2][1]~q ),
	.datac(\rrffa_q[2][2]~q ),
	.datad(\rrffa_q[1][1]~q ),
	.cin(gnd),
	.combout(\Add7~0_combout ),
	.cout());
defparam \Add7~0 .lut_mask = 16'hFF7B;
defparam \Add7~0 .sum_lutc_input = "datac";

dffeas \bmdiff_mux_q[4][3] (
	.clk(clk),
	.d(\Add7~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\bmdiff_mux_q[4][3]~q ),
	.prn(vcc));
defparam \bmdiff_mux_q[4][3] .is_wysiwyg = "true";
defparam \bmdiff_mux_q[4][3] .power_up = "low";

cycloneiii_lcell_comb \Add7~1 (
	.dataa(\rrffa_q[1][2]~q ),
	.datab(\rrffa_q[2][1]~q ),
	.datac(\rrffa_q[2][2]~q ),
	.datad(\rrffa_q[1][1]~q ),
	.cin(gnd),
	.combout(\Add7~1_combout ),
	.cout());
defparam \Add7~1 .lut_mask = 16'h6996;
defparam \Add7~1 .sum_lutc_input = "datac";

dffeas \bmdiff_mux_q[4][2] (
	.clk(clk),
	.d(\Add7~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\bmdiff_mux_q[4][2]~q ),
	.prn(vcc));
defparam \bmdiff_mux_q[4][2] .is_wysiwyg = "true";
defparam \bmdiff_mux_q[4][2] .power_up = "low";

cycloneiii_lcell_comb \Add6~2 (
	.dataa(gnd),
	.datab(gnd),
	.datac(\rrffa_q[1][2]~q ),
	.datad(\rrffa_q[2][2]~q ),
	.cin(gnd),
	.combout(\Add6~2_combout ),
	.cout());
defparam \Add6~2 .lut_mask = 16'h0FF0;
defparam \Add6~2 .sum_lutc_input = "datac";

dffeas \bmdiff_mux_q[4][1] (
	.clk(clk),
	.d(\Add6~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\bmdiff_mux_q[4][1]~q ),
	.prn(vcc));
defparam \bmdiff_mux_q[4][1] .is_wysiwyg = "true";
defparam \bmdiff_mux_q[4][1] .power_up = "low";

cycloneiii_lcell_comb \Add21~1 (
	.dataa(\Add20~0_combout ),
	.datab(\bmdiff_mux_q[4][1]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(),
	.cout(\Add21~1_cout ));
defparam \Add21~1 .lut_mask = 16'h00EE;
defparam \Add21~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add21~3 (
	.dataa(\Add20~2_combout ),
	.datab(\bmdiff_mux_q[4][2]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add21~1_cout ),
	.combout(),
	.cout(\Add21~3_cout ));
defparam \Add21~3 .lut_mask = 16'h007F;
defparam \Add21~3 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add21~5 (
	.dataa(\Add20~4_combout ),
	.datab(\bmdiff_mux_q[4][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add21~3_cout ),
	.combout(),
	.cout(\Add21~5_cout ));
defparam \Add21~5 .lut_mask = 16'h00EF;
defparam \Add21~5 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add21~7 (
	.dataa(\Add20~6_combout ),
	.datab(\bmdiff_mux_q[4][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add21~5_cout ),
	.combout(),
	.cout(\Add21~7_cout ));
defparam \Add21~7 .lut_mask = 16'h007F;
defparam \Add21~7 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add21~9 (
	.dataa(\Add20~8_combout ),
	.datab(\bmdiff_mux_q[4][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add21~7_cout ),
	.combout(),
	.cout(\Add21~9_cout ));
defparam \Add21~9 .lut_mask = 16'h00EF;
defparam \Add21~9 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add21~11 (
	.dataa(\Add20~10_combout ),
	.datab(\bmdiff_mux_q[4][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add21~9_cout ),
	.combout(),
	.cout(\Add21~11_cout ));
defparam \Add21~11 .lut_mask = 16'h007F;
defparam \Add21~11 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add21~13 (
	.dataa(\Add20~12_combout ),
	.datab(\bmdiff_mux_q[4][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add21~11_cout ),
	.combout(),
	.cout(\Add21~13_cout ));
defparam \Add21~13 .lut_mask = 16'h00DF;
defparam \Add21~13 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add21~14 (
	.dataa(\Add20~12_combout ),
	.datab(\bmdiff_mux_q[4][3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add21~13_cout ),
	.combout(\Add21~14_combout ),
	.cout());
defparam \Add21~14 .lut_mask = 16'h9696;
defparam \Add21~14 .sum_lutc_input = "cin";

dffeas \bms_q[4][1] (
	.clk(clk),
	.d(\bms_q[4][1]~36_combout ),
	.asdata(\Add19~0_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add21~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[4][1]~q ),
	.prn(vcc));
defparam \bms_q[4][1] .is_wysiwyg = "true";
defparam \bms_q[4][1] .power_up = "low";

dffeas \bms_q[4][2] (
	.clk(clk),
	.d(\bms_q[4][2]~38_combout ),
	.asdata(\Add19~2_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add21~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[4][2]~q ),
	.prn(vcc));
defparam \bms_q[4][2] .is_wysiwyg = "true";
defparam \bms_q[4][2] .power_up = "low";

cycloneiii_lcell_comb \Add12~0 (
	.dataa(\bms_q[4][1]~q ),
	.datab(\addtop_q[1][3][1]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\Add12~0_combout ),
	.cout(\Add12~1 ));
defparam \Add12~0 .lut_mask = 16'h66EE;
defparam \Add12~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add12~2 (
	.dataa(\bms_q[4][2]~q ),
	.datab(\addtop_q[1][3][2]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add12~1 ),
	.combout(\Add12~2_combout ),
	.cout(\Add12~3 ));
defparam \Add12~2 .lut_mask = 16'h967F;
defparam \Add12~2 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add5~0 (
	.dataa(\rrffa_q[2][2]~q ),
	.datab(\rrffa_q[1][1]~q ),
	.datac(\rrffa_q[1][2]~q ),
	.datad(\rrffa_q[2][1]~q ),
	.cin(gnd),
	.combout(\Add5~0_combout ),
	.cout());
defparam \Add5~0 .lut_mask = 16'hFF7B;
defparam \Add5~0 .sum_lutc_input = "datac";

dffeas \bmdiff_mux_q[2][3] (
	.clk(clk),
	.d(\Add5~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\bmdiff_mux_q[2][3]~q ),
	.prn(vcc));
defparam \bmdiff_mux_q[2][3] .is_wysiwyg = "true";
defparam \bmdiff_mux_q[2][3] .power_up = "low";

cycloneiii_lcell_comb \Add5~1 (
	.dataa(\rrffa_q[2][2]~q ),
	.datab(\rrffa_q[1][1]~q ),
	.datac(\rrffa_q[1][2]~q ),
	.datad(\rrffa_q[2][1]~q ),
	.cin(gnd),
	.combout(\Add5~1_combout ),
	.cout());
defparam \Add5~1 .lut_mask = 16'h6996;
defparam \Add5~1 .sum_lutc_input = "datac";

dffeas \bmdiff_mux_q[2][2] (
	.clk(clk),
	.d(\Add5~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\bmdiff_mux_q[2][2]~q ),
	.prn(vcc));
defparam \bmdiff_mux_q[2][2] .is_wysiwyg = "true";
defparam \bmdiff_mux_q[2][2] .power_up = "low";

cycloneiii_lcell_comb \Add13~1 (
	.dataa(\Add20~0_combout ),
	.datab(\bmdiff_mux_q[4][1]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(),
	.cout(\Add13~1_cout ));
defparam \Add13~1 .lut_mask = 16'h00EE;
defparam \Add13~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add13~3 (
	.dataa(\Add20~2_combout ),
	.datab(\bmdiff_mux_q[2][2]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add13~1_cout ),
	.combout(),
	.cout(\Add13~3_cout ));
defparam \Add13~3 .lut_mask = 16'h007F;
defparam \Add13~3 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add13~5 (
	.dataa(\Add20~4_combout ),
	.datab(\bmdiff_mux_q[2][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add13~3_cout ),
	.combout(),
	.cout(\Add13~5_cout ));
defparam \Add13~5 .lut_mask = 16'h00EF;
defparam \Add13~5 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add13~7 (
	.dataa(\Add20~6_combout ),
	.datab(\bmdiff_mux_q[2][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add13~5_cout ),
	.combout(),
	.cout(\Add13~7_cout ));
defparam \Add13~7 .lut_mask = 16'h007F;
defparam \Add13~7 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add13~9 (
	.dataa(\Add20~8_combout ),
	.datab(\bmdiff_mux_q[2][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add13~7_cout ),
	.combout(),
	.cout(\Add13~9_cout ));
defparam \Add13~9 .lut_mask = 16'h00EF;
defparam \Add13~9 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add13~11 (
	.dataa(\Add20~10_combout ),
	.datab(\bmdiff_mux_q[2][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add13~9_cout ),
	.combout(),
	.cout(\Add13~11_cout ));
defparam \Add13~11 .lut_mask = 16'h007F;
defparam \Add13~11 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add13~13 (
	.dataa(\Add20~12_combout ),
	.datab(\bmdiff_mux_q[2][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add13~11_cout ),
	.combout(),
	.cout(\Add13~13_cout ));
defparam \Add13~13 .lut_mask = 16'h00DF;
defparam \Add13~13 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add13~14 (
	.dataa(\Add20~12_combout ),
	.datab(\bmdiff_mux_q[2][3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add13~13_cout ),
	.combout(\Add13~14_combout ),
	.cout());
defparam \Add13~14 .lut_mask = 16'h9696;
defparam \Add13~14 .sum_lutc_input = "cin";

dffeas \bms_q[2][2] (
	.clk(clk),
	.d(\bms_q[2][2]~62_combout ),
	.asdata(\Add12~2_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add13~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[2][2]~q ),
	.prn(vcc));
defparam \bms_q[2][2] .is_wysiwyg = "true";
defparam \bms_q[2][2] .power_up = "low";

cycloneiii_lcell_comb \Add15~2 (
	.dataa(\bms_q[2][2]~q ),
	.datab(\addtop_q[1][1][2]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add15~1 ),
	.combout(\Add15~2_combout ),
	.cout(\Add15~3 ));
defparam \Add15~2 .lut_mask = 16'h967F;
defparam \Add15~2 .sum_lutc_input = "cin";

dffeas \bms_q[3][2] (
	.clk(clk),
	.d(\bms_q[3][2]~26_combout ),
	.asdata(\Add15~2_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add17~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[3][2]~q ),
	.prn(vcc));
defparam \bms_q[3][2] .is_wysiwyg = "true";
defparam \bms_q[3][2] .power_up = "low";

cycloneiii_lcell_comb \bms_q[2][3]~64 (
	.dataa(\bms_q[3][3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\bms_q[2][2]~63 ),
	.combout(\bms_q[2][3]~64_combout ),
	.cout(\bms_q[2][3]~65 ));
defparam \bms_q[2][3]~64 .lut_mask = 16'h5AAF;
defparam \bms_q[2][3]~64 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add12~4 (
	.dataa(\bms_q[4][3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add12~3 ),
	.combout(\Add12~4_combout ),
	.cout(\Add12~5 ));
defparam \Add12~4 .lut_mask = 16'h5AAF;
defparam \Add12~4 .sum_lutc_input = "cin";

dffeas \bms_q[2][3] (
	.clk(clk),
	.d(\bms_q[2][3]~64_combout ),
	.asdata(\Add12~4_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add13~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[2][3]~q ),
	.prn(vcc));
defparam \bms_q[2][3] .is_wysiwyg = "true";
defparam \bms_q[2][3] .power_up = "low";

cycloneiii_lcell_comb \Add15~4 (
	.dataa(\bms_q[2][3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add15~3 ),
	.combout(\Add15~4_combout ),
	.cout(\Add15~5 ));
defparam \Add15~4 .lut_mask = 16'h5AAF;
defparam \Add15~4 .sum_lutc_input = "cin";

dffeas \bms_q[3][3] (
	.clk(clk),
	.d(\bms_q[3][3]~28_combout ),
	.asdata(\Add15~4_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add17~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[3][3]~q ),
	.prn(vcc));
defparam \bms_q[3][3] .is_wysiwyg = "true";
defparam \bms_q[3][3] .power_up = "low";

cycloneiii_lcell_comb \bms_q[2][4]~66 (
	.dataa(\bms_q[3][4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\bms_q[2][3]~65 ),
	.combout(\bms_q[2][4]~66_combout ),
	.cout(\bms_q[2][4]~67 ));
defparam \bms_q[2][4]~66 .lut_mask = 16'h5A5F;
defparam \bms_q[2][4]~66 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add12~6 (
	.dataa(\bms_q[4][4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add12~5 ),
	.combout(\Add12~6_combout ),
	.cout(\Add12~7 ));
defparam \Add12~6 .lut_mask = 16'h5A5F;
defparam \Add12~6 .sum_lutc_input = "cin";

dffeas \bms_q[2][4] (
	.clk(clk),
	.d(\bms_q[2][4]~66_combout ),
	.asdata(\Add12~6_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add13~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[2][4]~q ),
	.prn(vcc));
defparam \bms_q[2][4] .is_wysiwyg = "true";
defparam \bms_q[2][4] .power_up = "low";

cycloneiii_lcell_comb \Add15~6 (
	.dataa(\bms_q[2][4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add15~5 ),
	.combout(\Add15~6_combout ),
	.cout(\Add15~7 ));
defparam \Add15~6 .lut_mask = 16'h5A5F;
defparam \Add15~6 .sum_lutc_input = "cin";

dffeas \bms_q[3][4] (
	.clk(clk),
	.d(\bms_q[3][4]~30_combout ),
	.asdata(\Add15~6_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add17~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[3][4]~q ),
	.prn(vcc));
defparam \bms_q[3][4] .is_wysiwyg = "true";
defparam \bms_q[3][4] .power_up = "low";

cycloneiii_lcell_comb \bms_q[2][5]~68 (
	.dataa(\bms_q[3][5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\bms_q[2][4]~67 ),
	.combout(\bms_q[2][5]~68_combout ),
	.cout(\bms_q[2][5]~69 ));
defparam \bms_q[2][5]~68 .lut_mask = 16'h5AAF;
defparam \bms_q[2][5]~68 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add12~8 (
	.dataa(\bms_q[4][5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add12~7 ),
	.combout(\Add12~8_combout ),
	.cout(\Add12~9 ));
defparam \Add12~8 .lut_mask = 16'h5AAF;
defparam \Add12~8 .sum_lutc_input = "cin";

dffeas \bms_q[2][5] (
	.clk(clk),
	.d(\bms_q[2][5]~68_combout ),
	.asdata(\Add12~8_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add13~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[2][5]~q ),
	.prn(vcc));
defparam \bms_q[2][5] .is_wysiwyg = "true";
defparam \bms_q[2][5] .power_up = "low";

cycloneiii_lcell_comb \Add15~8 (
	.dataa(\bms_q[2][5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add15~7 ),
	.combout(\Add15~8_combout ),
	.cout(\Add15~9 ));
defparam \Add15~8 .lut_mask = 16'h5AAF;
defparam \Add15~8 .sum_lutc_input = "cin";

dffeas \bms_q[3][5] (
	.clk(clk),
	.d(\bms_q[3][5]~32_combout ),
	.asdata(\Add15~8_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add17~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[3][5]~q ),
	.prn(vcc));
defparam \bms_q[3][5] .is_wysiwyg = "true";
defparam \bms_q[3][5] .power_up = "low";

cycloneiii_lcell_comb \bms_q[2][6]~70 (
	.dataa(\bms_q[3][6]~q ),
	.datab(\overhold_and_q[3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(\bms_q[2][5]~69 ),
	.combout(\bms_q[2][6]~70_combout ),
	.cout());
defparam \bms_q[2][6]~70 .lut_mask = 16'h9696;
defparam \bms_q[2][6]~70 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add12~10 (
	.dataa(\bms_q[4][6]~q ),
	.datab(\overhold_and_q[3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add12~9 ),
	.combout(\Add12~10_combout ),
	.cout());
defparam \Add12~10 .lut_mask = 16'h9696;
defparam \Add12~10 .sum_lutc_input = "cin";

dffeas \bms_q[2][6] (
	.clk(clk),
	.d(\bms_q[2][6]~70_combout ),
	.asdata(\Add12~10_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add13~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[2][6]~q ),
	.prn(vcc));
defparam \bms_q[2][6] .is_wysiwyg = "true";
defparam \bms_q[2][6] .power_up = "low";

cycloneiii_lcell_comb \Add16~0 (
	.dataa(\bms_q[2][1]~q ),
	.datab(\bms_q[1][1]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\Add16~0_combout ),
	.cout(\Add16~1 ));
defparam \Add16~0 .lut_mask = 16'h66DD;
defparam \Add16~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add16~2 (
	.dataa(\bms_q[2][2]~q ),
	.datab(\bms_q[1][2]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add16~1 ),
	.combout(\Add16~2_combout ),
	.cout(\Add16~3 ));
defparam \Add16~2 .lut_mask = 16'h96BF;
defparam \Add16~2 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add16~4 (
	.dataa(\bms_q[2][3]~q ),
	.datab(\bms_q[1][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add16~3 ),
	.combout(\Add16~4_combout ),
	.cout(\Add16~5 ));
defparam \Add16~4 .lut_mask = 16'h96DF;
defparam \Add16~4 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add16~6 (
	.dataa(\bms_q[2][4]~q ),
	.datab(\bms_q[1][4]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add16~5 ),
	.combout(\Add16~6_combout ),
	.cout(\Add16~7 ));
defparam \Add16~6 .lut_mask = 16'h96BF;
defparam \Add16~6 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add16~8 (
	.dataa(\bms_q[2][5]~q ),
	.datab(\bms_q[1][5]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add16~7 ),
	.combout(\Add16~8_combout ),
	.cout(\Add16~9 ));
defparam \Add16~8 .lut_mask = 16'h967F;
defparam \Add16~8 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add16~10 (
	.dataa(\bms_q[2][6]~q ),
	.datab(\bms_q[1][6]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add16~9 ),
	.combout(\Add16~10_combout ),
	.cout(\Add16~11 ));
defparam \Add16~10 .lut_mask = 16'h96BF;
defparam \Add16~10 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add16~12 (
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add16~11 ),
	.combout(\Add16~12_combout ),
	.cout());
defparam \Add16~12 .lut_mask = 16'h0F0F;
defparam \Add16~12 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add6~0 (
	.dataa(\rrffa_q[1][1]~q ),
	.datab(\rrffa_q[1][2]~q ),
	.datac(\rrffa_q[2][1]~q ),
	.datad(\rrffa_q[2][2]~q ),
	.cin(gnd),
	.combout(\Add6~0_combout ),
	.cout());
defparam \Add6~0 .lut_mask = 16'h7FDF;
defparam \Add6~0 .sum_lutc_input = "datac";

dffeas \bmdiff_mux_q[3][3] (
	.clk(clk),
	.d(\Add6~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\bmdiff_mux_q[3][3]~q ),
	.prn(vcc));
defparam \bmdiff_mux_q[3][3] .is_wysiwyg = "true";
defparam \bmdiff_mux_q[3][3] .power_up = "low";

cycloneiii_lcell_comb \Add6~1 (
	.dataa(\rrffa_q[2][1]~q ),
	.datab(\rrffa_q[1][1]~q ),
	.datac(\rrffa_q[1][2]~q ),
	.datad(\rrffa_q[2][2]~q ),
	.cin(gnd),
	.combout(\Add6~1_combout ),
	.cout());
defparam \Add6~1 .lut_mask = 16'h6996;
defparam \Add6~1 .sum_lutc_input = "datac";

dffeas \bmdiff_mux_q[3][2] (
	.clk(clk),
	.d(\Add6~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\bmdiff_mux_q[3][2]~q ),
	.prn(vcc));
defparam \bmdiff_mux_q[3][2] .is_wysiwyg = "true";
defparam \bmdiff_mux_q[3][2] .power_up = "low";

dffeas \bmdiff_mux_q[3][1] (
	.clk(clk),
	.d(\Add6~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\bmdiff_mux_q[3][1]~q ),
	.prn(vcc));
defparam \bmdiff_mux_q[3][1] .is_wysiwyg = "true";
defparam \bmdiff_mux_q[3][1] .power_up = "low";

cycloneiii_lcell_comb \Add17~1 (
	.dataa(\Add16~0_combout ),
	.datab(\bmdiff_mux_q[3][1]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(),
	.cout(\Add17~1_cout ));
defparam \Add17~1 .lut_mask = 16'h00EE;
defparam \Add17~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add17~3 (
	.dataa(\Add16~2_combout ),
	.datab(\bmdiff_mux_q[3][2]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add17~1_cout ),
	.combout(),
	.cout(\Add17~3_cout ));
defparam \Add17~3 .lut_mask = 16'h007F;
defparam \Add17~3 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add17~5 (
	.dataa(\Add16~4_combout ),
	.datab(\bmdiff_mux_q[3][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add17~3_cout ),
	.combout(),
	.cout(\Add17~5_cout ));
defparam \Add17~5 .lut_mask = 16'h00EF;
defparam \Add17~5 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add17~7 (
	.dataa(\Add16~6_combout ),
	.datab(\bmdiff_mux_q[3][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add17~5_cout ),
	.combout(),
	.cout(\Add17~7_cout ));
defparam \Add17~7 .lut_mask = 16'h007F;
defparam \Add17~7 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add17~9 (
	.dataa(\Add16~8_combout ),
	.datab(\bmdiff_mux_q[3][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add17~7_cout ),
	.combout(),
	.cout(\Add17~9_cout ));
defparam \Add17~9 .lut_mask = 16'h00EF;
defparam \Add17~9 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add17~11 (
	.dataa(\Add16~10_combout ),
	.datab(\bmdiff_mux_q[3][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add17~9_cout ),
	.combout(),
	.cout(\Add17~11_cout ));
defparam \Add17~11 .lut_mask = 16'h007F;
defparam \Add17~11 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add17~13 (
	.dataa(\Add16~12_combout ),
	.datab(\bmdiff_mux_q[3][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add17~11_cout ),
	.combout(),
	.cout(\Add17~13_cout ));
defparam \Add17~13 .lut_mask = 16'h00DF;
defparam \Add17~13 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add17~14 (
	.dataa(\Add16~12_combout ),
	.datab(\bmdiff_mux_q[3][3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add17~13_cout ),
	.combout(\Add17~14_combout ),
	.cout());
defparam \Add17~14 .lut_mask = 16'h9696;
defparam \Add17~14 .sum_lutc_input = "cin";

dffeas \bms_q[3][1] (
	.clk(clk),
	.d(\bms_q[3][1]~24_combout ),
	.asdata(\Add15~0_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add17~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[3][1]~q ),
	.prn(vcc));
defparam \bms_q[3][1] .is_wysiwyg = "true";
defparam \bms_q[3][1] .power_up = "low";

dffeas \bms_q[2][1] (
	.clk(clk),
	.d(\bms_q[2][1]~60_combout ),
	.asdata(\Add12~0_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add13~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[2][1]~q ),
	.prn(vcc));
defparam \bms_q[2][1] .is_wysiwyg = "true";
defparam \bms_q[2][1] .power_up = "low";

cycloneiii_lcell_comb \Add9~0 (
	.dataa(\bms_q[2][1]~q ),
	.datab(\addtop_q[1][4][1]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\Add9~0_combout ),
	.cout(\Add9~1 ));
defparam \Add9~0 .lut_mask = 16'h66EE;
defparam \Add9~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add4~0 (
	.dataa(\rrffa_q[1][2]~q ),
	.datab(\rrffa_q[2][2]~q ),
	.datac(\rrffa_q[2][1]~q ),
	.datad(\rrffa_q[1][1]~q ),
	.cin(gnd),
	.combout(\Add4~0_combout ),
	.cout());
defparam \Add4~0 .lut_mask = 16'hFFF6;
defparam \Add4~0 .sum_lutc_input = "datac";

dffeas \bmdiff_mux_q[1][3] (
	.clk(clk),
	.d(\Add4~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\bmdiff_mux_q[1][3]~q ),
	.prn(vcc));
defparam \bmdiff_mux_q[1][3] .is_wysiwyg = "true";
defparam \bmdiff_mux_q[1][3] .power_up = "low";

cycloneiii_lcell_comb \Add4~1 (
	.dataa(\rrffa_q[1][1]~q ),
	.datab(\rrffa_q[2][1]~q ),
	.datac(\rrffa_q[1][2]~q ),
	.datad(\rrffa_q[2][2]~q ),
	.cin(gnd),
	.combout(\Add4~1_combout ),
	.cout());
defparam \Add4~1 .lut_mask = 16'h6996;
defparam \Add4~1 .sum_lutc_input = "datac";

dffeas \bmdiff_mux_q[1][2] (
	.clk(clk),
	.d(\Add4~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[2]~q ),
	.q(\bmdiff_mux_q[1][2]~q ),
	.prn(vcc));
defparam \bmdiff_mux_q[1][2] .is_wysiwyg = "true";
defparam \bmdiff_mux_q[1][2] .power_up = "low";

cycloneiii_lcell_comb \Add10~1 (
	.dataa(\Add16~0_combout ),
	.datab(\bmdiff_mux_q[3][1]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(),
	.cout(\Add10~1_cout ));
defparam \Add10~1 .lut_mask = 16'h00EE;
defparam \Add10~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add10~3 (
	.dataa(\Add16~2_combout ),
	.datab(\bmdiff_mux_q[1][2]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add10~1_cout ),
	.combout(),
	.cout(\Add10~3_cout ));
defparam \Add10~3 .lut_mask = 16'h007F;
defparam \Add10~3 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add10~5 (
	.dataa(\Add16~4_combout ),
	.datab(\bmdiff_mux_q[1][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add10~3_cout ),
	.combout(),
	.cout(\Add10~5_cout ));
defparam \Add10~5 .lut_mask = 16'h00EF;
defparam \Add10~5 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add10~7 (
	.dataa(\Add16~6_combout ),
	.datab(\bmdiff_mux_q[1][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add10~5_cout ),
	.combout(),
	.cout(\Add10~7_cout ));
defparam \Add10~7 .lut_mask = 16'h007F;
defparam \Add10~7 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add10~9 (
	.dataa(\Add16~8_combout ),
	.datab(\bmdiff_mux_q[1][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add10~7_cout ),
	.combout(),
	.cout(\Add10~9_cout ));
defparam \Add10~9 .lut_mask = 16'h00EF;
defparam \Add10~9 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add10~11 (
	.dataa(\Add16~10_combout ),
	.datab(\bmdiff_mux_q[1][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add10~9_cout ),
	.combout(),
	.cout(\Add10~11_cout ));
defparam \Add10~11 .lut_mask = 16'h007F;
defparam \Add10~11 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add10~13 (
	.dataa(\Add16~12_combout ),
	.datab(\bmdiff_mux_q[1][3]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add10~11_cout ),
	.combout(),
	.cout(\Add10~13_cout ));
defparam \Add10~13 .lut_mask = 16'h00DF;
defparam \Add10~13 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add10~14 (
	.dataa(\Add16~12_combout ),
	.datab(\bmdiff_mux_q[1][3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add10~13_cout ),
	.combout(\Add10~14_combout ),
	.cout());
defparam \Add10~14 .lut_mask = 16'h9696;
defparam \Add10~14 .sum_lutc_input = "cin";

dffeas \bms_q[1][1] (
	.clk(clk),
	.d(\bms_q[1][1]~48_combout ),
	.asdata(\Add9~0_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add10~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[1][1]~q ),
	.prn(vcc));
defparam \bms_q[1][1] .is_wysiwyg = "true";
defparam \bms_q[1][1] .power_up = "low";

cycloneiii_lcell_comb \bms_q[1][2]~50 (
	.dataa(\bms_q[1][2]~q ),
	.datab(\addtop_q[1][1][2]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\bms_q[1][1]~49 ),
	.combout(\bms_q[1][2]~50_combout ),
	.cout(\bms_q[1][2]~51 ));
defparam \bms_q[1][2]~50 .lut_mask = 16'h967F;
defparam \bms_q[1][2]~50 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add9~2 (
	.dataa(\bms_q[2][2]~q ),
	.datab(\addtop_q[1][4][2]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add9~1 ),
	.combout(\Add9~2_combout ),
	.cout(\Add9~3 ));
defparam \Add9~2 .lut_mask = 16'h967F;
defparam \Add9~2 .sum_lutc_input = "cin";

dffeas \bms_q[1][2] (
	.clk(clk),
	.d(\bms_q[1][2]~50_combout ),
	.asdata(\Add9~2_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add10~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[1][2]~q ),
	.prn(vcc));
defparam \bms_q[1][2] .is_wysiwyg = "true";
defparam \bms_q[1][2] .power_up = "low";

cycloneiii_lcell_comb \bms_q[1][3]~52 (
	.dataa(\bms_q[1][3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\bms_q[1][2]~51 ),
	.combout(\bms_q[1][3]~52_combout ),
	.cout(\bms_q[1][3]~53 ));
defparam \bms_q[1][3]~52 .lut_mask = 16'h5AAF;
defparam \bms_q[1][3]~52 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add9~4 (
	.dataa(\bms_q[2][3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add9~3 ),
	.combout(\Add9~4_combout ),
	.cout(\Add9~5 ));
defparam \Add9~4 .lut_mask = 16'h5AAF;
defparam \Add9~4 .sum_lutc_input = "cin";

dffeas \bms_q[1][3] (
	.clk(clk),
	.d(\bms_q[1][3]~52_combout ),
	.asdata(\Add9~4_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add10~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[1][3]~q ),
	.prn(vcc));
defparam \bms_q[1][3] .is_wysiwyg = "true";
defparam \bms_q[1][3] .power_up = "low";

cycloneiii_lcell_comb \bms_q[1][4]~54 (
	.dataa(\bms_q[1][4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\bms_q[1][3]~53 ),
	.combout(\bms_q[1][4]~54_combout ),
	.cout(\bms_q[1][4]~55 ));
defparam \bms_q[1][4]~54 .lut_mask = 16'h5A5F;
defparam \bms_q[1][4]~54 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add9~6 (
	.dataa(\bms_q[2][4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add9~5 ),
	.combout(\Add9~6_combout ),
	.cout(\Add9~7 ));
defparam \Add9~6 .lut_mask = 16'h5A5F;
defparam \Add9~6 .sum_lutc_input = "cin";

dffeas \bms_q[1][4] (
	.clk(clk),
	.d(\bms_q[1][4]~54_combout ),
	.asdata(\Add9~6_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add10~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[1][4]~q ),
	.prn(vcc));
defparam \bms_q[1][4] .is_wysiwyg = "true";
defparam \bms_q[1][4] .power_up = "low";

cycloneiii_lcell_comb \bms_q[1][5]~56 (
	.dataa(\bms_q[1][5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\bms_q[1][4]~55 ),
	.combout(\bms_q[1][5]~56_combout ),
	.cout(\bms_q[1][5]~57 ));
defparam \bms_q[1][5]~56 .lut_mask = 16'h5A5F;
defparam \bms_q[1][5]~56 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add9~8 (
	.dataa(\bms_q[2][5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add9~7 ),
	.combout(\Add9~8_combout ),
	.cout(\Add9~9 ));
defparam \Add9~8 .lut_mask = 16'h5AAF;
defparam \Add9~8 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add9~8_wirecell (
	.dataa(\Add9~8_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\Add9~8_wirecell_combout ),
	.cout());
defparam \Add9~8_wirecell .lut_mask = 16'h5555;
defparam \Add9~8_wirecell .sum_lutc_input = "datac";

dffeas \bms_q[1][5] (
	.clk(clk),
	.d(\bms_q[1][5]~56_combout ),
	.asdata(\Add9~8_wirecell_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add10~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[1][5]~q ),
	.prn(vcc));
defparam \bms_q[1][5] .is_wysiwyg = "true";
defparam \bms_q[1][5] .power_up = "low";

cycloneiii_lcell_comb \bms_q[1][6]~58 (
	.dataa(\bms_q[1][6]~q ),
	.datab(\overhold_and_q[3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(\bms_q[1][5]~57 ),
	.combout(\bms_q[1][6]~58_combout ),
	.cout());
defparam \bms_q[1][6]~58 .lut_mask = 16'h9696;
defparam \bms_q[1][6]~58 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add9~10 (
	.dataa(\bms_q[2][6]~q ),
	.datab(\overhold_and_q[3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add9~9 ),
	.combout(\Add9~10_combout ),
	.cout());
defparam \Add9~10 .lut_mask = 16'h9696;
defparam \Add9~10 .sum_lutc_input = "cin";

dffeas \bms_q[1][6] (
	.clk(clk),
	.d(\bms_q[1][6]~58_combout ),
	.asdata(\Add9~10_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add10~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[1][6]~q ),
	.prn(vcc));
defparam \bms_q[1][6] .is_wysiwyg = "true";
defparam \bms_q[1][6] .power_up = "low";

cycloneiii_lcell_comb \bms_q[3][6]~34 (
	.dataa(\bms_q[1][6]~q ),
	.datab(\overhold_and_q[3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(\bms_q[3][5]~33 ),
	.combout(\bms_q[3][6]~34_combout ),
	.cout());
defparam \bms_q[3][6]~34 .lut_mask = 16'h9696;
defparam \bms_q[3][6]~34 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add15~10 (
	.dataa(\bms_q[2][6]~q ),
	.datab(\overhold_and_q[3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add15~9 ),
	.combout(\Add15~10_combout ),
	.cout());
defparam \Add15~10 .lut_mask = 16'h9696;
defparam \Add15~10 .sum_lutc_input = "cin";

dffeas \bms_q[3][6] (
	.clk(clk),
	.d(\bms_q[3][6]~34_combout ),
	.asdata(\Add15~10_combout ),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Add17~14_combout ),
	.ena(\val_sink_del[3]~q ),
	.q(\bms_q[3][6]~q ),
	.prn(vcc));
defparam \bms_q[3][6] .is_wysiwyg = "true";
defparam \bms_q[3][6] .power_up = "low";

cycloneiii_lcell_comb \overhold_and_q~1 (
	.dataa(\bms_q[3][6]~q ),
	.datab(\bms_q[4][6]~q ),
	.datac(gnd),
	.datad(\overhold_and_q[3]~q ),
	.cin(gnd),
	.combout(\overhold_and_q~1_combout ),
	.cout());
defparam \overhold_and_q~1 .lut_mask = 16'hEEFF;
defparam \overhold_and_q~1 .sum_lutc_input = "datac";

dffeas \overhold_and_q[2] (
	.clk(clk),
	.d(\overhold_and_q~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[3]~q ),
	.q(\overhold_and_q[2]~q ),
	.prn(vcc));
defparam \overhold_and_q[2] .is_wysiwyg = "true";
defparam \overhold_and_q[2] .power_up = "low";

cycloneiii_lcell_comb \overhold_and_q~2 (
	.dataa(\bms_q[1][6]~q ),
	.datab(\bms_q[2][6]~q ),
	.datac(gnd),
	.datad(\overhold_and_q[3]~q ),
	.cin(gnd),
	.combout(\overhold_and_q~2_combout ),
	.cout());
defparam \overhold_and_q~2 .lut_mask = 16'hEEFF;
defparam \overhold_and_q~2 .sum_lutc_input = "datac";

dffeas \overhold_and_q[1] (
	.clk(clk),
	.d(\overhold_and_q~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[3]~q ),
	.q(\overhold_and_q[1]~q ),
	.prn(vcc));
defparam \overhold_and_q[1] .is_wysiwyg = "true";
defparam \overhold_and_q[1] .power_up = "low";

cycloneiii_lcell_comb \overhold_and_q~0 (
	.dataa(\overhold_and_q[2]~q ),
	.datab(\overhold_and_q[1]~q ),
	.datac(gnd),
	.datad(\overhold_and_q[3]~q ),
	.cin(gnd),
	.combout(\overhold_and_q~0_combout ),
	.cout());
defparam \overhold_and_q~0 .lut_mask = 16'hEEFF;
defparam \overhold_and_q~0 .sum_lutc_input = "datac";

dffeas \overhold_and_q[3] (
	.clk(clk),
	.d(\overhold_and_q~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\val_sink_del[3]~q ),
	.q(\overhold_and_q[3]~q ),
	.prn(vcc));
defparam \overhold_and_q[3] .is_wysiwyg = "true";
defparam \overhold_and_q[3] .power_up = "low";

cycloneiii_lcell_comb \normalizations_int[1]~10 (
	.dataa(\val_sink_del[3]~q ),
	.datab(\overhold_and_q[3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\normalizations_int[1]~10_combout ),
	.cout());
defparam \normalizations_int[1]~10 .lut_mask = 16'hEEEE;
defparam \normalizations_int[1]~10 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \normalizations_int[3]~11 (
	.dataa(normalizations_int_3),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\normalizations_int[2]~9 ),
	.combout(\normalizations_int[3]~11_combout ),
	.cout(\normalizations_int[3]~12 ));
defparam \normalizations_int[3]~11 .lut_mask = 16'h5A5F;
defparam \normalizations_int[3]~11 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \normalizations_int[4]~13 (
	.dataa(normalizations_int_4),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\normalizations_int[3]~12 ),
	.combout(\normalizations_int[4]~13_combout ),
	.cout(\normalizations_int[4]~14 ));
defparam \normalizations_int[4]~13 .lut_mask = 16'h5AAF;
defparam \normalizations_int[4]~13 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \normalizations_int[5]~15 (
	.dataa(normalizations_int_5),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\normalizations_int[4]~14 ),
	.combout(\normalizations_int[5]~15_combout ),
	.cout(\normalizations_int[5]~16 ));
defparam \normalizations_int[5]~15 .lut_mask = 16'h5A5F;
defparam \normalizations_int[5]~15 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \normalizations_int[6]~17 (
	.dataa(normalizations_int_6),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\normalizations_int[5]~16 ),
	.combout(\normalizations_int[6]~17_combout ),
	.cout(\normalizations_int[6]~18 ));
defparam \normalizations_int[6]~17 .lut_mask = 16'h5AAF;
defparam \normalizations_int[6]~17 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \normalizations_int[7]~19 (
	.dataa(normalizations_int_7),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\normalizations_int[6]~18 ),
	.combout(\normalizations_int[7]~19_combout ),
	.cout(\normalizations_int[7]~20 ));
defparam \normalizations_int[7]~19 .lut_mask = 16'h5A5F;
defparam \normalizations_int[7]~19 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \normalizations_int[8]~21 (
	.dataa(normalizations_int_8),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(\normalizations_int[7]~20 ),
	.combout(\normalizations_int[8]~21_combout ),
	.cout());
defparam \normalizations_int[8]~21 .lut_mask = 16'h5A5A;
defparam \normalizations_int[8]~21 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \normalizations_int[1]~7 (
	.dataa(gnd),
	.datab(normalizations_int_1),
	.datac(\val_sink_del[3]~q ),
	.datad(\overhold_and_q[3]~q ),
	.cin(gnd),
	.combout(\normalizations_int[1]~7_combout ),
	.cout());
defparam \normalizations_int[1]~7 .lut_mask = 16'hC33C;
defparam \normalizations_int[1]~7 .sum_lutc_input = "datac";

endmodule

module viterbi_auk_vit_par_trb_atl (
	q_b_0,
	atl_buffer_stateout_hold,
	atl_buffer_stateS0,
	enable_source_int,
	outvalidnode_q1,
	survready,
	data_available,
	survive,
	clk,
	reset)/* synthesis synthesis_greybox=1 */;
output 	q_b_0;
input 	atl_buffer_stateout_hold;
input 	atl_buffer_stateS0;
input 	enable_source_int;
output 	outvalidnode_q1;
input 	survready;
output 	data_available;
input 	[4:1] survive;
input 	clk;
input 	reset;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \stoadd[5]~q ;
wire \stoadd[4]~q ;
wire \stoadd[6]~q ;
wire \stoadd[7]~q ;
wire \stoadd[3]~q ;
wire \stoadd[1]~q ;
wire \stoadd[2]~q ;
wire \Add9~1 ;
wire \Add9~0_combout ;
wire \Add7~1 ;
wire \Add7~0_combout ;
wire \Add7~3 ;
wire \Add7~2_combout ;
wire \Add10~1 ;
wire \Add10~0_combout ;
wire \Add9~3 ;
wire \Add9~2_combout ;
wire \Add7~5 ;
wire \Add7~4_combout ;
wire \Add10~3 ;
wire \Add10~2_combout ;
wire \Add9~5 ;
wire \Add9~4_combout ;
wire \Add7~7 ;
wire \Add7~6_combout ;
wire \Add10~5 ;
wire \Add10~4_combout ;
wire \Add8~1_cout ;
wire \Add8~3 ;
wire \Add8~2_combout ;
wire \Add9~7 ;
wire \Add9~6_combout ;
wire \Add7~9 ;
wire \Add7~8_combout ;
wire \Add10~7 ;
wire \Add10~6_combout ;
wire \Add8~5 ;
wire \Add8~4_combout ;
wire \Add9~9 ;
wire \Add9~8_combout ;
wire \Add7~11 ;
wire \Add7~10_combout ;
wire \Add10~9 ;
wire \Add10~8_combout ;
wire \Add8~7 ;
wire \Add8~6_combout ;
wire \Add9~11 ;
wire \Add9~10_combout ;
wire \Add7~12_combout ;
wire \Add10~10_combout ;
wire \Add8~8_combout ;
wire \Add9~12_combout ;
wire \sbot_RAM|auto_generated|q_b[1] ;
wire \sbot_RAM|auto_generated|q_b[3] ;
wire \stoadd[1]~8 ;
wire \stoadd[1]~7_combout ;
wire \stoadd[2]~10 ;
wire \stoadd[2]~9_combout ;
wire \stoadd[3]~12 ;
wire \stoadd[3]~11_combout ;
wire \stoadd[4]~14 ;
wire \stoadd[4]~13_combout ;
wire \stoadd[5]~16 ;
wire \stoadd[5]~15_combout ;
wire \stoadd[6]~18 ;
wire \stoadd[6]~17_combout ;
wire \stoadd[7]~19_combout ;
wire \stop_RAM|auto_generated|q_b[1] ;
wire \stop_RAM|auto_generated|q_b[3] ;
wire \sbot_RAM|auto_generated|q_b[2] ;
wire \sbot_RAM|auto_generated|q_b[0] ;
wire \stop_RAM|auto_generated|q_b[2] ;
wire \stop_RAM|auto_generated|q_b[0] ;
wire \Add3~1 ;
wire \Add3~0_combout ;
wire \Add4~1 ;
wire \Add4~0_combout ;
wire \Add4~3 ;
wire \Add4~2_combout ;
wire \Add4~5 ;
wire \Add4~4_combout ;
wire \Add4~7 ;
wire \Add4~6_combout ;
wire \Add4~9 ;
wire \Add4~8_combout ;
wire \Add4~10_combout ;
wire \Add2~1_cout ;
wire \Add2~3 ;
wire \Add2~2_combout ;
wire \Add2~5 ;
wire \Add2~4_combout ;
wire \Add2~7 ;
wire \Add2~6_combout ;
wire \Add2~9 ;
wire \Add2~8_combout ;
wire \Add2~11 ;
wire \Add2~10_combout ;
wire \Add2~12_combout ;
wire \Add3~3 ;
wire \Add3~2_combout ;
wire \Add3~5 ;
wire \Add3~4_combout ;
wire \Add3~7 ;
wire \Add3~6_combout ;
wire \Add3~9 ;
wire \Add3~8_combout ;
wire \Add3~11 ;
wire \Add3~10_combout ;
wire \Add3~12_combout ;
wire \Add1~1_cout ;
wire \Add1~3 ;
wire \Add1~2_combout ;
wire \Add1~5 ;
wire \Add1~4_combout ;
wire \Add1~7 ;
wire \Add1~6_combout ;
wire \Add1~9 ;
wire \Add1~8_combout ;
wire \Add1~11 ;
wire \Add1~10_combout ;
wire \Add1~12_combout ;
wire \tracebot_q[4]~q ;
wire \tracebot_q[3]~q ;
wire \bit_ram_in[1]~0_combout ;
wire \stogte_int~0_combout ;
wire \flip_flop_t_out~q ;
wire \stogte_int~1_combout ;
wire \stogte_int~2_combout ;
wire \tracetop_q[4]~q ;
wire \tracetop_q[3]~q ;
wire \bit_ram_in[1]~1_combout ;
wire \decadd[1]~0_combout ;
wire \decadd[1]~1_combout ;
wire \decadd[2]~2_combout ;
wire \decadd[2]~3_combout ;
wire \decadd[3]~4_combout ;
wire \decadd[3]~5_combout ;
wire \decadd[4]~6_combout ;
wire \decadd[4]~7_combout ;
wire \decadd[5]~8_combout ;
wire \decadd[5]~9_combout ;
wire \decadd[6]~10_combout ;
wire \decadd[6]~11_combout ;
wire \decadd[7]~12_combout ;
wire \decadd[7]~13_combout ;
wire \tracebot_q[2]~q ;
wire \tracebot_d[4]~combout ;
wire \tracebot_d[3]~combout ;
wire \FF_T~0_combout ;
wire \FF_T~1_combout ;
wire \FF_T~2_combout ;
wire \flip_flop_t_out~0_combout ;
wire \tracetop_q[2]~q ;
wire \tracetop_d[4]~combout ;
wire \tracetop_d[3]~combout ;
wire \tracebot_q[1]~q ;
wire \tracebot_d[2]~combout ;
wire \writetop[1]~q ;
wire \writebot[2]~q ;
wire \writebot[3]~q ;
wire \writebot[4]~q ;
wire \writebot[5]~q ;
wire \writebot[6]~q ;
wire \writebot[7]~q ;
wire \readbot[2]~q ;
wire \readbot[3]~q ;
wire \readbot[4]~q ;
wire \readbot[5]~q ;
wire \readbot[6]~q ;
wire \readbot[7]~q ;
wire \tracetop_q[1]~q ;
wire \tracetop_d[2]~combout ;
wire \writetop[2]~q ;
wire \writetop[3]~q ;
wire \writetop[4]~q ;
wire \writetop[5]~q ;
wire \writetop[6]~q ;
wire \writetop[7]~q ;
wire \readtop[2]~q ;
wire \readtop[3]~q ;
wire \readtop[4]~q ;
wire \readtop[5]~q ;
wire \readtop[6]~q ;
wire \readtop[7]~q ;
wire \tracebot_d[1]~combout ;
wire \Equal3~0_combout ;
wire \Equal3~1_combout ;
wire \writebot~0_combout ;
wire \writebot~1_combout ;
wire \Equal1~0_combout ;
wire \Equal1~1_combout ;
wire \readbot~0_combout ;
wire \readbot~1_combout ;
wire \readbot~2_combout ;
wire \tracetop_d[1]~combout ;
wire \Equal2~0_combout ;
wire \Equal2~1_combout ;
wire \writetop~0_combout ;
wire \writetop~1_combout ;
wire \Equal0~0_combout ;
wire \Equal0~1_combout ;
wire \readtop~0_combout ;
wire \readtop~1_combout ;
wire \readtop~2_combout ;
wire \writebot[2]~2_combout ;
wire \writebot[3]~3_combout ;
wire \writebot[5]~4_combout ;
wire \writebot[6]~5_combout ;
wire \readbot[2]~3_combout ;
wire \readbot[2]~_wirecell_combout ;
wire \readbot[5]~_wirecell_combout ;
wire \stoadd[2]~_wirecell_combout ;
wire \stoadd[5]~_wirecell_combout ;
wire \writebot[2]~_wirecell_combout ;
wire \writebot[3]~_wirecell_combout ;
wire \writebot[5]~_wirecell_combout ;
wire \writebot[6]~_wirecell_combout ;
wire \lf_status_enable_ptr[6]~4_combout ;
wire \outvalid_clk~0_combout ;
wire \lf_status_enable_ptr[6]~5_combout ;
wire \lf_status_enable_ptr[6]~q ;
wire \lf_status_enable_ptr~7_combout ;
wire \lf_status_enable_ptr[5]~3_combout ;
wire \lf_status_enable_ptr[5]~q ;
wire \lf_status_enable_ptr~8_combout ;
wire \lf_status_enable_ptr[4]~q ;
wire \lf_status_enable_ptr~6_combout ;
wire \lf_status_enable_ptr[3]~q ;
wire \lf_status_enable_ptr~2_combout ;
wire \lf_status_enable_ptr[2]~q ;
wire \lf_status_enable_ptr~0_combout ;
wire \lf_status_enable_ptr~1_combout ;
wire \lf_status_enable_ptr[1]~q ;
wire \enable_int~0_combout ;
wire \stadd[1]~19_combout ;
wire \stadd[1]~q ;
wire \stadd[2]~6_combout ;
wire \stadd[2]~7 ;
wire \stadd[3]~9_combout ;
wire \stadd[3]~q ;
wire \stadd[3]~10 ;
wire \stadd[4]~11_combout ;
wire \stadd[4]~q ;
wire \stadd[4]~12 ;
wire \stadd[5]~13_combout ;
wire \stadd[5]~q ;
wire \stadd[5]~14 ;
wire \stadd[6]~15_combout ;
wire \stadd[6]~q ;
wire \stadd[6]~16 ;
wire \stadd[7]~17_combout ;
wire \stadd[7]~q ;
wire \stadd[7]~8_combout ;
wire \stadd[2]~q ;
wire \LessThan0~0_combout ;
wire \LessThan0~1_combout ;
wire \outvalidnode_q~0_combout ;


viterbi_altsyncram_1 decbit_RAM(
	.q_b({q_b_unconnected_wire_3,q_b_unconnected_wire_2,q_b_unconnected_wire_1,q_b_0}),
	.address_a({\stoadd[7]~q ,\stoadd[6]~q ,\stoadd[5]~_wirecell_combout ,\stoadd[4]~q ,\stoadd[3]~q ,\stoadd[2]~_wirecell_combout ,\stoadd[1]~q }),
	.clocken1(\enable_int~0_combout ),
	.data_a({gnd,gnd,gnd,\bit_ram_in[1]~1_combout }),
	.address_b({\decadd[7]~13_combout ,\decadd[6]~11_combout ,\decadd[5]~9_combout ,\decadd[4]~7_combout ,\decadd[3]~5_combout ,\decadd[2]~3_combout ,\decadd[1]~1_combout }),
	.clock0(clk));

viterbi_altsyncram_3 stop_RAM(
	.address_b({\readtop[7]~q ,\readtop[6]~q ,\readtop[5]~q ,\readtop[4]~q ,\readtop[3]~q ,\readtop[2]~q ,\stoadd[1]~q }),
	.q_b({\stop_RAM|auto_generated|q_b[3] ,\stop_RAM|auto_generated|q_b[2] ,\stop_RAM|auto_generated|q_b[1] ,\stop_RAM|auto_generated|q_b[0] }),
	.wren_a(survready),
	.clocken1(\enable_int~0_combout ),
	.data_a({survive[4],survive[3],survive[2],survive[1]}),
	.address_a({\writetop[7]~q ,\writetop[6]~q ,\writetop[5]~q ,\writetop[4]~q ,\writetop[3]~q ,\writetop[2]~q ,\writetop[1]~q }),
	.clock0(clk));

viterbi_altsyncram_2 sbot_RAM(
	.address_b({\readbot[7]~q ,\readbot[6]~q ,\readbot[5]~_wirecell_combout ,\readbot[4]~q ,\readbot[3]~q ,\readbot[2]~_wirecell_combout ,\stoadd[1]~q }),
	.q_b({\sbot_RAM|auto_generated|q_b[3] ,\sbot_RAM|auto_generated|q_b[2] ,\sbot_RAM|auto_generated|q_b[1] ,\sbot_RAM|auto_generated|q_b[0] }),
	.wren_a(survready),
	.clocken1(\enable_int~0_combout ),
	.data_a({survive[4],survive[3],survive[2],survive[1]}),
	.address_a({\writebot[7]~q ,\writebot[6]~_wirecell_combout ,\writebot[5]~_wirecell_combout ,\writebot[4]~q ,\writebot[3]~_wirecell_combout ,\writebot[2]~_wirecell_combout ,\writetop[1]~q }),
	.clock0(clk));

dffeas \stoadd[5] (
	.clk(clk),
	.d(\stoadd[5]~15_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\stoadd[5]~q ),
	.prn(vcc));
defparam \stoadd[5] .is_wysiwyg = "true";
defparam \stoadd[5] .power_up = "low";

dffeas \stoadd[4] (
	.clk(clk),
	.d(\stoadd[4]~13_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\stoadd[4]~q ),
	.prn(vcc));
defparam \stoadd[4] .is_wysiwyg = "true";
defparam \stoadd[4] .power_up = "low";

dffeas \stoadd[6] (
	.clk(clk),
	.d(\stoadd[6]~17_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\stoadd[6]~q ),
	.prn(vcc));
defparam \stoadd[6] .is_wysiwyg = "true";
defparam \stoadd[6] .power_up = "low";

dffeas \stoadd[7] (
	.clk(clk),
	.d(\stoadd[7]~19_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\stoadd[7]~q ),
	.prn(vcc));
defparam \stoadd[7] .is_wysiwyg = "true";
defparam \stoadd[7] .power_up = "low";

dffeas \stoadd[3] (
	.clk(clk),
	.d(\stoadd[3]~11_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\stoadd[3]~q ),
	.prn(vcc));
defparam \stoadd[3] .is_wysiwyg = "true";
defparam \stoadd[3] .power_up = "low";

dffeas \stoadd[1] (
	.clk(clk),
	.d(\stoadd[1]~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\stoadd[1]~q ),
	.prn(vcc));
defparam \stoadd[1] .is_wysiwyg = "true";
defparam \stoadd[1] .power_up = "low";

dffeas \stoadd[2] (
	.clk(clk),
	.d(\stoadd[2]~9_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\stoadd[2]~q ),
	.prn(vcc));
defparam \stoadd[2] .is_wysiwyg = "true";
defparam \stoadd[2] .power_up = "low";

cycloneiii_lcell_comb \Add9~0 (
	.dataa(\stoadd[1]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\Add9~0_combout ),
	.cout(\Add9~1 ));
defparam \Add9~0 .lut_mask = 16'h55AA;
defparam \Add9~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add7~0 (
	.dataa(\stoadd[1]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\Add7~0_combout ),
	.cout(\Add7~1 ));
defparam \Add7~0 .lut_mask = 16'h55AA;
defparam \Add7~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add7~2 (
	.dataa(\stoadd[2]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add7~1 ),
	.combout(\Add7~2_combout ),
	.cout(\Add7~3 ));
defparam \Add7~2 .lut_mask = 16'h5AAF;
defparam \Add7~2 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add10~0 (
	.dataa(\stoadd[2]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\Add10~0_combout ),
	.cout(\Add10~1 ));
defparam \Add10~0 .lut_mask = 16'h55AA;
defparam \Add10~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add9~2 (
	.dataa(\stoadd[2]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add9~1 ),
	.combout(\Add9~2_combout ),
	.cout(\Add9~3 ));
defparam \Add9~2 .lut_mask = 16'h5AAF;
defparam \Add9~2 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add7~4 (
	.dataa(\stoadd[3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add7~3 ),
	.combout(\Add7~4_combout ),
	.cout(\Add7~5 ));
defparam \Add7~4 .lut_mask = 16'h5AAF;
defparam \Add7~4 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add10~2 (
	.dataa(\stoadd[3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add10~1 ),
	.combout(\Add10~2_combout ),
	.cout(\Add10~3 ));
defparam \Add10~2 .lut_mask = 16'h5AAF;
defparam \Add10~2 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add9~4 (
	.dataa(\stoadd[3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add9~3 ),
	.combout(\Add9~4_combout ),
	.cout(\Add9~5 ));
defparam \Add9~4 .lut_mask = 16'h5AAF;
defparam \Add9~4 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add7~6 (
	.dataa(\stoadd[4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add7~5 ),
	.combout(\Add7~6_combout ),
	.cout(\Add7~7 ));
defparam \Add7~6 .lut_mask = 16'h5A5F;
defparam \Add7~6 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add10~4 (
	.dataa(\stoadd[4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add10~3 ),
	.combout(\Add10~4_combout ),
	.cout(\Add10~5 ));
defparam \Add10~4 .lut_mask = 16'h5A5F;
defparam \Add10~4 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add8~1 (
	.dataa(\stoadd[3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(),
	.cout(\Add8~1_cout ));
defparam \Add8~1 .lut_mask = 16'h0055;
defparam \Add8~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add8~2 (
	.dataa(\stoadd[4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add8~1_cout ),
	.combout(\Add8~2_combout ),
	.cout(\Add8~3 ));
defparam \Add8~2 .lut_mask = 16'h5AAF;
defparam \Add8~2 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add9~6 (
	.dataa(\stoadd[4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add9~5 ),
	.combout(\Add9~6_combout ),
	.cout(\Add9~7 ));
defparam \Add9~6 .lut_mask = 16'h5A5F;
defparam \Add9~6 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add7~8 (
	.dataa(\stoadd[5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add7~7 ),
	.combout(\Add7~8_combout ),
	.cout(\Add7~9 ));
defparam \Add7~8 .lut_mask = 16'h5A5F;
defparam \Add7~8 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add10~6 (
	.dataa(\stoadd[5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add10~5 ),
	.combout(\Add10~6_combout ),
	.cout(\Add10~7 ));
defparam \Add10~6 .lut_mask = 16'h5A5F;
defparam \Add10~6 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add8~4 (
	.dataa(\stoadd[5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add8~3 ),
	.combout(\Add8~4_combout ),
	.cout(\Add8~5 ));
defparam \Add8~4 .lut_mask = 16'h5AAF;
defparam \Add8~4 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add9~8 (
	.dataa(\stoadd[5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add9~7 ),
	.combout(\Add9~8_combout ),
	.cout(\Add9~9 ));
defparam \Add9~8 .lut_mask = 16'h5A5F;
defparam \Add9~8 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add7~10 (
	.dataa(\stoadd[6]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add7~9 ),
	.combout(\Add7~10_combout ),
	.cout(\Add7~11 ));
defparam \Add7~10 .lut_mask = 16'h5A5F;
defparam \Add7~10 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add10~8 (
	.dataa(\stoadd[6]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add10~7 ),
	.combout(\Add10~8_combout ),
	.cout(\Add10~9 ));
defparam \Add10~8 .lut_mask = 16'h5A5F;
defparam \Add10~8 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add8~6 (
	.dataa(\stoadd[6]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add8~5 ),
	.combout(\Add8~6_combout ),
	.cout(\Add8~7 ));
defparam \Add8~6 .lut_mask = 16'h5AAF;
defparam \Add8~6 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add9~10 (
	.dataa(\stoadd[6]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add9~9 ),
	.combout(\Add9~10_combout ),
	.cout(\Add9~11 ));
defparam \Add9~10 .lut_mask = 16'h5A5F;
defparam \Add9~10 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add7~12 (
	.dataa(\stoadd[7]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add7~11 ),
	.combout(\Add7~12_combout ),
	.cout());
defparam \Add7~12 .lut_mask = 16'h5A5A;
defparam \Add7~12 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add10~10 (
	.dataa(\stoadd[7]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add10~9 ),
	.combout(\Add10~10_combout ),
	.cout());
defparam \Add10~10 .lut_mask = 16'h5A5A;
defparam \Add10~10 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add8~8 (
	.dataa(\stoadd[7]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add8~7 ),
	.combout(\Add8~8_combout ),
	.cout());
defparam \Add8~8 .lut_mask = 16'h5A5A;
defparam \Add8~8 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add9~12 (
	.dataa(\stoadd[7]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add9~11 ),
	.combout(\Add9~12_combout ),
	.cout());
defparam \Add9~12 .lut_mask = 16'h5A5A;
defparam \Add9~12 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \stoadd[1]~7 (
	.dataa(\stoadd[1]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\stoadd[1]~7_combout ),
	.cout(\stoadd[1]~8 ));
defparam \stoadd[1]~7 .lut_mask = 16'h55AA;
defparam \stoadd[1]~7 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \stoadd[2]~9 (
	.dataa(\stoadd[2]~q ),
	.datab(\flip_flop_t_out~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\stoadd[1]~8 ),
	.combout(\stoadd[2]~9_combout ),
	.cout(\stoadd[2]~10 ));
defparam \stoadd[2]~9 .lut_mask = 16'h96BF;
defparam \stoadd[2]~9 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \stoadd[3]~11 (
	.dataa(\stoadd[3]~q ),
	.datab(\flip_flop_t_out~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\stoadd[2]~10 ),
	.combout(\stoadd[3]~11_combout ),
	.cout(\stoadd[3]~12 ));
defparam \stoadd[3]~11 .lut_mask = 16'h96EF;
defparam \stoadd[3]~11 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \stoadd[4]~13 (
	.dataa(\stoadd[4]~q ),
	.datab(\flip_flop_t_out~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\stoadd[3]~12 ),
	.combout(\stoadd[4]~13_combout ),
	.cout(\stoadd[4]~14 ));
defparam \stoadd[4]~13 .lut_mask = 16'h967F;
defparam \stoadd[4]~13 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \stoadd[5]~15 (
	.dataa(\stoadd[5]~q ),
	.datab(\flip_flop_t_out~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\stoadd[4]~14 ),
	.combout(\stoadd[5]~15_combout ),
	.cout(\stoadd[5]~16 ));
defparam \stoadd[5]~15 .lut_mask = 16'h96DF;
defparam \stoadd[5]~15 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \stoadd[6]~17 (
	.dataa(\stoadd[6]~q ),
	.datab(\flip_flop_t_out~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(\stoadd[5]~16 ),
	.combout(\stoadd[6]~17_combout ),
	.cout(\stoadd[6]~18 ));
defparam \stoadd[6]~17 .lut_mask = 16'h967F;
defparam \stoadd[6]~17 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \stoadd[7]~19 (
	.dataa(\stoadd[7]~q ),
	.datab(\flip_flop_t_out~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(\stoadd[6]~18 ),
	.combout(\stoadd[7]~19_combout ),
	.cout());
defparam \stoadd[7]~19 .lut_mask = 16'h9696;
defparam \stoadd[7]~19 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add3~0 (
	.dataa(\writetop[1]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\Add3~0_combout ),
	.cout(\Add3~1 ));
defparam \Add3~0 .lut_mask = 16'h55AA;
defparam \Add3~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add4~0 (
	.dataa(\writebot[2]~q ),
	.datab(\writetop[1]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\Add4~0_combout ),
	.cout(\Add4~1 ));
defparam \Add4~0 .lut_mask = 16'h66DD;
defparam \Add4~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add4~2 (
	.dataa(\writebot[3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add4~1 ),
	.combout(\Add4~2_combout ),
	.cout(\Add4~3 ));
defparam \Add4~2 .lut_mask = 16'h5AAF;
defparam \Add4~2 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add4~4 (
	.dataa(\writebot[4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add4~3 ),
	.combout(\Add4~4_combout ),
	.cout(\Add4~5 ));
defparam \Add4~4 .lut_mask = 16'h5AAF;
defparam \Add4~4 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add4~6 (
	.dataa(\writebot[5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add4~5 ),
	.combout(\Add4~6_combout ),
	.cout(\Add4~7 ));
defparam \Add4~6 .lut_mask = 16'h5AAF;
defparam \Add4~6 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add4~8 (
	.dataa(\writebot[6]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add4~7 ),
	.combout(\Add4~8_combout ),
	.cout(\Add4~9 ));
defparam \Add4~8 .lut_mask = 16'h5A5F;
defparam \Add4~8 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add4~10 (
	.dataa(\writebot[7]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add4~9 ),
	.combout(\Add4~10_combout ),
	.cout());
defparam \Add4~10 .lut_mask = 16'h5A5A;
defparam \Add4~10 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add2~1 (
	.dataa(\stoadd[1]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(),
	.cout(\Add2~1_cout ));
defparam \Add2~1 .lut_mask = 16'h00AA;
defparam \Add2~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add2~2 (
	.dataa(\readbot[2]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add2~1_cout ),
	.combout(\Add2~2_combout ),
	.cout(\Add2~3 ));
defparam \Add2~2 .lut_mask = 16'h5AAF;
defparam \Add2~2 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add2~4 (
	.dataa(\readbot[3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add2~3 ),
	.combout(\Add2~4_combout ),
	.cout(\Add2~5 ));
defparam \Add2~4 .lut_mask = 16'h5AAF;
defparam \Add2~4 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add2~6 (
	.dataa(\readbot[4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add2~5 ),
	.combout(\Add2~6_combout ),
	.cout(\Add2~7 ));
defparam \Add2~6 .lut_mask = 16'h5A5F;
defparam \Add2~6 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add2~8 (
	.dataa(\readbot[5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add2~7 ),
	.combout(\Add2~8_combout ),
	.cout(\Add2~9 ));
defparam \Add2~8 .lut_mask = 16'h5A5F;
defparam \Add2~8 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add2~10 (
	.dataa(\readbot[6]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add2~9 ),
	.combout(\Add2~10_combout ),
	.cout(\Add2~11 ));
defparam \Add2~10 .lut_mask = 16'h5A5F;
defparam \Add2~10 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add2~12 (
	.dataa(\readbot[7]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add2~11 ),
	.combout(\Add2~12_combout ),
	.cout());
defparam \Add2~12 .lut_mask = 16'h5A5A;
defparam \Add2~12 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add3~2 (
	.dataa(\writetop[2]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add3~1 ),
	.combout(\Add3~2_combout ),
	.cout(\Add3~3 ));
defparam \Add3~2 .lut_mask = 16'h5A5F;
defparam \Add3~2 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add3~4 (
	.dataa(\writetop[3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add3~3 ),
	.combout(\Add3~4_combout ),
	.cout(\Add3~5 ));
defparam \Add3~4 .lut_mask = 16'h5AAF;
defparam \Add3~4 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add3~6 (
	.dataa(\writetop[4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add3~5 ),
	.combout(\Add3~6_combout ),
	.cout(\Add3~7 ));
defparam \Add3~6 .lut_mask = 16'h5A5F;
defparam \Add3~6 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add3~8 (
	.dataa(\writetop[5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add3~7 ),
	.combout(\Add3~8_combout ),
	.cout(\Add3~9 ));
defparam \Add3~8 .lut_mask = 16'h5AAF;
defparam \Add3~8 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add3~10 (
	.dataa(\writetop[6]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add3~9 ),
	.combout(\Add3~10_combout ),
	.cout(\Add3~11 ));
defparam \Add3~10 .lut_mask = 16'h5A5F;
defparam \Add3~10 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add3~12 (
	.dataa(\writetop[7]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add3~11 ),
	.combout(\Add3~12_combout ),
	.cout());
defparam \Add3~12 .lut_mask = 16'h5A5A;
defparam \Add3~12 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add1~1 (
	.dataa(\stoadd[1]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(),
	.cout(\Add1~1_cout ));
defparam \Add1~1 .lut_mask = 16'h00AA;
defparam \Add1~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Add1~2 (
	.dataa(\readtop[2]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add1~1_cout ),
	.combout(\Add1~2_combout ),
	.cout(\Add1~3 ));
defparam \Add1~2 .lut_mask = 16'h5A5F;
defparam \Add1~2 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add1~4 (
	.dataa(\readtop[3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add1~3 ),
	.combout(\Add1~4_combout ),
	.cout(\Add1~5 ));
defparam \Add1~4 .lut_mask = 16'h5AAF;
defparam \Add1~4 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add1~6 (
	.dataa(\readtop[4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add1~5 ),
	.combout(\Add1~6_combout ),
	.cout(\Add1~7 ));
defparam \Add1~6 .lut_mask = 16'h5A5F;
defparam \Add1~6 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add1~8 (
	.dataa(\readtop[5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add1~7 ),
	.combout(\Add1~8_combout ),
	.cout(\Add1~9 ));
defparam \Add1~8 .lut_mask = 16'h5AAF;
defparam \Add1~8 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add1~10 (
	.dataa(\readtop[6]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add1~9 ),
	.combout(\Add1~10_combout ),
	.cout(\Add1~11 ));
defparam \Add1~10 .lut_mask = 16'h5A5F;
defparam \Add1~10 .sum_lutc_input = "cin";

cycloneiii_lcell_comb \Add1~12 (
	.dataa(\readtop[7]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add1~11 ),
	.combout(\Add1~12_combout ),
	.cout());
defparam \Add1~12 .lut_mask = 16'h5A5A;
defparam \Add1~12 .sum_lutc_input = "cin";

dffeas \tracebot_q[4] (
	.clk(clk),
	.d(\tracebot_d[4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\tracebot_q[4]~q ),
	.prn(vcc));
defparam \tracebot_q[4] .is_wysiwyg = "true";
defparam \tracebot_q[4] .power_up = "low";

dffeas \tracebot_q[3] (
	.clk(clk),
	.d(\tracebot_d[3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\tracebot_q[3]~q ),
	.prn(vcc));
defparam \tracebot_q[3] .is_wysiwyg = "true";
defparam \tracebot_q[3] .power_up = "low";

cycloneiii_lcell_comb \bit_ram_in[1]~0 (
	.dataa(\tracebot_q[4]~q ),
	.datab(\tracebot_q[3]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\bit_ram_in[1]~0_combout ),
	.cout());
defparam \bit_ram_in[1]~0 .lut_mask = 16'hEEEE;
defparam \bit_ram_in[1]~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \stogte_int~0 (
	.dataa(\stoadd[4]~q ),
	.datab(\stoadd[5]~q ),
	.datac(\stoadd[6]~q ),
	.datad(\stoadd[7]~q ),
	.cin(gnd),
	.combout(\stogte_int~0_combout ),
	.cout());
defparam \stogte_int~0 .lut_mask = 16'hFFFB;
defparam \stogte_int~0 .sum_lutc_input = "datac";

dffeas flip_flop_t_out(
	.clk(clk),
	.d(\flip_flop_t_out~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\flip_flop_t_out~q ),
	.prn(vcc));
defparam flip_flop_t_out.is_wysiwyg = "true";
defparam flip_flop_t_out.power_up = "low";

cycloneiii_lcell_comb \stogte_int~1 (
	.dataa(\stoadd[3]~q ),
	.datab(\stoadd[1]~q ),
	.datac(\stoadd[2]~q ),
	.datad(\flip_flop_t_out~q ),
	.cin(gnd),
	.combout(\stogte_int~1_combout ),
	.cout());
defparam \stogte_int~1 .lut_mask = 16'hEDDE;
defparam \stogte_int~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \stogte_int~2 (
	.dataa(\stoadd[5]~q ),
	.datab(\stogte_int~0_combout ),
	.datac(\flip_flop_t_out~q ),
	.datad(\stogte_int~1_combout ),
	.cin(gnd),
	.combout(\stogte_int~2_combout ),
	.cout());
defparam \stogte_int~2 .lut_mask = 16'hFF96;
defparam \stogte_int~2 .sum_lutc_input = "datac";

dffeas \tracetop_q[4] (
	.clk(clk),
	.d(\tracetop_d[4]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\tracetop_q[4]~q ),
	.prn(vcc));
defparam \tracetop_q[4] .is_wysiwyg = "true";
defparam \tracetop_q[4] .power_up = "low";

dffeas \tracetop_q[3] (
	.clk(clk),
	.d(\tracetop_d[3]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\tracetop_q[3]~q ),
	.prn(vcc));
defparam \tracetop_q[3] .is_wysiwyg = "true";
defparam \tracetop_q[3] .power_up = "low";

cycloneiii_lcell_comb \bit_ram_in[1]~1 (
	.dataa(\bit_ram_in[1]~0_combout ),
	.datab(\stogte_int~2_combout ),
	.datac(\tracetop_q[4]~q ),
	.datad(\tracetop_q[3]~q ),
	.cin(gnd),
	.combout(\bit_ram_in[1]~1_combout ),
	.cout());
defparam \bit_ram_in[1]~1 .lut_mask = 16'hFFB8;
defparam \bit_ram_in[1]~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \decadd[1]~0 (
	.dataa(\Add9~0_combout ),
	.datab(\Add7~0_combout ),
	.datac(gnd),
	.datad(\flip_flop_t_out~q ),
	.cin(gnd),
	.combout(\decadd[1]~0_combout ),
	.cout());
defparam \decadd[1]~0 .lut_mask = 16'hAACC;
defparam \decadd[1]~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \decadd[1]~1 (
	.dataa(\decadd[1]~0_combout ),
	.datab(\stogte_int~2_combout ),
	.datac(gnd),
	.datad(\stoadd[1]~q ),
	.cin(gnd),
	.combout(\decadd[1]~1_combout ),
	.cout());
defparam \decadd[1]~1 .lut_mask = 16'h88BB;
defparam \decadd[1]~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \decadd[2]~2 (
	.dataa(\stogte_int~2_combout ),
	.datab(\Add10~0_combout ),
	.datac(\flip_flop_t_out~q ),
	.datad(\stoadd[2]~q ),
	.cin(gnd),
	.combout(\decadd[2]~2_combout ),
	.cout());
defparam \decadd[2]~2 .lut_mask = 16'hFFDE;
defparam \decadd[2]~2 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \decadd[2]~3 (
	.dataa(\Add7~2_combout ),
	.datab(\stogte_int~2_combout ),
	.datac(\decadd[2]~2_combout ),
	.datad(\Add9~2_combout ),
	.cin(gnd),
	.combout(\decadd[2]~3_combout ),
	.cout());
defparam \decadd[2]~3 .lut_mask = 16'hFFBE;
defparam \decadd[2]~3 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \decadd[3]~4 (
	.dataa(\stogte_int~2_combout ),
	.datab(\Add10~2_combout ),
	.datac(\flip_flop_t_out~q ),
	.datad(\stoadd[3]~q ),
	.cin(gnd),
	.combout(\decadd[3]~4_combout ),
	.cout());
defparam \decadd[3]~4 .lut_mask = 16'hFFDE;
defparam \decadd[3]~4 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \decadd[3]~5 (
	.dataa(\Add7~4_combout ),
	.datab(\stogte_int~2_combout ),
	.datac(\decadd[3]~4_combout ),
	.datad(\Add9~4_combout ),
	.cin(gnd),
	.combout(\decadd[3]~5_combout ),
	.cout());
defparam \decadd[3]~5 .lut_mask = 16'hFFBE;
defparam \decadd[3]~5 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \decadd[4]~6 (
	.dataa(\stogte_int~2_combout ),
	.datab(\Add10~4_combout ),
	.datac(\flip_flop_t_out~q ),
	.datad(\Add8~2_combout ),
	.cin(gnd),
	.combout(\decadd[4]~6_combout ),
	.cout());
defparam \decadd[4]~6 .lut_mask = 16'hFFDE;
defparam \decadd[4]~6 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \decadd[4]~7 (
	.dataa(\Add7~6_combout ),
	.datab(\stogte_int~2_combout ),
	.datac(\decadd[4]~6_combout ),
	.datad(\Add9~6_combout ),
	.cin(gnd),
	.combout(\decadd[4]~7_combout ),
	.cout());
defparam \decadd[4]~7 .lut_mask = 16'hFFBE;
defparam \decadd[4]~7 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \decadd[5]~8 (
	.dataa(\stogte_int~2_combout ),
	.datab(\Add10~6_combout ),
	.datac(\flip_flop_t_out~q ),
	.datad(\Add8~4_combout ),
	.cin(gnd),
	.combout(\decadd[5]~8_combout ),
	.cout());
defparam \decadd[5]~8 .lut_mask = 16'hFFDE;
defparam \decadd[5]~8 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \decadd[5]~9 (
	.dataa(\Add7~8_combout ),
	.datab(\stogte_int~2_combout ),
	.datac(\decadd[5]~8_combout ),
	.datad(\Add9~8_combout ),
	.cin(gnd),
	.combout(\decadd[5]~9_combout ),
	.cout());
defparam \decadd[5]~9 .lut_mask = 16'hFFBE;
defparam \decadd[5]~9 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \decadd[6]~10 (
	.dataa(\stogte_int~2_combout ),
	.datab(\Add10~8_combout ),
	.datac(\flip_flop_t_out~q ),
	.datad(\Add8~6_combout ),
	.cin(gnd),
	.combout(\decadd[6]~10_combout ),
	.cout());
defparam \decadd[6]~10 .lut_mask = 16'hFFDE;
defparam \decadd[6]~10 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \decadd[6]~11 (
	.dataa(\Add7~10_combout ),
	.datab(\stogte_int~2_combout ),
	.datac(\decadd[6]~10_combout ),
	.datad(\Add9~10_combout ),
	.cin(gnd),
	.combout(\decadd[6]~11_combout ),
	.cout());
defparam \decadd[6]~11 .lut_mask = 16'hFFBE;
defparam \decadd[6]~11 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \decadd[7]~12 (
	.dataa(\stogte_int~2_combout ),
	.datab(\Add10~10_combout ),
	.datac(\flip_flop_t_out~q ),
	.datad(\Add8~8_combout ),
	.cin(gnd),
	.combout(\decadd[7]~12_combout ),
	.cout());
defparam \decadd[7]~12 .lut_mask = 16'hFFDE;
defparam \decadd[7]~12 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \decadd[7]~13 (
	.dataa(\Add7~12_combout ),
	.datab(\stogte_int~2_combout ),
	.datac(\decadd[7]~12_combout ),
	.datad(\Add9~12_combout ),
	.cin(gnd),
	.combout(\decadd[7]~13_combout ),
	.cout());
defparam \decadd[7]~13 .lut_mask = 16'hFFBE;
defparam \decadd[7]~13 .sum_lutc_input = "datac";

dffeas \tracebot_q[2] (
	.clk(clk),
	.d(\tracebot_d[2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\tracebot_q[2]~q ),
	.prn(vcc));
defparam \tracebot_q[2] .is_wysiwyg = "true";
defparam \tracebot_q[2] .power_up = "low";

cycloneiii_lcell_comb \tracebot_d[4] (
	.dataa(\tracebot_q[4]~q ),
	.datab(\tracebot_q[2]~q ),
	.datac(\sbot_RAM|auto_generated|q_b[1] ),
	.datad(\sbot_RAM|auto_generated|q_b[3] ),
	.cin(gnd),
	.combout(\tracebot_d[4]~combout ),
	.cout());
defparam \tracebot_d[4] .lut_mask = 16'hFFFE;
defparam \tracebot_d[4] .sum_lutc_input = "datac";

cycloneiii_lcell_comb \tracebot_d[3] (
	.dataa(\tracebot_q[4]~q ),
	.datab(\tracebot_q[2]~q ),
	.datac(\sbot_RAM|auto_generated|q_b[3] ),
	.datad(\sbot_RAM|auto_generated|q_b[1] ),
	.cin(gnd),
	.combout(\tracebot_d[3]~combout ),
	.cout());
defparam \tracebot_d[3] .lut_mask = 16'hEFFF;
defparam \tracebot_d[3] .sum_lutc_input = "datac";

cycloneiii_lcell_comb \FF_T~0 (
	.dataa(gnd),
	.datab(\flip_flop_t_out~q ),
	.datac(\stoadd[2]~q ),
	.datad(\stoadd[6]~q ),
	.cin(gnd),
	.combout(\FF_T~0_combout ),
	.cout());
defparam \FF_T~0 .lut_mask = 16'hC33C;
defparam \FF_T~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \FF_T~1 (
	.dataa(\stoadd[5]~q ),
	.datab(\stoadd[7]~q ),
	.datac(\stoadd[3]~q ),
	.datad(\stoadd[4]~q ),
	.cin(gnd),
	.combout(\FF_T~1_combout ),
	.cout());
defparam \FF_T~1 .lut_mask = 16'hBFFF;
defparam \FF_T~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \FF_T~2 (
	.dataa(\FF_T~1_combout ),
	.datab(\lf_status_enable_ptr[1]~q ),
	.datac(survready),
	.datad(enable_source_int),
	.cin(gnd),
	.combout(\FF_T~2_combout ),
	.cout());
defparam \FF_T~2 .lut_mask = 16'hFEFF;
defparam \FF_T~2 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \flip_flop_t_out~0 (
	.dataa(\flip_flop_t_out~q ),
	.datab(\stoadd[1]~q ),
	.datac(\FF_T~0_combout ),
	.datad(\FF_T~2_combout ),
	.cin(gnd),
	.combout(\flip_flop_t_out~0_combout ),
	.cout());
defparam \flip_flop_t_out~0 .lut_mask = 16'h6996;
defparam \flip_flop_t_out~0 .sum_lutc_input = "datac";

dffeas \tracetop_q[2] (
	.clk(clk),
	.d(\tracetop_d[2]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\tracetop_q[2]~q ),
	.prn(vcc));
defparam \tracetop_q[2] .is_wysiwyg = "true";
defparam \tracetop_q[2] .power_up = "low";

cycloneiii_lcell_comb \tracetop_d[4] (
	.dataa(\tracetop_q[4]~q ),
	.datab(\tracetop_q[2]~q ),
	.datac(\stop_RAM|auto_generated|q_b[1] ),
	.datad(\stop_RAM|auto_generated|q_b[3] ),
	.cin(gnd),
	.combout(\tracetop_d[4]~combout ),
	.cout());
defparam \tracetop_d[4] .lut_mask = 16'hFFFE;
defparam \tracetop_d[4] .sum_lutc_input = "datac";

cycloneiii_lcell_comb \tracetop_d[3] (
	.dataa(\tracetop_q[4]~q ),
	.datab(\tracetop_q[2]~q ),
	.datac(\stop_RAM|auto_generated|q_b[3] ),
	.datad(\stop_RAM|auto_generated|q_b[1] ),
	.cin(gnd),
	.combout(\tracetop_d[3]~combout ),
	.cout());
defparam \tracetop_d[3] .lut_mask = 16'hEFFF;
defparam \tracetop_d[3] .sum_lutc_input = "datac";

dffeas \tracebot_q[1] (
	.clk(clk),
	.d(\tracebot_d[1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\tracebot_q[1]~q ),
	.prn(vcc));
defparam \tracebot_q[1] .is_wysiwyg = "true";
defparam \tracebot_q[1] .power_up = "low";

cycloneiii_lcell_comb \tracebot_d[2] (
	.dataa(\tracebot_q[3]~q ),
	.datab(\sbot_RAM|auto_generated|q_b[2] ),
	.datac(\sbot_RAM|auto_generated|q_b[0] ),
	.datad(\tracebot_q[1]~q ),
	.cin(gnd),
	.combout(\tracebot_d[2]~combout ),
	.cout());
defparam \tracebot_d[2] .lut_mask = 16'hFEFF;
defparam \tracebot_d[2] .sum_lutc_input = "datac";

dffeas \writetop[1] (
	.clk(clk),
	.d(\Add3~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(survready),
	.q(\writetop[1]~q ),
	.prn(vcc));
defparam \writetop[1] .is_wysiwyg = "true";
defparam \writetop[1] .power_up = "low";

dffeas \writebot[2] (
	.clk(clk),
	.d(\writebot[2]~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(survready),
	.q(\writebot[2]~q ),
	.prn(vcc));
defparam \writebot[2] .is_wysiwyg = "true";
defparam \writebot[2] .power_up = "low";

dffeas \writebot[3] (
	.clk(clk),
	.d(\writebot[3]~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(survready),
	.q(\writebot[3]~q ),
	.prn(vcc));
defparam \writebot[3] .is_wysiwyg = "true";
defparam \writebot[3] .power_up = "low";

dffeas \writebot[4] (
	.clk(clk),
	.d(\writebot~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(survready),
	.q(\writebot[4]~q ),
	.prn(vcc));
defparam \writebot[4] .is_wysiwyg = "true";
defparam \writebot[4] .power_up = "low";

dffeas \writebot[5] (
	.clk(clk),
	.d(\writebot[5]~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(survready),
	.q(\writebot[5]~q ),
	.prn(vcc));
defparam \writebot[5] .is_wysiwyg = "true";
defparam \writebot[5] .power_up = "low";

dffeas \writebot[6] (
	.clk(clk),
	.d(\writebot[6]~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(survready),
	.q(\writebot[6]~q ),
	.prn(vcc));
defparam \writebot[6] .is_wysiwyg = "true";
defparam \writebot[6] .power_up = "low";

dffeas \writebot[7] (
	.clk(clk),
	.d(\writebot~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(survready),
	.q(\writebot[7]~q ),
	.prn(vcc));
defparam \writebot[7] .is_wysiwyg = "true";
defparam \writebot[7] .power_up = "low";

dffeas \readbot[2] (
	.clk(clk),
	.d(\readbot[2]~3_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\readbot[2]~q ),
	.prn(vcc));
defparam \readbot[2] .is_wysiwyg = "true";
defparam \readbot[2] .power_up = "low";

dffeas \readbot[3] (
	.clk(clk),
	.d(\Add2~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\readbot[3]~q ),
	.prn(vcc));
defparam \readbot[3] .is_wysiwyg = "true";
defparam \readbot[3] .power_up = "low";

dffeas \readbot[4] (
	.clk(clk),
	.d(\readbot~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\readbot[4]~q ),
	.prn(vcc));
defparam \readbot[4] .is_wysiwyg = "true";
defparam \readbot[4] .power_up = "low";

dffeas \readbot[5] (
	.clk(clk),
	.d(\readbot~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\readbot[5]~q ),
	.prn(vcc));
defparam \readbot[5] .is_wysiwyg = "true";
defparam \readbot[5] .power_up = "low";

dffeas \readbot[6] (
	.clk(clk),
	.d(\readbot~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\readbot[6]~q ),
	.prn(vcc));
defparam \readbot[6] .is_wysiwyg = "true";
defparam \readbot[6] .power_up = "low";

dffeas \readbot[7] (
	.clk(clk),
	.d(\Add2~12_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\readbot[7]~q ),
	.prn(vcc));
defparam \readbot[7] .is_wysiwyg = "true";
defparam \readbot[7] .power_up = "low";

dffeas \tracetop_q[1] (
	.clk(clk),
	.d(\tracetop_d[1]~combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\tracetop_q[1]~q ),
	.prn(vcc));
defparam \tracetop_q[1] .is_wysiwyg = "true";
defparam \tracetop_q[1] .power_up = "low";

cycloneiii_lcell_comb \tracetop_d[2] (
	.dataa(\tracetop_q[3]~q ),
	.datab(\stop_RAM|auto_generated|q_b[2] ),
	.datac(\stop_RAM|auto_generated|q_b[0] ),
	.datad(\tracetop_q[1]~q ),
	.cin(gnd),
	.combout(\tracetop_d[2]~combout ),
	.cout());
defparam \tracetop_d[2] .lut_mask = 16'hFEFF;
defparam \tracetop_d[2] .sum_lutc_input = "datac";

dffeas \writetop[2] (
	.clk(clk),
	.d(\Add3~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(survready),
	.q(\writetop[2]~q ),
	.prn(vcc));
defparam \writetop[2] .is_wysiwyg = "true";
defparam \writetop[2] .power_up = "low";

dffeas \writetop[3] (
	.clk(clk),
	.d(\Add3~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(survready),
	.q(\writetop[3]~q ),
	.prn(vcc));
defparam \writetop[3] .is_wysiwyg = "true";
defparam \writetop[3] .power_up = "low";

dffeas \writetop[4] (
	.clk(clk),
	.d(\writetop~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(survready),
	.q(\writetop[4]~q ),
	.prn(vcc));
defparam \writetop[4] .is_wysiwyg = "true";
defparam \writetop[4] .power_up = "low";

dffeas \writetop[5] (
	.clk(clk),
	.d(\Add3~8_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(survready),
	.q(\writetop[5]~q ),
	.prn(vcc));
defparam \writetop[5] .is_wysiwyg = "true";
defparam \writetop[5] .power_up = "low";

dffeas \writetop[6] (
	.clk(clk),
	.d(\Add3~10_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(survready),
	.q(\writetop[6]~q ),
	.prn(vcc));
defparam \writetop[6] .is_wysiwyg = "true";
defparam \writetop[6] .power_up = "low";

dffeas \writetop[7] (
	.clk(clk),
	.d(\writetop~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(survready),
	.q(\writetop[7]~q ),
	.prn(vcc));
defparam \writetop[7] .is_wysiwyg = "true";
defparam \writetop[7] .power_up = "low";

dffeas \readtop[2] (
	.clk(clk),
	.d(\Add1~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\readtop[2]~q ),
	.prn(vcc));
defparam \readtop[2] .is_wysiwyg = "true";
defparam \readtop[2] .power_up = "low";

dffeas \readtop[3] (
	.clk(clk),
	.d(\Add1~4_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\readtop[3]~q ),
	.prn(vcc));
defparam \readtop[3] .is_wysiwyg = "true";
defparam \readtop[3] .power_up = "low";

dffeas \readtop[4] (
	.clk(clk),
	.d(\readtop~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\readtop[4]~q ),
	.prn(vcc));
defparam \readtop[4] .is_wysiwyg = "true";
defparam \readtop[4] .power_up = "low";

dffeas \readtop[5] (
	.clk(clk),
	.d(\readtop~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\readtop[5]~q ),
	.prn(vcc));
defparam \readtop[5] .is_wysiwyg = "true";
defparam \readtop[5] .power_up = "low";

dffeas \readtop[6] (
	.clk(clk),
	.d(\readtop~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\readtop[6]~q ),
	.prn(vcc));
defparam \readtop[6] .is_wysiwyg = "true";
defparam \readtop[6] .power_up = "low";

dffeas \readtop[7] (
	.clk(clk),
	.d(\Add1~12_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\enable_int~0_combout ),
	.q(\readtop[7]~q ),
	.prn(vcc));
defparam \readtop[7] .is_wysiwyg = "true";
defparam \readtop[7] .power_up = "low";

cycloneiii_lcell_comb \tracebot_d[1] (
	.dataa(\tracebot_q[3]~q ),
	.datab(\tracebot_q[1]~q ),
	.datac(\sbot_RAM|auto_generated|q_b[0] ),
	.datad(\sbot_RAM|auto_generated|q_b[2] ),
	.cin(gnd),
	.combout(\tracebot_d[1]~combout ),
	.cout());
defparam \tracebot_d[1] .lut_mask = 16'hFFFD;
defparam \tracebot_d[1] .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Equal3~0 (
	.dataa(\writetop[1]~q ),
	.datab(\writebot[5]~q ),
	.datac(\writebot[6]~q ),
	.datad(\writebot[7]~q ),
	.cin(gnd),
	.combout(\Equal3~0_combout ),
	.cout());
defparam \Equal3~0 .lut_mask = 16'hFFFE;
defparam \Equal3~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Equal3~1 (
	.dataa(\Equal3~0_combout ),
	.datab(\writebot[2]~q ),
	.datac(\writebot[3]~q ),
	.datad(\writebot[4]~q ),
	.cin(gnd),
	.combout(\Equal3~1_combout ),
	.cout());
defparam \Equal3~1 .lut_mask = 16'hBFFF;
defparam \Equal3~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \writebot~0 (
	.dataa(\Add4~4_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\Equal3~1_combout ),
	.cin(gnd),
	.combout(\writebot~0_combout ),
	.cout());
defparam \writebot~0 .lut_mask = 16'hAAFF;
defparam \writebot~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \writebot~1 (
	.dataa(\Add4~10_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\Equal3~1_combout ),
	.cin(gnd),
	.combout(\writebot~1_combout ),
	.cout());
defparam \writebot~1 .lut_mask = 16'hAAFF;
defparam \writebot~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Equal1~0 (
	.dataa(\readbot[5]~q ),
	.datab(\readbot[4]~q ),
	.datac(\readbot[6]~q ),
	.datad(\readbot[7]~q ),
	.cin(gnd),
	.combout(\Equal1~0_combout ),
	.cout());
defparam \Equal1~0 .lut_mask = 16'hBFFF;
defparam \Equal1~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Equal1~1 (
	.dataa(\readbot[2]~q ),
	.datab(\Equal1~0_combout ),
	.datac(\stoadd[1]~q ),
	.datad(\readbot[3]~q ),
	.cin(gnd),
	.combout(\Equal1~1_combout ),
	.cout());
defparam \Equal1~1 .lut_mask = 16'hEFFF;
defparam \Equal1~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \readbot~0 (
	.dataa(\Add2~6_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\Equal1~1_combout ),
	.cin(gnd),
	.combout(\readbot~0_combout ),
	.cout());
defparam \readbot~0 .lut_mask = 16'hAAFF;
defparam \readbot~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \readbot~1 (
	.dataa(\Add2~8_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\Equal1~1_combout ),
	.cin(gnd),
	.combout(\readbot~1_combout ),
	.cout());
defparam \readbot~1 .lut_mask = 16'hFF55;
defparam \readbot~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \readbot~2 (
	.dataa(\Add2~10_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\Equal1~1_combout ),
	.cin(gnd),
	.combout(\readbot~2_combout ),
	.cout());
defparam \readbot~2 .lut_mask = 16'hAAFF;
defparam \readbot~2 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \tracetop_d[1] (
	.dataa(\tracetop_q[3]~q ),
	.datab(\tracetop_q[1]~q ),
	.datac(\stop_RAM|auto_generated|q_b[0] ),
	.datad(\stop_RAM|auto_generated|q_b[2] ),
	.cin(gnd),
	.combout(\tracetop_d[1]~combout ),
	.cout());
defparam \tracetop_d[1] .lut_mask = 16'hFFFD;
defparam \tracetop_d[1] .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Equal2~0 (
	.dataa(\writetop[7]~q ),
	.datab(\writetop[4]~q ),
	.datac(\writetop[5]~q ),
	.datad(\writetop[6]~q ),
	.cin(gnd),
	.combout(\Equal2~0_combout ),
	.cout());
defparam \Equal2~0 .lut_mask = 16'hBFFF;
defparam \Equal2~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Equal2~1 (
	.dataa(\writetop[1]~q ),
	.datab(\writetop[2]~q ),
	.datac(\writetop[3]~q ),
	.datad(\Equal2~0_combout ),
	.cin(gnd),
	.combout(\Equal2~1_combout ),
	.cout());
defparam \Equal2~1 .lut_mask = 16'hFFFE;
defparam \Equal2~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \writetop~0 (
	.dataa(\Add3~6_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\Equal2~1_combout ),
	.cin(gnd),
	.combout(\writetop~0_combout ),
	.cout());
defparam \writetop~0 .lut_mask = 16'hAAFF;
defparam \writetop~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \writetop~1 (
	.dataa(\Add3~12_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\Equal2~1_combout ),
	.cin(gnd),
	.combout(\writetop~1_combout ),
	.cout());
defparam \writetop~1 .lut_mask = 16'hAAFF;
defparam \writetop~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Equal0~0 (
	.dataa(\readtop[4]~q ),
	.datab(\readtop[5]~q ),
	.datac(\readtop[6]~q ),
	.datad(\readtop[7]~q ),
	.cin(gnd),
	.combout(\Equal0~0_combout ),
	.cout());
defparam \Equal0~0 .lut_mask = 16'h7FFF;
defparam \Equal0~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \Equal0~1 (
	.dataa(\Equal0~0_combout ),
	.datab(\stoadd[1]~q ),
	.datac(\readtop[2]~q ),
	.datad(\readtop[3]~q ),
	.cin(gnd),
	.combout(\Equal0~1_combout ),
	.cout());
defparam \Equal0~1 .lut_mask = 16'hBFFF;
defparam \Equal0~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \readtop~0 (
	.dataa(\Add1~6_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\Equal0~1_combout ),
	.cin(gnd),
	.combout(\readtop~0_combout ),
	.cout());
defparam \readtop~0 .lut_mask = 16'hAAFF;
defparam \readtop~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \readtop~1 (
	.dataa(\Add1~8_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\Equal0~1_combout ),
	.cin(gnd),
	.combout(\readtop~1_combout ),
	.cout());
defparam \readtop~1 .lut_mask = 16'hAAFF;
defparam \readtop~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \readtop~2 (
	.dataa(\Add1~10_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\Equal0~1_combout ),
	.cin(gnd),
	.combout(\readtop~2_combout ),
	.cout());
defparam \readtop~2 .lut_mask = 16'hAAFF;
defparam \readtop~2 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \writebot[2]~2 (
	.dataa(\Add4~0_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\writebot[2]~2_combout ),
	.cout());
defparam \writebot[2]~2 .lut_mask = 16'h5555;
defparam \writebot[2]~2 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \writebot[3]~3 (
	.dataa(\Add4~2_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\writebot[3]~3_combout ),
	.cout());
defparam \writebot[3]~3 .lut_mask = 16'h5555;
defparam \writebot[3]~3 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \writebot[5]~4 (
	.dataa(\Add4~6_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\writebot[5]~4_combout ),
	.cout());
defparam \writebot[5]~4 .lut_mask = 16'h5555;
defparam \writebot[5]~4 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \writebot[6]~5 (
	.dataa(\Add4~8_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\writebot[6]~5_combout ),
	.cout());
defparam \writebot[6]~5 .lut_mask = 16'h5555;
defparam \writebot[6]~5 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \readbot[2]~3 (
	.dataa(\Add2~2_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\readbot[2]~3_combout ),
	.cout());
defparam \readbot[2]~3 .lut_mask = 16'h5555;
defparam \readbot[2]~3 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \readbot[2]~_wirecell (
	.dataa(\readbot[2]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\readbot[2]~_wirecell_combout ),
	.cout());
defparam \readbot[2]~_wirecell .lut_mask = 16'h5555;
defparam \readbot[2]~_wirecell .sum_lutc_input = "datac";

cycloneiii_lcell_comb \readbot[5]~_wirecell (
	.dataa(\readbot[5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\readbot[5]~_wirecell_combout ),
	.cout());
defparam \readbot[5]~_wirecell .lut_mask = 16'h5555;
defparam \readbot[5]~_wirecell .sum_lutc_input = "datac";

cycloneiii_lcell_comb \stoadd[2]~_wirecell (
	.dataa(\stoadd[2]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\stoadd[2]~_wirecell_combout ),
	.cout());
defparam \stoadd[2]~_wirecell .lut_mask = 16'h5555;
defparam \stoadd[2]~_wirecell .sum_lutc_input = "datac";

cycloneiii_lcell_comb \stoadd[5]~_wirecell (
	.dataa(\stoadd[5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\stoadd[5]~_wirecell_combout ),
	.cout());
defparam \stoadd[5]~_wirecell .lut_mask = 16'h5555;
defparam \stoadd[5]~_wirecell .sum_lutc_input = "datac";

cycloneiii_lcell_comb \writebot[2]~_wirecell (
	.dataa(\writebot[2]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\writebot[2]~_wirecell_combout ),
	.cout());
defparam \writebot[2]~_wirecell .lut_mask = 16'h5555;
defparam \writebot[2]~_wirecell .sum_lutc_input = "datac";

cycloneiii_lcell_comb \writebot[3]~_wirecell (
	.dataa(\writebot[3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\writebot[3]~_wirecell_combout ),
	.cout());
defparam \writebot[3]~_wirecell .lut_mask = 16'h5555;
defparam \writebot[3]~_wirecell .sum_lutc_input = "datac";

cycloneiii_lcell_comb \writebot[5]~_wirecell (
	.dataa(\writebot[5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\writebot[5]~_wirecell_combout ),
	.cout());
defparam \writebot[5]~_wirecell .lut_mask = 16'h5555;
defparam \writebot[5]~_wirecell .sum_lutc_input = "datac";

cycloneiii_lcell_comb \writebot[6]~_wirecell (
	.dataa(\writebot[6]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\writebot[6]~_wirecell_combout ),
	.cout());
defparam \writebot[6]~_wirecell .lut_mask = 16'h5555;
defparam \writebot[6]~_wirecell .sum_lutc_input = "datac";

dffeas outvalidnode_q(
	.clk(clk),
	.d(\outvalidnode_q~0_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(outvalidnode_q1),
	.prn(vcc));
defparam outvalidnode_q.is_wysiwyg = "true";
defparam outvalidnode_q.power_up = "low";

cycloneiii_lcell_comb \data_available~0 (
	.dataa(outvalidnode_q1),
	.datab(enable_source_int),
	.datac(\lf_status_enable_ptr[1]~q ),
	.datad(survready),
	.cin(gnd),
	.combout(data_available),
	.cout());
defparam \data_available~0 .lut_mask = 16'hFFFE;
defparam \data_available~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \lf_status_enable_ptr[6]~4 (
	.dataa(\lf_status_enable_ptr[6]~q ),
	.datab(enable_source_int),
	.datac(survready),
	.datad(\lf_status_enable_ptr[1]~q ),
	.cin(gnd),
	.combout(\lf_status_enable_ptr[6]~4_combout ),
	.cout());
defparam \lf_status_enable_ptr[6]~4 .lut_mask = 16'hFEFF;
defparam \lf_status_enable_ptr[6]~4 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \outvalid_clk~0 (
	.dataa(survready),
	.datab(atl_buffer_stateout_hold),
	.datac(atl_buffer_stateS0),
	.datad(\lf_status_enable_ptr[6]~q ),
	.cin(gnd),
	.combout(\outvalid_clk~0_combout ),
	.cout());
defparam \outvalid_clk~0 .lut_mask = 16'hEFFF;
defparam \outvalid_clk~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \lf_status_enable_ptr[6]~5 (
	.dataa(\lf_status_enable_ptr[6]~4_combout ),
	.datab(\outvalid_clk~0_combout ),
	.datac(\lf_status_enable_ptr[5]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\lf_status_enable_ptr[6]~5_combout ),
	.cout());
defparam \lf_status_enable_ptr[6]~5 .lut_mask = 16'hFEFE;
defparam \lf_status_enable_ptr[6]~5 .sum_lutc_input = "datac";

dffeas \lf_status_enable_ptr[6] (
	.clk(clk),
	.d(\lf_status_enable_ptr[6]~5_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\lf_status_enable_ptr[6]~q ),
	.prn(vcc));
defparam \lf_status_enable_ptr[6] .is_wysiwyg = "true";
defparam \lf_status_enable_ptr[6] .power_up = "low";

cycloneiii_lcell_comb \lf_status_enable_ptr~7 (
	.dataa(\lf_status_enable_ptr[6]~q ),
	.datab(enable_source_int),
	.datac(survready),
	.datad(\lf_status_enable_ptr[4]~q ),
	.cin(gnd),
	.combout(\lf_status_enable_ptr~7_combout ),
	.cout());
defparam \lf_status_enable_ptr~7 .lut_mask = 16'hFFFE;
defparam \lf_status_enable_ptr~7 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \lf_status_enable_ptr[5]~3 (
	.dataa(\lf_status_enable_ptr[6]~q ),
	.datab(\lf_status_enable_ptr[1]~q ),
	.datac(enable_source_int),
	.datad(survready),
	.cin(gnd),
	.combout(\lf_status_enable_ptr[5]~3_combout ),
	.cout());
defparam \lf_status_enable_ptr[5]~3 .lut_mask = 16'hDFFD;
defparam \lf_status_enable_ptr[5]~3 .sum_lutc_input = "datac";

dffeas \lf_status_enable_ptr[5] (
	.clk(clk),
	.d(\lf_status_enable_ptr~7_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_status_enable_ptr[5]~3_combout ),
	.q(\lf_status_enable_ptr[5]~q ),
	.prn(vcc));
defparam \lf_status_enable_ptr[5] .is_wysiwyg = "true";
defparam \lf_status_enable_ptr[5] .power_up = "low";

cycloneiii_lcell_comb \lf_status_enable_ptr~8 (
	.dataa(\lf_status_enable_ptr[3]~q ),
	.datab(\lf_status_enable_ptr[5]~q ),
	.datac(gnd),
	.datad(\outvalid_clk~0_combout ),
	.cin(gnd),
	.combout(\lf_status_enable_ptr~8_combout ),
	.cout());
defparam \lf_status_enable_ptr~8 .lut_mask = 16'hAACC;
defparam \lf_status_enable_ptr~8 .sum_lutc_input = "datac";

dffeas \lf_status_enable_ptr[4] (
	.clk(clk),
	.d(\lf_status_enable_ptr~8_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_status_enable_ptr[5]~3_combout ),
	.q(\lf_status_enable_ptr[4]~q ),
	.prn(vcc));
defparam \lf_status_enable_ptr[4] .is_wysiwyg = "true";
defparam \lf_status_enable_ptr[4] .power_up = "low";

cycloneiii_lcell_comb \lf_status_enable_ptr~6 (
	.dataa(\lf_status_enable_ptr[2]~q ),
	.datab(\lf_status_enable_ptr[4]~q ),
	.datac(gnd),
	.datad(\outvalid_clk~0_combout ),
	.cin(gnd),
	.combout(\lf_status_enable_ptr~6_combout ),
	.cout());
defparam \lf_status_enable_ptr~6 .lut_mask = 16'hAACC;
defparam \lf_status_enable_ptr~6 .sum_lutc_input = "datac";

dffeas \lf_status_enable_ptr[3] (
	.clk(clk),
	.d(\lf_status_enable_ptr~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_status_enable_ptr[5]~3_combout ),
	.q(\lf_status_enable_ptr[3]~q ),
	.prn(vcc));
defparam \lf_status_enable_ptr[3] .is_wysiwyg = "true";
defparam \lf_status_enable_ptr[3] .power_up = "low";

cycloneiii_lcell_comb \lf_status_enable_ptr~2 (
	.dataa(\lf_status_enable_ptr[3]~q ),
	.datab(gnd),
	.datac(\outvalid_clk~0_combout ),
	.datad(\lf_status_enable_ptr[1]~q ),
	.cin(gnd),
	.combout(\lf_status_enable_ptr~2_combout ),
	.cout());
defparam \lf_status_enable_ptr~2 .lut_mask = 16'hA0AF;
defparam \lf_status_enable_ptr~2 .sum_lutc_input = "datac";

dffeas \lf_status_enable_ptr[2] (
	.clk(clk),
	.d(\lf_status_enable_ptr~2_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\lf_status_enable_ptr[5]~3_combout ),
	.q(\lf_status_enable_ptr[2]~q ),
	.prn(vcc));
defparam \lf_status_enable_ptr[2] .is_wysiwyg = "true";
defparam \lf_status_enable_ptr[2] .power_up = "low";

cycloneiii_lcell_comb \lf_status_enable_ptr~0 (
	.dataa(\lf_status_enable_ptr[2]~q ),
	.datab(enable_source_int),
	.datac(survready),
	.datad(\lf_status_enable_ptr[1]~q ),
	.cin(gnd),
	.combout(\lf_status_enable_ptr~0_combout ),
	.cout());
defparam \lf_status_enable_ptr~0 .lut_mask = 16'hBFFF;
defparam \lf_status_enable_ptr~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \lf_status_enable_ptr~1 (
	.dataa(\lf_status_enable_ptr~0_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\outvalid_clk~0_combout ),
	.cin(gnd),
	.combout(\lf_status_enable_ptr~1_combout ),
	.cout());
defparam \lf_status_enable_ptr~1 .lut_mask = 16'hFF55;
defparam \lf_status_enable_ptr~1 .sum_lutc_input = "datac";

dffeas \lf_status_enable_ptr[1] (
	.clk(clk),
	.d(\lf_status_enable_ptr~1_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\lf_status_enable_ptr[1]~q ),
	.prn(vcc));
defparam \lf_status_enable_ptr[1] .is_wysiwyg = "true";
defparam \lf_status_enable_ptr[1] .power_up = "low";

cycloneiii_lcell_comb \enable_int~0 (
	.dataa(atl_buffer_stateS0),
	.datab(\lf_status_enable_ptr[1]~q ),
	.datac(survready),
	.datad(atl_buffer_stateout_hold),
	.cin(gnd),
	.combout(\enable_int~0_combout ),
	.cout());
defparam \enable_int~0 .lut_mask = 16'hFEFF;
defparam \enable_int~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \stadd[1]~19 (
	.dataa(gnd),
	.datab(\stadd[1]~q ),
	.datac(\LessThan0~1_combout ),
	.datad(\enable_int~0_combout ),
	.cin(gnd),
	.combout(\stadd[1]~19_combout ),
	.cout());
defparam \stadd[1]~19 .lut_mask = 16'hC33C;
defparam \stadd[1]~19 .sum_lutc_input = "datac";

dffeas \stadd[1] (
	.clk(clk),
	.d(\stadd[1]~19_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\stadd[1]~q ),
	.prn(vcc));
defparam \stadd[1] .is_wysiwyg = "true";
defparam \stadd[1] .power_up = "low";

cycloneiii_lcell_comb \stadd[2]~6 (
	.dataa(\stadd[1]~q ),
	.datab(\stadd[2]~q ),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\stadd[2]~6_combout ),
	.cout(\stadd[2]~7 ));
defparam \stadd[2]~6 .lut_mask = 16'h66EE;
defparam \stadd[2]~6 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \stadd[3]~9 (
	.dataa(\stadd[3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\stadd[2]~7 ),
	.combout(\stadd[3]~9_combout ),
	.cout(\stadd[3]~10 ));
defparam \stadd[3]~9 .lut_mask = 16'h5A5F;
defparam \stadd[3]~9 .sum_lutc_input = "cin";

dffeas \stadd[3] (
	.clk(clk),
	.d(\stadd[3]~9_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\stadd[7]~8_combout ),
	.q(\stadd[3]~q ),
	.prn(vcc));
defparam \stadd[3] .is_wysiwyg = "true";
defparam \stadd[3] .power_up = "low";

cycloneiii_lcell_comb \stadd[4]~11 (
	.dataa(\stadd[4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\stadd[3]~10 ),
	.combout(\stadd[4]~11_combout ),
	.cout(\stadd[4]~12 ));
defparam \stadd[4]~11 .lut_mask = 16'h5AAF;
defparam \stadd[4]~11 .sum_lutc_input = "cin";

dffeas \stadd[4] (
	.clk(clk),
	.d(\stadd[4]~11_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\stadd[7]~8_combout ),
	.q(\stadd[4]~q ),
	.prn(vcc));
defparam \stadd[4] .is_wysiwyg = "true";
defparam \stadd[4] .power_up = "low";

cycloneiii_lcell_comb \stadd[5]~13 (
	.dataa(\stadd[5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\stadd[4]~12 ),
	.combout(\stadd[5]~13_combout ),
	.cout(\stadd[5]~14 ));
defparam \stadd[5]~13 .lut_mask = 16'h5A5F;
defparam \stadd[5]~13 .sum_lutc_input = "cin";

dffeas \stadd[5] (
	.clk(clk),
	.d(\stadd[5]~13_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\stadd[7]~8_combout ),
	.q(\stadd[5]~q ),
	.prn(vcc));
defparam \stadd[5] .is_wysiwyg = "true";
defparam \stadd[5] .power_up = "low";

cycloneiii_lcell_comb \stadd[6]~15 (
	.dataa(\stadd[6]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\stadd[5]~14 ),
	.combout(\stadd[6]~15_combout ),
	.cout(\stadd[6]~16 ));
defparam \stadd[6]~15 .lut_mask = 16'h5AAF;
defparam \stadd[6]~15 .sum_lutc_input = "cin";

dffeas \stadd[6] (
	.clk(clk),
	.d(\stadd[6]~15_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\stadd[7]~8_combout ),
	.q(\stadd[6]~q ),
	.prn(vcc));
defparam \stadd[6] .is_wysiwyg = "true";
defparam \stadd[6] .power_up = "low";

cycloneiii_lcell_comb \stadd[7]~17 (
	.dataa(\stadd[7]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(\stadd[6]~16 ),
	.combout(\stadd[7]~17_combout ),
	.cout());
defparam \stadd[7]~17 .lut_mask = 16'h5A5A;
defparam \stadd[7]~17 .sum_lutc_input = "cin";

dffeas \stadd[7] (
	.clk(clk),
	.d(\stadd[7]~17_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\stadd[7]~8_combout ),
	.q(\stadd[7]~q ),
	.prn(vcc));
defparam \stadd[7] .is_wysiwyg = "true";
defparam \stadd[7] .power_up = "low";

cycloneiii_lcell_comb \stadd[7]~8 (
	.dataa(\enable_int~0_combout ),
	.datab(\LessThan0~0_combout ),
	.datac(\stadd[6]~q ),
	.datad(\stadd[7]~q ),
	.cin(gnd),
	.combout(\stadd[7]~8_combout ),
	.cout());
defparam \stadd[7]~8 .lut_mask = 16'hEFFF;
defparam \stadd[7]~8 .sum_lutc_input = "datac";

dffeas \stadd[2] (
	.clk(clk),
	.d(\stadd[2]~6_combout ),
	.asdata(vcc),
	.clrn(!reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\stadd[7]~8_combout ),
	.q(\stadd[2]~q ),
	.prn(vcc));
defparam \stadd[2] .is_wysiwyg = "true";
defparam \stadd[2] .power_up = "low";

cycloneiii_lcell_comb \LessThan0~0 (
	.dataa(\stadd[2]~q ),
	.datab(\stadd[3]~q ),
	.datac(\stadd[4]~q ),
	.datad(\stadd[5]~q ),
	.cin(gnd),
	.combout(\LessThan0~0_combout ),
	.cout());
defparam \LessThan0~0 .lut_mask = 16'h7FFF;
defparam \LessThan0~0 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \LessThan0~1 (
	.dataa(\LessThan0~0_combout ),
	.datab(gnd),
	.datac(\stadd[6]~q ),
	.datad(\stadd[7]~q ),
	.cin(gnd),
	.combout(\LessThan0~1_combout ),
	.cout());
defparam \LessThan0~1 .lut_mask = 16'hAFFF;
defparam \LessThan0~1 .sum_lutc_input = "datac";

cycloneiii_lcell_comb \outvalidnode_q~0 (
	.dataa(outvalidnode_q1),
	.datab(\enable_int~0_combout ),
	.datac(gnd),
	.datad(\LessThan0~1_combout ),
	.cin(gnd),
	.combout(\outvalidnode_q~0_combout ),
	.cout());
defparam \outvalidnode_q~0 .lut_mask = 16'hEEFF;
defparam \outvalidnode_q~0 .sum_lutc_input = "datac";

endmodule

module viterbi_altsyncram_1 (
	q_b,
	address_a,
	clocken1,
	data_a,
	address_b,
	clock0)/* synthesis synthesis_greybox=1 */;
output 	[3:0] q_b;
input 	[6:0] address_a;
input 	clocken1;
input 	[3:0] data_a;
input 	[6:0] address_b;
input 	clock0;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



viterbi_altsyncram_em43 auto_generated(
	.q_b({q_b[0]}),
	.address_a({address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.clocken1(clocken1),
	.data_a({data_a[0]}),
	.address_b({address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.clock0(clock0),
	.clock1(clock0));

endmodule

module viterbi_altsyncram_em43 (
	q_b,
	address_a,
	clocken1,
	data_a,
	address_b,
	clock0,
	clock1)/* synthesis synthesis_greybox=1 */;
output 	[0:0] q_b;
input 	[6:0] address_a;
input 	clocken1;
input 	[0:0] data_a;
input 	[6:0] address_b;
input 	clock0;
input 	clock1;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;


wire [143:0] ram_block1a0_PORTBDATAOUT_bus;

assign q_b[0] = ram_block1a0_PORTBDATAOUT_bus[0];

cycloneiii_ram_block ram_block1a0(
	.portawe(vcc),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(clock0),
	.ena0(vcc),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[0]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a0_PORTBDATAOUT_bus));
defparam ram_block1a0.clk1_core_clock_enable = "ena1";
defparam ram_block1a0.clk1_input_clock_enable = "ena1";
defparam ram_block1a0.clk1_output_clock_enable = "ena1";
defparam ram_block1a0.data_interleave_offset_in_bits = 1;
defparam ram_block1a0.data_interleave_width_in_bits = 1;
defparam ram_block1a0.logical_ram_name = "auk_vit_par_top_atl:auk_vit_par_top_atl_inst|auk_vit_par_trb_atl:\\ifg_cont:tracing_back_cont|altsyncram:decbit_RAM|altsyncram_em43:auto_generated|ALTSYNCRAM";
defparam ram_block1a0.mixed_port_feed_through_mode = "dont_care";
defparam ram_block1a0.operation_mode = "dual_port";
defparam ram_block1a0.port_a_address_clear = "none";
defparam ram_block1a0.port_a_address_width = 7;
defparam ram_block1a0.port_a_data_out_clear = "none";
defparam ram_block1a0.port_a_data_out_clock = "none";
defparam ram_block1a0.port_a_data_width = 1;
defparam ram_block1a0.port_a_first_address = 0;
defparam ram_block1a0.port_a_first_bit_number = 0;
defparam ram_block1a0.port_a_last_address = 71;
defparam ram_block1a0.port_a_logical_ram_depth = 72;
defparam ram_block1a0.port_a_logical_ram_width = 1;
defparam ram_block1a0.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a0.port_b_address_clear = "none";
defparam ram_block1a0.port_b_address_clock = "clock1";
defparam ram_block1a0.port_b_address_width = 7;
defparam ram_block1a0.port_b_data_out_clear = "none";
defparam ram_block1a0.port_b_data_out_clock = "clock1";
defparam ram_block1a0.port_b_data_width = 1;
defparam ram_block1a0.port_b_first_address = 0;
defparam ram_block1a0.port_b_first_bit_number = 0;
defparam ram_block1a0.port_b_last_address = 71;
defparam ram_block1a0.port_b_logical_ram_depth = 72;
defparam ram_block1a0.port_b_logical_ram_width = 1;
defparam ram_block1a0.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a0.port_b_read_enable_clock = "clock1";
defparam ram_block1a0.ram_block_type = "auto";

endmodule

module viterbi_altsyncram_2 (
	address_b,
	q_b,
	wren_a,
	clocken1,
	data_a,
	address_a,
	clock0)/* synthesis synthesis_greybox=1 */;
input 	[6:0] address_b;
output 	[3:0] q_b;
input 	wren_a;
input 	clocken1;
input 	[3:0] data_a;
input 	[6:0] address_a;
input 	clock0;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



viterbi_altsyncram_jb23 auto_generated(
	.address_b({address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.q_b({q_b[3],q_b[2],q_b[1],q_b[0]}),
	.wren_a(wren_a),
	.clocken1(clocken1),
	.data_a({data_a[3],data_a[2],data_a[1],data_a[0]}),
	.address_a({address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.clock0(clock0),
	.clock1(clock0));

endmodule

module viterbi_altsyncram_jb23 (
	address_b,
	q_b,
	wren_a,
	clocken1,
	data_a,
	address_a,
	clock0,
	clock1)/* synthesis synthesis_greybox=1 */;
input 	[6:0] address_b;
output 	[3:0] q_b;
input 	wren_a;
input 	clocken1;
input 	[3:0] data_a;
input 	[6:0] address_a;
input 	clock0;
input 	clock1;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;


wire [143:0] ram_block1a1_PORTBDATAOUT_bus;
wire [143:0] ram_block1a3_PORTBDATAOUT_bus;
wire [143:0] ram_block1a2_PORTBDATAOUT_bus;
wire [143:0] ram_block1a0_PORTBDATAOUT_bus;

assign q_b[1] = ram_block1a1_PORTBDATAOUT_bus[0];

assign q_b[3] = ram_block1a3_PORTBDATAOUT_bus[0];

assign q_b[2] = ram_block1a2_PORTBDATAOUT_bus[0];

assign q_b[0] = ram_block1a0_PORTBDATAOUT_bus[0];

cycloneiii_ram_block ram_block1a1(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(clock0),
	.ena0(vcc),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[1]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a1_PORTBDATAOUT_bus));
defparam ram_block1a1.clk1_core_clock_enable = "ena1";
defparam ram_block1a1.clk1_input_clock_enable = "ena1";
defparam ram_block1a1.clk1_output_clock_enable = "ena1";
defparam ram_block1a1.data_interleave_offset_in_bits = 1;
defparam ram_block1a1.data_interleave_width_in_bits = 1;
defparam ram_block1a1.logical_ram_name = "auk_vit_par_top_atl:auk_vit_par_top_atl_inst|auk_vit_par_trb_atl:\\ifg_cont:tracing_back_cont|altsyncram:sbot_RAM|altsyncram_jb23:auto_generated|ALTSYNCRAM";
defparam ram_block1a1.mixed_port_feed_through_mode = "old";
defparam ram_block1a1.operation_mode = "dual_port";
defparam ram_block1a1.port_a_address_clear = "none";
defparam ram_block1a1.port_a_address_width = 7;
defparam ram_block1a1.port_a_data_out_clear = "none";
defparam ram_block1a1.port_a_data_out_clock = "none";
defparam ram_block1a1.port_a_data_width = 1;
defparam ram_block1a1.port_a_first_address = 0;
defparam ram_block1a1.port_a_first_bit_number = 1;
defparam ram_block1a1.port_a_last_address = 71;
defparam ram_block1a1.port_a_logical_ram_depth = 72;
defparam ram_block1a1.port_a_logical_ram_width = 4;
defparam ram_block1a1.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a1.port_b_address_clear = "none";
defparam ram_block1a1.port_b_address_clock = "clock1";
defparam ram_block1a1.port_b_address_width = 7;
defparam ram_block1a1.port_b_data_out_clear = "none";
defparam ram_block1a1.port_b_data_out_clock = "clock1";
defparam ram_block1a1.port_b_data_width = 1;
defparam ram_block1a1.port_b_first_address = 0;
defparam ram_block1a1.port_b_first_bit_number = 1;
defparam ram_block1a1.port_b_last_address = 71;
defparam ram_block1a1.port_b_logical_ram_depth = 72;
defparam ram_block1a1.port_b_logical_ram_width = 4;
defparam ram_block1a1.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a1.port_b_read_enable_clock = "clock1";
defparam ram_block1a1.ram_block_type = "auto";

cycloneiii_ram_block ram_block1a3(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(clock0),
	.ena0(vcc),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[3]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a3_PORTBDATAOUT_bus));
defparam ram_block1a3.clk1_core_clock_enable = "ena1";
defparam ram_block1a3.clk1_input_clock_enable = "ena1";
defparam ram_block1a3.clk1_output_clock_enable = "ena1";
defparam ram_block1a3.data_interleave_offset_in_bits = 1;
defparam ram_block1a3.data_interleave_width_in_bits = 1;
defparam ram_block1a3.logical_ram_name = "auk_vit_par_top_atl:auk_vit_par_top_atl_inst|auk_vit_par_trb_atl:\\ifg_cont:tracing_back_cont|altsyncram:sbot_RAM|altsyncram_jb23:auto_generated|ALTSYNCRAM";
defparam ram_block1a3.mixed_port_feed_through_mode = "old";
defparam ram_block1a3.operation_mode = "dual_port";
defparam ram_block1a3.port_a_address_clear = "none";
defparam ram_block1a3.port_a_address_width = 7;
defparam ram_block1a3.port_a_data_out_clear = "none";
defparam ram_block1a3.port_a_data_out_clock = "none";
defparam ram_block1a3.port_a_data_width = 1;
defparam ram_block1a3.port_a_first_address = 0;
defparam ram_block1a3.port_a_first_bit_number = 3;
defparam ram_block1a3.port_a_last_address = 71;
defparam ram_block1a3.port_a_logical_ram_depth = 72;
defparam ram_block1a3.port_a_logical_ram_width = 4;
defparam ram_block1a3.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a3.port_b_address_clear = "none";
defparam ram_block1a3.port_b_address_clock = "clock1";
defparam ram_block1a3.port_b_address_width = 7;
defparam ram_block1a3.port_b_data_out_clear = "none";
defparam ram_block1a3.port_b_data_out_clock = "clock1";
defparam ram_block1a3.port_b_data_width = 1;
defparam ram_block1a3.port_b_first_address = 0;
defparam ram_block1a3.port_b_first_bit_number = 3;
defparam ram_block1a3.port_b_last_address = 71;
defparam ram_block1a3.port_b_logical_ram_depth = 72;
defparam ram_block1a3.port_b_logical_ram_width = 4;
defparam ram_block1a3.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a3.port_b_read_enable_clock = "clock1";
defparam ram_block1a3.ram_block_type = "auto";

cycloneiii_ram_block ram_block1a2(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(clock0),
	.ena0(vcc),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[2]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a2_PORTBDATAOUT_bus));
defparam ram_block1a2.clk1_core_clock_enable = "ena1";
defparam ram_block1a2.clk1_input_clock_enable = "ena1";
defparam ram_block1a2.clk1_output_clock_enable = "ena1";
defparam ram_block1a2.data_interleave_offset_in_bits = 1;
defparam ram_block1a2.data_interleave_width_in_bits = 1;
defparam ram_block1a2.logical_ram_name = "auk_vit_par_top_atl:auk_vit_par_top_atl_inst|auk_vit_par_trb_atl:\\ifg_cont:tracing_back_cont|altsyncram:sbot_RAM|altsyncram_jb23:auto_generated|ALTSYNCRAM";
defparam ram_block1a2.mixed_port_feed_through_mode = "old";
defparam ram_block1a2.operation_mode = "dual_port";
defparam ram_block1a2.port_a_address_clear = "none";
defparam ram_block1a2.port_a_address_width = 7;
defparam ram_block1a2.port_a_data_out_clear = "none";
defparam ram_block1a2.port_a_data_out_clock = "none";
defparam ram_block1a2.port_a_data_width = 1;
defparam ram_block1a2.port_a_first_address = 0;
defparam ram_block1a2.port_a_first_bit_number = 2;
defparam ram_block1a2.port_a_last_address = 71;
defparam ram_block1a2.port_a_logical_ram_depth = 72;
defparam ram_block1a2.port_a_logical_ram_width = 4;
defparam ram_block1a2.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a2.port_b_address_clear = "none";
defparam ram_block1a2.port_b_address_clock = "clock1";
defparam ram_block1a2.port_b_address_width = 7;
defparam ram_block1a2.port_b_data_out_clear = "none";
defparam ram_block1a2.port_b_data_out_clock = "clock1";
defparam ram_block1a2.port_b_data_width = 1;
defparam ram_block1a2.port_b_first_address = 0;
defparam ram_block1a2.port_b_first_bit_number = 2;
defparam ram_block1a2.port_b_last_address = 71;
defparam ram_block1a2.port_b_logical_ram_depth = 72;
defparam ram_block1a2.port_b_logical_ram_width = 4;
defparam ram_block1a2.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a2.port_b_read_enable_clock = "clock1";
defparam ram_block1a2.ram_block_type = "auto";

cycloneiii_ram_block ram_block1a0(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(clock0),
	.ena0(vcc),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[0]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a0_PORTBDATAOUT_bus));
defparam ram_block1a0.clk1_core_clock_enable = "ena1";
defparam ram_block1a0.clk1_input_clock_enable = "ena1";
defparam ram_block1a0.clk1_output_clock_enable = "ena1";
defparam ram_block1a0.data_interleave_offset_in_bits = 1;
defparam ram_block1a0.data_interleave_width_in_bits = 1;
defparam ram_block1a0.logical_ram_name = "auk_vit_par_top_atl:auk_vit_par_top_atl_inst|auk_vit_par_trb_atl:\\ifg_cont:tracing_back_cont|altsyncram:sbot_RAM|altsyncram_jb23:auto_generated|ALTSYNCRAM";
defparam ram_block1a0.mixed_port_feed_through_mode = "old";
defparam ram_block1a0.operation_mode = "dual_port";
defparam ram_block1a0.port_a_address_clear = "none";
defparam ram_block1a0.port_a_address_width = 7;
defparam ram_block1a0.port_a_data_out_clear = "none";
defparam ram_block1a0.port_a_data_out_clock = "none";
defparam ram_block1a0.port_a_data_width = 1;
defparam ram_block1a0.port_a_first_address = 0;
defparam ram_block1a0.port_a_first_bit_number = 0;
defparam ram_block1a0.port_a_last_address = 71;
defparam ram_block1a0.port_a_logical_ram_depth = 72;
defparam ram_block1a0.port_a_logical_ram_width = 4;
defparam ram_block1a0.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a0.port_b_address_clear = "none";
defparam ram_block1a0.port_b_address_clock = "clock1";
defparam ram_block1a0.port_b_address_width = 7;
defparam ram_block1a0.port_b_data_out_clear = "none";
defparam ram_block1a0.port_b_data_out_clock = "clock1";
defparam ram_block1a0.port_b_data_width = 1;
defparam ram_block1a0.port_b_first_address = 0;
defparam ram_block1a0.port_b_first_bit_number = 0;
defparam ram_block1a0.port_b_last_address = 71;
defparam ram_block1a0.port_b_logical_ram_depth = 72;
defparam ram_block1a0.port_b_logical_ram_width = 4;
defparam ram_block1a0.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a0.port_b_read_enable_clock = "clock1";
defparam ram_block1a0.ram_block_type = "auto";

endmodule

module viterbi_altsyncram_3 (
	address_b,
	q_b,
	wren_a,
	clocken1,
	data_a,
	address_a,
	clock0)/* synthesis synthesis_greybox=1 */;
input 	[6:0] address_b;
output 	[3:0] q_b;
input 	wren_a;
input 	clocken1;
input 	[3:0] data_a;
input 	[6:0] address_a;
input 	clock0;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



viterbi_altsyncram_jb23_1 auto_generated(
	.address_b({address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.q_b({q_b[3],q_b[2],q_b[1],q_b[0]}),
	.wren_a(wren_a),
	.clocken1(clocken1),
	.data_a({data_a[3],data_a[2],data_a[1],data_a[0]}),
	.address_a({address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.clock0(clock0),
	.clock1(clock0));

endmodule

module viterbi_altsyncram_jb23_1 (
	address_b,
	q_b,
	wren_a,
	clocken1,
	data_a,
	address_a,
	clock0,
	clock1)/* synthesis synthesis_greybox=1 */;
input 	[6:0] address_b;
output 	[3:0] q_b;
input 	wren_a;
input 	clocken1;
input 	[3:0] data_a;
input 	[6:0] address_a;
input 	clock0;
input 	clock1;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;


wire [143:0] ram_block1a1_PORTBDATAOUT_bus;
wire [143:0] ram_block1a3_PORTBDATAOUT_bus;
wire [143:0] ram_block1a2_PORTBDATAOUT_bus;
wire [143:0] ram_block1a0_PORTBDATAOUT_bus;

assign q_b[1] = ram_block1a1_PORTBDATAOUT_bus[0];

assign q_b[3] = ram_block1a3_PORTBDATAOUT_bus[0];

assign q_b[2] = ram_block1a2_PORTBDATAOUT_bus[0];

assign q_b[0] = ram_block1a0_PORTBDATAOUT_bus[0];

cycloneiii_ram_block ram_block1a1(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(clock0),
	.ena0(vcc),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[1]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a1_PORTBDATAOUT_bus));
defparam ram_block1a1.clk1_core_clock_enable = "ena1";
defparam ram_block1a1.clk1_input_clock_enable = "ena1";
defparam ram_block1a1.clk1_output_clock_enable = "ena1";
defparam ram_block1a1.data_interleave_offset_in_bits = 1;
defparam ram_block1a1.data_interleave_width_in_bits = 1;
defparam ram_block1a1.logical_ram_name = "auk_vit_par_top_atl:auk_vit_par_top_atl_inst|auk_vit_par_trb_atl:\\ifg_cont:tracing_back_cont|altsyncram:stop_RAM|altsyncram_jb23:auto_generated|ALTSYNCRAM";
defparam ram_block1a1.mixed_port_feed_through_mode = "old";
defparam ram_block1a1.operation_mode = "dual_port";
defparam ram_block1a1.port_a_address_clear = "none";
defparam ram_block1a1.port_a_address_width = 7;
defparam ram_block1a1.port_a_data_out_clear = "none";
defparam ram_block1a1.port_a_data_out_clock = "none";
defparam ram_block1a1.port_a_data_width = 1;
defparam ram_block1a1.port_a_first_address = 0;
defparam ram_block1a1.port_a_first_bit_number = 1;
defparam ram_block1a1.port_a_last_address = 71;
defparam ram_block1a1.port_a_logical_ram_depth = 72;
defparam ram_block1a1.port_a_logical_ram_width = 4;
defparam ram_block1a1.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a1.port_b_address_clear = "none";
defparam ram_block1a1.port_b_address_clock = "clock1";
defparam ram_block1a1.port_b_address_width = 7;
defparam ram_block1a1.port_b_data_out_clear = "none";
defparam ram_block1a1.port_b_data_out_clock = "clock1";
defparam ram_block1a1.port_b_data_width = 1;
defparam ram_block1a1.port_b_first_address = 0;
defparam ram_block1a1.port_b_first_bit_number = 1;
defparam ram_block1a1.port_b_last_address = 71;
defparam ram_block1a1.port_b_logical_ram_depth = 72;
defparam ram_block1a1.port_b_logical_ram_width = 4;
defparam ram_block1a1.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a1.port_b_read_enable_clock = "clock1";
defparam ram_block1a1.ram_block_type = "auto";

cycloneiii_ram_block ram_block1a3(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(clock0),
	.ena0(vcc),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[3]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a3_PORTBDATAOUT_bus));
defparam ram_block1a3.clk1_core_clock_enable = "ena1";
defparam ram_block1a3.clk1_input_clock_enable = "ena1";
defparam ram_block1a3.clk1_output_clock_enable = "ena1";
defparam ram_block1a3.data_interleave_offset_in_bits = 1;
defparam ram_block1a3.data_interleave_width_in_bits = 1;
defparam ram_block1a3.logical_ram_name = "auk_vit_par_top_atl:auk_vit_par_top_atl_inst|auk_vit_par_trb_atl:\\ifg_cont:tracing_back_cont|altsyncram:stop_RAM|altsyncram_jb23:auto_generated|ALTSYNCRAM";
defparam ram_block1a3.mixed_port_feed_through_mode = "old";
defparam ram_block1a3.operation_mode = "dual_port";
defparam ram_block1a3.port_a_address_clear = "none";
defparam ram_block1a3.port_a_address_width = 7;
defparam ram_block1a3.port_a_data_out_clear = "none";
defparam ram_block1a3.port_a_data_out_clock = "none";
defparam ram_block1a3.port_a_data_width = 1;
defparam ram_block1a3.port_a_first_address = 0;
defparam ram_block1a3.port_a_first_bit_number = 3;
defparam ram_block1a3.port_a_last_address = 71;
defparam ram_block1a3.port_a_logical_ram_depth = 72;
defparam ram_block1a3.port_a_logical_ram_width = 4;
defparam ram_block1a3.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a3.port_b_address_clear = "none";
defparam ram_block1a3.port_b_address_clock = "clock1";
defparam ram_block1a3.port_b_address_width = 7;
defparam ram_block1a3.port_b_data_out_clear = "none";
defparam ram_block1a3.port_b_data_out_clock = "clock1";
defparam ram_block1a3.port_b_data_width = 1;
defparam ram_block1a3.port_b_first_address = 0;
defparam ram_block1a3.port_b_first_bit_number = 3;
defparam ram_block1a3.port_b_last_address = 71;
defparam ram_block1a3.port_b_logical_ram_depth = 72;
defparam ram_block1a3.port_b_logical_ram_width = 4;
defparam ram_block1a3.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a3.port_b_read_enable_clock = "clock1";
defparam ram_block1a3.ram_block_type = "auto";

cycloneiii_ram_block ram_block1a2(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(clock0),
	.ena0(vcc),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[2]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a2_PORTBDATAOUT_bus));
defparam ram_block1a2.clk1_core_clock_enable = "ena1";
defparam ram_block1a2.clk1_input_clock_enable = "ena1";
defparam ram_block1a2.clk1_output_clock_enable = "ena1";
defparam ram_block1a2.data_interleave_offset_in_bits = 1;
defparam ram_block1a2.data_interleave_width_in_bits = 1;
defparam ram_block1a2.logical_ram_name = "auk_vit_par_top_atl:auk_vit_par_top_atl_inst|auk_vit_par_trb_atl:\\ifg_cont:tracing_back_cont|altsyncram:stop_RAM|altsyncram_jb23:auto_generated|ALTSYNCRAM";
defparam ram_block1a2.mixed_port_feed_through_mode = "old";
defparam ram_block1a2.operation_mode = "dual_port";
defparam ram_block1a2.port_a_address_clear = "none";
defparam ram_block1a2.port_a_address_width = 7;
defparam ram_block1a2.port_a_data_out_clear = "none";
defparam ram_block1a2.port_a_data_out_clock = "none";
defparam ram_block1a2.port_a_data_width = 1;
defparam ram_block1a2.port_a_first_address = 0;
defparam ram_block1a2.port_a_first_bit_number = 2;
defparam ram_block1a2.port_a_last_address = 71;
defparam ram_block1a2.port_a_logical_ram_depth = 72;
defparam ram_block1a2.port_a_logical_ram_width = 4;
defparam ram_block1a2.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a2.port_b_address_clear = "none";
defparam ram_block1a2.port_b_address_clock = "clock1";
defparam ram_block1a2.port_b_address_width = 7;
defparam ram_block1a2.port_b_data_out_clear = "none";
defparam ram_block1a2.port_b_data_out_clock = "clock1";
defparam ram_block1a2.port_b_data_width = 1;
defparam ram_block1a2.port_b_first_address = 0;
defparam ram_block1a2.port_b_first_bit_number = 2;
defparam ram_block1a2.port_b_last_address = 71;
defparam ram_block1a2.port_b_logical_ram_depth = 72;
defparam ram_block1a2.port_b_logical_ram_width = 4;
defparam ram_block1a2.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a2.port_b_read_enable_clock = "clock1";
defparam ram_block1a2.ram_block_type = "auto";

cycloneiii_ram_block ram_block1a0(
	.portawe(wren_a),
	.portare(vcc),
	.portaaddrstall(gnd),
	.portbwe(gnd),
	.portbre(vcc),
	.portbaddrstall(gnd),
	.clk0(clock0),
	.clk1(clock0),
	.ena0(vcc),
	.ena1(clocken1),
	.ena2(vcc),
	.ena3(vcc),
	.clr0(gnd),
	.clr1(gnd),
	.portadatain({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,
gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,data_a[0]}),
	.portaaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_a[6],address_a[5],address_a[4],address_a[3],address_a[2],address_a[1],address_a[0]}),
	.portabyteenamasks(1'b1),
	.portbdatain(1'b0),
	.portbaddr({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,address_b[6],address_b[5],address_b[4],address_b[3],address_b[2],address_b[1],address_b[0]}),
	.portbbyteenamasks(1'b1),
	.portadataout(),
	.portbdataout(ram_block1a0_PORTBDATAOUT_bus));
defparam ram_block1a0.clk1_core_clock_enable = "ena1";
defparam ram_block1a0.clk1_input_clock_enable = "ena1";
defparam ram_block1a0.clk1_output_clock_enable = "ena1";
defparam ram_block1a0.data_interleave_offset_in_bits = 1;
defparam ram_block1a0.data_interleave_width_in_bits = 1;
defparam ram_block1a0.logical_ram_name = "auk_vit_par_top_atl:auk_vit_par_top_atl_inst|auk_vit_par_trb_atl:\\ifg_cont:tracing_back_cont|altsyncram:stop_RAM|altsyncram_jb23:auto_generated|ALTSYNCRAM";
defparam ram_block1a0.mixed_port_feed_through_mode = "old";
defparam ram_block1a0.operation_mode = "dual_port";
defparam ram_block1a0.port_a_address_clear = "none";
defparam ram_block1a0.port_a_address_width = 7;
defparam ram_block1a0.port_a_data_out_clear = "none";
defparam ram_block1a0.port_a_data_out_clock = "none";
defparam ram_block1a0.port_a_data_width = 1;
defparam ram_block1a0.port_a_first_address = 0;
defparam ram_block1a0.port_a_first_bit_number = 0;
defparam ram_block1a0.port_a_last_address = 71;
defparam ram_block1a0.port_a_logical_ram_depth = 72;
defparam ram_block1a0.port_a_logical_ram_width = 4;
defparam ram_block1a0.port_a_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a0.port_b_address_clear = "none";
defparam ram_block1a0.port_b_address_clock = "clock1";
defparam ram_block1a0.port_b_address_width = 7;
defparam ram_block1a0.port_b_data_out_clear = "none";
defparam ram_block1a0.port_b_data_out_clock = "clock1";
defparam ram_block1a0.port_b_data_width = 1;
defparam ram_block1a0.port_b_first_address = 0;
defparam ram_block1a0.port_b_first_bit_number = 0;
defparam ram_block1a0.port_b_last_address = 71;
defparam ram_block1a0.port_b_logical_ram_depth = 72;
defparam ram_block1a0.port_b_logical_ram_width = 4;
defparam ram_block1a0.port_b_read_during_write_mode = "new_data_with_nbe_read";
defparam ram_block1a0.port_b_read_enable_clock = "clock1";
defparam ram_block1a0.ram_block_type = "auto";

endmodule
