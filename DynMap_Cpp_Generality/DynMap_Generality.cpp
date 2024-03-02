#include "DynMap_Generality.hpp"

// record the dynamic placement of curOpt
void PlacementDynamic_Record(Tile tile){
    int tileId = tile.ID;
    placement_dynamic[IDX_pd][tileId] = curOpt;
    placement_dynamic_occupy[IDX_pd_modulo][tileId] = 1;
    placement_dynamic_dict_Opt2Tile[curOpt] = tile;
    placement_dynamic_dict_Opt2PC[curOpt] = IDX_pd;
    placement_done[curOpt] = 1;
} 

void Calculate_CurToPred_Distance(){
    predTile1 = placement_dynamic_dict_Opt2Tile[predOpt1];
    xDiff_CurToPred1 = abs(curTile.X - predTile1.X);
    yDiff_CurToPred1 = abs(curTile.Y - predTile1.Y);
}

bool CurToPred_Distance_Satisfy_Topology(){
    if(architecture == "OpenCGRA"){
        return (xDiff_CurToPred1 <= xDiff_Limit) && (yDiff_CurToPred1 <= yDiff_Limit);
    }
    else if(architecture == "MorphoSys"){
        if(xDiff_CurToPred1 == 0){
            return (abs(yDiff_CurToPred1) <= 2) || (abs(yDiff_CurToPred1) == cgra_size - 1);
        }
        else if(yDiff_CurToPred1 == 0){
            return (abs(xDiff_CurToPred1) <= 2) || (abs(xDiff_CurToPred1) == cgra_size - 1);
        }
        else{
            return false;
        }
    }
    else if(architecture == "HReA"){
        if(xDiff_CurToPred1 == 0){
            return (abs(yDiff_CurToPred1) <= 2) || (abs(yDiff_CurToPred1) == cgra_size - 1);
        }
        else if(yDiff_CurToPred1 == 0){
            return (abs(xDiff_CurToPred1) <= 2) || (abs(xDiff_CurToPred1) == cgra_size - 1);
        }
        else if((abs(xDiff_CurToPred1) <= 1) && (abs(yDiff_CurToPred1) <= 1)){
            return true;
        }
        else{
            return false;
        }
    }
    else if(architecture == "HyCube"){
        return true;
    }
    else{
        return false;
    }
}

void DynamicPlacement_SrcTgtInit_BypassMode(string srcOpt, string tgtOpt){
    bypassSrcOpt = srcOpt;
    bypassTgtOpt = tgtOpt;
    bypassSrcTile = placement_dynamic_dict_Opt2Tile[bypassSrcOpt];
    bypassTgtTile = placement_dynamic_dict_Opt2Tile[bypassTgtOpt];
    idx_pd = find(allocated_tiles.begin(), allocated_tiles.end(), bypassSrcTile) - allocated_tiles.begin();
    
    if (placement_done[srcOpt] == 1) dependency_forward = true;
    else dependency_forward = false;
    dependency_backward = !dependency_forward;
}

void Dependency_Update_BypassMode_SrcTgt(){
    if (dependency_forward == true){
        // update successor of bypassSrcOpt        
        vector<string>::iterator iter = dependency_successor[bypassSrcOpt].begin();
        while (iter != dependency_successor[bypassSrcOpt].end())
        {
            if (*iter == bypassTgtOpt){
                dependency_successor[bypassSrcOpt].erase(iter);
                break;
            }
            else iter++;
        }
        dependency_successor[bypassSrcOpt].push_back(bypassOpt);

        // update predecessor and successor of bypassOpt
        dependency_predecessor[bypassOpt].push_back(bypassSrcOpt);
        dependency_successor[bypassOpt].push_back(bypassTgtOpt);

        // update predecessor of bypassTgtOpt
        iter = dependency_predecessor[bypassTgtOpt].begin();
        while (iter != dependency_predecessor[bypassTgtOpt].end())
        {
            if (*iter == bypassSrcOpt){
                dependency_predecessor[bypassTgtOpt].erase(iter);
                break;
            }
            else iter++;
        }
        dependency_predecessor[bypassTgtOpt].push_back(bypassOpt);
    }

    if (dependency_backward == true){
        // update predecessor of bypassSrcOpt
        vector<string>::iterator iter = dependency_predecessor[bypassSrcOpt].begin();
        while (iter != dependency_predecessor[bypassSrcOpt].end())
        {
            if (*iter == bypassTgtOpt){
                dependency_predecessor[bypassSrcOpt].erase(iter);
                break;
            }
        }
        dependency_predecessor[bypassSrcOpt].push_back(bypassOpt);

        // update successor and predecessor of bypassOpt
        dependency_successor[bypassOpt].push_back(bypassSrcOpt);
        dependency_predecessor[bypassOpt].push_back(bypassTgtOpt);

        // update successor of bypassTgtOpt
        iter = dependency_successor[bypassTgtOpt].begin();
        while (iter != dependency_successor[bypassTgtOpt].end())
        {
            if (*iter == bypassSrcOpt){
                dependency_successor[bypassTgtOpt].erase(iter);
                break;
            }
        }
        dependency_successor[bypassTgtOpt].push_back(bypassOpt);
    }
}

void Update_BypassSrcInfo(){
    bypassSrcOpt = bypassOpt;
    bypassSrcTile = placement_dynamic_dict_Opt2Tile[bypassSrcOpt];
}

void Caculate_SrcToTgt_Distance_BypassMode(){
    // calculate x and y difference between bypassSrcOpt and bypassTgtOpt
    xDiff_BypassSrcToTgt = abs(bypassTgtTile.X - bypassSrcTile.X);
    yDiff_BypassSrcToTgt = abs(bypassTgtTile.Y - bypassSrcTile.Y);
} 

