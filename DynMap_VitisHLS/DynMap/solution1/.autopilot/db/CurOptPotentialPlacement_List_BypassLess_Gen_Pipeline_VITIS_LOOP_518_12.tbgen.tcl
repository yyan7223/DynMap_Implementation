set moduleName CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_518_12
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
set C_modelName {CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_518_12}
set C_modelType { int 1 }
set C_modelArgList {
	{ existLen_1 int 7 regular  }
	{ intersection int 4 regular {array 16 { 1 3 } 1 1 }  }
	{ allocated_tiles_shapes_values_load_2 int 4 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "existLen_1", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "intersection", "interface" : "memory", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "allocated_tiles_shapes_values_load_2", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 12
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ existLen_1 sc_in sc_lv 7 signal 0 } 
	{ intersection_address0 sc_out sc_lv 4 signal 1 } 
	{ intersection_ce0 sc_out sc_logic 1 signal 1 } 
	{ intersection_q0 sc_in sc_lv 4 signal 1 } 
	{ allocated_tiles_shapes_values_load_2 sc_in sc_lv 4 signal 2 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "existLen_1", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "existLen_1", "role": "default" }} , 
 	{ "name": "intersection_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "intersection", "role": "address0" }} , 
 	{ "name": "intersection_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "intersection", "role": "ce0" }} , 
 	{ "name": "intersection_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "intersection", "role": "q0" }} , 
 	{ "name": "allocated_tiles_shapes_values_load_2", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "allocated_tiles_shapes_values_load_2", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_518_12 {
		existLen_1 {Type I LastRead 0 FirstWrite -1}
		intersection {Type I LastRead 0 FirstWrite -1}
		allocated_tiles_shapes_values_load_2 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	existLen_1 { ap_none {  { existLen_1 in_data 0 7 } } }
	intersection { ap_memory {  { intersection_address0 mem_address 1 4 }  { intersection_ce0 mem_ce 1 1 }  { intersection_q0 in_data 0 4 } } }
	allocated_tiles_shapes_values_load_2 { ap_none {  { allocated_tiles_shapes_values_load_2 in_data 0 4 } } }
}
