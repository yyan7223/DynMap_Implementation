#include "DynMap_4HLS.hpp"

// record the dynamic placement of curOpt
void PlacementDynamic_Record(char tile){
    placement_dynamic[IDX_pd][tile] = placement_static_kernels_values[kernel_idx][curOpt_idx];
    placement_dynamic_occupy[IDX_pd_modulo][tile] = 1;
    placement_dynamic_dict_Opt2Tile_values[curOpt_idx] = tile;
    placement_dynamic_dict_Opt2PC_values[curOpt_idx] = IDX_pd;
    placement_done_values[curOpt_idx] = 1;
}

void Calculate_CurToPred_Distance(){
    char keyIdx;
    for(keyIdx = 0; keyIdx < maxNodes; keyIdx++){
        if(placement_dynamic_dict_Opt2Tile_keys[keyIdx] == predOpt1){
            predTile1 = placement_dynamic_dict_Opt2Tile_values[keyIdx];
            break;
        }
    }
    xDiff_CurToPred1 = abs(Tile2XY[curTile][0] - Tile2XY[predTile1][0]);
    yDiff_CurToPred1 = abs(Tile2XY[curTile][1] - Tile2XY[predTile1][1]);
}

bool CurToPred_Distance_Satisfy_Topology(){
    return (xDiff_CurToPred1 <= xDiff_Limit) && (yDiff_CurToPred1 <= yDiff_Limit);
}

void DynamicPlacement_SrcTgtInit_BypassMode(char srcOpt, char tgtOpt){
    bypassSrcOpt = srcOpt;
    bypassTgtOpt = tgtOpt;
    char bypassSrcOpt_placementDone = 0;
    for(bypassSrcOpt_keyIdx = 0; bypassSrcOpt_keyIdx < maxNodes; bypassSrcOpt_keyIdx++){
        if(placement_dynamic_dict_Opt2Tile_keys[bypassSrcOpt_keyIdx] == bypassSrcOpt){
            bypassSrcTile = placement_dynamic_dict_Opt2Tile_values[bypassSrcOpt_keyIdx];
            bypassSrcOpt_placementDone = placement_done_values[bypassSrcOpt_keyIdx];
            break;
        }
    }
    for(bypassTgtOpt_keyIdx = 0; bypassTgtOpt_keyIdx < maxNodes; bypassTgtOpt_keyIdx++){
        if(placement_dynamic_dict_Opt2Tile_keys[bypassTgtOpt_keyIdx] == bypassTgtOpt){
            bypassTgtTile = placement_dynamic_dict_Opt2Tile_values[bypassTgtOpt_keyIdx];
            break;
        }
    }

    if (bypassSrcOpt_placementDone == 1) dependency_forward = true;
    else dependency_forward = false;
    dependency_backward = !dependency_forward;
}

void Dependency_Update_BypassMode_SrcTgt(){
    // firstly find bypassOpt_keyIdx
    for(bypassOpt_keyIdx = 0; bypassOpt_keyIdx < maxNodes; bypassOpt_keyIdx++){
        if(placement_dynamic_dict_Opt2Tile_keys[bypassOpt_keyIdx] == bypassOpt){
            break;
        }
    }
    if (dependency_forward == true){
        // update successor of bypassSrcOpt
        char i;
        for(i = 0; i < maxSuccsNum; i++){
            if(dependency_successor_values[bypassSrcOpt_keyIdx][i] == bypassTgtOpt){
                dependency_successor_values[bypassSrcOpt_keyIdx][i] = bypassOpt;
                break;
            }
        }

        // update predecessor and successor of bypassOpt
        for(i = 0; i < maxPredsNum; i++){
            if(dependency_predecessor_values[bypassOpt_keyIdx][i] == -1){
                dependency_predecessor_values[bypassOpt_keyIdx][i] = bypassSrcOpt;
                break;
            }
        }
        for(i = 0; i < maxSuccsNum; i++){
            if(dependency_successor_values[bypassOpt_keyIdx][i] == -1){
                dependency_successor_values[bypassOpt_keyIdx][i] = bypassTgtOpt;
                break;
            }
        }

        // update predecessor of bypassTgtOpt
        for(i = 0; i < maxPredsNum; i++){
            if(dependency_predecessor_values[bypassTgtOpt_keyIdx][i] == bypassSrcOpt){
                dependency_predecessor_values[bypassTgtOpt_keyIdx][i] = bypassOpt;
                break;
            }
        }
    }

    if (dependency_backward == true){
        // update predecessor of bypassSrcOpt
        char i;
        for(i = 0; i < maxPredsNum; i++){
            if(dependency_predecessor_values[bypassSrcOpt_keyIdx][i] == bypassTgtOpt){
                dependency_predecessor_values[bypassSrcOpt_keyIdx][i] = bypassOpt;
                break;
            }
        }

        // update successor and predecessor of bypassOpt
        for(i = 0; i < maxSuccsNum; i++){
            if(dependency_successor_values[bypassOpt_keyIdx][i] == -1){
                dependency_successor_values[bypassOpt_keyIdx][i] = bypassSrcOpt;
                break;
            }
        }
        for(i = 0; i < maxPredsNum; i++){
            if(dependency_predecessor_values[bypassOpt_keyIdx][i] == -1){
                dependency_predecessor_values[bypassOpt_keyIdx][i] = bypassTgtOpt;
                break;
            }
        }

        // update successor of bypassTgtOpt
        for(i = 0; i < maxSuccsNum; i++){
            if(dependency_successor_values[bypassTgtOpt_keyIdx][i] == bypassSrcOpt){
                dependency_successor_values[bypassTgtOpt_keyIdx][i] = bypassOpt;
                break;
            }
        }
    }
}

