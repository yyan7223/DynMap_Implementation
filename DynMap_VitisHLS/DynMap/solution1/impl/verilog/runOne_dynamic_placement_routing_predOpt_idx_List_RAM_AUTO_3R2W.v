// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module runOne_dynamic_placement_routing_predOpt_idx_List_RAM_AUTO_3R2W (address0, ce0, d0, we0, q0,  reset,clk);

parameter DataWidth = 6;
parameter AddressWidth = 4;
parameter AddressRange = 10;

input[AddressWidth-1:0] address0;
input ce0;
input[DataWidth-1:0] d0;
input we0;
output wire[DataWidth-1:0] q0;
input reset;
input clk;

reg [DataWidth-1:0] ram[0:AddressRange-1];
wire [AddressWidth-1:0] address0_t0; 
reg [AddressWidth-1:0] address0_t1; 
wire [DataWidth-1:0] d0_t0; 
wire we0_t0; 
reg [DataWidth-1:0] d0_t1; 
reg we0_t1; 
reg [DataWidth-1:0] q0_t0;
reg [DataWidth-1:0] q0_t1;

initial begin
    $readmemh("./runOne_dynamic_placement_routing_predOpt_idx_List_RAM_AUTO_3R2W.dat", ram);
end

assign address0_t0 = address0;
assign d0_t0 = d0;
assign we0_t0 = we0;
assign q0 = q0_t1;

always @(posedge clk)  
begin
    if (ce0) 
    begin
        address0_t1 <= address0_t0; 
        d0_t1 <= d0_t0;
        we0_t1 <= we0_t0;
        q0_t1 <= q0_t0;
    end
end


always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0_t1) 
            ram[address0_t1] <= d0_t1; 
        q0_t0 <= ram[address0_t1];
    end
end


endmodule

