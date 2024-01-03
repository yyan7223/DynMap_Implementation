set moduleName BypassOptPlacement_Gen_Record
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
set C_modelName {BypassOptPlacement_Gen_Record}
set C_modelType { int 1 }
set C_modelArgList {
	{ bypassOptIdx int 8 regular {pointer 2} {global 2}  }
	{ bypassOpt int 8 regular {pointer 1} {global 1}  }
	{ bypassSrcOpt int 8 regular {pointer 0} {global 0}  }
	{ placement_dynamic_dict_Opt2PC_keys int 8 regular {array 100 { 2 3 } 1 1 } {global 2}  }
	{ placement_dynamic_dict_Opt2PC_values int 8 regular {array 100 { 2 3 } 1 1 } {global 2}  }
	{ IDX_pd_bypass int 8 regular {pointer 2} {global 2}  }
	{ DynamicPlacement_II int 8 regular {pointer 0} {global 0}  }
	{ bypassSrcTile int 5 regular {pointer 0} {global 0}  }
	{ bypassTgtTile int 4 regular {pointer 0} {global 0}  }
	{ shape_idx int 5 regular {pointer 0} {global 0}  }
	{ idx_pd int 4 regular {pointer 2} {global 2}  }
	{ placement_dynamic_bypass_occupy int 1 regular {array 25600 { 2 1 } 1 1 } {global 2}  }
	{ placement_dynamic_bypass int 8 regular {array 12800 { 2 3 } 1 1 } {global 2}  }
	{ bypassOpt_wrAddr int 8 regular {pointer 2} {global 2}  }
	{ placement_dynamic_dict_Opt2Tile_keys int 8 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ placement_dynamic_dict_Opt2Tile_values int 5 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ placement_done_values int 1 regular {array 100 { 0 3 } 0 1 } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "bypassOptIdx", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "bypassOpt", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bypassSrcOpt", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_dict_Opt2PC_keys", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_dict_Opt2PC_values", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "IDX_pd_bypass", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "DynamicPlacement_II", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bypassSrcTile", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bypassTgtTile", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "shape_idx", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "idx_pd", "interface" : "wire", "bitwidth" : 4, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_bypass_occupy", "interface" : "memory", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_bypass", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "bypassOpt_wrAddr", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_dict_Opt2Tile_keys", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_dict_Opt2Tile_values", "interface" : "memory", "bitwidth" : 5, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "placement_done_values", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 61
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ bypassOptIdx_i sc_in sc_lv 8 signal 0 } 
	{ bypassOptIdx_o sc_out sc_lv 8 signal 0 } 
	{ bypassOptIdx_o_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ bypassOpt sc_out sc_lv 8 signal 1 } 
	{ bypassOpt_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ bypassSrcOpt sc_in sc_lv 8 signal 2 } 
	{ placement_dynamic_dict_Opt2PC_keys_address0 sc_out sc_lv 7 signal 3 } 
	{ placement_dynamic_dict_Opt2PC_keys_ce0 sc_out sc_logic 1 signal 3 } 
	{ placement_dynamic_dict_Opt2PC_keys_we0 sc_out sc_logic 1 signal 3 } 
	{ placement_dynamic_dict_Opt2PC_keys_d0 sc_out sc_lv 8 signal 3 } 
	{ placement_dynamic_dict_Opt2PC_keys_q0 sc_in sc_lv 8 signal 3 } 
	{ placement_dynamic_dict_Opt2PC_values_address0 sc_out sc_lv 7 signal 4 } 
	{ placement_dynamic_dict_Opt2PC_values_ce0 sc_out sc_logic 1 signal 4 } 
	{ placement_dynamic_dict_Opt2PC_values_we0 sc_out sc_logic 1 signal 4 } 
	{ placement_dynamic_dict_Opt2PC_values_d0 sc_out sc_lv 8 signal 4 } 
	{ placement_dynamic_dict_Opt2PC_values_q0 sc_in sc_lv 8 signal 4 } 
	{ IDX_pd_bypass_i sc_in sc_lv 8 signal 5 } 
	{ IDX_pd_bypass_o sc_out sc_lv 8 signal 5 } 
	{ IDX_pd_bypass_o_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ DynamicPlacement_II sc_in sc_lv 8 signal 6 } 
	{ bypassSrcTile sc_in sc_lv 5 signal 7 } 
	{ bypassTgtTile sc_in sc_lv 4 signal 8 } 
	{ shape_idx sc_in sc_lv 5 signal 9 } 
	{ idx_pd_i sc_in sc_lv 4 signal 10 } 
	{ idx_pd_o sc_out sc_lv 4 signal 10 } 
	{ idx_pd_o_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ placement_dynamic_bypass_occupy_address0 sc_out sc_lv 15 signal 11 } 
	{ placement_dynamic_bypass_occupy_ce0 sc_out sc_logic 1 signal 11 } 
	{ placement_dynamic_bypass_occupy_we0 sc_out sc_logic 1 signal 11 } 
	{ placement_dynamic_bypass_occupy_d0 sc_out sc_lv 1 signal 11 } 
	{ placement_dynamic_bypass_occupy_q0 sc_in sc_lv 1 signal 11 } 
	{ placement_dynamic_bypass_occupy_address1 sc_out sc_lv 15 signal 11 } 
	{ placement_dynamic_bypass_occupy_ce1 sc_out sc_logic 1 signal 11 } 
	{ placement_dynamic_bypass_occupy_q1 sc_in sc_lv 1 signal 11 } 
	{ placement_dynamic_bypass_address0 sc_out sc_lv 14 signal 12 } 
	{ placement_dynamic_bypass_ce0 sc_out sc_logic 1 signal 12 } 
	{ placement_dynamic_bypass_we0 sc_out sc_logic 1 signal 12 } 
	{ placement_dynamic_bypass_d0 sc_out sc_lv 8 signal 12 } 
	{ placement_dynamic_bypass_q0 sc_in sc_lv 8 signal 12 } 
	{ bypassOpt_wrAddr_i sc_in sc_lv 8 signal 13 } 
	{ bypassOpt_wrAddr_o sc_out sc_lv 8 signal 13 } 
	{ bypassOpt_wrAddr_o_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ placement_dynamic_dict_Opt2Tile_keys_address0 sc_out sc_lv 7 signal 14 } 
	{ placement_dynamic_dict_Opt2Tile_keys_ce0 sc_out sc_logic 1 signal 14 } 
	{ placement_dynamic_dict_Opt2Tile_keys_we0 sc_out sc_logic 1 signal 14 } 
	{ placement_dynamic_dict_Opt2Tile_keys_d0 sc_out sc_lv 8 signal 14 } 
	{ placement_dynamic_dict_Opt2Tile_values_address0 sc_out sc_lv 7 signal 15 } 
	{ placement_dynamic_dict_Opt2Tile_values_ce0 sc_out sc_logic 1 signal 15 } 
	{ placement_dynamic_dict_Opt2Tile_values_we0 sc_out sc_logic 1 signal 15 } 
	{ placement_dynamic_dict_Opt2Tile_values_d0 sc_out sc_lv 5 signal 15 } 
	{ placement_done_values_address0 sc_out sc_lv 7 signal 16 } 
	{ placement_done_values_ce0 sc_out sc_logic 1 signal 16 } 
	{ placement_done_values_we0 sc_out sc_logic 1 signal 16 } 
	{ placement_done_values_d0 sc_out sc_lv 1 signal 16 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "bypassOptIdx_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassOptIdx", "role": "i" }} , 
 	{ "name": "bypassOptIdx_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassOptIdx", "role": "o" }} , 
 	{ "name": "bypassOptIdx_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "bypassOptIdx", "role": "o_ap_vld" }} , 
 	{ "name": "bypassOpt", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassOpt", "role": "default" }} , 
 	{ "name": "bypassOpt_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "bypassOpt", "role": "ap_vld" }} , 
 	{ "name": "bypassSrcOpt", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassSrcOpt", "role": "default" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "address0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "we0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "d0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "q0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_values", "role": "address0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_values", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_values_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_values", "role": "we0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_values_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_values", "role": "d0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_values", "role": "q0" }} , 
 	{ "name": "IDX_pd_bypass_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "IDX_pd_bypass", "role": "i" }} , 
 	{ "name": "IDX_pd_bypass_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "IDX_pd_bypass", "role": "o" }} , 
 	{ "name": "IDX_pd_bypass_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "IDX_pd_bypass", "role": "o_ap_vld" }} , 
 	{ "name": "DynamicPlacement_II", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "DynamicPlacement_II", "role": "default" }} , 
 	{ "name": "bypassSrcTile", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bypassSrcTile", "role": "default" }} , 
 	{ "name": "bypassTgtTile", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "bypassTgtTile", "role": "default" }} , 
 	{ "name": "shape_idx", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "shape_idx", "role": "default" }} , 
 	{ "name": "idx_pd_i", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "idx_pd", "role": "i" }} , 
 	{ "name": "idx_pd_o", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "idx_pd", "role": "o" }} , 
 	{ "name": "idx_pd_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "idx_pd", "role": "o_ap_vld" }} , 
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
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "11", "14"],
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
					{"ID" : "5", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_188_1_fu_365", "Port" : "placement_dynamic_dict_Opt2PC_keys", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "placement_dynamic_dict_Opt2PC_values", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "IDX_pd_bypass", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4_fu_402", "Port" : "IDX_pd_bypass", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "DynamicPlacement_II", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassSrcTile", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassTgtTile", "Type" : "None", "Direction" : "I"},
			{"Name" : "shape_idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "Tile2XY_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "Tile2XY_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "CGRA_NumTiles_shapes_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "bpsStride_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373", "Port" : "bpsStride_0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "bpsStride_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373", "Port" : "bpsStride_1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "xy2Tile", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373", "Port" : "xy2Tile", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "allocated_tiles_shapes_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373", "Port" : "allocated_tiles_shapes_values", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "idx_pd", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "placement_dynamic_bypass_occupy", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4_fu_402", "Port" : "placement_dynamic_bypass_occupy", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "placement_dynamic_bypass", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_255_5_fu_420", "Port" : "placement_dynamic_bypass", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "bypassOpt_wrAddr", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_values", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "placement_done_values", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Tile2XY_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Tile2XY_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.CGRA_NumTiles_shapes_values_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.allocated_tiles_shapes_values_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_188_1_fu_365", "Parent" : "0",
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
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373", "Parent" : "0", "Child" : ["7", "8", "9", "10"],
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
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373.bpsStride_0_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373.bpsStride_1_U", "Parent" : "6"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373.xy2Tile_U", "Parent" : "6"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373.allocated_tiles_shapes_values_U", "Parent" : "6"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4_fu_402", "Parent" : "0", "Child" : ["12", "13"],
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
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4_fu_402.srem_8ns_8ns_8_12_1_U167", "Parent" : "11"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4_fu_402.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_255_5_fu_420", "Parent" : "0", "Child" : ["15"],
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
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_255_5_fu_420.flow_control_loop_pipe_sequential_init_U", "Parent" : "14"}]}


set ArgLastReadFirstWriteLatency {
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
		placement_dynamic_bypass {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	bypassOptIdx { ap_ovld {  { bypassOptIdx_i in_data 0 8 }  { bypassOptIdx_o out_data 1 8 }  { bypassOptIdx_o_ap_vld out_vld 1 1 } } }
	bypassOpt { ap_vld {  { bypassOpt out_data 1 8 }  { bypassOpt_ap_vld out_vld 1 1 } } }
	bypassSrcOpt { ap_none {  { bypassSrcOpt in_data 0 8 } } }
	placement_dynamic_dict_Opt2PC_keys { ap_memory {  { placement_dynamic_dict_Opt2PC_keys_address0 mem_address 1 7 }  { placement_dynamic_dict_Opt2PC_keys_ce0 mem_ce 1 1 }  { placement_dynamic_dict_Opt2PC_keys_we0 mem_we 1 1 }  { placement_dynamic_dict_Opt2PC_keys_d0 mem_din 1 8 }  { placement_dynamic_dict_Opt2PC_keys_q0 mem_dout 0 8 } } }
	placement_dynamic_dict_Opt2PC_values { ap_memory {  { placement_dynamic_dict_Opt2PC_values_address0 mem_address 1 7 }  { placement_dynamic_dict_Opt2PC_values_ce0 mem_ce 1 1 }  { placement_dynamic_dict_Opt2PC_values_we0 mem_we 1 1 }  { placement_dynamic_dict_Opt2PC_values_d0 mem_din 1 8 }  { placement_dynamic_dict_Opt2PC_values_q0 in_data 0 8 } } }
	IDX_pd_bypass { ap_ovld {  { IDX_pd_bypass_i in_data 0 8 }  { IDX_pd_bypass_o out_data 1 8 }  { IDX_pd_bypass_o_ap_vld out_vld 1 1 } } }
	DynamicPlacement_II { ap_none {  { DynamicPlacement_II in_data 0 8 } } }
	bypassSrcTile { ap_none {  { bypassSrcTile in_data 0 5 } } }
	bypassTgtTile { ap_none {  { bypassTgtTile in_data 0 4 } } }
	shape_idx { ap_none {  { shape_idx in_data 0 5 } } }
	idx_pd { ap_ovld {  { idx_pd_i in_data 0 4 }  { idx_pd_o out_data 1 4 }  { idx_pd_o_ap_vld out_vld 1 1 } } }
	placement_dynamic_bypass_occupy { ap_memory {  { placement_dynamic_bypass_occupy_address0 mem_address 1 15 }  { placement_dynamic_bypass_occupy_ce0 mem_ce 1 1 }  { placement_dynamic_bypass_occupy_we0 mem_we 1 1 }  { placement_dynamic_bypass_occupy_d0 mem_din 1 1 }  { placement_dynamic_bypass_occupy_q0 mem_dout 0 1 }  { placement_dynamic_bypass_occupy_address1 MemPortADDR2 1 15 }  { placement_dynamic_bypass_occupy_ce1 MemPortCE2 1 1 }  { placement_dynamic_bypass_occupy_q1 MemPortDOUT2 0 1 } } }
	placement_dynamic_bypass { ap_memory {  { placement_dynamic_bypass_address0 mem_address 1 14 }  { placement_dynamic_bypass_ce0 mem_ce 1 1 }  { placement_dynamic_bypass_we0 mem_we 1 1 }  { placement_dynamic_bypass_d0 mem_din 1 8 }  { placement_dynamic_bypass_q0 mem_dout 0 8 } } }
	bypassOpt_wrAddr { ap_ovld {  { bypassOpt_wrAddr_i in_data 0 8 }  { bypassOpt_wrAddr_o out_data 1 8 }  { bypassOpt_wrAddr_o_ap_vld out_vld 1 1 } } }
	placement_dynamic_dict_Opt2Tile_keys { ap_memory {  { placement_dynamic_dict_Opt2Tile_keys_address0 mem_address 1 7 }  { placement_dynamic_dict_Opt2Tile_keys_ce0 mem_ce 1 1 }  { placement_dynamic_dict_Opt2Tile_keys_we0 mem_we 1 1 }  { placement_dynamic_dict_Opt2Tile_keys_d0 mem_din 1 8 } } }
	placement_dynamic_dict_Opt2Tile_values { ap_memory {  { placement_dynamic_dict_Opt2Tile_values_address0 mem_address 1 7 }  { placement_dynamic_dict_Opt2Tile_values_ce0 mem_ce 1 1 }  { placement_dynamic_dict_Opt2Tile_values_we0 mem_we 1 1 }  { placement_dynamic_dict_Opt2Tile_values_d0 mem_din 1 5 } } }
	placement_done_values { ap_memory {  { placement_done_values_address0 mem_address 1 7 }  { placement_done_values_ce0 mem_ce 1 1 }  { placement_done_values_we0 mem_we 1 1 }  { placement_done_values_d0 mem_din 1 1 } } }
}
