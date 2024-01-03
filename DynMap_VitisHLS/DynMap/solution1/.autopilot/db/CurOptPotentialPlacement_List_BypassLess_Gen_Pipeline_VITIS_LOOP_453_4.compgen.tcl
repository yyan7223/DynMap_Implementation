# This script segment is generated automatically by AutoPilot

# Memory (RAM/ROM)  definition:
set ID 68
set hasByteEnable 0
set MemName runOne_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_allocaeOg
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 4
set AddrRange 320
set AddrWd 9
set impl_style auto
set TrueReset 0
set IsROM 1
set ROMData { "0101" "1001" "0001" "0100" "0110" "1000" "1010" "1101" "0000" "0010" "1100" "1110" "0000" "0000" "0000" "0000" "0110" "1010" "0101" "1001" "0111" "1011" "0010" "0011" "0100" "1000" "1110" "1111" "0000" "0000" "0000" "0000" "1001" "0100" "0101" "1000" "1010" "1101" "1110" "0000" "0001" "1011" "1100" "1111" "0000" "0000" "0000" "0000" "0001" "0010" "0011" "0100" "0101" "0110" "0111" "1000" "1001" "1010" "0000" "1011" "0000" "0000" "0000" "0000" "1001" "0101" "1000" "0100" "0110" "1010" "1100" "1101" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0100" "0101" "1000" "1001" "0000" "0001" "1100" "1101" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0101" "1001" "0000" "0001" "0100" "1010" "1101" "1110" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0001" "0010" "0011" "0100" "0101" "0110" "0000" "0111" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "1001" "1101" "1000" "1010" "1100" "1110" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "1000" "1101" "1001" "1100" "0100" "1110" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "1001" "1110" "1010" "1101" "1000" "1111" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0001" "0010" "0011" "0100" "0000" "0101" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "1101" "1000" "1001" "1100" "1110" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "1101" "1001" "0101" "1100" "1110" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "1000" "1100" "1101" "0100" "1110" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0001" "0010" "0011" "0000" "0100" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "1000" "1001" "1100" "1101" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "1100" "1101" "1000" "1110" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "1001" "1101" "1000" "1110" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0001" "0010" "0000" "0011" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" "0000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set DelayBudget 2.771
set ClkPeriod 10
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $MemName BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


set CoreName ROM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 69 \
    name CGRA_NumTiles_shapes_values_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_CGRA_NumTiles_shapes_values_load \
    op interface \
    ports { CGRA_NumTiles_shapes_values_load { I 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 70 \
    name shape_idx_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_shape_idx_load \
    op interface \
    ports { shape_idx_load { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 71 \
    name surrTile \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_surrTile \
    op interface \
    ports { surrTile { I 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -2 \
    name ap_return \
    type ap_return \
    reset_level 1 \
    sync_rst true \
    corename ap_return \
    op interface \
    ports { ap_return { O 1 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -4 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName runOne_flow_control_loop_pipe_sequential_init_U
set CompName runOne_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix runOne_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


