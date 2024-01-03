set moduleName CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_497_8_VITIS_LOOP_498_9
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
set C_modelName {CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_497_8_VITIS_LOOP_498_9}
set C_modelType { void 0 }
set C_modelArgList {
	{ conv115123_in int 8 regular  }
	{ mul_ln497 int 15 regular  }
	{ potentialPlacement_AllPreds int 4 regular {array 160 { 1 1 } 1 1 }  }
	{ intersection int 4 regular {array 16 { 0 3 } 0 1 }  }
	{ hasItst_out int 1 regular {pointer 1}  }
	{ inc1313173_out int 8 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "conv115123_in", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln497", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "potentialPlacement_AllPreds", "interface" : "memory", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "intersection", "interface" : "memory", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "hasItst_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inc1313173_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ conv115123_in sc_in sc_lv 8 signal 0 } 
	{ mul_ln497 sc_in sc_lv 15 signal 1 } 
	{ potentialPlacement_AllPreds_address0 sc_out sc_lv 8 signal 2 } 
	{ potentialPlacement_AllPreds_ce0 sc_out sc_logic 1 signal 2 } 
	{ potentialPlacement_AllPreds_q0 sc_in sc_lv 4 signal 2 } 
	{ potentialPlacement_AllPreds_address1 sc_out sc_lv 8 signal 2 } 
	{ potentialPlacement_AllPreds_ce1 sc_out sc_logic 1 signal 2 } 
	{ potentialPlacement_AllPreds_q1 sc_in sc_lv 4 signal 2 } 
	{ intersection_address0 sc_out sc_lv 4 signal 3 } 
	{ intersection_ce0 sc_out sc_logic 1 signal 3 } 
	{ intersection_we0 sc_out sc_logic 1 signal 3 } 
	{ intersection_d0 sc_out sc_lv 4 signal 3 } 
	{ hasItst_out sc_out sc_lv 1 signal 4 } 
	{ hasItst_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ inc1313173_out sc_out sc_lv 8 signal 5 } 
	{ inc1313173_out_ap_vld sc_out sc_logic 1 outvld 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "conv115123_in", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "conv115123_in", "role": "default" }} , 
 	{ "name": "mul_ln497", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "mul_ln497", "role": "default" }} , 
 	{ "name": "potentialPlacement_AllPreds_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "potentialPlacement_AllPreds", "role": "address0" }} , 
 	{ "name": "potentialPlacement_AllPreds_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "potentialPlacement_AllPreds", "role": "ce0" }} , 
 	{ "name": "potentialPlacement_AllPreds_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "potentialPlacement_AllPreds", "role": "q0" }} , 
 	{ "name": "potentialPlacement_AllPreds_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "potentialPlacement_AllPreds", "role": "address1" }} , 
 	{ "name": "potentialPlacement_AllPreds_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "potentialPlacement_AllPreds", "role": "ce1" }} , 
 	{ "name": "potentialPlacement_AllPreds_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "potentialPlacement_AllPreds", "role": "q1" }} , 
 	{ "name": "intersection_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "intersection", "role": "address0" }} , 
 	{ "name": "intersection_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "intersection", "role": "ce0" }} , 
 	{ "name": "intersection_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "intersection", "role": "we0" }} , 
 	{ "name": "intersection_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "intersection", "role": "d0" }} , 
 	{ "name": "hasItst_out", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "hasItst_out", "role": "default" }} , 
 	{ "name": "hasItst_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "hasItst_out", "role": "ap_vld" }} , 
 	{ "name": "inc1313173_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inc1313173_out", "role": "default" }} , 
 	{ "name": "inc1313173_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inc1313173_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_497_8_VITIS_LOOP_498_9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "16131",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "conv115123_in", "Type" : "None", "Direction" : "I"},
			{"Name" : "mul_ln497", "Type" : "None", "Direction" : "I"},
			{"Name" : "potentialPlacement_AllPreds", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "intersection", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "hasItst_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inc1313173_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_497_8_VITIS_LOOP_498_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_497_8_VITIS_LOOP_498_9 {
		conv115123_in {Type I LastRead 0 FirstWrite -1}
		mul_ln497 {Type I LastRead 0 FirstWrite -1}
		potentialPlacement_AllPreds {Type I LastRead 1 FirstWrite -1}
		intersection {Type O LastRead -1 FirstWrite 1}
		hasItst_out {Type O LastRead -1 FirstWrite 0}
		inc1313173_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "16131"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "16131"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	conv115123_in { ap_none {  { conv115123_in in_data 0 8 } } }
	mul_ln497 { ap_none {  { mul_ln497 in_data 0 15 } } }
	potentialPlacement_AllPreds { ap_memory {  { potentialPlacement_AllPreds_address0 mem_address 1 8 }  { potentialPlacement_AllPreds_ce0 mem_ce 1 1 }  { potentialPlacement_AllPreds_q0 in_data 0 4 }  { potentialPlacement_AllPreds_address1 MemPortADDR2 1 8 }  { potentialPlacement_AllPreds_ce1 MemPortCE2 1 1 }  { potentialPlacement_AllPreds_q1 in_data 0 4 } } }
	intersection { ap_memory {  { intersection_address0 mem_address 1 4 }  { intersection_ce0 mem_ce 1 1 }  { intersection_we0 mem_we 1 1 }  { intersection_d0 mem_din 1 4 } } }
	hasItst_out { ap_vld {  { hasItst_out out_data 1 1 }  { hasItst_out_ap_vld out_vld 1 1 } } }
	inc1313173_out { ap_vld {  { inc1313173_out out_data 1 8 }  { inc1313173_out_ap_vld out_vld 1 1 } } }
}
