// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __runOne_BypassOptPlacement_Gen_Record_Tile2XY_0_ROM_AUTO_1R_H__
#define __runOne_BypassOptPlacement_Gen_Record_Tile2XY_0_ROM_AUTO_1R_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct runOne_BypassOptPlacement_Gen_Record_Tile2XY_0_ROM_AUTO_1R_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 2;
  static const unsigned AddressRange = 16;
  static const unsigned AddressWidth = 4;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in <sc_lv<AddressWidth> > address1;
sc_core::sc_in <sc_logic> ce1;
sc_core::sc_out <sc_lv<DataWidth> > q1;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(runOne_BypassOptPlacement_Gen_Record_Tile2XY_0_ROM_AUTO_1R_ram) {
        ram[0] = "0b00";
        ram[1] = "0b01";
        ram[2] = "0b10";
        ram[3] = "0b11";
        ram[4] = "0b00";
        ram[5] = "0b01";
        ram[6] = "0b10";
        ram[7] = "0b11";
        ram[8] = "0b00";
        ram[9] = "0b01";
        ram[10] = "0b10";
        ram[11] = "0b11";
        ram[12] = "0b00";
        ram[13] = "0b01";
        ram[14] = "0b10";
        ram[15] = "0b11";


SC_METHOD(prc_write_0);
  sensitive<<clk.pos();


SC_METHOD(prc_write_1);
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


void prc_write_1()
{
    if (ce1.read() == sc_dt::Log_1) 
    {
            if(address1.read().is_01() && address1.read().to_uint()<AddressRange)
              q1 = ram[address1.read().to_uint()];
            else
              q1 = sc_lv<DataWidth>();
    }
}


}; //endmodule


SC_MODULE(runOne_BypassOptPlacement_Gen_Record_Tile2XY_0_ROM_AUTO_1R) {


static const unsigned DataWidth = 2;
static const unsigned AddressRange = 16;
static const unsigned AddressWidth = 4;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in <sc_lv<AddressWidth> > address1;
sc_core::sc_in<sc_logic> ce1;
sc_core::sc_out <sc_lv<DataWidth> > q1;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


runOne_BypassOptPlacement_Gen_Record_Tile2XY_0_ROM_AUTO_1R_ram* meminst;


SC_CTOR(runOne_BypassOptPlacement_Gen_Record_Tile2XY_0_ROM_AUTO_1R) {
meminst = new runOne_BypassOptPlacement_Gen_Record_Tile2XY_0_ROM_AUTO_1R_ram("runOne_BypassOptPlacement_Gen_Record_Tile2XY_0_ROM_AUTO_1R_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->address1(address1);
meminst->ce1(ce1);
meminst->q1(q1);

meminst->reset(reset);
meminst->clk(clk);
}
~runOne_BypassOptPlacement_Gen_Record_Tile2XY_0_ROM_AUTO_1R() {
    delete meminst;
}


};//endmodule
#endif
