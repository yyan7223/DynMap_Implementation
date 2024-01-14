`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/15 10:52:38
// Design Name: 
// Module Name: BypassLessUnit
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


module BypassLessUnit(
    input CLK,
    input RST_n,
    output VALID
    );
    
    // public register file and initial value
    reg [17:0] predecessors [255:0];
    reg [3:0] placement_dynamic_Opt2Tile [255:0];
    reg [3:0] Tile2XY [15:0];
    reg [3:0] XY2Tile [15:0];
    reg [0:0] TileLegal [15:0];
    reg [3:0] XYCoordChange [15:0];
    reg [3:0] allocatedTiles [15:0];
    initial begin //ug901_page154
        predecessors[8'd6] = 18'h20405; // DFGNode6 has 2 predecessors including DFGNode4 and DFGNode5
        placement_dynamic_Opt2Tile[4'd4] = 4'd6; placement_dynamic_Opt2Tile[4'd5] = 4'd9; // DFGNode4 has been mapped on Tile6, DFGNode5 has been mapped on Tile9
        Tile2XY[4'd0] = 4'b0000; Tile2XY[4'd1] = 4'b0100; Tile2XY[4'd2] = 4'b1000; Tile2XY[4'd3] = 4'b1100; // Tile0,x=0,y=0; Tile1,x=1,y=0; Tile2,x=2,y=0; Tile3,x=3,y=0
        Tile2XY[4'd4] = 4'b0001; Tile2XY[4'd5] = 4'b0101; Tile2XY[4'd6] = 4'b1001; Tile2XY[4'd7] = 4'b1101; // Tile4,x=0,y=1; Tile5,x=1,y=1; Tile6,x=2,y=1; Tile7,x=3,y=1
        Tile2XY[4'd8] = 4'b0010; Tile2XY[4'd9] = 4'b0110; Tile2XY[4'd10] = 4'b1010; Tile2XY[4'd11] = 4'b1110; // Tile8,x=0,y=2; Tile9,x=1,y=2; Tile10,x=2,y=2; Tile11,x=3,y=2
        Tile2XY[4'd12] = 4'b0011; Tile2XY[4'd13] = 4'b0111; Tile2XY[4'd14] = 4'b1011; Tile2XY[4'd15] = 4'b1111; // Tile12,x=0,y=3; Tile13,x=1,y=3; Tile14,x=2,y=3; Tile15,x=3,y=3
        XY2Tile[4'b0000] = 4'd0; XY2Tile[4'b0100] = 4'd1; XY2Tile[4'b1000] = 4'd2; XY2Tile[4'b1100] = 4'd3; // x=0,y=0,Tile0; x=1,y=0,Tile1; x=2,y=0,Tile2; x=3,y=0,Tile3
        XY2Tile[4'b0001] = 4'd4; XY2Tile[4'b0101] = 4'd5; XY2Tile[4'b1001] = 4'd6; XY2Tile[4'b1101] = 4'd7; // x=0,y=1,Tile4; x=1,y=1,Tile5; x=2,y=1,Tile6; x=3,y=1,Tile7
        XY2Tile[4'b0010] = 4'd8; XY2Tile[4'b0110] = 4'd9; XY2Tile[4'b1010] = 4'd10; XY2Tile[4'b1110] = 4'd11; // x=0,y=2,Tile8; x=1,y=2,Tile9; x=2,y=2,Tile10; x=3,y=2,Tile11
        XY2Tile[4'b0011] = 4'd12; XY2Tile[4'b0111] = 4'd13; XY2Tile[4'b1011] = 4'd14; XY2Tile[4'b1111] = 4'd15; // x=0,y=3,Tile12; x=1,y=3,Tile13; x=2,y=3,Tile14; x=3,y=3,Tile15
        TileLegal[4'd0] = 1'b1; TileLegal[4'd1] = 1'b1; TileLegal[4'd2] = 1'b1; TileLegal[4'd3] = 1'b1; // all Tiles are legal
        TileLegal[4'd4] = 1'b1; TileLegal[4'd5] = 1'b1; TileLegal[4'd6] = 1'b1; TileLegal[4'd7] = 1'b1;
        TileLegal[4'd8] = 1'b1; TileLegal[4'd9] = 1'b1; TileLegal[4'd10] = 1'b1; TileLegal[4'd11] = 1'b1;
        TileLegal[4'd12] = 1'b1; TileLegal[4'd13] = 1'b1; TileLegal[4'd14] = 1'b1; TileLegal[4'd15] = 1'b1;
        XYCoordChange[0] = 4'b1111; XYCoordChange[1] = 4'b1100; XYCoordChange[2] = 4'b1101; // XChange=-1,YChange=-1; XChange=-1,YChange=0; XChange=-1,YChange=1
        XYCoordChange[3] = 4'b0011; XYCoordChange[4] = 4'b0001; // XChange=0,YChange=-1; XChange=0,YChange=1
        XYCoordChange[5] = 4'b0111; XYCoordChange[6] = 4'b0100; XYCoordChange[7] = 4'b0101; // XChange=1,YChange=-1; XChange=1,YChange=0; XChange=1,YChange=1
        allocatedTiles[0] = 4'd0; allocatedTiles[1] = 4'd1; allocatedTiles[2] = 4'd2; allocatedTiles[3] = 4'd3;
        allocatedTiles[4] = 4'd4; allocatedTiles[5] = 4'd5; allocatedTiles[6] = 4'd6; allocatedTiles[7] = 4'd7;
        allocatedTiles[8] = 4'd8; allocatedTiles[9] = 4'd9; allocatedTiles[10] = 4'd10; allocatedTiles[11] = 4'd11;
        allocatedTiles[12] = 4'd12; allocatedTiles[13] = 4'd13; allocatedTiles[14] = 4'd14; allocatedTiles[15] = 4'd15;
    end

    // internal signal
    wire [7:0] DFGNode;
    (* mark_debug="true" *)reg [1:0] counter1;
    (* mark_debug="true" *)wire [17:0] predNodeInfo;
    (* mark_debug="true" *)wire [1:0] predNodeNum;
    (* mark_debug="true" *)wire [7:0] predNode1;
    (* mark_debug="true" *)wire [7:0] predNode2;
    (* mark_debug="true" *)reg [7:0] predNode;
    (* mark_debug="true" *)wire [3:0] predTile;
    (* mark_debug="true" *)wire [3:0] predTileCoord;
    (* mark_debug="true" *)wire [1:0] predTileX;
    (* mark_debug="true" *)wire [1:0] predTileY;
    (* mark_debug="true" *)reg [3:0] predTile1;
    (* mark_debug="true" *)reg [1:0] predTile1_X;
    (* mark_debug="true" *)reg [1:0] predTile1_Y;
    (* mark_debug="true" *)reg [3:0] predTile2;
    (* mark_debug="true" *)reg [1:0] predTile2_X;
    (* mark_debug="true" *)reg [1:0] predTile2_Y;
    (* mark_debug="true" *)reg [3:0] counter2;
    (* mark_debug="true" *)wire [3:0] coordChange;
    (* mark_debug="true" *)wire [1:0] XChange;
    (* mark_debug="true" *)wire [1:0] YChange;
    (* mark_debug="true" *)wire [1:0] surrTileX;
    (* mark_debug="true" *)wire [1:0] surrTileY;
    (* mark_debug="true" *)reg [3:0] surrTile;
    (* mark_debug="true" *)reg [0:0] surrTileLegal;
    (* mark_debug="true" *)reg [1:0] BypassTileX;
    (* mark_debug="true" *)reg [1:0] BypassTileY;
    (* mark_debug="true" *)reg [3:0] BypassTile;
    (* mark_debug="true" *)reg [0:0] BypassTileLegal;
    (* mark_debug="true" *)reg [3:0] potentialList_wrAddr;
    (* mark_debug="true" *)wire [3:0] potentialList_wrData;
    (* mark_debug="true" *)reg potentialList1_wrEn;
    (* mark_debug="true" *)reg potentialList2_wrEn;
    (* mark_debug="true" *)reg potentialList1_Len_wrEn;
    (* mark_debug="true" *)reg potentialList2_Len_wrEn;
    (* mark_debug="true" *)reg [3:0] potentialList1 [15:0];
    (* mark_debug="true" *)reg [3:0] potentialList2 [15:0];
    (* mark_debug="true" *)reg [3:0] potentialList1_Len;
    (* mark_debug="true" *)reg [3:0] potentialList2_Len;
    (* mark_debug="true" *)reg [3:0] potentialList1_rdAddr;
    (* mark_debug="true" *)reg [3:0] potentialList2_rdAddr;
    (* mark_debug="true" *)wire [3:0] potentialList1_rdData;
    (* mark_debug="true" *)wire [3:0] potentialList2_rdData;
    (* mark_debug="true" *)reg [3:0] IntersectList [15:0];
    (* mark_debug="true" *)reg [3:0] IntersectList_wrAddr;
    (* mark_debug="true" *)wire [3:0] IntersectList_wrData;
    (* mark_debug="true" *)wire [3:0] IntersectList_rdAddr;
    (* mark_debug="true" *)wire [3:0] IntersectList_rdData;
    (* mark_debug="true" *)wire IntersectList_wrEn;
    (* mark_debug="true" *)wire Trigger1;
    (* mark_debug="true" *)wire Trigger2;
    (* mark_debug="true" *)reg [3:0] RecList [15:0];
    (* mark_debug="true" *)reg [3:0] RecList_wrAddr;
    (* mark_debug="true" *)reg [3:0] RecList_wrData;
    (* mark_debug="true" *)reg [3:0] RecList_rdAddr;
    (* mark_debug="true" *)wire [3:0] RecList_rdData;
    (* mark_debug="true" *)reg [3:0] Reclist_initialLen;
    (* mark_debug="true" *)reg RecList_wrEn;
    (* mark_debug="true" *)reg [3:0] allocatedTiles_rdAddr;
    (* mark_debug="true" *)wire [3:0] allocatedTiles_rdData;
    (* mark_debug="true" *)reg [1:0] BypassTileX_Change;
    (* mark_debug="true" *)reg [1:0] BypassTileY_Change;
    (* mark_debug="true" *)wire READY;
    
    // FSM state decode   
    parameter            IDLE = 5'd0 ;
    parameter            PreNdFetch = 5'd1 ;
    parameter            PreTiFetch = 5'd2 ;
    parameter            GetSurrTi = 5'd3 ;
    parameter            Transfer = 5'd4 ;
    parameter            CopySurr = 5'd5 ;
    parameter            CopyRest = 5'd6 ;
    parameter            Intersect = 5'd7 ;
    parameter            CopyItst = 5'd8 ;
    parameter            NoItst = 5'd9 ;
    parameter            Done = 5'd10 ;
    
    // FSM state
    (* mark_debug="true" *)reg [4:0] next_state;
    (* mark_debug="true" *)reg [4:0] cur_state;
    
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
                next_state = PreNdFetch;
                
            PreNdFetch:
                next_state = PreTiFetch;
                
            PreTiFetch:
                next_state = GetSurrTi;
                
            GetSurrTi:
                if ((counter2 == 4'd8) && (counter1 != predNodeNum)) begin
                    next_state = PreTiFetch;
                end
                else if ((counter2 == 4'd8) && (counter1 == predNodeNum)) begin
                    next_state = Transfer;
                end
                else begin
                    next_state = GetSurrTi;
                end
                
            Transfer:
                if (predNodeNum == 1'd1) begin // only 1 predecessor
                    next_state = CopySurr;
                end
                else begin // 2 predecessors
                    next_state = Intersect;
                end
                
            Intersect:
                if ((IntersectList_wrAddr == 4'd0) && (potentialList1_rdAddr == potentialList1_Len)) begin
                    next_state = NoItst;
                end
                else if ((IntersectList_wrAddr != 4'd0) && (potentialList1_rdAddr == potentialList1_Len)) begin
                    next_state = CopyItst;
//                    next_state = NoItst; // force convert to NoItst state for simulation
                end
                else begin
                    next_state = Intersect;
                end
                
            CopyItst:
                if (RecList_wrAddr == IntersectList_wrAddr) begin
                    next_state = CopyRest;
                end
                else begin
                    next_state = CopyItst;
                end
            
            CopyRest:
                if ((allocatedTiles_rdAddr == 4'd15) && (RecList_rdAddr == Reclist_initialLen - 4'd1)) begin
                    next_state = Done;
                end
                else begin
                    next_state = CopyRest;
                end    
            
            NoItst:
                if (BypassTile == predTile2) begin
                    next_state = CopyRest;
                end
                else begin
                    next_state = NoItst;
                end    
                
            CopySurr:
                if (RecList_wrAddr == potentialList1_Len) begin
                    next_state = CopyRest;
                end
                else begin
                    next_state = CopySurr;
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
    /******************** not standard, mix of sequential logic and combinatorial logic****************/    
    assign DFGNode = 8'd6;
    assign predNodeInfo = predecessors[DFGNode];
    assign predNodeNum = predNodeInfo[17:16];
    assign predNode1 = predNodeInfo[15:8];
    assign predNode2 = predNodeInfo[7:0];
    assign predTile = placement_dynamic_Opt2Tile[predNode];
    assign predTileCoord = Tile2XY[predTile];
    assign predTileX = predTileCoord[3:2];
    assign predTileY = predTileCoord[1:0];
    assign coordChange = XYCoordChange[counter2];
    assign XChange = coordChange[3:2];
    assign YChange = coordChange[1:0];
    assign potentialList_wrData = surrTile;
    assign potentialList1_rdData = (cur_state == CopySurr) ? potentialList1[RecList_wrAddr] : potentialList1[potentialList1_rdAddr];
    assign potentialList2_rdData = potentialList2[potentialList2_rdAddr];
    assign Trigger1 = (potentialList1_rdData == potentialList2_rdData) || (potentialList2_rdAddr == potentialList2_Len - 4'd1);
    assign IntersectList_wrEn = (potentialList1_rdData == potentialList2_rdData);
    assign IntersectList_wrData = potentialList2_rdData;
    assign IntersectList_rdAddr = RecList_wrAddr;
    assign IntersectList_rdData = IntersectList[IntersectList_rdAddr];
    assign RecList_rdData = RecList[RecList_rdAddr];
    assign allocatedTiles_rdData = allocatedTiles[allocatedTiles_rdAddr];
    assign Trigger2 = (allocatedTiles_rdData == RecList_rdData) || (RecList_rdAddr == Reclist_initialLen - 4'd1);
    assign READY = 1'd0;
    assign VALID = (cur_state == Done) ? 1'd1: 1'd0;
    
    // predNodeSelector
    always@(posedge CLK) begin
        if (!RST_n) begin
            counter1 <= 2'd0;
        end
        else if (cur_state == PreTiFetch) begin
            counter1 <= counter1 + 2'd1;
        end
        else begin
            counter1 <= counter1;
        end
    end
    always@(*) begin
        if (counter1 == 2'd1) begin
            predNode = predNode1;
        end
        else if (counter1 == 2'd2) begin
            predNode = predNode2;
        end
        else begin
            predNode = 4'd0;
        end
    end
    
    // predTile and predTileCoord Register
    always@(posedge CLK) begin
        if (!RST_n) begin
            predTile1 <= 4'd0;
            predTile1_X <= 2'd0;
            predTile1_Y <= 2'd0;
            predTile2 <= 4'd0;
            predTile2_X <= 2'd0;
            predTile2_Y <= 2'd0;
        end
        else if ((cur_state == GetSurrTi) && (counter1 == 2'd1)) begin
            predTile1 <= predTile; // save to predTile1
            predTile1_X <= predTileX;
            predTile1_Y <= predTileY;
            predTile2 <= predTile2; // predTile2 keeps unchanged
            predTile2_X <= predTile2_X;
            predTile2_Y <= predTile2_Y;
        end
        else if ((cur_state == GetSurrTi) && (counter1 == 2'd2)) begin
            predTile1 <= predTile1; // predTile1 keeps unchanged
            predTile1_X <= predTile1_X;
            predTile1_Y <= predTile1_Y;
            predTile2 <= predTile; // save to predTile2
            predTile2_X <= predTileX;
            predTile2_Y <= predTileY;
        end
        else begin
            predTile1 <= predTile1; // All keep unchanged
            predTile1_X <= predTile1_X;
            predTile1_Y <= predTile1_Y;
            predTile2 <= predTile2; 
            predTile2_X <= predTile2_X;
            predTile2_Y <= predTile2_Y;
        end
    end
    
    // XYCoordChange rdAddr generator
    always@(posedge CLK) begin
        if (!RST_n) begin
            counter2 <= 4'd0;
        end
        else if (cur_state == GetSurrTi) begin
            counter2 <= counter2 + 4'd1;
        end
        else begin
            counter2 <= 4'd0;
        end
    end
    
    // surroundTile coordinate calculator
    assign surrTileX = predTileX + XChange;
    assign surrTileY = predTileY + YChange;
    
    // XY2Tile and TileLegal public register file input muxer
    always@(*) begin
        if (cur_state == GetSurrTi) begin 
            surrTile = XY2Tile[{surrTileX, surrTileY}];
            surrTileLegal = TileLegal[surrTile];
            BypassTile = XY2Tile[4'd0];
            BypassTileLegal = TileLegal[4'd0];
        end
        else if (cur_state == NoItst) begin 
            surrTile = XY2Tile[4'd0];
            surrTileLegal = TileLegal[4'd0];
            BypassTile = XY2Tile[{BypassTileX, BypassTileY}];
            BypassTileLegal = TileLegal[BypassTile];
        end
        else begin
            surrTile = XY2Tile[4'd0];
            surrTileLegal = TileLegal[4'd0];        
            BypassTile = XY2Tile[4'd0];
            BypassTileLegal = TileLegal[4'd0];       
        end
    end
    
    // potentialList_wrAddr generator
    always@(posedge CLK) begin
        if (!RST_n) begin
            potentialList_wrAddr <= 4'd0;
        end
        else if ((cur_state == GetSurrTi) && (surrTileLegal == 1'b1) && (counter2 != 4'd8)) begin
            potentialList_wrAddr <= potentialList_wrAddr + 4'd1;
        end
        else if (counter2 == 4'd8) begin
            potentialList_wrAddr <= 4'd0;
        end
        else begin
            potentialList_wrAddr <= potentialList_wrAddr;
        end
    end
    
    // potentialList selector
    always@(*) begin
        if ((cur_state == GetSurrTi) && (counter1 == 2'd1) && (surrTileLegal == 1'b1)) begin
            potentialList1_wrEn = 1'b1;
            potentialList2_wrEn = 1'b0;
        end
        else if ((cur_state == GetSurrTi) && (counter1 == 2'd2) && (surrTileLegal == 1'b1)) begin
            potentialList1_wrEn = 1'b0;
            potentialList2_wrEn = 1'b1;
        end
        else begin
            potentialList1_wrEn = 1'b0;
            potentialList2_wrEn = 1'b0;
        end
    end

    // potentialList_Len selector
    always@(*) begin
        if ((cur_state == GetSurrTi) && (counter1 == 2'd1) && (counter2 == 4'd8)) begin
            potentialList1_Len_wrEn = 1'b1;
            potentialList2_Len_wrEn = 1'b0;
        end
        else if ((cur_state == GetSurrTi) && (counter1 == 2'd2) && (counter2 == 4'd8)) begin
            potentialList1_Len_wrEn = 1'b0;
            potentialList2_Len_wrEn = 1'b1;
        end
        else begin
            potentialList1_Len_wrEn = 1'b0;
            potentialList2_Len_wrEn = 1'b0;  
        end
    end
    
    // potentialList1 and potentialList2 write operation
    genvar i;
    generate    
        for(i = 0; i < 16; i = i + 1) begin // 16 here is the length of allocated_tiles
            always@(posedge CLK) begin
                if (!RST_n) begin
                    potentialList1[i] <= 4'd0;
                    potentialList2[i] <= 4'd0;
                end
                else if ((i == potentialList_wrAddr) && (potentialList1_wrEn == 1'b1)) begin
                    potentialList1[potentialList_wrAddr] <= potentialList_wrData;
                end
                else if ((i == potentialList_wrAddr) && (potentialList2_wrEn == 1'b1)) begin
                    potentialList2[potentialList_wrAddr] <= potentialList_wrData;
                end
                else begin
                    potentialList1[i] <= potentialList1[i];
                    potentialList2[i] <= potentialList2[i];
                end
            end
        end
    endgenerate
    
    // potentialList1_Len and potentialList2_Len write operation
    always@(posedge CLK) begin
        if (!RST_n) begin
            potentialList1_Len <= 4'd0;
            potentialList2_Len <= 4'd0;
        end
        else if (potentialList1_Len_wrEn == 1'b1) begin
            potentialList1_Len <= potentialList_wrAddr;
        end
        else if (potentialList2_Len_wrEn == 1'b1) begin
            potentialList2_Len <= potentialList_wrAddr;
        end
        else begin
            potentialList1_Len <= potentialList1_Len;
            potentialList2_Len <= potentialList2_Len;
        end
    end
    
    // potentialList1_rdAddr generator
    always@(posedge CLK) begin
        if (!RST_n) begin
            potentialList1_rdAddr <= 4'd0;
        end
        else if ((cur_state == Intersect) && (Trigger1 == 1'b1)) begin
            potentialList1_rdAddr <= potentialList1_rdAddr + 4'd1;
        end
        else if ((cur_state == Intersect) && (Trigger1 != 1'b1)) begin
            potentialList1_rdAddr <=  potentialList1_rdAddr;
        end
        else begin
            potentialList1_rdAddr <= 4'd0;
        end
    end    
    
    // potentialList2_rdAddr generator
    always@(posedge CLK) begin
        if (!RST_n) begin
            potentialList2_rdAddr <= 4'd0;
        end
        else if ((cur_state == Intersect) && (Trigger1 == 1'b1)) begin
            potentialList2_rdAddr <= 4'd0;
        end
        else if ((cur_state == Intersect) && (Trigger1 != 1'b1)) begin
            potentialList2_rdAddr <= potentialList2_rdAddr + 4'd1;
        end
        else begin
            potentialList2_rdAddr <= 4'd0;
        end
    end    
    
    // IntersectList_wrAddr generator
    always@(posedge CLK) begin
        if (!RST_n) begin
            IntersectList_wrAddr <= 4'd0;
        end
        else if ((cur_state == Intersect) && (IntersectList_wrEn == 1'b1)) begin
            IntersectList_wrAddr <= IntersectList_wrAddr + 4'd1;
        end
        else begin
            IntersectList_wrAddr <= IntersectList_wrAddr;
        end
    end    
    
    // IntersectList write operation
    generate    
        for(i = 0; i < 16; i = i + 1) begin // 16 here is the length of allocated_tiles
            always@(posedge CLK) begin
                if (!RST_n) begin
                    IntersectList[i] <= 4'd0;
                end
                else if ((i == IntersectList_wrAddr) && (IntersectList_wrEn == 1'b1)) begin
                    IntersectList[IntersectList_wrAddr] <= IntersectList_wrData;
                end
                else begin
                    IntersectList[i] <= IntersectList[i];
                end
            end
        end
    endgenerate
    
    // RecList_wrAddr generator
    always@(posedge CLK) begin
        if (!RST_n) begin
            RecList_wrAddr <= 4'd0;
        end
        else if ((cur_state == CopyItst) && (RecList_wrEn == 1'b1)) begin
            RecList_wrAddr <= RecList_wrAddr + 4'd1;
        end
        else if ((cur_state == CopyRest) && (RecList_wrEn == 1'b1)) begin
            RecList_wrAddr <= RecList_wrAddr + 4'd1;
        end
        else if ((cur_state == NoItst) && (RecList_wrEn == 1'b1)) begin
            RecList_wrAddr <= RecList_wrAddr + 4'd1;
        end
        else if ((cur_state == CopySurr) && (RecList_wrEn == 1'b1)) begin
            RecList_wrAddr <= RecList_wrAddr + 4'd1;
        end
        else begin
            RecList_wrAddr <= RecList_wrAddr;
        end
    end    
    
    //  RecList_wrEn generator
    always@(*) begin
        if ((cur_state == CopyItst) && (RecList_wrAddr < IntersectList_wrAddr)) begin
            RecList_wrEn = 1'b1;
        end
        else if ((cur_state == CopyRest) && (RecList_rdAddr == Reclist_initialLen - 4'd1) && (allocatedTiles_rdData != RecList_rdData)) begin
            RecList_wrEn = 1'b1;
        end
        else if ((cur_state == NoItst) && (BypassTile != predTile1) && (BypassTile != predTile2)) begin
            RecList_wrEn = 1'b1;
        end
        else if ((cur_state == CopySurr) && (RecList_wrAddr < potentialList1_Len)) begin
            RecList_wrEn = 1'b1;
        end
        else begin
            RecList_wrEn = 1'b0;
        end
    end
    
    //  RecList_wrData muxer
    always@(*) begin
        if (cur_state == CopySurr) begin
            RecList_wrData = potentialList1_rdData;
        end
        else if (cur_state == NoItst) begin
            RecList_wrData = BypassTile;
        end
        else if (cur_state == CopyItst) begin
            RecList_wrData = IntersectList_rdData;
        end
        else if (cur_state == CopyRest) begin
            RecList_wrData = allocatedTiles_rdData;
        end
        else begin
            RecList_wrData = 4'd0;
        end
    end
    
    // RecList write operation
    generate    
        for(i = 0; i < 16; i = i + 1) begin // 16 here is the length of allocated_tiles
            always@(posedge CLK) begin
                if (!RST_n) begin
                    RecList[i] <= 4'd0;
                end
                else if ((i == RecList_wrAddr) && (RecList_wrEn == 1'b1)) begin
                    RecList[RecList_wrAddr] <= RecList_wrData;
                end
                else begin
                    RecList[i] <= RecList[i];
                end
            end
        end
    endgenerate
     
    // allocatedTiles_rdAddr generator
    always@(posedge CLK) begin
        if (!RST_n) begin
            allocatedTiles_rdAddr <= 4'd0;
        end
        else if ((cur_state == CopyRest) && (Trigger2 == 1'b1)) begin
            allocatedTiles_rdAddr <= allocatedTiles_rdAddr + 4'd1;
        end
        else if ((cur_state == CopyRest) && (Trigger2 != 1'b1)) begin
            allocatedTiles_rdAddr <=  allocatedTiles_rdAddr;
        end
        else begin
            allocatedTiles_rdAddr <= 4'd0;
        end
    end    
    
    // RecList_rdAddr generator
    always@(posedge CLK) begin
        if (!RST_n) begin
            RecList_rdAddr <= 4'd0;
        end
        else if ((cur_state == CopyRest) && (Trigger2 == 1'b1)) begin
            RecList_rdAddr <= 4'd0;
        end
        else if ((cur_state == CopyRest) && (Trigger2 != 1'b1)) begin
            RecList_rdAddr <= RecList_rdAddr + 4'd1;
        end
        else begin
            RecList_rdAddr <= 4'd0;
        end
    end    
    
    // Reclist_initialLen register
    always@(posedge CLK) begin
        if (!RST_n) begin
            Reclist_initialLen <= 4'd0;
        end
        else if (cur_state != CopyRest) begin
            Reclist_initialLen <= RecList_wrAddr;
        end
        else begin
            Reclist_initialLen <= Reclist_initialLen;
        end
    end    
    
    // BypassTile coordinator calculator
    always@(posedge CLK) begin
        if (!RST_n) begin
            BypassTileX <= 2'd0;
            BypassTileY <= 2'd0;
        end
        else if (cur_state != NoItst) begin
            BypassTileX <= predTile1_X;
            BypassTileY <= predTile1_Y;
        end
        else if (cur_state == NoItst) begin
            BypassTileX <= BypassTileX + BypassTileX_Change;
            BypassTileY <= BypassTileY + BypassTileY_Change;
        end
        else begin
            BypassTileX <= BypassTileX;
            BypassTileY <= BypassTileY;
        end
    end
    
    // BypassTileX_Change generator
    always@(*) begin
        if (BypassTileX < predTile2_X) begin
            BypassTileX_Change = 2'b01;
        end
        else if (BypassTileX == predTile2_X) begin
            BypassTileX_Change = 2'b00;
        end
        else begin // BypassTileX > predTile2_X
            BypassTileX_Change = 2'b11; // -1
        end
    end
    
    // BypassTileY_Change generator
    always@(*) begin
        if (BypassTileY < predTile2_Y) begin
            BypassTileY_Change = 2'b01;
        end
        else if (BypassTileY == predTile2_Y) begin
            BypassTileY_Change = 2'b00;
        end
        else begin // BypassTileY > predTile2_Y
            BypassTileY_Change = 2'b11; // -1
        end
    end
    
endmodule