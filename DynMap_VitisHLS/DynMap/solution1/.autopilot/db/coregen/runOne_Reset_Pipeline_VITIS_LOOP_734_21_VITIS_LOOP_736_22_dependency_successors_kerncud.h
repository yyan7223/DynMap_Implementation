// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __runOne_Reset_Pipeline_VITIS_LOOP_734_21_VITIS_LOOP_736_22_dependency_successors_kerncud_H__
#define __runOne_Reset_Pipeline_VITIS_LOOP_734_21_VITIS_LOOP_736_22_dependency_successors_kerncud_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct runOne_Reset_Pipeline_VITIS_LOOP_734_21_VITIS_LOOP_736_22_dependency_successors_kerncud_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 7;
  static const unsigned AddressRange = 12000;
  static const unsigned AddressWidth = 14;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(runOne_Reset_Pipeline_VITIS_LOOP_734_21_VITIS_LOOP_736_22_dependency_successors_kerncud_ram) {
        ram[0] = "0b0000001";
        ram[1] = "0b0000010";
        ram[2] = "0b0000011";
        ram[3] = "0b0000100";
        ram[4] = "0b0000111";
        ram[5] = "0b0011010";
        ram[6] = "0b0011101";
        ram[7] = "0b0100111";
        for (unsigned i = 8; i < 20 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[20] = "0b0001000";
        for (unsigned i = 21; i < 40 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[40] = "0b0001001";
        for (unsigned i = 41; i < 60 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[60] = "0b0001010";
        for (unsigned i = 61; i < 80 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[80] = "0b0000101";
        ram[81] = "0b0011000";
        for (unsigned i = 82; i < 100 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[100] = "0b0011011";
        ram[101] = "0b0100101";
        for (unsigned i = 102; i < 121 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[121] = "0b0101000";
        for (unsigned i = 122; i < 140 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[140] = "0b0000110";
        for (unsigned i = 141; i < 160 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[160] = "0b0011001";
        for (unsigned i = 161; i < 180 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[180] = "0b0011100";
        for (unsigned i = 181; i < 200 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[200] = "0b0100110";
        for (unsigned i = 201; i < 220 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[220] = "0b0101001";
        for (unsigned i = 221; i < 240 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[240] = "0b0010111";
        for (unsigned i = 241; i < 260 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[260] = "0b0100100";
        for (unsigned i = 261; i < 281 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[281] = "0b0000111";
        ram[282] = "0b0001000";
        ram[283] = "0b0001001";
        ram[284] = "0b0001010";
        ram[285] = "0b0010011";
        ram[286] = "0b0011101";
        ram[287] = "0b0100000";
        for (unsigned i = 288; i < 300 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[300] = "0b0001011";
        for (unsigned i = 301; i < 320 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[320] = "0b0001100";
        for (unsigned i = 321; i < 340 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[340] = "0b0001101";
        for (unsigned i = 341; i < 360 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[360] = "0b0001110";
        for (unsigned i = 361; i < 380 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[380] = "0b0010100";
        for (unsigned i = 381; i < 400 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[400] = "0b0011110";
        for (unsigned i = 401; i < 420 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[420] = "0b0100001";
        for (unsigned i = 421; i < 440 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[440] = "0b0001111";
        for (unsigned i = 441; i < 460 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[460] = "0b0010000";
        for (unsigned i = 461; i < 480 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[480] = "0b0010001";
        for (unsigned i = 481; i < 500 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[500] = "0b0010010";
        for (unsigned i = 501; i < 520 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[520] = "0b0010101";
        for (unsigned i = 521; i < 540 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[540] = "0b0011111";
        for (unsigned i = 541; i < 560 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[560] = "0b0100010";
        for (unsigned i = 561; i < 580 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[580] = "0b0010000";
        for (unsigned i = 581; i < 600 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[600] = "0b0010110";
        for (unsigned i = 601; i < 620 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[620] = "0b0100011";
        for (unsigned i = 621; i < 640 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[640] = "0b0100011";
        for (unsigned i = 641; i < 660 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[660] = "0b0010001";
        for (unsigned i = 661; i < 680 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[680] = "0b0100100";
        for (unsigned i = 681; i < 700 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[700] = "0b0010010";
        for (unsigned i = 701; i < 720 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[720] = "0b1111111";
        for (unsigned i = 721; i < 740 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[740] = "0b0010110";
        for (unsigned i = 741; i < 760 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[760] = "0b1111111";
        for (unsigned i = 761; i < 780 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[780] = "0b0010111";
        for (unsigned i = 781; i < 800 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[800] = "0b1111111";
        for (unsigned i = 801; i < 820 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[820] = "0b1111111";
        for (unsigned i = 821; i < 2000 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2000] = "0b0000001";
        ram[2001] = "0b0100111";
        for (unsigned i = 2002; i < 2021 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2021] = "0b0101000";
        for (unsigned i = 2022; i < 2040 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2040] = "0b0101001";
        for (unsigned i = 2041; i < 2061 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2061] = "0b0000001";
        ram[2062] = "0b0000011";
        ram[2063] = "0b0001000";
        ram[2064] = "0b0001100";
        ram[2065] = "0b0001110";
        ram[2066] = "0b0001111";
        ram[2067] = "0b0101000";
        for (unsigned i = 2068; i < 2080 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2080] = "0b0000010";
        ram[2081] = "0b0010001";
        ram[2082] = "0b0011100";
        for (unsigned i = 2083; i < 2100 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2100] = "0b0000011";
        for (unsigned i = 2101; i < 2120 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2120] = "0b0010010";
        ram[2121] = "0b0010111";
        ram[2122] = "0b0011010";
        for (unsigned i = 2123; i < 2140 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2140] = "0b0011101";
        ram[2141] = "0b0100010";
        ram[2142] = "0b0100101";
        for (unsigned i = 2143; i < 2160 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2160] = "0b0000100";
        for (unsigned i = 2161; i < 2180 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2180] = "0b0010011";
        for (unsigned i = 2181; i < 2200 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2200] = "0b0011000";
        for (unsigned i = 2201; i < 2220 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2220] = "0b0011011";
        for (unsigned i = 2221; i < 2240 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2240] = "0b0011110";
        for (unsigned i = 2241; i < 2260 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2260] = "0b0100011";
        for (unsigned i = 2261; i < 2280 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2280] = "0b0100110";
        for (unsigned i = 2281; i < 2300 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2300] = "0b0000101";
        ram[2301] = "0b0001001";
        for (unsigned i = 2302; i < 2320 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2320] = "0b0010100";
        for (unsigned i = 2321; i < 2340 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2340] = "0b0011001";
        for (unsigned i = 2341; i < 2360 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2360] = "0b0011111";
        for (unsigned i = 2361; i < 2380 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2380] = "0b0100100";
        for (unsigned i = 2381; i < 2400 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2400] = "0b0000110";
        ram[2401] = "0b0010101";
        for (unsigned i = 2402; i < 2420 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2420] = "0b0001010";
        ram[2421] = "0b0100000";
        for (unsigned i = 2422; i < 2440 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2440] = "0b0000111";
        for (unsigned i = 2441; i < 2460 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2460] = "0b0001011";
        for (unsigned i = 2461; i < 2480 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2480] = "0b0010110";
        for (unsigned i = 2481; i < 2500 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2500] = "0b0100001";
        for (unsigned i = 2501; i < 2520 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2520] = "0b0001000";
        ram[2521] = "0b0001110";
        for (unsigned i = 2522; i < 2540 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2540] = "0b0001100";
        ram[2541] = "0b0001111";
        for (unsigned i = 2542; i < 2560 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2560] = "0b0001101";
        for (unsigned i = 2561; i < 2580 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2580] = "0b0001101";
        for (unsigned i = 2581; i < 2600 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2600] = "0b0010000";
        for (unsigned i = 2601; i < 2620 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2620] = "0b0010000";
        for (unsigned i = 2621; i < 2640 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2640] = "0b0010100";
        ram[2641] = "0b0011001";
        for (unsigned i = 2642; i < 2660 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2660] = "0b0011111";
        ram[2661] = "0b0100100";
        for (unsigned i = 2662; i < 2680 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2680] = "0b1111111";
        for (unsigned i = 2681; i < 2700 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2700] = "0b1111111";
        for (unsigned i = 2701; i < 2720 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2720] = "0b1111111";
        for (unsigned i = 2721; i < 2740 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2740] = "0b1111111";
        for (unsigned i = 2741; i < 2760 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2760] = "0b1111111";
        for (unsigned i = 2761; i < 2780 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2780] = "0b1111111";
        for (unsigned i = 2781; i < 2800 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2800] = "0b1111111";
        for (unsigned i = 2801; i < 2820 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[2820] = "0b1111111";
        for (unsigned i = 2821; i < 4000 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4000] = "0b0000001";
        ram[4001] = "0b0001101";
        ram[4002] = "0b0010110";
        ram[4003] = "0b0011101";
        for (unsigned i = 4004; i < 4020 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4020] = "0b0010111";
        for (unsigned i = 4021; i < 4041 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4041] = "0b0011110";
        for (unsigned i = 4042; i < 4060 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4060] = "0b0011111";
        for (unsigned i = 4061; i < 4081 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4081] = "0b0000001";
        ram[4082] = "0b0000101";
        ram[4083] = "0b0000111";
        ram[4084] = "0b0001010";
        ram[4085] = "0b0001101";
        ram[4086] = "0b0001110";
        ram[4087] = "0b0010111";
        ram[4088] = "0b0011010";
        for (unsigned i = 4089; i < 4100 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4100] = "0b0000010";
        ram[4101] = "0b0000111";
        ram[4102] = "0b0001010";
        for (unsigned i = 4103; i < 4120 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4120] = "0b0001110";
        for (unsigned i = 4121; i < 4140 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4140] = "0b0011000";
        for (unsigned i = 4141; i < 4160 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4160] = "0b0000011";
        for (unsigned i = 4161; i < 4180 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4180] = "0b0001000";
        for (unsigned i = 4181; i < 4200 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4200] = "0b0001011";
        for (unsigned i = 4201; i < 4220 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4220] = "0b0001111";
        for (unsigned i = 4221; i < 4240 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4240] = "0b0011001";
        for (unsigned i = 4241; i < 4260 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4260] = "0b0000100";
        for (unsigned i = 4261; i < 4280 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4280] = "0b0001001";
        for (unsigned i = 4281; i < 4300 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4300] = "0b0001100";
        for (unsigned i = 4301; i < 4320 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4320] = "0b0010000";
        for (unsigned i = 4321; i < 4340 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4340] = "0b0011010";
        for (unsigned i = 4341; i < 4360 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4360] = "0b0000101";
        for (unsigned i = 4361; i < 4380 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4380] = "0b0010001";
        ram[4381] = "0b0010010";
        for (unsigned i = 4382; i < 4400 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4400] = "0b0010001";
        ram[4401] = "0b0010010";
        for (unsigned i = 4402; i < 4420 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4420] = "0b0010011";
        ram[4421] = "0b0010100";
        for (unsigned i = 4422; i < 4440 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4440] = "0b0011011";
        for (unsigned i = 4441; i < 4460 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4460] = "0b0000110";
        for (unsigned i = 4461; i < 4480 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4480] = "0b0010010";
        for (unsigned i = 4481; i < 4500 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4500] = "0b0011100";
        for (unsigned i = 4501; i < 4520 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4520] = "0b0010101";
        for (unsigned i = 4521; i < 4540 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4540] = "0b0010011";
        ram[4541] = "0b0010100";
        for (unsigned i = 4542; i < 4560 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4560] = "0b0010100";
        for (unsigned i = 4561; i < 4580 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4580] = "0b0010101";
        for (unsigned i = 4581; i < 4600 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4600] = "0b1111111";
        for (unsigned i = 4601; i < 4620 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[4620] = "0b1111111";
        for (unsigned i = 4621; i < 6001 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6001] = "0b0011101";
        for (unsigned i = 6002; i < 6020 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6020] = "0b0011110";
        for (unsigned i = 6021; i < 6041 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6041] = "0b0000001";
        ram[6042] = "0b0000010";
        for (unsigned i = 6043; i < 6060 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6060] = "0b0000011";
        ram[6061] = "0b0011100";
        for (unsigned i = 6062; i < 6080 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6080] = "0b0000100";
        for (unsigned i = 6081; i < 6100 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6100] = "0b0000101";
        for (unsigned i = 6101; i < 6120 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6120] = "0b0011011";
        for (unsigned i = 6121; i < 6140 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6140] = "0b0000001";
        for (unsigned i = 6141; i < 6160 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6160] = "0b0000010";
        ram[6161] = "0b0000110";
        ram[6162] = "0b0001001";
        ram[6163] = "0b0001111";
        ram[6164] = "0b0010101";
        for (unsigned i = 6165; i < 6180 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6180] = "0b0000101";
        for (unsigned i = 6181; i < 6200 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6200] = "0b0000111";
        for (unsigned i = 6201; i < 6220 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6220] = "0b0001010";
        for (unsigned i = 6221; i < 6240 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6240] = "0b0010000";
        for (unsigned i = 6241; i < 6260 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6260] = "0b0010110";
        for (unsigned i = 6261; i < 6280 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6280] = "0b0001000";
        for (unsigned i = 6281; i < 6300 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6300] = "0b0001011";
        for (unsigned i = 6301; i < 6320 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6320] = "0b0010001";
        for (unsigned i = 6321; i < 6340 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6340] = "0b0010111";
        for (unsigned i = 6341; i < 6360 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6360] = "0b0001110";
        for (unsigned i = 6361; i < 6380 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6380] = "0b0001100";
        for (unsigned i = 6381; i < 6400 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6400] = "0b0010010";
        for (unsigned i = 6401; i < 6420 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6420] = "0b0011000";
        for (unsigned i = 6421; i < 6440 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6440] = "0b0001101";
        for (unsigned i = 6441; i < 6460 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6460] = "0b0010011";
        for (unsigned i = 6461; i < 6480 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6480] = "0b0011001";
        for (unsigned i = 6481; i < 6500 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6500] = "0b0001110";
        for (unsigned i = 6501; i < 6520 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6520] = "0b0010100";
        for (unsigned i = 6521; i < 6540 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6540] = "0b0010100";
        for (unsigned i = 6541; i < 6560 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6560] = "0b0011001";
        for (unsigned i = 6561; i < 6580 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6580] = "0b0011010";
        for (unsigned i = 6581; i < 6600 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[6600] = "0b0011011";
        for (unsigned i = 6601; i < 8000 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8000] = "0b0010010";
        for (unsigned i = 8001; i < 8020 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8020] = "0b0000001";
        ram[8021] = "0b0010011";
        for (unsigned i = 8022; i < 8040 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8040] = "0b0010100";
        for (unsigned i = 8041; i < 8061 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8061] = "0b0000001";
        for (unsigned i = 8062; i < 8080 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8080] = "0b0000010";
        ram[8081] = "0b0000100";
        ram[8082] = "0b0001010";
        ram[8083] = "0b0010001";
        for (unsigned i = 8084; i < 8100 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8100] = "0b0000011";
        for (unsigned i = 8101; i < 8120 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8120] = "0b0000101";
        for (unsigned i = 8121; i < 8140 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8140] = "0b0001011";
        for (unsigned i = 8141; i < 8180 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8180] = "0b0001001";
        for (unsigned i = 8181; i < 8200 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8200] = "0b0000110";
        for (unsigned i = 8201; i < 8220 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8220] = "0b0001100";
        for (unsigned i = 8221; i < 8240 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8240] = "0b0000111";
        for (unsigned i = 8241; i < 8260 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8260] = "0b0001101";
        for (unsigned i = 8261; i < 8280 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8280] = "0b0001000";
        for (unsigned i = 8281; i < 8300 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8300] = "0b0001110";
        ram[8301] = "0b0010000";
        for (unsigned i = 8302; i < 8320 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8320] = "0b0001001";
        for (unsigned i = 8321; i < 8340 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8340] = "0b0001111";
        for (unsigned i = 8341; i < 8360 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8360] = "0b0001111";
        for (unsigned i = 8361; i < 8380 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8380] = "0b1111111";
        for (unsigned i = 8381; i < 8400 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[8400] = "0b1111111";
        for (unsigned i = 8401; i < 10001 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[10001] = "0b0001111";
        for (unsigned i = 10002; i < 10020 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[10020] = "0b0010000";
        for (unsigned i = 10021; i < 10041 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[10041] = "0b0000001";
        for (unsigned i = 10042; i < 10060 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[10060] = "0b0000010";
        ram[10061] = "0b0000011";
        ram[10062] = "0b0001110";
        for (unsigned i = 10063; i < 10080 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[10080] = "0b0000100";
        for (unsigned i = 10081; i < 10100 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[10100] = "0b0000101";
        for (unsigned i = 10101; i < 10120 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[10120] = "0b0000110";
        ram[10121] = "0b0001001";
        for (unsigned i = 10122; i < 10140 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[10140] = "0b0000110";
        ram[10141] = "0b0001001";
        for (unsigned i = 10142; i < 10160 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[10160] = "0b0000111";
        for (unsigned i = 10161; i < 10180 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[10180] = "0b0001010";
        for (unsigned i = 10181; i < 10200 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[10200] = "0b0001000";
        for (unsigned i = 10201; i < 10220 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[10220] = "0b0001011";
        for (unsigned i = 10221; i < 10240 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[10240] = "0b0001100";
        for (unsigned i = 10241; i < 10260 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[10260] = "0b0001100";
        for (unsigned i = 10261; i < 10280 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[10280] = "0b0001101";
        for (unsigned i = 10281; i < 10300 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[10300] = "0b0000001";
        for (unsigned i = 10301; i < 10320 ; i = i + 1) {
            ram[i] = "0b0000000";
        }
        ram[10320] = "0b0001101";
        for (unsigned i = 10321; i < 12000 ; i = i + 1) {
            ram[i] = "0b0000000";
        }


SC_METHOD(prc_write_0);
  sensitive<<clk.pos();
   }


void prc_write_0()
{
    if (ce0.read() == sc_dt::Log_1) 
    {
            if(address0.read().is_01() && address0.read().to_uint()<AddressRange)
              q0 = ram[address0.read().to_uint()];
            else
              q0 = sc_lv<DataWidth>();
    }
}


}; //endmodule


SC_MODULE(runOne_Reset_Pipeline_VITIS_LOOP_734_21_VITIS_LOOP_736_22_dependency_successors_kerncud) {


static const unsigned DataWidth = 7;
static const unsigned AddressRange = 12000;
static const unsigned AddressWidth = 14;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


runOne_Reset_Pipeline_VITIS_LOOP_734_21_VITIS_LOOP_736_22_dependency_successors_kerncud_ram* meminst;


SC_CTOR(runOne_Reset_Pipeline_VITIS_LOOP_734_21_VITIS_LOOP_736_22_dependency_successors_kerncud) {
meminst = new runOne_Reset_Pipeline_VITIS_LOOP_734_21_VITIS_LOOP_736_22_dependency_successors_kerncud_ram("runOne_Reset_Pipeline_VITIS_LOOP_734_21_VITIS_LOOP_736_22_dependency_successors_kerncud_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~runOne_Reset_Pipeline_VITIS_LOOP_734_21_VITIS_LOOP_736_22_dependency_successors_kerncud() {
    delete meminst;
}


};//endmodule
#endif
