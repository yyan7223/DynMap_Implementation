set moduleName Reset
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
set C_modelName {Reset}
set C_modelType { void 0 }
set C_modelArgList {
	{ IDX_pd int 8 regular {pointer 1} {global 1}  }
	{ idx_pd_r int 4 regular {pointer 1} {global 1}  }
	{ IDX_pd_modulo int 7 regular {pointer 1} {global 1}  }
	{ IDX_pd_bypass int 8 regular {pointer 1} {global 1}  }
	{ bypassOptIdx int 8 regular {pointer 1} {global 1}  }
	{ bypassOpt int 8 regular {pointer 1} {global 1}  }
	{ bypassSrcOpt int 8 regular {pointer 1} {global 1}  }
	{ bypassTgtOpt int 7 regular {pointer 1} {global 1}  }
	{ predTile1 int 4 regular {pointer 1} {global 1}  }
	{ bypassSrcTile int 5 regular {pointer 1} {global 1}  }
	{ bypassTgtTile int 4 regular {pointer 1} {global 1}  }
	{ dependency_forward int 1 regular {pointer 1} {global 1}  }
	{ dependency_backward int 1 regular {pointer 1} {global 1}  }
	{ kernel_idx int 3 regular {pointer 0} {global 0}  }
	{ DFG_NodesCount_kernels_values int 6 regular {array 6 { 1 } 1 1 } {global 0}  }
	{ bypassOpt_wrAddr int 8 regular {pointer 1} {global 1}  }
	{ predecessors int 8 regular {array 10 { 0 3 } 0 1 } {global 1}  }
	{ placement_dynamic_bypass int 8 regular {array 12800 { 0 3 } 0 1 } {global 1}  }
	{ placement_dynamic_occupy int 1 regular {array 1600 { 0 3 } 0 1 } {global 1}  }
	{ placement_dynamic_bypass_occupy int 1 regular {array 25600 { 0 3 } 0 1 } {global 1}  }
	{ placement_dynamic_dict_Opt2PC_keys int 8 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ placement_dynamic_dict_Opt2PC_values int 8 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ placement_dynamic_dict_Opt2Tile_keys int 8 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ placement_dynamic_dict_Opt2Tile_values int 5 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ placement_done_values int 1 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ dependency_predecessor_values int 8 regular {array 1000 { 0 3 } 0 1 } {global 1}  }
	{ dependency_successor_values int 8 regular {array 2000 { 0 3 } 0 1 } {global 1}  }
	{ curOptPotentialPlacement int 5 regular {array 16 { 0 3 } 0 1 } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "IDX_pd", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "idx_pd_r", "interface" : "wire", "bitwidth" : 4, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "IDX_pd_modulo", "interface" : "wire", "bitwidth" : 7, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "IDX_pd_bypass", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bypassOptIdx", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bypassOpt", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bypassSrcOpt", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bypassTgtOpt", "interface" : "wire", "bitwidth" : 7, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "predTile1", "interface" : "wire", "bitwidth" : 4, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bypassSrcTile", "interface" : "wire", "bitwidth" : 5, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bypassTgtTile", "interface" : "wire", "bitwidth" : 4, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dependency_forward", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dependency_backward", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "kernel_idx", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "DFG_NodesCount_kernels_values", "interface" : "memory", "bitwidth" : 6, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bypassOpt_wrAddr", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "predecessors", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_bypass", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_occupy", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_bypass_occupy", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_dict_Opt2PC_keys", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_dict_Opt2PC_values", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_dict_Opt2Tile_keys", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_dict_Opt2Tile_values", "interface" : "memory", "bitwidth" : 5, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "placement_done_values", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dependency_predecessor_values", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dependency_successor_values", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "curOptPotentialPlacement", "interface" : "memory", "bitwidth" : 5, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 86
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ IDX_pd sc_out sc_lv 8 signal 0 } 
	{ IDX_pd_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ idx_pd_r sc_out sc_lv 4 signal 1 } 
	{ idx_pd_r_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ IDX_pd_modulo sc_out sc_lv 7 signal 2 } 
	{ IDX_pd_modulo_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ IDX_pd_bypass sc_out sc_lv 8 signal 3 } 
	{ IDX_pd_bypass_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ bypassOptIdx sc_out sc_lv 8 signal 4 } 
	{ bypassOptIdx_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ bypassOpt sc_out sc_lv 8 signal 5 } 
	{ bypassOpt_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ bypassSrcOpt sc_out sc_lv 8 signal 6 } 
	{ bypassSrcOpt_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ bypassTgtOpt sc_out sc_lv 7 signal 7 } 
	{ bypassTgtOpt_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ predTile1 sc_out sc_lv 4 signal 8 } 
	{ predTile1_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ bypassSrcTile sc_out sc_lv 5 signal 9 } 
	{ bypassSrcTile_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ bypassTgtTile sc_out sc_lv 4 signal 10 } 
	{ bypassTgtTile_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ dependency_forward sc_out sc_lv 1 signal 11 } 
	{ dependency_forward_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ dependency_backward sc_out sc_lv 1 signal 12 } 
	{ dependency_backward_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ kernel_idx sc_in sc_lv 3 signal 13 } 
	{ DFG_NodesCount_kernels_values_address0 sc_out sc_lv 3 signal 14 } 
	{ DFG_NodesCount_kernels_values_ce0 sc_out sc_logic 1 signal 14 } 
	{ DFG_NodesCount_kernels_values_q0 sc_in sc_lv 6 signal 14 } 
	{ bypassOpt_wrAddr sc_out sc_lv 8 signal 15 } 
	{ bypassOpt_wrAddr_ap_vld sc_out sc_logic 1 outvld 15 } 
	{ predecessors_address0 sc_out sc_lv 4 signal 16 } 
	{ predecessors_ce0 sc_out sc_logic 1 signal 16 } 
	{ predecessors_we0 sc_out sc_logic 1 signal 16 } 
	{ predecessors_d0 sc_out sc_lv 8 signal 16 } 
	{ placement_dynamic_bypass_address0 sc_out sc_lv 14 signal 17 } 
	{ placement_dynamic_bypass_ce0 sc_out sc_logic 1 signal 17 } 
	{ placement_dynamic_bypass_we0 sc_out sc_logic 1 signal 17 } 
	{ placement_dynamic_bypass_d0 sc_out sc_lv 8 signal 17 } 
	{ placement_dynamic_occupy_address0 sc_out sc_lv 11 signal 18 } 
	{ placement_dynamic_occupy_ce0 sc_out sc_logic 1 signal 18 } 
	{ placement_dynamic_occupy_we0 sc_out sc_logic 1 signal 18 } 
	{ placement_dynamic_occupy_d0 sc_out sc_lv 1 signal 18 } 
	{ placement_dynamic_bypass_occupy_address0 sc_out sc_lv 15 signal 19 } 
	{ placement_dynamic_bypass_occupy_ce0 sc_out sc_logic 1 signal 19 } 
	{ placement_dynamic_bypass_occupy_we0 sc_out sc_logic 1 signal 19 } 
	{ placement_dynamic_bypass_occupy_d0 sc_out sc_lv 1 signal 19 } 
	{ placement_dynamic_dict_Opt2PC_keys_address0 sc_out sc_lv 7 signal 20 } 
	{ placement_dynamic_dict_Opt2PC_keys_ce0 sc_out sc_logic 1 signal 20 } 
	{ placement_dynamic_dict_Opt2PC_keys_we0 sc_out sc_logic 1 signal 20 } 
	{ placement_dynamic_dict_Opt2PC_keys_d0 sc_out sc_lv 8 signal 20 } 
	{ placement_dynamic_dict_Opt2PC_values_address0 sc_out sc_lv 7 signal 21 } 
	{ placement_dynamic_dict_Opt2PC_values_ce0 sc_out sc_logic 1 signal 21 } 
	{ placement_dynamic_dict_Opt2PC_values_we0 sc_out sc_logic 1 signal 21 } 
	{ placement_dynamic_dict_Opt2PC_values_d0 sc_out sc_lv 8 signal 21 } 
	{ placement_dynamic_dict_Opt2Tile_keys_address0 sc_out sc_lv 7 signal 22 } 
	{ placement_dynamic_dict_Opt2Tile_keys_ce0 sc_out sc_logic 1 signal 22 } 
	{ placement_dynamic_dict_Opt2Tile_keys_we0 sc_out sc_logic 1 signal 22 } 
	{ placement_dynamic_dict_Opt2Tile_keys_d0 sc_out sc_lv 8 signal 22 } 
	{ placement_dynamic_dict_Opt2Tile_values_address0 sc_out sc_lv 7 signal 23 } 
	{ placement_dynamic_dict_Opt2Tile_values_ce0 sc_out sc_logic 1 signal 23 } 
	{ placement_dynamic_dict_Opt2Tile_values_we0 sc_out sc_logic 1 signal 23 } 
	{ placement_dynamic_dict_Opt2Tile_values_d0 sc_out sc_lv 5 signal 23 } 
	{ placement_done_values_address0 sc_out sc_lv 7 signal 24 } 
	{ placement_done_values_ce0 sc_out sc_logic 1 signal 24 } 
	{ placement_done_values_we0 sc_out sc_logic 1 signal 24 } 
	{ placement_done_values_d0 sc_out sc_lv 1 signal 24 } 
	{ dependency_predecessor_values_address0 sc_out sc_lv 10 signal 25 } 
	{ dependency_predecessor_values_ce0 sc_out sc_logic 1 signal 25 } 
	{ dependency_predecessor_values_we0 sc_out sc_logic 1 signal 25 } 
	{ dependency_predecessor_values_d0 sc_out sc_lv 8 signal 25 } 
	{ dependency_successor_values_address0 sc_out sc_lv 11 signal 26 } 
	{ dependency_successor_values_ce0 sc_out sc_logic 1 signal 26 } 
	{ dependency_successor_values_we0 sc_out sc_logic 1 signal 26 } 
	{ dependency_successor_values_d0 sc_out sc_lv 8 signal 26 } 
	{ curOptPotentialPlacement_address0 sc_out sc_lv 4 signal 27 } 
	{ curOptPotentialPlacement_ce0 sc_out sc_logic 1 signal 27 } 
	{ curOptPotentialPlacement_we0 sc_out sc_logic 1 signal 27 } 
	{ curOptPotentialPlacement_d0 sc_out sc_lv 5 signal 27 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "IDX_pd", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "IDX_pd", "role": "default" }} , 
 	{ "name": "IDX_pd_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "IDX_pd", "role": "ap_vld" }} , 
 	{ "name": "idx_pd_r", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "idx_pd_r", "role": "default" }} , 
 	{ "name": "idx_pd_r_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "idx_pd_r", "role": "ap_vld" }} , 
 	{ "name": "IDX_pd_modulo", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "IDX_pd_modulo", "role": "default" }} , 
 	{ "name": "IDX_pd_modulo_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "IDX_pd_modulo", "role": "ap_vld" }} , 
 	{ "name": "IDX_pd_bypass", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "IDX_pd_bypass", "role": "default" }} , 
 	{ "name": "IDX_pd_bypass_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "IDX_pd_bypass", "role": "ap_vld" }} , 
 	{ "name": "bypassOptIdx", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassOptIdx", "role": "default" }} , 
 	{ "name": "bypassOptIdx_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "bypassOptIdx", "role": "ap_vld" }} , 
 	{ "name": "bypassOpt", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassOpt", "role": "default" }} , 
 	{ "name": "bypassOpt_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "bypassOpt", "role": "ap_vld" }} , 
 	{ "name": "bypassSrcOpt", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassSrcOpt", "role": "default" }} , 
 	{ "name": "bypassSrcOpt_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "bypassSrcOpt", "role": "ap_vld" }} , 
 	{ "name": "bypassTgtOpt", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "bypassTgtOpt", "role": "default" }} , 
 	{ "name": "bypassTgtOpt_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "bypassTgtOpt", "role": "ap_vld" }} , 
 	{ "name": "predTile1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "predTile1", "role": "default" }} , 
 	{ "name": "predTile1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "predTile1", "role": "ap_vld" }} , 
 	{ "name": "bypassSrcTile", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bypassSrcTile", "role": "default" }} , 
 	{ "name": "bypassSrcTile_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "bypassSrcTile", "role": "ap_vld" }} , 
 	{ "name": "bypassTgtTile", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "bypassTgtTile", "role": "default" }} , 
 	{ "name": "bypassTgtTile_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "bypassTgtTile", "role": "ap_vld" }} , 
 	{ "name": "dependency_forward", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_forward", "role": "default" }} , 
 	{ "name": "dependency_forward_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dependency_forward", "role": "ap_vld" }} , 
 	{ "name": "dependency_backward", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_backward", "role": "default" }} , 
 	{ "name": "dependency_backward_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dependency_backward", "role": "ap_vld" }} , 
 	{ "name": "kernel_idx", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "kernel_idx", "role": "default" }} , 
 	{ "name": "DFG_NodesCount_kernels_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "DFG_NodesCount_kernels_values", "role": "address0" }} , 
 	{ "name": "DFG_NodesCount_kernels_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DFG_NodesCount_kernels_values", "role": "ce0" }} , 
 	{ "name": "DFG_NodesCount_kernels_values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "DFG_NodesCount_kernels_values", "role": "q0" }} , 
 	{ "name": "bypassOpt_wrAddr", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassOpt_wrAddr", "role": "default" }} , 
 	{ "name": "bypassOpt_wrAddr_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "bypassOpt_wrAddr", "role": "ap_vld" }} , 
 	{ "name": "predecessors_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "predecessors", "role": "address0" }} , 
 	{ "name": "predecessors_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "predecessors", "role": "ce0" }} , 
 	{ "name": "predecessors_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "predecessors", "role": "we0" }} , 
 	{ "name": "predecessors_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "predecessors", "role": "d0" }} , 
 	{ "name": "placement_dynamic_bypass_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "placement_dynamic_bypass", "role": "address0" }} , 
 	{ "name": "placement_dynamic_bypass_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_bypass_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass", "role": "we0" }} , 
 	{ "name": "placement_dynamic_bypass_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_bypass", "role": "d0" }} , 
 	{ "name": "placement_dynamic_occupy_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "placement_dynamic_occupy", "role": "address0" }} , 
 	{ "name": "placement_dynamic_occupy_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_occupy", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_occupy_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_occupy", "role": "we0" }} , 
 	{ "name": "placement_dynamic_occupy_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_occupy", "role": "d0" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "address0" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "we0" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "d0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "address0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "we0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "d0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_values", "role": "address0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_values", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_values_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_values", "role": "we0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_values_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_values", "role": "d0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "address0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "we0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "d0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_values", "role": "address0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_values", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_values_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_values", "role": "we0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_values_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_values", "role": "d0" }} , 
 	{ "name": "placement_done_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_done_values", "role": "address0" }} , 
 	{ "name": "placement_done_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_done_values", "role": "ce0" }} , 
 	{ "name": "placement_done_values_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_done_values", "role": "we0" }} , 
 	{ "name": "placement_done_values_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_done_values", "role": "d0" }} , 
 	{ "name": "dependency_predecessor_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "address0" }} , 
 	{ "name": "dependency_predecessor_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "ce0" }} , 
 	{ "name": "dependency_predecessor_values_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "we0" }} , 
 	{ "name": "dependency_predecessor_values_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "d0" }} , 
 	{ "name": "dependency_successor_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "dependency_successor_values", "role": "address0" }} , 
 	{ "name": "dependency_successor_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_successor_values", "role": "ce0" }} , 
 	{ "name": "dependency_successor_values_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_successor_values", "role": "we0" }} , 
 	{ "name": "dependency_successor_values_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dependency_successor_values", "role": "d0" }} , 
 	{ "name": "curOptPotentialPlacement_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "address0" }} , 
 	{ "name": "curOptPotentialPlacement_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "ce0" }} , 
 	{ "name": "curOptPotentialPlacement_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "we0" }} , 
 	{ "name": "curOptPotentialPlacement_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "4", "6", "8", "10", "12", "14", "16", "18", "21", "24", "27"],
		"CDFG" : "Reset",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "25653", "EstimateLatencyMax" : "25678",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "IDX_pd", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "idx_pd_r", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "IDX_pd_modulo", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "IDX_pd_bypass", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "bypassOptIdx", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "bypassOpt", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "bypassSrcOpt", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "bypassTgtOpt", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "predTile1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "bypassSrcTile", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "bypassTgtTile", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_forward", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_backward", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "kernel_idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "DFG_NodesCount_kernels_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "bypassOpt_wrAddr", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "predecessors", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "placement_dynamic_bypass", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_685_5_VITIS_LOOP_686_6_VITIS_LOOP_687_7_fu_191", "Port" : "placement_dynamic_bypass", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "placement_dynamic_occupy", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_692_8_VITIS_LOOP_693_9_fu_197", "Port" : "placement_dynamic_occupy", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "placement_dynamic_bypass_occupy", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_697_10_VITIS_LOOP_698_11_VITIS_LOOP_699_12_fu_203", "Port" : "placement_dynamic_bypass_occupy", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "placement_dynamic_dict_Opt2PC_keys", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "24", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_719_18_fu_259", "Port" : "placement_dynamic_dict_Opt2PC_keys", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "8", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_704_13_fu_209", "Port" : "placement_dynamic_dict_Opt2PC_keys", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "placement_dynamic_dict_Opt2PC_values", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_707_14_fu_215", "Port" : "placement_dynamic_dict_Opt2PC_values", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_710_15_fu_221", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "24", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_719_18_fu_259", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "placement_dynamic_dict_Opt2Tile_values", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_713_16_fu_227", "Port" : "placement_dynamic_dict_Opt2Tile_values", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "placement_done_values", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_716_17_fu_233", "Port" : "placement_done_values", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "placement_static_kernels_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "24", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_719_18_fu_259", "Port" : "placement_static_kernels_values", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "dependency_predecessors_kernels_values1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_724_19_VITIS_LOOP_726_20_fu_239", "Port" : "dependency_predecessors_kernels_values1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_724_19_VITIS_LOOP_726_20_fu_239", "Port" : "dependency_predecessor_values", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "dependency_successors_kernels_values1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_736_21_VITIS_LOOP_738_22_fu_249", "Port" : "dependency_successors_kernels_values1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_736_21_VITIS_LOOP_738_22_fu_249", "Port" : "dependency_successor_values", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "curOptPotentialPlacement", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_674_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state3_blk"}},
			{"Name" : "VITIS_LOOP_677_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state4_blk"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_685_5_VITIS_LOOP_686_6_VITIS_LOOP_687_7_fu_191", "Parent" : "0", "Child" : ["2", "3"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_685_5_VITIS_LOOP_686_6_VITIS_LOOP_687_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12804", "EstimateLatencyMax" : "12804",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "placement_dynamic_bypass", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_685_5_VITIS_LOOP_686_6_VITIS_LOOP_687_7", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_685_5_VITIS_LOOP_686_6_VITIS_LOOP_687_7_fu_191.mac_muladd_4ns_7ns_7ns_10_4_1_U1", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_685_5_VITIS_LOOP_686_6_VITIS_LOOP_687_7_fu_191.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_692_8_VITIS_LOOP_693_9_fu_197", "Parent" : "0", "Child" : ["5"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_692_8_VITIS_LOOP_693_9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1602", "EstimateLatencyMax" : "1602",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "placement_dynamic_occupy", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_692_8_VITIS_LOOP_693_9", "PipelineType" : "NotSupport"}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_692_8_VITIS_LOOP_693_9_fu_197.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_697_10_VITIS_LOOP_698_11_VITIS_LOOP_699_12_fu_203", "Parent" : "0", "Child" : ["7"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_697_10_VITIS_LOOP_698_11_VITIS_LOOP_699_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "25602", "EstimateLatencyMax" : "25602",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "placement_dynamic_bypass_occupy", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_697_10_VITIS_LOOP_698_11_VITIS_LOOP_699_12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter1", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_697_10_VITIS_LOOP_698_11_VITIS_LOOP_699_12_fu_203.flow_control_loop_pipe_sequential_init_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_704_13_fu_209", "Parent" : "0", "Child" : ["9"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_704_13",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "102", "EstimateLatencyMax" : "102",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "placement_dynamic_dict_Opt2PC_keys", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_704_13", "PipelineType" : "NotSupport"}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_704_13_fu_209.flow_control_loop_pipe_sequential_init_U", "Parent" : "8"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_707_14_fu_215", "Parent" : "0", "Child" : ["11"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_707_14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "102", "EstimateLatencyMax" : "102",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "placement_dynamic_dict_Opt2PC_values", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_707_14", "PipelineType" : "NotSupport"}]},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_707_14_fu_215.flow_control_loop_pipe_sequential_init_U", "Parent" : "10"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_710_15_fu_221", "Parent" : "0", "Child" : ["13"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_710_15",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "102", "EstimateLatencyMax" : "102",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_710_15", "PipelineType" : "NotSupport"}]},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_710_15_fu_221.flow_control_loop_pipe_sequential_init_U", "Parent" : "12"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_713_16_fu_227", "Parent" : "0", "Child" : ["15"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_713_16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "102", "EstimateLatencyMax" : "102",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "placement_dynamic_dict_Opt2Tile_values", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_713_16", "PipelineType" : "NotSupport"}]},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_713_16_fu_227.flow_control_loop_pipe_sequential_init_U", "Parent" : "14"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_716_17_fu_233", "Parent" : "0", "Child" : ["17"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_716_17",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "102", "EstimateLatencyMax" : "102",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "placement_done_values", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_716_17", "PipelineType" : "NotSupport"}]},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_716_17_fu_233.flow_control_loop_pipe_sequential_init_U", "Parent" : "16"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_724_19_VITIS_LOOP_726_20_fu_239", "Parent" : "0", "Child" : ["19", "20"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_724_19_VITIS_LOOP_726_20",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "174", "EstimateLatencyMax" : "424",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln724", "Type" : "None", "Direction" : "I"},
			{"Name" : "mul_ln727", "Type" : "None", "Direction" : "I"},
			{"Name" : "dependency_predecessors_kernels_values1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_724_19_VITIS_LOOP_726_20", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_724_19_VITIS_LOOP_726_20_fu_239.dependency_predecessors_kernels_values1_U", "Parent" : "18"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_724_19_VITIS_LOOP_726_20_fu_239.flow_control_loop_pipe_sequential_init_U", "Parent" : "18"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_736_21_VITIS_LOOP_738_22_fu_249", "Parent" : "0", "Child" : ["22", "23"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_736_21_VITIS_LOOP_738_22",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "344", "EstimateLatencyMax" : "844",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln736", "Type" : "None", "Direction" : "I"},
			{"Name" : "mul_ln727", "Type" : "None", "Direction" : "I"},
			{"Name" : "dependency_successors_kernels_values1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_736_21_VITIS_LOOP_738_22", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_736_21_VITIS_LOOP_738_22_fu_249.dependency_successors_kernels_values1_U", "Parent" : "21"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_736_21_VITIS_LOOP_738_22_fu_249.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_719_18_fu_259", "Parent" : "0", "Child" : ["25", "26"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_719_18",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "19", "EstimateLatencyMax" : "44",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "DFG_NodesCount_kernels_values_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "mul_ln727", "Type" : "None", "Direction" : "I"},
			{"Name" : "placement_static_kernels_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "placement_dynamic_dict_Opt2PC_keys", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_719_18", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_719_18_fu_259.placement_static_kernels_values_U", "Parent" : "24"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_Pipeline_VITIS_LOOP_719_18_fu_259.flow_control_loop_pipe_sequential_init_U", "Parent" : "24"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_3ns_8ns_10_1_1_U24", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Reset {
		IDX_pd {Type O LastRead -1 FirstWrite 1}
		idx_pd_r {Type O LastRead -1 FirstWrite 1}
		IDX_pd_modulo {Type O LastRead -1 FirstWrite 1}
		IDX_pd_bypass {Type O LastRead -1 FirstWrite 1}
		bypassOptIdx {Type O LastRead -1 FirstWrite 1}
		bypassOpt {Type O LastRead -1 FirstWrite 1}
		bypassSrcOpt {Type O LastRead -1 FirstWrite 1}
		bypassTgtOpt {Type O LastRead -1 FirstWrite 1}
		predTile1 {Type O LastRead -1 FirstWrite 1}
		bypassSrcTile {Type O LastRead -1 FirstWrite 1}
		bypassTgtTile {Type O LastRead -1 FirstWrite 1}
		dependency_forward {Type O LastRead -1 FirstWrite 1}
		dependency_backward {Type O LastRead -1 FirstWrite 1}
		kernel_idx {Type I LastRead 0 FirstWrite -1}
		DFG_NodesCount_kernels_values {Type I LastRead 0 FirstWrite -1}
		bypassOpt_wrAddr {Type O LastRead -1 FirstWrite 1}
		predecessors {Type O LastRead -1 FirstWrite 2}
		placement_dynamic_bypass {Type O LastRead -1 FirstWrite 3}
		placement_dynamic_occupy {Type O LastRead -1 FirstWrite 0}
		placement_dynamic_bypass_occupy {Type O LastRead -1 FirstWrite 2}
		placement_dynamic_dict_Opt2PC_keys {Type O LastRead -1 FirstWrite 0}
		placement_dynamic_dict_Opt2PC_values {Type O LastRead -1 FirstWrite 0}
		placement_dynamic_dict_Opt2Tile_keys {Type O LastRead -1 FirstWrite 0}
		placement_dynamic_dict_Opt2Tile_values {Type O LastRead -1 FirstWrite 0}
		placement_done_values {Type O LastRead -1 FirstWrite 0}
		placement_static_kernels_values {Type I LastRead -1 FirstWrite -1}
		dependency_predecessors_kernels_values1 {Type I LastRead -1 FirstWrite -1}
		dependency_predecessor_values {Type O LastRead -1 FirstWrite 3}
		dependency_successors_kernels_values1 {Type I LastRead -1 FirstWrite -1}
		dependency_successor_values {Type O LastRead -1 FirstWrite 3}
		curOptPotentialPlacement {Type O LastRead -1 FirstWrite 3}}
	Reset_Pipeline_VITIS_LOOP_685_5_VITIS_LOOP_686_6_VITIS_LOOP_687_7 {
		placement_dynamic_bypass {Type O LastRead -1 FirstWrite 3}}
	Reset_Pipeline_VITIS_LOOP_692_8_VITIS_LOOP_693_9 {
		placement_dynamic_occupy {Type O LastRead -1 FirstWrite 0}}
	Reset_Pipeline_VITIS_LOOP_697_10_VITIS_LOOP_698_11_VITIS_LOOP_699_12 {
		placement_dynamic_bypass_occupy {Type O LastRead -1 FirstWrite 2}}
	Reset_Pipeline_VITIS_LOOP_704_13 {
		placement_dynamic_dict_Opt2PC_keys {Type O LastRead -1 FirstWrite 0}}
	Reset_Pipeline_VITIS_LOOP_707_14 {
		placement_dynamic_dict_Opt2PC_values {Type O LastRead -1 FirstWrite 0}}
	Reset_Pipeline_VITIS_LOOP_710_15 {
		placement_dynamic_dict_Opt2Tile_keys {Type O LastRead -1 FirstWrite 0}}
	Reset_Pipeline_VITIS_LOOP_713_16 {
		placement_dynamic_dict_Opt2Tile_values {Type O LastRead -1 FirstWrite 0}}
	Reset_Pipeline_VITIS_LOOP_716_17 {
		placement_done_values {Type O LastRead -1 FirstWrite 0}}
	Reset_Pipeline_VITIS_LOOP_724_19_VITIS_LOOP_726_20 {
		add_ln724 {Type I LastRead 0 FirstWrite -1}
		mul_ln727 {Type I LastRead 0 FirstWrite -1}
		dependency_predecessors_kernels_values1 {Type I LastRead -1 FirstWrite -1}
		dependency_predecessor_values {Type O LastRead -1 FirstWrite 3}}
	Reset_Pipeline_VITIS_LOOP_736_21_VITIS_LOOP_738_22 {
		add_ln736 {Type I LastRead 0 FirstWrite -1}
		mul_ln727 {Type I LastRead 0 FirstWrite -1}
		dependency_successors_kernels_values1 {Type I LastRead -1 FirstWrite -1}
		dependency_successor_values {Type O LastRead -1 FirstWrite 3}}
	Reset_Pipeline_VITIS_LOOP_719_18 {
		DFG_NodesCount_kernels_values_load {Type I LastRead 0 FirstWrite -1}
		mul_ln727 {Type I LastRead 0 FirstWrite -1}
		placement_static_kernels_values {Type I LastRead -1 FirstWrite -1}
		placement_dynamic_dict_Opt2PC_keys {Type O LastRead -1 FirstWrite 1}
		placement_dynamic_dict_Opt2Tile_keys {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "25653", "Max" : "25678"}
	, {"Name" : "Interval", "Min" : "25653", "Max" : "25678"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	IDX_pd { ap_vld {  { IDX_pd out_data 1 8 }  { IDX_pd_ap_vld out_vld 1 1 } } }
	idx_pd_r { ap_vld {  { idx_pd_r out_data 1 4 }  { idx_pd_r_ap_vld out_vld 1 1 } } }
	IDX_pd_modulo { ap_vld {  { IDX_pd_modulo out_data 1 7 }  { IDX_pd_modulo_ap_vld out_vld 1 1 } } }
	IDX_pd_bypass { ap_vld {  { IDX_pd_bypass out_data 1 8 }  { IDX_pd_bypass_ap_vld out_vld 1 1 } } }
	bypassOptIdx { ap_vld {  { bypassOptIdx out_data 1 8 }  { bypassOptIdx_ap_vld out_vld 1 1 } } }
	bypassOpt { ap_vld {  { bypassOpt out_data 1 8 }  { bypassOpt_ap_vld out_vld 1 1 } } }
	bypassSrcOpt { ap_vld {  { bypassSrcOpt out_data 1 8 }  { bypassSrcOpt_ap_vld out_vld 1 1 } } }
	bypassTgtOpt { ap_vld {  { bypassTgtOpt out_data 1 7 }  { bypassTgtOpt_ap_vld out_vld 1 1 } } }
	predTile1 { ap_vld {  { predTile1 out_data 1 4 }  { predTile1_ap_vld out_vld 1 1 } } }
	bypassSrcTile { ap_vld {  { bypassSrcTile out_data 1 5 }  { bypassSrcTile_ap_vld out_vld 1 1 } } }
	bypassTgtTile { ap_vld {  { bypassTgtTile out_data 1 4 }  { bypassTgtTile_ap_vld out_vld 1 1 } } }
	dependency_forward { ap_vld {  { dependency_forward out_data 1 1 }  { dependency_forward_ap_vld out_vld 1 1 } } }
	dependency_backward { ap_vld {  { dependency_backward out_data 1 1 }  { dependency_backward_ap_vld out_vld 1 1 } } }
	kernel_idx { ap_none {  { kernel_idx in_data 0 3 } } }
	DFG_NodesCount_kernels_values { ap_memory {  { DFG_NodesCount_kernels_values_address0 mem_address 1 3 }  { DFG_NodesCount_kernels_values_ce0 mem_ce 1 1 }  { DFG_NodesCount_kernels_values_q0 in_data 0 6 } } }
	bypassOpt_wrAddr { ap_vld {  { bypassOpt_wrAddr out_data 1 8 }  { bypassOpt_wrAddr_ap_vld out_vld 1 1 } } }
	predecessors { ap_memory {  { predecessors_address0 mem_address 1 4 }  { predecessors_ce0 mem_ce 1 1 }  { predecessors_we0 mem_we 1 1 }  { predecessors_d0 mem_din 1 8 } } }
	placement_dynamic_bypass { ap_memory {  { placement_dynamic_bypass_address0 mem_address 1 14 }  { placement_dynamic_bypass_ce0 mem_ce 1 1 }  { placement_dynamic_bypass_we0 mem_we 1 1 }  { placement_dynamic_bypass_d0 mem_din 1 8 } } }
	placement_dynamic_occupy { ap_memory {  { placement_dynamic_occupy_address0 mem_address 1 11 }  { placement_dynamic_occupy_ce0 mem_ce 1 1 }  { placement_dynamic_occupy_we0 mem_we 1 1 }  { placement_dynamic_occupy_d0 mem_din 1 1 } } }
	placement_dynamic_bypass_occupy { ap_memory {  { placement_dynamic_bypass_occupy_address0 mem_address 1 15 }  { placement_dynamic_bypass_occupy_ce0 mem_ce 1 1 }  { placement_dynamic_bypass_occupy_we0 mem_we 1 1 }  { placement_dynamic_bypass_occupy_d0 mem_din 1 1 } } }
	placement_dynamic_dict_Opt2PC_keys { ap_memory {  { placement_dynamic_dict_Opt2PC_keys_address0 mem_address 1 7 }  { placement_dynamic_dict_Opt2PC_keys_ce0 mem_ce 1 1 }  { placement_dynamic_dict_Opt2PC_keys_we0 mem_we 1 1 }  { placement_dynamic_dict_Opt2PC_keys_d0 mem_din 1 8 } } }
	placement_dynamic_dict_Opt2PC_values { ap_memory {  { placement_dynamic_dict_Opt2PC_values_address0 mem_address 1 7 }  { placement_dynamic_dict_Opt2PC_values_ce0 mem_ce 1 1 }  { placement_dynamic_dict_Opt2PC_values_we0 mem_we 1 1 }  { placement_dynamic_dict_Opt2PC_values_d0 mem_din 1 8 } } }
	placement_dynamic_dict_Opt2Tile_keys { ap_memory {  { placement_dynamic_dict_Opt2Tile_keys_address0 mem_address 1 7 }  { placement_dynamic_dict_Opt2Tile_keys_ce0 mem_ce 1 1 }  { placement_dynamic_dict_Opt2Tile_keys_we0 mem_we 1 1 }  { placement_dynamic_dict_Opt2Tile_keys_d0 mem_din 1 8 } } }
	placement_dynamic_dict_Opt2Tile_values { ap_memory {  { placement_dynamic_dict_Opt2Tile_values_address0 mem_address 1 7 }  { placement_dynamic_dict_Opt2Tile_values_ce0 mem_ce 1 1 }  { placement_dynamic_dict_Opt2Tile_values_we0 mem_we 1 1 }  { placement_dynamic_dict_Opt2Tile_values_d0 mem_din 1 5 } } }
	placement_done_values { ap_memory {  { placement_done_values_address0 mem_address 1 7 }  { placement_done_values_ce0 mem_ce 1 1 }  { placement_done_values_we0 mem_we 1 1 }  { placement_done_values_d0 mem_din 1 1 } } }
	dependency_predecessor_values { ap_memory {  { dependency_predecessor_values_address0 mem_address 1 10 }  { dependency_predecessor_values_ce0 mem_ce 1 1 }  { dependency_predecessor_values_we0 mem_we 1 1 }  { dependency_predecessor_values_d0 mem_din 1 8 } } }
	dependency_successor_values { ap_memory {  { dependency_successor_values_address0 mem_address 1 11 }  { dependency_successor_values_ce0 mem_ce 1 1 }  { dependency_successor_values_we0 mem_we 1 1 }  { dependency_successor_values_d0 mem_din 1 8 } } }
	curOptPotentialPlacement { ap_memory {  { curOptPotentialPlacement_address0 mem_address 1 4 }  { curOptPotentialPlacement_ce0 mem_ce 1 1 }  { curOptPotentialPlacement_we0 mem_we 1 1 }  { curOptPotentialPlacement_d0 mem_din 1 5 } } }
}
