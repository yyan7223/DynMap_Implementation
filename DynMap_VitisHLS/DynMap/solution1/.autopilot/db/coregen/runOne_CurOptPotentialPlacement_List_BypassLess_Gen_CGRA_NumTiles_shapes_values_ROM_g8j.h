// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __runOne_CurOptPotentialPlacement_List_BypassLess_Gen_CGRA_NumTiles_shapes_values_ROM_g8j_H__
#define __runOne_CurOptPotentialPlacement_List_BypassLess_Gen_CGRA_NumTiles_shapes_values_ROM_g8j_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct runOne_CurOptPotentialPlacement_List_BypassLess_Gen_CGRA_NumTiles_shapes_values_ROM_g8j_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 4;
  static const unsigned AddressRange = 20;
  static const unsigned AddressWidth = 5;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(runOne_CurOptPotentialPlacement_List_BypassLess_Gen_CGRA_NumTiles_shapes_values_ROM_g8j_ram) {
        ram[0] = "0b1100";
        ram[1] = "0b1100";
        ram[2] = "0b1100";
        ram[3] = "0b1100";
        ram[4] = "0b1000";
        ram[5] = "0b1000";
        ram[6] = "0b1000";
        ram[7] = "0b1000";
        ram[8] = "0b0110";
        ram[9] = "0b0110";
        ram[10] = "0b0110";
        ram[11] = "0b0110";
        ram[12] = "0b0101";
        ram[13] = "0b0101";
        ram[14] = "0b0101";
        ram[15] = "0b0101";
        ram[16] = "0b0100";
        ram[17] = "0b0100";
        ram[18] = "0b0100";
        ram[19] = "0b0100";


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


SC_MODULE(runOne_CurOptPotentialPlacement_List_BypassLess_Gen_CGRA_NumTiles_shapes_values_ROM_g8j) {


static const unsigned DataWidth = 4;
static const unsigned AddressRange = 20;
static const unsigned AddressWidth = 5;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


runOne_CurOptPotentialPlacement_List_BypassLess_Gen_CGRA_NumTiles_shapes_values_ROM_g8j_ram* meminst;


SC_CTOR(runOne_CurOptPotentialPlacement_List_BypassLess_Gen_CGRA_NumTiles_shapes_values_ROM_g8j) {
meminst = new runOne_CurOptPotentialPlacement_List_BypassLess_Gen_CGRA_NumTiles_shapes_values_ROM_g8j_ram("runOne_CurOptPotentialPlacement_List_BypassLess_Gen_CGRA_NumTiles_shapes_values_ROM_g8j_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~runOne_CurOptPotentialPlacement_List_BypassLess_Gen_CGRA_NumTiles_shapes_values_ROM_g8j() {
    delete meminst;
}


};//endmodule
#endif
