set moduleName dynamic_placement_routing_Pipeline_VITIS_LOOP_415_5
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
set C_modelName {dynamic_placement_routing_Pipeline_VITIS_LOOP_415_5}
set C_modelType { void 0 }
set C_modelArgList {
	{ curOptPotentialPlacement_wrAddr_load_1 int 8 regular  }
	{ add_ln415 int 8 regular  }
	{ tmp_19 int 60 regular  }
	{ allocated_tiles_levels_dynamic_shapes_values int 4 regular {array 1280 { 1 } 1 1 } {global 0}  }
	{ curOptPotentialPlacement int 5 regular {array 16 { 0 3 } 0 1 } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "curOptPotentialPlacement_wrAddr_load_1", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln415", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "tmp_19", "interface" : "wire", "bitwidth" : 60, "direction" : "READONLY"} , 
 	{ "Name" : "allocated_tiles_levels_dynamic_shapes_values", "interface" : "memory", "bitwidth" : 4, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "curOptPotentialPlacement", "interface" : "memory", "bitwidth" : 5, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ curOptPotentialPlacement_wrAddr_load_1 sc_in sc_lv 8 signal 0 } 
	{ add_ln415 sc_in sc_lv 8 signal 1 } 
	{ tmp_19 sc_in sc_lv 60 signal 2 } 
	{ allocated_tiles_levels_dynamic_shapes_values_address0 sc_out sc_lv 11 signal 3 } 
	{ allocated_tiles_levels_dynamic_shapes_values_ce0 sc_out sc_logic 1 signal 3 } 
	{ allocated_tiles_levels_dynamic_shapes_values_q0 sc_in sc_lv 4 signal 3 } 
	{ curOptPotentialPlacement_address0 sc_out sc_lv 4 signal 4 } 
	{ curOptPotentialPlacement_ce0 sc_out sc_logic 1 signal 4 } 
	{ curOptPotentialPlacement_we0 sc_out sc_logic 1 signal 4 } 
	{ curOptPotentialPlacement_d0 sc_out sc_lv 5 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "curOptPotentialPlacement_wrAddr_load_1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "curOptPotentialPlacement_wrAddr_load_1", "role": "default" }} , 
 	{ "name": "add_ln415", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "add_ln415", "role": "default" }} , 
 	{ "name": "tmp_19", "direction": "in", "datatype": "sc_lv", "bitwidth":60, "type": "signal", "bundle":{"name": "tmp_19", "role": "default" }} , 
 	{ "name": "allocated_tiles_levels_dynamic_shapes_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "allocated_tiles_levels_dynamic_shapes_values", "role": "address0" }} , 
 	{ "name": "allocated_tiles_levels_dynamic_shapes_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "allocated_tiles_levels_dynamic_shapes_values", "role": "ce0" }} , 
 	{ "name": "allocated_tiles_levels_dynamic_shapes_values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "allocated_tiles_levels_dynamic_shapes_values", "role": "q0" }} , 
 	{ "name": "curOptPotentialPlacement_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "address0" }} , 
 	{ "name": "curOptPotentialPlacement_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "ce0" }} , 
 	{ "name": "curOptPotentialPlacement_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "we0" }} , 
 	{ "name": "curOptPotentialPlacement_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	dynamic_placement_routing_Pipeline_VITIS_LOOP_415_5 {
		curOptPotentialPlacement_wrAddr_load_1 {Type I LastRead 0 FirstWrite -1}
		add_ln415 {Type I LastRead 0 FirstWrite -1}
		tmp_19 {Type I LastRead 0 FirstWrite -1}
		allocated_tiles_levels_dynamic_shapes_values {Type I LastRead 0 FirstWrite -1}
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
	curOptPotentialPlacement_wrAddr_load_1 { ap_none {  { curOptPotentialPlacement_wrAddr_load_1 in_data 0 8 } } }
	add_ln415 { ap_none {  { add_ln415 in_data 0 8 } } }
	tmp_19 { ap_none {  { tmp_19 in_data 0 60 } } }
	allocated_tiles_levels_dynamic_shapes_values { ap_memory {  { allocated_tiles_levels_dynamic_shapes_values_address0 mem_address 1 11 }  { allocated_tiles_levels_dynamic_shapes_values_ce0 mem_ce 1 1 }  { allocated_tiles_levels_dynamic_shapes_values_q0 in_data 0 4 } } }
	curOptPotentialPlacement { ap_memory {  { curOptPotentialPlacement_address0 mem_address 1 4 }  { curOptPotentialPlacement_ce0 mem_ce 1 1 }  { curOptPotentialPlacement_we0 mem_we 1 1 }  { curOptPotentialPlacement_d0 mem_din 1 5 } } }
}
