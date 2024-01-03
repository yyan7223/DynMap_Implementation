set moduleName RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_127_1
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
set C_modelName {RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_127_1}
set C_modelType { int 1 }
set C_modelArgList {
	{ bypassOpt_load int 8 regular  }
	{ phi_ln127_out int 7 regular {pointer 1}  }
	{ trunc_ln127_2_cast_out int 7 regular {pointer 1}  }
	{ placement_dynamic_dict_Opt2Tile_keys int 8 regular {array 100 { 1 3 } 1 1 } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "bypassOpt_load", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "phi_ln127_out", "interface" : "wire", "bitwidth" : 7, "direction" : "WRITEONLY"} , 
 	{ "Name" : "trunc_ln127_2_cast_out", "interface" : "wire", "bitwidth" : 7, "direction" : "WRITEONLY"} , 
 	{ "Name" : "placement_dynamic_dict_Opt2Tile_keys", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 15
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ bypassOpt_load sc_in sc_lv 8 signal 0 } 
	{ phi_ln127_out sc_out sc_lv 7 signal 1 } 
	{ phi_ln127_out_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ trunc_ln127_2_cast_out sc_out sc_lv 7 signal 2 } 
	{ trunc_ln127_2_cast_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ placement_dynamic_dict_Opt2Tile_keys_address0 sc_out sc_lv 7 signal 3 } 
	{ placement_dynamic_dict_Opt2Tile_keys_ce0 sc_out sc_logic 1 signal 3 } 
	{ placement_dynamic_dict_Opt2Tile_keys_q0 sc_in sc_lv 8 signal 3 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "bypassOpt_load", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassOpt_load", "role": "default" }} , 
 	{ "name": "phi_ln127_out", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "phi_ln127_out", "role": "default" }} , 
 	{ "name": "phi_ln127_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "phi_ln127_out", "role": "ap_vld" }} , 
 	{ "name": "trunc_ln127_2_cast_out", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "trunc_ln127_2_cast_out", "role": "default" }} , 
 	{ "name": "trunc_ln127_2_cast_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "trunc_ln127_2_cast_out", "role": "ap_vld" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "address0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "q0" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]}]}


set ArgLastReadFirstWriteLatency {
	RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_127_1 {
		bypassOpt_load {Type I LastRead 0 FirstWrite -1}
		phi_ln127_out {Type O LastRead -1 FirstWrite 2}
		trunc_ln127_2_cast_out {Type O LastRead -1 FirstWrite 2}
		placement_dynamic_dict_Opt2Tile_keys {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5", "Max" : "204"}
	, {"Name" : "Interval", "Min" : "5", "Max" : "204"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	bypassOpt_load { ap_none {  { bypassOpt_load in_data 0 8 } } }
	phi_ln127_out { ap_vld {  { phi_ln127_out out_data 1 7 }  { phi_ln127_out_ap_vld out_vld 1 1 } } }
	trunc_ln127_2_cast_out { ap_vld {  { trunc_ln127_2_cast_out out_data 1 7 }  { trunc_ln127_2_cast_out_ap_vld out_vld 1 1 } } }
	placement_dynamic_dict_Opt2Tile_keys { ap_memory {  { placement_dynamic_dict_Opt2Tile_keys_address0 mem_address 1 7 }  { placement_dynamic_dict_Opt2Tile_keys_ce0 mem_ce 1 1 }  { placement_dynamic_dict_Opt2Tile_keys_q0 in_data 0 8 } } }
}
