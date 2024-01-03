// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __runOne_Reset_Pipeline_VITIS_LOOP_719_18_placement_static_kernels_values_ROM_AUTO_1R_H__
#define __runOne_Reset_Pipeline_VITIS_LOOP_719_18_placement_static_kernels_values_ROM_AUTO_1R_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct runOne_Reset_Pipeline_VITIS_LOOP_719_18_placement_static_kernels_values_ROM_AUTO_1R_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 6;
  static const unsigned AddressRange = 600;
  static const unsigned AddressWidth = 10;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(runOne_Reset_Pipeline_VITIS_LOOP_719_18_placement_static_kernels_values_ROM_AUTO_1R_ram) {
        ram[0] = "0b000000";
        ram[1] = "0b000001";
        ram[2] = "0b000010";
        ram[3] = "0b000011";
        ram[4] = "0b000100";
        ram[5] = "0b011010";
        ram[6] = "0b100111";
        ram[7] = "0b000101";
        ram[8] = "0b011000";
        ram[9] = "0b011011";
        ram[10] = "0b100101";
        ram[11] = "0b101000";
        ram[12] = "0b000110";
        ram[13] = "0b011100";
        ram[14] = "0b101001";
        ram[15] = "0b000111";
        ram[16] = "0b001000";
        ram[17] = "0b001001";
        ram[18] = "0b001010";
        ram[19] = "0b010011";
        ram[20] = "0b011101";
        ram[21] = "0b100000";
        ram[22] = "0b001011";
        ram[23] = "0b001100";
        ram[24] = "0b001101";
        ram[25] = "0b001110";
        ram[26] = "0b010100";
        ram[27] = "0b011110";
        ram[28] = "0b100001";
        ram[29] = "0b001111";
        ram[30] = "0b010101";
        ram[31] = "0b011111";
        ram[32] = "0b100010";
        ram[33] = "0b010000";
        ram[34] = "0b100011";
        ram[35] = "0b010001";
        ram[36] = "0b100100";
        ram[37] = "0b010010";
        ram[38] = "0b100110";
        ram[39] = "0b010110";
        ram[40] = "0b010111";
        ram[41] = "0b011001";
        for (unsigned i = 42; i < 101 ; i = i + 1) {
            ram[i] = "0b000000";
        }
        ram[101] = "0b100111";
        ram[102] = "0b101000";
        ram[103] = "0b101001";
        ram[104] = "0b000001";
        ram[105] = "0b000010";
        ram[106] = "0b010001";
        ram[107] = "0b011100";
        ram[108] = "0b000011";
        ram[109] = "0b010010";
        ram[110] = "0b010111";
        ram[111] = "0b011010";
        ram[112] = "0b011101";
        ram[113] = "0b100010";
        ram[114] = "0b100101";
        ram[115] = "0b000100";
        ram[116] = "0b010011";
        ram[117] = "0b011000";
        ram[118] = "0b011110";
        ram[119] = "0b100011";
        ram[120] = "0b000101";
        ram[121] = "0b001001";
        ram[122] = "0b000110";
        ram[123] = "0b001010";
        ram[124] = "0b010101";
        ram[125] = "0b100000";
        ram[126] = "0b000111";
        ram[127] = "0b001011";
        ram[128] = "0b001000";
        ram[129] = "0b001100";
        ram[130] = "0b001110";
        ram[131] = "0b001111";
        ram[132] = "0b001101";
        ram[133] = "0b010000";
        ram[134] = "0b010100";
        ram[135] = "0b011001";
        ram[136] = "0b011111";
        ram[137] = "0b100100";
        ram[138] = "0b010110";
        ram[139] = "0b011011";
        ram[140] = "0b100001";
        ram[141] = "0b100110";
        for (unsigned i = 142; i < 201 ; i = i + 1) {
            ram[i] = "0b000000";
        }
        ram[201] = "0b010110";
        ram[202] = "0b011101";
        ram[203] = "0b011110";
        ram[204] = "0b011111";
        ram[205] = "0b000001";
        ram[206] = "0b001101";
        ram[207] = "0b010111";
        ram[208] = "0b000010";
        ram[209] = "0b000111";
        ram[210] = "0b001010";
        ram[211] = "0b001110";
        ram[212] = "0b011000";
        ram[213] = "0b000011";
        ram[214] = "0b001000";
        ram[215] = "0b001011";
        ram[216] = "0b001111";
        ram[217] = "0b011001";
        ram[218] = "0b000100";
        ram[219] = "0b001001";
        ram[220] = "0b001100";
        ram[221] = "0b010000";
        ram[222] = "0b011010";
        ram[223] = "0b000101";
        ram[224] = "0b010001";
        ram[225] = "0b011011";
        ram[226] = "0b000110";
        ram[227] = "0b010010";
        ram[228] = "0b010011";
        ram[229] = "0b010100";
        ram[230] = "0b010101";
        ram[231] = "0b011100";
        for (unsigned i = 232; i < 300 ; i = i + 1) {
            ram[i] = "0b000000";
        }
        ram[300] = "0b011100";
        ram[301] = "0b011101";
        ram[302] = "0b011110";
        ram[303] = "0b000000";
        ram[304] = "0b000011";
        ram[305] = "0b000100";
        ram[306] = "0b000101";
        ram[307] = "0b011011";
        ram[308] = "0b000001";
        ram[309] = "0b000010";
        ram[310] = "0b000110";
        ram[311] = "0b001001";
        ram[312] = "0b001111";
        ram[313] = "0b010101";
        ram[314] = "0b000111";
        ram[315] = "0b001010";
        ram[316] = "0b010000";
        ram[317] = "0b010110";
        ram[318] = "0b001000";
        ram[319] = "0b001011";
        ram[320] = "0b010001";
        ram[321] = "0b010111";
        ram[322] = "0b001100";
        ram[323] = "0b010010";
        ram[324] = "0b011000";
        ram[325] = "0b001101";
        ram[326] = "0b010011";
        ram[327] = "0b001110";
        ram[328] = "0b010100";
        ram[329] = "0b011001";
        ram[330] = "0b011010";
        for (unsigned i = 331; i < 400 ; i = i + 1) {
            ram[i] = "0b000000";
        }
        ram[400] = "0b000001";
        ram[401] = "0b010010";
        ram[402] = "0b010011";
        ram[403] = "0b010100";
        ram[404] = "0b000000";
        ram[405] = "0b000010";
        ram[406] = "0b000100";
        ram[407] = "0b001010";
        ram[408] = "0b010001";
        ram[409] = "0b000011";
        ram[410] = "0b000101";
        ram[411] = "0b001011";
        ram[412] = "0b000110";
        ram[413] = "0b001100";
        ram[414] = "0b000111";
        ram[415] = "0b001101";
        ram[416] = "0b001000";
        ram[417] = "0b001110";
        ram[418] = "0b001001";
        ram[419] = "0b001111";
        ram[420] = "0b010000";
        for (unsigned i = 421; i < 500 ; i = i + 1) {
            ram[i] = "0b000000";
        }
        ram[500] = "0b001110";
        ram[501] = "0b001111";
        ram[502] = "0b010000";
        ram[503] = "0b000000";
        ram[504] = "0b000010";
        ram[505] = "0b000011";
        ram[506] = "0b000100";
        ram[507] = "0b000101";
        ram[508] = "0b000110";
        ram[509] = "0b001001";
        ram[510] = "0b000111";
        ram[511] = "0b001010";
        ram[512] = "0b001000";
        ram[513] = "0b001011";
        ram[514] = "0b001100";
        ram[515] = "0b001101";
        ram[516] = "0b000001";
        for (unsigned i = 517; i < 600 ; i = i + 1) {
            ram[i] = "0b000000";
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


SC_MODULE(runOne_Reset_Pipeline_VITIS_LOOP_719_18_placement_static_kernels_values_ROM_AUTO_1R) {


static const unsigned DataWidth = 6;
static const unsigned AddressRange = 600;
static const unsigned AddressWidth = 10;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


runOne_Reset_Pipeline_VITIS_LOOP_719_18_placement_static_kernels_values_ROM_AUTO_1R_ram* meminst;


SC_CTOR(runOne_Reset_Pipeline_VITIS_LOOP_719_18_placement_static_kernels_values_ROM_AUTO_1R) {
meminst = new runOne_Reset_Pipeline_VITIS_LOOP_719_18_placement_static_kernels_values_ROM_AUTO_1R_ram("runOne_Reset_Pipeline_VITIS_LOOP_719_18_placement_static_kernels_values_ROM_AUTO_1R_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~runOne_Reset_Pipeline_VITIS_LOOP_719_18_placement_static_kernels_values_ROM_AUTO_1R() {
    delete meminst;
}


};//endmodule
#endif
