set moduleName BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3
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
set C_modelName {BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3}
set C_modelType { int 1 }
set C_modelArgList {
	{ Tile2XY_0_load int 2 regular  }
	{ cmp28 int 1 regular  }
	{ and_ln205 int 1 regular  }
	{ Tile2XY_1_load int 2 regular  }
	{ cmp77 int 1 regular  }
	{ and_ln218 int 1 regular  }
	{ sub_ln192 int 6 regular  }
	{ CGRA_NumTiles_shapes_values_load int 4 regular  }
	{ shape_idx_load int 5 regular  }
	{ yDiff_2_phi_out int 2 regular {pointer 1}  }
	{ xDiff_2_phi_out int 2 regular {pointer 1}  }
	{ i_50_out int 4 regular {pointer 1}  }
	{ xDiff_2_out int 2 regular {pointer 1}  }
	{ yDiff_2_out int 2 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "Tile2XY_0_load", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "cmp28", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "and_ln205", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "Tile2XY_1_load", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "cmp77", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "and_ln218", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "sub_ln192", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "CGRA_NumTiles_shapes_values_load", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "shape_idx_load", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "yDiff_2_phi_out", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "xDiff_2_phi_out", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "i_50_out", "interface" : "wire", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "xDiff_2_out", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "yDiff_2_out", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ Tile2XY_0_load sc_in sc_lv 2 signal 0 } 
	{ cmp28 sc_in sc_lv 1 signal 1 } 
	{ and_ln205 sc_in sc_lv 1 signal 2 } 
	{ Tile2XY_1_load sc_in sc_lv 2 signal 3 } 
	{ cmp77 sc_in sc_lv 1 signal 4 } 
	{ and_ln218 sc_in sc_lv 1 signal 5 } 
	{ sub_ln192 sc_in sc_lv 6 signal 6 } 
	{ CGRA_NumTiles_shapes_values_load sc_in sc_lv 4 signal 7 } 
	{ shape_idx_load sc_in sc_lv 5 signal 8 } 
	{ yDiff_2_phi_out sc_out sc_lv 2 signal 9 } 
	{ yDiff_2_phi_out_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ xDiff_2_phi_out sc_out sc_lv 2 signal 10 } 
	{ xDiff_2_phi_out_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ i_50_out sc_out sc_lv 4 signal 11 } 
	{ i_50_out_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ xDiff_2_out sc_out sc_lv 2 signal 12 } 
	{ xDiff_2_out_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ yDiff_2_out sc_out sc_lv 2 signal 13 } 
	{ yDiff_2_out_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "Tile2XY_0_load", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "Tile2XY_0_load", "role": "default" }} , 
 	{ "name": "cmp28", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp28", "role": "default" }} , 
 	{ "name": "and_ln205", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "and_ln205", "role": "default" }} , 
 	{ "name": "Tile2XY_1_load", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "Tile2XY_1_load", "role": "default" }} , 
 	{ "name": "cmp77", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp77", "role": "default" }} , 
 	{ "name": "and_ln218", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "and_ln218", "role": "default" }} , 
 	{ "name": "sub_ln192", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "sub_ln192", "role": "default" }} , 
 	{ "name": "CGRA_NumTiles_shapes_values_load", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CGRA_NumTiles_shapes_values_load", "role": "default" }} , 
 	{ "name": "shape_idx_load", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "shape_idx_load", "role": "default" }} , 
 	{ "name": "yDiff_2_phi_out", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "yDiff_2_phi_out", "role": "default" }} , 
 	{ "name": "yDiff_2_phi_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "yDiff_2_phi_out", "role": "ap_vld" }} , 
 	{ "name": "xDiff_2_phi_out", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "xDiff_2_phi_out", "role": "default" }} , 
 	{ "name": "xDiff_2_phi_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "xDiff_2_phi_out", "role": "ap_vld" }} , 
 	{ "name": "i_50_out", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "i_50_out", "role": "default" }} , 
 	{ "name": "i_50_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "i_50_out", "role": "ap_vld" }} , 
 	{ "name": "xDiff_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "xDiff_2_out", "role": "default" }} , 
 	{ "name": "xDiff_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "xDiff_2_out", "role": "ap_vld" }} , 
 	{ "name": "yDiff_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "yDiff_2_out", "role": "default" }} , 
 	{ "name": "yDiff_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "yDiff_2_out", "role": "ap_vld" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bpsStride_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bpsStride_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.xy2Tile_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.allocated_tiles_shapes_values_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		allocated_tiles_shapes_values {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	Tile2XY_0_load { ap_none {  { Tile2XY_0_load in_data 0 2 } } }
	cmp28 { ap_none {  { cmp28 in_data 0 1 } } }
	and_ln205 { ap_none {  { and_ln205 in_data 0 1 } } }
	Tile2XY_1_load { ap_none {  { Tile2XY_1_load in_data 0 2 } } }
	cmp77 { ap_none {  { cmp77 in_data 0 1 } } }
	and_ln218 { ap_none {  { and_ln218 in_data 0 1 } } }
	sub_ln192 { ap_none {  { sub_ln192 in_data 0 6 } } }
	CGRA_NumTiles_shapes_values_load { ap_none {  { CGRA_NumTiles_shapes_values_load in_data 0 4 } } }
	shape_idx_load { ap_none {  { shape_idx_load in_data 0 5 } } }
	yDiff_2_phi_out { ap_vld {  { yDiff_2_phi_out out_data 1 2 }  { yDiff_2_phi_out_ap_vld out_vld 1 1 } } }
	xDiff_2_phi_out { ap_vld {  { xDiff_2_phi_out out_data 1 2 }  { xDiff_2_phi_out_ap_vld out_vld 1 1 } } }
	i_50_out { ap_vld {  { i_50_out out_data 1 4 }  { i_50_out_ap_vld out_vld 1 1 } } }
	xDiff_2_out { ap_vld {  { xDiff_2_out out_data 1 2 }  { xDiff_2_out_ap_vld out_vld 1 1 } } }
	yDiff_2_out { ap_vld {  { yDiff_2_out out_data 1 2 }  { yDiff_2_out_ap_vld out_vld 1 1 } } }
}
