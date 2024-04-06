#########################################################################
#########################################################################
##
## Revision Control Information
##
## $RCSfile: generic_vsim_script.tcl,v $
## $Source: /cvs/uksw/dsp_cores/Viterbi/Scripts/MegaCore/generic_vsim_script.tcl,v $
##
## $Revision: #1 $
## $Date: 2013/08/11 $
## Author				:  Alejandro Diaz-Manero
##                   
## Check in by  : $Author: swbranch $
##
## Project      :  Viterbi
##
## Description	:  Generic script to be customized by Megawizard 
##                 for running RTL simulation in Modelsim
##
## ALTERA Proprietary
## Copyright 2003 (c) Altera Corporation
## All rights reserved
##
#########################################################################
#########################################################################

set megacore_wrapper_dir {D:/projects/ConvCode/src/ip}
set megacore_lib_dir {e:/quartus/ip/altera/viterbi/lib/}

##from entity_name.esf
set design_name "viterbi"
## for architecture values are "HYB_ATL" or "PAR_ATL"
set viterbi_arch "PAR_ATL"
set hdl_language "verilog"

global env
if ![info exists env(QUARTUS_ROOTDIR)] {
	puts "Expected Enviroment variable QUARTUS_ROOTDIR pointing to a valid Quartus installation"
	exit
}
set q_sim_lib [file join $env(QUARTUS_ROOTDIR) eda sim_lib]
# Close existing ModelSim simulation 
quit -sim
# Set simgen model as the default simulation model
if [file exists "megatest_vars.tcl"] {
	source megatest_vars.tcl
	#  Now 2 posibilities
	## possibility 1 :  set MegaTest::run_ModelSim_rtl YES 		set MegaTest::activate_simgen  NO 		set MegaTest::run_ModelSim_vho NO
	## possibility 2 :  set MegaTest::run_ModelSim_rtl NO 		set MegaTest::activate_simgen  NO 		set MegaTest::run_ModelSim_vho YES
	if {[string match -nocase "YES" $run_ModelSim_rtl]} {
		set development 1
	} elseif {[string match -nocase "YES" $run_ModelSim_vho]} {
		set development 2; ## gate level simulations
	} else {
		set development 0
	}
	
	set vsim_working_dir $megacore_wrapper_dir
	## I will change this to the built location
	set test_bench_location [file join $env(HOTEL) Data Projects Viterbi Testbenches]
	onerror {quit -f}
  onbreak {resume}
} else {
	set development 0
	## onbreak resume is done to avoid getting the test case stuck during regtesting
	onbreak {resume}
	set test_bench_location $megacore_lib_dir
	# I have to connect vsim_working_dir
	if {[info exists megacore_wrapper_dir]} {
		set vsim_working_dir $megacore_wrapper_dir
	} else {
		puts "Error: megacore_wrapper_dir variable is not defined and not development mode identified: Exiting"
		exit
	}
}
if [file exists "do_coverage.tcl"] {
	set do_coverage 1
} else {
	set do_coverage 0
}
if {![info exists use_ipfs]} {
    set use_ipfs 1
}
switch $viterbi_arch {
    HYB_ATL {set st "hyb"}
    PAR_ATL {set st "par"}
    default {error "The viterbi architecture \"$viterbi_arch\" was not recognised!"}
}

cd $vsim_working_dir

## this has to go
set vhd_path [file join .. sim_lib ModelSim vhdl]


## Assuming verilog wrapper means the user will select verilog for ipfs. That may not be 
## necessarily true: do a search for file and its extension to determine that 

switch $hdl_language {
    vhdl    {set ext_wrapper "vhd"}
    verilog {set ext_wrapper "v"}
    default {error "Value assigned to variable hdl_language \"$hdl_language\" was not recognised!"}
}

