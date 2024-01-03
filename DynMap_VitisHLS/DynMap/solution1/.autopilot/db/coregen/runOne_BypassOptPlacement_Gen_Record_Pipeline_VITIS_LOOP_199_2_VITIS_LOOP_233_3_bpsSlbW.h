// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_bpsSlbW_H__
#define __runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_bpsSlbW_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_bpsSlbW_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 1;
  static const unsigned AddressRange = 3;
  static const unsigned AddressWidth = 2;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_bpsSlbW_ram) {
        ram[0] = "0b1";
        ram[1] = "0b1";
        ram[2] = "0b0";


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


SC_MODULE(runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_bpsSlbW) {


static const unsigned DataWidth = 1;
static const unsigned AddressRange = 3;
static const unsigned AddressWidth = 2;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_bpsSlbW_ram* meminst;


SC_CTOR(runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_bpsSlbW) {
meminst = new runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_bpsSlbW_ram("runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_bpsSlbW_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~runOne_BypassOptPlacement_Gen_Record_Pipeline_VITIS_LOOP_199_2_VITIS_LOOP_233_3_bpsSlbW() {
    delete meminst;
}


};//endmodule
#endif
