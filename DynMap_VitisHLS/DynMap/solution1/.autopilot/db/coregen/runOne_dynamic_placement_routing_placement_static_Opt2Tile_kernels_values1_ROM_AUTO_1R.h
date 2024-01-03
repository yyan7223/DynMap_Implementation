// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __runOne_dynamic_placement_routing_placement_static_Opt2Tile_kernels_values1_ROM_AUTO_1R_H__
#define __runOne_dynamic_placement_routing_placement_static_Opt2Tile_kernels_values1_ROM_AUTO_1R_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct runOne_dynamic_placement_routing_placement_static_Opt2Tile_kernels_values1_ROM_AUTO_1R_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 4;
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


   SC_CTOR(runOne_dynamic_placement_routing_placement_static_Opt2Tile_kernels_values1_ROM_AUTO_1R_ram) {
        ram[0] = "0b1010";
        ram[1] = "0b1001";
        ram[2] = "0b0101";
        ram[3] = "0b0110";
        ram[4] = "0b1010";
        ram[5] = "0b1110";
        ram[6] = "0b0010";
        ram[7] = "0b1001";
        ram[8] = "0b0101";
        ram[9] = "0b1101";
        ram[10] = "0b1010";
        ram[11] = "0b0001";
        ram[12] = "0b1000";
        ram[13] = "0b1100";
        ram[14] = "0b0110";
        ram[15] = "0b0101";
        ram[16] = "0b0100";
        ram[17] = "0b0001";
        ram[18] = "0b0010";
        ram[19] = "0b1000";
        ram[20] = "0b0000";
        ram[21] = "0b0100";
        ram[22] = "0b1110";
        ram[23] = "0b1001";
        ram[24] = "0b0110";
        ram[25] = "0b0001";
        ram[26] = "0b1101";
        ram[27] = "0b0100";
        ram[28] = "0b1100";
        ram[29] = "0b1010";
        ram[30] = "0b1001";
        ram[31] = "0b0101";
        ram[32] = "0b1000";
        ram[33] = "0b1000";
        ram[34] = "0b0100";
        ram[35] = "0b1100";
        ram[36] = "0b0000";
        ram[37] = "0b1101";
        ram[38] = "0b0010";
        ram[39] = "0b1110";
        ram[40] = "0b1101";
        ram[41] = "0b1001";
        for (unsigned i = 42; i < 100 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[100] = "0b0110";
        ram[101] = "0b1010";
        ram[102] = "0b1001";
        ram[103] = "0b1010";
        ram[104] = "0b1001";
        ram[105] = "0b0101";
        ram[106] = "0b0110";
        ram[107] = "0b1101";
        ram[108] = "0b0001";
        ram[109] = "0b0101";
        ram[110] = "0b0100";
        ram[111] = "0b0010";
        ram[112] = "0b1100";
        ram[113] = "0b1000";
        ram[114] = "0b1110";
        ram[115] = "0b0001";
        ram[116] = "0b0001";
        ram[117] = "0b1000";
        ram[118] = "0b1101";
        ram[119] = "0b1100";
        ram[120] = "0b0010";
        ram[121] = "0b0110";
        ram[122] = "0b0010";
        ram[123] = "0b0100";
        ram[124] = "0b0110";
        ram[125] = "0b0101";
        ram[126] = "0b1110";
        ram[127] = "0b0101";
        ram[128] = "0b1101";
        ram[129] = "0b0100";
        ram[130] = "0b1010";
        ram[131] = "0b0001";
        ram[132] = "0b1001";
        ram[133] = "0b1010";
        ram[134] = "0b1100";
        ram[135] = "0b1101";
        ram[136] = "0b1001";
        ram[137] = "0b1000";
        ram[138] = "0b0000";
        ram[139] = "0b1110";
        ram[140] = "0b1110";
        ram[141] = "0b1100";
        for (unsigned i = 142; i < 200 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[200] = "0b1001";
        ram[201] = "0b0101";
        ram[202] = "0b1001";
        ram[203] = "0b0101";
        ram[204] = "0b1001";
        ram[205] = "0b1001";
        ram[206] = "0b1000";
        ram[207] = "0b1100";
        ram[208] = "0b1000";
        ram[209] = "0b1100";
        ram[210] = "0b0110";
        ram[211] = "0b0100";
        ram[212] = "0b1101";
        ram[213] = "0b0100";
        ram[214] = "0b1101";
        ram[215] = "0b1010";
        ram[216] = "0b0110";
        ram[217] = "0b1100";
        ram[218] = "0b0110";
        ram[219] = "0b1010";
        ram[220] = "0b0110";
        ram[221] = "0b1010";
        ram[222] = "0b1000";
        ram[223] = "0b0101";
        ram[224] = "0b0110";
        ram[225] = "0b0100";
        ram[226] = "0b1010";
        ram[227] = "0b1001";
        ram[228] = "0b0101";
        ram[229] = "0b1101";
        ram[230] = "0b1000";
        ram[231] = "0b0100";
        for (unsigned i = 232; i < 300 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[300] = "0b1001";
        ram[301] = "0b0101";
        ram[302] = "0b1001";
        ram[303] = "0b1010";
        ram[304] = "0b1001";
        ram[305] = "0b0101";
        ram[306] = "0b1001";
        ram[307] = "0b1000";
        ram[308] = "0b1001";
        ram[309] = "0b1000";
        ram[310] = "0b1100";
        ram[311] = "0b1101";
        ram[312] = "0b0110";
        ram[313] = "0b0100";
        ram[314] = "0b1101";
        ram[315] = "0b1001";
        ram[316] = "0b1010";
        ram[317] = "0b1100";
        ram[318] = "0b0100";
        ram[319] = "0b0110";
        ram[320] = "0b0101";
        ram[321] = "0b1000";
        ram[322] = "0b1010";
        ram[323] = "0b0110";
        ram[324] = "0b1100";
        ram[325] = "0b1101";
        ram[326] = "0b1010";
        ram[327] = "0b1100";
        ram[328] = "0b0100";
        ram[329] = "0b1000";
        ram[330] = "0b1100";
        for (unsigned i = 331; i < 400 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[400] = "0b1001";
        ram[401] = "0b1010";
        ram[402] = "0b1001";
        ram[403] = "0b1010";
        ram[404] = "0b1110";
        ram[405] = "0b1101";
        ram[406] = "0b1100";
        ram[407] = "0b1000";
        ram[408] = "0b1110";
        ram[409] = "0b1110";
        ram[410] = "0b1101";
        ram[411] = "0b1100";
        ram[412] = "0b1000";
        ram[413] = "0b1100";
        ram[414] = "0b1000";
        ram[415] = "0b1101";
        ram[416] = "0b1001";
        ram[417] = "0b1100";
        ram[418] = "0b1101";
        ram[419] = "0b1010";
        ram[420] = "0b1110";
        for (unsigned i = 421; i < 500 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[500] = "0b1010";
        ram[501] = "0b1001";
        ram[502] = "0b1010";
        ram[503] = "0b1110";
        ram[504] = "0b1101";
        ram[505] = "0b1100";
        ram[506] = "0b1110";
        ram[507] = "0b1101";
        ram[508] = "0b1001";
        ram[509] = "0b1000";
        ram[510] = "0b1000";
        ram[511] = "0b1100";
        ram[512] = "0b1001";
        ram[513] = "0b1101";
        ram[514] = "0b1001";
        ram[515] = "0b1101";
        ram[516] = "0b1110";
        for (unsigned i = 517; i < 600 ; i = i + 1) {
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


SC_MODULE(runOne_dynamic_placement_routing_placement_static_Opt2Tile_kernels_values1_ROM_AUTO_1R) {


static const unsigned DataWidth = 4;
static const unsigned AddressRange = 600;
static const unsigned AddressWidth = 10;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


runOne_dynamic_placement_routing_placement_static_Opt2Tile_kernels_values1_ROM_AUTO_1R_ram* meminst;


SC_CTOR(runOne_dynamic_placement_routing_placement_static_Opt2Tile_kernels_values1_ROM_AUTO_1R) {
meminst = new runOne_dynamic_placement_routing_placement_static_Opt2Tile_kernels_values1_ROM_AUTO_1R_ram("runOne_dynamic_placement_routing_placement_static_Opt2Tile_kernels_values1_ROM_AUTO_1R_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~runOne_dynamic_placement_routing_placement_static_Opt2Tile_kernels_values1_ROM_AUTO_1R() {
    delete meminst;
}


};//endmodule
#endif
