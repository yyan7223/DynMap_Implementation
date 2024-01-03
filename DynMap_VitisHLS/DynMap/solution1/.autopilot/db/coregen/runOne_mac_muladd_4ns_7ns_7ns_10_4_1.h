// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __runOne_mac_muladd_4ns_7ns_7ns_10_4_1__HH__
#define __runOne_mac_muladd_4ns_7ns_7ns_10_4_1__HH__
#include "runOne_mac_muladd_4ns_7ns_7ns_10_4_1_DSP48_0.h"
#include <systemc>

template<
    int ID,
    int NUM_STAGE,
    int din0_WIDTH,
    int din1_WIDTH,
    int din2_WIDTH,
    int dout_WIDTH>
SC_MODULE(runOne_mac_muladd_4ns_7ns_7ns_10_4_1) {
    sc_core::sc_in_clk clk;
    sc_core::sc_in<sc_dt::sc_logic> reset;
    sc_core::sc_in<sc_dt::sc_logic> ce;
    sc_core::sc_in< sc_dt::sc_lv<din0_WIDTH> >   din0;
    sc_core::sc_in< sc_dt::sc_lv<din1_WIDTH> >   din1;
    sc_core::sc_in< sc_dt::sc_lv<din2_WIDTH> >   din2;
    sc_core::sc_out< sc_dt::sc_lv<dout_WIDTH> >   dout;



    runOne_mac_muladd_4ns_7ns_7ns_10_4_1_DSP48_0 runOne_mac_muladd_4ns_7ns_7ns_10_4_1_DSP48_0_U;

    SC_CTOR(runOne_mac_muladd_4ns_7ns_7ns_10_4_1):  runOne_mac_muladd_4ns_7ns_7ns_10_4_1_DSP48_0_U ("runOne_mac_muladd_4ns_7ns_7ns_10_4_1_DSP48_0_U") {
        runOne_mac_muladd_4ns_7ns_7ns_10_4_1_DSP48_0_U.clk(clk);
        runOne_mac_muladd_4ns_7ns_7ns_10_4_1_DSP48_0_U.rst(reset);
        runOne_mac_muladd_4ns_7ns_7ns_10_4_1_DSP48_0_U.ce(ce);
        runOne_mac_muladd_4ns_7ns_7ns_10_4_1_DSP48_0_U.in0(din0);
        runOne_mac_muladd_4ns_7ns_7ns_10_4_1_DSP48_0_U.in1(din1);
        runOne_mac_muladd_4ns_7ns_7ns_10_4_1_DSP48_0_U.in2(din2);
        runOne_mac_muladd_4ns_7ns_7ns_10_4_1_DSP48_0_U.dout(dout);

    }

};

#endif //
