# This script segment is generated automatically by AutoPilot

set name runOne_mul_3ns_8ns_10_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
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
    id 40 \
    name DFG_NodesCount_kernels_values \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename DFG_NodesCount_kernels_values \
    op interface \
    ports { DFG_NodesCount_kernels_values_address0 { O 3 vector } DFG_NodesCount_kernels_values_ce0 { O 1 bit } DFG_NodesCount_kernels_values_q0 { I 6 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'DFG_NodesCount_kernels_values'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 42 \
    name predecessors \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename predecessors \
    op interface \
    ports { predecessors_address0 { O 4 vector } predecessors_ce0 { O 1 bit } predecessors_we0 { O 1 bit } predecessors_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'predecessors'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 43 \
    name placement_dynamic_bypass \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename placement_dynamic_bypass \
    op interface \
    ports { placement_dynamic_bypass_address0 { O 14 vector } placement_dynamic_bypass_ce0 { O 1 bit } placement_dynamic_bypass_we0 { O 1 bit } placement_dynamic_bypass_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_dynamic_bypass'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 44 \
    name placement_dynamic_occupy \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename placement_dynamic_occupy \
    op interface \
    ports { placement_dynamic_occupy_address0 { O 11 vector } placement_dynamic_occupy_ce0 { O 1 bit } placement_dynamic_occupy_we0 { O 1 bit } placement_dynamic_occupy_d0 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_dynamic_occupy'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 45 \
    name placement_dynamic_bypass_occupy \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename placement_dynamic_bypass_occupy \
    op interface \
    ports { placement_dynamic_bypass_occupy_address0 { O 15 vector } placement_dynamic_bypass_occupy_ce0 { O 1 bit } placement_dynamic_bypass_occupy_we0 { O 1 bit } placement_dynamic_bypass_occupy_d0 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_dynamic_bypass_occupy'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 46 \
    name placement_dynamic_dict_Opt2PC_keys \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename placement_dynamic_dict_Opt2PC_keys \
    op interface \
    ports { placement_dynamic_dict_Opt2PC_keys_address0 { O 7 vector } placement_dynamic_dict_Opt2PC_keys_ce0 { O 1 bit } placement_dynamic_dict_Opt2PC_keys_we0 { O 1 bit } placement_dynamic_dict_Opt2PC_keys_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_dynamic_dict_Opt2PC_keys'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 47 \
    name placement_dynamic_dict_Opt2PC_values \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename placement_dynamic_dict_Opt2PC_values \
    op interface \
    ports { placement_dynamic_dict_Opt2PC_values_address0 { O 7 vector } placement_dynamic_dict_Opt2PC_values_ce0 { O 1 bit } placement_dynamic_dict_Opt2PC_values_we0 { O 1 bit } placement_dynamic_dict_Opt2PC_values_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_dynamic_dict_Opt2PC_values'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 48 \
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
    id 49 \
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
    id 50 \
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


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 51 \
    name dependency_predecessor_values \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename dependency_predecessor_values \
    op interface \
    ports { dependency_predecessor_values_address0 { O 10 vector } dependency_predecessor_values_ce0 { O 1 bit } dependency_predecessor_values_we0 { O 1 bit } dependency_predecessor_values_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'dependency_predecessor_values'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 52 \
    name dependency_successor_values \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename dependency_successor_values \
    op interface \
    ports { dependency_successor_values_address0 { O 11 vector } dependency_successor_values_ce0 { O 1 bit } dependency_successor_values_we0 { O 1 bit } dependency_successor_values_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'dependency_successor_values'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 53 \
    name curOptPotentialPlacement \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename curOptPotentialPlacement \
    op interface \
    ports { curOptPotentialPlacement_address0 { O 4 vector } curOptPotentialPlacement_ce0 { O 1 bit } curOptPotentialPlacement_we0 { O 1 bit } curOptPotentialPlacement_d0 { O 5 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'curOptPotentialPlacement'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 26 \
    name IDX_pd \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_IDX_pd \
    op interface \
    ports { IDX_pd { O 8 vector } IDX_pd_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 27 \
    name idx_pd_r \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_idx_pd_r \
    op interface \
    ports { idx_pd_r { O 4 vector } idx_pd_r_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name IDX_pd_modulo \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_IDX_pd_modulo \
    op interface \
    ports { IDX_pd_modulo { O 7 vector } IDX_pd_modulo_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name IDX_pd_bypass \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_IDX_pd_bypass \
    op interface \
    ports { IDX_pd_bypass { O 8 vector } IDX_pd_bypass_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name bypassOptIdx \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassOptIdx \
    op interface \
    ports { bypassOptIdx { O 8 vector } bypassOptIdx_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
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
    id 32 \
    name bypassSrcOpt \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassSrcOpt \
    op interface \
    ports { bypassSrcOpt { O 8 vector } bypassSrcOpt_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name bypassTgtOpt \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassTgtOpt \
    op interface \
    ports { bypassTgtOpt { O 7 vector } bypassTgtOpt_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 34 \
    name predTile1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_predTile1 \
    op interface \
    ports { predTile1 { O 4 vector } predTile1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 35 \
    name bypassSrcTile \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassSrcTile \
    op interface \
    ports { bypassSrcTile { O 5 vector } bypassSrcTile_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 36 \
    name bypassTgtTile \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassTgtTile \
    op interface \
    ports { bypassTgtTile { O 4 vector } bypassTgtTile_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 37 \
    name dependency_forward \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dependency_forward \
    op interface \
    ports { dependency_forward { O 1 vector } dependency_forward_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 38 \
    name dependency_backward \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dependency_backward \
    op interface \
    ports { dependency_backward { O 1 vector } dependency_backward_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 39 \
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
    id 41 \
    name bypassOpt_wrAddr \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassOpt_wrAddr \
    op interface \
    ports { bypassOpt_wrAddr { O 8 vector } bypassOpt_wrAddr_ap_vld { O 1 bit } } \
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


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
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
    id -3 \
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


