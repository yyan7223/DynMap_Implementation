set moduleName CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_508_10
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
set C_modelName {CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_508_10}
set C_modelType { void 0 }
set C_modelArgList {
	{ inc1313173_reload int 7 regular  }
	{ intersection int 4 regular {array 16 { 1 3 } 1 1 }  }
	{ curOptPotentialPlacement int 5 regular {array 16 { 0 3 } 0 1 } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "inc1313173_reload", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "intersection", "interface" : "memory", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "curOptPotentialPlacement", "interface" : "memory", "bitwidth" : 5, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ inc1313173_reload sc_in sc_lv 7 signal 0 } 
	{ intersection_address0 sc_out sc_lv 4 signal 1 } 
	{ intersection_ce0 sc_out sc_logic 1 signal 1 } 
	{ intersection_q0 sc_in sc_lv 4 signal 1 } 
	{ curOptPotentialPlacement_address0 sc_out sc_lv 4 signal 2 } 
	{ curOptPotentialPlacement_ce0 sc_out sc_logic 1 signal 2 } 
	{ curOptPotentialPlacement_we0 sc_out sc_logic 1 signal 2 } 
	{ curOptPotentialPlacement_d0 sc_out sc_lv 5 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "inc1313173_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "inc1313173_reload", "role": "default" }} , 
 	{ "name": "intersection_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "intersection", "role": "address0" }} , 
 	{ "name": "intersection_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "intersection", "role": "ce0" }} , 
 	{ "name": "intersection_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "intersection", "role": "q0" }} , 
 	{ "name": "curOptPotentialPlacement_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "address0" }} , 
 	{ "name": "curOptPotentialPlacement_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "ce0" }} , 
 	{ "name": "curOptPotentialPlacement_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "we0" }} , 
 	{ "name": "curOptPotentialPlacement_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "curOptPotentialPlacement", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_508_10 {
		inc1313173_reload {Type I LastRead 0 FirstWrite -1}
		intersection {Type I LastRead 0 FirstWrite -1}
		curOptPotentialPlacement {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "129"}
	, {"Name" : "Interval", "Min" : "3", "Max" : "129"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	inc1313173_reload { ap_none {  { inc1313173_reload in_data 0 7 } } }
	intersection { ap_memory {  { intersection_address0 mem_address 1 4 }  { intersection_ce0 mem_ce 1 1 }  { intersection_q0 in_data 0 4 } } }
	curOptPotentialPlacement { ap_memory {  { curOptPotentialPlacement_address0 mem_address 1 4 }  { curOptPotentialPlacement_ce0 mem_ce 1 1 }  { curOptPotentialPlacement_we0 mem_we 1 1 }  { curOptPotentialPlacement_d0 mem_din 1 5 } } }
}
