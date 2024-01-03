# This script segment is generated automatically by AutoPilot

set name runOne_srem_8ns_8ns_7_12_seq_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {srem} IMPL {auto_seq} LATENCY 11 ALLOW_PRAGMA 1
}


set id 261
set name runOne_mac_muladd_3ns_7ns_8s_10_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 3
set in0_signed 0
set in1_width 7
set in1_signed 0
set in2_width 8
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 10
set arg_lists {i0 {3 0 +} i1 {7 0 +} m {10 1 +} i2 {8 1 +} p {10 0 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {add} IMPL {dsp} LATENCY 3 ALLOW_PRAGMA 1
}


set op mac
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


# Memory (RAM/ROM)  definition:
set ID 264
set hasByteEnable 0
set MemName runOne_RoutingAvailability_CheckPredecessor_and_Placement_bypassPreds_RAM_AUTO_1R1W
set CoreName ap_simcore_mem
set PortList { 2 3 }
set DataWd 8
set AddrRange 20
set AddrWd 5
set impl_style auto
set TrueReset 0
set IsROM 0
set ROMData { }
set HasInitializer 0
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
	::AP::rtl_comp_handler $MemName BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


set CoreName RAM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_RAM] == "::AESL_LIB_VIRTEX::xil_gen_RAM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_RAM { \
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
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_RAM, check your platform lib"
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
    id 270 \
    name placement_dynamic_occupy \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename placement_dynamic_occupy \
    op interface \
    ports { placement_dynamic_occupy_address0 { O 11 vector } placement_dynamic_occupy_ce0 { O 1 bit } placement_dynamic_occupy_we0 { O 1 bit } placement_dynamic_occupy_d0 { O 1 vector } placement_dynamic_occupy_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_dynamic_occupy'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 271 \
    name placement_dynamic_dict_Opt2Tile_values \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename placement_dynamic_dict_Opt2Tile_values \
    op interface \
    ports { placement_dynamic_dict_Opt2Tile_values_address0 { O 7 vector } placement_dynamic_dict_Opt2Tile_values_ce0 { O 1 bit } placement_dynamic_dict_Opt2Tile_values_we0 { O 1 bit } placement_dynamic_dict_Opt2Tile_values_d0 { O 5 vector } placement_dynamic_dict_Opt2Tile_values_q0 { I 5 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_dynamic_dict_Opt2Tile_values'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 272 \
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
    id 273 \
    name placement_done_values \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename placement_done_values \
    op interface \
    ports { placement_done_values_address0 { O 7 vector } placement_done_values_ce0 { O 1 bit } placement_done_values_we0 { O 1 bit } placement_done_values_d0 { O 1 vector } placement_done_values_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_done_values'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 276 \
    name curOptPotentialPlacement \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename curOptPotentialPlacement \
    op interface \
    ports { curOptPotentialPlacement_address0 { O 4 vector } curOptPotentialPlacement_ce0 { O 1 bit } curOptPotentialPlacement_q0 { I 5 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'curOptPotentialPlacement'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 277 \
    name Tile2XY_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Tile2XY_0 \
    op interface \
    ports { Tile2XY_0_address0 { O 4 vector } Tile2XY_0_ce0 { O 1 bit } Tile2XY_0_q0 { I 2 vector } Tile2XY_0_address1 { O 4 vector } Tile2XY_0_ce1 { O 1 bit } Tile2XY_0_q1 { I 2 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Tile2XY_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 278 \
    name Tile2XY_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Tile2XY_1 \
    op interface \
    ports { Tile2XY_1_address0 { O 4 vector } Tile2XY_1_ce0 { O 1 bit } Tile2XY_1_q0 { I 2 vector } Tile2XY_1_address1 { O 4 vector } Tile2XY_1_ce1 { O 1 bit } Tile2XY_1_q1 { I 2 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Tile2XY_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 279 \
    name predecessors \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename predecessors \
    op interface \
    ports { predecessors_address0 { O 4 vector } predecessors_ce0 { O 1 bit } predecessors_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'predecessors'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 280 \
    name placement_dynamic_dict_Opt2Tile_keys \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename placement_dynamic_dict_Opt2Tile_keys \
    op interface \
    ports { placement_dynamic_dict_Opt2Tile_keys_address0 { O 7 vector } placement_dynamic_dict_Opt2Tile_keys_ce0 { O 1 bit } placement_dynamic_dict_Opt2Tile_keys_we0 { O 1 bit } placement_dynamic_dict_Opt2Tile_keys_d0 { O 8 vector } placement_dynamic_dict_Opt2Tile_keys_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_dynamic_dict_Opt2Tile_keys'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 291 \
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
    id 295 \
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
    id 296 \
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
    id 298 \
    name dependency_successor_values \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename dependency_successor_values \
    op interface \
    ports { dependency_successor_values_address0 { O 11 vector } dependency_successor_values_ce0 { O 1 bit } dependency_successor_values_we0 { O 1 bit } dependency_successor_values_d0 { O 8 vector } dependency_successor_values_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'dependency_successor_values'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 299 \
    name dependency_predecessor_values \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename dependency_predecessor_values \
    op interface \
    ports { dependency_predecessor_values_address0 { O 10 vector } dependency_predecessor_values_ce0 { O 1 bit } dependency_predecessor_values_we0 { O 1 bit } dependency_predecessor_values_d0 { O 8 vector } dependency_predecessor_values_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'dependency_predecessor_values'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 265 \
    name IDX_pd \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_IDX_pd \
    op interface \
    ports { IDX_pd_i { I 8 vector } IDX_pd_o { O 8 vector } IDX_pd_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 266 \
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
    id 267 \
    name IDX_pd_modulo \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_IDX_pd_modulo \
    op interface \
    ports { IDX_pd_modulo_i { I 7 vector } IDX_pd_modulo_o { O 7 vector } IDX_pd_modulo_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 268 \
    name predecessors_wrAddr \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_predecessors_wrAddr \
    op interface \
    ports { predecessors_wrAddr { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 269 \
    name curOpt_idx \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_curOpt_idx \
    op interface \
    ports { curOpt_idx { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 274 \
    name curOptPotentialPlacement_wrAddr \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_curOptPotentialPlacement_wrAddr \
    op interface \
    ports { curOptPotentialPlacement_wrAddr { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 275 \
    name predsNum \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_predsNum \
    op interface \
    ports { predsNum { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 281 \
    name predTile1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_predTile1 \
    op interface \
    ports { predTile1_i { I 4 vector } predTile1_o { O 4 vector } predTile1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 282 \
    name kernel_idx \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kernel_idx \
    op interface \
    ports { kernel_idx { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 283 \
    name bypassSrcOpt \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassSrcOpt \
    op interface \
    ports { bypassSrcOpt_i { I 8 vector } bypassSrcOpt_o { O 8 vector } bypassSrcOpt_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 284 \
    name bypassTgtOpt \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassTgtOpt \
    op interface \
    ports { bypassTgtOpt_i { I 7 vector } bypassTgtOpt_o { O 7 vector } bypassTgtOpt_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 285 \
    name bypassSrcTile \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassSrcTile \
    op interface \
    ports { bypassSrcTile_i { I 5 vector } bypassSrcTile_o { O 5 vector } bypassSrcTile_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 286 \
    name bypassTgtTile \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassTgtTile \
    op interface \
    ports { bypassTgtTile_i { I 4 vector } bypassTgtTile_o { O 4 vector } bypassTgtTile_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 287 \
    name dependency_forward \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dependency_forward \
    op interface \
    ports { dependency_forward_i { I 1 vector } dependency_forward_o { O 1 vector } dependency_forward_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 288 \
    name dependency_backward \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dependency_backward \
    op interface \
    ports { dependency_backward_i { I 1 vector } dependency_backward_o { O 1 vector } dependency_backward_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 289 \
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
    id 290 \
    name bypassOpt \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassOpt \
    op interface \
    ports { bypassOpt_i { I 8 vector } bypassOpt_o { O 8 vector } bypassOpt_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 292 \
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
    id 293 \
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
    id 294 \
    name idx_pd_r \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_idx_pd_r \
    op interface \
    ports { idx_pd_r_i { I 4 vector } idx_pd_r_o { O 4 vector } idx_pd_r_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 297 \
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


