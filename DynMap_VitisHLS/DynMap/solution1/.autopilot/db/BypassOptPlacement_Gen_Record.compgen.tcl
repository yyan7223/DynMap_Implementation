# This script segment is generated automatically by AutoPilot

# Memory (RAM/ROM)  definition:
set ID 185
set hasByteEnable 0
set MemName runOne_BypassOptPlacement_Gen_Record_Tile2XY_0_ROM_AUTO_1R
set CoreName ap_simcore_mem
set PortList { 1 1 }
set DataWd 2
set AddrRange 16
set AddrWd 4
set impl_style auto
set TrueReset 0
set IsROM 1
set ROMData { "00" "01" "10" "11" "00" "01" "10" "11" "00" "01" "10" "11" "00" "01" "10" "11" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set DelayBudget 1.755
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
    port_num 2 \
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
    port_num 2 \
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


# Memory (RAM/ROM)  definition:
set ID 186
set hasByteEnable 0
set MemName runOne_BypassOptPlacement_Gen_Record_Tile2XY_1_ROM_AUTO_1R
set CoreName ap_simcore_mem
set PortList { 1 1 }
set DataWd 2
set AddrRange 16
set AddrWd 4
set impl_style auto
set TrueReset 0
set IsROM 1
set ROMData { "00" "00" "00" "00" "01" "01" "01" "01" "10" "10" "10" "10" "11" "11" "11" "11" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set DelayBudget 1.755
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
    port_num 2 \
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
    port_num 2 \
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

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 190 \
    name placement_dynamic_dict_Opt2PC_keys \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename placement_dynamic_dict_Opt2PC_keys \
    op interface \
    ports { placement_dynamic_dict_Opt2PC_keys_address0 { O 7 vector } placement_dynamic_dict_Opt2PC_keys_ce0 { O 1 bit } placement_dynamic_dict_Opt2PC_keys_we0 { O 1 bit } placement_dynamic_dict_Opt2PC_keys_d0 { O 8 vector } placement_dynamic_dict_Opt2PC_keys_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_dynamic_dict_Opt2PC_keys'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 191 \
    name placement_dynamic_dict_Opt2PC_values \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename placement_dynamic_dict_Opt2PC_values \
    op interface \
    ports { placement_dynamic_dict_Opt2PC_values_address0 { O 7 vector } placement_dynamic_dict_Opt2PC_values_ce0 { O 1 bit } placement_dynamic_dict_Opt2PC_values_we0 { O 1 bit } placement_dynamic_dict_Opt2PC_values_d0 { O 8 vector } placement_dynamic_dict_Opt2PC_values_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_dynamic_dict_Opt2PC_values'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 198 \
    name placement_dynamic_bypass_occupy \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename placement_dynamic_bypass_occupy \
    op interface \
    ports { placement_dynamic_bypass_occupy_address0 { O 15 vector } placement_dynamic_bypass_occupy_ce0 { O 1 bit } placement_dynamic_bypass_occupy_we0 { O 1 bit } placement_dynamic_bypass_occupy_d0 { O 1 vector } placement_dynamic_bypass_occupy_q0 { I 1 vector } placement_dynamic_bypass_occupy_address1 { O 15 vector } placement_dynamic_bypass_occupy_ce1 { O 1 bit } placement_dynamic_bypass_occupy_q1 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_dynamic_bypass_occupy'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 199 \
    name placement_dynamic_bypass \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename placement_dynamic_bypass \
    op interface \
    ports { placement_dynamic_bypass_address0 { O 14 vector } placement_dynamic_bypass_ce0 { O 1 bit } placement_dynamic_bypass_we0 { O 1 bit } placement_dynamic_bypass_d0 { O 8 vector } placement_dynamic_bypass_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_dynamic_bypass'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 201 \
    name placement_dynamic_dict_Opt2Tile_keys \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename placement_dynamic_dict_Opt2Tile_keys \
    op interface \
    ports { placement_dynamic_dict_Opt2Tile_keys_address0 { O 7 vector } placement_dynamic_dict_Opt2Tile_keys_ce0 { O 1 bit } placement_dynamic_dict_Opt2Tile_keys_we0 { O 1 bit } placement_dynamic_dict_Opt2Tile_keys_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_dynamic_dict_Opt2Tile_keys'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 202 \
    name placement_dynamic_dict_Opt2Tile_values \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename placement_dynamic_dict_Opt2Tile_values \
    op interface \
    ports { placement_dynamic_dict_Opt2Tile_values_address0 { O 7 vector } placement_dynamic_dict_Opt2Tile_values_ce0 { O 1 bit } placement_dynamic_dict_Opt2Tile_values_we0 { O 1 bit } placement_dynamic_dict_Opt2Tile_values_d0 { O 5 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_dynamic_dict_Opt2Tile_values'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 203 \
    name placement_done_values \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename placement_done_values \
    op interface \
    ports { placement_done_values_address0 { O 7 vector } placement_done_values_ce0 { O 1 bit } placement_done_values_we0 { O 1 bit } placement_done_values_d0 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_done_values'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 187 \
    name bypassOptIdx \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassOptIdx \
    op interface \
    ports { bypassOptIdx_i { I 8 vector } bypassOptIdx_o { O 8 vector } bypassOptIdx_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 188 \
    name bypassOpt \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassOpt \
    op interface \
    ports { bypassOpt { O 8 vector } bypassOpt_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 189 \
    name bypassSrcOpt \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassSrcOpt \
    op interface \
    ports { bypassSrcOpt { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 192 \
    name IDX_pd_bypass \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_IDX_pd_bypass \
    op interface \
    ports { IDX_pd_bypass_i { I 8 vector } IDX_pd_bypass_o { O 8 vector } IDX_pd_bypass_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 193 \
    name DynamicPlacement_II \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_DynamicPlacement_II \
    op interface \
    ports { DynamicPlacement_II { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 194 \
    name bypassSrcTile \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassSrcTile \
    op interface \
    ports { bypassSrcTile { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 195 \
    name bypassTgtTile \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassTgtTile \
    op interface \
    ports { bypassTgtTile { I 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 196 \
    name shape_idx \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_shape_idx \
    op interface \
    ports { shape_idx { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 197 \
    name idx_pd \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_idx_pd \
    op interface \
    ports { idx_pd_i { I 4 vector } idx_pd_o { O 4 vector } idx_pd_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 200 \
    name bypassOpt_wrAddr \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassOpt_wrAddr \
    op interface \
    ports { bypassOpt_wrAddr_i { I 8 vector } bypassOpt_wrAddr_o { O 8 vector } bypassOpt_wrAddr_o_ap_vld { O 1 bit } } \
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


