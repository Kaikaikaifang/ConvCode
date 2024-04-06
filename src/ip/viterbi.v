// megafunction wizard: %Viterbi v13.1%
// GENERATION: XML

// ============================================================
// Megafunction Name(s):
// 			auk_vit_par_top_atl
// ============================================================
// Generated by Viterbi 13.1 [Altera, IP Toolbench 1.3.0 Build 162]
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
// ************************************************************
// Copyright (C) 1991-2024 Altera Corporation
// Any megafunction design, and related net list (encrypted or decrypted),
// support information, device programming or simulation file, and any other
// associated documentation or information provided by Altera or a partner
// under Altera's Megafunction Partnership Program may be used only to
// program PLD devices (but not masked PLD devices) from Altera.  Any other
// use of such megafunction design, net list, support information, device
// programming or simulation file, or any other related documentation or
// information is prohibited for any other purpose, including, but not
// limited to modification, reverse engineering, de-compiling, or use with
// any other silicon devices, unless such use is explicitly licensed under
// a separate agreement with Altera or a megafunction partner.  Title to
// the intellectual property, including patents, copyrights, trademarks,
// trade secrets, or maskworks, embodied in any such megafunction design,
// net list, support information, device programming or simulation file, or
// any other related documentation or information provided by Altera or a
// megafunction partner, remains with Altera, the megafunction partner, or
// their respective licensors.  No other licenses, including any licenses
// needed under any third party's intellectual property, are provided herein.


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
	normalizations);


	input		clk;
	input		reset;
	input		source_rdy;
	input		sink_val;
	input	[2:1]	rr;
	input	[2:1]	eras_sym;
	output		sink_rdy;
	output		source_val;
	output		decbit;
	output	[8:1]	normalizations;

	wire [6:1] signal_wire0 = 6'b0;
	wire signal_wire1 = 1'b0;
	wire signal_wire2 = 1'b0;
	wire [2:1] signal_wire3 = 2'b0;
	wire [1:1] signal_wire4 = 1'b0;
	wire [1:1] signal_wire5 = 1'b0;
	wire signal_wire6 = 1'b0;
	wire signal_wire7 = 1'b0;

	auk_vit_par_top_atl	auk_vit_par_top_atl_inst(
		.clk(clk),
		.reset(reset),
		.source_rdy(source_rdy),
		.sink_val(sink_val),
		.tb_length(signal_wire0),
		.sink_sop(signal_wire1),
		.sink_eop(signal_wire2),
		.tr_init_state(signal_wire3),
		.rr(rr),
		.eras_sym(eras_sym),
		.state_node_sync(signal_wire4),
		.sel_code(signal_wire5),
		.tb_type(signal_wire6),
		.ber_clear(signal_wire7),
		.source_sop(),
		.source_eop(),
		.bestadd(),
		.bestmet(),
		.sink_rdy(sink_rdy),
		.source_val(source_val),
		.decbit(decbit),
		.normalizations(normalizations));

	defparam
		auk_vit_par_top_atl_inst.N = "2",
		auk_vit_par_top_atl_inst.L = "3",
		auk_vit_par_top_atl_inst.DEC_MODE = "V",
		auk_vit_par_top_atl_inst.NCODES = 1,
		auk_vit_par_top_atl_inst.N_MAX = 2,
		auk_vit_par_top_atl_inst.LOG2_N_MAX = 1,
		auk_vit_par_top_atl_inst.RR_SIZE = 2,
		auk_vit_par_top_atl_inst.CONSTRAINT_LENGTH_M_1 = 2,
		auk_vit_par_top_atl_inst.V = 18,
		auk_vit_par_top_atl_inst.SOFTBITS = 1,
		auk_vit_par_top_atl_inst.BMGWIDE = 6,
		auk_vit_par_top_atl_inst.VLOG_WIDE = 6,
		auk_vit_par_top_atl_inst.SEL_CODE_SIZE = 1,
		auk_vit_par_top_atl_inst.ga = "5",
		auk_vit_par_top_atl_inst.gb = "7",
		auk_vit_par_top_atl_inst.gc = "0",
		auk_vit_par_top_atl_inst.gd = "0",
		auk_vit_par_top_atl_inst.ge = "0",
		auk_vit_par_top_atl_inst.gf = "0",
		auk_vit_par_top_atl_inst.gg = "0",
		auk_vit_par_top_atl_inst.BER = "unused",
		auk_vit_par_top_atl_inst.best_state_finder = "unused",
		auk_vit_par_top_atl_inst.parallel_optimization = "continuous",
		auk_vit_par_top_atl_inst.NODE_SYNC = "unused",
		auk_vit_par_top_atl_inst.NUMERR_SIZE = 8;
endmodule

