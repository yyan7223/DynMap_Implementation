# This script segment is generated automatically by AutoPilot

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
    id 236 \
    name placement_dynamic_dict_Opt2Tile_keys \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename placement_dynamic_dict_Opt2Tile_keys \
    op interface \
    ports { placement_dynamic_dict_Opt2Tile_keys_address0 { O 7 vector } placement_dynamic_dict_Opt2Tile_keys_ce0 { O 1 bit } placement_dynamic_dict_Opt2Tile_keys_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'placement_dynamic_dict_Opt2Tile_keys'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 242 \
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
    id 243 \
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
    id 235 \
    name bypassOpt \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassOpt \
    op interface \
    ports { bypassOpt { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 237 \
    name dependency_forward \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dependency_forward \
    op interface \
    ports { dependency_forward { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 238 \
    name bypassSrcOpt_keyIdx \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassSrcOpt_keyIdx \
    op interface \
    ports { bypassSrcOpt_keyIdx { I 7 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 239 \
    name bypassTgtOpt \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassTgtOpt \
    op interface \
    ports { bypassTgtOpt { I 7 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 240 \
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
    id 241 \
    name bypassTgtOpt_keyIdx \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bypassTgtOpt_keyIdx \
    op interface \
    ports { bypassTgtOpt_keyIdx { I 7 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 244 \
    name dependency_backward \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dependency_backward \
    op interface \
    ports { dependency_backward { I 1 vector } } \
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


