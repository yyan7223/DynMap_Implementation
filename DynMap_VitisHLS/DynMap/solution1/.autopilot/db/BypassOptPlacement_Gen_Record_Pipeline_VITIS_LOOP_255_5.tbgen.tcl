set moduleName BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_255_5
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
set C_modelName {BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_255_5}
set C_modelType { void 0 }
set C_modelArgList {
	{ idxprom190 int 8 regular  }
	{ tileId int 4 regular  }
	{ tmp_73_out int 14 regular {pointer 1}  }
	{ placement_dynamic_bypass int 8 regular {array 12800 { 1 3 } 1 1 } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "idxprom190", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "tileId", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "tmp_73_out", "interface" : "wire", "bitwidth" : 14, "direction" : "WRITEONLY"} , 
 	{ "Name" : "placement_dynamic_bypass", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ idxprom190 sc_in sc_lv 8 signal 0 } 
	{ tileId sc_in sc_lv 4 signal 1 } 
	{ tmp_73_out sc_out sc_lv 14 signal 2 } 
	{ tmp_73_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ placement_dynamic_bypass_address0 sc_out sc_lv 14 signal 3 } 
	{ placement_dynamic_bypass_ce0 sc_out sc_logic 1 signal 3 } 
	{ placement_dynamic_bypass_q0 sc_in sc_lv 8 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "idxprom190", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "idxprom190", "role": "default" }} , 
 	{ "name": "tileId", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "tileId", "role": "default" }} , 
 	{ "name": "tmp_73_out", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "tmp_73_out", "role": "default" }} , 
 	{ "name": "tmp_73_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "tmp_73_out", "role": "ap_vld" }} , 
 	{ "name": "placement_dynamic_bypass_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "placement_dynamic_bypass", "role": "address0" }} , 
 	{ "name": "placement_dynamic_bypass_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_bypass_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_bypass", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_255_5",
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
			{"Name" : "idxprom190", "Type" : "None", "Direction" : "I"},
			{"Name" : "tileId", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_73_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "placement_dynamic_bypass", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_255_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_255_5 {
		idxprom190 {Type I LastRead 0 FirstWrite -1}
		tileId {Type I LastRead 0 FirstWrite -1}
		tmp_73_out {Type O LastRead -1 FirstWrite 2}
		placement_dynamic_bypass {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	idxprom190 { ap_none {  { idxprom190 in_data 0 8 } } }
	tileId { ap_none {  { tileId in_data 0 4 } } }
	tmp_73_out { ap_vld {  { tmp_73_out out_data 1 14 }  { tmp_73_out_ap_vld out_vld 1 1 } } }
	placement_dynamic_bypass { ap_memory {  { placement_dynamic_bypass_address0 mem_address 1 14 }  { placement_dynamic_bypass_ce0 mem_ce 1 1 }  { placement_dynamic_bypass_q0 in_data 0 8 } } }
}
