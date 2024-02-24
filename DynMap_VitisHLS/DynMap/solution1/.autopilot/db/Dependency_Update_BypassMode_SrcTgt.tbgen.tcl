set moduleName Dependency_Update_BypassMode_SrcTgt
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
set C_modelName {Dependency_Update_BypassMode_SrcTgt}
set C_modelType { void 0 }
set C_modelArgList {
	{ bypassOpt int 8 regular {pointer 0} {global 0}  }
	{ placement_dynamic_dict_Opt2Tile_keys int 8 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ dependency_forward int 1 regular {pointer 0} {global 0}  }
	{ bypassSrcOpt_keyIdx int 7 regular {pointer 0} {global 0}  }
	{ bypassTgtOpt int 7 regular {pointer 0} {global 0}  }
	{ bypassSrcOpt int 8 regular {pointer 0} {global 0}  }
	{ bypassTgtOpt_keyIdx int 7 regular {pointer 0} {global 0}  }
	{ dependency_successor_values int 8 regular {array 2000 { 2 3 } 1 1 } {global 2}  }
	{ dependency_predecessor_values int 8 regular {array 1000 { 2 3 } 1 1 } {global 2}  }
	{ dependency_backward int 1 regular {pointer 0} {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "bypassOpt", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "placement_dynamic_dict_Opt2Tile_keys", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "dependency_forward", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bypassSrcOpt_keyIdx", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bypassTgtOpt", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bypassSrcOpt", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bypassTgtOpt_keyIdx", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "dependency_successor_values", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dependency_predecessor_values", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dependency_backward", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ bypassOpt sc_in sc_lv 8 signal 0 } 
	{ placement_dynamic_dict_Opt2Tile_keys_address0 sc_out sc_lv 7 signal 1 } 
	{ placement_dynamic_dict_Opt2Tile_keys_ce0 sc_out sc_logic 1 signal 1 } 
	{ placement_dynamic_dict_Opt2Tile_keys_q0 sc_in sc_lv 8 signal 1 } 
	{ dependency_forward sc_in sc_lv 1 signal 2 } 
	{ bypassSrcOpt_keyIdx sc_in sc_lv 7 signal 3 } 
	{ bypassTgtOpt sc_in sc_lv 7 signal 4 } 
	{ bypassSrcOpt sc_in sc_lv 8 signal 5 } 
	{ bypassTgtOpt_keyIdx sc_in sc_lv 7 signal 6 } 
	{ dependency_successor_values_address0 sc_out sc_lv 11 signal 7 } 
	{ dependency_successor_values_ce0 sc_out sc_logic 1 signal 7 } 
	{ dependency_successor_values_we0 sc_out sc_logic 1 signal 7 } 
	{ dependency_successor_values_d0 sc_out sc_lv 8 signal 7 } 
	{ dependency_successor_values_q0 sc_in sc_lv 8 signal 7 } 
	{ dependency_predecessor_values_address0 sc_out sc_lv 10 signal 8 } 
	{ dependency_predecessor_values_ce0 sc_out sc_logic 1 signal 8 } 
	{ dependency_predecessor_values_we0 sc_out sc_logic 1 signal 8 } 
	{ dependency_predecessor_values_d0 sc_out sc_lv 8 signal 8 } 
	{ dependency_predecessor_values_q0 sc_in sc_lv 8 signal 8 } 
	{ dependency_backward sc_in sc_lv 1 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "bypassOpt", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassOpt", "role": "default" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "address0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_dict_Opt2Tile_keys_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "placement_dynamic_dict_Opt2Tile_keys", "role": "q0" }} , 
 	{ "name": "dependency_forward", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_forward", "role": "default" }} , 
 	{ "name": "bypassSrcOpt_keyIdx", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "bypassSrcOpt_keyIdx", "role": "default" }} , 
 	{ "name": "bypassTgtOpt", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "bypassTgtOpt", "role": "default" }} , 
 	{ "name": "bypassSrcOpt", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bypassSrcOpt", "role": "default" }} , 
 	{ "name": "bypassTgtOpt_keyIdx", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "bypassTgtOpt_keyIdx", "role": "default" }} , 
 	{ "name": "dependency_successor_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "dependency_successor_values", "role": "address0" }} , 
 	{ "name": "dependency_successor_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_successor_values", "role": "ce0" }} , 
 	{ "name": "dependency_successor_values_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_successor_values", "role": "we0" }} , 
 	{ "name": "dependency_successor_values_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dependency_successor_values", "role": "d0" }} , 
 	{ "name": "dependency_successor_values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dependency_successor_values", "role": "q0" }} , 
 	{ "name": "dependency_predecessor_values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "address0" }} , 
 	{ "name": "dependency_predecessor_values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "ce0" }} , 
 	{ "name": "dependency_predecessor_values_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "we0" }} , 
 	{ "name": "dependency_predecessor_values_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "d0" }} , 
 	{ "name": "dependency_predecessor_values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dependency_predecessor_values", "role": "q0" }} , 
 	{ "name": "dependency_backward", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dependency_backward", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "9", "EstimateLatencyMax" : "495",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bypassOpt", "Type" : "None", "Direction" : "I"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_53_1_fu_168", "Port" : "placement_dynamic_dict_Opt2Tile_keys", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "dependency_forward", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassSrcOpt_keyIdx", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassTgtOpt", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassSrcOpt", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassTgtOpt_keyIdx", "Type" : "None", "Direction" : "I"},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_75_4_fu_193", "Port" : "dependency_successor_values", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "2", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_61_2_fu_176", "Port" : "dependency_successor_values", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "7", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_102_7_fu_219", "Port" : "dependency_successor_values", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "9", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_116_9_fu_235", "Port" : "dependency_successor_values", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_69_3_fu_185", "Port" : "dependency_predecessor_values", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "8", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_108_8_fu_227", "Port" : "dependency_predecessor_values", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "5", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_83_5_fu_201", "Port" : "dependency_predecessor_values", "Inst_start_state" : "9", "Inst_end_state" : "10"},
					{"ID" : "6", "SubInstance" : "grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_94_6_fu_210", "Port" : "dependency_predecessor_values", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "dependency_backward", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_53_1_fu_168", "Parent" : "0",
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_53_1",
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
			{"Name" : "phi_ln54_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "placement_dynamic_dict_Opt2Tile_keys", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_53_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_61_2_fu_176", "Parent" : "0",
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_61_2",
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
			{"Name" : "add_ln62", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln71", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln62_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_61_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_69_3_fu_185", "Parent" : "0",
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_69_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "24",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln70", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln70_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_69_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_75_4_fu_193", "Parent" : "0",
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_75_4",
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
			{"Name" : "add_ln76", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln76_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_75_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_83_5_fu_201", "Parent" : "0",
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_83_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "24",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln84", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassSrcOpt_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln84_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_83_5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_94_6_fu_210", "Parent" : "0",
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_94_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "24",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln95", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln71", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln95_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_94_6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_102_7_fu_219", "Parent" : "0",
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
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_108_8_fu_227", "Parent" : "0",
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_108_8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "24",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln109", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln109_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_predecessor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_108_8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_116_9_fu_235", "Parent" : "0",
		"CDFG" : "Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_116_9",
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
			{"Name" : "add_ln117", "Type" : "None", "Direction" : "I"},
			{"Name" : "bypassSrcOpt_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln117_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dependency_successor_values", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_116_9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]}]}


set ArgLastReadFirstWriteLatency {
	Dependency_Update_BypassMode_SrcTgt {
		bypassOpt {Type I LastRead 0 FirstWrite -1}
		placement_dynamic_dict_Opt2Tile_keys {Type I LastRead 1 FirstWrite -1}
		dependency_forward {Type I LastRead 2 FirstWrite -1}
		bypassSrcOpt_keyIdx {Type I LastRead 2 FirstWrite -1}
		bypassTgtOpt {Type I LastRead 2 FirstWrite -1}
		bypassSrcOpt {Type I LastRead 2 FirstWrite -1}
		bypassTgtOpt_keyIdx {Type I LastRead 2 FirstWrite -1}
		dependency_successor_values {Type IO LastRead 1 FirstWrite -1}
		dependency_predecessor_values {Type IO LastRead 1 FirstWrite -1}
		dependency_backward {Type I LastRead 10 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_53_1 {
		bypassOpt_load {Type I LastRead 0 FirstWrite -1}
		phi_ln54_out {Type O LastRead -1 FirstWrite 2}
		placement_dynamic_dict_Opt2Tile_keys {Type I LastRead 1 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_61_2 {
		add_ln62 {Type I LastRead 0 FirstWrite -1}
		sext_ln71 {Type I LastRead 0 FirstWrite -1}
		add_ln62_1_out {Type O LastRead -1 FirstWrite 3}
		dependency_successor_values {Type I LastRead 1 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_69_3 {
		add_ln70 {Type I LastRead 0 FirstWrite -1}
		add_ln70_1_out {Type O LastRead -1 FirstWrite 3}
		dependency_predecessor_values {Type I LastRead 1 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_75_4 {
		add_ln76 {Type I LastRead 0 FirstWrite -1}
		add_ln76_1_out {Type O LastRead -1 FirstWrite 3}
		dependency_successor_values {Type I LastRead 1 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_83_5 {
		add_ln84 {Type I LastRead 0 FirstWrite -1}
		bypassSrcOpt_load {Type I LastRead 0 FirstWrite -1}
		add_ln84_1_out {Type O LastRead -1 FirstWrite 3}
		dependency_predecessor_values {Type I LastRead 1 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_94_6 {
		add_ln95 {Type I LastRead 0 FirstWrite -1}
		sext_ln71 {Type I LastRead 0 FirstWrite -1}
		add_ln95_1_out {Type O LastRead -1 FirstWrite 3}
		dependency_predecessor_values {Type I LastRead 1 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_102_7 {
		add_ln103 {Type I LastRead 0 FirstWrite -1}
		add_ln103_1_out {Type O LastRead -1 FirstWrite 3}
		dependency_successor_values {Type I LastRead 1 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_108_8 {
		add_ln109 {Type I LastRead 0 FirstWrite -1}
		add_ln109_1_out {Type O LastRead -1 FirstWrite 3}
		dependency_predecessor_values {Type I LastRead 1 FirstWrite -1}}
	Dependency_Update_BypassMode_SrcTgt_Pipeline_VITIS_LOOP_116_9 {
		add_ln117 {Type I LastRead 0 FirstWrite -1}
		bypassSrcOpt_load {Type I LastRead 0 FirstWrite -1}
		add_ln117_1_out {Type O LastRead -1 FirstWrite 3}
		dependency_successor_values {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "9", "Max" : "495"}
	, {"Name" : "Interval", "Min" : "9", "Max" : "495"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	bypassOpt { ap_none {  { bypassOpt in_data 0 8 } } }
	placement_dynamic_dict_Opt2Tile_keys { ap_memory {  { placement_dynamic_dict_Opt2Tile_keys_address0 mem_address 1 7 }  { placement_dynamic_dict_Opt2Tile_keys_ce0 mem_ce 1 1 }  { placement_dynamic_dict_Opt2Tile_keys_q0 mem_dout 0 8 } } }
	dependency_forward { ap_none {  { dependency_forward in_data 0 1 } } }
	bypassSrcOpt_keyIdx { ap_none {  { bypassSrcOpt_keyIdx in_data 0 7 } } }
	bypassTgtOpt { ap_none {  { bypassTgtOpt in_data 0 7 } } }
	bypassSrcOpt { ap_none {  { bypassSrcOpt in_data 0 8 } } }
	bypassTgtOpt_keyIdx { ap_none {  { bypassTgtOpt_keyIdx in_data 0 7 } } }
	dependency_successor_values { ap_memory {  { dependency_successor_values_address0 mem_address 1 11 }  { dependency_successor_values_ce0 mem_ce 1 1 }  { dependency_successor_values_we0 mem_we 1 1 }  { dependency_successor_values_d0 mem_din 1 8 }  { dependency_successor_values_q0 mem_dout 0 8 } } }
	dependency_predecessor_values { ap_memory {  { dependency_predecessor_values_address0 mem_address 1 10 }  { dependency_predecessor_values_ce0 mem_ce 1 1 }  { dependency_predecessor_values_we0 mem_we 1 1 }  { dependency_predecessor_values_d0 mem_din 1 8 }  { dependency_predecessor_values_q0 mem_dout 0 8 } } }
	dependency_backward { ap_none {  { dependency_backward in_data 0 1 } } }
}
