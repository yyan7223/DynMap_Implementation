set moduleName RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_354_4
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
set C_modelName {RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_354_4}
set C_modelType { int 1 }
set C_modelArgList {
	{ idxprom60 int 5 regular  }
	{ DynamicPlacement_II_load_2 int 8 regular  }
	{ upperLimit_1 int 8 regular  }
	{ add_ln356_out int 11 regular {pointer 1}  }
	{ IDX_pd_load_1_out int 8 regular {pointer 1}  }
	{ IDX_pd_modulo int 7 regular {pointer 2} {global 2}  }
	{ placement_dynamic_occupy int 1 regular {array 1600 { 1 3 } 1 1 } {global 0}  }
	{ IDX_pd int 8 regular {pointer 2} {global 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "idxprom60", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "DynamicPlacement_II_load_2", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "upperLimit_1", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln356_out", "interface" : "wire", "bitwidth" : 11, "direction" : "WRITEONLY"} , 
 	{ "Name" : "IDX_pd_load_1_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "IDX_pd_modulo", "interface" : "wire", "bitwidth" : 7, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_occupy", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "IDX_pd", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 23
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ idxprom60 sc_in sc_lv 5 signal 0 } 
	{ DynamicPlacement_II_load_2 sc_in sc_lv 8 signal 1 } 
	{ upperLimit_1 sc_in sc_lv 8 signal 2 } 
	{ add_ln356_out sc_out sc_lv 11 signal 3 } 
	{ add_ln356_out_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ IDX_pd_load_1_out sc_out sc_lv 8 signal 4 } 
	{ IDX_pd_load_1_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ IDX_pd_modulo_i sc_in sc_lv 7 signal 5 } 
	{ IDX_pd_modulo_o sc_out sc_lv 7 signal 5 } 
	{ IDX_pd_modulo_o_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ placement_dynamic_occupy_address0 sc_out sc_lv 11 signal 6 } 
	{ placement_dynamic_occupy_ce0 sc_out sc_logic 1 signal 6 } 
	{ placement_dynamic_occupy_q0 sc_in sc_lv 1 signal 6 } 
	{ IDX_pd_i sc_in sc_lv 8 signal 7 } 
	{ IDX_pd_o sc_out sc_lv 8 signal 7 } 
	{ IDX_pd_o_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "idxprom60", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "idxprom60", "role": "default" }} , 
 	{ "name": "DynamicPlacement_II_load_2", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "DynamicPlacement_II_load_2", "role": "default" }} , 
 	{ "name": "upperLimit_1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "upperLimit_1", "role": "default" }} , 
 	{ "name": "add_ln356_out", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "add_ln356_out", "role": "default" }} , 
 	{ "name": "add_ln356_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "add_ln356_out", "role": "ap_vld" }} , 
 	{ "name": "IDX_pd_load_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "IDX_pd_load_1_out", "role": "default" }} , 
 	{ "name": "IDX_pd_load_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "IDX_pd_load_1_out", "role": "ap_vld" }} , 
 	{ "name": "IDX_pd_modulo_i", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "IDX_pd_modulo", "role": "i" }} , 
 	{ "name": "IDX_pd_modulo_o", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "IDX_pd_modulo", "role": "o" }} , 
 	{ "name": "IDX_pd_modulo_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "IDX_pd_modulo", "role": "o_ap_vld" }} , 
 	{ "name": "placement_dynamic_occupy_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "placement_dynamic_occupy", "role": "address0" }} , 
 	{ "name": "placement_dynamic_occupy_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_occupy", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_occupy_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_occupy", "role": "q0" }} , 
 	{ "name": "IDX_pd_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "IDX_pd", "role": "i" }} , 
 	{ "name": "IDX_pd_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "IDX_pd", "role": "o" }} , 
 	{ "name": "IDX_pd_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "IDX_pd", "role": "o_ap_vld" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_354_4",
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
			{"Name" : "idxprom60", "Type" : "None", "Direction" : "I"},
			{"Name" : "DynamicPlacement_II_load_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "upperLimit_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln356_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "IDX_pd_load_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "IDX_pd_modulo", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "placement_dynamic_occupy", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "IDX_pd", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_354_4", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "15", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "PreState" : ["ap_ST_fsm_state1"], "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "PostState" : ["ap_ST_fsm_state15", "ap_ST_fsm_state16"]}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_8ns_8ns_7_12_1_U249", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	RoutingAvailability_CheckPredecessor_and_Placement_Pipeline_VITIS_LOOP_354_4 {
		idxprom60 {Type I LastRead 0 FirstWrite -1}
		DynamicPlacement_II_load_2 {Type I LastRead 0 FirstWrite -1}
		upperLimit_1 {Type I LastRead 0 FirstWrite -1}
		add_ln356_out {Type O LastRead -1 FirstWrite 3}
		IDX_pd_load_1_out {Type O LastRead -1 FirstWrite 3}
		IDX_pd_modulo {Type IO LastRead 1 FirstWrite 13}
		placement_dynamic_occupy {Type I LastRead 1 FirstWrite -1}
		IDX_pd {Type IO LastRead 2 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	idxprom60 { ap_none {  { idxprom60 in_data 0 5 } } }
	DynamicPlacement_II_load_2 { ap_none {  { DynamicPlacement_II_load_2 in_data 0 8 } } }
	upperLimit_1 { ap_none {  { upperLimit_1 in_data 0 8 } } }
	add_ln356_out { ap_vld {  { add_ln356_out out_data 1 11 }  { add_ln356_out_ap_vld out_vld 1 1 } } }
	IDX_pd_load_1_out { ap_vld {  { IDX_pd_load_1_out out_data 1 8 }  { IDX_pd_load_1_out_ap_vld out_vld 1 1 } } }
	IDX_pd_modulo { ap_ovld {  { IDX_pd_modulo_i in_data 0 7 }  { IDX_pd_modulo_o out_data 1 7 }  { IDX_pd_modulo_o_ap_vld out_vld 1 1 } } }
	placement_dynamic_occupy { ap_memory {  { placement_dynamic_occupy_address0 mem_address 1 11 }  { placement_dynamic_occupy_ce0 mem_ce 1 1 }  { placement_dynamic_occupy_q0 in_data 0 1 } } }
	IDX_pd { ap_ovld {  { IDX_pd_i in_data 0 8 }  { IDX_pd_o out_data 1 8 }  { IDX_pd_o_ap_vld out_vld 1 1 } } }
}