void Update_BypassSrcInfo(){
    bypassSrcOpt = bypassOpt;
    for(bypassSrcOpt_keyIdx = 0; bypassSrcOpt_keyIdx < maxNodes; bypassSrcOpt_keyIdx++){
        if(placement_dynamic_dict_Opt2Tile_keys[bypassSrcOpt_keyIdx] == bypassSrcOpt){
            bypassSrcTile = placement_dynamic_dict_Opt2Tile_values[bypassSrcOpt_keyIdx];
            break;
        }
    }
}

void Caculate_SrcToTgt_Distance_BypassMode(){
    // calculate x and y difference between bypassSrcOpt and bypassTgtOpt
    xDiff_BypassSrcToTgt = abs(Tile2XY[bypassTgtTile][0] - Tile2XY[bypassSrcTile][0]);
    yDiff_BypassSrcToTgt = abs(Tile2XY[bypassTgtTile][1] - Tile2XY[bypassSrcTile][1]);
}

bool SrcToTgt_Distance_Satisfy_Topology_BypassMode(){
    // check whether the placement of bypassSrcOpt and bypassTgtOpt satisfy the topology
    return (xDiff_BypassSrcToTgt <= xDiff_Limit) && (yDiff_BypassSrcToTgt <= yDiff_Limit);
}

