`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/13 21:13:19
// Design Name: 
// Module Name: LevelMatchUnit_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LevelMatchUnit_tb(
    );
    
    reg CLK;
    reg RST_n ;
    wire [3:0] RecList0;
    wire [3:0] RecList1;
    wire [3:0] RecList2;
    wire [3:0] RecList3;
    wire [3:0] RecList4;
    wire [3:0] RecList5;
    wire [3:0] RecList6;
    wire [3:0] RecList7;
    wire [3:0] RecList8;
    wire [3:0] RecList9;
    wire [3:0] RecList10;
    wire [3:0] RecList11;
    wire [3:0] RecList12;
    wire [3:0] RecList13;
    wire [3:0] RecList14;
    wire [3:0] RecList15;
    wire VALID;
    
    //clock generating
    parameter    CYCLE_200MHz = 10 ; //
    always begin
        CLK = 0 ; #(CYCLE_200MHz/2) ;
        CLK = 1 ; #(CYCLE_200MHz/2) ;
    end
    
    //motivation generating
    initial begin
        RST_n = 1'd0;
        #18 RST_n = 1'd1;
    end
    
    LevelMatchUnit u_LevelMatchUnit(
//        .sys_clk_p(CLK),
//        .sys_clk_n(~CLK),
        .CLK(CLK),
        .RST_n(RST_n),
        .VALID(VALID)
    );
    
//    initial begin
//        $readmemh ("placement_static_Opt2Tile.txt", u_LevelMatchUnit.placement_static_Opt2Tile);
//        $readmemh ("Tilelevels_static.txt", u_LevelMatchUnit.Tilelevels_static);
//        $readmemh ("levelStartEndAddr.txt", u_LevelMatchUnit.levelStartEndAddr);
//        $readmemh ("allocated_tiles.txt", u_LevelMatchUnit.allocated_tiles);
//    end
endmodule