bool SrcToTgt_Distance_Satisfy_Topology_BypassMode(){
    // check whether the placement of bypassSrcOpt and bypassTgtOpt satisfy the topology
    if(architecture == "OpenCGRA"){
        return (xDiff_BypassSrcToTgt <= xDiff_Limit) && (yDiff_BypassSrcToTgt <= yDiff_Limit);
    }
    else if(architecture == "MorphoSys"){
        if(xDiff_BypassSrcToTgt == 0){
            return (abs(yDiff_BypassSrcToTgt) <= 2) || (abs(yDiff_BypassSrcToTgt) == cgra_size - 1);
        }
        else if(yDiff_BypassSrcToTgt == 0){
            return (abs(xDiff_BypassSrcToTgt) <= 2) || (abs(xDiff_BypassSrcToTgt) == cgra_size - 1);
        }
        else{
            return false;
        }
    }
    else if(architecture == "HReA"){
        if(xDiff_BypassSrcToTgt == 0){
            return (abs(yDiff_BypassSrcToTgt) <= 2) || (abs(yDiff_BypassSrcToTgt) == cgra_size - 1);
        }
        else if(yDiff_BypassSrcToTgt == 0){
            return (abs(xDiff_BypassSrcToTgt) <= 2) || (abs(xDiff_BypassSrcToTgt) == cgra_size - 1);
        }
        else if((abs(xDiff_BypassSrcToTgt) <= 1) && (abs(yDiff_BypassSrcToTgt) <= 1)){
            return true;
        }
        else{
            return false;
        }
    }
    else if(architecture == "HyCube"){
        return true;
    }
    else{
        return false;
    }
}

int Bypass_XbarIn_Direction(int xDiff, int yDiff){
    // N:1 S:2 E:3 W:4 NE:5 SE:6 NW:7 SW:8
    if(xDiff < 0){
        if(yDiff < 0) return 6;
        else if(yDiff > 0) return 5;
        else return 3; // yDiff == 0
    }
    else if(xDiff > 0){
        if(yDiff < 0) return 8;
        else if(yDiff > 0) return 7;
        else return 4; // yDiff == 0
    }    
    else{ // xDiff == 0
        if(yDiff < 0) return 2;
        else if(yDiff > 0) return 1;
        else return 0; // yDiff == 0, illegal
    }
}

int Bypass_XbarOut_Direction(int xDiff, int yDiff){
    // N:1 S:2 E:3 W:4 NE:5 SE:6 NW:7 SW:8
    if(xDiff < 0){
        if(yDiff < 0) return 7;
        else if(yDiff > 0) return 8;
        else return 4; // yDiff == 0
    }
    else if(xDiff > 0){
        if(yDiff < 0) return 5;
        else if(yDiff > 0) return 6;
        else return 3; // yDiff == 0
    }
    else{ // xDiff == 0
        if(yDiff < 0) return 1;
        else if(yDiff > 0) return 2;
        else return 0; // yDiff == 0, illegal
    }
}

bool BypassOptPlacement_Gen_Record(){ // record the dynamic placement of bypass operation
    bypassOpt = "bypass" + to_string(bypassOptIdx);
    bypassOptIdx += 1;
    IDX_pd_bypass = placement_dynamic_dict_Opt2PC[bypassSrcOpt] + 1;
    int IDX_pd_bypass_modulo = IDX_pd_bypass % DynamicPlacement_II;
    int upperLimit = IDX_pd_bypass + DynamicPlacement_II;

    //////////////////////////////////////// decide the Tile of bypassOpt //////////////////////////////
    int x, y, xDiff, yDiff;
    for(auto stride : bpsStride_architecture[architecture]){
        // decide Tile x coordinate
        if(bypassSrcTile.X < bypassTgtTile.X){
            x = bypassSrcTile.X + stride[0];
            xDiff = stride[0];
        }
        else if(bypassSrcTile.X == bypassTgtTile.X){
            x = bypassSrcTile.X;
            xDiff = 0;
        }
        else{
            x = bypassSrcTile.X - stride[0];
            xDiff = -stride[0];
        }
        // decide Tile y coordinate
        if(bypassSrcTile.Y < bypassTgtTile.Y){
            y = bypassSrcTile.Y + stride[1];
            yDiff = stride[1];
        }
        else if(bypassSrcTile.Y == bypassTgtTile.Y){
            y = bypassSrcTile.Y;
            yDiff = 0;
        }
        else{
            y = bypassSrcTile.Y - stride[1];
            yDiff = -stride[1];
        }

        // calibration to illegal x and y
        if((x > cgra_size - 1) || (y > cgra_size - 1)) continue;
        x = (x < 0) ? (cgra_size + x) : x; 
        y = (y < 0) ? (cgra_size + y) : y;

        // check whether Tile is legal
        if (find(allocated_tiles.begin(), allocated_tiles.end(), xy2Tile[x][y]) != allocated_tiles.end()) break;
    }

    idx_pd = find(allocated_tiles.begin(), allocated_tiles.end(), xy2Tile[x][y]) - allocated_tiles.begin();
    int tileId = allocated_tiles[idx_pd].ID;
    int dirInIdx = Bypass_XbarIn_Direction(xDiff, yDiff);
    int dirOutIdx = Bypass_XbarOut_Direction(xDiff, yDiff);

    //////////////////////////////////////// decide IDX_pd of bypassOpt /////////////////////////////////
    while(true){
        // check whether tile under IDX_pd is occupied
        int formerPC = (IDX_pd_bypass_modulo == 0) ? (DynamicPlacement_II - 1) : (IDX_pd_bypass_modulo - 1); // avoid negative array index
        int inportConflict = placement_dynamic_bypass_occupy[IDX_pd_bypass_modulo][tileId][dirInIdx-1];
        int outportConflict = placement_dynamic_bypass_occupy[formerPC][bypassSrcTile.ID][dirOutIdx+8-1];
        if((!inportConflict && !outportConflict) == true){ // both requested inport and outport are not occupied
            int page = 0; // to record overlapped bypassOpt that using different inport and output
            while (true) // finish the placement of bypassOpt
            {
                if(placement_dynamic_bypass[page][IDX_pd_bypass][tileId] == ""){
                    // record the placement of bypassOpt
                    placement_dynamic_bypass[page][IDX_pd_bypass][tileId] = bypassOpt;
                    placement_dynamic_bypass_occupy[IDX_pd_bypass_modulo][tileId][dirInIdx-1] = 1;
                    placement_dynamic_bypass_occupy[formerPC][bypassSrcTile.ID][dirOutIdx+8-1] = 1;
                    placement_dynamic_dict_Opt2Tile[bypassOpt] = allocated_tiles[idx_pd];
                    placement_dynamic_dict_Opt2PC[bypassOpt] = IDX_pd_bypass;
                    placement_done[bypassOpt] = 1;
                    // cout<<bypassOpt<<" PC "<<IDX_pd_bypass<<" Tile "<<allocated_tiles[idx_pd].ID<<endl;
                    return true;
                }
                page += 1;
                if(page >= bypassMaxPages){
                    // cout<<"Warning! bypass page is larger than the maximum available value"<<endl;
                }
            }
        }

        // occupied, move to next IDX_pd
        IDX_pd_bypass += 1;
        IDX_pd_bypass_modulo = IDX_pd_bypass % DynamicPlacement_II;
        if (IDX_pd_bypass == upperLimit) return false; // move to next tile
    }
} 

