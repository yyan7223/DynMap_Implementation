set moduleName Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_102_7
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
set C_modelName {Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_102_7}
set C_modelType { int 1 }
set C_modelArgList {
	{ add_ln103 int 11 regular  }
	{ add_ln103_1_out int 11 regular {pointer 1}  }
	{ dependency_successor_values int 8 regular {array 2000 { 1 3 } 1 1 } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "add_ln103", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln103_1_out", "interface" : "wire", "bitwidth" : 11, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dependency_successor_values", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ add_ln103 sc_in sc_lv 11 signal 0 } 
	{ add_ln103_1_out sc_out sc_lv 11 signal 1 } 
	{ add_ln103_1_out_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ dependency_successor_values_address0 sc_out sc_lv 11 signal 2 } 
	{ dependency_successor_values_ce0 sc_out sc_logic 1 signal 2 } 
	{ dependency_successor_values_q0 sc_in sc_lv 8 signal 2 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "add_ln103", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "add_ln103", "role": "default" }} , 
 	{ "name": "add_ln103_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "add_ln103_1_out", "role": "default" }} , 
 	{ "name": "add_ln103_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "add_ln103_1_out", "role": "ap_vld" }} , 
 	{ "name": "dependency_successor_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "dependency_successor_values", "role": "address0" }} , 
 	{ "name": "dependency_successor_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_successor_values", "role": "ce0" }} , 
 	{ "name": "dependency_successor_values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dependency_successor_values", "role": "q0" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]}]}


set ArgLastReadFirstWriteLatency {
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_102_7 {
		add_ln103 {Type I LastRead 0 FirstWrite -1}
		add_ln103_1_out {Type O LastRead -1 FirstWrite 3}
		dependency_successor_values {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5", "Max" : "44"}
	, {"Name" : "Interval", "Min" : "5", "Max" : "44"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	add_ln103 { ap_none {  { add_ln103 in_data 0 11 } } }
	add_ln103_1_out { ap_vld {  { add_ln103_1_out out_data 1 11 }  { add_ln103_1_out_ap_vld out_vld 1 1 } } }
	dependency_successor_values { ap_memory {  { dependency_successor_values_address0 mem_address 1 11 }  { dependency_successor_values_ce0 mem_ce 1 1 }  { dependency_successor_values_q0 in_data 0 8 } } }
}
