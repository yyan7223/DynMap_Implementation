`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/13 15:45:48
// Design Name: 
// Module Name: LevelMatchUnit
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


module LevelMatchUnit(
//    input sys_clk_p,
//    input sys_clk_n,
    input CLK,
    input RST_n,
    output VALID
    );
    
//    wire sys_clk ;
//    IBUFDS #(
//        .DIFF_TERM("FALSE"), // Differential Termination
//        .IBUF_LOW_PWR("TRUE"), // Low power="TRUE", Highest performance="FALSE"
//        .IOSTANDARD("DEFAULT") // Specify the input I/O standard
//    ) IBUFDS_inst (
//        .O(sys_clk), // Buffer output
//        .I(sys_clk_p), // Diff_p buffer input (connect directly to top-level port)
//        .IB(sys_clk_n) // Diff_n buffer input (connect directly to top-level port)
//    );
        
    // public register file and initial value
    reg [3:0] placement_static_Opt2Tile [255:0];
    reg [1:0] Tilelevels_static [15:0]; // 4x4 CGRA, 16 Tiles
    reg [7:0] levelStartEndAddr [2:0];
    reg [3:0] allocated_tiles [15:0]; // assume all 16 Tiles are allocated to current task
    initial begin //ug901_page154
        placement_static_Opt2Tile[0] = 4'd3;
        allocated_tiles[0] = 4'h5; allocated_tiles[1] = 4'h6; allocated_tiles[2] = 4'h9; allocated_tiles[3] = 4'hA;
        allocated_tiles[4] = 4'h1; allocated_tiles[5] = 4'h2; allocated_tiles[6] = 4'h4; allocated_tiles[7] = 4'h7;
        allocated_tiles[8] = 4'h8; allocated_tiles[9] = 4'hB; allocated_tiles[10] = 4'hD; allocated_tiles[11] = 4'hE;
        allocated_tiles[12] = 4'h0; allocated_tiles[13] = 4'h3; allocated_tiles[14] = 4'hC; allocated_tiles[15] = 4'hF;
        Tilelevels_static[0] = 2'h2; Tilelevels_static[1] = 2'h1; Tilelevels_static[2] = 2'h1; Tilelevels_static[3] = 2'h2;
        Tilelevels_static[4] = 2'h1; Tilelevels_static[5] = 2'h0; Tilelevels_static[6] = 2'h0; Tilelevels_static[7] = 2'h1;
        Tilelevels_static[8] = 2'h1; Tilelevels_static[9] = 2'h0; Tilelevels_static[10] = 2'h0; Tilelevels_static[11] = 2'h1;
        Tilelevels_static[12] = 2'h2; Tilelevels_static[13] = 2'h1; Tilelevels_static[14] = 2'h1; Tilelevels_static[15] = 2'h2;
        levelStartEndAddr[0] = 8'h30; levelStartEndAddr[1] = 8'hB4; levelStartEndAddr[2] = 8'hFC;
    end
    
    // internal signal
    wire [7:0] DFGNode;
    (* mark_debug="true" *) wire [3:0] NodeTile;
    (* mark_debug="true" *) wire [1:0] TileLevel;
    (* mark_debug="true" *) wire [1:0] MaxLevel;
    (* mark_debug="true" *) reg [1:0] DynLevel;
    (* mark_debug="true" *) wire [7:0] startEndAddr;
    (* mark_debug="true" *) wire [3:0] startAddr;
    (* mark_debug="true" *) wire [3:0] endAddr;
    (* mark_debug="true" *) reg [3:0] TileAddr;
    (* mark_debug="true" *) wire [3:0] Tile;
    (* mark_debug="true" *) wire READY;
    (* mark_debug="true" *) reg [3:0] RecList [15:0];
    (* mark_debug="true" *) reg RecList_wrEn;
    (* mark_debug="true" *) reg [4:0] RecList_wrAddr;
    (* mark_debug="true" *) wire [3:0] RecList_wrData;
    (* mark_debug="true" *) wire [4:0] AllocatedTiles_Len;
    
    // machine variable
    (* mark_debug="true" *) reg [4:0]            next_state ;
    (* mark_debug="true" *) reg [4:0]            cur_state ;
            
    // machine state decode
    parameter            IDLE = 5'd0 ;
    parameter            NodeFetch = 5'd1 ;
    parameter            LevelCalib = 5'd2 ;
    parameter            GetSmTiAddr = 5'd3 ;
    parameter            GetSmTi = 5'd4 ;
    parameter            RefreshAddr = 5'd5 ;
    parameter            GetSmLTi = 5'd6 ;
    parameter            LevelUpdate = 5'd7 ;
    parameter            GetOtTiAddr = 5'd8 ;
    parameter            GetOtherTi = 5'd9 ;
    parameter            CheckFinish = 5'd10 ;
    parameter            Done = 5'd11 ;
    
    /************************************** Finite State Machine **************************************/
    /************************************** state transfer ********************************************/
    always @(posedge CLK) begin
        if (!RST_n) begin
            cur_state <= 5'd0 ;
        end
        else begin
            cur_state <= next_state ;
        end
    end
    
    /************************************** state generate ********************************************/    
    always @(*) begin
        case(cur_state)
            IDLE:
                next_state = NodeFetch;
                
            NodeFetch:
                next_state = LevelCalib;
                
            LevelCalib:
                next_state = GetSmTiAddr;
                
            GetSmTiAddr:
                next_state = GetSmTi;
                
            GetSmTi:
                if (TileAddr == endAddr) begin
                    next_state = RefreshAddr;
                end
                else begin
                    next_state = GetSmTi;
                end
                
            RefreshAddr:
                next_state = GetSmLTi;
                
            GetSmLTi:
                if (TileAddr == endAddr) begin
                    next_state = LevelUpdate;
                end
                else begin
                    next_state = GetSmLTi;
                end
                
            LevelUpdate:
                next_state = GetOtTiAddr;
            
            GetOtTiAddr:
                next_state = GetOtherTi;
                
            GetOtherTi:
                if (TileAddr == endAddr) begin
                    next_state = CheckFinish;
                end
                else begin
                    next_state = GetOtherTi;
                end
                
            CheckFinish:
                if (RecList_wrAddr == AllocatedTiles_Len) begin
                    next_state = Done;
                end
                else begin
                    next_state = LevelUpdate;
                end
            
            Done:
                if (VALID & READY) begin
                    next_state = IDLE;
                end
                else begin
                    next_state = Done;
                end
            
            default:    next_state = IDLE ;
        endcase
    end

    /************************************** state output **********************************************/    
    /******************** not standard, mix of combinatorial logic and sequential logic****************/    
    // Read operation of Public RegisterFile. For convenience purpose, assume that they are all within the module 
    assign DFGNode = 8'd0;
    assign READY = 0;
    assign NodeTile = placement_static_Opt2Tile[DFGNode];
    assign TileLevel = Tilelevels_static[NodeTile];
    assign startEndAddr = levelStartEndAddr[DynLevel];
    assign startAddr = startEndAddr[3:0];
    assign endAddr = startEndAddr[7:4];
    assign Tile = allocated_tiles[TileAddr];
    assign RecList_wrData = Tile;
    assign AllocatedTiles_Len = 5'd16; // assume all CGRA tiles are allocated to current task, so maximum level is 2
    assign MaxLevel = 2'd2;
    
    // DynLevel Generator
    always@(posedge CLK) begin
        if (!RST_n) begin
            DynLevel <= 2'd0;
        end
        else if (cur_state == LevelCalib) begin
            DynLevel <= (TileLevel > MaxLevel)? MaxLevel: TileLevel;
        end
        else if (cur_state == LevelUpdate) begin
            DynLevel <= (DynLevel == MaxLevel)? 2'd0: DynLevel+2'd1;
        end
        else begin
            DynLevel <= DynLevel;
        end
    end
    
    // TileAddr Generator
    always@(posedge CLK) begin
        if (!RST_n) begin
            TileAddr <= 4'd0;
        end
        else if ((cur_state == GetSmTiAddr) || (cur_state == RefreshAddr) || (cur_state == GetOtTiAddr)) begin
            TileAddr <= startAddr;
        end
        else if ((cur_state == GetSmTi) || (cur_state == GetSmLTi) || (cur_state == GetOtherTi)) begin
            TileAddr <= TileAddr + 2'd1;
        end
        else begin
            TileAddr <= TileAddr;
        end
    end    
    
    // RecList_wrEn Generator
    always@(*) begin
        case (cur_state)
            GetSmTi: RecList_wrEn = (Tile == NodeTile) ? 1'd1 : 1'd0;
            GetSmLTi: RecList_wrEn = (Tile != NodeTile) ? 1'd1 : 1'd0;
            GetOtherTi: RecList_wrEn = 1'd1;
            default: RecList_wrEn = 1'd0;
        endcase
    end
    
    // RecList_wrAddr Generator
    always@(posedge CLK) begin
        if (!RST_n) begin
            RecList_wrAddr <= 5'd0;
        end
        else if (RecList_wrEn == 1'd1) begin
            RecList_wrAddr <= RecList_wrAddr + 5'd1;
        end
        else begin
            RecList_wrAddr <= RecList_wrAddr;
        end
    end        
    
    // RecList write operation
    genvar i;
    generate    
        for(i = 0; i < 16; i = i + 1) begin // 16 here is the length of allocated_tiles
            always@(posedge CLK) begin
                if (!RST_n) begin
                    RecList[i] <= 4'd0;
                end
                else if ((i == RecList_wrAddr) && RecList_wrEn) begin
                    RecList[RecList_wrAddr] <= RecList_wrData;
                end
                else begin
                    RecList[i] <= RecList[i];
                end
            end
        end
    endgenerate
    
    // valid generation
    assign VALID = (cur_state == Done) ? 1'd1: 1'd0;
   
   
   
   
       
    
    
    
    /******************************************** ILA *************************************************/
//    ila_0 ohMyOldBaby (
//        .clk(sys_clk), // input wire clk
    
    
//        .probe0(RecList[0]), // input wire [3:0]  probe0  
//        .probe1(RecList[1]), // input wire [3:0]  probe1 
//        .probe2(RecList[2]), // input wire [3:0]  probe2 
//        .probe3(RecList[3]), // input wire [3:0]  probe3 
//        .probe4(RecList[4]), // input wire [3:0]  probe4 
//        .probe5(RecList[5]), // input wire [3:0]  probe5 
//        .probe6(RecList[6]), // input wire [3:0]  probe6 
//        .probe7(RecList[7]), // input wire [3:0]  probe7 
//        .probe8(RecList[8]), // input wire [3:0]  probe8 
//        .probe9(RecList[9]), // input wire [3:0]  probe9 
//        .probe10(RecList[10]), // input wire [3:0]  probe10 
//        .probe11(RecList[11]), // input wire [3:0]  probe11 
//        .probe12(RecList[12]), // input wire [3:0]  probe12 
//        .probe13(RecList[13]), // input wire [3:0]  probe13 
//        .probe14(RecList[14]), // input wire [3:0]  probe14 
//        .probe15(RecList[15]), // input wire [3:0]  probe15 
//        .probe16(8'd0), // input wire [7:0]  probe16 
//        .probe17(NodeTile), // input wire [3:0]  probe17 
//        .probe18(TileLevel), // input wire [1:0]  probe18 
//        .probe19(MaxLevel), // input wire [1:0]  probe19 
//        .probe20(DynLevel), // input wire [1:0]  probe20 
//        .probe21(startEndAddr), // input wire [7:0]  probe21 
//        .probe22(startAddr), // input wire [3:0]  probe22 
//        .probe23(endAddr), // input wire [3:0]  probe23 
//        .probe24(TileAddr), // input wire [3:0]  probe24 
//        .probe25(Tile), // input wire [3:0]  probe25 
//        .probe26(1'd0), // input wire [0:0]  probe26 
//        .probe27(RecList_wrEn), // input wire [0:0]  probe27 
//        .probe28(RecList_wrAddr), // input wire [4:0]  probe28 
//        .probe29(RecList_wrData), // input wire [3:0]  probe29 
//        .probe30(AllocatedTiles_Len), // input wire [4:0]  probe30 
//        .probe31(next_state), // input wire [4:0]  probe31 
//        .probe32(cur_state) // input wire [4:0]  probe32
//    );
endmodule
