set moduleName CurOptPotentialPlacement_List_BypassLess_Gen
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
set C_modelName {CurOptPotentialPlacement_List_BypassLess_Gen}
set C_modelType { void 0 }
set C_modelArgList {
	{ predsNum int 8 regular {pointer 0} {global 0}  }
	{ shape_idx int 5 regular {pointer 0} {global 0}  }
	{ curOptPotentialPlacement_wrAddr int 8 regular {pointer 2} {global 2}  }
	{ predOpt_idx_List int 6 regular {array 10 { 1 1 } 1 1 } {global 0}  }
	{ placement_dynamic_dict_Opt2Tile_values int 5 regular {array 100 { 1 1 } 1 1 } {global 0}  }
	{ Tile2XY_0 int 2 regular {array 16 { 1 1 } 1 1 } {global 0}  }
	{ Tile2XY_1 int 2 regular {array 16 { 1 1 } 1 1 } {global 0}  }
	{ xy2Tile int 4 regular {array 16 { 1 } 1 1 } {global 0}  }
	{ allocated_tiles_shapes_values int 4 regular {array 320 { 1 } 1 1 } {global 0}  }
	{ curOptPotentialPlacement int 5 regular {array 16 { 2 3 } 1 1 } {global 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "predsNum", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "shape_idx", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "curOptPotentialPlacement_wrAddr", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "predOpt_idx_List", "interface" : "memory", "bitwidth" : 6, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_dict_Opt2Tile_values", "interface" : "memory", "bitwidth" : 5, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "Tile2XY_0", "interface" : "memory", "bitwidth" : 2, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "Tile2XY_1", "interface" : "memory", "bitwidth" : 2, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "xy2Tile", "interface" : "memory", "bitwidth" : 4, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "allocated_tiles_shapes_values", "interface" : "memory", "bitwidth" : 4, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "curOptPotentialPlacement", "interface" : "memory", "bitwidth" : 5, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 46
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ predsNum sc_in sc_lv 8 signal 0 } 
	{ shape_idx sc_in sc_lv 5 signal 1 } 
	{ curOptPotentialPlacement_wrAddr_i sc_in sc_lv 8 signal 2 } 
	{ curOptPotentialPlacement_wrAddr_o sc_out sc_lv 8 signal 2 } 
	{ curOptPotentialPlacement_wrAddr_o_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ predOpt_idx_List_address0 sc_out sc_lv 4 signal 3 } 
	{ predOpt_idx_List_ce0 sc_out sc_logic 1 signal 3 } 
	{ predOpt_idx_List_q0 sc_in sc_lv 6 signal 3 } 
	{ predOpt_idx_List_address1 sc_out sc_lv 4 signal 3 } 
	{ predOpt_idx_List_ce1 sc_out sc_logic 1 signal 3 } 
	{ predOpt_idx_List_q1 sc_in sc_lv 6 signal 3 } 
	{ placement_dynamic_dict_Opt2Tile_values_address0 sc_out sc_lv 7 signal 4 } 
	{ placement_dynamic_dict_Opt2Tile_values_ce0 sc_out sc_logic 1 signal 4 } 
	{ placement_dynamic_dict_Opt2Tile_values_q0 sc_in sc_lv 5 signal 4 } 
	{ placement_dynamic_dict_Opt2Tile_values_address1 sc_out sc_lv 7 signal 4 } 
	{ placement_dynamic_dict_Opt2Tile_values_ce1 sc_out sc_logic 1 signal 4 } 
	{ placement_dynamic_dict_Opt2Tile_values_q1 sc_in sc_lv 5 signal 4 } 
	{ Tile2XY_0_address0 sc_out sc_lv 4 signal 5 } 
	{ Tile2XY_0_ce0 sc_out sc_logic 1 signal 5 } 
	{ Tile2XY_0_q0 sc_in sc_lv 2 signal 5 } 
	{ Tile2XY_0_address1 sc_out sc_lv 4 signal 5 } 
	{ Tile2XY_0_ce1 sc_out sc_logic 1 signal 5 } 
	{ Tile2XY_0_q1 sc_in sc_lv 2 signal 5 } 
	{ Tile2XY_1_address0 sc_out sc_lv 4 signal 6 } 
	{ Tile2XY_1_ce0 sc_out sc_logic 1 signal 6 } 
	{ Tile2XY_1_q0 sc_in sc_lv 2 signal 6 } 
	{ Tile2XY_1_address1 sc_out sc_lv 4 signal 6 } 
	{ Tile2XY_1_ce1 sc_out sc_logic 1 signal 6 } 
	{ Tile2XY_1_q1 sc_in sc_lv 2 signal 6 } 
	{ xy2Tile_address0 sc_out sc_lv 4 signal 7 } 
	{ xy2Tile_ce0 sc_out sc_logic 1 signal 7 } 
	{ xy2Tile_q0 sc_in sc_lv 4 signal 7 } 
	{ allocated_tiles_shapes_values_address0 sc_out sc_lv 9 signal 8 } 
	{ allocated_tiles_shapes_values_ce0 sc_out sc_logic 1 signal 8 } 
	{ allocated_tiles_shapes_values_q0 sc_in sc_lv 4 signal 8 } 
	{ curOptPotentialPlacement_address0 sc_out sc_lv 4 signal 9 } 
	{ curOptPotentialPlacement_ce0 sc_out sc_logic 1 signal 9 } 
	{ curOptPotentialPlacement_we0 sc_out sc_logic 1 signal 9 } 
	{ curOptPotentialPlacement_d0 sc_out sc_lv 5 signal 9 } 
	{ curOptPotentialPlacement_q0 sc_in sc_lv 5 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "predsNum", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "predsNum", "role": "default" }} , 
 	{ "name": "shape_idx", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "shape_idx", "role": "default" }} , 
 	{ "name": "curOptPotentialPlacement_wrAddr_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "curOptPotentialPlacement_wrAddr", "role": "i" }} , 
 	{ "name": "curOptPotentialPlacement_wrAddr_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "curOptPotentialPlacement_wrAddr", "role": "o" }} , 
 	{ "name": "curOptPotentialPlacement_wrAddr_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "curOptPotentialPlacement_wrAddr", "role": "o_ap_vld" }} , 
 	{ "name": "predOpt_idx_List_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "predOpt_idx_List", "role": "address0" }} , 
 	{ "name": "predOpt_idx_List_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "predOpt_idx_List", "role": "ce0" }} , 
 	{ "name": "predOpt_idx_List_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "predOpt_idx_List", "role": "q0" }} , 
 	{ "name": "predOpt_idx_List_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "predOpt_idx_List", "role": "address1" }} , 
 	{ "name": "predOpt_idx_List_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "predOpt_idx_List", "role": "ce1" }} , 
 	{ "name": "predOpt_idx_List_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "predOpt_idx_List", "role": "q1" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_values", "role": "address0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_values", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_values", "role": "q0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_values_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_values", "role": "address1" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_values_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_values", "role": "ce1" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_values_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_values", "role": "q1" }} , 
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
 	{ "name": "xy2Tile_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "xy2Tile", "role": "address0" }} , 
 	{ "name": "xy2Tile_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xy2Tile", "role": "ce0" }} , 
 	{ "name": "xy2Tile_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "xy2Tile", "role": "q0" }} , 
 	{ "name": "allocated_tiles_shapes_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "allocated_tiles_shapes_values", "role": "address0" }} , 
 	{ "name": "allocated_tiles_shapes_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "allocated_tiles_shapes_values", "role": "ce0" }} , 
 	{ "name": "allocated_tiles_shapes_values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "allocated_tiles_shapes_values", "role": "q0" }} , 
 	{ "name": "curOptPotentialPlacement_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "address0" }} , 
 	{ "name": "curOptPotentialPlacement_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "ce0" }} , 
 	{ "name": "curOptPotentialPlacement_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "we0" }} , 
 	{ "name": "curOptPotentialPlacement_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "d0" }} , 
 	{ "name": "curOptPotentialPlacement_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "8", "11", "13", "15", "18", "20", "22", "24"],
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
					{"ID" : "15", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_562_14_fu_559", "Port" : "allocated_tiles_shapes_values", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "8", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_fu_530", "Port" : "allocated_tiles_shapes_values", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "CurOptPotentialPlacement_List_BypassLess_Gen_YChanges", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "curOptPotentialPlacement", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_480_7_fu_592", "Port" : "curOptPotentialPlacement", "Inst_start_state" : "37", "Inst_end_state" : "38"},
					{"ID" : "15", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_562_14_fu_559", "Port" : "curOptPotentialPlacement", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "13", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_508_10_fu_551", "Port" : "curOptPotentialPlacement", "Inst_start_state" : "17", "Inst_end_state" : "29"},
					{"ID" : "6", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_470_5_fu_522", "Port" : "curOptPotentialPlacement", "Inst_start_state" : "4", "Inst_end_state" : "34"},
					{"ID" : "18", "SubInstance" : "grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_577_16_fu_575", "Port" : "curOptPotentialPlacement", "Inst_start_state" : "26", "Inst_end_state" : "27"}]}],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.CGRA_NumTiles_shapes_values_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.CurOptPotentialPlacement_List_BypassLess_Gen_XChanges_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.CurOptPotentialPlacement_List_BypassLess_Gen_YChanges_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.potentialPlacement_AllPreds_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.intersection_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_470_5_fu_522", "Parent" : "0", "Child" : ["7"],
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
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_470_5_fu_522.flow_control_loop_pipe_sequential_init_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_fu_530", "Parent" : "0", "Child" : ["9", "10"],
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
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_fu_530.allocated_tiles_shapes_values_U", "Parent" : "8"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_fu_530.flow_control_loop_pipe_sequential_init_U", "Parent" : "8"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_497_8_VITIS_LOOP_498_9_fu_540", "Parent" : "0", "Child" : ["12"],
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
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_497_8_VITIS_LOOP_498_9_fu_540.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_508_10_fu_551", "Parent" : "0", "Child" : ["14"],
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
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_508_10_fu_551.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_562_14_fu_559", "Parent" : "0", "Child" : ["16", "17"],
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
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_562_14_fu_559.allocated_tiles_shapes_values_U", "Parent" : "15"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_562_14_fu_559.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_577_16_fu_575", "Parent" : "0", "Child" : ["19"],
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
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_577_16_fu_575.flow_control_loop_pipe_sequential_init_U", "Parent" : "18"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_518_12_fu_584", "Parent" : "0", "Child" : ["21"],
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
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_518_12_fu_584.flow_control_loop_pipe_sequential_init_U", "Parent" : "20"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_480_7_fu_592", "Parent" : "0", "Child" : ["23"],
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
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_480_7_fu_592.flow_control_loop_pipe_sequential_init_U", "Parent" : "22"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_7ns_8ns_15_1_1_U100", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		curOptPotentialPlacement {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	predsNum { ap_none {  { predsNum in_data 0 8 } } }
	shape_idx { ap_none {  { shape_idx in_data 0 5 } } }
	curOptPotentialPlacement_wrAddr { ap_ovld {  { curOptPotentialPlacement_wrAddr_i in_data 0 8 }  { curOptPotentialPlacement_wrAddr_o out_data 1 8 }  { curOptPotentialPlacement_wrAddr_o_ap_vld out_vld 1 1 } } }
	predOpt_idx_List { ap_memory {  { predOpt_idx_List_address0 mem_address 1 4 }  { predOpt_idx_List_ce0 mem_ce 1 1 }  { predOpt_idx_List_q0 in_data 0 6 }  { predOpt_idx_List_address1 MemPortADDR2 1 4 }  { predOpt_idx_List_ce1 MemPortCE2 1 1 }  { predOpt_idx_List_q1 in_data 0 6 } } }
	placement_dynamic_dict_Opt2Tile_values { ap_memory {  { placement_dynamic_dict_Opt2Tile_values_address0 mem_address 1 7 }  { placement_dynamic_dict_Opt2Tile_values_ce0 mem_ce 1 1 }  { placement_dynamic_dict_Opt2Tile_values_q0 in_data 0 5 }  { placement_dynamic_dict_Opt2Tile_values_address1 MemPortADDR2 1 7 }  { placement_dynamic_dict_Opt2Tile_values_ce1 MemPortCE2 1 1 }  { placement_dynamic_dict_Opt2Tile_values_q1 in_data 0 5 } } }
	Tile2XY_0 { ap_memory {  { Tile2XY_0_address0 mem_address 1 4 }  { Tile2XY_0_ce0 mem_ce 1 1 }  { Tile2XY_0_q0 in_data 0 2 }  { Tile2XY_0_address1 MemPortADDR2 1 4 }  { Tile2XY_0_ce1 MemPortCE2 1 1 }  { Tile2XY_0_q1 in_data 0 2 } } }
	Tile2XY_1 { ap_memory {  { Tile2XY_1_address0 mem_address 1 4 }  { Tile2XY_1_ce0 mem_ce 1 1 }  { Tile2XY_1_q0 in_data 0 2 }  { Tile2XY_1_address1 MemPortADDR2 1 4 }  { Tile2XY_1_ce1 MemPortCE2 1 1 }  { Tile2XY_1_q1 in_data 0 2 } } }
	xy2Tile { ap_memory {  { xy2Tile_address0 mem_address 1 4 }  { xy2Tile_ce0 mem_ce 1 1 }  { xy2Tile_q0 mem_dout 0 4 } } }
	allocated_tiles_shapes_values { ap_memory {  { allocated_tiles_shapes_values_address0 mem_address 1 9 }  { allocated_tiles_shapes_values_ce0 mem_ce 1 1 }  { allocated_tiles_shapes_values_q0 in_data 0 4 } } }
	curOptPotentialPlacement { ap_memory {  { curOptPotentialPlacement_address0 mem_address 1 4 }  { curOptPotentialPlacement_ce0 mem_ce 1 1 }  { curOptPotentialPlacement_we0 mem_we 1 1 }  { curOptPotentialPlacement_d0 mem_din 1 5 }  { curOptPotentialPlacement_q0 mem_dout 0 5 } } }
}
