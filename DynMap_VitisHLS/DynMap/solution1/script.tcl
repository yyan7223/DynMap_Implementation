############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
############################################################
open_project DynMap
set_top runOne
add_files DynMap/DynMap_4HLS.cpp
add_files DynMap/DynMap_4HLS.hpp
add_files -tb DynMap/main.cpp
add_files -tb DynMap/result.golden.dat
open_solution "solution1" -flow_target vivado
set_part {xc7z035ffg676-2}
create_clock -period 10 -name default
#source "./DynMap/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