char Bypass_XbarIn_Direction(char xDiff, char yDiff){
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

char Bypass_XbarOut_Direction(char xDiff, char yDiff){
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
    bypassOpt = bypassOptIdx;
    bypassOptIdx += 1;
    char bypassSrcOptIdx;
    for (bypassSrcOptIdx = 0; bypassSrcOptIdx < maxNodes; bypassSrcOptIdx++){
        if(placement_dynamic_dict_Opt2PC_keys[bypassSrcOptIdx] == bypassSrcOpt) break;
    }

    IDX_pd_bypass = placement_dynamic_dict_Opt2PC_values[bypassSrcOptIdx] + 1;
    char IDX_pd_bypass_modulo = IDX_pd_bypass % DynamicPlacement_II;
    char upperLimit = IDX_pd_bypass + DynamicPlacement_II;

    //////////////////////////////////////// decide the Tile of bypassOpt //////////////////////////////
    char x, y, xDiff, yDiff;
    bool legal = false;
    for(char i = 0; i < 3; i++){
        // decide Tile x coordinate
        if(Tile2XY[bypassSrcTile][0] < Tile2XY[bypassTgtTile][0]){
            x = Tile2XY[bypassSrcTile][0] + bpsStride[i][0];
            xDiff = bpsStride[i][0];
        }
        else if(Tile2XY[bypassSrcTile][0] == Tile2XY[bypassTgtTile][0]){
            x = Tile2XY[bypassSrcTile][0];
            xDiff = 0;
        }
        else{
            x = Tile2XY[bypassSrcTile][0] - bpsStride[i][0];
            xDiff = -bpsStride[i][0];
        }
        // decide Tile y coordinate
        if(Tile2XY[bypassSrcTile][1] < Tile2XY[bypassTgtTile][1]){
            y = Tile2XY[bypassSrcTile][1] + bpsStride[i][1];
            yDiff = bpsStride[i][1];
        }
        else if(Tile2XY[bypassSrcTile][1] == Tile2XY[bypassTgtTile][1]){
            y = Tile2XY[bypassSrcTile][1];
            yDiff = 0;
        }
        else{
            y = Tile2XY[bypassSrcTile][1] - bpsStride[i][1];
            yDiff = -bpsStride[i][1];
        }

        // calibration to illegal x and y
        if((x > cgra_size - 1) || (y > cgra_size - 1)) continue;
        x = (x < 0) ? (cgra_size + x) : x;
        y = (y < 0) ? (cgra_size + y) : y;

        // check whether Tile is legal
        for(char i = 0; i < CGRA_NumTiles_shapes_values[shape_idx]; i++){
            if(allocated_tiles_shapes_values[shape_idx][i] == xy2Tile[x][y]){
                idx_pd = i;
                legal = true;
                break;
            }
        }
        if(legal) break;
    }

    char tileId = allocated_tiles_shapes_values[shape_idx][idx_pd];
    char dirInIdx = Bypass_XbarIn_Direction(xDiff, yDiff);
    char dirOutIdx = Bypass_XbarOut_Direction(xDiff, yDiff);

    //////////////////////////////////////// decide IDX_pd of bypassOpt /////////////////////////////////
    int page = 0; // to record overlapped bypassOpt that using different inport and output
    while(true){
        // check whether tile under IDX_pd is occupied
    	char formerPC = (IDX_pd_bypass_modulo == 0) ? (DynamicPlacement_II - 1) : (IDX_pd_bypass_modulo - 1); // avoid negative array index
        char inportConflict = placement_dynamic_bypass_occupy[IDX_pd_bypass_modulo][tileId][dirInIdx-1];
        char outportConflict = placement_dynamic_bypass_occupy[formerPC][bypassSrcTile][dirOutIdx+8-1];
        if((!inportConflict && !outportConflict) == true){ // both requested inport and outport are not occupied
            while (true) // finish the placement of bypassOpt
            {
                if(placement_dynamic_bypass[page][IDX_pd_bypass][tileId] == -1){ // have not been occupied
                    // record the placement of bypassOpt
                    placement_dynamic_bypass[page][IDX_pd_bypass][tileId] = bypassOpt;
                    placement_dynamic_bypass_occupy[IDX_pd_bypass_modulo][tileId][dirInIdx-1] = 1;
                    placement_dynamic_bypass_occupy[formerPC][bypassSrcTile][dirOutIdx+8-1] = 1;
                    placement_dynamic_dict_Opt2Tile_keys[bypassOpt_wrAddr] = bypassOpt;
                    placement_dynamic_dict_Opt2Tile_values[bypassOpt_wrAddr] = allocated_tiles_shapes_values[shape_idx][idx_pd];
                    placement_dynamic_dict_Opt2PC_keys[bypassOpt_wrAddr] = bypassOpt;
                    placement_dynamic_dict_Opt2PC_values[bypassOpt_wrAddr] = IDX_pd_bypass;
                    placement_done_keys[bypassOpt_wrAddr] = bypassOpt;
                    placement_done_values[bypassOpt_wrAddr] = 1;
                    bypassOpt_wrAddr++;
                    // cout<<bypassOpt<<" PC "<<IDX_pd_bypass<<" Tile "<<allocated_tiles[idx_pd]<<endl;
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

bool bypassOptGen_and_Placement(char srcOpt, char tgtOpt){
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
    char initial_IDX_pd = IDX_pd;
    IDX_pd_modulo = IDX_pd % DynamicPlacement_II;
    char initial_IDX_pd_modulo = IDX_pd_modulo;
    char upperLimit = IDX_pd + DynamicPlacement_II;

    // for first DFGNode which doesn't have any predecessors that have finished placement
    if(predecessors_wrAddr == 0){
        char firstTile = curOptPotentialPlacement[0];
        PlacementDynamic_Record(firstTile); // map it to the first
        return true;
    }

    // for other DFGNodes, try to map to the Tile with the order in curOptPotentialPlacement
    char bypassPreds[maxBpsNum1Time];
    for(char i = 0; i < curOptPotentialPlacement_wrAddr; i++){
        /////////////////////////////////////////////////////////////////////////////////////////
        // for each tile, check whether needs to enter bypass mode
        bool bypassMode = false;
        char bypassPreds_wrAddr = 0;
        for(char j = 0; j < predsNum; j++){
            predOpt1 = predecessors[j];
            curTile = curOptPotentialPlacement[i];
            Calculate_CurToPred_Distance();
            if(!CurToPred_Distance_Satisfy_Topology()){
                bypassPreds[bypassPreds_wrAddr] = predecessors[j];
                bypassPreds_wrAddr++;
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
            char IDX_pd_bypass_MAX = initial_IDX_pd;
            placement_dynamic_dict_Opt2Tile_values[curOpt_idx] = curOptPotentialPlacement[i];
            for(char k = 0; k < bypassPreds_wrAddr; k++){
                char IDX_pd_lastBypass = -1;
                if(!bypassOptGen_and_Placement(bypassPreds[k], placement_static_kernels_values[kernel_idx][curOpt_idx])) return false;
                else IDX_pd_lastBypass = IDX_pd_bypass;
                if(IDX_pd_lastBypass > IDX_pd_bypass_MAX) IDX_pd_bypass_MAX = IDX_pd_lastBypass;
            }
            // recover IDX_pd and IDX_pd_modulo for each new tile
            char increment = IDX_pd_bypass_MAX - initial_IDX_pd;
            IDX_pd = initial_IDX_pd + increment;
            IDX_pd_modulo = IDX_pd % DynamicPlacement_II;
            upperLimit = IDX_pd + DynamicPlacement_II;
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        // after IDX_pd and IDX_pd_modulo have been confirmed, perform placement of curOpt
        // try to finish placement pf curOpt at current tile
        while(true){
            // check whether tile under IDX_pd is occupied
            if (placement_dynamic_occupy[IDX_pd_modulo][curOptPotentialPlacement[i]] == 0){ // not occupied
                PlacementDynamic_Record(curOptPotentialPlacement[i]);
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

void CurOptPotentialPlacement_List_LevelInfo_Gen(){
    // find the level of curOpt in static mapping results under 4x4 CGRA, and take it as the initial level of dynamic placement
    char curTileStatic = placement_static_Opt2Tile_kernels_values1[kernel_idx][curOpt_idx];
    char retrievedTile;
    char tileID = 0;
    for (tileID = 0; tileID < cgra_size*cgra_size; tileID++){
        if (placement_static_Tile2Level_keys[tileID] == curTileStatic) break;
    }
    char static_level = placement_static_Tile2Level_values[tileID];
    char dynamic_level = static_level;
    char max_dynamic_level = allocated_tiles_Maxlevels_dynamic_shapes_values[shape_idx];
    if (dynamic_level > max_dynamic_level) dynamic_level = max_dynamic_level; // calibration


    curOptPotentialPlacement_wrAddr = 0;
    // first priority, the same Tile in same level
    for (char i = 0; i < allocated_tiles_levelsValidLen_shapes_values[shape_idx][dynamic_level]; i++){ // same level
        retrievedTile = allocated_tiles_levels_dynamic_shapes_values[shape_idx][dynamic_level][i];
        if(retrievedTile == curTileStatic){ // same tile
            curOptPotentialPlacement[curOptPotentialPlacement_wrAddr] = retrievedTile;
            curOptPotentialPlacement_wrAddr++;
            break;
        }
    }

    // second priority, other Tiles in the same level
    for (char i = 0; i < allocated_tiles_levelsValidLen_shapes_values[shape_idx][dynamic_level]; i++){ // same level
        retrievedTile = allocated_tiles_levels_dynamic_shapes_values[shape_idx][dynamic_level][i];
        if(retrievedTile != curTileStatic){ // other tiles
            curOptPotentialPlacement[curOptPotentialPlacement_wrAddr] = retrievedTile;
            curOptPotentialPlacement_wrAddr++;
        }
    }

    // third priority, other Tiles in the rest levels
    char initial_dynamic_level = dynamic_level;
    while(true){
        dynamic_level += 1;
        if(dynamic_level > max_dynamic_level){
            dynamic_level = 0; // go back to the highest level
        }
        if(dynamic_level == initial_dynamic_level) break;
        else{
            for (char i = 0; i < allocated_tiles_levelsValidLen_shapes_values[shape_idx][dynamic_level]; i++){  // other levels
                retrievedTile = allocated_tiles_levels_dynamic_shapes_values[shape_idx][dynamic_level][i];
                curOptPotentialPlacement[curOptPotentialPlacement_wrAddr] = retrievedTile;
                curOptPotentialPlacement_wrAddr++;
            }
        }
    }
}

void CurOptPotentialPlacement_List_BypassLess_Gen(){
    char potentialPlacement_AllPreds[maxPredsNum][cgra_size*cgra_size];
    char predTile;
    bool flag;
    char existLen;
    for(char i = 0; i < predsNum; i++){ // get surrounding Tiles
        char potentialPlacement_wrAddr = 0;
        char potentialPlacement[cgra_size*cgra_size];
        predTile = placement_dynamic_dict_Opt2Tile_values[predOpt_idx_List[i]];
        char initialX = Tile2XY[predTile][0];
        char initialY = Tile2XY[predTile][1];
        char XChanges[] = {-1,0,1};
        char YChanges[] = {-1,0,1};
        for(char m = 0; m < 3; m++){
            for(char n = 0; n < 3; n++){
                char x = initialX + XChanges[m];
                char y = initialY + YChanges[n];

                // python and C++ behave difference on illegal array index
                // python accepts negative index, but C++ doesn't
                // python doesn't accept index that is larger than array_size-1, but C++ does
                // so perform calibration to x and y to keep pace with python behavior
                if((x > cgra_size - 1) || (y > cgra_size - 1)) continue;
                x = (x < 0) ? (cgra_size + x) : x;
                y = (y < 0) ? (cgra_size + y) : y;

                char surrTile = xy2Tile[x][y];
                char j;
                flag = false;
                for(j = 0; j < CGRA_NumTiles_shapes_values[shape_idx]; j++){
                    if(surrTile == allocated_tiles_shapes_values[shape_idx][j]){
                        flag = true;
                        break;
                    }
                }
                if(flag){ // save surrTile if it's in allocated_tiles
                    potentialPlacement_AllPreds[i][potentialPlacement_wrAddr] = surrTile;
                    potentialPlacement_wrAddr++;
                }
            }
        }
        potentialPlacement_wrAddr_List[i] = potentialPlacement_wrAddr;
    }

    curOptPotentialPlacement_wrAddr = 0;
    if(predsNum == 1){ // only one predecessor
        for(char i = 0; i < potentialPlacement_wrAddr_List[0]; i++){
            curOptPotentialPlacement[curOptPotentialPlacement_wrAddr] = potentialPlacement_AllPreds[0][i];
            curOptPotentialPlacement_wrAddr++;
        }

        // supplement the rest of allocated_tiles that is not in curOptPotentialPlacement
        existLen = curOptPotentialPlacement_wrAddr;
        for(char i = 0; i < CGRA_NumTiles_shapes_values[shape_idx]; i++){
            char j;
            flag = false;
            for(j = 0; j < existLen; j++){
                if(allocated_tiles_shapes_values[shape_idx][i] == curOptPotentialPlacement[j]){
                    flag = true;
                    break;
                }
            }
            if (!flag){
                curOptPotentialPlacement[curOptPotentialPlacement_wrAddr] = allocated_tiles_shapes_values[shape_idx][i];
                curOptPotentialPlacement_wrAddr++;
            }
        }
    }
    else{ // two or more predecessors
        // find the intersection between potentialPlacement_AllPreds of two predecessors
        intersection_wrAddr = 0;
        bool hasItst = false;
        char intersection[cgra_size*cgra_size];
        for(char i = 0; i < potentialPlacement_wrAddr_List[0]; i++){
            for(char j = 0; j < potentialPlacement_wrAddr_List[1]; j++){
                if(potentialPlacement_AllPreds[0][i] == potentialPlacement_AllPreds[1][j]){ // save Tile that is in both potentialPlacement_AllPreds[0] and potentialPlacement_AllPreds[1]
                    intersection[intersection_wrAddr] = potentialPlacement_AllPreds[0][i];
                    intersection_wrAddr++;
                    hasItst = true;
                }
            }
        }

        if(hasItst){ // has intersection
            for(char i = 0; i < intersection_wrAddr; i++){ // intersection first
                curOptPotentialPlacement[curOptPotentialPlacement_wrAddr] = intersection[i];
                curOptPotentialPlacement_wrAddr++;
            }

            // supplement the rest of allocated_tiles that is not in curOptPotentialPlacement
            existLen = curOptPotentialPlacement_wrAddr;
            for(char i = 0; i < CGRA_NumTiles_shapes_values[shape_idx]; i++){
                char j;
                flag = false;
                for(j = 0; j < existLen; j++){
                    if(allocated_tiles_shapes_values[shape_idx][i] == intersection[j]){
                        flag = true;
                        break;
                    }
                }
                if (!flag){
                    curOptPotentialPlacement[curOptPotentialPlacement_wrAddr] = allocated_tiles_shapes_values[shape_idx][i];
                    curOptPotentialPlacement_wrAddr++;
                }
            }
        }
        else{ // no itersection
            char predX_0 = Tile2XY[placement_dynamic_dict_Opt2Tile_values[predOpt_idx_List[0]]][0];
            char predY_0 = Tile2XY[placement_dynamic_dict_Opt2Tile_values[predOpt_idx_List[0]]][1];
            char predX_1 = Tile2XY[placement_dynamic_dict_Opt2Tile_values[predOpt_idx_List[1]]][0];
            char predY_1 = Tile2XY[placement_dynamic_dict_Opt2Tile_values[predOpt_idx_List[1]]][1];
            curOptPotentialPlacement_wrAddr = 0;
            while (true)
            {
                // generate x and y coordinates of BypassTile
                if(predX_0 < predX_1){
                    predX_0 += 1;
                }
                else if(predX_0 == predX_1)
                {
                    predX_0 = predX_0;
                }
                else{
                    predX_0 -= 1;
                }

                if(predY_0 < predY_1){
                    predY_0 += 1;
                }
                else if(predY_0 == predY_1)
                {
                    predY_0 = predY_0;
                }
                else{
                    predY_0 -= 1;
                }

                char BypassTile = xy2Tile[predX_0][predY_0];
                for(char i = 0; i < CGRA_NumTiles_shapes_values[shape_idx]; i++){ // save BypassTile if it's in allocated_tiles
                    if(allocated_tiles_shapes_values[shape_idx][i] == BypassTile){
                        curOptPotentialPlacement[curOptPotentialPlacement_wrAddr] = allocated_tiles_shapes_values[shape_idx][i];
                        curOptPotentialPlacement_wrAddr++;
                    }
                }

                if(predX_0 == predX_1 and predY_0 == predY_1) break; // no more BypassTiles
            }

            // supplement the rest of allocated_tiles that is not in curOptPotentialPlacement
            existLen = curOptPotentialPlacement_wrAddr;
            for(char i = 0; i < CGRA_NumTiles_shapes_values[shape_idx]; i++){
                char j;
                flag = false;
                for(j = 0; j < existLen; j++){
                    if(allocated_tiles_shapes_values[shape_idx][i] == curOptPotentialPlacement[j]){
                        flag = true;
                        break;
                    }
                }
                if (!flag){
                    curOptPotentialPlacement[curOptPotentialPlacement_wrAddr] = allocated_tiles_shapes_values[shape_idx][i];
                    curOptPotentialPlacement_wrAddr++;
                }
            }

        }
    }
}

// modulo scheduling + placement + routing (implicit)
bool dynamic_placement_routing(){
    char placedOpts_Counter = 0;
    for(curOpt_idx = 0; curOpt_idx < DFG_NodesCount_kernels_values[kernel_idx]; curOpt_idx++){
        IDX_pd = -1;

        // check the numder of predecessors of curOpt
        predsNum = 0;
        for(char i = 0; i < maxPredsNum; i++){
            if(dependency_predecessor_values[curOpt_idx][i] == -1) break;
            else predsNum++;
        }

        // update predecessors before entering into placement recommendation
        predecessors_wrAddr = 0;
        for(char i = 0; i < predsNum; i++){
            char pred = dependency_predecessor_values[curOpt_idx][i];
            // find the index of pred in placement_static
            for(predOpt_idx = 0; predOpt_idx < DFG_NodesCount_kernels_values[kernel_idx]; predOpt_idx++){
                if(pred == placement_static_kernels_values[kernel_idx][predOpt_idx]) break;
            }

            if(placement_done_values[predOpt_idx] == 0){ // if pred has not been placed
                // find the number of current pred's predecessor
                char predPredsNum = 0;
                for(char j = 0; j < maxPredsNum; j++){
                    if(dependency_predecessor_values[predOpt_idx][j] == -1) break;
                    else predPredsNum++;
                }
                // check whether curOpt and pred are in the same ring
                bool flag = false;
                for(char j = 0; j < predPredsNum; j++){
                    // if in the same ring, quit in advance
                    if(placement_static_kernels_values[kernel_idx][curOpt_idx] ==
                    dependency_predecessor_values[predOpt_idx][j]){
                        flag = true;
                        break;
                    }
                }
                // if curOpt and pred are not in the same ring
                // then supplement curOpt as the predecessors of predOpt to satisfy the dependency
                dependency_predecessor_wrAddr = predPredsNum;
                if(!flag) {
                    dependency_predecessor_values[predOpt_idx][dependency_predecessor_wrAddr] = placement_static_kernels_values[kernel_idx][curOpt_idx];
                    dependency_predecessor_wrAddr++;
                }
            }
            else{ // calibrate IDX_pd to the maximum IDX_pd that predecessors have been placed
                predOpt_idx_List[predecessors_wrAddr] = predOpt_idx;
                predecessors[predecessors_wrAddr] = pred;
                predecessors_wrAddr++;
                if(placement_dynamic_dict_Opt2PC_values[predOpt_idx] > IDX_pd){
                    IDX_pd = placement_dynamic_dict_Opt2PC_values[predOpt_idx];
                }
            }
        }
        // calibration to predsNum, should be equal to actual wrAddr
        predsNum = predecessors_wrAddr;

        // placement recommendation
        if(placedOpts_Counter < threshold) CurOptPotentialPlacement_List_LevelInfo_Gen();
        else CurOptPotentialPlacement_List_BypassLess_Gen();

        // placement&routing
        if(RoutingAvailability_CheckPredecessor_and_Placement()){
//            cout<<"curOpt is: "<<int(placement_static_kernels_values[kernel_idx][curOpt_idx])<<", PC "<<int(placement_dynamic_dict_Opt2PC_values[curOpt_idx])<<", Tile "<<int(placement_dynamic_dict_Opt2Tile_values[curOpt_idx])<<endl;
            placedOpts_Counter += 1;
            continue; // if current DFGNode mapping success, go to next DFGNode
        }
        else return false;
    }
    return true;
}

void Reset(){
    IDX_pd = 0; idx_pd = 0; IDX_pd_modulo = 0; IDX_pd_bypass = 0; bypassOptIdx = bypassOptStartIdx;
    xDiff_CurToPred1 = 0; yDiff_CurToPred1 = 0; xDiff_BypassSrcToTgt = 0; yDiff_BypassSrcToTgt = 0;
    predOpt1 = -1; bypassOpt = -1; bypassSrcOpt = -1; bypassTgtOpt = -1;
    curTile = -1; predTile1 = -1; bypassSrcTile = -1; bypassTgtTile = -1;
    dependency_forward = false; dependency_backward = false;
    bypassOpt_wrAddr = DFG_NodesCount_kernels_values[kernel_idx];
    for(char i = 0; i < maxPredsNum; i++){
        predecessors[i] = 0;
    }
    for(char i = 0; i < cgra_size*cgra_size; i++){
        curOptPotentialPlacement[i] = -1;
    }
    for(char i = 0; i < maxPCs; i++){
        for(char j = 0; j < cgra_size*cgra_size; j++){
            placement_dynamic[i][j] = 0;
        }
    }
    for(char i = 0; i < bypassMaxPages; i++){
        for(char j = 0; j < maxPCs; j++){
            for(char k = 0; k < cgra_size*cgra_size; k++){
            placement_dynamic_bypass[i][j][k] = -1;
            }
        }
    }
    for(char i = 0; i < maxPCs; i++){
        for(char j = 0; j < cgra_size*cgra_size; j++){
            placement_dynamic_occupy[i][j] = 0;
        }
    }
    for(char i = 0; i < maxBpsPCs; i++){
        for(char j = 0; j < cgra_size*cgra_size; j++){
            for(char k = 0; k < topology * topology; k++){
            placement_dynamic_bypass_occupy[i][j][k] = 0;
            }
        }
    }
    for(char i = 0; i < DFG_NodesCount_kernels_values[kernel_idx]; i++){
        placement_dynamic_dict_Opt2PC_keys[i] = placement_static_kernels_values[kernel_idx][i];
    }
    for(char i = 0; i < maxPCs; i++){
        placement_dynamic_dict_Opt2PC_values[i] = 0;
    }
    for(char i = 0; i < DFG_NodesCount_kernels_values[kernel_idx]; i++){
        placement_dynamic_dict_Opt2Tile_keys[i] = placement_static_kernels_values[kernel_idx][i];
    }
    for(char i = 0; i < maxPCs; i++){
        placement_dynamic_dict_Opt2Tile_values[i] = -1;
    }
    for(char i = 0; i < maxPCs; i++){
        placement_done_values[i] = 0;
    }
    for(char i = 0; i < DFG_NodesCount_kernels_values[kernel_idx]; i++){
        placement_done_keys[i] = placement_static_kernels_values[kernel_idx][i];
    }
    for(char i = 0; i < DFG_NodesCount_kernels_values[kernel_idx]; i++){
        dependency_predecessor_keys[i] = placement_static_kernels_values[kernel_idx][i];
        for(char j = 0; j < maxPredsNum; j++){
            if((j == 0) || (dependency_predecessors_kernels_values1[kernel_idx][i][j] != 0))
            {
                dependency_predecessor_values[i][j] = dependency_predecessors_kernels_values1[kernel_idx][i][j];
            }
            else{
                dependency_predecessor_values[i][j] = -1;
            }
        }
    }
    for(char i = 0; i < DFG_NodesCount_kernels_values[kernel_idx]; i++){
        dependency_successor_keys[i] = placement_static_kernels_values[kernel_idx][i];
        for(char j = 0; j < maxSuccsNum; j++){
            if((j == 0) || (dependency_successors_kernels_values1[kernel_idx][i][j] != 0))
            {
                dependency_successor_values[i][j] = dependency_successors_kernels_values1[kernel_idx][i][j];
            }
            else{
                dependency_successor_values[i][j] = -1;
            }
        }
    }
}

char calculate_startII(){
    totalNodes = DFG_NodesCount_kernels_values[kernel_idx];
    numTiles = CGRA_NumTiles_shapes_values[shape_idx];
    RecMII = DFG_Theoretical_RecMII_kernels_values[kernel_idx];
    ResMII = ceil(totalNodes / (numTiles * 1.0));
    return max(ResMII, RecMII);
}

void kernel_shape_idx_generator(char i, char j){
    kernel_idx = i;
    if(i == 0 || i == 1){ // kernel mvt and fft
        if(j < 4) shape_idx = j; // "12-S", "12-IA", "12-IB", "12-L"
        else if(j >= 4 && j < 8) shape_idx = j; // "8-IA", "8-S", "8-IB", "8-L"
        else shape_idx = j + 8; // "4-S", "4-IB", "4-IA", "4-L"
    }
    else if(i == 2 || i == 3){ // kernel dtw and blowfish
        if(j < 4) shape_idx = j + 4; // "8-IA", "8-S", "8-IB", "8-L"
        else if(j >= 4 && j < 8) shape_idx = j + 4; // "6-S", "6-IA", "6-IB", "6-L"
        else shape_idx = j + 8; // "4-S", "4-IB", "4-IA", "4-L"
    }
    else{ // kernel spmv and conv
        if(j < 4) shape_idx = j + 8; // "6-S", "6-IA", "6-IB", "6-L"
        else if(j >= 4 && j < 8) shape_idx = j + 8; // "5-S", "5-IB", "5-IA", "5-L"
        else shape_idx = j + 8; // "4-S", "4-IB", "4-IA", "4-L"
    }
}

char runOne(char testCaseIdx){
	int i = testCaseIdx / shapeNumPKernel;
	int j = testCaseIdx % shapeNumPKernel;
	kernel_shape_idx_generator(i, j);
	char startII = calculate_startII();
	threshold = 1;
	while (true)
	{
		DynamicPlacement_II = startII;
		Reset();
		bool success = dynamic_placement_routing();

		if(success){
			break;
		}
		else{
			if(threshold >= DFG_NodesCount_kernels_values[kernel_idx]){
				startII++;
				threshold = 1;
			}
			else threshold += 1; // stride = 1, best quality. stride = 8, best speed
		}
	}
	cout<<"TestCase:["<<int(testCaseIdx + 1)<<"/72], Kernel "<<int(test_kernels[kernel_idx])<<", Shape "<<int(test_shapes_values[shape_idx])<<", II="<<int(DynamicPlacement_II)<<endl;
	return DynamicPlacement_II;
}

void runAll(char DynamicPlacement_II_Results[testCasesNum]){
    // manual test
    // ......

    // auto test
    char test_case = 0;
    typedef high_resolution_clock Clock;
    kernel_idx = 0;
    for(char i = 0; i < kernelNum; i++){
        for(char j = 0; j < shapeNumPKernel; j++){
            kernel_shape_idx_generator(i, j);
            char startII = calculate_startII();
            threshold = 1;
            while (true)
            {
                DynamicPlacement_II = startII;
                Reset();
                bool success = dynamic_placement_routing();

                if(success){
                    break;
                }
                else{
                    if(threshold >= DFG_NodesCount_kernels_values[kernel_idx]){
                        startII++;
                        threshold = 1;
                    }
                    else threshold += 1; // stride = 1, best quality. stride = 8, best speed
                }
            }

            cout<<"TestCase:["<<int(test_case + 1)<<"/72], Kernel "<<int(test_kernels[kernel_idx])<<", Shape "<<int(test_shapes_values[shape_idx])<<", II="<<int(DynamicPlacement_II)<<endl;
            DynamicPlacement_II_Results[test_case] = DynamicPlacement_II;
            test_case += 1;
        }
    }
}
