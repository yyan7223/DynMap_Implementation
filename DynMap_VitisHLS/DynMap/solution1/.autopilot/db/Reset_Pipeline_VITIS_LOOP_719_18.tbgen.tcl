set moduleName Reset_Pipeline_VITIS_LOOP_719_18
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
set C_modelName {Reset_Pipeline_VITIS_LOOP_719_18}
set C_modelType { void 0 }
set C_modelArgList {
	{ DFG_NodesCount_kernels_values_load int 6 regular  }
	{ mul_ln727 int 10 regular  }
	{ placement_dynamic_dict_Opt2PC_keys int 8 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ placement_dynamic_dict_Opt2Tile_keys int 8 regular {array 100 { 0 3 } 0 1 } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "DFG_NodesCount_kernels_values_load", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln727", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "placement_dynamic_dict_Opt2PC_keys", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_dict_Opt2Tile_keys", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ DFG_NodesCount_kernels_values_load sc_in sc_lv 6 signal 0 } 
	{ mul_ln727 sc_in sc_lv 10 signal 1 } 
	{ placement_dynamic_dict_Opt2PC_keys_address0 sc_out sc_lv 7 signal 2 } 
	{ placement_dynamic_dict_Opt2PC_keys_ce0 sc_out sc_logic 1 signal 2 } 
	{ placement_dynamic_dict_Opt2PC_keys_we0 sc_out sc_logic 1 signal 2 } 
	{ placement_dynamic_dict_Opt2PC_keys_d0 sc_out sc_lv 8 signal 2 } 
	{ placement_dynamic_dict_Opt2Tile_keys_address0 sc_out sc_lv 7 signal 3 } 
	{ placement_dynamic_dict_Opt2Tile_keys_ce0 sc_out sc_logic 1 signal 3 } 
	{ placement_dynamic_dict_Opt2Tile_keys_we0 sc_out sc_logic 1 signal 3 } 
	{ placement_dynamic_dict_Opt2Tile_keys_d0 sc_out sc_lv 8 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "DFG_NodesCount_kernels_values_load", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "DFG_NodesCount_kernels_values_load", "role": "default" }} , 
 	{ "name": "mul_ln727", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "mul_ln727", "role": "default" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "address0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "we0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2PC_keys_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2PC_keys", "role": "d0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "address0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "we0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_719_18",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "19", "EstimateLatencyMax" : "44",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "DFG_NodesCount_kernels_values_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "mul_ln727", "Type" : "None", "Direction" : "I"},
			{"Name" : "placement_static_kernels_values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "placement_dynamic_dict_Opt2PC_keys", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_719_18", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.placement_static_kernels_values_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Reset_Pipeline_VITIS_LOOP_719_18 {
		DFG_NodesCount_kernels_values_load {Type I LastRead 0 FirstWrite -1}
		mul_ln727 {Type I LastRead 0 FirstWrite -1}
		placement_static_kernels_values {Type I LastRead -1 FirstWrite -1}
		placement_dynamic_dict_Opt2PC_keys {Type O LastRead -1 FirstWrite 1}
		placement_dynamic_dict_Opt2Tile_keys {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "19", "Max" : "44"}
	, {"Name" : "Interval", "Min" : "19", "Max" : "44"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	DFG_NodesCount_kernels_values_load { ap_none {  { DFG_NodesCount_kernels_values_load in_data 0 6 } } }
	mul_ln727 { ap_none {  { mul_ln727 in_data 0 10 } } }
	placement_dynamic_dict_Opt2PC_keys { ap_memory {  { placement_dynamic_dict_Opt2PC_keys_address0 mem_address 1 7 }  { placement_dynamic_dict_Opt2PC_keys_ce0 mem_ce 1 1 }  { placement_dynamic_dict_Opt2PC_keys_we0 mem_we 1 1 }  { placement_dynamic_dict_Opt2PC_keys_d0 mem_din 1 8 } } }
	placement_dynamic_dict_Opt2Tile_keys { ap_memory {  { placement_dynamic_dict_Opt2Tile_keys_address0 mem_address 1 7 }  { placement_dynamic_dict_Opt2Tile_keys_ce0 mem_ce 1 1 }  { placement_dynamic_dict_Opt2Tile_keys_we0 mem_we 1 1 }  { placement_dynamic_dict_Opt2Tile_keys_d0 mem_din 1 8 } } }
}
