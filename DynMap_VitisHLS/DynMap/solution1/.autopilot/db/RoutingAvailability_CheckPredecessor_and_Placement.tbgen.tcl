set moduleName RoutingAvailability_CheckPredecessor_and_Placement
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {RoutingAvailability_CheckPredecessor_and_Placement}
set C_modelType { int 1 }
set C_modelArgList {
	{ IDX_pd int 8 regular {pointer 2} {global 2}  }
	{ DynamicPlacement_II int 8 regular {pointer 0} {global 0}  }
	{ IDX_pd_modulo int 7 regular {pointer 2} {global 2}  }
	{ predecessors_wrAddr int 8 regular {pointer 0} {global 0}  }
	{ curOpt_idx int 8 regular {pointer 0} {global 0}  }
	{ placement_dynamic_occupy int 1 regular {array 1600 { 2 3 } 1 1 } {global 2}  }
	{ placement_dynamic_dict_Opt2Tile_values int 5 regular {array 100 { 2 3 } 1 1 } {global 2}  }
	{ placement_dynamic_dict_Opt2PC_values int 8 regular {array 100 { 2 3 } 1 1 } {global 2}  }
	{ placement_done_values int 1 regular {array 100 { 2 3 } 1 1 } {global 2}  }
	{ curOptPotentialPlacement_wrAddr int 8 regular {pointer 0} {global 0}  }
	{ predsNum int 8 regular {pointer 0} {global 0}  }
	{ curOptPotentialPlacement int 5 regular {array 16 { 1 3 } 1 1 } {global 0}  }
	{ Tile2XY_0 int 2 regular {array 16 { 1 1 } 1 1 } {global 0}  }
	{ Tile2XY_1 int 2 regular {array 16 { 1 1 } 1 1 } {global 0}  }
	{ predecessors int 8 regular {array 10 { 1 3 } 1 1 } {global 0}  }
	{ placement_dynamic_dict_Opt2Tile_keys int 8 regular {array 100 { 2 3 } 1 1 } {global 2}  }
	{ predTile1 int 4 regular {pointer 2} {global 2}  }
	{ kernel_idx int 3 regular {pointer 0} {global 0}  }
	{ bypassSrcOpt int 8 regular {pointer 2} {global 2}  }
	{ bypassTgtOpt int 7 regular {pointer 2} {global 2}  }
	{ bypassSrcTile int 5 regular {pointer 2} {global 2}  }
	{ bypassTgtTile int 4 regular {pointer 2} {global 2}  }
	{ dependency_forward int 1 regular {pointer 2} {global 2}  }
	{ dependency_backward int 1 regular {pointer 2} {global 2}  }
	{ bypassOptIdx int 8 regular {pointer 2} {global 2}  }
	{ bypassOpt int 8 regular {pointer 2} {global 2}  }
	{ placement_dynamic_dict_Opt2PC_keys int 8 regular {array 100 { 2 3 } 1 1 } {global 2}  }
	{ IDX_pd_bypass int 8 regular {pointer 2} {global 2}  }
	{ shape_idx int 5 regular {pointer 0} {global 0}  }
	{ idx_pd_r int 4 regular {pointer 2} {global 2}  }
	{ placement_dynamic_bypass_occupy int 1 regular {array 25600 { 2 1 } 1 1 } {global 2}  }
	{ placement_dynamic_bypass int 8 regular {array 12800 { 2 3 } 1 1 } {global 2}  }
	{ bypassOpt_wrAddr int 8 regular {pointer 2} {global 2}  }
	{ dependency_successor_values int 8 regular {array 2000 { 2 3 } 1 1 } {global 2}  }
	{ dependency_predecessor_values int 8 regular {array 1000 { 2 3 } 1 1 } {global 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "IDX_pd", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "DynamicPlacement_II", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "IDX_pd_modulo", "interface" : "wire", "bitwidth" : 7, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "predecessors_wrAddr", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "curOpt_idx", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_occupy", "interface" : "memory", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_dict_Opt2Tile_values", "interface" : "memory", "bitwidth" : 5, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_dict_Opt2PC_values", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "placement_done_values", "interface" : "memory", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "curOptPotentialPlacement_wrAddr", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "predsNum", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "curOptPotentialPlacement", "interface" : "memory", "bitwidth" : 5, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "Tile2XY_0", "interface" : "memory", "bitwidth" : 2, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "Tile2XY_1", "interface" : "memory", "bitwidth" : 2, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "predecessors", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_dict_Opt2Tile_keys", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "predTile1", "interface" : "wire", "bitwidth" : 4, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "kernel_idx", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bypassSrcOpt", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "bypassTgtOpt", "interface" : "wire", "bitwidth" : 7, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "bypassSrcTile", "interface" : "wire", "bitwidth" : 5, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "bypassTgtTile", "interface" : "wire", "bitwidth" : 4, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dependency_forward", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dependency_backward", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "bypassOptIdx", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "bypassOpt", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_dict_Opt2PC_keys", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "IDX_pd_bypass", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "shape_idx", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "idx_pd_r", "interface" : "wire", "bitwidth" : 4, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_bypass_occupy", "interface" : "memory", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_bypass", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "bypassOpt_wrAddr", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dependency_successor_values", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dependency_predecessor_values", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 127
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ IDX_pd_i sc_in sc_lv 8 signal 0 } 
	{ IDX_pd_o sc_out sc_lv 8 signal 0 } 
	{ IDX_pd_o_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ DynamicPlacement_II sc_in sc_lv 8 signal 1 } 
	{ IDX_pd_modulo_i sc_in sc_lv 7 signal 2 } 
	{ IDX_pd_modulo_o sc_out sc_lv 7 signal 2 } 
	{ IDX_pd_modulo_o_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ predecessors_wrAddr sc_in sc_lv 8 signal 3 } 
	{ curOpt_idx sc_in sc_lv 8 signal 4 } 
	{ placement_dynamic_occupy_address0 sc_out sc_lv 11 signal 5 } 
	{ placement_dynamic_occupy_ce0 sc_out sc_logic 1 signal 5 } 
	{ placement_dynamic_occupy_we0 sc_out sc_logic 1 signal 5 } 
	{ placement_dynamic_occupy_d0 sc_out sc_lv 1 signal 5 } 
	{ placement_dynamic_occupy_q0 sc_in sc_lv 1 signal 5 } 
	{ placement_dynamic_dict_Opt2Tile_values_address0 sc_out sc_lv 7 signal 6 } 
	{ placement_dynamic_dict_Opt2Tile_values_ce0 sc_out sc_logic 1 signal 6 } 
	{ placement_dynamic_dict_Opt2Tile_values_we0 sc_out sc_logic 1 signal 6 } 
	{ placement_dynamic_dict_Opt2Tile_values_d0 sc_out sc_lv 5 signal 6 } 
	{ placement_dynamic_dict_Opt2Tile_values_q0 sc_in sc_lv 5 signal 6 } 
	{ placement_dynamic_dict_Opt2PC_values_address0 sc_out sc_lv 7 signal 7 } 
	{ placement_dynamic_dict_Opt2PC_values_ce0 sc_out sc_logic 1 signal 7 } 
	{ placement_dynamic_dict_Opt2PC_values_we0 sc_out sc_logic 1 signal 7 } 
	{ placement_dynamic_dict_Opt2PC_values_d0 sc_out sc_lv 8 signal 7 } 
	{ placement_dynamic_dict_Opt2PC_values_q0 sc_in sc_lv 8 signal 7 } 
	{ placement_done_values_address0 sc_out sc_lv 7 signal 8 } 
	{ placement_done_values_ce0 sc_out sc_logic 1 signal 8 } 
	{ placement_done_values_we0 sc_out sc_logic 1 signal 8 } 
	{ placement_done_values_d0 sc_out sc_lv 1 signal 8 } 
	{ placement_done_values_q0 sc_in sc_lv 1 signal 8 } 
	{ curOptPotentialPlacement_wrAddr sc_in sc_lv 8 signal 9 } 
	{ predsNum sc_in sc_lv 8 signal 10 } 
	{ curOptPotentialPlacement_address0 sc_out sc_lv 4 signal 11 } 
	{ curOptPotentialPlacement_ce0 sc_out sc_logic 1 signal 11 } 
	{ curOptPotentialPlacement_q0 sc_in sc_lv 5 signal 11 } 
	{ Tile2XY_0_address0 sc_out sc_lv 4 signal 12 } 
	{ Tile2XY_0_ce0 sc_out sc_logic 1 signal 12 } 
	{ Tile2XY_0_q0 sc_in sc_lv 2 signal 12 } 
	{ Tile2XY_0_address1 sc_out sc_lv 4 signal 12 } 
	{ Tile2XY_0_ce1 sc_out sc_logic 1 signal 12 } 
	{ Tile2XY_0_q1 sc_in sc_lv 2 signal 12 } 
	{ Tile2XY_1_address0 sc_out sc_lv 4 signal 13 } 
	{ Tile2XY_1_ce0 sc_out sc_logic 1 signal 13 } 
	{ Tile2XY_1_q0 sc_in sc_lv 2 signal 13 } 
	{ Tile2XY_1_address1 sc_out sc_lv 4 signal 13 } 
	{ Tile2XY_1_ce1 sc_out sc_logic 1 signal 13 } 
	{ Tile2XY_1_q1 sc_in sc_lv 2 signal 13 } 
	{ predecessors_address0 sc_out sc_lv 4 signal 14 } 
	{ predecessors_ce0 sc_out sc_logic 1 signal 14 } 
	{ predecessors_q0 sc_in sc_lv 8 signal 14 } 
	{ placement_dynamic_dict_Opt2Tile_keys_address0 sc_out sc_lv 7 signal 15 } 
	{ placement_dynamic_dict_Opt2Tile_keys_ce0 sc_out sc_logic 1 signal 15 } 
	{ placement_dynamic_dict_Opt2Tile_keys_we0 sc_out sc_logic 1 signal 15 } 
	{ placement_dynamic_dict_Opt2Tile_keys_d0 sc_out sc_lv 8 signal 15 } 
	{ placement_dynamic_dict_Opt2Tile_keys_q0 sc_in sc_lv 8 signal 15 } 
	{ predTile1_i sc_in sc_lv 4 signal 16 } 
	{ predTile1_o sc_out sc_lv 4 signal 16 } 
	{ predTile1_o_ap_vld sc_out sc_logic 1 outvld 16 } 
	{ kernel_idx sc_in sc_lv 3 signal 17 } 
	{ bypassSrcOpt_i sc_in sc_lv 8 signal 18 } 
	{ bypassSrcOpt_o sc_out sc_lv 8 signal 18 } 
	{ bypassSrcOpt_o_ap_vld sc_out sc_logic 1 outvld 18 } 
	{ bypassTgtOpt_i sc_in sc_lv 7 signal 19 } 
	{ bypassTgtOpt_o sc_out sc_lv 7 signal 19 } 
	{ bypassTgtOpt_o_ap_vld sc_out sc_logic 1 outvld 19 } 
	{ bypassSrcTile_i sc_in sc_lv 5 signal 20 } 
	{ bypassSrcTile_o sc_out sc_lv 5 signal 20 } 
	{ bypassSrcTile_o_ap_vld sc_out sc_logic 1 outvld 20 } 
	{ bypassTgtTile_i sc_in sc_lv 4 signal 21 } 
	{ bypassTgtTile_o sc_out sc_lv 4 signal 21 } 
	{ bypassTgtTile_o_ap_vld sc_out sc_logic 1 outvld 21 } 
	{ dependency_forward_i sc_in sc_lv 1 signal 22 } 
	{ dependency_forward_o sc_out sc_lv 1 signal 22 } 
	{ dependency_forward_o_ap_vld sc_out sc_logic 1 outvld 22 } 
	{ dependency_backward_i sc_in sc_lv 1 signal 23 } 
	{ dependency_backward_o sc_out sc_lv 1 signal 23 } 
	{ dependency_backward_o_ap_vld sc_out sc_logic 1 outvld 23 } 
	{ bypassOptIdx_i sc_in sc_lv 8 signal 24 } 
	{ bypassOptIdx_o sc_out sc_lv 8 signal 24 } 
	{ bypassOptIdx_o_ap_vld sc_out sc_logic 1 outvld 24 } 
	{ bypassOpt_i sc_in sc_lv 8 signal 25 } 
	{ bypassOpt_o sc_out sc_lv 8 signal 25 } 
	{ bypassOpt_o_ap_vld sc_out sc_logic 1 outvld 25 } 
	{ placement_dynamic_dict_Opt2PC_keys_address0 sc_out sc_lv 7 signal 26 } 
	{ placement_dynamic_dict_Opt2PC_keys_ce0 sc_out sc_logic 1 signal 26 } 
	{ placement_dynamic_dict_Opt2PC_keys_we0 sc_out sc_logic 1 signal 26 } 
	{ placement_dynamic_dict_Opt2PC_keys_d0 sc_out sc_lv 8 signal 26 } 
	{ placement_dynamic_dict_Opt2PC_keys_q0 sc_in sc_lv 8 signal 26 } 
	{ IDX_pd_bypass_i sc_in sc_lv 8 signal 27 } 
	{ IDX_pd_bypass_o sc_out sc_lv 8 signal 27 } 
	{ IDX_pd_bypass_o_ap_vld sc_out sc_logic 1 outvld 27 } 
	{ shape_idx sc_in sc_lv 5 signal 28 } 
	{ idx_pd_r_i sc_in sc_lv 4 signal 29 } 
	{ idx_pd_r_o sc_out sc_lv 4 signal 29 } 
	{ idx_pd_r_o_ap_vld sc_out sc_logic 1 outvld 29 } 
	{ placement_dynamic_bypass_occupy_address0 sc_out sc_lv 15 signal 30 } 
	{ placement_dynamic_bypass_occupy_ce0 sc_out sc_logic 1 signal 30 } 
	{ placement_dynamic_bypass_occupy_we0 sc_out sc_logic 1 signal 30 } 
	{ placement_dynamic_bypass_occupy_d0 sc_out sc_lv 1 signal 30 } 
	{ placement_dynamic_bypass_occupy_q0 sc_in sc_lv 1 signal 30 } 
	{ placement_dynamic_bypass_occupy_address1 sc_out sc_lv 15 signal 30 } 
	{ placement_dynamic_bypass_occupy_ce1 sc_out sc_logic 1 signal 30 } 
	{ placement_dynamic_bypass_occupy_q1 sc_in sc_lv 1 signal 30 } 
	{ placement_dynamic_bypass_address0 sc_out sc_lv 14 signal 31 } 
	{ placement_dynamic_bypass_ce0 sc_out sc_logic 1 signal 31 } 
	{ placement_dynamic_bypass_we0 sc_out sc_logic 1 signal 31 } 
	{ placement_dynamic_bypass_d0 sc_out sc_lv 8 signal 31 } 
	{ placement_dynamic_bypass_q0 sc_in sc_lv 8 signal 31 } 
	{ bypassOpt_wrAddr_i sc_in sc_lv 8 signal 32 } 
	{ bypassOpt_wrAddr_o sc_out sc_lv 8 signal 32 } 
	{ bypassOpt_wrAddr_o_ap_vld sc_out sc_logic 1 outvld 32 } 
	{ dependency_successor_values_address0 sc_out sc_lv 11 signal 33 } 
	{ dependency_successor_values_ce0 sc_out sc_logic 1 signal 33 } 
	{ dependency_successor_values_we0 sc_out sc_logic 1 signal 33 } 
	{ dependency_successor_values_d0 sc_out sc_lv 8 signal 33 } 
	{ dependency_successor_values_q0 sc_in sc_lv 8 signal 33 } 
	{ dependency_predecessor_values_address0 sc_out sc_lv 10 signal 34 } 
	{ dependency_predecessor_values_ce0 sc_out sc_logic 1 signal 34 } 
	{ dependency_predecessor_values_we0 sc_out sc_logic 1 signal 34 } 
	{ dependency_predecessor_values_d0 sc_out sc_lv 8 signal 34 } 
	{ dependency_predecessor_values_q0 sc_in sc_lv 8 signal 34 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "IDX_pd_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "IDX_pd", "role": "i" }} , 
 	{ "name": "IDX_pd_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "IDX_pd", "role": "o" }} , 
 	{ "name": "IDX_pd_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "IDX_pd", "role": "o_ap_vld" }} , 
 	{ "name": "DynamicPlacement_II", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "DynamicPlacement_II", "role": "default" }} , 
 	{ "name": "IDX_pd_modulo_i", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "IDX_pd_modulo", "role": "i" }} , 
 	{ "name": "IDX_pd_modulo_o", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "IDX_pd_modulo", "role": "o" }} , 
 	{ "name": "IDX_pd_modulo_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "IDX_pd_modulo", "role": "o_ap_vld" }} , 
 	{ "name": "predecessors_wrAddr", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "predecessors_wrAddr", "role": "default" }} , 
 	{ "name": "curOpt_idx", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "curOpt_idx", "role": "default" }} , 
 	{ "name": "placement_dynamic_occupy_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "placement_dynamic_occupy", "role": "address0" }} , 
 	{ "name": "placement_dynamic_occupy_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_occupy", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_occupy_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_occupy", "role": "we0" }} , 
 	{ "name": "placement_dynamic_occupy_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_occupy", "role": "d0" }} , 
 	{ "name": "placement_dynamic_occupy_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_occupy", "role": "q0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_values", "role": "address0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_values", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_values_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_values", "role": "we0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_values_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_values", "role": "d0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_values", "role": "q0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_values", "role": "address0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_values", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_values_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_values", "role": "we0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_values_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_values", "role": "d0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_values", "role": "q0" }} , 
 	{ "name": "placement_done_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_done_values", "role": "address0" }} , 
 	{ "name": "placement_done_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_done_values", "role": "ce0" }} , 
 	{ "name": "placement_done_values_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_done_values", "role": "we0" }} , 
 	{ "name": "placement_done_values_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_done_values", "role": "d0" }} , 
 	{ "name": "placement_done_values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_done_values", "role": "q0" }} , 
 	{ "name": "curOptPotentialPlacement_wrAddr", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "curOptPotentialPlacement_wrAddr", "role": "default" }} , 
 	{ "name": "predsNum", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "predsNum", "role": "default" }} , 
 	{ "name": "curOptPotentialPlacement_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "address0" }} , 
 	{ "name": "curOptPotentialPlacement_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "ce0" }} , 
 	{ "name": "curOptPotentialPlacement_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "q0" }} , 
 	{ "name": "Tile2XY_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "Tile2XY_0", "role": "address0" }} , 
 	{ "name": "Tile2XY_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Tile2XY_0", "role": "ce0" }} , 
 	{ "name": "Tile2XY_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "Tile2XY_0", "role": "q0" }} , 
 	{ "name": "Tile2XY_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "Tile2XY_0", "role": "address1" }} , 
 	{ "name": "Tile2XY_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Tile2XY_0", "role": "ce1" }} , 
 	{ "name": "Tile2XY_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "Tile2XY_0", "role": "q1" }} , 
 	{ "name": "Tile2XY_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "Tile2XY_1", "role": "address0" }} , 
 	{ "name": "Tile2XY_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Tile2XY_1", "role": "ce0" }} , 
 	{ "name": "Tile2XY_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "Tile2XY_1", "role": "q0" }} , 
 	{ "name": "Tile2XY_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "Tile2XY_1", "role": "address1" }} , 
 	{ "name": "Tile2XY_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Tile2XY_1", "role": "ce1" }} , 
 	{ "name": "Tile2XY_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "Tile2XY_1", "role": "q1" }} , 
 	{ "name": "predecessors_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "predecessors", "role": "address0" }} , 
 	{ "name": "predecessors_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "predecessors", "role": "ce0" }} , 
 	{ "name": "predecessors_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "predecessors", "role": "q0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "address0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "we0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "d0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "q0" }} , 
 	{ "name": "predTile1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "predTile1", "role": "i" }} , 
 	{ "name": "predTile1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "predTile1", "role": "o" }} , 
 	{ "name": "predTile1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "predTile1", "role": "o_ap_vld" }} , 
 	{ "name": "kernel_idx", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "kernel_idx", "role": "default" }} , 
 	{ "name": "bypassSrcOpt_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassSrcOpt", "role": "i" }} , 
 	{ "name": "bypassSrcOpt_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassSrcOpt", "role": "o" }} , 
 	{ "name": "bypassSrcOpt_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "bypassSrcOpt", "role": "o_ap_vld" }} , 
 	{ "name": "bypassTgtOpt_i", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "bypassTgtOpt", "role": "i" }} , 
 	{ "name": "bypassTgtOpt_o", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "bypassTgtOpt", "role": "o" }} , 
 	{ "name": "bypassTgtOpt_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "bypassTgtOpt", "role": "o_ap_vld" }} , 
 	{ "name": "bypassSrcTile_i", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bypassSrcTile", "role": "i" }} , 
 	{ "name": "bypassSrcTile_o", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bypassSrcTile", "role": "o" }} , 
 	{ "name": "bypassSrcTile_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "bypassSrcTile", "role": "o_ap_vld" }} , 
 	{ "name": "bypassTgtTile_i", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "bypassTgtTile", "role": "i" }} , 
 	{ "name": "bypassTgtTile_o", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "bypassTgtTile", "role": "o" }} , 
 	{ "name": "bypassTgtTile_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "bypassTgtTile", "role": "o_ap_vld" }} , 
 	{ "name": "dependency_forward_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_forward", "role": "i" }} , 
 	{ "name": "dependency_forward_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_forward", "role": "o" }} , 
 	{ "name": "dependency_forward_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dependency_forward", "role": "o_ap_vld" }} , 
 	{ "name": "dependency_backward_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_backward", "role": "i" }} , 
 	{ "name": "dependency_backward_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_backward", "role": "o" }} , 
 	{ "name": "dependency_backward_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dependency_backward", "role": "o_ap_vld" }} , 
 	{ "name": "bypassOptIdx_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassOptIdx", "role": "i" }} , 
 	{ "name": "bypassOptIdx_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassOptIdx", "role": "o" }} , 
 	{ "name": "bypassOptIdx_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "bypassOptIdx", "role": "o_ap_vld" }} , 
 	{ "name": "bypassOpt_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassOpt", "role": "i" }} , 
 	{ "name": "bypassOpt_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassOpt", "role": "o" }} , 
 	{ "name": "bypassOpt_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "bypassOpt", "role": "o_ap_vld" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "address0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "we0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "d0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "q0" }} , 
 	{ "name": "IDX_pd_bypass_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "IDX_pd_bypass", "role": "i" }} , 
 	{ "name": "IDX_pd_bypass_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "IDX_pd_bypass", "role": "o" }} , 
 	{ "name": "IDX_pd_bypass_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "IDX_pd_bypass", "role": "o_ap_vld" }} , 
 	{ "name": "shape_idx", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "shape_idx", "role": "default" }} , 
 	{ "name": "idx_pd_r_i", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "idx_pd_r", "role": "i" }} , 
 	{ "name": "idx_pd_r_o", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "idx_pd_r", "role": "o" }} , 
 	{ "name": "idx_pd_r_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "idx_pd_r", "role": "o_ap_vld" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "address0" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "we0" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "d0" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "q0" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "address1" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "ce1" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "q1" }} , 
 	{ "name": "placement_dynamic_bypass_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "placement_dynamic_bypass", "role": "address0" }} , 
 	{ "name": "placement_dynamic_bypass_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_bypass_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass", "role": "we0" }} , 
 	{ "name": "placement_dynamic_bypass_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_bypass", "role": "d0" }} , 
 	{ "name": "placement_dynamic_bypass_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_bypass", "role": "q0" }} , 
 	{ "name": "bypassOpt_wrAddr_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassOpt_wrAddr", "role": "i" }} , 
 	{ "name": "bypassOpt_wrAddr_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassOpt_wrAddr", "role": "o" }} , 
 	{ "name": "bypassOpt_wrAddr_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "bypassOpt_wrAddr", "role": "o_ap_vld" }} , 
 	{ "name": "dependency_successor_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "dependency_successor_values", "role": "address0" }} , 
 	{ "name": "dependency_successor_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_successor_values", "role": "ce0" }} , 
 	{ "name": "dependency_successor_values_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_successor_values", "role": "we0" }} , 
 	{ "name": "dependency_successor_values_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dependency_successor_values", "role": "d0" }} , 
 	{ "name": "dependency_successor_values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dependency_successor_values", "role": "q0" }} , 
 	{ "name": "dependency_predecessor_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "address0" }} , 
 	{ "name": "dependency_predecessor_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "ce0" }} , 
 	{ "name": "dependency_predecessor_values_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "we0" }} , 
 	{ "name": "dependency_predecessor_values_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "d0" }} , 
 	{ "name": "dependency_predecessor_values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "q0" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "22", "32", "33", "35", "36", "37"],
		"CDFG" : "RoutingAvailability_CheckPredecessor_and_Placement",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "IDX_pd", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "33", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_354_4_fu_700", "Port" : "IDX_pd", "Inst_start_state" : "53", "Inst_end_state" : "54"}]},
			{"Name" : "DynamicPlacement_II", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "DynamicPlacement_II", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "IDX_pd_modulo", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "33", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_354_4_fu_700", "Port" : "IDX_pd_modulo", "Inst_start_state" : "53", "Inst_end_state" : "54"}]},
			{"Name" : "predecessors_wrAddr", "Type" : "None", "Direction" : "I"},
			{"Name" : "curOpt_idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "placement_dynamic_occupy", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "33", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_354_4_fu_700", "Port" : "placement_dynamic_occupy", "Inst_start_state" : "53", "Inst_end_state" : "54"}]},
			{"Name" : "placement_dynamic_dict_Opt2Tile_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "placement_dynamic_dict_Opt2Tile_values", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "placement_dynamic_dict_Opt2PC_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "placement_dynamic_dict_Opt2PC_values", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "placement_done_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "placement_done_values", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "curOptPotentialPlacement_wrAddr", "Type" : "None", "Direction" : "I"},
			{"Name" : "predsNum", "Type" : "None", "Direction" : "I"},
			{"Name" : "curOptPotentialPlacement", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "Tile2XY_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "Tile2XY_0", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "Tile2XY_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "Tile2XY_1", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "predecessors", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_14_1_fu_587", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "17", "Inst_end_state" : "18"},
					{"ID" : "4", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_32_1_fu_596", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "22", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "32", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_127_1_fu_691", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "5", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_39_2_fu_606", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "predTile1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "kernel_idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "placement_static_kernels_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "bypassSrcOpt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "bypassSrcOpt", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "22", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "bypassSrcOpt", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "bypassTgtOpt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "bypassTgtOpt", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "bypassSrcOpt_keyIdx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "bypassSrcOpt_keyIdx", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "bypassSrcTile", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "bypassSrcTile", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "bypassTgtOpt_keyIdx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "bypassTgtOpt_keyIdx", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "bypassTgtTile", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "bypassTgtTile", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "dependency_forward", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "dependency_forward", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "dependency_backward", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "dependency_backward", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "bypassOptIdx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "bypassOptIdx", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "bypassOpt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "bypassOpt", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "22", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "bypassOpt", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "placement_dynamic_dict_Opt2PC_keys", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "placement_dynamic_dict_Opt2PC_keys", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "IDX_pd_bypass", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "IDX_pd_bypass", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "shape_idx", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "shape_idx", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "CGRA_NumTiles_shapes_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "CGRA_NumTiles_shapes_values", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "bpsStride_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "bpsStride_0", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "bpsStride_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "bpsStride_1", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "xy2Tile", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "xy2Tile", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "allocated_tiles_shapes_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "allocated_tiles_shapes_values", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "idx_pd_r", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "idx_pd", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "placement_dynamic_bypass_occupy", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "placement_dynamic_bypass_occupy", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "placement_dynamic_bypass", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "placement_dynamic_bypass", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "bypassOpt_wrAddr", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "bypassOpt_wrAddr", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "dependency_successor_values", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "dependency_predecessor_values", "Inst_start_state" : "34", "Inst_end_state" : "35"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_319_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state16", "LastState" : ["ap_ST_fsm_state22"], "QuitState" : ["ap_ST_fsm_state16"], "PreState" : ["ap_ST_fsm_state15"], "PostState" : ["ap_ST_fsm_state52", "ap_ST_fsm_state41", "ap_ST_fsm_state23"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_288_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state32", "LastState" : ["ap_ST_fsm_state40"], "QuitState" : ["ap_ST_fsm_state33", "ap_ST_fsm_state40"], "PreState" : ["ap_ST_fsm_state31"], "PostState" : ["ap_ST_fsm_state57", "ap_ST_fsm_state23"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_339_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state23", "LastState" : ["ap_ST_fsm_state40"], "QuitState" : ["ap_ST_fsm_state23", "ap_ST_fsm_state33"], "PreState" : ["ap_ST_fsm_state16"], "PostState" : ["ap_ST_fsm_state41", "ap_ST_fsm_state57"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_314_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state13", "LastState" : ["ap_ST_fsm_state55"], "QuitState" : ["ap_ST_fsm_state13", "ap_ST_fsm_state33", "ap_ST_fsm_state55"], "PreState" : ["ap_ST_fsm_state12"], "PostState" : ["ap_ST_fsm_state57"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.placement_static_kernels_values_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bypassPreds_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_14_1_fu_587", "Parent" : "0",
		"CDFG" : "RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_14_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "204",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "predecessors_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln14_cast2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_14_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_32_1_fu_596", "Parent" : "0",
		"CDFG" : "RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_32_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "204",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bypassPreds_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "phi_ln32_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "trunc_ln32_2_cast_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_32_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_39_2_fu_606", "Parent" : "0",
		"CDFG" : "RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_39_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "204",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln286", "Type" : "None", "Direction" : "I"},
			{"Name" : "phi_ln39_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "trunc_ln39_2_cast_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_39_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_fu_615", "Parent" : "0", "Child" : ["7", "8", "9", "10", "11", "12", "17", "20"],
		"CDFG" : "BypassOptPlacement_Gen_Record",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bypassOptIdx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "bypassOpt", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "bypassSrcOpt", "Type" : "None", "Direction" : "I"},
			{"Name" : "placement_dynamic_dict_Opt2PC_keys", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_188_1_fu_365", "Port" : "placement_dynamic_dict_Opt2PC_keys", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "placement_dynamic_dict_Opt2PC_values", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "IDX_pd_bypass", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4_fu_402", "Port" : "IDX_pd_bypass", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "DynamicPlacement_II", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassSrcTile", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassTgtTile", "Type" : "None", "Direction" : "I"},
			{"Name" : "shape_idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "Tile2XY_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "Tile2XY_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "CGRA_NumTiles_shapes_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "bpsStride_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373", "Port" : "bpsStride_0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "bpsStride_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373", "Port" : "bpsStride_1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "xy2Tile", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373", "Port" : "xy2Tile", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "allocated_tiles_shapes_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373", "Port" : "allocated_tiles_shapes_values", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "idx_pd", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "placement_dynamic_bypass_occupy", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4_fu_402", "Port" : "placement_dynamic_bypass_occupy", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "placement_dynamic_bypass", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_255_5_fu_420", "Port" : "placement_dynamic_bypass", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "bypassOpt_wrAddr", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_values", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "placement_done_values", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_fu_615.Tile2XY_0_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_fu_615.Tile2XY_1_U", "Parent" : "6"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_fu_615.CGRA_NumTiles_shapes_values_U", "Parent" : "6"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_fu_615.allocated_tiles_shapes_values_U", "Parent" : "6"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_188_1_fu_365", "Parent" : "6",
		"CDFG" : "BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_188_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "204",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bypassSrcOpt_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassSrcOptIdx_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "placement_dynamic_dict_Opt2PC_keys", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_188_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373", "Parent" : "6", "Child" : ["13", "14", "15", "16"],
		"CDFG" : "BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "Tile2XY_0_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp28", "Type" : "None", "Direction" : "I"},
			{"Name" : "and_ln205", "Type" : "None", "Direction" : "I"},
			{"Name" : "Tile2XY_1_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp77", "Type" : "None", "Direction" : "I"},
			{"Name" : "and_ln218", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub_ln192", "Type" : "None", "Direction" : "I"},
			{"Name" : "CGRA_NumTiles_shapes_values_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "shape_idx_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "yDiff_2_phi_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "xDiff_2_phi_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "i_50_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "xDiff_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "yDiff_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "bpsStride_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "bpsStride_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "xy2Tile", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "allocated_tiles_shapes_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_199_2_VITIS_LOOP_233_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state5"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state6", "ap_ST_fsm_state7"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373.bpsStride_0_U", "Parent" : "12"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373.bpsStride_1_U", "Parent" : "12"},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373.xy2Tile_U", "Parent" : "12"},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373.allocated_tiles_shapes_values_U", "Parent" : "12"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4_fu_402", "Parent" : "6", "Child" : ["18", "19"],
		"CDFG" : "BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln192", "Type" : "None", "Direction" : "I"},
			{"Name" : "DynamicPlacement_II_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "tileId", "Type" : "None", "Direction" : "I"},
			{"Name" : "idxprom174", "Type" : "None", "Direction" : "I"},
			{"Name" : "idxprom20", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub182", "Type" : "None", "Direction" : "I"},
			{"Name" : "upperLimit", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "add_ln252_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "tmp_71_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "placement_dynamic_bypass_occupy", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "IDX_pd_bypass", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_249_4", "PipelineType" : "NotSupport"}]},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4_fu_402.srem_8ns_8ns_8_12_1_U167", "Parent" : "17"},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4_fu_402.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_255_5_fu_420", "Parent" : "6", "Child" : ["21"],
		"CDFG" : "BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_255_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "idxprom190", "Type" : "None", "Direction" : "I"},
			{"Name" : "tileId", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_73_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "placement_dynamic_bypass", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_255_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_255_5_fu_420.flow_control_loop_pipe_sequential_init_U", "Parent" : "20"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Parent" : "0", "Child" : ["23", "24", "25", "26", "27", "28", "29", "30", "31"],
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "9", "EstimateLatencyMax" : "495",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bypassOpt", "Type" : "None", "Direction" : "I"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_53_1_fu_168", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "dependency_forward", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassSrcOpt_keyIdx", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassTgtOpt", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassSrcOpt", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassTgtOpt_keyIdx", "Type" : "None", "Direction" : "I"},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "24", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_61_2_fu_176", "Port" : "dependency_successor_values", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "31", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_116_9_fu_235", "Port" : "dependency_successor_values", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "26", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_75_4_fu_193", "Port" : "dependency_successor_values", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "29", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_102_7_fu_219", "Port" : "dependency_successor_values", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "28", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_94_6_fu_210", "Port" : "dependency_predecessor_values", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "30", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_108_8_fu_227", "Port" : "dependency_predecessor_values", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "25", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_69_3_fu_185", "Port" : "dependency_predecessor_values", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "27", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_83_5_fu_201", "Port" : "dependency_predecessor_values", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "dependency_backward", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_53_1_fu_168", "Parent" : "22",
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_53_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "204",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bypassOpt_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "phi_ln54_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_53_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_61_2_fu_176", "Parent" : "22",
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_61_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "44",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln62", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln71", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln62_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_61_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_69_3_fu_185", "Parent" : "22",
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_69_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "24",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln70", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln70_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_69_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_75_4_fu_193", "Parent" : "22",
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_75_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "44",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln76", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln76_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_75_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_83_5_fu_201", "Parent" : "22",
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_83_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "24",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln84", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassSrcOpt_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln84_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_83_5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_94_6_fu_210", "Parent" : "22",
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_94_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "24",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln95", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln71", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln95_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_94_6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_102_7_fu_219", "Parent" : "22",
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_102_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "44",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln103", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln103_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_102_7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_108_8_fu_227", "Parent" : "22",
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_108_8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "24",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln109", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln109_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_108_8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_116_9_fu_235", "Parent" : "22",
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_116_9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "44",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln117", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassSrcOpt_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln117_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_116_9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_127_1_fu_691", "Parent" : "0",
		"CDFG" : "RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_127_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "204",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bypassOpt_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "phi_ln127_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "trunc_ln127_2_cast_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_127_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_354_4_fu_700", "Parent" : "0", "Child" : ["34"],
		"CDFG" : "RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_354_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "idxprom60", "Type" : "None", "Direction" : "I"},
			{"Name" : "DynamicPlacement_II_load_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "upperLimit_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln356_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "IDX_pd_load_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "IDX_pd_modulo", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "placement_dynamic_occupy", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "IDX_pd", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_354_4", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "15", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "PreState" : ["ap_ST_fsm_state1"], "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "PostState" : ["ap_ST_fsm_state15", "ap_ST_fsm_state16"]}}]},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_354_4_fu_700.srem_8ns_8ns_7_12_1_U249", "Parent" : "33"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_8ns_8ns_7_12_seq_1_U259", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_8ns_8ns_7_12_seq_1_U260", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_3ns_7ns_8s_10_4_1_U261", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	RoutingAvailability_CheckPredecessor_and_Placement {
		IDX_pd {Type IO LastRead 2 FirstWrite 0}
		DynamicPlacement_II {Type I LastRead 29 FirstWrite -1}
		IDX_pd_modulo {Type IO LastRead 1 FirstWrite 11}
		predecessors_wrAddr {Type I LastRead 11 FirstWrite -1}
		curOpt_idx {Type I LastRead 11 FirstWrite -1}
		placement_dynamic_occupy {Type IO LastRead 1 FirstWrite -1}
		placement_dynamic_dict_Opt2Tile_values {Type IO LastRead 31 FirstWrite 8}
		placement_dynamic_dict_Opt2PC_values {Type IO LastRead 3 FirstWrite 8}
		placement_done_values {Type IO LastRead 20 FirstWrite 8}
		curOptPotentialPlacement_wrAddr {Type I LastRead 12 FirstWrite -1}
		predsNum {Type I LastRead 14 FirstWrite -1}
		curOptPotentialPlacement {Type I LastRead 28 FirstWrite -1}
		Tile2XY_0 {Type I LastRead 33 FirstWrite -1}
		Tile2XY_1 {Type I LastRead 33 FirstWrite -1}
		predecessors {Type I LastRead 15 FirstWrite -1}
		placement_dynamic_dict_Opt2Tile_keys {Type IO LastRead 1 FirstWrite -1}
		predTile1 {Type IO LastRead 19 FirstWrite 19}
		kernel_idx {Type I LastRead 16 FirstWrite -1}
		placement_static_kernels_values {Type I LastRead -1 FirstWrite -1}
		bypassSrcOpt {Type IO LastRead 2 FirstWrite -1}
		bypassTgtOpt {Type IO LastRead 2 FirstWrite -1}
		bypassSrcOpt_keyIdx {Type IO LastRead -1 FirstWrite -1}
		bypassSrcTile {Type IO LastRead 32 FirstWrite -1}
		bypassTgtOpt_keyIdx {Type IO LastRead -1 FirstWrite -1}
		bypassTgtTile {Type IO LastRead 32 FirstWrite -1}
		dependency_forward {Type IO LastRead 2 FirstWrite -1}
		dependency_backward {Type IO LastRead 10 FirstWrite -1}
		bypassOptIdx {Type IO LastRead 4 FirstWrite 4}
		bypassOpt {Type IO LastRead 29 FirstWrite -1}
		placement_dynamic_dict_Opt2PC_keys {Type IO LastRead 1 FirstWrite -1}
		IDX_pd_bypass {Type IO LastRead 33 FirstWrite 4}
		shape_idx {Type I LastRead 0 FirstWrite -1}
		CGRA_NumTiles_shapes_values {Type I LastRead -1 FirstWrite -1}
		bpsStride_0 {Type I LastRead -1 FirstWrite -1}
		bpsStride_1 {Type I LastRead -1 FirstWrite -1}
		xy2Tile {Type I LastRead -1 FirstWrite -1}
		allocated_tiles_shapes_values {Type I LastRead -1 FirstWrite -1}
		idx_pd_r {Type IO LastRead 4 FirstWrite 4}
		placement_dynamic_bypass_occupy {Type IO LastRead 13 FirstWrite -1}
		placement_dynamic_bypass {Type IO LastRead 1 FirstWrite -1}
		bypassOpt_wrAddr {Type IO LastRead 8 FirstWrite 8}
		dependency_successor_values {Type IO LastRead 1 FirstWrite -1}
		dependency_predecessor_values {Type IO LastRead 1 FirstWrite -1}}
	RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_14_1 {
		predecessors_load {Type I LastRead 0 FirstWrite -1}
		trunc_ln14_cast2_out {Type O LastRead -1 FirstWrite 2}
		placement_dynamic_dict_Opt2Tile_keys {Type I LastRead 1 FirstWrite -1}}
	RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_32_1 {
		bypassPreds_load {Type I LastRead 0 FirstWrite -1}
		phi_ln32_out {Type O LastRead -1 FirstWrite 2}
		trunc_ln32_2_cast_out {Type O LastRead -1 FirstWrite 2}
		placement_dynamic_dict_Opt2Tile_keys {Type I LastRead 1 FirstWrite -1}}
	RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_39_2 {
		zext_ln286 {Type I LastRead 0 FirstWrite -1}
		phi_ln39_out {Type O LastRead -1 FirstWrite 2}
		trunc_ln39_2_cast_out {Type O LastRead -1 FirstWrite 2}
		placement_dynamic_dict_Opt2Tile_keys {Type I LastRead 1 FirstWrite -1}}
	BypassOptPlacement_Gen_Record {
		bypassOptIdx {Type IO LastRead 4 FirstWrite 4}
		bypassOpt {Type O LastRead -1 FirstWrite 4}
		bypassSrcOpt {Type I LastRead 1 FirstWrite -1}
		placement_dynamic_dict_Opt2PC_keys {Type IO LastRead 1 FirstWrite -1}
		placement_dynamic_dict_Opt2PC_values {Type IO LastRead 3 FirstWrite 8}
		IDX_pd_bypass {Type IO LastRead 13 FirstWrite 4}
		DynamicPlacement_II {Type I LastRead 4 FirstWrite -1}
		bypassSrcTile {Type I LastRead 0 FirstWrite -1}
		bypassTgtTile {Type I LastRead 0 FirstWrite -1}
		shape_idx {Type I LastRead 0 FirstWrite -1}
		Tile2XY_0 {Type I LastRead -1 FirstWrite -1}
		Tile2XY_1 {Type I LastRead -1 FirstWrite -1}
		CGRA_NumTiles_shapes_values {Type I LastRead -1 FirstWrite -1}
		bpsStride_0 {Type I LastRead -1 FirstWrite -1}
		bpsStride_1 {Type I LastRead -1 FirstWrite -1}
		xy2Tile {Type I LastRead -1 FirstWrite -1}
		allocated_tiles_shapes_values {Type I LastRead -1 FirstWrite -1}
		idx_pd {Type IO LastRead 4 FirstWrite 4}
		placement_dynamic_bypass_occupy {Type IO LastRead 13 FirstWrite -1}
		placement_dynamic_bypass {Type IO LastRead 1 FirstWrite -1}
		bypassOpt_wrAddr {Type IO LastRead 8 FirstWrite 8}
		placement_dynamic_dict_Opt2Tile_keys {Type O LastRead -1 FirstWrite 8}
		placement_dynamic_dict_Opt2Tile_values {Type O LastRead -1 FirstWrite 8}
		placement_done_values {Type O LastRead -1 FirstWrite 8}}
	BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_188_1 {
		bypassSrcOpt_load {Type I LastRead 0 FirstWrite -1}
		bypassSrcOptIdx_out {Type O LastRead -1 FirstWrite 2}
		placement_dynamic_dict_Opt2PC_keys {Type I LastRead 1 FirstWrite -1}}
	BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3 {
		Tile2XY_0_load {Type I LastRead 0 FirstWrite -1}
		cmp28 {Type I LastRead 0 FirstWrite -1}
		and_ln205 {Type I LastRead 0 FirstWrite -1}
		Tile2XY_1_load {Type I LastRead 0 FirstWrite -1}
		cmp77 {Type I LastRead 0 FirstWrite -1}
		and_ln218 {Type I LastRead 0 FirstWrite -1}
		sub_ln192 {Type I LastRead 0 FirstWrite -1}
		CGRA_NumTiles_shapes_values_load {Type I LastRead 0 FirstWrite -1}
		shape_idx_load {Type I LastRead 0 FirstWrite -1}
		yDiff_2_phi_out {Type O LastRead -1 FirstWrite 4}
		xDiff_2_phi_out {Type O LastRead -1 FirstWrite 4}
		i_50_out {Type O LastRead -1 FirstWrite 4}
		xDiff_2_out {Type O LastRead -1 FirstWrite 4}
		yDiff_2_out {Type O LastRead -1 FirstWrite 4}
		bpsStride_0 {Type I LastRead -1 FirstWrite -1}
		bpsStride_1 {Type I LastRead -1 FirstWrite -1}
		xy2Tile {Type I LastRead -1 FirstWrite -1}
		allocated_tiles_shapes_values {Type I LastRead -1 FirstWrite -1}}
	BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4 {
		add_ln192 {Type I LastRead 0 FirstWrite -1}
		DynamicPlacement_II_load {Type I LastRead 0 FirstWrite -1}
		tileId {Type I LastRead 0 FirstWrite -1}
		idxprom174 {Type I LastRead 0 FirstWrite -1}
		idxprom20 {Type I LastRead 0 FirstWrite -1}
		sub182 {Type I LastRead 0 FirstWrite -1}
		upperLimit {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 13}
		add_ln252_out {Type O LastRead -1 FirstWrite 13}
		tmp_71_out {Type O LastRead -1 FirstWrite 13}
		placement_dynamic_bypass_occupy {Type I LastRead 13 FirstWrite -1}
		IDX_pd_bypass {Type IO LastRead 13 FirstWrite 13}}
	BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_255_5 {
		idxprom190 {Type I LastRead 0 FirstWrite -1}
		tileId {Type I LastRead 0 FirstWrite -1}
		tmp_73_out {Type O LastRead -1 FirstWrite 2}
		placement_dynamic_bypass {Type I LastRead 1 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt {
		bypassOpt {Type I LastRead 0 FirstWrite -1}
		placement_dynamic_dict_Opt2Tile_keys {Type I LastRead 1 FirstWrite -1}
		dependency_forward {Type I LastRead 2 FirstWrite -1}
		bypassSrcOpt_keyIdx {Type I LastRead 2 FirstWrite -1}
		bypassTgtOpt {Type I LastRead 2 FirstWrite -1}
		bypassSrcOpt {Type I LastRead 2 FirstWrite -1}
		bypassTgtOpt_keyIdx {Type I LastRead 2 FirstWrite -1}
		dependency_successor_values {Type IO LastRead 1 FirstWrite -1}
		dependency_predecessor_values {Type IO LastRead 1 FirstWrite -1}
		dependency_backward {Type I LastRead 10 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_53_1 {
		bypassOpt_load {Type I LastRead 0 FirstWrite -1}
		phi_ln54_out {Type O LastRead -1 FirstWrite 2}
		placement_dynamic_dict_Opt2Tile_keys {Type I LastRead 1 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_61_2 {
		add_ln62 {Type I LastRead 0 FirstWrite -1}
		sext_ln71 {Type I LastRead 0 FirstWrite -1}
		add_ln62_1_out {Type O LastRead -1 FirstWrite 3}
		dependency_successor_values {Type I LastRead 1 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_69_3 {
		add_ln70 {Type I LastRead 0 FirstWrite -1}
		add_ln70_1_out {Type O LastRead -1 FirstWrite 3}
		dependency_predecessor_values {Type I LastRead 1 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_75_4 {
		add_ln76 {Type I LastRead 0 FirstWrite -1}
		add_ln76_1_out {Type O LastRead -1 FirstWrite 3}
		dependency_successor_values {Type I LastRead 1 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_83_5 {
		add_ln84 {Type I LastRead 0 FirstWrite -1}
		bypassSrcOpt_load {Type I LastRead 0 FirstWrite -1}
		add_ln84_1_out {Type O LastRead -1 FirstWrite 3}
		dependency_predecessor_values {Type I LastRead 1 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_94_6 {
		add_ln95 {Type I LastRead 0 FirstWrite -1}
		sext_ln71 {Type I LastRead 0 FirstWrite -1}
		add_ln95_1_out {Type O LastRead -1 FirstWrite 3}
		dependency_predecessor_values {Type I LastRead 1 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_102_7 {
		add_ln103 {Type I LastRead 0 FirstWrite -1}
		add_ln103_1_out {Type O LastRead -1 FirstWrite 3}
		dependency_successor_values {Type I LastRead 1 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_108_8 {
		add_ln109 {Type I LastRead 0 FirstWrite -1}
		add_ln109_1_out {Type O LastRead -1 FirstWrite 3}
		dependency_predecessor_values {Type I LastRead 1 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_116_9 {
		add_ln117 {Type I LastRead 0 FirstWrite -1}
		bypassSrcOpt_load {Type I LastRead 0 FirstWrite -1}
		add_ln117_1_out {Type O LastRead -1 FirstWrite 3}
		dependency_successor_values {Type I LastRead 1 FirstWrite -1}}
	RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_127_1 {
		bypassOpt_load {Type I LastRead 0 FirstWrite -1}
		phi_ln127_out {Type O LastRead -1 FirstWrite 2}
		trunc_ln127_2_cast_out {Type O LastRead -1 FirstWrite 2}
		placement_dynamic_dict_Opt2Tile_keys {Type I LastRead 1 FirstWrite -1}}
	RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_354_4 {
		idxprom60 {Type I LastRead 0 FirstWrite -1}
		DynamicPlacement_II_load_2 {Type I LastRead 0 FirstWrite -1}
		upperLimit_1 {Type I LastRead 0 FirstWrite -1}
		add_ln356_out {Type O LastRead -1 FirstWrite 3}
		IDX_pd_load_1_out {Type O LastRead -1 FirstWrite 3}
		IDX_pd_modulo {Type IO LastRead 1 FirstWrite 13}
		placement_dynamic_occupy {Type I LastRead 1 FirstWrite -1}
		IDX_pd {Type IO LastRead 2 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	IDX_pd { ap_ovld {  { IDX_pd_i in_data 0 8 }  { IDX_pd_o out_data 1 8 }  { IDX_pd_o_ap_vld out_vld 1 1 } } }
	DynamicPlacement_II { ap_none {  { DynamicPlacement_II in_data 0 8 } } }
	IDX_pd_modulo { ap_ovld {  { IDX_pd_modulo_i in_data 0 7 }  { IDX_pd_modulo_o out_data 1 7 }  { IDX_pd_modulo_o_ap_vld out_vld 1 1 } } }
	predecessors_wrAddr { ap_none {  { predecessors_wrAddr in_data 0 8 } } }
	curOpt_idx { ap_none {  { curOpt_idx in_data 0 8 } } }
	placement_dynamic_occupy { ap_memory {  { placement_dynamic_occupy_address0 mem_address 1 11 }  { placement_dynamic_occupy_ce0 mem_ce 1 1 }  { placement_dynamic_occupy_we0 mem_we 1 1 }  { placement_dynamic_occupy_d0 mem_din 1 1 }  { placement_dynamic_occupy_q0 mem_dout 0 1 } } }
	placement_dynamic_dict_Opt2Tile_values { ap_memory {  { placement_dynamic_dict_Opt2Tile_values_address0 mem_address 1 7 }  { placement_dynamic_dict_Opt2Tile_values_ce0 mem_ce 1 1 }  { placement_dynamic_dict_Opt2Tile_values_we0 mem_we 1 1 }  { placement_dynamic_dict_Opt2Tile_values_d0 mem_din 1 5 }  { placement_dynamic_dict_Opt2Tile_values_q0 in_data 0 5 } } }
	placement_dynamic_dict_Opt2PC_values { ap_memory {  { placement_dynamic_dict_Opt2PC_values_address0 mem_address 1 7 }  { placement_dynamic_dict_Opt2PC_values_ce0 mem_ce 1 1 }  { placement_dynamic_dict_Opt2PC_values_we0 mem_we 1 1 }  { placement_dynamic_dict_Opt2PC_values_d0 mem_din 1 8 }  { placement_dynamic_dict_Opt2PC_values_q0 mem_dout 0 8 } } }
	placement_done_values { ap_memory {  { placement_done_values_address0 mem_address 1 7 }  { placement_done_values_ce0 mem_ce 1 1 }  { placement_done_values_we0 mem_we 1 1 }  { placement_done_values_d0 mem_din 1 1 }  { placement_done_values_q0 in_data 0 1 } } }
	curOptPotentialPlacement_wrAddr { ap_none {  { curOptPotentialPlacement_wrAddr in_data 0 8 } } }
	predsNum { ap_none {  { predsNum in_data 0 8 } } }
	curOptPotentialPlacement { ap_memory {  { curOptPotentialPlacement_address0 mem_address 1 4 }  { curOptPotentialPlacement_ce0 mem_ce 1 1 }  { curOptPotentialPlacement_q0 in_data 0 5 } } }
	Tile2XY_0 { ap_memory {  { Tile2XY_0_address0 mem_address 1 4 }  { Tile2XY_0_ce0 mem_ce 1 1 }  { Tile2XY_0_q0 in_data 0 2 }  { Tile2XY_0_address1 MemPortADDR2 1 4 }  { Tile2XY_0_ce1 MemPortCE2 1 1 }  { Tile2XY_0_q1 in_data 0 2 } } }
	Tile2XY_1 { ap_memory {  { Tile2XY_1_address0 mem_address 1 4 }  { Tile2XY_1_ce0 mem_ce 1 1 }  { Tile2XY_1_q0 in_data 0 2 }  { Tile2XY_1_address1 MemPortADDR2 1 4 }  { Tile2XY_1_ce1 MemPortCE2 1 1 }  { Tile2XY_1_q1 in_data 0 2 } } }
	predecessors { ap_memory {  { predecessors_address0 mem_address 1 4 }  { predecessors_ce0 mem_ce 1 1 }  { predecessors_q0 mem_dout 0 8 } } }
	placement_dynamic_dict_Opt2Tile_keys { ap_memory {  { placement_dynamic_dict_Opt2Tile_keys_address0 mem_address 1 7 }  { placement_dynamic_dict_Opt2Tile_keys_ce0 mem_ce 1 1 }  { placement_dynamic_dict_Opt2Tile_keys_we0 mem_we 1 1 }  { placement_dynamic_dict_Opt2Tile_keys_d0 mem_din 1 8 }  { placement_dynamic_dict_Opt2Tile_keys_q0 mem_dout 0 8 } } }
	predTile1 { ap_ovld {  { predTile1_i in_data 0 4 }  { predTile1_o out_data 1 4 }  { predTile1_o_ap_vld out_vld 1 1 } } }
	kernel_idx { ap_none {  { kernel_idx in_data 0 3 } } }
	bypassSrcOpt { ap_ovld {  { bypassSrcOpt_i in_data 0 8 }  { bypassSrcOpt_o out_data 1 8 }  { bypassSrcOpt_o_ap_vld out_vld 1 1 } } }
	bypassTgtOpt { ap_ovld {  { bypassTgtOpt_i in_data 0 7 }  { bypassTgtOpt_o out_data 1 7 }  { bypassTgtOpt_o_ap_vld out_vld 1 1 } } }
	bypassSrcTile { ap_ovld {  { bypassSrcTile_i in_data 0 5 }  { bypassSrcTile_o out_data 1 5 }  { bypassSrcTile_o_ap_vld out_vld 1 1 } } }
	bypassTgtTile { ap_ovld {  { bypassTgtTile_i in_data 0 4 }  { bypassTgtTile_o out_data 1 4 }  { bypassTgtTile_o_ap_vld out_vld 1 1 } } }
	dependency_forward { ap_ovld {  { dependency_forward_i in_data 0 1 }  { dependency_forward_o out_data 1 1 }  { dependency_forward_o_ap_vld out_vld 1 1 } } }
	dependency_backward { ap_ovld {  { dependency_backward_i in_data 0 1 }  { dependency_backward_o out_data 1 1 }  { dependency_backward_o_ap_vld out_vld 1 1 } } }
	bypassOptIdx { ap_ovld {  { bypassOptIdx_i in_data 0 8 }  { bypassOptIdx_o out_data 1 8 }  { bypassOptIdx_o_ap_vld out_vld 1 1 } } }
	bypassOpt { ap_ovld {  { bypassOpt_i in_data 0 8 }  { bypassOpt_o out_data 1 8 }  { bypassOpt_o_ap_vld out_vld 1 1 } } }
	placement_dynamic_dict_Opt2PC_keys { ap_memory {  { placement_dynamic_dict_Opt2PC_keys_address0 mem_address 1 7 }  { placement_dynamic_dict_Opt2PC_keys_ce0 mem_ce 1 1 }  { placement_dynamic_dict_Opt2PC_keys_we0 mem_we 1 1 }  { placement_dynamic_dict_Opt2PC_keys_d0 mem_din 1 8 }  { placement_dynamic_dict_Opt2PC_keys_q0 mem_dout 0 8 } } }
	IDX_pd_bypass { ap_ovld {  { IDX_pd_bypass_i in_data 0 8 }  { IDX_pd_bypass_o out_data 1 8 }  { IDX_pd_bypass_o_ap_vld out_vld 1 1 } } }
	shape_idx { ap_none {  { shape_idx in_data 0 5 } } }
	idx_pd_r { ap_ovld {  { idx_pd_r_i in_data 0 4 }  { idx_pd_r_o out_data 1 4 }  { idx_pd_r_o_ap_vld out_vld 1 1 } } }
	placement_dynamic_bypass_occupy { ap_memory {  { placement_dynamic_bypass_occupy_address0 mem_address 1 15 }  { placement_dynamic_bypass_occupy_ce0 mem_ce 1 1 }  { placement_dynamic_bypass_occupy_we0 mem_we 1 1 }  { placement_dynamic_bypass_occupy_d0 mem_din 1 1 }  { placement_dynamic_bypass_occupy_q0 mem_dout 0 1 }  { placement_dynamic_bypass_occupy_address1 MemPortADDR2 1 15 }  { placement_dynamic_bypass_occupy_ce1 MemPortCE2 1 1 }  { placement_dynamic_bypass_occupy_q1 MemPortDOUT2 0 1 } } }
	placement_dynamic_bypass { ap_memory {  { placement_dynamic_bypass_address0 mem_address 1 14 }  { placement_dynamic_bypass_ce0 mem_ce 1 1 }  { placement_dynamic_bypass_we0 mem_we 1 1 }  { placement_dynamic_bypass_d0 mem_din 1 8 }  { placement_dynamic_bypass_q0 mem_dout 0 8 } } }
	bypassOpt_wrAddr { ap_ovld {  { bypassOpt_wrAddr_i in_data 0 8 }  { bypassOpt_wrAddr_o out_data 1 8 }  { bypassOpt_wrAddr_o_ap_vld out_vld 1 1 } } }
	dependency_successor_values { ap_memory {  { dependency_successor_values_address0 mem_address 1 11 }  { dependency_successor_values_ce0 mem_ce 1 1 }  { dependency_successor_values_we0 mem_we 1 1 }  { dependency_successor_values_d0 mem_din 1 8 }  { dependency_successor_values_q0 mem_dout 0 8 } } }
	dependency_predecessor_values { ap_memory {  { dependency_predecessor_values_address0 mem_address 1 10 }  { dependency_predecessor_values_ce0 mem_ce 1 1 }  { dependency_predecessor_values_we0 mem_we 1 1 }  { dependency_predecessor_values_d0 mem_din 1 8 }  { dependency_predecessor_values_q0 mem_dout 0 8 } } }
}
