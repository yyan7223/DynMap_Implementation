set moduleName dynamic_placement_routing_Pipeline_VITIS_LOOP_398_3
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
set C_modelName {dynamic_placement_routing_Pipeline_VITIS_LOOP_398_3}
set C_modelType { void 0 }
set C_modelArgList {
	{ allocated_tiles_levelsValidLen_shapes_values_load int 4 regular  }
	{ shape_idx_load int 5 regular  }
	{ initial_dynamic_level int 2 regular  }
	{ curTileStatic int 4 regular  }
	{ allocated_tiles_levels_dynamic_shapes_values int 4 regular {array 1280 { 1 } 1 1 } {global 0}  }
	{ curOptPotentialPlacement_wrAddr int 8 regular {pointer 2} {global 2}  }
	{ curOptPotentialPlacement int 5 regular {array 16 { 0 3 } 0 1 } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "allocated_tiles_levelsValidLen_shapes_values_load", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "shape_idx_load", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "initial_dynamic_level", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "curTileStatic", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "allocated_tiles_levels_dynamic_shapes_values", "interface" : "memory", "bitwidth" : 4, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "curOptPotentialPlacement_wrAddr", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "curOptPotentialPlacement", "interface" : "memory", "bitwidth" : 5, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ allocated_tiles_levelsValidLen_shapes_values_load sc_in sc_lv 4 signal 0 } 
	{ shape_idx_load sc_in sc_lv 5 signal 1 } 
	{ initial_dynamic_level sc_in sc_lv 2 signal 2 } 
	{ curTileStatic sc_in sc_lv 4 signal 3 } 
	{ allocated_tiles_levels_dynamic_shapes_values_address0 sc_out sc_lv 11 signal 4 } 
	{ allocated_tiles_levels_dynamic_shapes_values_ce0 sc_out sc_logic 1 signal 4 } 
	{ allocated_tiles_levels_dynamic_shapes_values_q0 sc_in sc_lv 4 signal 4 } 
	{ curOptPotentialPlacement_wrAddr_i sc_in sc_lv 8 signal 5 } 
	{ curOptPotentialPlacement_wrAddr_o sc_out sc_lv 8 signal 5 } 
	{ curOptPotentialPlacement_wrAddr_o_ap_vld sc_out sc_logic 1 outvld 5 } 
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
 	{ "name": "allocated_tiles_levelsValidLen_shapes_values_load", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "allocated_tiles_levelsValidLen_shapes_values_load", "role": "default" }} , 
 	{ "name": "shape_idx_load", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "shape_idx_load", "role": "default" }} , 
 	{ "name": "initial_dynamic_level", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "initial_dynamic_level", "role": "default" }} , 
 	{ "name": "curTileStatic", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "curTileStatic", "role": "default" }} , 
 	{ "name": "allocated_tiles_levels_dynamic_shapes_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "allocated_tiles_levels_dynamic_shapes_values", "role": "address0" }} , 
 	{ "name": "allocated_tiles_levels_dynamic_shapes_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "allocated_tiles_levels_dynamic_shapes_values", "role": "ce0" }} , 
 	{ "name": "allocated_tiles_levels_dynamic_shapes_values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "allocated_tiles_levels_dynamic_shapes_values", "role": "q0" }} , 
 	{ "name": "curOptPotentialPlacement_wrAddr_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "curOptPotentialPlacement_wrAddr", "role": "i" }} , 
 	{ "name": "curOptPotentialPlacement_wrAddr_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "curOptPotentialPlacement_wrAddr", "role": "o" }} , 
 	{ "name": "curOptPotentialPlacement_wrAddr_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "curOptPotentialPlacement_wrAddr", "role": "o_ap_vld" }} , 
 	{ "name": "curOptPotentialPlacement_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "address0" }} , 
 	{ "name": "curOptPotentialPlacement_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "ce0" }} , 
 	{ "name": "curOptPotentialPlacement_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "we0" }} , 
 	{ "name": "curOptPotentialPlacement_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	dynamic_placement_routing_Pipeline_VITIS_LOOP_398_3 {
		allocated_tiles_levelsValidLen_shapes_values_load {Type I LastRead 0 FirstWrite -1}
		shape_idx_load {Type I LastRead 0 FirstWrite -1}
		initial_dynamic_level {Type I LastRead 0 FirstWrite -1}
		curTileStatic {Type I LastRead 0 FirstWrite -1}
		allocated_tiles_levels_dynamic_shapes_values {Type I LastRead 0 FirstWrite -1}
		curOptPotentialPlacement_wrAddr {Type IO LastRead 1 FirstWrite 1}
		curOptPotentialPlacement {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "12"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "12"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	allocated_tiles_levelsValidLen_shapes_values_load { ap_none {  { allocated_tiles_levelsValidLen_shapes_values_load in_data 0 4 } } }
	shape_idx_load { ap_none {  { shape_idx_load in_data 0 5 } } }
	initial_dynamic_level { ap_none {  { initial_dynamic_level in_data 0 2 } } }
	curTileStatic { ap_none {  { curTileStatic in_data 0 4 } } }
	allocated_tiles_levels_dynamic_shapes_values { ap_memory {  { allocated_tiles_levels_dynamic_shapes_values_address0 mem_address 1 11 }  { allocated_tiles_levels_dynamic_shapes_values_ce0 mem_ce 1 1 }  { allocated_tiles_levels_dynamic_shapes_values_q0 in_data 0 4 } } }
	curOptPotentialPlacement_wrAddr { ap_ovld {  { curOptPotentialPlacement_wrAddr_i in_data 0 8 }  { curOptPotentialPlacement_wrAddr_o out_data 1 8 }  { curOptPotentialPlacement_wrAddr_o_ap_vld out_vld 1 1 } } }
	curOptPotentialPlacement { ap_memory {  { curOptPotentialPlacement_address0 mem_address 1 4 }  { curOptPotentialPlacement_ce0 mem_ce 1 1 }  { curOptPotentialPlacement_we0 mem_we 1 1 }  { curOptPotentialPlacement_d0 mem_din 1 5 } } }
}