## If I am doing development or megatest then this libs are compiled just once
## at the beginning of the tests. And bypass here
## However they ought to be compiled when the user runs this script
set quartus_libs [list \
altera_mf {altera_mf_components altera_mf} {altera_mf} 		"$q_sim_lib" 	\
		lpm       {220pack 220model}	{220model}						 		"$q_sim_lib" 	\
		sgate			{sgate_pack sgate} {sgate}							 		"$q_sim_lib" 	]
##		stratix		{stratix_atoms stratix_components} {stratix_atoms}	"$q_sim_lib"	\
##		cyclone		{cyclone_atoms cyclone_components} {cyclone_atoms}  "$q_sim_lib"  \
##		stratixii {stratixii_atoms stratixii_components} {stratixii_atoms} "$q_sim_lib"  \
##		cycloneii	{cycloneii_atoms cycloneii_components} {cycloneii_atoms} "$q_sim_lib"  ]

if {[file exists ${design_name}.vho]} {
	puts "Info: IPFS file ${design_name}.vho found"
	set ext_ipfs "vho"
	set use_ipfs 1
} elseif {[file exists ${design_name}.vo]} {
	puts "Info: IPFS file ${design_name}.vo found"
	set ext_ipfs "vo"
	set use_ipfs 1
} else {
	puts "Info: No IPFS model found. Simulating with ModelSim development library"
	set use_ipfs 0
}

## The libraries sgate, lpm & altera_mf are not compiled in the ALTERA version
## of ModelSim 
if {($use_ipfs == 1) && ([vsimAuth] != "ALTERA")} {
	foreach {lib file_vhdl_list file_verilog_list src_files_loc} $quartus_libs {
		vlib $lib
		vmap $lib $lib
		if {[string match "vho" $ext_ipfs]} {
			foreach file_item $file_vhdl_list {
				# in here I should use a device family parameter to just compile the required library only (optional)
				catch {vcom -explicit -93 -work $lib [file join $src_files_loc ${file_item}.vhd]} err_msg
				if {![string match "" $err_msg]} {return $err_msg}
			}
		} elseif {[string match "vo" $ext_ipfs]} {
			foreach file_item $file_verilog_list {
				catch {vlog -work $lib [file join $src_files_loc ${file_item}.v]} err_msg
				if {![string match "" $err_msg]} {return $err_msg}
			}
		}
	}
}

catch {
	vdel -lib work -all
}

catch {
	vlib work
	vmap work [file join $megacore_wrapper_dir work]
	#if {$use_ipfs == 1} 
	vmap viterbi [file join $megacore_wrapper_dir work]
	if {$development == 1} {
		set base_dir [file join $env(HOTEL) Data Projects Viterbi Deliverables viterbi-v${core_version} escrow ModelSim_libs]
		if {[file exists $base_dir]} {
			set fid_lock [open [file join $base_dir Viterbi_in_use_lock] w]
			puts $fid_lock "locking Viterbi for Simulation"
			close $fid_lock
		}
		vmap altera_mf [file join $base_dir altera_mf]
		vcom -work altera_mf -force_refresh
		vmap viterbi [file join $base_dir Viterbi]
		vcom -work viterbi -force_refresh
	}
} 

## Note: For verilog wrapper / ipfs model a dual license is required in modelsim
## in order to use the provided VHDL testbench. We don't have Verilog Testbench yet

