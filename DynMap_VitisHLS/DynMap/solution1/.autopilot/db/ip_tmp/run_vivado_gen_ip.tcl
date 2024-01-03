create_project prj -part xc7z035-ffg676-2 -force
set_property target_language verilog [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/verilog"
source "D:/Project/ISCA2024_DynMap/DynMap_VitisHLS/DynMap/solution1/syn/verilog/runOne_ddiv_64ns_64ns_64_31_no_dsp_1_ip.tcl"
source "D:/Project/ISCA2024_DynMap/DynMap_VitisHLS/DynMap/solution1/syn/verilog/runOne_sitodp_32ns_64_5_no_dsp_1_ip.tcl"
