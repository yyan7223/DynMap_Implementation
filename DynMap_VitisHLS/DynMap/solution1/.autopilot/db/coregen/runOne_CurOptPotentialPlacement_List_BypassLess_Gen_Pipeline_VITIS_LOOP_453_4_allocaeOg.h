// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __runOne_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_allocaeOg_H__
#define __runOne_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_allocaeOg_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct runOne_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_allocaeOg_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 4;
  static const unsigned AddressRange = 320;
  static const unsigned AddressWidth = 9;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(runOne_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_allocaeOg_ram) {
        ram[0] = "0b0101";
        ram[1] = "0b1001";
        ram[2] = "0b0001";
        ram[3] = "0b0100";
        ram[4] = "0b0110";
        ram[5] = "0b1000";
        ram[6] = "0b1010";
        ram[7] = "0b1101";
        ram[8] = "0b0000";
        ram[9] = "0b0010";
        ram[10] = "0b1100";
        ram[11] = "0b1110";
        ram[12] = "0b0000";
        ram[13] = "0b0000";
        ram[14] = "0b0000";
        ram[15] = "0b0000";
        ram[16] = "0b0110";
        ram[17] = "0b1010";
        ram[18] = "0b0101";
        ram[19] = "0b1001";
        ram[20] = "0b0111";
        ram[21] = "0b1011";
        ram[22] = "0b0010";
        ram[23] = "0b0011";
        ram[24] = "0b0100";
        ram[25] = "0b1000";
        ram[26] = "0b1110";
        ram[27] = "0b1111";
        ram[28] = "0b0000";
        ram[29] = "0b0000";
        ram[30] = "0b0000";
        ram[31] = "0b0000";
        ram[32] = "0b1001";
        ram[33] = "0b0100";
        ram[34] = "0b0101";
        ram[35] = "0b1000";
        ram[36] = "0b1010";
        ram[37] = "0b1101";
        ram[38] = "0b1110";
        ram[39] = "0b0000";
        ram[40] = "0b0001";
        ram[41] = "0b1011";
        ram[42] = "0b1100";
        ram[43] = "0b1111";
        ram[44] = "0b0000";
        ram[45] = "0b0000";
        ram[46] = "0b0000";
        ram[47] = "0b0000";
        ram[48] = "0b0001";
        ram[49] = "0b0010";
        ram[50] = "0b0011";
        ram[51] = "0b0100";
        ram[52] = "0b0101";
        ram[53] = "0b0110";
        ram[54] = "0b0111";
        ram[55] = "0b1000";
        ram[56] = "0b1001";
        ram[57] = "0b1010";
        ram[58] = "0b0000";
        ram[59] = "0b1011";
        ram[60] = "0b0000";
        ram[61] = "0b0000";
        ram[62] = "0b0000";
        ram[63] = "0b0000";
        ram[64] = "0b1001";
        ram[65] = "0b0101";
        ram[66] = "0b1000";
        ram[67] = "0b0100";
        ram[68] = "0b0110";
        ram[69] = "0b1010";
        ram[70] = "0b1100";
        ram[71] = "0b1101";
        for (unsigned i = 72; i < 80 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[80] = "0b0100";
        ram[81] = "0b0101";
        ram[82] = "0b1000";
        ram[83] = "0b1001";
        ram[84] = "0b0000";
        ram[85] = "0b0001";
        ram[86] = "0b1100";
        ram[87] = "0b1101";
        for (unsigned i = 88; i < 96 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[96] = "0b0101";
        ram[97] = "0b1001";
        ram[98] = "0b0000";
        ram[99] = "0b0001";
        ram[100] = "0b0100";
        ram[101] = "0b1010";
        ram[102] = "0b1101";
        ram[103] = "0b1110";
        for (unsigned i = 104; i < 112 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[112] = "0b0001";
        ram[113] = "0b0010";
        ram[114] = "0b0011";
        ram[115] = "0b0100";
        ram[116] = "0b0101";
        ram[117] = "0b0110";
        ram[118] = "0b0000";
        ram[119] = "0b0111";
        for (unsigned i = 120; i < 128 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[128] = "0b1001";
        ram[129] = "0b1101";
        ram[130] = "0b1000";
        ram[131] = "0b1010";
        ram[132] = "0b1100";
        ram[133] = "0b1110";
        for (unsigned i = 134; i < 144 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[144] = "0b1000";
        ram[145] = "0b1101";
        ram[146] = "0b1001";
        ram[147] = "0b1100";
        ram[148] = "0b0100";
        ram[149] = "0b1110";
        for (unsigned i = 150; i < 160 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[160] = "0b1001";
        ram[161] = "0b1110";
        ram[162] = "0b1010";
        ram[163] = "0b1101";
        ram[164] = "0b1000";
        ram[165] = "0b1111";
        for (unsigned i = 166; i < 176 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[176] = "0b0001";
        ram[177] = "0b0010";
        ram[178] = "0b0011";
        ram[179] = "0b0100";
        ram[180] = "0b0000";
        ram[181] = "0b0101";
        for (unsigned i = 182; i < 192 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[192] = "0b1101";
        ram[193] = "0b1000";
        ram[194] = "0b1001";
        ram[195] = "0b1100";
        ram[196] = "0b1110";
        for (unsigned i = 197; i < 208 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[208] = "0b1101";
        ram[209] = "0b1001";
        ram[210] = "0b0101";
        ram[211] = "0b1100";
        ram[212] = "0b1110";
        for (unsigned i = 213; i < 224 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[224] = "0b1000";
        ram[225] = "0b1100";
        ram[226] = "0b1101";
        ram[227] = "0b0100";
        ram[228] = "0b1110";
        for (unsigned i = 229; i < 240 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[240] = "0b0001";
        ram[241] = "0b0010";
        ram[242] = "0b0011";
        ram[243] = "0b0000";
        ram[244] = "0b0100";
        for (unsigned i = 245; i < 256 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[256] = "0b1000";
        ram[257] = "0b1001";
        ram[258] = "0b1100";
        ram[259] = "0b1101";
        for (unsigned i = 260; i < 272 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[272] = "0b1100";
        ram[273] = "0b1101";
        ram[274] = "0b1000";
        ram[275] = "0b1110";
        for (unsigned i = 276; i < 288 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[288] = "0b1001";
        ram[289] = "0b1101";
        ram[290] = "0b1000";
        ram[291] = "0b1110";
        for (unsigned i = 292; i < 304 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[304] = "0b0001";
        ram[305] = "0b0010";
        ram[306] = "0b0000";
        ram[307] = "0b0011";
        for (unsigned i = 308; i < 320 ; i = i + 1) {
            ram[i] = "0b0000";
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


SC_MODULE(runOne_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_allocaeOg) {


static const unsigned DataWidth = 4;
static const unsigned AddressRange = 320;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


runOne_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_allocaeOg_ram* meminst;


SC_CTOR(runOne_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_allocaeOg) {
meminst = new runOne_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_allocaeOg_ram("runOne_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_allocaeOg_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~runOne_CurOptPotentialPlacement_List_BypassLess_Gen_Pipeline_VITIS_LOOP_453_4_allocaeOg() {
    delete meminst;
}


};//endmodule
#endif
