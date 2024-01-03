set moduleName dynamic_placement_routing_Pipeline_VITIS_LOOP_611_4
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
set C_modelName {dynamic_placement_routing_Pipeline_VITIS_LOOP_611_4}
set C_modelType { void 0 }
set C_modelArgList {
	{ DFG_NodesCount_kernels_values_load int 6 regular  }
	{ mul_ln374 int 10 regular  }
	{ pred_r int 8 regular  }
	{ inc311623_out int 6 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "DFG_NodesCount_kernels_values_load", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln374", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "pred_r", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "inc311623_out", "interface" : "wire", "bitwidth" : 6, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 11
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ DFG_NodesCount_kernels_values_load sc_in sc_lv 6 signal 0 } 
	{ mul_ln374 sc_in sc_lv 10 signal 1 } 
	{ pred_r sc_in sc_lv 8 signal 2 } 
	{ inc311623_out sc_out sc_lv 6 signal 3 } 
	{ inc311623_out_ap_vld sc_out sc_logic 1 outvld 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "DFG_NodesCount_kernels_values_load", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "DFG_NodesCount_kernels_values_load", "role": "default" }} , 
 	{ "name": "mul_ln374", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "mul_ln374", "role": "default" }} , 
 	{ "name": "pred_r", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pred_r", "role": "default" }} , 
 	{ "name": "inc311623_out", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "inc311623_out", "role": "default" }} , 
 	{ "name": "inc311623_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inc311623_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.placement_static_kernels_values_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	dynamic_placement_routing_Pipeline_VITIS_LOOP_611_4 {
		DFG_NodesCount_kernels_values_load {Type I LastRead 0 FirstWrite -1}
		mul_ln374 {Type I LastRead 0 FirstWrite -1}
		pred_r {Type I LastRead 0 FirstWrite -1}
		inc311623_out {Type O LastRead -1 FirstWrite 2}
		placement_static_kernels_values {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	DFG_NodesCount_kernels_values_load { ap_none {  { DFG_NodesCount_kernels_values_load in_data 0 6 } } }
	mul_ln374 { ap_none {  { mul_ln374 in_data 0 10 } } }
	pred_r { ap_none {  { pred_r in_data 0 8 } } }
	inc311623_out { ap_vld {  { inc311623_out out_data 1 6 }  { inc311623_out_ap_vld out_vld 1 1 } } }
}
