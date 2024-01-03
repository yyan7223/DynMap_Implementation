// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_xy2Tncg_H__
#define __runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_xy2Tncg_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_xy2Tncg_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 4;
  static const unsigned AddressRange = 16;
  static const unsigned AddressWidth = 4;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_xy2Tncg_ram) {
        ram[0] = "0b0000";
        ram[1] = "0b0100";
        ram[2] = "0b1000";
        ram[3] = "0b1100";
        ram[4] = "0b0001";
        ram[5] = "0b0101";
        ram[6] = "0b1001";
        ram[7] = "0b1101";
        ram[8] = "0b0010";
        ram[9] = "0b0110";
        ram[10] = "0b1010";
        ram[11] = "0b1110";
        ram[12] = "0b0011";
        ram[13] = "0b0111";
        ram[14] = "0b1011";
        ram[15] = "0b1111";


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


SC_MODULE(runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_xy2Tncg) {


static const unsigned DataWidth = 4;
static const unsigned AddressRange = 16;
static const unsigned AddressWidth = 4;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_xy2Tncg_ram* meminst;


SC_CTOR(runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_xy2Tncg) {
meminst = new runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_xy2Tncg_ram("runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_xy2Tncg_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_xy2Tncg() {
    delete meminst;
}


};//endmodule
#endif