bool bypassOptGen_and_Placement(string srcOpt, string tgtOpt){
    DynamicPlacement_SrcTgtInit_BypassMode(srcOpt, tgtOpt); // predOpt1 generate bypass operation to get closer to predOpt2
    while (true)
    {
        if(!BypassOptPlacement_Gen_Record()) return false;
        Dependency_Update_BypassMode_SrcTgt(); // update the dependency of the generated bypassOpt
        Update_BypassSrcInfo(); // switch bypassSrc to the generated bypassOpt
        Caculate_SrcToTgt_Distance_BypassMode(); // calculate distance between bypassSrc and bypassTgt
        if(SrcToTgt_Distance_Satisfy_Topology_BypassMode()) return true; //check if satisfy topology
    } 
}

bool RoutingAvailability_CheckPredecessor_and_Placement(){
    IDX_pd += 1; // initial IDX_pd is the next MRRG cycle after the MRRG cycle of the closest predOpt     
    int initial_IDX_pd = IDX_pd;
    IDX_pd_modulo = IDX_pd % DynamicPlacement_II;
    int initial_IDX_pd_modulo = IDX_pd_modulo;
    int upperLimit = IDX_pd + DynamicPlacement_II;

    // for first DFGNode which doesn't have any predecessors that have finished placement
    if(predecessors.size() == 0){
        Tile firstTile = curOptPotentialPlacement[0]; 
        PlacementDynamic_Record(firstTile); // map it to the first
        return true;
    } 

    // for other DFGNodes, try to map to the Tile with the order in curOptPotentialPlacement
    for(auto tile : curOptPotentialPlacement){
        /////////////////////////////////////////////////////////////////////////////////////////
        // for each tile, check whether needs to enter bypass mode
        bool bypassMode = false;
        vector<string> bypassPreds;
        for(auto pred : predecessors){
            predOpt1 = pred;
            curTile = tile;
            Calculate_CurToPred_Distance();
            if(!CurToPred_Distance_Satisfy_Topology()){
                bypassPreds.push_back(pred);
                bypassMode = true;
            }
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        // The IDX_pd and IDX_pd_modulo in non-bypass mode and bypass mode are different
        if(!bypassMode){ // non-bypass mode, IDX_pd and IDX_pd_modulo are initial value
            // recover IDX_pd and IDX_pd_modulo for each  tile
            IDX_pd = initial_IDX_pd;
            IDX_pd_modulo = initial_IDX_pd_modulo;
        } 
        else{ // bypass mode, there will be an increment to IDX_pd and IDX_pd_modulo due to the existence of intermediate bypassOpts
            int IDX_pd_bypass_MAX = initial_IDX_pd;
            placement_dynamic_dict_Opt2Tile[curOpt] = tile;
            for(auto pred : bypassPreds){
                int IDX_pd_lastBypass = -1;
                if(!bypassOptGen_and_Placement(pred, curOpt)) return false;
                else IDX_pd_lastBypass = IDX_pd_bypass;
                if(IDX_pd_lastBypass > IDX_pd_bypass_MAX) IDX_pd_bypass_MAX = IDX_pd_lastBypass;
            }
            // recover IDX_pd and IDX_pd_modulo for each new tile
            int increment = IDX_pd_bypass_MAX - initial_IDX_pd;
            IDX_pd = initial_IDX_pd + increment;
            IDX_pd_modulo = IDX_pd % DynamicPlacement_II;
            upperLimit = IDX_pd + DynamicPlacement_II;
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        // after IDX_pd and IDX_pd_modulo have been confirmed, perform placement of curOpt
        // try to finish placement pf curOpt at current tile
        while(true){
            // check whether tile under IDX_pd is occupied
            if (placement_dynamic_occupy[IDX_pd_modulo][tile.ID] == 0){ // not occupied
                PlacementDynamic_Record(tile);
                return true;
            } 
            // occupied, move to next IDX_pd
            IDX_pd += 1;
            IDX_pd_modulo = IDX_pd % DynamicPlacement_II;
            if(IDX_pd == upperLimit) break; // move to next tile
        }
    }

    // if all tiles in curOptPotentialPlacement have been retrieved and haven't returned true, indicates the mapping failure of current DynamicPlacement_II
    // cout<<"DFGNode "<<curOpt<<" placement failed"<<endl;
    return false;
} 

void CurOptPotentialPlacement_List_PartialInherit_Gen(){
    // find the level of curOpt in the only one static mapping result under 4x4 CGRA, and take it as the initial level of dynamic placement
    Tile curTileStatic = placement_static_Opt2Tile[curOpt];
    int static_level = placement_static_Tile2Level_architecture[architecture][curTileStatic.ID];
    int dynamic_level = static_level;
    int max_dynamic_level = allocated_tiles_levels_dynamic.size() - 1;
    
    curOptPotentialPlacement.clear();

    for (auto Tile : allocated_tiles_levels_dynamic[dynamic_level]){ // same level
        curOptPotentialPlacement.push_back(Tile);
    }

    // third priority, other Tiles in the rest levels
    int initial_dynamic_level = dynamic_level;
    while(true){
        dynamic_level += 1;
        if(dynamic_level > max_dynamic_level){
            dynamic_level = 0; // go back to the highest level
        }
        if(dynamic_level == initial_dynamic_level) break;
        else{
            for (auto Tile : allocated_tiles_levels_dynamic[dynamic_level]){ // other levels
                curOptPotentialPlacement.push_back(Tile);
            }
        }
    }
}

void CurOptPotentialPlacement_List_PartialInherit_BypassLess_Gen(){
    // find the level of curOpt in the only one static mapping result under 4x4 CGRA, and take it as the initial level of dynamic placement
    Tile curTileStatic = placement_static_Opt2Tile[curOpt];
    int static_level = placement_static_Tile2Level_architecture[architecture][curTileStatic.ID];
    int dynamic_level = static_level;
    int max_dynamic_level = allocated_tiles_levels_dynamic.size() - 1;
    
    curOptPotentialPlacement.clear();

    // same level, highest priority
    map<int, Tile> bypassNums_Tile; 
    int xdiff, ydiff;
    Tile predTile;
    for (auto tile : allocated_tiles_levels_dynamic[dynamic_level]){ 
        int numBypass = 0;
        for(auto pred : predecessors){
            predTile = placement_dynamic_dict_Opt2Tile[pred];
            xdiff = abs(tile.X - predTile.X);
            ydiff = abs(tile.Y - predTile.Y);
            numBypass += (max(xdiff, ydiff) - 1);
        }
        bypassNums_Tile[numBypass] = tile;
    }
    for (auto iter : bypassNums_Tile){ // map is sorted by key from smallest to largest by default, and tile with fewer bypass nodes has higher priority 
        curOptPotentialPlacement.push_back(iter.second);
    }

    // third priority, other Tiles in the rest levels
    int initial_dynamic_level = dynamic_level;
    while(true){
        dynamic_level += 1;
        if(dynamic_level > max_dynamic_level){
            dynamic_level = 0; // go back to the highest level
        }
        if(dynamic_level == initial_dynamic_level) break;
        else{
            map<int, Tile> bypassNums_Tile; 
            int xdiff, ydiff;
            Tile predTile;
            for (auto tile : allocated_tiles_levels_dynamic[dynamic_level]){ 
                int numBypass = 0;
                for(auto pred : predecessors){
                    predTile = placement_dynamic_dict_Opt2Tile[pred];
                    xdiff = abs(tile.X - predTile.X);
                    ydiff = abs(tile.Y - predTile.Y);
                    numBypass += (max(xdiff, ydiff) - 1);
                }
                bypassNums_Tile[numBypass] = tile;
            }
            for (auto iter : bypassNums_Tile){ // map is sorted by key from smallest to largest by default, and tile with fewer bypass nodes has higher priority 
                curOptPotentialPlacement.push_back(iter.second);
            }
        }
    }
}

// modulo scheduling + placement + routing (implicit)
bool dynamic_placement_routing(){
    int placedOpts_Counter = 0;
    for(auto staticOpt : placement_static){
        curOpt = staticOpt;
        predecessors.clear();
        IDX_pd = -1;
        vector<string> preds = dependency_predecessor[curOpt];
        for(int predIdx = 0; predIdx < preds.size(); predIdx++){
            string pred = preds[predIdx];
            if(placement_done[pred] == 0){ // if pred has not been placed
                // and curOpt and pred is not in the same ring
                if (find(dependency_predecessor[pred].begin(), dependency_predecessor[pred].end(), curOpt) == dependency_predecessor[pred].end()){
                    dependency_predecessor[pred].push_back(curOpt);
                }
            }
            else{ // calibrate IDX_pd to the maximum IDX_pd that predecessors have been placed
                predecessors.push_back(pred);
                if(placement_dynamic_dict_Opt2PC[pred] > IDX_pd){
                    IDX_pd = placement_dynamic_dict_Opt2PC[pred];
                }
            }
        }

        // placement recommendation
        if(placedOpts_Counter < threshold) CurOptPotentialPlacement_List_PartialInherit_Gen();
        else CurOptPotentialPlacement_List_PartialInherit_BypassLess_Gen();

        // placement&routing
        if(RoutingAvailability_CheckPredecessor_and_Placement()){
            // cout<<"curOpt is: "<<curOpt<<", PC "<<placement_dynamic_dict_Opt2PC[curOpt]<<", Tile "<<placement_dynamic_dict_Opt2Tile[curOpt].ID<<endl;
            placedOpts_Counter += 1;
            continue; // if current DFGNode mapping success, go to next DFGNode
        } 
        else return false;
    }
    return true;
}

void opcode_generation(int TileID){
    // opcode should be a integer in actual deployment, string here is just for demonstration purpose
    if(curOpt.find("bypass") != string::npos) opcode = "bypass";
    else opcode = curOpt;
    cout<<"PC = "<<placement_dynamic_dict_Opt2PC[curOpt]<<", Tile "<<TileID<<", opcode = "<<curOpt<<endl;
}

int CrossbarInIdx_Generation_FromWhichLocalReg(int idxIn){
    // use the same LocalReg when consecutively generating control signal for a single operation
    return idxIn; 
}

int CrossbarOutIdx_Generation_ToWhichLocalReg(int PC, int TileID){
    if (local_register_status[PC][TileID][0] == 0) return 11; // LocalReg 0
    else if (local_register_status[PC][TileID][1] == 0) return 12;// LocalReg 1
    else if (local_register_status[PC][TileID][2] == 0) return 13;// LocalReg 2
    else if (local_register_status[PC][TileID][3] == 0) return 14;// LocalReg 3
    else if (local_register_status[PC][TileID][4] == 0) return 15;// LocalReg 4
    else if (local_register_status[PC][TileID][5] == 0) return 16;// LocalReg 5
    else if (local_register_status[PC][TileID][6] == 0) return 17;// LocalReg 6
    else if (local_register_status[PC][TileID][7] == 0) return 18;// LocalReg 7
    else if (local_register_status[PC][TileID][8] == 0) return 19;// LocalReg 8
    else if (local_register_status[PC][TileID][9] == 0) return 20;// LocalReg 9
    else if (local_register_status[PC][TileID][10] == 0) return 21; // LocalReg 10
    else if (local_register_status[PC][TileID][11] == 0) return 22; // LocalReg 11
    else if (local_register_status[PC][TileID][12] == 0) return 23; // LocalReg 12
    else if (local_register_status[PC][TileID][13] == 0) return 24; // LocalReg 13
    else if (local_register_status[PC][TileID][14] == 0) return 25; // LocalReg 14
    else if (local_register_status[PC][TileID][15] == 0) return 26; // LocalReg 15
    else return 0; // illegal
}

int CrossbarInIdx_Generation_FromWhichFuncUnitOutput(){
    // default only route FU_output[0], whose index is 9 as the former 8 positions for 8 Tiles
    return 9; 
}

int CrossbarOutIdx_Generation_ToWhichFuncUnitInput(int PC, int TileID){
    if (compute_register_status[PC][TileID][0] == 0) return 9; // ComputeReg 0
    else if (compute_register_status[PC][TileID][1] == 0) return 10; // ComputeReg 1
    else return 9; // bugs here, insufficient ComputeReg, should be fixed later    
}
    
int CrossbarInIdx_Generation_FromWhichDirectionTile(){
    int xDiff = srcTile.X - tgtTile.X;
    int yDiff = srcTile.Y - tgtTile.Y;
    // N:1 S:2 E:3 W:4 NE:5 SE:6 NW:7 SW:8
    if(xDiff <= -1){
        if (yDiff <= -1) return 7;
        else if (yDiff >= 1) return 8;
        else return 4; // yDiff == 0
    }
    else if(xDiff >= 1){
        if (yDiff <= -1) return 5;
        else if (yDiff >= 1) return 6;
        else return 3; // yDiff == 0
    }
    else{ // xDiff == 0
        if (yDiff <= -1) return 1;
        else if (yDiff >= 1) return 2;
        else return 0; // yDiff == 0, illegal
    }
}

int CrossbarOutIdx_Generation_ToWhichRouteReg(){
    int xDiff = srcTile.X - tgtTile.X;
    int yDiff = srcTile.Y - tgtTile.Y;
    // N:1 S:2 E:3 W:4 NE:5 SE:6 NW:7 SW:8
    if(xDiff <= -1){
        if (yDiff <= -1) return 6;
        else if (yDiff >= 1) return 5;
        else return 3; // yDiff == 0
    }
    else if(xDiff >= 1){
        if (yDiff <= -1) return 8;
        else if (yDiff >= 1) return 7;
        else return 4; // yDiff == 0
    }
    else{ // xDiff == 0
        if (yDiff <= -1) return 2;
        else if (yDiff >= 1) return 1;
        else return 0; // yDiff == 0, illegal
    }
}

int CrossBar_Type1_ControlSignal_Generation(int PC, int TileID){ // generate type 1 crossbar control signal
    int high4bits = CrossbarInIdx_Generation_FromWhichFuncUnitOutput();
    int low4bits = CrossbarOutIdx_Generation_ToWhichLocalReg(PC, TileID);
    local_register_status[PC][TileID][low4bits-11] = 1; // current LocalReg has been occupied
    cout<<"Successors: PC = "<<PC<<", Tile "<<TileID<<", CrossbarCtrlSig = FU_output "<<high4bits-9<<" -> "<<"LocalReg "<<low4bits-11<<endl;    
    return low4bits;
} 
    
void CrossBar_Type2_ControlSignal_Generation(int PC, int TileID){ // generate type 2 crossbar control signal
    int high4bits = CrossbarInIdx_Generation_FromWhichFuncUnitOutput();
    int low4bits = CrossbarOutIdx_Generation_ToWhichFuncUnitInput(PC, TileID);
    compute_register_status[PC][TileID][low4bits-9] = 1; // current ComputeReg has been occupied
    cout<<"Successors: PC = "<<PC<<", Tile "<<TileID<<", CrossbarCtrlSig = FU_output "<<high4bits-9<<" -> "<<"ComputeReg "<<low4bits-9<<endl;    
} 

void CrossBar_Type3_ControlSignal_Generation(int PC, int TileID){ // generate type 3 crossbar control signal
    int high4bits = CrossbarInIdx_Generation_FromWhichFuncUnitOutput();
    int low4bits = CrossbarOutIdx_Generation_ToWhichRouteReg();
    cout<<"Successors: PC = "<<PC<<", Tile "<<TileID<<", CrossbarCtrlSig = FU_output "<<high4bits-9<<" -> "<<"RouteReg "<<low4bits-1<<" (TileDir "<<low4bits<<")"<<endl;    
} 

void CrossBar_Type4_ControlSignal_Generation(int LocalRegIdx, int i, int PC, int TileID){ // generate type 4 crossbar control signal
    int high4bits = CrossbarInIdx_Generation_FromWhichLocalReg(LocalRegIdx);
    int low4bits = high4bits;
    local_register_status[PC+i+1][TileID][LocalRegIdx-11] = 1; // current LocalReg has been occupied
    cout<<"Successors: PC = "<<PC+i+1<<", Tile "<<TileID<<", CrossbarCtrlSig = LocalReg "<<high4bits-11<<" -> "<<"LocalReg "<<low4bits-11<<endl;    
} 

void CrossBar_Type5_ControlSignal_Generation(int LocalRegIdx, int PCvar, int PC, int TileID){ // generate type 5 crossbar control signal
    int high4bits = CrossbarInIdx_Generation_FromWhichLocalReg(LocalRegIdx);
    int low4bits = CrossbarOutIdx_Generation_ToWhichFuncUnitInput(PC+PCvar, TileID);
    compute_register_status[PC+PCvar][TileID][low4bits-9] = 1; // current ComputeReg has been occupied
    local_register_status[PC+PCvar][TileID][high4bits-11] = 1; // current LocalReg has been occupied
    cout<<"Successors: PC = "<<PC+PCvar<<", Tile "<<TileID<<", CrossbarCtrlSig = LocalReg "<<high4bits-11<<" -> "<<"ComputeReg "<<low4bits-9<<endl;    
} 

void CrossBar_Type6_ControlSignal_Generation(int LocalRegIdx, int PCvar, int PC, int TileID){ // generate type 6 crossbar control signal
    int high4bits = CrossbarInIdx_Generation_FromWhichLocalReg(LocalRegIdx);
    int low4bits = CrossbarOutIdx_Generation_ToWhichRouteReg();
    local_register_status[PC+PCvar][TileID][LocalRegIdx-11] = 1;
    cout<<"Successors: PC = "<<PC+PCvar<<", Tile "<<TileID<<", CrossbarCtrlSig = LocalReg "<<high4bits-11<<" -> "<<"RouteReg "<<low4bits-1<<" (TileDir "<<low4bits<<")"<<endl; 
} 

void CrossBar_Type8_ControlSignal_Generation(int PC, int TileID){ // generate type 8 crossbar control signal
    int high4bits = CrossbarInIdx_Generation_FromWhichDirectionTile();
    int low4bits = CrossbarOutIdx_Generation_ToWhichFuncUnitInput(PC, TileID);
    compute_register_status[PC][TileID][low4bits-9] = 1; // current ComputeReg has been occupied
    cout<<"Predecessors: PC = "<<PC<<", Tile "<<TileID<<", CrossbarCtrlSig = TileDir "<<high4bits<<" -> "<<"ComputeReg "<<low4bits-9<<endl;
} 

void CrossBar_Type9_ControlSignal_Generation(int PC, int TileID){ // generate type 9 crossbar control signal
    int high4bits = CrossbarInIdx_Generation_FromWhichDirectionTile();
    int low4bits = CrossbarOutIdx_Generation_ToWhichRouteReg();
    cout<<"Predecessors: PC = "<<PC<<", Tile "<<TileID<<", CrossbarCtrlSig = TileDir "<<high4bits<<" -> "<<"RouteReg "<<low4bits-9<<endl;
}

void crossbar_8bitsControlSignal_predecessors_generation(int TileID){
    for(auto predOpt : dependency_predecessor[curOpt]){
        srcOpt = predOpt;
        tgtOpt = curOpt;
        srcTile = placement_dynamic_dict_Opt2Tile[srcOpt];
        tgtTile = placement_dynamic_dict_Opt2Tile[tgtOpt];
        bool eq = (srcTile.ID == tgtTile.ID);
        int PC = placement_dynamic_dict_Opt2PC[curOpt] - 1;
        if(PC < 0) PC += DynamicPlacement_II;
        if(!eq == true){ // only different Tile requires Type 8 or Type 9 configuration
            if(curOpt.find("bypass") != string::npos) CrossBar_Type9_ControlSignal_Generation(PC, TileID); // bypass operation 
            else CrossBar_Type8_ControlSignal_Generation(PC, TileID); // normal compute operation
        }
    }
}

void crossbar_8bitsControlSignal_successors_generation(int TileID){
    for(auto succOpt : dependency_successor[curOpt]){
        srcOpt = curOpt;
        tgtOpt = succOpt;
        if(tgtOpt != "N/A"){
            srcTile = placement_dynamic_dict_Opt2Tile[srcOpt];
            tgtTile = placement_dynamic_dict_Opt2Tile[tgtOpt];
            int srcPC = placement_dynamic_dict_Opt2PC[srcOpt];
            int tgtPC = placement_dynamic_dict_Opt2PC[tgtOpt];
            int diff = tgtPC - srcPC;
            bool eq = (srcTile.ID == tgtTile.ID);

            // calibration: diff smaller than 0 represents srcTile in current iteration should transfer results to tgtTile in the next iteration
            if(diff < 0){ 
                diff = tgtPC + DynamicPlacement_II - srcPC;
                tgtPC += DynamicPlacement_II;
            }

            if(diff == 1 && eq == 1) CrossBar_Type2_ControlSignal_Generation(srcPC, TileID); // Only Type2
            else if(diff == 1 && eq != 1) CrossBar_Type3_ControlSignal_Generation(srcPC, TileID); // Only Type3
            else if(diff == 2 && eq == 1){ // Type1 + Type5
                int LocalRegIdx = CrossBar_Type1_ControlSignal_Generation(srcPC, TileID);
                CrossBar_Type5_ControlSignal_Generation(LocalRegIdx, 1, srcPC, TileID);
            }
            else if(diff == 2 && eq != 1){ // Type1 + Type6
                int LocalRegIdx = CrossBar_Type1_ControlSignal_Generation(srcPC, TileID);
                CrossBar_Type6_ControlSignal_Generation(LocalRegIdx, 1, srcPC, TileID);
            }
            else if(diff > 2 and eq == 1){ // Type1 + n*Type4 + Type5
                int LocalRegIdx = CrossBar_Type1_ControlSignal_Generation(srcPC, TileID);
                for(int i = 0; i < (diff-2); i++) CrossBar_Type4_ControlSignal_Generation(LocalRegIdx, i, srcPC, TileID);
                CrossBar_Type5_ControlSignal_Generation(LocalRegIdx, -1, tgtPC, TileID);  
            } 
            else if(diff > 2 and eq != 1){ // Type1 + n*Type4 + Type6
                int LocalRegIdx = CrossBar_Type1_ControlSignal_Generation(srcPC, TileID);
                for(int i = 0; i < (diff-2); i++) CrossBar_Type4_ControlSignal_Generation(LocalRegIdx, i, srcPC, TileID);
                CrossBar_Type6_ControlSignal_Generation(LocalRegIdx, -1, tgtPC, TileID);
            }
        }
        else continue;
    }
}

void configuration_generation(){
    for(auto staticOpt : placement_static){
        curOpt = staticOpt;
        curTile = placement_dynamic_dict_Opt2Tile[curOpt];

        // step 1: generate FU onfiguration
        opcode_generation(curTile.ID);
        
        // step 2: generate CrossBar onfiguration related to predecessors
        crossbar_8bitsControlSignal_predecessors_generation(curTile.ID); 
        
        // step 3: generate CrossBar onfiguration related to successors
        crossbar_8bitsControlSignal_successors_generation(curTile.ID);

        cout<<"----------------------------------------------------------"<<endl;
    }
}

void Reset(string kernel, string shape){
    placement_done = placement_done_kernels[kernel];
    placement_static = placement_static_kernels[kernel];
    placement_static_Opt2Tile = placement_static_Opt2Tile_kernels_architecture[architecture][kernel];
    dependency_predecessor = dependency_predecessors_kernels[kernel];
    dependency_successor = dependency_successors_kernels[kernel];
    allocated_tiles_levels_dynamic = generate_allocated_tiles_levels_dynamic(allocated_tiles_shapes[shape], 
                                                                            topology_architecture[architecture], 
                                                                            eachLevelUsedNumTiles_static_kernels_architecture[architecture][kernel]);
    allocated_tiles = allocated_tiles_shapes[shape];
    IDX_pd = 0; idx_pd = 0; IDX_pd_modulo = 0; IDX_pd_bypass = 0; bypassOptIdx = 0; 
    xDiff_CurToPred1 = 0; yDiff_CurToPred1 = 0; xDiff_BypassSrcToTgt = 0; yDiff_BypassSrcToTgt = 0;
    curOpt = ""; predOpt1 = ""; bypassOpt = ""; bypassSrcOpt = ""; bypassTgtOpt = "";
    curTile = Tile(); predTile1 = Tile(); bypassSrcTile = Tile(); bypassTgtTile = Tile();
    dependency_forward = false; dependency_backward = false;
    predecessors.clear(); curOptPotentialPlacement.clear(); 
    placement_dynamic_dict_Opt2PC.clear(); placement_dynamic_dict_Opt2Tile.clear();
    memset(placement_dynamic, 0, sizeof(placement_dynamic));
    memset(placement_dynamic_bypass, 0, sizeof(placement_dynamic_bypass));
    memset(placement_dynamic_occupy, 0, sizeof(placement_dynamic_occupy));
    memset(placement_dynamic_bypass_occupy, 0, sizeof(placement_dynamic_bypass_occupy));
}

int calculate_startII(string kernel, string shape){
    totalNodes = DFG_NodesCount_kernels[kernel];
    numTiles = CGRA_NumTiles[shape];
    RecMII = DFG_Theoretical_RecMII_kernels[kernel];
    ResMII = ceil(totalNodes / (numTiles * 1.0));
    return max(ResMII, RecMII);
}

void record_mappingResults(string kernel, string shape){
    ofstream dataFile;
    string fileName = "cpp mapping results//" + kernel + " " + shape + ".txt";
    dataFile.open(fileName, ofstream::out | ofstream::trunc);
    for(auto staticOpt : placement_static){ // print mapping results
        dataFile<<staticOpt<<", PC="<<placement_dynamic_dict_Opt2PC[staticOpt]<<", Tile="<<placement_dynamic_dict_Opt2Tile[staticOpt].ID<<endl;
    }
    dataFile<<"Achieved DynamicPlacement_II is "<<DynamicPlacement_II<<endl;
    dataFile<<"threshold is "<<threshold;
    dataFile.close();
}

void compare_mappingResults_withPython(){
    ifstream op;
    for(auto kernel : test_kernels){
        for(auto shape : test_shapes[kernel]){
            string cppResults, pythonResults;
            string cppFileName, pythonFileName;
            cppFileName = "cpp mapping results//" + kernel + " " + shape + ".txt";
            pythonFileName = "python mapping results//" + kernel + " " + shape + ".txt";
            op.open(cppFileName);
            while(!op.eof()) cppResults += op.get();
            op.close();
            op.open(pythonFileName);
            while(!op.eof()) pythonResults += op.get();
            op.close();

            if(cppResults == pythonResults) cout<<"Comparing C++ mapping results of "<<kernel<<" "<<shape<<" to python, same"<<endl;
            else cout<<"Comparing C++ mapping results of "<<kernel<<" "<<shape<<" to python, different"<<endl;
        }
    }
}

vector<vector<Tile>> generate_allocated_tiles_levels_dynamic(vector<Tile> shape_tiles, map<int, vector<Tile>> architecture_topology, vector<float> levels_usedNumTiles_static){
    map<int, vector<Tile>> connected_tiles;
    vector<int> num_Links;
    vector<Tile> sorted_Tiles_withLinks;

    // retrieve the tile in the dynamic allocated shape
    for(auto tile : shape_tiles){
        vector<Tile> topology_tiles = architecture_topology[tile.ID]; // under 4x4 CGRA and current topology, find the tiles that are connected to current tile
        for (auto tp_tile : topology_tiles){ // only keep the topology tiles that contains in the allocated shape tiles
            if (find(shape_tiles.begin(), shape_tiles.end(), tp_tile) != shape_tiles.end()){
                connected_tiles[tile.ID].push_back(tp_tile);
            }
        }
        // if current tile has the number of Link that has never appeared before, save it as a new value
        if (find(num_Links.begin(), num_Links.end(), connected_tiles[tile.ID].size()) == num_Links.end()){ 
            num_Links.push_back(connected_tiles[tile.ID].size());
        }
    }
    sort(num_Links.rbegin(), num_Links.rend()); // sort Links from big to small
    for(auto Links : num_Links){ // sort Tiles according to the Links they have
        for(auto tile : shape_tiles){
            if(Links == connected_tiles[tile.ID].size()){
                sorted_Tiles_withLinks.push_back(tile); continue;
            } 
        }
    }

    vector<vector<Tile>> alloc_tiles_levels_dynamic(static_max_levels_architecture[architecture]); // dynamic better has the same number of levels as the static
    // and the number of tiles in each level should be consistent with that of in the static mapping result under 4x4 CGRA
    // for example, mvt use 4 Tiles belong to level0 in the static mapping result under 4x4 CGRA, then the dynamic's level0 must also have 4 Tiles
    int level0_numTiles = round(shape_tiles.size() * (levels_usedNumTiles_static[0] / levels_usedNumTiles_static[3]));
    int level1_numTiles = round(shape_tiles.size() * (levels_usedNumTiles_static[1] / levels_usedNumTiles_static[3]));
    int level2_numTiles = shape_tiles.size() - level0_numTiles - level1_numTiles;
    for(int i = 0; i < shape_tiles.size(); i++){
        if(i < level0_numTiles) alloc_tiles_levels_dynamic[0].push_back(sorted_Tiles_withLinks[i]);
        else if(i >= level0_numTiles && i < level0_numTiles + level1_numTiles) alloc_tiles_levels_dynamic[1].push_back(sorted_Tiles_withLinks[i]);
        else alloc_tiles_levels_dynamic[2].push_back(sorted_Tiles_withLinks[i]);
    }

    return alloc_tiles_levels_dynamic;
}

void analyze_static_levels_distribution(string kernel){
    placement_static = placement_static_kernels[kernel];
    placement_static_Opt2Tile = placement_static_Opt2Tile_kernels_architecture[architecture][kernel];
    map<int, int> TilesUsedTimes;
    for(int i = 0; i < cgra_size*cgra_size; i++){
        TilesUsedTimes[i] = 0;
    }
    for(auto staticOpt : placement_static){
        Tile curTileStatic = placement_static_Opt2Tile[staticOpt];
        TilesUsedTimes[curTileStatic.ID] += 1;
    }
    
    int numUsedTiles_level_0 = 0;
    int numUsedTiles_level_1 = 0;
    int numUsedTiles_level_2 = 0;
    for(int i = 0; i < cgra_size*cgra_size; i++){
        if(TilesUsedTimes[i] != 0){
            int static_level = placement_static_Tile2Level_architecture[architecture][i];
            if(static_level == 0) numUsedTiles_level_0 += 1;
            else if(static_level == 1) numUsedTiles_level_1 += 1;
            else numUsedTiles_level_2 += 1;
        }
    }
    cout<<"In static mapping result of kernel "<<kernel<<" under 4x4 CGRA, Level_0 Tiles used ["<<numUsedTiles_level_0<<"/4], Level_1 Tiles used ["<<numUsedTiles_level_1<<"/8], Level_2 Tiles used ["<<numUsedTiles_level_2<<"/4]"<<endl;
}

int main(){
    architecture = "OpenCGRA"; // MorphoSys, HReA, HyCube
    cout<<"Architecture is "<<architecture<<endl;

    // manual test
    // string kernel = "mvt";
    // string shape = "8-IA";
    // DynamicPlacement_II = calculate_startII(kernel, shape); 
    // threshold = 5;
    // cout<<"Kernel is: "<<kernel<<", has "<<totalNodes<<" nodes in total"<<endl;
    // cout<<"CGRA shape is: "<<shape<<", has "<<numTiles<<" tiles in total"<<endl;
    // cout<<"Calculated RecMII: "<<RecMII<<", ResMII: "<<ResMII<<", II start with max(RecMII, ResMII)="<<DynamicPlacement_II<<endl;
    // placement_done = placement_done_kernels[kernel];
    // placement_static = placement_static_kernels[kernel];
    // placement_static_Opt2Tile = placement_static_Opt2Tile_kernels[kernel];
    // dependency_predecessor = dependency_predecessors_kernels[kernel];
    // dependency_successor = dependency_successors_kernels[kernel];
    // allocated_tiles_levels_dynamic = allocated_tiles_levels_dynamic_shapes_OpenCGRA[shape];
    // allocated_tiles = allocated_tiles_shapes[shape];
    // dynamic_placement_routing();
    // for(auto staticOpt : placement_static){ // print mapping results
    //     cout<<staticOpt<<", PC="<<placement_dynamic_dict_Opt2PC[staticOpt]<<", Tile="<<placement_dynamic_dict_Opt2Tile[staticOpt].ID<<endl;
    // }

    // auto test
    int test_case = 1;
    typedef high_resolution_clock Clock;
    for(auto kernel : test_kernels){
        analyze_static_levels_distribution(kernel);
        for(auto shape : test_shapes[kernel]){
            int tSum_10times = 0;
            int IISum_10times = 0;
            for(int i = 0; i < 10; i++){ // run for 10 times
                DynamicPlacement_II = calculate_startII(kernel, shape); 
                threshold = 1;
                int tSum_1time = 0;
                int IISum_1time = 0;
                while (true)
                {
                    auto t1 = Clock::now();
                    Reset(kernel, shape);
                    auto t2 = Clock::now();
                    bool success = dynamic_placement_routing();
                    auto t3 = Clock::now();
                    tSum_1time += duration_cast<nanoseconds>(t3 - t2).count() / 1000.0; 

                    if(success){
                        break;
                    }
                    else{
                        if(threshold >= totalNodes){
                            DynamicPlacement_II++;
                            threshold = 1;
                        }
                        else threshold += 1; // stride = 1, best quality. stride = 8, best speed
                    }
                }

                tSum_10times += tSum_1time; // record time consumption and II for current execution
                IISum_10times += DynamicPlacement_II; 
            }

            // record mapping results
            record_mappingResults(kernel, shape);

            cout<<"TestCase:["<<test_case<<"/72] "<<kernel<<" "<<shape<<" mapping complete, average time consumption is "<<tSum_10times/10.0/1000.0<<"ms, threshold is "<<threshold<<", II="<<IISum_10times/10.0<<endl;
            test_case += 1;
        }
    }

    return 0;
}