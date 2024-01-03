set moduleName CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_562_14
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_562_14}
set C_modelType { void 0 }
set C_modelArgList {
	{ inc23826 int 8 regular  }
	{ CGRA_NumTiles_shapes_values_load_1 int 4 regular  }
	{ shape_idx_load int 5 regular  }
	{ BypassTile int 4 regular  }
	{ zext_ln561_2 int 4 regular  }
	{ existLen_2_out int 8 regular {pointer 1}  }
	{ curOptPotentialPlacement int 5 regular {array 16 { 0 3 } 0 1 } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "inc23826", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "CGRA_NumTiles_shapes_values_load_1", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "shape_idx_load", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "BypassTile", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln561_2", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "existLen_2_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "curOptPotentialPlacement", "interface" : "memory", "bitwidth" : 5, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ inc23826 sc_in sc_lv 8 signal 0 } 
	{ CGRA_NumTiles_shapes_values_load_1 sc_in sc_lv 4 signal 1 } 
	{ shape_idx_load sc_in sc_lv 5 signal 2 } 
	{ BypassTile sc_in sc_lv 4 signal 3 } 
	{ zext_ln561_2 sc_in sc_lv 4 signal 4 } 
	{ existLen_2_out sc_out sc_lv 8 signal 5 } 
	{ existLen_2_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ curOptPotentialPlacement_address0 sc_out sc_lv 4 signal 6 } 
	{ curOptPotentialPlacement_ce0 sc_out sc_logic 1 signal 6 } 
	{ curOptPotentialPlacement_we0 sc_out sc_logic 1 signal 6 } 
	{ curOptPotentialPlacement_d0 sc_out sc_lv 5 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "inc23826", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inc23826", "role": "default" }} , 
 	{ "name": "CGRA_NumTiles_shapes_values_load_1", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CGRA_NumTiles_shapes_values_load_1", "role": "default" }} , 
 	{ "name": "shape_idx_load", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "shape_idx_load", "role": "default" }} , 
 	{ "name": "BypassTile", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BypassTile", "role": "default" }} , 
 	{ "name": "zext_ln561_2", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "zext_ln561_2", "role": "default" }} , 
 	{ "name": "existLen_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "existLen_2_out", "role": "default" }} , 
 	{ "name": "existLen_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "existLen_2_out", "role": "ap_vld" }} , 
 	{ "name": "curOptPotentialPlacement_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "address0" }} , 
 	{ "name": "curOptPotentialPlacement_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "ce0" }} , 
 	{ "name": "curOptPotentialPlacement_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "we0" }} , 
 	{ "name": "curOptPotentialPlacement_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.allocated_tiles_shapes_values_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_562_14 {
		inc23826 {Type I LastRead 0 FirstWrite -1}
		CGRA_NumTiles_shapes_values_load_1 {Type I LastRead 0 FirstWrite -1}
		shape_idx_load {Type I LastRead 0 FirstWrite -1}
		BypassTile {Type I LastRead 0 FirstWrite -1}
		zext_ln561_2 {Type I LastRead 0 FirstWrite -1}
		existLen_2_out {Type O LastRead -1 FirstWrite 0}
		allocated_tiles_shapes_values {Type I LastRead -1 FirstWrite -1}
		curOptPotentialPlacement {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6", "Max" : "14"}
	, {"Name" : "Interval", "Min" : "6", "Max" : "14"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	inc23826 { ap_none {  { inc23826 in_data 0 8 } } }
	CGRA_NumTiles_shapes_values_load_1 { ap_none {  { CGRA_NumTiles_shapes_values_load_1 in_data 0 4 } } }
	shape_idx_load { ap_none {  { shape_idx_load in_data 0 5 } } }
	BypassTile { ap_none {  { BypassTile in_data 0 4 } } }
	zext_ln561_2 { ap_none {  { zext_ln561_2 in_data 0 4 } } }
	existLen_2_out { ap_vld {  { existLen_2_out out_data 1 8 }  { existLen_2_out_ap_vld out_vld 1 1 } } }
	curOptPotentialPlacement { ap_memory {  { curOptPotentialPlacement_address0 mem_address 1 4 }  { curOptPotentialPlacement_ce0 mem_ce 1 1 }  { curOptPotentialPlacement_we0 mem_we 1 1 }  { curOptPotentialPlacement_d0 mem_din 1 5 } } }
}
