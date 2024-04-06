set megacore_wrapper_dir {D:/projects/ConvCode/src/ip}
set megacore_lib_dir {e:/quartus/ip/altera/viterbi/lib/}

##from entity_name.esf
set design_name "viterbi"
## for architecture values are "HYB_ATL" or "PAR_ATL"
set viterbi_arch "PAR_ATL"
set hdl_language "verilog"

# EDA Tool  , 1 - Modelsim, 2 - Modelsim-Altera,  3 - NCSim , 4 - VCS, 5 - ActiveHDL

################
set user_wrapper_name $design_name
set vit_arch $viterbi_arch
## this is necessary in Linux.
set vit_arch [string tolower $vit_arch]

catch {set txt_files [glob *.txt]} return_msg

if {[file exists ${user_wrapper_name}.vho]} {
	set ipfs_ext ".vho"
	set hdl_ext "vhd"
	set lang_name "VHDL"
} elseif {[file exists ${user_wrapper_name}.vo]} {
	set ipfs_ext ".vo"
	set hdl_ext "v"
	set lang_name "Verilog"
} else {
	puts "Error: IPFS file not found! Simulation is going to fail!"
	#exit
}

set_global_assignment -name EDA_OUTPUT_DATA_FORMAT "$lang_name" -section_id eda_simulation
# Set test bench name
set_global_assignment -name EDA_TEST_BENCH_NAME testbench -section_id eda_simulation
# test bench settings
set_global_assignment -name EDA_DESIGN_INSTANCE_NAME wrapper_inst -section_id testbench
set_global_assignment -name EDA_TEST_BENCH_MODULE_NAME work.testbench -section_id testbench

foreach i $txt_files {
	set_global_assignment -name EDA_TEST_BENCH_FILE "$i" -section_id testbench -library work
}

set_global_assignment -name EDA_IPFS_FILE "${user_wrapper_name}${ipfs_ext}" -section_id eda_simulation -library work
set_global_assignment -name EDA_TEST_BENCH_FILE "[file join $megacore_lib_dir vi_interface.vhd]" -section_id testbench -library viterbi
set_global_assignment -name EDA_TEST_BENCH_FILE "[file join $megacore_lib_dir vi_functions.vhd]" -section_id testbench -library viterbi
set_global_assignment -name EDA_TEST_BENCH_FILE "[file join $megacore_lib_dir vi_interface.vhd]" -section_id testbench -library work
set_global_assignment -name EDA_TEST_BENCH_FILE "[file join $megacore_lib_dir vi_functions.vhd]" -section_id testbench -library work
set_global_assignment -name EDA_TEST_BENCH_FILE "[file join $megacore_lib_dir vi_bench.vhd]" -section_id testbench -library work
set_global_assignment -name EDA_TEST_BENCH_FILE "[file join $megacore_lib_dir auk_vit_var_enc_ent.vhd]" -section_id testbench -library work
set_global_assignment -name EDA_TEST_BENCH_FILE "[file join $megacore_lib_dir auk_vit_var_enc_arc_rtl.vhd]" -section_id testbench -library work
set_global_assignment -name EDA_TEST_BENCH_FILE "[file join $megacore_lib_dir Bench_vit_${vit_arch}_ent.vhd]" -section_id testbench -library work
set_global_assignment -name EDA_TEST_BENCH_FILE "[file join $megacore_lib_dir Bench_vit_${vit_arch}_arc_ben.vhd]" -section_id testbench -library work

set_global_assignment -name EDA_TEST_BENCH_FILE "${user_wrapper_name}_testbench.vhd" -section_id testbench -library work
# Specify testbench mode for nativelink
set_global_assignment -name EDA_TEST_BENCH_ENABLE_STATUS TEST_BENCH_MODE -section_id eda_simulation
# Specify active testbench for nativelink
set_global_assignment -name EDA_NATIVELINK_SIMULATION_TEST_BENCH testbench -section_id eda_simulation
# IPFS file