catch {
	vcom -explicit -93 -work work [file join $megacore_lib_dir vi_interface.vhd]
	vcom -explicit -93 -work work [file join $megacore_lib_dir vi_functions.vhd]
	vcom -explicit -93 -work work [file join $megacore_lib_dir vi_bench.vhd]
	vcom -explicit -93 -work work [file join $megacore_lib_dir auk_vit_var_enc_ent.vhd]
	vcom -explicit -93 -work work [file join $megacore_lib_dir auk_vit_var_enc_arc_rtl.vhd]
	if {$use_ipfs == 1} {
		if {[string match "vho" $ext_ipfs]} {
			vcom -explicit -93 -work work [file join $vsim_working_dir ${design_name}.vho]
		} elseif {[string match "vo" $ext_ipfs]} {
			vlog -work work [file join $vsim_working_dir ${design_name}.vo]
		}
	} elseif {$development == 1} {
		if {[string match "vhdl" $hdl_language]} {
			vcom -explicit -93 -work work [file join $vsim_working_dir ${design_name}.vhd]
		} elseif {[string match "verilog" $hdl_language]} {
			vlog -work work [file join $megacore_wrapper_dir ${design_name}.v]
		}
		## Gate-level
	} elseif {$development == 2} {
		if {[string match "vhdl" $hdl_language]} {
			vcom -explicit -93 -work work [file join $vsim_working_dir simulation modelsim ${design_name}.vho]
		} elseif {[string match "verilog" $hdl_language]} {
			vlog -work work [file join $vsim_working_dir simulation modelsim ${design_name}.vo]
		}
	}
	vcom -explicit -93 -work work [file join $megacore_lib_dir Bench_vit_${st}_atl_ent.vhd]
	vcom -explicit -93 -work work [file join $megacore_lib_dir Bench_vit_${st}_atl_arc_ben.vhd]
	vcom -explicit -93 -work work [file join $megacore_wrapper_dir ${design_name}_testbench.vhd]
}

set timing_resolution "1ns"
if {$use_ipfs == 1} {
	set timing_resolution "1ps"
}
if {[info exists run_ModelSim_vho]} {
	if {[string match "YES" $run_ModelSim_vho]} {
		set timing_resolution "1ps"
	}
}

set vsim_cmd vsim
if {($development == 1) && ($do_coverage == 1)} {
	lappend vsim_cmd "-coverage"
}
if {[string match -nocase "verilog" $hdl_language] && ([vsimAuth] != "ALTERA") && ($development == 0)} {
	lappend vsim_cmd "-L" "Sgate" "-L" "altera_mf" "-L" "lpm"
}	elseif {[string match -nocase "verilog" $hdl_language] && ([vsimAuth] == "ALTERA") && ($development == 0)} {
	lappend vsim_cmd "-L" "Sgate_ver" "-L" "altera_mf_ver" "-L" "lpm_ver"
} 
lappend vsim_cmd "work.cfg_testbench"
if {$development == 2} {
	lappend vsim_cmd "-sdftyp" "/testbench/wrapper_inst=./simulation/modelsim/${design_name}_vhd.sdo"
}
lappend vsim_cmd "-t"
lappend vsim_cmd "$timing_resolution"

catch {
	#vsim -L sgate -L altera_mf -L lpm work.cfg_testbench 
	eval $vsim_cmd
	if {$development == 1} {
		if {[string match "par" $st]} {
			add log sim:/testbench/test_controller/*
			## Now there is _mem  _cont and _block for traceback architectures
			add log sim:/testbench/wrapper_inst/auk_vit_par_top_atl_inst/tracing_back_mem/*
			#add log sim:/testbench/wrapper_inst/auk_vit_par_top_atl_inst/metric_processing/*
		} else {
			add log sim:/testbench/test_controller/*
			add log sim:/testbench/wrapper_inst/auk_vit_hyb_top_atl_inst/traceback/*
			add log sim:/testbench/wrapper_inst/auk_vit_hyb_top_atl_inst/metric_processing/path_selection/*
		}
	} else {
		add wave sim:/testbench/test_controller/*
	}
} vsim_msg
puts $vsim_msg
set StdArithNoWarnings 1
run 0 ns
set StdArithNoWarnings 0
catch {run -all} run_msg
puts $run_msg
if {$development == 1} {
	file delete -force -- [file join $base_dir Viterbi_in_use_lock]
	if {$do_coverage == 1} {
		if [file exists "coverage_data.log"] {coverage reload -incremental coverage_data.log}
		coverage save coverage_data.log
		coverage report -all -file cov_rpt_all.log
		coverage report -file cov_rpt_lines.log -byfile -lines -zeros -select {s b c e}
	}
}
if [file exists "finish_megatest_run.tcl"] {source finish_megatest_run.tcl}

