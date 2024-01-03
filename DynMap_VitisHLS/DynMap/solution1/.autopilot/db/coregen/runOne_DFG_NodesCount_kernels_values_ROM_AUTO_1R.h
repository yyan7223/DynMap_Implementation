// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __runOne_DFG_NodesCount_kernels_values_ROM_AUTO_1R_H__
#define __runOne_DFG_NodesCount_kernels_values_ROM_AUTO_1R_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct runOne_DFG_NodesCount_kernels_values_ROM_AUTO_1R_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 6;
  static const unsigned AddressRange = 6;
  static const unsigned AddressWidth = 3;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(runOne_DFG_NodesCount_kernels_values_ROM_AUTO_1R_ram) {
        ram[0] = "0b101010";
        ram[1] = "0b101010";
        ram[2] = "0b100000";
        ram[3] = "0b011111";
        ram[4] = "0b010101";
        ram[5] = "0b010001";


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


SC_MODULE(runOne_DFG_NodesCount_kernels_values_ROM_AUTO_1R) {


static const unsigned DataWidth = 6;
static const unsigned AddressRange = 6;
static const unsigned AddressWidth = 3;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


runOne_DFG_NodesCount_kernels_values_ROM_AUTO_1R_ram* meminst;


SC_CTOR(runOne_DFG_NodesCount_kernels_values_ROM_AUTO_1R) {
meminst = new runOne_DFG_NodesCount_kernels_values_ROM_AUTO_1R_ram("runOne_DFG_NodesCount_kernels_values_ROM_AUTO_1R_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~runOne_DFG_NodesCount_kernels_values_ROM_AUTO_1R() {
    delete meminst;
}


};//endmodule
#endif
