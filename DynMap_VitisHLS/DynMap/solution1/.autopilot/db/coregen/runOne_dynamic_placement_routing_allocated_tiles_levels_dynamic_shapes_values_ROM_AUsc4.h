// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __runOne_dynamic_placement_routing_allocated_tiles_levels_dynamic_shapes_values_ROM_AUsc4_H__
#define __runOne_dynamic_placement_routing_allocated_tiles_levels_dynamic_shapes_values_ROM_AUsc4_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct runOne_dynamic_placement_routing_allocated_tiles_levels_dynamic_shapes_values_ROM_AUsc4_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 4;
  static const unsigned AddressRange = 1280;
  static const unsigned AddressWidth = 11;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(runOne_dynamic_placement_routing_allocated_tiles_levels_dynamic_shapes_values_ROM_AUsc4_ram) {
        ram[0] = "0b0101";
        ram[1] = "0b1001";
        for (unsigned i = 2; i < 16 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[16] = "0b0001";
        ram[17] = "0b0100";
        ram[18] = "0b0110";
        ram[19] = "0b1000";
        ram[20] = "0b1010";
        ram[21] = "0b1101";
        for (unsigned i = 22; i < 33 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[33] = "0b0010";
        ram[34] = "0b1100";
        ram[35] = "0b1110";
        for (unsigned i = 36; i < 64 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[64] = "0b0110";
        ram[65] = "0b1010";
        for (unsigned i = 66; i < 80 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[80] = "0b0101";
        ram[81] = "0b1001";
        ram[82] = "0b0111";
        ram[83] = "0b1011";
        for (unsigned i = 84; i < 96 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[96] = "0b0010";
        ram[97] = "0b0011";
        ram[98] = "0b0100";
        ram[99] = "0b1000";
        ram[100] = "0b1110";
        ram[101] = "0b1111";
        for (unsigned i = 102; i < 128 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[128] = "0b1001";
        for (unsigned i = 129; i < 144 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[144] = "0b0100";
        ram[145] = "0b0101";
        ram[146] = "0b1000";
        ram[147] = "0b1010";
        ram[148] = "0b1101";
        ram[149] = "0b1110";
        for (unsigned i = 150; i < 161 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[161] = "0b0001";
        ram[162] = "0b1011";
        ram[163] = "0b1100";
        ram[164] = "0b1111";
        for (unsigned i = 165; i < 192 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[192] = "0b0001";
        ram[193] = "0b0010";
        ram[194] = "0b0011";
        ram[195] = "0b0100";
        ram[196] = "0b0101";
        ram[197] = "0b0110";
        ram[198] = "0b0111";
        ram[199] = "0b1000";
        ram[200] = "0b1001";
        ram[201] = "0b1010";
        for (unsigned i = 202; i < 209 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[209] = "0b1011";
        for (unsigned i = 210; i < 256 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[256] = "0b1001";
        for (unsigned i = 257; i < 272 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[272] = "0b0101";
        ram[273] = "0b1000";
        for (unsigned i = 274; i < 288 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[288] = "0b0100";
        ram[289] = "0b0110";
        ram[290] = "0b1010";
        ram[291] = "0b1100";
        ram[292] = "0b1101";
        for (unsigned i = 293; i < 320 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[320] = "0b0100";
        ram[321] = "0b0101";
        ram[322] = "0b1000";
        ram[323] = "0b1001";
        for (unsigned i = 324; i < 337 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[337] = "0b0001";
        ram[338] = "0b1100";
        ram[339] = "0b1101";
        for (unsigned i = 340; i < 384 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[384] = "0b0101";
        ram[385] = "0b1001";
        for (unsigned i = 386; i < 401 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[401] = "0b0001";
        ram[402] = "0b0100";
        ram[403] = "0b1010";
        ram[404] = "0b1101";
        ram[405] = "0b1110";
        for (unsigned i = 406; i < 448 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[448] = "0b0001";
        ram[449] = "0b0010";
        ram[450] = "0b0011";
        ram[451] = "0b0100";
        ram[452] = "0b0101";
        ram[453] = "0b0110";
        for (unsigned i = 454; i < 465 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[465] = "0b0111";
        for (unsigned i = 466; i < 512 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[512] = "0b1001";
        ram[513] = "0b1101";
        for (unsigned i = 514; i < 528 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[528] = "0b1000";
        ram[529] = "0b1010";
        ram[530] = "0b1100";
        ram[531] = "0b1110";
        for (unsigned i = 532; i < 576 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[576] = "0b1000";
        ram[577] = "0b1101";
        for (unsigned i = 578; i < 592 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[592] = "0b1001";
        ram[593] = "0b1100";
        for (unsigned i = 594; i < 608 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[608] = "0b0100";
        ram[609] = "0b1110";
        for (unsigned i = 610; i < 640 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[640] = "0b1001";
        ram[641] = "0b1110";
        for (unsigned i = 642; i < 656 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[656] = "0b1010";
        ram[657] = "0b1101";
        for (unsigned i = 658; i < 672 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[672] = "0b1000";
        ram[673] = "0b1111";
        for (unsigned i = 674; i < 704 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[704] = "0b0001";
        ram[705] = "0b0010";
        ram[706] = "0b0011";
        ram[707] = "0b0100";
        for (unsigned i = 708; i < 721 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[721] = "0b0101";
        for (unsigned i = 722; i < 768 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[768] = "0b1101";
        for (unsigned i = 769; i < 784 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[784] = "0b1000";
        ram[785] = "0b1001";
        ram[786] = "0b1100";
        for (unsigned i = 787; i < 800 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[800] = "0b1110";
        for (unsigned i = 801; i < 832 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[832] = "0b1101";
        for (unsigned i = 833; i < 848 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[848] = "0b1001";
        for (unsigned i = 849; i < 864 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[864] = "0b0101";
        ram[865] = "0b1100";
        ram[866] = "0b1110";
        for (unsigned i = 867; i < 896 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[896] = "0b1000";
        ram[897] = "0b1100";
        ram[898] = "0b1101";
        for (unsigned i = 899; i < 912 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[912] = "0b0100";
        ram[913] = "0b1110";
        for (unsigned i = 914; i < 960 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[960] = "0b0001";
        ram[961] = "0b0010";
        ram[962] = "0b0011";
        for (unsigned i = 963; i < 977 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[977] = "0b0100";
        for (unsigned i = 978; i < 1024 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[1024] = "0b1000";
        ram[1025] = "0b1001";
        ram[1026] = "0b1100";
        ram[1027] = "0b1101";
        for (unsigned i = 1028; i < 1088 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[1088] = "0b1100";
        ram[1089] = "0b1101";
        for (unsigned i = 1090; i < 1104 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[1104] = "0b1000";
        ram[1105] = "0b1110";
        for (unsigned i = 1106; i < 1152 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[1152] = "0b1001";
        ram[1153] = "0b1101";
        for (unsigned i = 1154; i < 1168 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[1168] = "0b1000";
        ram[1169] = "0b1110";
        for (unsigned i = 1170; i < 1216 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[1216] = "0b0001";
        ram[1217] = "0b0010";
        for (unsigned i = 1218; i < 1233 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[1233] = "0b0011";
        for (unsigned i = 1234; i < 1280 ; i = i + 1) {
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


SC_MODULE(runOne_dynamic_placement_routing_allocated_tiles_levels_dynamic_shapes_values_ROM_AUsc4) {


static const unsigned DataWidth = 4;
static const unsigned AddressRange = 1280;
static const unsigned AddressWidth = 11;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


runOne_dynamic_placement_routing_allocated_tiles_levels_dynamic_shapes_values_ROM_AUsc4_ram* meminst;


SC_CTOR(runOne_dynamic_placement_routing_allocated_tiles_levels_dynamic_shapes_values_ROM_AUsc4) {
meminst = new runOne_dynamic_placement_routing_allocated_tiles_levels_dynamic_shapes_values_ROM_AUsc4_ram("runOne_dynamic_placement_routing_allocated_tiles_levels_dynamic_shapes_values_ROM_AUsc4_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~runOne_dynamic_placement_routing_allocated_tiles_levels_dynamic_shapes_values_ROM_AUsc4() {
    delete meminst;
}


};//endmodule
#endif
