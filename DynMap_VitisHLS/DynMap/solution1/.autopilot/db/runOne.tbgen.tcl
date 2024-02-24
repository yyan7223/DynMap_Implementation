set moduleName runOne
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {runOne}
set C_modelType { int 8 }
set C_modelArgList {
	{ testCaseIdx int 8 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "testCaseIdx", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 8} ]}
# RTL Port declarations: 
set portNum 10
set portList { 
	{ ap_local_block sc_out sc_logic 1 signal -1 } 
	{ ap_local_deadlock sc_out sc_logic 1 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ testCaseIdx sc_in sc_lv 8 signal 0 } 
	{ ap_return sc_out sc_lv 8 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_local_block", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_local_block", "role": "default" }} , 
 	{ "name": "ap_local_deadlock", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_local_deadlock", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "testCaseIdx", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "testCaseIdx", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "44", "133", "134", "135", "136", "137"],
		"CDFG" : "runOne",
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
			{"Name" : "testCaseIdx", "Type" : "None", "Direction" : "I"},
			{"Name" : "kernel_idx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "kernel_idx", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "kernel_idx", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "shape_idx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "shape_idx", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "DFG_NodesCount_kernels_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "DFG_NodesCount_kernels_values", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "DFG_NodesCount_kernels_values", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "CGRA_NumTiles_shapes_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "CGRA_NumTiles_shapes_values", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "mask_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "threshold", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "threshold", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "DynamicPlacement_II", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "DynamicPlacement_II", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "IDX_pd", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "IDX_pd", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "IDX_pd", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "idx_pd_r", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "idx_pd_r", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "idx_pd_r", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "IDX_pd_modulo", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "IDX_pd_modulo", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "IDX_pd_modulo", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "IDX_pd_bypass", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "IDX_pd_bypass", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "IDX_pd_bypass", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "bypassOptIdx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "bypassOptIdx", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "bypassOptIdx", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "bypassOpt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "bypassOpt", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "bypassOpt", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "bypassSrcOpt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "bypassSrcOpt", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "bypassSrcOpt", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "bypassTgtOpt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "bypassTgtOpt", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "bypassTgtOpt", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "predTile1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "predTile1", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "predTile1", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "bypassSrcTile", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "bypassSrcTile", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "bypassSrcTile", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "bypassTgtTile", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "bypassTgtTile", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "bypassTgtTile", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "dependency_forward", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "dependency_forward", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "dependency_forward", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "dependency_backward", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "dependency_backward", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "dependency_backward", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "bypassOpt_wrAddr", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "bypassOpt_wrAddr", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "bypassOpt_wrAddr", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "predecessors", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "predecessors", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "predecessors", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "placement_dynamic_bypass", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "placement_dynamic_bypass", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "placement_dynamic_bypass", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "placement_dynamic_occupy", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "placement_dynamic_occupy", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "placement_dynamic_occupy", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "placement_dynamic_bypass_occupy", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "placement_dynamic_bypass_occupy", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "placement_dynamic_bypass_occupy", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "placement_static_kernels_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "placement_static_kernels_values", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "placement_static_kernels_values", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "placement_dynamic_dict_Opt2PC_keys", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "placement_dynamic_dict_Opt2PC_keys", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "placement_dynamic_dict_Opt2PC_keys", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "placement_dynamic_dict_Opt2PC_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "placement_dynamic_dict_Opt2PC_values", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "placement_dynamic_dict_Opt2PC_values", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "placement_dynamic_dict_Opt2Tile_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "placement_dynamic_dict_Opt2Tile_values", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "placement_dynamic_dict_Opt2Tile_values", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "placement_done_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "placement_done_values", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "placement_done_values", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "dependency_predecessors_kernels_values1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "dependency_predecessors_kernels_values1", "Inst_start_state" : "55", "Inst_end_state" : "56"}]},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "dependency_predecessor_values", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "dependency_predecessor_values", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "dependency_successors_kernels_values1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "dependency_successors_kernels_values1", "Inst_start_state" : "55", "Inst_end_state" : "56"}]},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "dependency_successor_values", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "dependency_successor_values", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "curOptPotentialPlacement", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_Reset_fu_334", "Port" : "curOptPotentialPlacement", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "curOptPotentialPlacement", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "curOpt_idx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "curOpt_idx", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "predecessors_wrAddr", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "predecessors_wrAddr", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "predOpt_idx_List", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "predOpt_idx_List", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "predsNum", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "predsNum", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "placement_static_Opt2Tile_kernels_values1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "placement_static_Opt2Tile_kernels_values1", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "placement_static_Tile2Level_keys", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "placement_static_Tile2Level_keys", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "placement_static_Tile2Level_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "placement_static_Tile2Level_values", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "allocated_tiles_Maxlevels_dynamic_shapes_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "allocated_tiles_Maxlevels_dynamic_shapes_values", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "curOptPotentialPlacement_wrAddr", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "curOptPotentialPlacement_wrAddr", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "allocated_tiles_levelsValidLen_shapes_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "allocated_tiles_levelsValidLen_shapes_values", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "allocated_tiles_levels_dynamic_shapes_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "allocated_tiles_levels_dynamic_shapes_values", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "potentialPlacement_wrAddr_List_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "potentialPlacement_wrAddr_List_0", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "potentialPlacement_wrAddr_List_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "potentialPlacement_wrAddr_List_1", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "Tile2XY_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "Tile2XY_0", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "Tile2XY_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "Tile2XY_1", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "CurOptPotentialPlacement_List_BypassLess_Gen_XChanges", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "CurOptPotentialPlacement_List_BypassLess_Gen_XChanges", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "xy2Tile", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "xy2Tile", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "allocated_tiles_shapes_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "allocated_tiles_shapes_values", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "CurOptPotentialPlacement_List_BypassLess_Gen_YChanges", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "CurOptPotentialPlacement_List_BypassLess_Gen_YChanges", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "bypassSrcOpt_keyIdx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "bypassSrcOpt_keyIdx", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "bypassTgtOpt_keyIdx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "bypassTgtOpt_keyIdx", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "bpsStride_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "bpsStride_0", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "bpsStride_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_dynamic_placement_routing_fu_400", "Port" : "bpsStride_1", "Inst_start_state" : "57", "Inst_end_state" : "58"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_781_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "59", "FirstState" : "ap_ST_fsm_state55", "LastState" : ["ap_ST_fsm_state59"], "QuitState" : ["ap_ST_fsm_state55"], "PreState" : ["ap_ST_fsm_state54"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.DFG_NodesCount_kernels_values_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.CGRA_NumTiles_shapes_values_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mask_table_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.predecessors_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.placement_dynamic_bypass_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.placement_dynamic_occupy_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.placement_dynamic_bypass_occupy_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.placement_static_kernels_values_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.placement_dynamic_dict_Opt2PC_keys_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.placement_dynamic_dict_Opt2PC_values_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.placement_dynamic_dict_Opt2Tile_keys_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.placement_dynamic_dict_Opt2Tile_values_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.placement_done_values_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dependency_predecessor_values_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dependency_successor_values_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.curOptPotentialPlacement_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334", "Parent" : "0", "Child" : ["18", "21", "23", "25", "28", "30", "32", "34", "37", "40", "43"],
		"CDFG" : "Reset",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6455", "EstimateLatencyMax" : "6480",
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
					{"ID" : "18", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_685_5_VITIS_LOOP_686_6_VITIS_LOOP_687_7_fu_189", "Port" : "placement_dynamic_bypass", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "placement_dynamic_occupy", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_692_8_VITIS_LOOP_693_9_fu_195", "Port" : "placement_dynamic_occupy", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "placement_dynamic_bypass_occupy", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_697_10_VITIS_LOOP_698_11_VITIS_LOOP_699_12_fu_201", "Port" : "placement_dynamic_bypass_occupy", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "placement_static_kernels_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "40", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_710_15_fu_255", "Port" : "placement_static_kernels_values", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "25", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_704_13_fu_207", "Port" : "placement_static_kernels_values", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "placement_dynamic_dict_Opt2PC_keys", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "25", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_704_13_fu_207", "Port" : "placement_dynamic_dict_Opt2PC_keys", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "placement_dynamic_dict_Opt2PC_values", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "28", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_707_14_fu_217", "Port" : "placement_dynamic_dict_Opt2PC_values", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "40", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_710_15_fu_255", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "placement_dynamic_dict_Opt2Tile_values", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "30", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_713_16_fu_223", "Port" : "placement_dynamic_dict_Opt2Tile_values", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "placement_done_values", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "32", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_716_17_fu_229", "Port" : "placement_done_values", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "dependency_predecessors_kernels_values1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "34", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_722_19_VITIS_LOOP_724_20_fu_235", "Port" : "dependency_predecessors_kernels_values1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "34", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_722_19_VITIS_LOOP_724_20_fu_235", "Port" : "dependency_predecessor_values", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "dependency_successors_kernels_values1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_734_21_VITIS_LOOP_736_22_fu_245", "Port" : "dependency_successors_kernels_values1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_Reset_Pipeline_VITIS_LOOP_734_21_VITIS_LOOP_736_22_fu_245", "Port" : "dependency_successor_values", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "curOptPotentialPlacement", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_674_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state3_blk"}},
			{"Name" : "VITIS_LOOP_677_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state4_blk"}}]},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_685_5_VITIS_LOOP_686_6_VITIS_LOOP_687_7_fu_189", "Parent" : "17", "Child" : ["19", "20"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_685_5_VITIS_LOOP_686_6_VITIS_LOOP_687_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6404", "EstimateLatencyMax" : "6404",
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
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_685_5_VITIS_LOOP_686_6_VITIS_LOOP_687_7_fu_189.mac_muladd_3ns_7ns_7ns_9_4_1_U1", "Parent" : "18"},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_685_5_VITIS_LOOP_686_6_VITIS_LOOP_687_7_fu_189.flow_control_loop_pipe_sequential_init_U", "Parent" : "18"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_692_8_VITIS_LOOP_693_9_fu_195", "Parent" : "17", "Child" : ["22"],
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
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_692_8_VITIS_LOOP_693_9_fu_195.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_697_10_VITIS_LOOP_698_11_VITIS_LOOP_699_12_fu_201", "Parent" : "17", "Child" : ["24"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_697_10_VITIS_LOOP_698_11_VITIS_LOOP_699_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5122", "EstimateLatencyMax" : "5122",
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
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_697_10_VITIS_LOOP_698_11_VITIS_LOOP_699_12_fu_201.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_704_13_fu_207", "Parent" : "17", "Child" : ["26", "27"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_704_13",
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
			{"Name" : "mul_ln725", "Type" : "None", "Direction" : "I"},
			{"Name" : "placement_static_kernels_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "placement_dynamic_dict_Opt2PC_keys", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_704_13", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_704_13_fu_207.placement_static_kernels_values_U", "Parent" : "25"},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_704_13_fu_207.flow_control_loop_pipe_sequential_init_U", "Parent" : "25"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_707_14_fu_217", "Parent" : "17", "Child" : ["29"],
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
	{"ID" : "29", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_707_14_fu_217.flow_control_loop_pipe_sequential_init_U", "Parent" : "28"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_713_16_fu_223", "Parent" : "17", "Child" : ["31"],
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
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_713_16_fu_223.flow_control_loop_pipe_sequential_init_U", "Parent" : "30"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_716_17_fu_229", "Parent" : "17", "Child" : ["33"],
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
	{"ID" : "33", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_716_17_fu_229.flow_control_loop_pipe_sequential_init_U", "Parent" : "32"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_722_19_VITIS_LOOP_724_20_fu_235", "Parent" : "17", "Child" : ["35", "36"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_722_19_VITIS_LOOP_724_20",
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
			{"Name" : "add_ln722", "Type" : "None", "Direction" : "I"},
			{"Name" : "mul_ln725", "Type" : "None", "Direction" : "I"},
			{"Name" : "dependency_predecessors_kernels_values1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_722_19_VITIS_LOOP_724_20", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_722_19_VITIS_LOOP_724_20_fu_235.dependency_predecessors_kernels_values1_U", "Parent" : "34"},
	{"ID" : "36", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_722_19_VITIS_LOOP_724_20_fu_235.flow_control_loop_pipe_sequential_init_U", "Parent" : "34"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_734_21_VITIS_LOOP_736_22_fu_245", "Parent" : "17", "Child" : ["38", "39"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_734_21_VITIS_LOOP_736_22",
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
			{"Name" : "add_ln734", "Type" : "None", "Direction" : "I"},
			{"Name" : "mul_ln725", "Type" : "None", "Direction" : "I"},
			{"Name" : "dependency_successors_kernels_values1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_734_21_VITIS_LOOP_736_22", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "38", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_734_21_VITIS_LOOP_736_22_fu_245.dependency_successors_kernels_values1_U", "Parent" : "37"},
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_734_21_VITIS_LOOP_736_22_fu_245.flow_control_loop_pipe_sequential_init_U", "Parent" : "37"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_710_15_fu_255", "Parent" : "17", "Child" : ["41", "42"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_710_15",
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
			{"Name" : "mul_ln725", "Type" : "None", "Direction" : "I"},
			{"Name" : "placement_static_kernels_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_710_15", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_710_15_fu_255.placement_static_kernels_values_U", "Parent" : "40"},
	{"ID" : "42", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.grp_Reset_Pipeline_VITIS_LOOP_710_15_fu_255.flow_control_loop_pipe_sequential_init_U", "Parent" : "40"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reset_fu_334.mul_3ns_8ns_10_1_1_U24", "Parent" : "17"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400", "Parent" : "0", "Child" : ["45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "58", "59", "61", "86", "88", "90", "92", "130", "132"],
		"CDFG" : "dynamic_placement_routing",
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
			{"Name" : "curOpt_idx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "curOpt_idx", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "kernel_idx", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "kernel_idx", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "DFG_NodesCount_kernels_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "IDX_pd", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "IDX_pd", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "59", "SubInstance" : "grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_624_6_fu_430", "Port" : "dependency_predecessor_values", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "55", "SubInstance" : "grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_601_2_fu_403", "Port" : "dependency_predecessor_values", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "58", "SubInstance" : "grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_618_5_fu_422", "Port" : "dependency_predecessor_values", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "dependency_predecessor_values", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "predecessors_wrAddr", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "predecessors_wrAddr", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "placement_static_kernels_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "56", "SubInstance" : "grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_611_4_fu_411", "Port" : "placement_static_kernels_values", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "placement_static_kernels_values", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "placement_done_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "placement_done_values", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "predOpt_idx_List", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439", "Port" : "predOpt_idx_List", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "predecessors", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "predecessors", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "placement_dynamic_dict_Opt2PC_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "placement_dynamic_dict_Opt2PC_values", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "predsNum", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439", "Port" : "predsNum", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "predsNum", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "threshold", "Type" : "None", "Direction" : "I"},
			{"Name" : "placement_static_Opt2Tile_kernels_values1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "placement_static_Tile2Level_keys", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "86", "SubInstance" : "grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_377_1_fu_473", "Port" : "placement_static_Tile2Level_keys", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "placement_static_Tile2Level_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "shape_idx", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439", "Port" : "shape_idx", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "shape_idx", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "allocated_tiles_Maxlevels_dynamic_shapes_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "curOptPotentialPlacement_wrAddr", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439", "Port" : "curOptPotentialPlacement_wrAddr", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "90", "SubInstance" : "grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_398_3_fu_493", "Port" : "curOptPotentialPlacement_wrAddr", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "curOptPotentialPlacement_wrAddr", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "allocated_tiles_levelsValidLen_shapes_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "allocated_tiles_levels_dynamic_shapes_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "130", "SubInstance" : "grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_415_5_fu_597", "Port" : "allocated_tiles_levels_dynamic_shapes_values", "Inst_start_state" : "27", "Inst_end_state" : "28"},
					{"ID" : "88", "SubInstance" : "grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_388_2_fu_482", "Port" : "allocated_tiles_levels_dynamic_shapes_values", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "90", "SubInstance" : "grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_398_3_fu_493", "Port" : "allocated_tiles_levels_dynamic_shapes_values", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "curOptPotentialPlacement", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "130", "SubInstance" : "grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_415_5_fu_597", "Port" : "curOptPotentialPlacement", "Inst_start_state" : "27", "Inst_end_state" : "28"},
					{"ID" : "61", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439", "Port" : "curOptPotentialPlacement", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "90", "SubInstance" : "grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_398_3_fu_493", "Port" : "curOptPotentialPlacement", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "curOptPotentialPlacement", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "CGRA_NumTiles_shapes_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439", "Port" : "CGRA_NumTiles_shapes_values", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "CGRA_NumTiles_shapes_values", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "potentialPlacement_wrAddr_List_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439", "Port" : "potentialPlacement_wrAddr_List_0", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "potentialPlacement_wrAddr_List_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439", "Port" : "potentialPlacement_wrAddr_List_1", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "placement_dynamic_dict_Opt2Tile_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439", "Port" : "placement_dynamic_dict_Opt2Tile_values", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "placement_dynamic_dict_Opt2Tile_values", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "Tile2XY_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439", "Port" : "Tile2XY_0", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "Tile2XY_0", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "Tile2XY_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439", "Port" : "Tile2XY_1", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "Tile2XY_1", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "CurOptPotentialPlacement_List_BypassLess_Gen_XChanges", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439", "Port" : "CurOptPotentialPlacement_List_BypassLess_Gen_XChanges", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "xy2Tile", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439", "Port" : "xy2Tile", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "xy2Tile", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "allocated_tiles_shapes_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439", "Port" : "allocated_tiles_shapes_values", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "allocated_tiles_shapes_values", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "CurOptPotentialPlacement_List_BypassLess_Gen_YChanges", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439", "Port" : "CurOptPotentialPlacement_List_BypassLess_Gen_YChanges", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "DynamicPlacement_II", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "DynamicPlacement_II", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "IDX_pd_modulo", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "IDX_pd_modulo", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "placement_dynamic_occupy", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "placement_dynamic_occupy", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "predTile1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "predTile1", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "bypassSrcOpt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "bypassSrcOpt", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "bypassTgtOpt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "bypassTgtOpt", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "bypassSrcOpt_keyIdx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "bypassSrcOpt_keyIdx", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "bypassSrcTile", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "bypassSrcTile", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "bypassTgtOpt_keyIdx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "bypassTgtOpt_keyIdx", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "bypassTgtTile", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "bypassTgtTile", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "dependency_forward", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "dependency_forward", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "dependency_backward", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "dependency_backward", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "bypassOptIdx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "bypassOptIdx", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "bypassOpt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "bypassOpt", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "placement_dynamic_dict_Opt2PC_keys", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "placement_dynamic_dict_Opt2PC_keys", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "IDX_pd_bypass", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "IDX_pd_bypass", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "bpsStride_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "bpsStride_0", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "bpsStride_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "bpsStride_1", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "idx_pd_r", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "idx_pd_r", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "placement_dynamic_bypass_occupy", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "placement_dynamic_bypass_occupy", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "placement_dynamic_bypass", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "placement_dynamic_bypass", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "bypassOpt_wrAddr", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "bypassOpt_wrAddr", "Inst_start_state" : "26", "Inst_end_state" : "29"}]},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Port" : "dependency_successor_values", "Inst_start_state" : "26", "Inst_end_state" : "29"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_608_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "30", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state14"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state5"], "PostState" : ["ap_ST_fsm_state16", "ap_ST_fsm_state18"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_408_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "30", "FirstState" : "ap_ST_fsm_state26", "LastState" : ["ap_ST_fsm_state28"], "QuitState" : ["ap_ST_fsm_state26"], "PreState" : ["ap_ST_fsm_state17", "ap_ST_fsm_state25"], "PostState" : ["ap_ST_fsm_state29"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_596_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "30", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state29"], "QuitState" : ["ap_ST_fsm_state3", "ap_ST_fsm_state29"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state30"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.predOpt_idx_List_U", "Parent" : "44"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.placement_static_Opt2Tile_kernels_values1_U", "Parent" : "44"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.placement_static_Tile2Level_values_U", "Parent" : "44"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.allocated_tiles_Maxlevels_dynamic_shapes_values_U", "Parent" : "44"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.allocated_tiles_levelsValidLen_shapes_values_U", "Parent" : "44"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.allocated_tiles_levels_dynamic_shapes_values_U", "Parent" : "44"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.Tile2XY_0_U", "Parent" : "44"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.Tile2XY_1_U", "Parent" : "44"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.xy2Tile_U", "Parent" : "44"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.allocated_tiles_shapes_values_U", "Parent" : "44"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_601_2_fu_403", "Parent" : "44",
		"CDFG" : "dynamic_placement_routing_Pipeline_VITIS_LOOP_601_2",
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
			{"Name" : "add_ln602", "Type" : "None", "Direction" : "I"},
			{"Name" : "i_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_601_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_611_4_fu_411", "Parent" : "44", "Child" : ["57"],
		"CDFG" : "dynamic_placement_routing_Pipeline_VITIS_LOOP_611_4",
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
			{"Name" : "DFG_NodesCount_kernels_values_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "mul_ln374", "Type" : "None", "Direction" : "I"},
			{"Name" : "pred_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "inc311623_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "placement_static_kernels_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_611_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "57", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_611_4_fu_411.placement_static_kernels_values_U", "Parent" : "56"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_618_5_fu_422", "Parent" : "44",
		"CDFG" : "dynamic_placement_routing_Pipeline_VITIS_LOOP_618_5",
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
			{"Name" : "add_ln619", "Type" : "None", "Direction" : "I"},
			{"Name" : "j_3_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_618_5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_624_6_fu_430", "Parent" : "44", "Child" : ["60"],
		"CDFG" : "dynamic_placement_routing_Pipeline_VITIS_LOOP_624_6",
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
			{"Name" : "j_3_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln619", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln608", "Type" : "None", "Direction" : "I"},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_624_6", "PipelineType" : "NotSupport"}]},
	{"ID" : "60", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_624_6_fu_430.flow_control_loop_pipe_sequential_init_U", "Parent" : "59"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439", "Parent" : "44", "Child" : ["62", "63", "64", "65", "66", "67", "69", "72", "74", "76", "79", "81", "83", "85"],
		"CDFG" : "CurOptPotentialPlacement_List_BypassLess_Gen",
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
			{"Name" : "predsNum", "Type" : "None", "Direction" : "I"},
			{"Name" : "shape_idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "CGRA_NumTiles_shapes_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "curOptPotentialPlacement_wrAddr", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "potentialPlacement_wrAddr_List_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "potentialPlacement_wrAddr_List_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "predOpt_idx_List", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "Tile2XY_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "Tile2XY_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "CurOptPotentialPlacement_List_BypassLess_Gen_XChanges", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "xy2Tile", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "allocated_tiles_shapes_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "76", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_562_14_fu_559", "Port" : "allocated_tiles_shapes_values", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "69", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_fu_530", "Port" : "allocated_tiles_shapes_values", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "CurOptPotentialPlacement_List_BypassLess_Gen_YChanges", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "curOptPotentialPlacement", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "83", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_480_7_fu_592", "Port" : "curOptPotentialPlacement", "Inst_start_state" : "37", "Inst_end_state" : "38"},
					{"ID" : "76", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_562_14_fu_559", "Port" : "curOptPotentialPlacement", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "74", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_508_10_fu_551", "Port" : "curOptPotentialPlacement", "Inst_start_state" : "17", "Inst_end_state" : "29"},
					{"ID" : "67", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_470_5_fu_522", "Port" : "curOptPotentialPlacement", "Inst_start_state" : "4", "Inst_end_state" : "34"},
					{"ID" : "79", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_577_16_fu_575", "Port" : "curOptPotentialPlacement", "Inst_start_state" : "26", "Inst_end_state" : "27"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_437_2_VITIS_LOOP_438_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "39", "FirstState" : "ap_ST_fsm_state8", "LastState" : ["ap_ST_fsm_state13"], "QuitState" : ["ap_ST_fsm_state9"], "PreState" : ["ap_ST_fsm_state7"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_429_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "39", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state9"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state14", "ap_ST_fsm_state17", "ap_ST_fsm_state34", "ap_ST_fsm_state35"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_477_6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "39", "FirstState" : "ap_ST_fsm_state36", "LastState" : ["ap_ST_fsm_state39"], "QuitState" : ["ap_ST_fsm_state36"], "PreState" : ["ap_ST_fsm_state35"], "PostState" : ["ap_ST_fsm_state25"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_515_11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "39", "FirstState" : "ap_ST_fsm_state31", "LastState" : ["ap_ST_fsm_state33"], "QuitState" : ["ap_ST_fsm_state31"], "PreState" : ["ap_ST_fsm_state30"], "PostState" : ["ap_ST_fsm_state25"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_536_13", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "39", "FirstState" : "ap_ST_fsm_state21", "LastState" : ["ap_ST_fsm_state24"], "QuitState" : ["ap_ST_fsm_state24"], "PreState" : ["ap_ST_fsm_state20"], "PostState" : ["ap_ST_fsm_state25"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_574_15", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "39", "FirstState" : "ap_ST_fsm_state25", "LastState" : ["ap_ST_fsm_state28"], "QuitState" : ["ap_ST_fsm_state25"], "PreState" : ["ap_ST_fsm_state24", "ap_ST_fsm_state31", "ap_ST_fsm_state36"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "62", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.CGRA_NumTiles_shapes_values_U", "Parent" : "61"},
	{"ID" : "63", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.CurOptPotentialPlacement_List_BypassLess_Gen_XChanges_U", "Parent" : "61"},
	{"ID" : "64", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.CurOptPotentialPlacement_List_BypassLess_Gen_YChanges_U", "Parent" : "61"},
	{"ID" : "65", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.potentialPlacement_AllPreds_U", "Parent" : "61"},
	{"ID" : "66", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.intersection_U", "Parent" : "61"},
	{"ID" : "67", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_470_5_fu_522", "Parent" : "61", "Child" : ["68"],
		"CDFG" : "CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_470_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "129",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "i", "Type" : "None", "Direction" : "I"},
			{"Name" : "potentialPlacement_AllPreds", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "curOptPotentialPlacement", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_470_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "68", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_470_5_fu_522.flow_control_loop_pipe_sequential_init_U", "Parent" : "67"},
	{"ID" : "69", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_fu_530", "Parent" : "61", "Child" : ["70", "71"],
		"CDFG" : "CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4",
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
			{"Name" : "CGRA_NumTiles_shapes_values_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "shape_idx_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "surrTile", "Type" : "None", "Direction" : "I"},
			{"Name" : "allocated_tiles_shapes_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_453_4", "PipelineType" : "NotSupport"}]},
	{"ID" : "70", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_fu_530.allocated_tiles_shapes_values_U", "Parent" : "69"},
	{"ID" : "71", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_fu_530.flow_control_loop_pipe_sequential_init_U", "Parent" : "69"},
	{"ID" : "72", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_497_8_VITIS_LOOP_498_9_fu_540", "Parent" : "61", "Child" : ["73"],
		"CDFG" : "CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_497_8_VITIS_LOOP_498_9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "16131",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "conv115123_in", "Type" : "None", "Direction" : "I"},
			{"Name" : "mul_ln497", "Type" : "None", "Direction" : "I"},
			{"Name" : "potentialPlacement_AllPreds", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "intersection", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "hasItst_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inc1313173_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_497_8_VITIS_LOOP_498_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "73", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_497_8_VITIS_LOOP_498_9_fu_540.flow_control_loop_pipe_sequential_init_U", "Parent" : "72"},
	{"ID" : "74", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_508_10_fu_551", "Parent" : "61", "Child" : ["75"],
		"CDFG" : "CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_508_10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "129",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "inc1313173_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "intersection", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "curOptPotentialPlacement", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_508_10", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "75", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_508_10_fu_551.flow_control_loop_pipe_sequential_init_U", "Parent" : "74"},
	{"ID" : "76", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_562_14_fu_559", "Parent" : "61", "Child" : ["77", "78"],
		"CDFG" : "CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_562_14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "14",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "inc23826", "Type" : "None", "Direction" : "I"},
			{"Name" : "CGRA_NumTiles_shapes_values_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "shape_idx_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "BypassTile", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln561_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "existLen_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "allocated_tiles_shapes_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "curOptPotentialPlacement", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_562_14", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "77", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_562_14_fu_559.allocated_tiles_shapes_values_U", "Parent" : "76"},
	{"ID" : "78", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_562_14_fu_559.flow_control_loop_pipe_sequential_init_U", "Parent" : "76"},
	{"ID" : "79", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_577_16_fu_575", "Parent" : "61", "Child" : ["80"],
		"CDFG" : "CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_577_16",
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
			{"Name" : "existLen_2_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln577", "Type" : "None", "Direction" : "I"},
			{"Name" : "curOptPotentialPlacement", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_577_16", "PipelineType" : "NotSupport"}]},
	{"ID" : "80", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_577_16_fu_575.flow_control_loop_pipe_sequential_init_U", "Parent" : "79"},
	{"ID" : "81", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_518_12_fu_584", "Parent" : "61", "Child" : ["82"],
		"CDFG" : "CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_518_12",
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
			{"Name" : "existLen_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "intersection", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "allocated_tiles_shapes_values_load_2", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_518_12", "PipelineType" : "NotSupport"}]},
	{"ID" : "82", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_518_12_fu_584.flow_control_loop_pipe_sequential_init_U", "Parent" : "81"},
	{"ID" : "83", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_480_7_fu_592", "Parent" : "61", "Child" : ["84"],
		"CDFG" : "CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_480_7",
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
			{"Name" : "existLen", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln480", "Type" : "None", "Direction" : "I"},
			{"Name" : "curOptPotentialPlacement", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_480_7", "PipelineType" : "NotSupport"}]},
	{"ID" : "84", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_480_7_fu_592.flow_control_loop_pipe_sequential_init_U", "Parent" : "83"},
	{"ID" : "85", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_CurOptPotentialPlacement_List_BypassLess_Gen_fu_439.mul_7ns_8ns_15_1_1_U100", "Parent" : "61"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_377_1_fu_473", "Parent" : "44", "Child" : ["87"],
		"CDFG" : "dynamic_placement_routing_Pipeline_VITIS_LOOP_377_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "36",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "curTileStatic", "Type" : "None", "Direction" : "I"},
			{"Name" : "tileID_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "placement_static_Tile2Level_keys", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_377_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "87", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_377_1_fu_473.placement_static_Tile2Level_keys_U", "Parent" : "86"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_388_2_fu_482", "Parent" : "44", "Child" : ["89"],
		"CDFG" : "dynamic_placement_routing_Pipeline_VITIS_LOOP_388_2",
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
			{"Name" : "allocated_tiles_levelsValidLen_shapes_values_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "shape_idx_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "initial_dynamic_level", "Type" : "None", "Direction" : "I"},
			{"Name" : "curTileStatic", "Type" : "None", "Direction" : "I"},
			{"Name" : "allocated_tiles_levels_dynamic_shapes_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_388_2", "PipelineType" : "NotSupport"}]},
	{"ID" : "89", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_388_2_fu_482.flow_control_loop_pipe_sequential_init_U", "Parent" : "88"},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_398_3_fu_493", "Parent" : "44", "Child" : ["91"],
		"CDFG" : "dynamic_placement_routing_Pipeline_VITIS_LOOP_398_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "12",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "allocated_tiles_levelsValidLen_shapes_values_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "shape_idx_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "initial_dynamic_level", "Type" : "None", "Direction" : "I"},
			{"Name" : "curTileStatic", "Type" : "None", "Direction" : "I"},
			{"Name" : "allocated_tiles_levels_dynamic_shapes_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "curOptPotentialPlacement_wrAddr", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "curOptPotentialPlacement", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_398_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "91", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_398_3_fu_493.flow_control_loop_pipe_sequential_init_U", "Parent" : "90"},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507", "Parent" : "44", "Child" : ["93", "94", "95", "96", "97", "98", "114", "124", "125", "127", "128", "129"],
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
					{"ID" : "125", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_354_4_fu_700", "Port" : "IDX_pd", "Inst_start_state" : "53", "Inst_end_state" : "54"}]},
			{"Name" : "DynamicPlacement_II", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "DynamicPlacement_II", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "IDX_pd_modulo", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "125", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_354_4_fu_700", "Port" : "IDX_pd_modulo", "Inst_start_state" : "53", "Inst_end_state" : "54"}]},
			{"Name" : "predecessors_wrAddr", "Type" : "None", "Direction" : "I"},
			{"Name" : "curOpt_idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "placement_dynamic_occupy", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "125", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_354_4_fu_700", "Port" : "placement_dynamic_occupy", "Inst_start_state" : "53", "Inst_end_state" : "54"}]},
			{"Name" : "placement_dynamic_dict_Opt2Tile_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "placement_dynamic_dict_Opt2Tile_values", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "placement_dynamic_dict_Opt2PC_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "placement_dynamic_dict_Opt2PC_values", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "placement_done_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "placement_done_values", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "curOptPotentialPlacement_wrAddr", "Type" : "None", "Direction" : "I"},
			{"Name" : "predsNum", "Type" : "None", "Direction" : "I"},
			{"Name" : "curOptPotentialPlacement", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "Tile2XY_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "Tile2XY_0", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "Tile2XY_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "Tile2XY_1", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "predecessors", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "114", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "96", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_32_1_fu_596", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "124", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_127_1_fu_691", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "95", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_14_1_fu_587", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "17", "Inst_end_state" : "18"},
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "97", "SubInstance" : "grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_39_2_fu_606", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "predTile1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "kernel_idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "placement_static_kernels_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "bypassSrcOpt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "114", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "bypassSrcOpt", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "bypassSrcOpt", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "bypassTgtOpt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "114", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "bypassTgtOpt", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "bypassSrcOpt_keyIdx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "114", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "bypassSrcOpt_keyIdx", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "bypassSrcTile", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "bypassSrcTile", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "bypassTgtOpt_keyIdx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "114", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "bypassTgtOpt_keyIdx", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "bypassTgtTile", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "bypassTgtTile", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "dependency_forward", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "114", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "dependency_forward", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "dependency_backward", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "114", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "dependency_backward", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "bypassOptIdx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "bypassOptIdx", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "bypassOpt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "114", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "bypassOpt", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "bypassOpt", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "placement_dynamic_dict_Opt2PC_keys", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "placement_dynamic_dict_Opt2PC_keys", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "IDX_pd_bypass", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "IDX_pd_bypass", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "shape_idx", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "shape_idx", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "CGRA_NumTiles_shapes_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "CGRA_NumTiles_shapes_values", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "bpsStride_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "bpsStride_0", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "bpsStride_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "bpsStride_1", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "xy2Tile", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "xy2Tile", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "allocated_tiles_shapes_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "allocated_tiles_shapes_values", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "idx_pd_r", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "idx_pd", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "placement_dynamic_bypass_occupy", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "placement_dynamic_bypass_occupy", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "placement_dynamic_bypass", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "placement_dynamic_bypass", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "bypassOpt_wrAddr", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_fu_615", "Port" : "bypassOpt_wrAddr", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "114", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "dependency_successor_values", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "114", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Port" : "dependency_predecessor_values", "Inst_start_state" : "34", "Inst_end_state" : "35"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_319_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state16", "LastState" : ["ap_ST_fsm_state22"], "QuitState" : ["ap_ST_fsm_state16"], "PreState" : ["ap_ST_fsm_state15"], "PostState" : ["ap_ST_fsm_state52", "ap_ST_fsm_state41", "ap_ST_fsm_state23"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_288_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state32", "LastState" : ["ap_ST_fsm_state40"], "QuitState" : ["ap_ST_fsm_state33", "ap_ST_fsm_state40"], "PreState" : ["ap_ST_fsm_state31"], "PostState" : ["ap_ST_fsm_state57", "ap_ST_fsm_state23"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_339_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state23", "LastState" : ["ap_ST_fsm_state40"], "QuitState" : ["ap_ST_fsm_state23", "ap_ST_fsm_state33"], "PreState" : ["ap_ST_fsm_state16"], "PostState" : ["ap_ST_fsm_state41", "ap_ST_fsm_state57"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_314_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state13", "LastState" : ["ap_ST_fsm_state55"], "QuitState" : ["ap_ST_fsm_state13", "ap_ST_fsm_state33", "ap_ST_fsm_state55"], "PreState" : ["ap_ST_fsm_state12"], "PostState" : ["ap_ST_fsm_state57"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "93", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.placement_static_kernels_values_U", "Parent" : "92"},
	{"ID" : "94", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.bypassPreds_U", "Parent" : "92"},
	{"ID" : "95", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_14_1_fu_587", "Parent" : "92",
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
	{"ID" : "96", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_32_1_fu_596", "Parent" : "92",
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
	{"ID" : "97", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_39_2_fu_606", "Parent" : "92",
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
	{"ID" : "98", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_BypassOptPlacement_Gen_Record_fu_615", "Parent" : "92", "Child" : ["99", "100", "101", "102", "103", "104", "109", "112"],
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
					{"ID" : "103", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_188_1_fu_365", "Port" : "placement_dynamic_dict_Opt2PC_keys", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "placement_dynamic_dict_Opt2PC_values", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "IDX_pd_bypass", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "109", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4_fu_402", "Port" : "IDX_pd_bypass", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "DynamicPlacement_II", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassSrcTile", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassTgtTile", "Type" : "None", "Direction" : "I"},
			{"Name" : "shape_idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "Tile2XY_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "Tile2XY_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "CGRA_NumTiles_shapes_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "bpsStride_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "104", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373", "Port" : "bpsStride_0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "bpsStride_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "104", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373", "Port" : "bpsStride_1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "xy2Tile", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "104", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373", "Port" : "xy2Tile", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "allocated_tiles_shapes_values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "104", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373", "Port" : "allocated_tiles_shapes_values", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "idx_pd", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "placement_dynamic_bypass_occupy", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "109", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4_fu_402", "Port" : "placement_dynamic_bypass_occupy", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "placement_dynamic_bypass", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "112", "SubInstance" : "grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_255_5_fu_420", "Port" : "placement_dynamic_bypass", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "bypassOpt_wrAddr", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_values", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "placement_done_values", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "99", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_BypassOptPlacement_Gen_Record_fu_615.Tile2XY_0_U", "Parent" : "98"},
	{"ID" : "100", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_BypassOptPlacement_Gen_Record_fu_615.Tile2XY_1_U", "Parent" : "98"},
	{"ID" : "101", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_BypassOptPlacement_Gen_Record_fu_615.CGRA_NumTiles_shapes_values_U", "Parent" : "98"},
	{"ID" : "102", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_BypassOptPlacement_Gen_Record_fu_615.allocated_tiles_shapes_values_U", "Parent" : "98"},
	{"ID" : "103", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_188_1_fu_365", "Parent" : "98",
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
	{"ID" : "104", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373", "Parent" : "98", "Child" : ["105", "106", "107", "108"],
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
	{"ID" : "105", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373.bpsStride_0_U", "Parent" : "104"},
	{"ID" : "106", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373.bpsStride_1_U", "Parent" : "104"},
	{"ID" : "107", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373.xy2Tile_U", "Parent" : "104"},
	{"ID" : "108", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_fu_373.allocated_tiles_shapes_values_U", "Parent" : "104"},
	{"ID" : "109", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4_fu_402", "Parent" : "98", "Child" : ["110", "111"],
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
	{"ID" : "110", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4_fu_402.srem_8ns_8ns_8_12_1_U167", "Parent" : "109"},
	{"ID" : "111", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4_fu_402.flow_control_loop_pipe_sequential_init_U", "Parent" : "109"},
	{"ID" : "112", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_255_5_fu_420", "Parent" : "98", "Child" : ["113"],
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
	{"ID" : "113", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_BypassOptPlacement_Gen_Record_fu_615.grp_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_255_5_fu_420.flow_control_loop_pipe_sequential_init_U", "Parent" : "112"},
	{"ID" : "114", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_Dependency_Update_BypassMode_SrcTgt_fu_667", "Parent" : "92", "Child" : ["115", "116", "117", "118", "119", "120", "121", "122", "123"],
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
					{"ID" : "115", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_53_1_fu_168", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "dependency_forward", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassSrcOpt_keyIdx", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassTgtOpt", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassSrcOpt", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassTgtOpt_keyIdx", "Type" : "None", "Direction" : "I"},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "118", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_75_4_fu_193", "Port" : "dependency_successor_values", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "116", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_61_2_fu_176", "Port" : "dependency_successor_values", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "121", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_102_7_fu_219", "Port" : "dependency_successor_values", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "123", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_116_9_fu_235", "Port" : "dependency_successor_values", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "117", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_69_3_fu_185", "Port" : "dependency_predecessor_values", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "122", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_108_8_fu_227", "Port" : "dependency_predecessor_values", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "119", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_83_5_fu_201", "Port" : "dependency_predecessor_values", "Inst_start_state" : "9", "Inst_end_state" : "10"},
					{"ID" : "120", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_94_6_fu_210", "Port" : "dependency_predecessor_values", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "dependency_backward", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "115", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_53_1_fu_168", "Parent" : "114",
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
	{"ID" : "116", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_61_2_fu_176", "Parent" : "114",
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
	{"ID" : "117", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_69_3_fu_185", "Parent" : "114",
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
	{"ID" : "118", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_75_4_fu_193", "Parent" : "114",
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
	{"ID" : "119", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_83_5_fu_201", "Parent" : "114",
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
	{"ID" : "120", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_94_6_fu_210", "Parent" : "114",
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
	{"ID" : "121", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_102_7_fu_219", "Parent" : "114",
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
	{"ID" : "122", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_108_8_fu_227", "Parent" : "114",
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
	{"ID" : "123", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_Dependency_Update_BypassMode_SrcTgt_fu_667.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_116_9_fu_235", "Parent" : "114",
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
	{"ID" : "124", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_127_1_fu_691", "Parent" : "92",
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
	{"ID" : "125", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_354_4_fu_700", "Parent" : "92", "Child" : ["126"],
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
	{"ID" : "126", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.grp_RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_354_4_fu_700.srem_8ns_8ns_7_12_1_U249", "Parent" : "125"},
	{"ID" : "127", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.srem_8ns_8ns_7_12_seq_1_U259", "Parent" : "92"},
	{"ID" : "128", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.srem_8ns_8ns_7_12_seq_1_U260", "Parent" : "92"},
	{"ID" : "129", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_RoutingAvailability_CheckPredecessor_and_Placement_fu_507.mac_muladd_3ns_7ns_8s_10_4_1_U261", "Parent" : "92"},
	{"ID" : "130", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_415_5_fu_597", "Parent" : "44", "Child" : ["131"],
		"CDFG" : "dynamic_placement_routing_Pipeline_VITIS_LOOP_415_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "12",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "curOptPotentialPlacement_wrAddr_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln415", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_19", "Type" : "None", "Direction" : "I"},
			{"Name" : "allocated_tiles_levels_dynamic_shapes_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "curOptPotentialPlacement", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_415_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "131", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.grp_dynamic_placement_routing_Pipeline_VITIS_LOOP_415_5_fu_597.flow_control_loop_pipe_sequential_init_U", "Parent" : "130"},
	{"ID" : "132", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dynamic_placement_routing_fu_400.mul_3ns_8ns_10_1_1_U300", "Parent" : "44"},
	{"ID" : "133", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ddiv_64ns_64ns_64_31_no_dsp_1_U339", "Parent" : "0"},
	{"ID" : "134", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitodp_32ns_64_5_no_dsp_1_U340", "Parent" : "0"},
	{"ID" : "135", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitodp_32ns_64_5_no_dsp_1_U341", "Parent" : "0"},
	{"ID" : "136", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8s_10ns_18_1_1_U342", "Parent" : "0"},
	{"ID" : "137", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_8s_5ns_8_12_seq_1_U343", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	runOne {
		testCaseIdx {Type I LastRead 0 FirstWrite -1}
		kernel_idx {Type IO LastRead -1 FirstWrite -1}
		shape_idx {Type IO LastRead -1 FirstWrite -1}
		DFG_NodesCount_kernels_values {Type I LastRead -1 FirstWrite -1}
		CGRA_NumTiles_shapes_values {Type I LastRead -1 FirstWrite -1}
		mask_table {Type I LastRead -1 FirstWrite -1}
		threshold {Type IO LastRead -1 FirstWrite -1}
		DynamicPlacement_II {Type IO LastRead -1 FirstWrite -1}
		IDX_pd {Type IO LastRead -1 FirstWrite -1}
		idx_pd_r {Type IO LastRead -1 FirstWrite -1}
		IDX_pd_modulo {Type IO LastRead -1 FirstWrite -1}
		IDX_pd_bypass {Type IO LastRead -1 FirstWrite -1}
		bypassOptIdx {Type IO LastRead -1 FirstWrite -1}
		bypassOpt {Type IO LastRead -1 FirstWrite -1}
		bypassSrcOpt {Type IO LastRead -1 FirstWrite -1}
		bypassTgtOpt {Type IO LastRead -1 FirstWrite -1}
		predTile1 {Type IO LastRead -1 FirstWrite -1}
		bypassSrcTile {Type IO LastRead -1 FirstWrite -1}
		bypassTgtTile {Type IO LastRead -1 FirstWrite -1}
		dependency_forward {Type IO LastRead -1 FirstWrite -1}
		dependency_backward {Type IO LastRead -1 FirstWrite -1}
		bypassOpt_wrAddr {Type IO LastRead -1 FirstWrite -1}
		predecessors {Type IO LastRead -1 FirstWrite -1}
		placement_dynamic_bypass {Type IO LastRead -1 FirstWrite -1}
		placement_dynamic_occupy {Type IO LastRead -1 FirstWrite -1}
		placement_dynamic_bypass_occupy {Type IO LastRead -1 FirstWrite -1}
		placement_static_kernels_values {Type I LastRead -1 FirstWrite -1}
		placement_dynamic_dict_Opt2PC_keys {Type IO LastRead -1 FirstWrite -1}
		placement_dynamic_dict_Opt2PC_values {Type IO LastRead -1 FirstWrite -1}
		placement_dynamic_dict_Opt2Tile_keys {Type IO LastRead -1 FirstWrite -1}
		placement_dynamic_dict_Opt2Tile_values {Type IO LastRead -1 FirstWrite -1}
		placement_done_values {Type IO LastRead -1 FirstWrite -1}
		dependency_predecessors_kernels_values1 {Type I LastRead -1 FirstWrite -1}
		dependency_predecessor_values {Type IO LastRead -1 FirstWrite -1}
		dependency_successors_kernels_values1 {Type I LastRead -1 FirstWrite -1}
		dependency_successor_values {Type IO LastRead -1 FirstWrite -1}
		curOptPotentialPlacement {Type IO LastRead -1 FirstWrite -1}
		curOpt_idx {Type IO LastRead -1 FirstWrite -1}
		predecessors_wrAddr {Type IO LastRead -1 FirstWrite -1}
		predOpt_idx_List {Type IO LastRead -1 FirstWrite -1}
		predsNum {Type IO LastRead -1 FirstWrite -1}
		placement_static_Opt2Tile_kernels_values1 {Type I LastRead -1 FirstWrite -1}
		placement_static_Tile2Level_keys {Type I LastRead -1 FirstWrite -1}
		placement_static_Tile2Level_values {Type I LastRead -1 FirstWrite -1}
		allocated_tiles_Maxlevels_dynamic_shapes_values {Type I LastRead -1 FirstWrite -1}
		curOptPotentialPlacement_wrAddr {Type IO LastRead -1 FirstWrite -1}
		allocated_tiles_levelsValidLen_shapes_values {Type I LastRead -1 FirstWrite -1}
		allocated_tiles_levels_dynamic_shapes_values {Type I LastRead -1 FirstWrite -1}
		potentialPlacement_wrAddr_List_0 {Type IO LastRead -1 FirstWrite -1}
		potentialPlacement_wrAddr_List_1 {Type IO LastRead -1 FirstWrite -1}
		Tile2XY_0 {Type I LastRead -1 FirstWrite -1}
		Tile2XY_1 {Type I LastRead -1 FirstWrite -1}
		CurOptPotentialPlacement_List_BypassLess_Gen_XChanges {Type I LastRead -1 FirstWrite -1}
		xy2Tile {Type I LastRead -1 FirstWrite -1}
		allocated_tiles_shapes_values {Type I LastRead -1 FirstWrite -1}
		CurOptPotentialPlacement_List_BypassLess_Gen_YChanges {Type I LastRead -1 FirstWrite -1}
		bypassSrcOpt_keyIdx {Type IO LastRead -1 FirstWrite -1}
		bypassTgtOpt_keyIdx {Type IO LastRead -1 FirstWrite -1}
		bpsStride_0 {Type I LastRead -1 FirstWrite -1}
		bpsStride_1 {Type I LastRead -1 FirstWrite -1}}
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
		placement_static_kernels_values {Type I LastRead -1 FirstWrite -1}
		placement_dynamic_dict_Opt2PC_keys {Type O LastRead -1 FirstWrite 1}
		placement_dynamic_dict_Opt2PC_values {Type O LastRead -1 FirstWrite 0}
		placement_dynamic_dict_Opt2Tile_keys {Type O LastRead -1 FirstWrite 1}
		placement_dynamic_dict_Opt2Tile_values {Type O LastRead -1 FirstWrite 0}
		placement_done_values {Type O LastRead -1 FirstWrite 0}
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
		DFG_NodesCount_kernels_values_load {Type I LastRead 0 FirstWrite -1}
		mul_ln725 {Type I LastRead 0 FirstWrite -1}
		placement_static_kernels_values {Type I LastRead -1 FirstWrite -1}
		placement_dynamic_dict_Opt2PC_keys {Type O LastRead -1 FirstWrite 1}}
	Reset_Pipeline_VITIS_LOOP_707_14 {
		placement_dynamic_dict_Opt2PC_values {Type O LastRead -1 FirstWrite 0}}
	Reset_Pipeline_VITIS_LOOP_713_16 {
		placement_dynamic_dict_Opt2Tile_values {Type O LastRead -1 FirstWrite 0}}
	Reset_Pipeline_VITIS_LOOP_716_17 {
		placement_done_values {Type O LastRead -1 FirstWrite 0}}
	Reset_Pipeline_VITIS_LOOP_722_19_VITIS_LOOP_724_20 {
		add_ln722 {Type I LastRead 0 FirstWrite -1}
		mul_ln725 {Type I LastRead 0 FirstWrite -1}
		dependency_predecessors_kernels_values1 {Type I LastRead -1 FirstWrite -1}
		dependency_predecessor_values {Type O LastRead -1 FirstWrite 3}}
	Reset_Pipeline_VITIS_LOOP_734_21_VITIS_LOOP_736_22 {
		add_ln734 {Type I LastRead 0 FirstWrite -1}
		mul_ln725 {Type I LastRead 0 FirstWrite -1}
		dependency_successors_kernels_values1 {Type I LastRead -1 FirstWrite -1}
		dependency_successor_values {Type O LastRead -1 FirstWrite 3}}
	Reset_Pipeline_VITIS_LOOP_710_15 {
		DFG_NodesCount_kernels_values_load {Type I LastRead 0 FirstWrite -1}
		mul_ln725 {Type I LastRead 0 FirstWrite -1}
		placement_static_kernels_values {Type I LastRead -1 FirstWrite -1}
		placement_dynamic_dict_Opt2Tile_keys {Type O LastRead -1 FirstWrite 1}}
	dynamic_placement_routing {
		curOpt_idx {Type IO LastRead -1 FirstWrite -1}
		kernel_idx {Type I LastRead 16 FirstWrite -1}
		DFG_NodesCount_kernels_values {Type I LastRead 1 FirstWrite -1}
		IDX_pd {Type IO LastRead 10 FirstWrite 0}
		dependency_predecessor_values {Type IO LastRead 5 FirstWrite -1}
		predecessors_wrAddr {Type IO LastRead -1 FirstWrite -1}
		placement_static_kernels_values {Type I LastRead 3 FirstWrite -1}
		placement_done_values {Type IO LastRead 20 FirstWrite 8}
		predOpt_idx_List {Type IO LastRead -1 FirstWrite -1}
		predecessors {Type IO LastRead 15 FirstWrite -1}
		placement_dynamic_dict_Opt2PC_values {Type IO LastRead 9 FirstWrite 8}
		predsNum {Type IO LastRead -1 FirstWrite -1}
		threshold {Type I LastRead 5 FirstWrite -1}
		placement_static_Opt2Tile_kernels_values1 {Type I LastRead -1 FirstWrite -1}
		placement_static_Tile2Level_keys {Type I LastRead -1 FirstWrite -1}
		placement_static_Tile2Level_values {Type I LastRead -1 FirstWrite -1}
		shape_idx {Type I LastRead 8 FirstWrite -1}
		allocated_tiles_Maxlevels_dynamic_shapes_values {Type I LastRead -1 FirstWrite -1}
		curOptPotentialPlacement_wrAddr {Type IO LastRead -1 FirstWrite -1}
		allocated_tiles_levelsValidLen_shapes_values {Type I LastRead -1 FirstWrite -1}
		allocated_tiles_levels_dynamic_shapes_values {Type I LastRead -1 FirstWrite -1}
		curOptPotentialPlacement {Type IO LastRead 28 FirstWrite -1}
		CGRA_NumTiles_shapes_values {Type I LastRead -1 FirstWrite -1}
		potentialPlacement_wrAddr_List_0 {Type IO LastRead -1 FirstWrite -1}
		potentialPlacement_wrAddr_List_1 {Type IO LastRead -1 FirstWrite -1}
		placement_dynamic_dict_Opt2Tile_values {Type IO LastRead 31 FirstWrite -1}
		Tile2XY_0 {Type I LastRead -1 FirstWrite -1}
		Tile2XY_1 {Type I LastRead -1 FirstWrite -1}
		CurOptPotentialPlacement_List_BypassLess_Gen_XChanges {Type I LastRead -1 FirstWrite -1}
		xy2Tile {Type I LastRead -1 FirstWrite -1}
		allocated_tiles_shapes_values {Type I LastRead -1 FirstWrite -1}
		CurOptPotentialPlacement_List_BypassLess_Gen_YChanges {Type I LastRead -1 FirstWrite -1}
		DynamicPlacement_II {Type I LastRead 29 FirstWrite -1}
		IDX_pd_modulo {Type IO LastRead 1 FirstWrite 11}
		placement_dynamic_occupy {Type IO LastRead 1 FirstWrite -1}
		placement_dynamic_dict_Opt2Tile_keys {Type IO LastRead 1 FirstWrite -1}
		predTile1 {Type IO LastRead 19 FirstWrite 19}
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
		bpsStride_0 {Type I LastRead -1 FirstWrite -1}
		bpsStride_1 {Type I LastRead -1 FirstWrite -1}
		idx_pd_r {Type IO LastRead 4 FirstWrite 4}
		placement_dynamic_bypass_occupy {Type IO LastRead 13 FirstWrite -1}
		placement_dynamic_bypass {Type IO LastRead 1 FirstWrite -1}
		bypassOpt_wrAddr {Type IO LastRead 8 FirstWrite 8}
		dependency_successor_values {Type IO LastRead 1 FirstWrite -1}}
	dynamic_placement_routing_Pipeline_VITIS_LOOP_601_2 {
		add_ln602 {Type I LastRead 0 FirstWrite -1}
		i_out {Type O LastRead -1 FirstWrite 2}
		dependency_predecessor_values {Type I LastRead 1 FirstWrite -1}}
	dynamic_placement_routing_Pipeline_VITIS_LOOP_611_4 {
		DFG_NodesCount_kernels_values_load {Type I LastRead 0 FirstWrite -1}
		mul_ln374 {Type I LastRead 0 FirstWrite -1}
		pred_r {Type I LastRead 0 FirstWrite -1}
		inc311623_out {Type O LastRead -1 FirstWrite 2}
		placement_static_kernels_values {Type I LastRead -1 FirstWrite -1}}
	dynamic_placement_routing_Pipeline_VITIS_LOOP_618_5 {
		add_ln619 {Type I LastRead 0 FirstWrite -1}
		j_3_out {Type O LastRead -1 FirstWrite 2}
		dependency_predecessor_values {Type I LastRead 1 FirstWrite -1}}
	dynamic_placement_routing_Pipeline_VITIS_LOOP_624_6 {
		j_3_reload {Type I LastRead 0 FirstWrite -1}
		add_ln619 {Type I LastRead 0 FirstWrite -1}
		zext_ln608 {Type I LastRead 0 FirstWrite -1}
		dependency_predecessor_values {Type I LastRead 0 FirstWrite -1}}
	CurOptPotentialPlacement_List_BypassLess_Gen {
		predsNum {Type I LastRead 0 FirstWrite -1}
		shape_idx {Type I LastRead 0 FirstWrite -1}
		CGRA_NumTiles_shapes_values {Type I LastRead -1 FirstWrite -1}
		curOptPotentialPlacement_wrAddr {Type IO LastRead 17 FirstWrite 2}
		potentialPlacement_wrAddr_List_0 {Type IO LastRead -1 FirstWrite -1}
		potentialPlacement_wrAddr_List_1 {Type IO LastRead -1 FirstWrite -1}
		predOpt_idx_List {Type I LastRead 7 FirstWrite -1}
		placement_dynamic_dict_Opt2Tile_values {Type I LastRead 8 FirstWrite -1}
		Tile2XY_0 {Type I LastRead 9 FirstWrite -1}
		Tile2XY_1 {Type I LastRead 9 FirstWrite -1}
		CurOptPotentialPlacement_List_BypassLess_Gen_XChanges {Type I LastRead -1 FirstWrite -1}
		xy2Tile {Type I LastRead 10 FirstWrite -1}
		allocated_tiles_shapes_values {Type I LastRead 14 FirstWrite -1}
		CurOptPotentialPlacement_List_BypassLess_Gen_YChanges {Type I LastRead -1 FirstWrite -1}
		curOptPotentialPlacement {Type IO LastRead 0 FirstWrite -1}}
	CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_470_5 {
		i {Type I LastRead 0 FirstWrite -1}
		potentialPlacement_AllPreds {Type I LastRead 0 FirstWrite -1}
		curOptPotentialPlacement {Type O LastRead -1 FirstWrite 1}}
	CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4 {
		CGRA_NumTiles_shapes_values_load {Type I LastRead 0 FirstWrite -1}
		shape_idx_load {Type I LastRead 0 FirstWrite -1}
		surrTile {Type I LastRead 0 FirstWrite -1}
		allocated_tiles_shapes_values {Type I LastRead -1 FirstWrite -1}}
	CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_497_8_VITIS_LOOP_498_9 {
		conv115123_in {Type I LastRead 0 FirstWrite -1}
		mul_ln497 {Type I LastRead 0 FirstWrite -1}
		potentialPlacement_AllPreds {Type I LastRead 1 FirstWrite -1}
		intersection {Type O LastRead -1 FirstWrite 1}
		hasItst_out {Type O LastRead -1 FirstWrite 0}
		inc1313173_out {Type O LastRead -1 FirstWrite 0}}
	CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_508_10 {
		inc1313173_reload {Type I LastRead 0 FirstWrite -1}
		intersection {Type I LastRead 0 FirstWrite -1}
		curOptPotentialPlacement {Type O LastRead -1 FirstWrite 1}}
	CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_562_14 {
		inc23826 {Type I LastRead 0 FirstWrite -1}
		CGRA_NumTiles_shapes_values_load_1 {Type I LastRead 0 FirstWrite -1}
		shape_idx_load {Type I LastRead 0 FirstWrite -1}
		BypassTile {Type I LastRead 0 FirstWrite -1}
		zext_ln561_2 {Type I LastRead 0 FirstWrite -1}
		existLen_2_out {Type O LastRead -1 FirstWrite 0}
		allocated_tiles_shapes_values {Type I LastRead -1 FirstWrite -1}
		curOptPotentialPlacement {Type O LastRead -1 FirstWrite 1}}
	CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_577_16 {
		existLen_2_reload {Type I LastRead 0 FirstWrite -1}
		zext_ln577 {Type I LastRead 0 FirstWrite -1}
		curOptPotentialPlacement {Type I LastRead 0 FirstWrite -1}}
	CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_518_12 {
		existLen_1 {Type I LastRead 0 FirstWrite -1}
		intersection {Type I LastRead 0 FirstWrite -1}
		allocated_tiles_shapes_values_load_2 {Type I LastRead 0 FirstWrite -1}}
	CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_480_7 {
		existLen {Type I LastRead 0 FirstWrite -1}
		zext_ln480 {Type I LastRead 0 FirstWrite -1}
		curOptPotentialPlacement {Type I LastRead 0 FirstWrite -1}}
	dynamic_placement_routing_Pipeline_VITIS_LOOP_377_1 {
		curTileStatic {Type I LastRead 0 FirstWrite -1}
		tileID_out {Type O LastRead -1 FirstWrite 2}
		placement_static_Tile2Level_keys {Type I LastRead -1 FirstWrite -1}}
	dynamic_placement_routing_Pipeline_VITIS_LOOP_388_2 {
		allocated_tiles_levelsValidLen_shapes_values_load {Type I LastRead 0 FirstWrite -1}
		shape_idx_load {Type I LastRead 0 FirstWrite -1}
		initial_dynamic_level {Type I LastRead 0 FirstWrite -1}
		curTileStatic {Type I LastRead 0 FirstWrite -1}
		allocated_tiles_levels_dynamic_shapes_values {Type I LastRead 0 FirstWrite -1}}
	dynamic_placement_routing_Pipeline_VITIS_LOOP_398_3 {
		allocated_tiles_levelsValidLen_shapes_values_load {Type I LastRead 0 FirstWrite -1}
		shape_idx_load {Type I LastRead 0 FirstWrite -1}
		initial_dynamic_level {Type I LastRead 0 FirstWrite -1}
		curTileStatic {Type I LastRead 0 FirstWrite -1}
		allocated_tiles_levels_dynamic_shapes_values {Type I LastRead 0 FirstWrite -1}
		curOptPotentialPlacement_wrAddr {Type IO LastRead 1 FirstWrite 1}
		curOptPotentialPlacement {Type O LastRead -1 FirstWrite 1}}
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
		IDX_pd {Type IO LastRead 2 FirstWrite 2}}
	dynamic_placement_routing_Pipeline_VITIS_LOOP_415_5 {
		curOptPotentialPlacement_wrAddr_load_1 {Type I LastRead 0 FirstWrite -1}
		add_ln415 {Type I LastRead 0 FirstWrite -1}
		tmp_19 {Type I LastRead 0 FirstWrite -1}
		allocated_tiles_levels_dynamic_shapes_values {Type I LastRead 0 FirstWrite -1}
		curOptPotentialPlacement {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	testCaseIdx { ap_none {  { testCaseIdx in_data 0 8 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
