`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/16 16:14:53
// Design Name: 
// Module Name: BypassLessUnit_tb
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


module BypassLessUnit_tb(

    );
    
    reg CLK;
    reg RST_n;
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
    
    BypassLessUnit u_BypassLessUnit(
        .CLK(CLK),
        .RST_n(RST_n),
        .VALID(VALID)
    );
    
endmodule
