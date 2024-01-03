# This script segment is generated automatically by AutoPilot

set name runOne_srem_8ns_8ns_7_12_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {srem} IMPL {auto} LATENCY 11 ALLOW_PRAGMA 1
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
    id 257 \
    name placement_dynamic_occupy \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename placement_dynamic_occupy \
    op interface \
    ports { placement_dynamic_occupy_address0 { O 11 vector } placement_dynamic_occupy_ce0 { O 1 bit } placement_dynamic_occupy_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_dynamic_occupy'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 251 \
    name idxprom60 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idxprom60 \
    op interface \
    ports { idxprom60 { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 252 \
    name DynamicPlacement_II_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_DynamicPlacement_II_load_2 \
    op interface \
    ports { DynamicPlacement_II_load_2 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 253 \
    name upperLimit_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_upperLimit_1 \
    op interface \
    ports { upperLimit_1 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 254 \
    name add_ln356_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_add_ln356_out \
    op interface \
    ports { add_ln356_out { O 11 vector } add_ln356_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 255 \
    name IDX_pd_load_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_IDX_pd_load_1_out \
    op interface \
    ports { IDX_pd_load_1_out { O 8 vector } IDX_pd_load_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 256 \
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
    id 258 \
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