// =========================================================
// Viterbi Wizard Data
// ===============================
// DO NOT EDIT FOLLOWING DATA
// @Altera, IP Toolbench@
// Warning: If you modify this section, Viterbi Wizard may not be able to reproduce your chosen configuration.
// 
// Retrieval info: <?xml version="1.0"?>
// Retrieval info: <MEGACORE title="Viterbi Compiler"  version="13.1"  build="162"  iptb_version="1.3.0 Build 162"  format_version="120" >
// Retrieval info:  <NETLIST_SECTION class="altera.ipbu.flowbase.netlist.model.ViterbiModel"  active_core="auk_vit_par_top_atl" >
// Retrieval info:   <STATIC_SECTION>
// Retrieval info:    <PRIVATES>
// Retrieval info:     <NAMESPACE name = "parameterization">
// Retrieval info:      <PRIVATE name = "use_mem" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "mem_type" value="M512"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "ARCHITECTURE" value="parallel"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "BER" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "NODE_SYNC" value="0"  type="BOOLEAN"  enable="0" />
// Retrieval info:      <PRIVATE name = "parallel_optimization" value="continuous"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "best_state_finder" value="0"  type="BOOLEAN"  enable="0" />
// Retrieval info:      <PRIVATE name = "CONSTRAINT" value="3"  type="INTEGER"  enable="0" />
// Retrieval info:      <PRIVATE name = "ACS_UNITS" value="1"  type="INTEGER"  enable="0" />
// Retrieval info:      <PRIVATE name = "TRACEBACK" value="18"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "SOFTBITS" value="1"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "BMGWIDE" value="6"  type="INTEGER"  enable="0" />
// Retrieval info:      <PRIVATE name = "NCODES" value="1"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "SM_INIT_LOGIC" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "BLOCK_SIZE" value="256"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "NUM_BLOCKS" value="1"  type="INTEGER"  enable="0" />
// Retrieval info:      <PRIVATE name = "NOISE_RATIO" value="10.0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "DECIMALOCTAL" value="decimal"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "clock_speed" value="150.0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "punc_a" value="11"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "punc_b" value="11"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "test_for" value="BER"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "L0" value="3"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "N0" value="2"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "MODE0" value="V"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_0_0" value="5"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_0_1" value="7"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_0_2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_0_3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_0_4" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_0_5" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_0_6" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "L1" value="7"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "N1" value="2"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "MODE1" value="V"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_1_0" value="91"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_1_1" value="121"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_1_2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_1_3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_1_4" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_1_5" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_1_6" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "L2" value="7"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "N2" value="2"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "MODE2" value="V"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_2_0" value="91"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_2_1" value="121"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_2_2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_2_3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_2_4" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_2_5" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_2_6" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "L3" value="7"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "N3" value="2"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "MODE3" value="V"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_3_0" value="91"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_3_1" value="121"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_3_2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_3_3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_3_4" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_3_5" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_3_6" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "L4" value="7"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "N4" value="2"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "MODE4" value="V"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_4_0" value="91"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_4_1" value="121"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_4_2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_4_3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_4_4" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_4_5" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_4_6" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "L5" value="7"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "N5" value="2"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "MODE5" value="V"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_5_0" value="91"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_5_1" value="121"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_5_2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_5_3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_5_4" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_5_5" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_5_6" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "L6" value="7"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "N6" value="2"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "MODE6" value="V"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_6_0" value="91"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_6_1" value="121"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_6_2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_6_3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_6_4" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_6_5" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_6_6" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "L7" value="7"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "N7" value="2"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "MODE7" value="V"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_7_0" value="91"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_7_1" value="121"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_7_2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_7_3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_7_4" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_7_5" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "POLY_CODE_7_6" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "simgen_enable">
// Retrieval info:      <PRIVATE name = "language" value="Verilog HDL"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "enabled" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "gb_enabled" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "simgen">
// Retrieval info:      <PRIVATE name = "filename" value="viterbi.vo"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "greybox">
// Retrieval info:      <PRIVATE name = "filename" value="viterbi_syn.v"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "serializer"/>
// Retrieval info:     <NAMESPACE name = "quartus_settings">
// Retrieval info:      <PRIVATE name = "DEVICE" value="EP3C25E144C8"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "FAMILY" value="Cyclone III"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:    </PRIVATES>
// Retrieval info:    <FILES/>
// Retrieval info:    <PORTS/>
// Retrieval info:    <LIBRARIES/>
// Retrieval info:   </STATIC_SECTION>
// Retrieval info:  </NETLIST_SECTION>
// Retrieval info: </MEGACORE>
// =========================================================
// RELATED_FILES: viterbi.v;
// IPFS_FILES: viterbi.vo;
// =========================================================
