// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module runOne_BypassOptPlacement_Gen_Record_Tile2XY_1_ROM_AUTO_3R (
address0, ce0, q0, address1, ce1, q1, reset,clk);

parameter DataWidth = 2;
parameter AddressWidth = 4;
parameter AddressRange = 16;

input[AddressWidth-1:0] address0;
input ce0;
output wire[DataWidth-1:0] q0;
input[AddressWidth-1:0] address1;
input ce1;
output wire[DataWidth-1:0] q1;
input reset;
input clk;

reg [DataWidth-1:0] ram[0:AddressRange-1];
wire [AddressWidth-1:0] address0_t0; 
wire ce0_t0; 
reg [AddressWidth-1:0] address0_t1; 
reg [DataWidth-1:0] q0_t0;
reg [DataWidth-1:0] q0_t1;
wire [AddressWidth-1:0] address1_t0; 
wire ce1_t0; 
reg [AddressWidth-1:0] address1_t1; 
reg [DataWidth-1:0] q1_t0;
reg [DataWidth-1:0] q1_t1;

initial begin
    $readmemh("./runOne_BypassOptPlacement_Gen_Record_Tile2XY_1_ROM_AUTO_3R.dat", ram);
end

assign address0_t0 = address0;
assign q0 = q0_t1;
assign address1_t0 = address1;
assign q1 = q1_t1;

always @(posedge clk)  
begin
    if (ce0) 
    begin
        address0_t1 <= address0_t0; 
        q0_t1 <= q0_t0;
    end
    if (ce1) 
    begin
        address1_t1 <= address1_t0; 
        q1_t1 <= q1_t0;
    end
end


always @(posedge clk)  
begin 
    if (ce0) 
    begin
        q0_t0 <= ram[address0_t1];
    end
end



always @(posedge clk)  
begin 
    if (ce1) 
    begin
        q1_t0 <= ram[address1_t1];
    end
end



endmodule

