set moduleName Reset_Pipeline_VITIS_LOOP_722_19_VITIS_LOOP_724_20
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
set C_modelName {Reset_Pipeline_VITIS_LOOP_722_19_VITIS_LOOP_724_20}
set C_modelType { void 0 }
set C_modelArgList {
	{ add_ln722 int 10 regular  }
	{ mul_ln725 int 10 regular  }
	{ dependency_predecessor_values int 8 regular {array 1000 { 0 3 } 0 1 } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "add_ln722", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln725", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "dependency_predecessor_values", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 12
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ add_ln722 sc_in sc_lv 10 signal 0 } 
	{ mul_ln725 sc_in sc_lv 10 signal 1 } 
	{ dependency_predecessor_values_address0 sc_out sc_lv 10 signal 2 } 
	{ dependency_predecessor_values_ce0 sc_out sc_logic 1 signal 2 } 
	{ dependency_predecessor_values_we0 sc_out sc_logic 1 signal 2 } 
	{ dependency_predecessor_values_d0 sc_out sc_lv 8 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "add_ln722", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "add_ln722", "role": "default" }} , 
 	{ "name": "mul_ln725", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "mul_ln725", "role": "default" }} , 
 	{ "name": "dependency_predecessor_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "address0" }} , 
 	{ "name": "dependency_predecessor_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "ce0" }} , 
 	{ "name": "dependency_predecessor_values_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "we0" }} , 
 	{ "name": "dependency_predecessor_values_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "Reset_Pipeline_VITIS_LOOP_722_19_VITIS_LOOP_724_20",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "174", "EstimateLatencyMax" : "424",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln722", "Type" : "None", "Direction" : "I"},
			{"Name" : "mul_ln725", "Type" : "None", "Direction" : "I"},
			{"Name" : "dependency_predecessors_kernels_values1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_722_19_VITIS_LOOP_724_20", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dependency_predecessors_kernels_values1_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Reset_Pipeline_VITIS_LOOP_722_19_VITIS_LOOP_724_20 {
		add_ln722 {Type I LastRead 0 FirstWrite -1}
		mul_ln725 {Type I LastRead 0 FirstWrite -1}
		dependency_predecessors_kernels_values1 {Type I LastRead -1 FirstWrite -1}
		dependency_predecessor_values {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "174", "Max" : "424"}
	, {"Name" : "Interval", "Min" : "174", "Max" : "424"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	add_ln722 { ap_none {  { add_ln722 in_data 0 10 } } }
	mul_ln725 { ap_none {  { mul_ln725 in_data 0 10 } } }
	dependency_predecessor_values { ap_memory {  { dependency_predecessor_values_address0 mem_address 1 10 }  { dependency_predecessor_values_ce0 mem_ce 1 1 }  { dependency_predecessor_values_we0 mem_we 1 1 }  { dependency_predecessor_values_d0 mem_din 1 8 } } }
}
