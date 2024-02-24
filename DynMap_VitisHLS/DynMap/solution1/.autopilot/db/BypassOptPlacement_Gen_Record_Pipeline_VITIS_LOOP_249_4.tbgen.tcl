set moduleName BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4
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
set C_modelName {BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4}
set C_modelType { int 1 }
set C_modelArgList {
	{ add_ln192 int 8 regular  }
	{ DynamicPlacement_II_load int 8 regular  }
	{ tileId int 4 regular  }
	{ idxprom174 int 4 regular  }
	{ idxprom20 int 5 regular  }
	{ sub182 int 4 regular  }
	{ upperLimit int 8 regular  }
	{ p_out int 8 regular {pointer 1}  }
	{ add_ln252_out int 13 regular {pointer 1}  }
	{ tmp_71_out int 13 regular {pointer 1}  }
	{ placement_dynamic_bypass_occupy int 1 regular {array 5120 { 1 1 } 1 1 } {global 0}  }
	{ IDX_pd_bypass int 8 regular {pointer 2} {global 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "add_ln192", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "DynamicPlacement_II_load", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "tileId", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "idxprom174", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "idxprom20", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "sub182", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "upperLimit", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "p_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "add_ln252_out", "interface" : "wire", "bitwidth" : 13, "direction" : "WRITEONLY"} , 
 	{ "Name" : "tmp_71_out", "interface" : "wire", "bitwidth" : 13, "direction" : "WRITEONLY"} , 
 	{ "Name" : "placement_dynamic_bypass_occupy", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "IDX_pd_bypass", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ add_ln192 sc_in sc_lv 8 signal 0 } 
	{ DynamicPlacement_II_load sc_in sc_lv 8 signal 1 } 
	{ tileId sc_in sc_lv 4 signal 2 } 
	{ idxprom174 sc_in sc_lv 4 signal 3 } 
	{ idxprom20 sc_in sc_lv 5 signal 4 } 
	{ sub182 sc_in sc_lv 4 signal 5 } 
	{ upperLimit sc_in sc_lv 8 signal 6 } 
	{ p_out sc_out sc_lv 8 signal 7 } 
	{ p_out_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ add_ln252_out sc_out sc_lv 13 signal 8 } 
	{ add_ln252_out_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ tmp_71_out sc_out sc_lv 13 signal 9 } 
	{ tmp_71_out_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ placement_dynamic_bypass_occupy_address0 sc_out sc_lv 13 signal 10 } 
	{ placement_dynamic_bypass_occupy_ce0 sc_out sc_logic 1 signal 10 } 
	{ placement_dynamic_bypass_occupy_q0 sc_in sc_lv 1 signal 10 } 
	{ placement_dynamic_bypass_occupy_address1 sc_out sc_lv 13 signal 10 } 
	{ placement_dynamic_bypass_occupy_ce1 sc_out sc_logic 1 signal 10 } 
	{ placement_dynamic_bypass_occupy_q1 sc_in sc_lv 1 signal 10 } 
	{ IDX_pd_bypass_i sc_in sc_lv 8 signal 11 } 
	{ IDX_pd_bypass_o sc_out sc_lv 8 signal 11 } 
	{ IDX_pd_bypass_o_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "add_ln192", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "add_ln192", "role": "default" }} , 
 	{ "name": "DynamicPlacement_II_load", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "DynamicPlacement_II_load", "role": "default" }} , 
 	{ "name": "tileId", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "tileId", "role": "default" }} , 
 	{ "name": "idxprom174", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "idxprom174", "role": "default" }} , 
 	{ "name": "idxprom20", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "idxprom20", "role": "default" }} , 
 	{ "name": "sub182", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "sub182", "role": "default" }} , 
 	{ "name": "upperLimit", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "upperLimit", "role": "default" }} , 
 	{ "name": "p_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_out", "role": "default" }} , 
 	{ "name": "p_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out", "role": "ap_vld" }} , 
 	{ "name": "add_ln252_out", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "add_ln252_out", "role": "default" }} , 
 	{ "name": "add_ln252_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "add_ln252_out", "role": "ap_vld" }} , 
 	{ "name": "tmp_71_out", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "tmp_71_out", "role": "default" }} , 
 	{ "name": "tmp_71_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "tmp_71_out", "role": "ap_vld" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "address0" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "ce0" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "q0" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "address1" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "ce1" }} , 
 	{ "name": "placement_dynamic_bypass_occupy_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "placement_dynamic_bypass_occupy", "role": "q1" }} , 
 	{ "name": "IDX_pd_bypass_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "IDX_pd_bypass", "role": "i" }} , 
 	{ "name": "IDX_pd_bypass_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "IDX_pd_bypass", "role": "o" }} , 
 	{ "name": "IDX_pd_bypass_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "IDX_pd_bypass", "role": "o_ap_vld" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4",
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
			{"Name" : "add_ln192", "Type" : "None", "Direction" : "I"},
			{"Name" : "DynamicPlacement_II_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "tileId", "Type" : "None", "Direction" : "I"},
			{"Name" : "idxprom174", "Type" : "None", "Direction" : "I"},
			{"Name" : "idxprom20", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub182", "Type" : "None", "Direction" : "I"},
			{"Name" : "upperLimit", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "add_ln252_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "tmp_71_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "placement_dynamic_bypass_occupy", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "IDX_pd_bypass", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_249_4", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_8ns_8ns_8_12_1_U167", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_249_4 {
		add_ln192 {Type I LastRead 0 FirstWrite -1}
		DynamicPlacement_II_load {Type I LastRead 0 FirstWrite -1}
		tileId {Type I LastRead 0 FirstWrite -1}
		idxprom174 {Type I LastRead 0 FirstWrite -1}
		idxprom20 {Type I LastRead 0 FirstWrite -1}
		sub182 {Type I LastRead 0 FirstWrite -1}
		upperLimit {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 13}
		add_ln252_out {Type O LastRead -1 FirstWrite 13}
		tmp_71_out {Type O LastRead -1 FirstWrite 13}
		placement_dynamic_bypass_occupy {Type I LastRead 13 FirstWrite -1}
		IDX_pd_bypass {Type IO LastRead 13 FirstWrite 13}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	add_ln192 { ap_none {  { add_ln192 in_data 0 8 } } }
	DynamicPlacement_II_load { ap_none {  { DynamicPlacement_II_load in_data 0 8 } } }
	tileId { ap_none {  { tileId in_data 0 4 } } }
	idxprom174 { ap_none {  { idxprom174 in_data 0 4 } } }
	idxprom20 { ap_none {  { idxprom20 in_data 0 5 } } }
	sub182 { ap_none {  { sub182 in_data 0 4 } } }
	upperLimit { ap_none {  { upperLimit in_data 0 8 } } }
	p_out { ap_vld {  { p_out out_data 1 8 }  { p_out_ap_vld out_vld 1 1 } } }
	add_ln252_out { ap_vld {  { add_ln252_out out_data 1 13 }  { add_ln252_out_ap_vld out_vld 1 1 } } }
	tmp_71_out { ap_vld {  { tmp_71_out out_data 1 13 }  { tmp_71_out_ap_vld out_vld 1 1 } } }
	placement_dynamic_bypass_occupy { ap_memory {  { placement_dynamic_bypass_occupy_address0 mem_address 1 13 }  { placement_dynamic_bypass_occupy_ce0 mem_ce 1 1 }  { placement_dynamic_bypass_occupy_q0 in_data 0 1 }  { placement_dynamic_bypass_occupy_address1 MemPortADDR2 1 13 }  { placement_dynamic_bypass_occupy_ce1 MemPortCE2 1 1 }  { placement_dynamic_bypass_occupy_q1 in_data 0 1 } } }
	IDX_pd_bypass { ap_ovld {  { IDX_pd_bypass_i in_data 0 8 }  { IDX_pd_bypass_o out_data 1 8 }  { IDX_pd_bypass_o_ap_vld out_vld 1 1 } } }
}
