# -*- coding: utf-8 -*-
"""
Created on Sat Oct 14 08:47:26 2023

@author: yufei yang
"""
from benchmark import DFG_NodesCount_kernels
from benchmark import DFG_Theoretical_RecMII_kernels
from benchmark import CGRA_NumTiles
from benchmark import placement_static_kernels
from benchmark import placement_done_kernels
from benchmark import dependency_predecessors_kernels
from benchmark import dependency_pseudo_predecessors_kernels
from benchmark import dependency_successors_kernels
from benchmark import placement_static_Opt2Tile_kernels
from benchmark import placement_static_Opt2PC_kernels
from benchmark import allocated_tiles_shape
from benchmark import allocated_tiles_levels_dynamic_shape
from benchmark import DFG_SuccNums2DynLevels_kernels
from Utils import CGRA, Tile, HiddenPrints, CGRA_size
import copy, math
import time

def PlacementStatic_Init(kernel): # static placement result
    res = copy.deepcopy(placement_static_kernels[kernel])
    return res

def PlacementStatic_Dict_Opt2Tile_Init(kernel):
    res = copy.deepcopy(placement_static_Opt2Tile_kernels[kernel])
    return res

def PlacementStatic_Dict_Opt2PC_Init(kernel): # not used
    res = copy.deepcopy(placement_static_Opt2PC_kernels[kernel])
    return res

def PlacementDone_Init(kernel): # record whether a operation has been placed
    res = copy.deepcopy(placement_done_kernels[kernel])
    return res   

def DependencyPredecessor_Init(kernel): # the predecessor of current operation  
    res = copy.deepcopy(dependency_predecessors_kernels[kernel])
    return res

def DependencyPseudoPredecessor_Init(kernel): # the pseudo predecessor of current operation  
    res = copy.deepcopy(dependency_pseudo_predecessors_kernels[kernel])
    return res

def DependencySuccessor_Init(kernel): # the successor of current operation
    res = copy.deepcopy(dependency_successors_kernels[kernel])
    return res

def DFG_SuccNums2DynLevels_Init(kernel):
    res = copy.deepcopy(DFG_SuccNums2DynLevels_kernels[kernel])
    return res

def PlacementDynamic_Init(): # overlapped MRRG for all threads
    res = [[0 for col in range(CGRA_size**2)] for row in range(maxPCs)]
    return res

def PlacementDynamic_Bypass_Init(): 
    res = [[[0 for col in range(CGRA_size**2)] for row in range(maxPCs)] for page in range(bypassPages)]
    return res

def PlacementDynamic_Occupation_Init():
    global DynamicPlacement_II
    res = [[0 for col in range(CGRA_size**2)] for i in range(DynamicPlacement_II)]
    return res

def PlacementDynamic_Bypass_Occupation_Init():
    global DynamicPlacement_II
    res = [[[0 for i in range(16)] for col in range(CGRA_size**2)] for i in range(DynamicPlacement_II)]
    return res

def PlacementDynamic_Dict_Opt2Tile_Init(): # key: operation, value: Tile
    res = dict()
    return res

def PlacementDynamic_Dict_Opt2PC_Init(): # key: operation, value: IDX_dp (PC)
    res = dict()
    return res        

def LocalRegisterStatus_Init(): # recording the occupy status of all 8 local registers in a single Tile
    res = [[[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] for col in range(CGRA_size**2)] for row in range(maxPCs)]
    return res

def ComputeRegisterStatus_Init(): # recording the occupy status of all 2 compute registers in a single Tile
    res = [[[0,0] for col in range(CGRA_size**2)] for row in range(maxPCs)]
    return res

def AllocatedTile_Init(shape): # allocated Tile for current thread
    res = allocated_tiles_shape[shape]
    return res

def AllocatedTile_Level_Static(): # allocated Tile for static placement
    cgra = CGRA(CGRA_size)
    res = [
            [cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[9], cgra.Tiles[10]], # level 0
            [cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[4], cgra.Tiles[7], cgra.Tiles[8], cgra.Tiles[11], cgra.Tiles[13], cgra.Tiles[14]], # level 1
            [cgra.Tiles[0], cgra.Tiles[3], cgra.Tiles[12], cgra.Tiles[15]] # level 2
              ]
    return res

def AllocatedTile_Level_Dynamic(shape): # allocated Tile level information for current thread in run-time
    res = allocated_tiles_levels_dynamic_shape[shape]
    return res

def AllocatedTileIdx_Init(): # the idx of the Tile in allocated Tile List[]
    global allocated_tiles
    res = dict()
    for idx in range( len(allocated_tiles) ):
        res[allocated_tiles[idx].ID] = idx
    return res

def XY2Tile_Init():
    cgra = CGRA(CGRA_size)
    res = [ [cgra.Tiles[0], cgra.Tiles[4], cgra.Tiles[8], cgra.Tiles[12]],
            [cgra.Tiles[1], cgra.Tiles[5], cgra.Tiles[9], cgra.Tiles[13]],
            [cgra.Tiles[2], cgra.Tiles[6], cgra.Tiles[10], cgra.Tiles[14]],
            [cgra.Tiles[3], cgra.Tiles[7], cgra.Tiles[11], cgra.Tiles[15]] ]
    return res

def BypassStride_Gen(): 
    res = [[1,1], # x move 1, y move 1
            [1,0], # x move 1, y remains unchange
            [0,1]] # x remains unchange, y move 1 
    return res

def DynamicPlacement_IndexInit_BypassMode():
    global bypassSrcOpt, bpsSrcTileIdx, IDX_pd, idx_pd, idx_ps
    idx_pd = bpsSrcTileIdx

def PlacementDynamic_Record(): # record the dynamic placement of curOpt
    global idx_pd, IDX_pd, curOpt, IDX_pd_modulo
    tileId = allocated_tiles[idx_pd].ID
    placement_dynamic[IDX_pd][tileId] = curOpt
    placement_dynamic_occupy[IDX_pd_modulo][tileId] = curOpt
    placement_dynamic_dict_Opt2Tile[curOpt] = allocated_tiles[idx_pd]
    placement_dynamic_dict_Opt2PC[curOpt] = IDX_pd
    placement_done[curOpt] = 1

def Bypass_XbarIn_Direction(xDiff, yDiff):  
    # N:1 S:2 E:3 W:4 NE:5 SE:6 NW:7 SW:8
    if xDiff == 0:
        if yDiff < 0: return 2
        elif yDiff > 0: return 1
    elif xDiff < 0:
        if yDiff < 0: return 6
        elif yDiff == 0: return 3
        elif yDiff > 0: return 5
    elif xDiff > 0:
        if yDiff < 0: return 8
        elif yDiff == 0: return 4
        elif yDiff > 0: return 7

def Bypass_XbarOut_Direction(xDiff, yDiff):
    # N:1 S:2 E:3 W:4 NE:5 SE:6 NW:7 SW:8
    if xDiff == 0:
        if yDiff < 0: return 1
        elif yDiff > 0: return 2
    elif xDiff < 0:
        if yDiff < 0: return 7
        elif yDiff == 0: return 4
        elif yDiff > 0: return 8
    elif xDiff > 0:
        if yDiff < 0: return 5
        elif yDiff == 0: return 3
        elif yDiff > 0: return 6

def BypassOptPlacement_Gen_Record(): # record the dynamic placement of bypass operation
    global IDX_pd, idx_pd, bypassOpt, bypassSrcOpt, bypassOptIdx, IDX_pd_bypass, IDX_pd_bypass_modulo, bypassPage
    global bypassSrcOpt, bypassSrcTile, bypassTgtTile, bpsStride, idx_pd
    
    bypassOpt = "bypass" + str(bypassOptIdx)
    bypassOptIdx += 1

    IDX_pd_bypass = placement_dynamic_dict_Opt2PC[bypassSrcOpt] + 1
    IDX_pd_bypass_modulo = IDX_pd_bypass % DynamicPlacement_II
    upperLimit = IDX_pd_bypass + DynamicPlacement_II
    
    ######################################## decide the Tile of bypassOpt ##############################
    for stride in bpsStride:
        if bypassSrcTile.x < bypassTgtTile.x:
            x = bypassSrcTile.x + stride[0]
            xDiff = stride[0]
        elif bypassSrcTile.x == bypassTgtTile.x:
            x = bypassSrcTile.x 
            xDiff = 0
        else:
            x = bypassSrcTile.x - stride[0]
            xDiff = -stride[0]
            
        if bypassSrcTile.y < bypassTgtTile.y:
            y = bypassSrcTile.y + stride[1]
            yDiff = stride[1]
        elif bypassSrcTile.y == bypassTgtTile.y:
            y = bypassSrcTile.y 
            yDiff = 0
        else:
            y = bypassSrcTile.y - stride[1]    
            yDiff = -stride[1]
    
        if xy2Tile[x][y] in allocated_tiles: 
            break
        
    idx_pd = allocated_tiles.index(xy2Tile[x][y])
    tileId = allocated_tiles[idx_pd].ID
    dirInIdx = Bypass_XbarIn_Direction(xDiff, yDiff)
    dirOutIdx = Bypass_XbarOut_Direction(xDiff, yDiff)
    
    ######################################## decide IDX_pd of bypassOpt #################################
    while True:
        # check whether tile under IDX_pd is occupied
        inportConflict = placement_dynamic_bypass_occupy[IDX_pd_bypass_modulo][tileId][dirInIdx-1]
        outportConflict = placement_dynamic_bypass_occupy[IDX_pd_bypass_modulo-1][bypassSrcTile.ID][dirOutIdx+8-1] 
        if not inportConflict and not outportConflict: # both requested inport and outport are not occupied
            page = 0 # to record overlapped bypassOpt that using different inport and output
            while True: # finish the placement of bypassOpt
                if placement_dynamic_bypass[page][IDX_pd_bypass][tileId] == 0: 
                    # record the placement of bypassOpt
                    placement_dynamic_bypass[page][IDX_pd_bypass][tileId] = bypassOpt
                    placement_dynamic_bypass_occupy[IDX_pd_bypass_modulo][tileId][dirInIdx-1] = 1
                    placement_dynamic_bypass_occupy[IDX_pd_bypass_modulo-1][bypassSrcTile.ID][dirOutIdx+8-1] = 1
                    placement_dynamic_dict_Opt2Tile[bypassOpt] = allocated_tiles[idx_pd]
                    placement_dynamic_dict_Opt2PC[bypassOpt] = IDX_pd_bypass
                    placement_done[bypassOpt] = 1
                    # print("%s PC %i Tile %i" % (bypassOpt, IDX_pd_bypass, allocated_tiles[idx_pd].ID))
                    return True
                page += 1
        
        # occupied, move to next IDX_pd
        IDX_pd_bypass += 1
        IDX_pd_bypass_modulo = IDX_pd_bypass % DynamicPlacement_II
        if IDX_pd_bypass == upperLimit: # move to next tile
            return False

def Dependency_Update_BypassMode_SrcTgt():
    global bypassOpt, bypassSrcOpt, bypassTgtOpt, dependency_forward, dependency_backward
    if dependency_forward:
        # update successor of bypassSrcOpt
        try: 
            dependency_successor[bypassSrcOpt].remove(bypassTgtOpt)
            dependency_successor[bypassSrcOpt].append(bypassOpt)
        except:
            if len(dependency_successor[bypassSrcOpt]) > 0:
                dependency_successor[bypassSrcOpt].append(bypassOpt)
            else:
                dependency_successor[bypassSrcOpt] = [bypassOpt]
                
        # update predecessor and successor of bypassOpt
        try:
            dependency_predecessor[bypassOpt] = [bypassSrcOpt] 
            dependency_successor[bypassOpt] = [bypassTgtOpt]
        except:
            dependency_predecessor[bypassOpt].append(bypassSrcOpt)
            dependency_successor[bypassOpt].append(bypassTgtOpt)
        
        # update predecessor of bypassTgtOpt
        try:
            dependency_predecessor[bypassTgtOpt].append(bypassOpt)
            dependency_predecessor[bypassTgtOpt].remove(bypassSrcOpt) 
        except:
            pass
    
    if dependency_backward:
        # update predecessor of bypassSrcOpt
        try: 
            dependency_predecessor[bypassSrcOpt].remove(bypassTgtOpt)
            dependency_predecessor[bypassSrcOpt].append(bypassOpt)
        except:
            if len(dependency_predecessor[bypassSrcOpt]) > 0:
                dependency_predecessor[bypassSrcOpt].append(bypassOpt)
            else:
                dependency_predecessor[bypassSrcOpt] = [bypassOpt]
                
        # update successor and predecessor of bypassOpt
        try:
            dependency_successor[bypassOpt] = [bypassSrcOpt] 
            dependency_predecessor[bypassOpt] = [bypassTgtOpt]
        except:
            dependency_successor[bypassOpt].append(bypassSrcOpt)
            dependency_predecessor[bypassOpt].append(bypassTgtOpt)
        
        # update successor of bypassTgtOpt
        try:
            dependency_successor[bypassTgtOpt].append(bypassOpt)
            dependency_successor[bypassTgtOpt].remove(bypassSrcOpt) 
        except:
            pass

def Dependency_ClearPseudo():
    global dependency_pseudoPredecessor
    for pred in dependency_pseudoPredecessor.keys():
        for curOpt in dependency_pseudoPredecessor[pred]:
            try:
                dependency_predecessor[pred].remove(curOpt)
            except:
                pass
    
def Update_BypassSrcInfo():
    global bypassSrcOpt, bypassOpt, bypassSrcTile, DynamicPlacement_II
    bypassSrcOpt = bypassOpt
    bypassSrcTile = placement_dynamic_dict_Opt2Tile[bypassSrcOpt]
  
def DynamicPlacement_SrcTgtInit_BypassMode(srcOpt, tgtOpt):
    global bypassSrcOpt, bypassSrcTile, bpsSrcTileIdx, bypassTgtOpt, bypassTgtTile, bpsTgtTileIdx, curOpt, dependency_forward, dependency_backward
    bypassSrcOpt = srcOpt
    bypassTgtOpt = tgtOpt
    bypassSrcTile = placement_dynamic_dict_Opt2Tile[bypassSrcOpt]
    bypassTgtTile = placement_dynamic_dict_Opt2Tile[bypassTgtOpt]
    bpsSrcTileIdx = allocated_tiles_idx[bypassSrcTile.ID]
    bpsTgtTileIdx = allocated_tiles_idx[bypassTgtTile.ID]
    
    if placement_done[srcOpt]: dependency_forward = True
    else: dependency_forward = False
    dependency_backward = not dependency_forward

def Caculate_SrcToTgt_Distance_BypassMode(): # calculate x and y difference between bypassSrcOpt and bypassTgtOpt
    global bypassSrcTile, bypassTgtTile, xDiff_BypassSrcToTgt, yDiff_BypassSrcToTgt
    xDiff_BypassSrcToTgt = abs(bypassTgtTile.x - bypassSrcTile.x)
    yDiff_BypassSrcToTgt = abs(bypassTgtTile.y - bypassSrcTile.y)
    
def Calculate_CurToPred_Distance(): # calculate x and y difference between current opt and its one predecessor
    global idx_pd, curTile, predOpt1, predTile1, xDiff_CurToPred1, yDiff_CurToPred1
    curTile = allocated_tiles[idx_pd] 
    predTile1 = placement_dynamic_dict_Opt2Tile[predOpt1]
    xDiff_CurToPred1 = abs(curTile.x - predTile1.x)
    yDiff_CurToPred1 = abs(curTile.y - predTile1.y)

def SrcToTgt_Distance_Satisfy_Topology_BypassMode(): # check whether the placement of bypassSrcOpt and bypassTgtOpt satisfy the topology
    global xDiff_BypassSrcToTgt, yDiff_BypassSrcToTgt, xDiff_Limit, yDiff_Limit
    return xDiff_BypassSrcToTgt <= xDiff_Limit and yDiff_BypassSrcToTgt <= yDiff_Limit
    
def CurToPred_Distance_Satisfy_Topology(): # check whether the placement of current opt and its predecessor satisfy the topology
    global xDiff_CurToPred1, yDiff_CurToPred1, xDiff_Limit, yDiff_Limit
    return xDiff_CurToPred1 <= xDiff_Limit and yDiff_CurToPred1 <= yDiff_Limit

def fineTuneWithLevelInfo():
    global curTileStatic, curOpt, dynamic_level, max_dynamic_level, curOptPotentialPlacement
    # find the level of curOpt in static placement, and take it as the initial level of dynamic placement
    curTileStatic = placement_static_Opt2Tile[curOpt]
    static_level = 0
    for level, allocated_tiles_level in enumerate(allocated_tiles_levels_static):
        if curTileStatic in allocated_tiles_level:
            static_level = level 
            break
    dynamic_level = static_level
    max_dynamic_level = len(allocated_tiles_levels_dynamic) - 1
    if dynamic_level > max_dynamic_level: dynamic_level = max_dynamic_level # calibration
    
    recommend = []
    # first priority, the same Tile in same level
    for tile in allocated_tiles_levels_dynamic[dynamic_level]: # same level
        if tile.ID == curTileStatic.ID: # same tile
            recommend.append(tile)
            break
    
    # second priority, other Tiles in the same level
    for tile in allocated_tiles_levels_dynamic[dynamic_level]: # same level
        if tile.ID != curTileStatic.ID: # other tiles
            recommend.append(tile)
            
    # adjust the sort of Tile in curOptPotentialPlacement according to recommend
    addr = 0
    for tile in recommend:
        if tile in curOptPotentialPlacement:
            curOptPotentialPlacement.remove(tile)
            curOptPotentialPlacement.insert(addr, tile)
            addr += 1

def CurOptPotentialPlacement_List_BypassLess_Gen():
    global predecessors, curOptPotentialPlacement, allocated_tiles, xy2Tile
    curOptPotentialPlacement.clear()
    potentialPlacement_AllPreds = []
    for pred in predecessors:
        potentialPlacement = []
        predTile = placement_dynamic_dict_Opt2Tile[pred]
        initialX = predTile.x
        initialY = predTile.y
        xChanges = [-1,0,1]
        yChanges = [-1,0,1]
        for xChange in xChanges:
            for yChange in yChanges:
                X = initialX + xChange
                Y = initialY + yChange
                try:
                    tile = xy2Tile[X][Y] # X and Y maybe illegal
                    if tile in allocated_tiles: potentialPlacement.append(tile)
                except:
                    pass 
        potentialPlacement_AllPreds.append(potentialPlacement)
        
    if len(predecessors) == 1:
        curOptPotentialPlacement = potentialPlacement_AllPreds[0]
        for tile in allocated_tiles: # supplement the rest of tiles
            if tile not in curOptPotentialPlacement:
                curOptPotentialPlacement.append(tile)
                
    elif len(predecessors) >= 2:
        # find the intersection between potentialPlacement_AllPreds of two predecessors
        intersection = []
        for tile in potentialPlacement_AllPreds[0]: 
            if tile in potentialPlacement_AllPreds[1]:
                intersection.append(tile)

        if len(intersection) > 0: # have intersection
            for tile in intersection:
                curOptPotentialPlacement.append(tile)
                
            # fineTuneWithLevelInfo() # fine-tune curOptPotentialPlacement with level info
            for tile in allocated_tiles: # supplement the rest of tiles
                if tile not in curOptPotentialPlacement:
                    curOptPotentialPlacement.append(tile)
                    
        else: # no intersection
            predX_0 = placement_dynamic_dict_Opt2Tile[predecessors[0]].x
            predY_0 = placement_dynamic_dict_Opt2Tile[predecessors[0]].y
            predX_1 = placement_dynamic_dict_Opt2Tile[predecessors[1]].x
            predY_1 = placement_dynamic_dict_Opt2Tile[predecessors[1]].y
            while True:
                if predX_0 < predX_1:
                    predX_0 += 1
                elif predX_0 == predX_1:
                    predX_0 = predX_0 
                else:
                    predX_0 -= 1
                    
                if predY_0 < predY_1:
                    predY_0 += 1
                elif predY_0 == predY_1:
                    predY_0 = predX_0 
                else:
                    predY_0 -= 1
                
                if xy2Tile[predX_0][predY_0] in allocated_tiles:
                    curOptPotentialPlacement.append(xy2Tile[predX_0][predY_0])
                    
                if predX_0 == predX_1 and predY_0 == predY_1:
                    break
            
            # fineTuneWithLevelInfo() # fine-tune curOptPotentialPlacement with level info
            for tile in allocated_tiles: # supplement the rest of tiles
                if tile not in curOptPotentialPlacement:
                    curOptPotentialPlacement.append(tile)    
                    
    else:
        print("warning, the predecessors maybe three or more...")
        

def CurOptPotentialPlacement_List_DynLevel_BypassLess_Gen():    
    global predecessors, curOptPotentialPlacement, allocated_tiles, xy2Tile
    curOptPotentialPlacement.clear()
    
    # level match principle
    curOptPotentialPlacement_DynLevel = []
    succNodes = dependency_successor[curOpt]
    succNums = len(succNodes)
    dynLevelNums = len(allocated_tiles_levels_dynamic)
    dynLevel = succNums2DynLevels_kernels[succNums][dynLevelNums]
    for tile in allocated_tiles_levels_dynamic[dynLevel-1]:
        curOptPotentialPlacement_DynLevel.append(tile)
        
    # initial_dynamic_level = dynLevel
    # while True:
    #     dynLevel += 1
    #     if dynLevel > dynLevelNums:
    #         dynLevel = 1 # go back to the highest level
    #     if dynLevel == initial_dynamic_level: 
    #         break
    #     else:
    #         for tile in allocated_tiles_levels_dynamic[dynLevel-1]: # same level
    #             curOptPotentialPlacement_DynLevel.append(tile) 
                
    # bypassLess principle
    potentialPlacement_AllPreds = []
    curOptPotentialPlacement_BypassLess = []
    for pred in predecessors:
        potentialPlacement = []
        predTile = placement_dynamic_dict_Opt2Tile[pred]
        initialX = predTile.x
        initialY = predTile.y
        xChanges = [-1,0,1]
        yChanges = [-1,0,1]
        for xChange in xChanges:
            for yChange in yChanges:
                X = initialX + xChange
                Y = initialY + yChange
                try:
                    tile = xy2Tile[X][Y] # X and Y maybe illegal
                    if tile in allocated_tiles: potentialPlacement.append(tile)
                except:
                    pass 
        potentialPlacement_AllPreds.append(potentialPlacement)
        
    if len(predecessors) == 0:
        for tile in curOptPotentialPlacement_DynLevel:
            curOptPotentialPlacement.append(tile)
        return
    
    elif len(predecessors) == 1:
        curOptPotentialPlacement_BypassLess = potentialPlacement_AllPreds[0]
        for tile in allocated_tiles: # supplement the rest of tiles
            if tile not in curOptPotentialPlacement_BypassLess:
                curOptPotentialPlacement_BypassLess.append(tile)
                
    elif len(predecessors) == 2:
        # find the intersection between potentialPlacement_AllPreds of two predecessors
        intersection = []
        for tile in potentialPlacement_AllPreds[0]: 
            if tile in potentialPlacement_AllPreds[1]:
                intersection.append(tile)

        if len(intersection) > 0: # have intersection
            for tile in intersection:
                curOptPotentialPlacement_BypassLess.append(tile)
                
            # fineTuneWithLevelInfo() # fine-tune curOptPotentialPlacement with level info
            for tile in allocated_tiles: # supplement the rest of tiles
                if tile not in curOptPotentialPlacement_BypassLess:
                    curOptPotentialPlacement_BypassLess.append(tile)
                    
        else: # no intersection
            predX_0 = placement_dynamic_dict_Opt2Tile[predecessors[0]].x
            predY_0 = placement_dynamic_dict_Opt2Tile[predecessors[0]].y
            predX_1 = placement_dynamic_dict_Opt2Tile[predecessors[1]].x
            predY_1 = placement_dynamic_dict_Opt2Tile[predecessors[1]].y
            while True:
                if predX_0 < predX_1:
                    predX_0 += 1
                elif predX_0 == predX_1:
                    predX_0 = predX_0 
                else:
                    predX_0 -= 1
                    
                if predY_0 < predY_1:
                    predY_0 += 1
                elif predY_0 == predY_1:
                    predY_0 = predX_0 
                else:
                    predY_0 -= 1
                
                if xy2Tile[predX_0][predY_0] in allocated_tiles:
                    curOptPotentialPlacement_BypassLess.append(xy2Tile[predX_0][predY_0])
                    
                if predX_0 == predX_1 and predY_0 == predY_1:
                    break
            
            # fineTuneWithLevelInfo() # fine-tune curOptPotentialPlacement with level info
            for tile in allocated_tiles: # supplement the rest of tiles
                if tile not in curOptPotentialPlacement_BypassLess:
                    curOptPotentialPlacement_BypassLess.append(tile)    
                    
    else:
        print("warning, the predecessors maybe three or more...")
    
    for tile in curOptPotentialPlacement_BypassLess:
        if tile not in curOptPotentialPlacement:
            curOptPotentialPlacement.append(tile)
    
    # # check whether two principles has common tiles
    # best = []
    # for tile in curOptPotentialPlacement_BypassLess: 
    #     if tile in curOptPotentialPlacement_DynLevel:
    #         best.append(tile)

    # if len(best) > 0: # have intersection
    #     for tile in best:
    #         curOptPotentialPlacement.append(tile)
            
    #     for tile in curOptPotentialPlacement_BypassLess: # supplement the rest of tiles in curOptPotentialPlacement_BypassLess
    #         if tile not in curOptPotentialPlacement:
    #             curOptPotentialPlacement.append(tile)
    
    # else: # no intersection, bypassLess has higher priority
    #     for tile in curOptPotentialPlacement_BypassLess:
    #         if tile not in curOptPotentialPlacement:
    #             curOptPotentialPlacement.append(tile)

def CurOptPotentialPlacement_List_LevelInfo_Gen():
    global curTileStatic, curOpt, dynamic_level, max_dynamic_level, curOptPotentialPlacement
    # find the level of curOpt in static placement, and take it as the initial level of dynamic placement
    curTileStatic = placement_static_Opt2Tile[curOpt]
    static_level = 0
    # 优化Todo: 这里不用循环，给定tile，直接通过字典返回其level
    for level, allocated_tiles_level in enumerate(allocated_tiles_levels_static): # reference 4x4 CGRA hierarchy can bring higher mapping quality
        for tile in allocated_tiles_level:
            if curTileStatic.ID == tile.ID:
                static_level = level 
                break
    dynamic_level = static_level
    max_dynamic_level = len(allocated_tiles_levels_dynamic) - 1
    if dynamic_level > max_dynamic_level: dynamic_level = max_dynamic_level # calibration
    
    curOptPotentialPlacement.clear()
    
    # first priority, the same Tile in same level
    for tile in allocated_tiles_levels_dynamic[dynamic_level]: # same level
        if tile.ID == curTileStatic.ID: # same tile
            curOptPotentialPlacement.append(tile)
            break
    
    # second priority, other Tiles in the same level
    for tile in allocated_tiles_levels_dynamic[dynamic_level]: # same level
        if tile.ID != curTileStatic.ID: # other tiles
            curOptPotentialPlacement.append(tile)
    
    # third priority, other Tiles in the rest levels
    initial_dynamic_level = dynamic_level
    while True:
        dynamic_level += 1
        if dynamic_level > max_dynamic_level:
            dynamic_level = 0 # go back to the highest level
        if dynamic_level == initial_dynamic_level: 
            break
        else:
            for tile in allocated_tiles_levels_dynamic[dynamic_level]: # same level
                curOptPotentialPlacement.append(tile) 

def CurOptPotentialPlacement_List_LevelInfo_Gen_test():
    global curTileStatic, curOpt, dynamic_level, max_dynamic_level, curOptPotentialPlacement
    # find the level of curOpt in static placement, and take it as the initial level of dynamic placement
    curTileStatic = placement_static_Opt2Tile[curOpt]
    static_level = 0
    for level, allocated_tiles_level in enumerate(allocated_tiles_levels_static):
        if curTileStatic in allocated_tiles_level:
            static_level = level 
            break
    dynamic_level = static_level
    max_dynamic_level = len(allocated_tiles_levels_dynamic) - 1
    if dynamic_level > max_dynamic_level: dynamic_level = max_dynamic_level # calibration
    
    curOptPotentialPlacement.clear()
    # first priority, the same Tile in same level
    for tile in allocated_tiles_levels_dynamic[dynamic_level]: # same level
        curOptPotentialPlacement.append(tile)
        break
    
    # third priority, other Tiles in the rest levels
    initial_dynamic_level = dynamic_level
    while True:
        dynamic_level += 1
        if dynamic_level > max_dynamic_level:
            dynamic_level = 0 # go back to the highest level
        if dynamic_level == initial_dynamic_level: 
            break
        else:
            for tile in allocated_tiles_levels_dynamic[dynamic_level]: # same level
                curOptPotentialPlacement.append(tile) 
            
def CurOptPotentialPlacement_List_LevelInfo_Simplified_Gen():
    global curTileStatic, curOpt, dynamic_level, max_dynamic_level, curOptPotentialPlacement, predOpt1, xDiff_CurToPred1, yDiff_CurToPred1    
    curOptPotentialPlacement.clear()
    succNodes = dependency_successor[curOpt]
    succNums = len(succNodes)
    dynLevelNums = len(allocated_tiles_levels_dynamic)
    dynLevel = succNums2DynLevels_kernels[succNums][dynLevelNums]
    # for tile in allocated_tiles_levels_dynamic[dynLevel-1]: # same level
    #     curOptPotentialPlacement.append(tile) 
        
    tile2BypassNums = dict()
    for tile in allocated_tiles_levels_dynamic[dynLevel-1]: # calculate the required bypassNums of each Tile
        bypassOptNum = 0
        for pred in predecessors:
            predOpt1 = pred
            Calculate_CurToPred_Distance()
            bypassOptNum += (max(xDiff_CurToPred1, yDiff_CurToPred1) - 1)
        tile2BypassNums[tile.ID] = bypassOptNum
    tile2BypassNums_sorted = sorted(tile2BypassNums.items(), key = lambda kv:(kv[1], kv[0]))   
    for item in tile2BypassNums_sorted: # sort the Tile according to bypassNums
        curOptPotentialPlacement.append(allocated_tiles[item[0]])
     
    if len(predecessors) == 0:
        for tile in allocated_tiles_levels_dynamic[dynLevel-1]: # incase no predecessors
            if tile not in curOptPotentialPlacement:
                curOptPotentialPlacement.append(tile) 
        
    initial_dynamic_level = dynLevel
    while True:
        dynLevel += 1
        if dynLevel > dynLevelNums:
            dynLevel = 1 # go back to the highest level
        if dynLevel == initial_dynamic_level: 
            break
        else:
            # for tile in allocated_tiles_levels_dynamic[dynLevel-1]: # same level
            #     curOptPotentialPlacement.append(tile) 
            
            tile2BypassNums = dict()
            for tile in allocated_tiles_levels_dynamic[dynLevel-1]: # calculate the required bypassNums of each Tile
                bypassOptNum = 0
                for pred in predecessors:
                    predOpt1 = pred
                    Calculate_CurToPred_Distance()
                    bypassOptNum += (max(xDiff_CurToPred1, yDiff_CurToPred1) - 1)
                tile2BypassNums[tile.ID] = bypassOptNum
            tile2BypassNums_sorted = sorted(tile2BypassNums.items(), key = lambda kv:(kv[1], kv[0]))   
            for item in tile2BypassNums_sorted: # sort the Tile according to bypassNums
                curOptPotentialPlacement.append(allocated_tiles[item[0]])
                
def CurOptPotentialPlacement_List_Naive_Gen():
    global curOptPotentialPlacement
    curOptPotentialPlacement.clear()
    for allocated_tiles_level in reversed(allocated_tiles_levels_dynamic):
        for tile in allocated_tiles_level:
            curOptPotentialPlacement.append(tile) 

def bypassOptGen_and_Placement(predOpt, curOpt):
    global placement_failed_counts
    DynamicPlacement_SrcTgtInit_BypassMode(predOpt, curOpt) # predOpt1 generate bypass operation to get closer to predOpt2
    DynamicPlacement_IndexInit_BypassMode()
    while True: 
        if not BypassOptPlacement_Gen_Record(): # record the placement
            # print("Operation %s placement failed" % bypassOpt)
            placement_failed_counts += 1
            return -1
        Dependency_Update_BypassMode_SrcTgt() # update the dependency of the generated bypassOpt
        Update_BypassSrcInfo() # switch bypassSrc to the generated bypassOpt
        Caculate_SrcToTgt_Distance_BypassMode() # calculate distance between bypassSrc and bypassTgt
        if SrcToTgt_Distance_Satisfy_Topology_BypassMode(): # check if satisfy topology
            return IDX_pd_bypass    

def RoutingAvailability_CheckPredecessor_and_Placement():  
    global predecessors, IDX_pd, IDX_pd_modulo, idx_pd, predOpt1, predOpt2, curOpt
    global DynamicPlacement_II, xDiff_CurToPred1, yDiff_CurToPred1
    global IDX_ps, idx_ps, IDX_pd, IDX_pd_modulo, idx_pd, curOpt, predecessors, DynamicPlacement_II, curOptPotentialPlacement

    IDX_pd += 1 # initial IDX_pd is the next MRRG cycle after the MRRG cycle of the closest predOpt     
    initial_IDX_pd = IDX_pd
    IDX_pd_modulo = IDX_pd % DynamicPlacement_II
    initial_IDX_pd_modulo = IDX_pd_modulo
    upperLimit = IDX_pd + DynamicPlacement_II
    
    # for first DFG operation which doesn't have any predecessors that have finished placement
    if len(predecessors) == 0: 
        tile = curOptPotentialPlacement[0] # the first tile
        idx_pd = allocated_tiles.index(tile)
        PlacementDynamic_Record()
        return True
    
    # retrive each tile in allocated_tiles in the recommended sort
    for tile in curOptPotentialPlacement:        
        #########################################################################################
        # for each tile, check whether needs to enter bypass mode
        bypassMode = False
        bypassPreds = []
        idx_pd = allocated_tiles.index(tile)
        for pred in predecessors: 
            predOpt1 = pred
            Calculate_CurToPred_Distance()
            if not CurToPred_Distance_Satisfy_Topology():
                bypassPreds.append(pred)
                bypassMode = True 
        
        #########################################################################################
        # The IDX_pd and IDX_pd_modulo in non-bypass mode and bypass mode are different
        if not bypassMode: # non-bypass mode, IDX_pd and IDX_pd_modulo are initial value
            # recover IDX_pd and IDX_pd_modulo for each new tile
            IDX_pd = initial_IDX_pd
            IDX_pd_modulo = initial_IDX_pd_modulo
        else: # bypass mode, there will be an increment to IDX_pd and IDX_pd_modulo due to the existence of intermediate bypassOpts
            IDX_pd_bypass_MAX = initial_IDX_pd
            placement_dynamic_dict_Opt2Tile[curOpt] = tile
            for pred in bypassPreds: # firstly finish the placement of bypassOpt
                IDX_pd_lastBypass = bypassOptGen_and_Placement(pred, curOpt)
                if IDX_pd_lastBypass == -1: return False
                if IDX_pd_lastBypass > IDX_pd_bypass_MAX:
                    IDX_pd_bypass_MAX = IDX_pd_lastBypass
            # recover IDX_pd and IDX_pd_modulo for each new tile
            increment = IDX_pd_bypass_MAX - initial_IDX_pd
            IDX_pd = initial_IDX_pd + increment
            IDX_pd_modulo = IDX_pd % DynamicPlacement_II
            upperLimit = IDX_pd + DynamicPlacement_II
        
        #########################################################################################
        # after IDX_pd and IDX_pd_modulo have been confirmed, perform placement of curOpt
        # try to finish placement pf curOpt at current tile
        while True:
            # check whether tile under IDX_pd is occupied
            if placement_dynamic_occupy[IDX_pd_modulo][tile.ID] == 0: # not occupied
                idx_pd = allocated_tiles.index(tile)
                PlacementDynamic_Record()
                return True
            
            # occupied, move to next IDX_pd
            IDX_pd += 1
            IDX_pd_modulo = IDX_pd % DynamicPlacement_II
            if IDX_pd == upperLimit: # move to next tile
                break

    # if all tiles have been retrieved and haven't returned, indicates the failure of this II
    # print("Operation %s placement failed" % curOpt)
    return False
        
def Opcode_Generation(TileID):
    global curOpt # actually should return the number in the comment
    if curOpt == "N/A": opcode = "N/A" # 0
    elif curOpt == "ld1": opcode = "ld1" # 1
    elif curOpt == "ld2": opcode = "ld2" # 2
    elif curOpt == "add1": opcode = "add1" # 3
    elif curOpt == "mul": opcode = "mul" # 4
    elif curOpt == "cmp": opcode = "cmp" # 5
    elif curOpt == "add2": opcode = "add2" # 6
    elif curOpt == "br": opcode = "br" # 7
    elif curOpt == "st": opcode = "st" # 8
    elif curOpt == "phi2": opcode = "phi2" # 9
    elif curOpt == "phi1": opcode = "phi1" # 10
    elif curOpt == "ptr1": opcode = "ptr1" # 11
    elif curOpt == "ptr2": opcode = "ptr2" # 12
    else: opcode = curOpt # bypass 18
    PC = placement_dynamic_dict_Opt2PC[curOpt]
    info = "PC = " + str(PC) + ", Tile " + str(TileID) + ", opcode = " + str(opcode)
    # print(info)

def CrossbarInIdx_Generation_FromWhichLocalReg(idxIn):
    # use the same LocalReg when consecutively generating control signal for a single operation
    return idxIn 

def CrossbarOutIdx_Generation_ToWhichLocalReg(PC, TileID):
    if local_register_status[PC][TileID][0] == 0: return 11 # LocalReg 0
    elif local_register_status[PC][TileID][1] == 0: return 12 # LocalReg 1
    elif local_register_status[PC][TileID][2] == 0: return 13 # LocalReg 2
    elif local_register_status[PC][TileID][3] == 0: return 14 # LocalReg 3
    elif local_register_status[PC][TileID][4] == 0: return 15 # LocalReg 4
    elif local_register_status[PC][TileID][5] == 0: return 16 # LocalReg 5
    elif local_register_status[PC][TileID][6] == 0: return 17 # LocalReg 6
    elif local_register_status[PC][TileID][7] == 0: return 18 # LocalReg 7
    elif local_register_status[PC][TileID][8] == 0: return 19 # LocalReg 8
    elif local_register_status[PC][TileID][9] == 0: return 20 # LocalReg 9
    elif local_register_status[PC][TileID][10] == 0: return 21 # LocalReg 10
    elif local_register_status[PC][TileID][11] == 0: return 22 # LocalReg 11
    elif local_register_status[PC][TileID][12] == 0: return 23 # LocalReg 12
    elif local_register_status[PC][TileID][13] == 0: return 24 # LocalReg 13
    elif local_register_status[PC][TileID][14] == 0: return 25 # LocalReg 14
    elif local_register_status[PC][TileID][15] == 0: return 26 # LocalReg 15

def CrossbarInIdx_Generation_FromWhichFuncUnitOutput():
    # default only route FU_output[0], whose index is 9 as the former 8 positions for 8 Tiles
    return 9 

def CrossbarOutIdx_Generation_ToWhichFuncUnitInput(PC, TileID):
    if compute_regsiter_status[PC][TileID][0] == 0: return 9 # ComputeReg 0
    elif compute_regsiter_status[PC][TileID][1] == 0: return 10 # ComputeReg 1
    else: return 9 # bugs here, insufficient ComputeReg, should be fixed later
    
def CrossbarInIdx_Generation_FromWhichDirectionTile():
    global srcOpt, tgtOpt, srcTile, tgtTile
    srcTile = placement_dynamic_dict_Opt2Tile[srcOpt]
    tgtTile = placement_dynamic_dict_Opt2Tile[tgtOpt]
    xDiff = srcTile.x - tgtTile.x
    yDiff = srcTile.y - tgtTile.y
    # N:1 S:2 E:3 W:4 NE:5 SE:6 NW:7 SW:8
    if xDiff == 0:
        if yDiff == -1: return 1
        elif yDiff == 1: return 2
    elif xDiff == -1:
        if yDiff == -1: return 7
        elif yDiff == 0: return 4
        elif yDiff == 1: return 8
    elif xDiff == 1:
        if yDiff == -1: return 5
        elif yDiff == 0: return 3
        elif yDiff == 1: return 6

def CrossbarOutIdx_Generation_ToWhichRouteReg():
    global srcOpt, tgtOpt, srcTile, tgtTile
    srcTile = placement_dynamic_dict_Opt2Tile[srcOpt]
    tgtTile = placement_dynamic_dict_Opt2Tile[tgtOpt]
    xDiff = srcTile.x - tgtTile.x
    yDiff = srcTile.y - tgtTile.y
    # N:1 S:2 E:3 W:4 NE:5 SE:6 NW:7 SW:8
    if xDiff == 0:
        if yDiff == -1: return 2
        elif yDiff == 1: return 1
    elif xDiff <= -1:
        if yDiff <= -1: return 6
        elif yDiff == 0: return 3
        elif yDiff >= 1: return 5
    elif xDiff >= 1:
        if yDiff <= -1: return 8
        elif yDiff == 0: return 4
        elif yDiff >= 1: return 7

def CrossBar_Type1_ControlSignal_Generation(PC, TileID): # generate type 1 crossbar control signal
    global high4bits, low4bits
    high4bits = CrossbarInIdx_Generation_FromWhichFuncUnitOutput()
    low4bits = CrossbarOutIdx_Generation_ToWhichLocalReg(PC, TileID)
    crossBar_controlSignal = "FU_output " + str(high4bits-9) + " -> " + "LocalReg " + str(low4bits-11)
    return crossBar_controlSignal, high4bits, low4bits  

def CrossBar_Type2_ControlSignal_Generation(PC, TileID): # generate type 2 crossbar control signal
    global high4bits, low4bits
    high4bits = CrossbarInIdx_Generation_FromWhichFuncUnitOutput()
    low4bits = CrossbarOutIdx_Generation_ToWhichFuncUnitInput(PC, TileID)
    crossBar_controlSignal = "FU_output " + str(high4bits-9) + " -> " + "ComputeReg " + str(low4bits-9)
    return crossBar_controlSignal, high4bits

def CrossBar_Type3_ControlSignal_Generation(): # generate type 3 crossbar control signal
    global high4bits, low4bits
    high4bits = CrossbarInIdx_Generation_FromWhichFuncUnitOutput()
    low4bits = CrossbarOutIdx_Generation_ToWhichRouteReg()
    crossBar_controlSignal = "FU_output " + str(high4bits-9) + " -> " + "RouteReg " + str(low4bits-1) + " (TileDir " + str(low4bits) + ")"
    return crossBar_controlSignal, high4bits    

def CrossBar_Type4_ControlSignal_Generation(LocalRegIdx): # generate type 4 crossbar control signal
    global high4bits, low4bits
    high4bits = CrossbarInIdx_Generation_FromWhichLocalReg(LocalRegIdx)
    low4bits = high4bits
    crossBar_controlSignal = "LocalReg " + str(high4bits-11) + " -> " + "LocalReg " + str(low4bits-11)
    return crossBar_controlSignal    

def CrossBar_Type5_ControlSignal_Generation(LocalRegIdx, PC, TileID): # generate type 5 crossbar control signal
    global high4bits, low4bits
    high4bits = CrossbarInIdx_Generation_FromWhichLocalReg(LocalRegIdx)
    low4bits = CrossbarOutIdx_Generation_ToWhichFuncUnitInput(PC, TileID)
    crossBar_controlSignal = "LocalReg " + str(high4bits-11) + " -> " + "ComputeReg " + str(low4bits-9)
    return crossBar_controlSignal, low4bits    

def CrossBar_Type6_ControlSignal_Generation(LocalRegIdx): # generate type 6 crossbar control signal
    global high4bits, low4bits
    high4bits = CrossbarInIdx_Generation_FromWhichLocalReg(LocalRegIdx)
    low4bits = CrossbarOutIdx_Generation_ToWhichRouteReg()
    crossBar_controlSignal = "LocalReg " + str(high4bits-11) + " -> " + "RouteReg " + str(low4bits-1) + " (TileDir " + str(low4bits) + ")"
    return crossBar_controlSignal    
 
def CrossBar_Type8_ControlSignal_Generation(PC, TileID): # generate type 8 crossbar control signal
    global high4bits, low4bits
    high4bits = CrossbarInIdx_Generation_FromWhichDirectionTile()
    low4bits = CrossbarOutIdx_Generation_ToWhichFuncUnitInput(PC, TileID)
    crossBar_controlSignal = "TileDir " + str(high4bits) + " -> " + "ComputeReg " + str(low4bits-9)
    return crossBar_controlSignal, high4bits, low4bits    

def CrossBar_Type9_ControlSignal_Generation(): # generate type 9 crossbar control signal
    global high4bits, low4bits
    high4bits = CrossbarInIdx_Generation_FromWhichDirectionTile()
    low4bits = CrossbarOutIdx_Generation_ToWhichRouteReg()
    crossBar_controlSignal = "TileDir " + str(high4bits) + " -> " + "RouteReg " + str(low4bits-9)
    return crossBar_controlSignal    
    
def CrossBar_8bitsControlSignal_Predecessors_Generation(TileID): 
    global curOpt, srcOpt, tgtOpt, srcTile, tgtTile
    tgtOpt = curOpt
    for srcOpt in dependency_predecessor[curOpt]: 
        srcTile = placement_dynamic_dict_Opt2Tile[srcOpt]
        tgtTile = placement_dynamic_dict_Opt2Tile[tgtOpt]
        eq = (srcTile.ID == tgtTile.ID)
        PC = placement_dynamic_dict_Opt2PC[curOpt] - 1
        if PC < 0: PC += DynamicPlacement_II
        if eq != 1: # only different Tile requires Type 8 or Type 9
            if "bypass" in curOpt: # bypass operation
                crossBar_controlSignal = CrossBar_Type9_ControlSignal_Generation()
            else: # normal compute operation
                crossBar_controlSignal, RouteRegIdx, ComputeRegIdx = CrossBar_Type8_ControlSignal_Generation(PC, TileID)
                compute_regsiter_status[PC][TileID][ComputeRegIdx-9] = 1 # current ComputeReg has been occupied
            info = "Predecessors: PC = " + str(PC) + ", Tile " + str(TileID) + ", CrossbarCtrlSig = " + str(crossBar_controlSignal)
            # print(info)

def DebugInfo_Collect(crossBar_ctrlSig_MSG, PC_MSG):
    global MSGs, PCs
    MSGs.append(crossBar_ctrlSig_MSG) # store debug info
    PCs.append(PC_MSG)

def CrossBar_8bitsControlSignal_Successors_Generation(TileID):
    global curOpt, srcOpt, tgtOpt, srcTile, tgtTile, tgtPC, srcPC
    srcOpt = curOpt
    for tgtOpt in dependency_successor[curOpt]: 
        if tgtOpt != "N/A": # the successor of st operation is N/A
            srcTile = placement_dynamic_dict_Opt2Tile[srcOpt]
            tgtTile = placement_dynamic_dict_Opt2Tile[tgtOpt]
            srcPC = placement_dynamic_dict_Opt2PC[srcOpt]
            tgtPC = placement_dynamic_dict_Opt2PC[tgtOpt]
            
            diff = tgtPC - srcPC
            eq = (srcTile.ID == tgtTile.ID)
            if diff < 0: # diff smaller than 0 represents srcTile in current iteration should transfer results to tgtTile in the next iteration
                diff = tgtPC + DynamicPlacement_II - srcPC
                tgtPC += DynamicPlacement_II
            
            if diff == 1 and eq == 1: # Type2
                crossBar_controlSignal, ComputeRegIdx = CrossBar_Type2_ControlSignal_Generation(srcPC, TileID)
                compute_regsiter_status[srcPC][TileID][ComputeRegIdx-9] = 1 # current ComputeReg has been occupied
                DebugInfo_Collect(crossBar_controlSignal, srcPC) 
                
            elif diff == 1 and eq != 1: # Type3
                crossBar_controlSignal, ComputeRegIdx = CrossBar_Type3_ControlSignal_Generation()
                # compute_regsiter_status[srcPC][TileID][ComputeRegIdx-9] = 1 # current ComputeReg has been occupied
                DebugInfo_Collect(crossBar_controlSignal, srcPC) 
                
            elif diff == 2 and eq == 1: # Type1 + Type5
                crossBar_controlSignal, ComputeRegIdx, LocalRegIdx = CrossBar_Type1_ControlSignal_Generation(srcPC, TileID)
                # compute_regsiter_status[srcPC][TileID][ComputeRegIdx-9] = 1 # current ComputeReg has been occupied
                local_register_status[srcPC][TileID][LocalRegIdx-11] = 1 # current LocalReg has been occupied
                DebugInfo_Collect(crossBar_controlSignal, srcPC) 
                crossBar_controlSignal, ComputeRegIdx = CrossBar_Type5_ControlSignal_Generation(LocalRegIdx, srcPC+1, TileID)
                compute_regsiter_status[srcPC+1][TileID][ComputeRegIdx-9] = 1 # current ComputeReg has been occupied
                local_register_status[srcPC+1][TileID][LocalRegIdx-11] = 1 # current LocalReg has been occupied
                DebugInfo_Collect(crossBar_controlSignal, srcPC+1) 
                
            elif diff == 2 and eq != 1: # Type1 + Type6
                crossBar_controlSignal, ComputeRegIdx, LocalRegIdx = CrossBar_Type1_ControlSignal_Generation(srcPC, TileID)
                # compute_regsiter_status[srcPC][TileID][ComputeRegIdx-9] = 1 # current ComputeReg has been occupied
                local_register_status[srcPC][TileID][LocalRegIdx-11] = 1 # current LocalReg has been occupied
                DebugInfo_Collect(crossBar_controlSignal, srcPC) 
                crossBar_controlSignal = CrossBar_Type6_ControlSignal_Generation(LocalRegIdx) 
                local_register_status[srcPC+1][TileID][LocalRegIdx-11] = 1 # current LocalReg has been occupied
                DebugInfo_Collect(crossBar_controlSignal, srcPC+1) 
                
            elif diff > 2 and eq == 1: # Type1 + n*Type4 + Type5
                crossBar_controlSignal, ComputeRegIdx, LocalRegIdx = CrossBar_Type1_ControlSignal_Generation(srcPC, TileID)
                # compute_regsiter_status[srcPC][TileID][ComputeRegIdx-9] = 1 # current ComputeReg has been occupied
                local_register_status[srcPC][TileID][LocalRegIdx-11] = 1 # current LocalReg has been occupied
                DebugInfo_Collect(crossBar_controlSignal, srcPC) 
                for i in range(diff-2): 
                    crossBar_controlSignal = CrossBar_Type4_ControlSignal_Generation(LocalRegIdx)
                    local_register_status[srcPC+i+1][TileID][LocalRegIdx-11] = 1 # current LocalReg has been occupied
                    DebugInfo_Collect(crossBar_controlSignal, srcPC+i+1) 
                crossBar_controlSignal, ComputeRegIdx = CrossBar_Type5_ControlSignal_Generation(LocalRegIdx, tgtPC-1, TileID)
                compute_regsiter_status[tgtPC-1][TileID][ComputeRegIdx-9] = 1 # current ComputeReg has been occupied
                local_register_status[tgtPC-1][TileID][LocalRegIdx-11] = 1 # current LocalReg has been occupied
                DebugInfo_Collect(crossBar_controlSignal, tgtPC-1) 
                
            elif diff > 2 and eq != 1: # Type1 + n*Type4 + Type6
                crossBar_controlSignal, ComputeRegIdx, LocalRegIdx = CrossBar_Type1_ControlSignal_Generation(srcPC, TileID)
                # compute_regsiter_status[srcPC][TileID][ComputeRegIdx-9] = 1 # current ComputeReg has been occupied
                local_register_status[srcPC][TileID][LocalRegIdx-11] = 1 # current LocalReg has been occupied
                DebugInfo_Collect(crossBar_controlSignal, srcPC) 
                for i in range(diff-2): 
                    crossBar_controlSignal = CrossBar_Type4_ControlSignal_Generation(LocalRegIdx)
                    local_register_status[srcPC+i+1][TileID][LocalRegIdx-11] = 1 # current LocalReg has been occupied
                    DebugInfo_Collect(crossBar_controlSignal, srcPC+i+1) 
                crossBar_controlSignal = CrossBar_Type6_ControlSignal_Generation(LocalRegIdx) 
                local_register_status[tgtPC-1][TileID][LocalRegIdx-11] = 1 # current LocalReg has been occupied
                DebugInfo_Collect(crossBar_controlSignal, tgtPC-1) 
            
            # for i in range(len(MSGs)):
            #     info = "Successors: PC = " + str(PCs[i]) + ", Tile " + str(TileID) + ", CrossbarCtrlSig = " + str(MSGs[i])
            #     print(info)
            # MSGs.clear()
            # PCs.clear()
            
def DynamicPlacement_CorrectnessCheck(kernel):
    global testCasePassCnt
    testCasePassCnt = 0
    print("########################################")
    print("----------------------------------------")
    print("[1/8]: Checking whether all DFG operations appears in placement_dynamic...")
    badOpts = []
    match = False
    for PC in range(len(placement_static)):
        for opt in placement_static[PC]:
            match = False
            for optList in placement_dynamic:
                if opt in optList:
                    match = True
                    break 
            if not match:
                badOpts.append(opt)

    if len(badOpts) == 0:
        print("Success!")
        testCasePassCnt += 1
    else:
        print("Error!!! The operations below may be overwritten during placement, please check the code")
        print(badOpts)
    print("----------------------------------------")
    
    print("[2/8]: Checking whether all placement-generated bypass operations appears in placement_dynamic_bypass...")
    badBypassOpts = []
    match = False
    for opt in placement_dynamic_dict_Opt2PC:
        if "bypass" in opt:
            match = False
            for overlapPage in range(bypassPages):
                for bypassOptList in placement_dynamic_bypass[overlapPage]:
                    if opt in bypassOptList:
                        match = True
                        break
            if not match:
                badBypassOpts.append(opt)

    if len(badBypassOpts) == 0:
        print("Success!")
        testCasePassCnt += 1
    else:
        print("Error!!! The bypass operations below may be overwritten during placement, please check the code")
        print(badBypassOpts)
    print("----------------------------------------")
    
    print("[3/8]: Checking whether dependency_predecessor after dynamic placement remains the same as the static dependency (DFG)...")
    badOptPred = dict()
    for IDX_ps in range( len(placement_static) ):
        for idx_ps in range( len(placement_static[IDX_ps]) ):
            opt = placement_static[IDX_ps][idx_ps]
            if opt != 0 and ("bypass" not in opt):
                predecessors = dependency_predecessor[opt]
                predecessors_GT = dependency_predecessor_GT[opt]
                for pred in predecessors:
                    if (pred not in predecessors_GT) and ("bypass" not in pred): # not in groundtruth and is not bypassOpt
                        try:
                            badOptPred[opt].append(pred)
                        except:
                            badOptPred[opt] = pred
                    elif "bypass" in pred: # if pred is bypassOpt, find the real pred
                        realPred = pred
                        while True:
                            realPred = dependency_predecessor[realPred][0]
                            if "bypass" not in realPred:
                                break
                        if realPred not in predecessors_GT:
                            try:
                                badOptPred[opt].append(pred)
                            except:
                                badOptPred[opt] = pred
    if len(badOptPred) == 0:
        print("Success!")
        testCasePassCnt += 1
    else:
        print("Error!!! The following [opt:pred] pairs have predecessor dependency issues, please check the code")
        print(badOptPred)
    print("----------------------------------------")
    
    print("[4/8]: Checking whether dependency_successor after dynamic placement remains the same as the static dependency (DFG)...")
    badOptSucc = dict()
    for IDX_ps in range( len(placement_static) ):
        for idx_ps in range( len(placement_static[IDX_ps]) ):
            opt = placement_static[IDX_ps][idx_ps]
            if opt != 0 and ("bypass" not in opt):
                successors = dependency_successor[opt]
                successors_GT = dependency_successor_GT[opt]
                for succ in successors:
                    if (succ not in successors_GT) and ("bypass" not in succ): # not in groundtruth and is not bypassOpt
                        try:
                            badOptSucc[opt].append(succ)
                        except:
                            badOptSucc[opt] = succ
                    elif "bypass" in succ: # if succ is bypassOpt, find the real succ
                        realSucc = succ
                        while True:
                            realSucc = dependency_successor[realSucc][0]
                            if "bypass" not in realSucc:
                                break
                        if realSucc not in successors_GT:
                            try:
                                badOptSucc[opt].append(succ)
                            except:
                                badOptSucc[opt] = succ
    if len(badOptSucc) == 0:
        print("Success!")
        testCasePassCnt += 1
    else:
        print("Error!!! The following [opt:succ] pairs have successor dependency issues, please check the code")
        print(badOptSucc)
    print("----------------------------------------")
                        
    print("[5/8]: Checking whether temporal position between curOpt and its successors are legal for dynamic routing algorithm...")
    badTemporal = dict()
    for IDX_ps in range( len(placement_static) ):
        for idx_ps in range( len(placement_static[IDX_ps]) ):
            opt = placement_static[IDX_ps][idx_ps]
            optPC = placement_dynamic_dict_Opt2PC[opt]
            successors = dependency_successor[opt]
            for succ in successors:
                if succ != "N/A":
                    succPC = placement_dynamic_dict_Opt2PC[succ]
                    if succPC < optPC:
                        preds = dependency_predecessor[succ]
                        if opt not in preds:
                            try:
                                badTemporal[opt].append(succ)
                            except:
                                badTemporal[opt] = succ
    if len(badTemporal) == 0:
        print("Success!")
        testCasePassCnt += 1
    else:
        print("Error!!! The following [opt:succ] pairs have temporal position legitimacy issues, please check the code")
        print(badTemporal)
    print("----------------------------------------")

    print("[6/8]: Checking whether spatial position between curOpt and its successors are legal for dynamic routing algorithm...")
    badSpatial = dict()
    for IDX_ps in range( len(placement_static) ):
        for idx_ps in range( len(placement_static[IDX_ps]) ):
            opt = placement_static[IDX_ps][idx_ps]
            optTile = placement_dynamic_dict_Opt2Tile[opt]
            successors = dependency_successor[opt]
            for succ in successors:
                if succ != "N/A":
                    succTile = placement_dynamic_dict_Opt2Tile[succ]
                    xDiff_OptToSucc = abs(optTile.x - succTile.x)
                    yDiff_OptToSucc = abs(optTile.y - succTile.y)
                    if xDiff_OptToSucc <= xDiff_Limit and yDiff_OptToSucc <= yDiff_Limit:
                        pass
                    else:
                        if opt in dependency_successor_GT[succ]:
                            pass
                        else:
                            try:
                                badSpatial[opt].append(succ)
                            except:
                                badSpatial[opt] = succ
                            
    if len(badSpatial) == 0:
        print("Success!")
        testCasePassCnt += 1
    else:
        print("Error!!! The following [opt:succ] pairs have spatial position legitimacy issues, please check the code")
        print(badSpatial)
    print("----------------------------------------")    
    
    print("[7/8]: Checking whether the placement of DFG opeations have spatial/temporal conflicts between II...")
    conflictOpts = dict()
    for IDX_pd in range( len(placement_dynamic) ):
        for idx_pd in range( len(placement_dynamic[IDX_pd]) ):
            opt = placement_dynamic[IDX_pd][idx_pd]
            if opt != 0:
                optPC = placement_dynamic_dict_Opt2PC[opt]
                optTile = placement_dynamic_dict_Opt2Tile[opt]
                optPC_modulo = optPC % DynamicPlacement_II
                if placement_dynamic[optPC_modulo][optTile.ID] != 0:
                    if placement_dynamic[optPC_modulo][optTile.ID] != opt:
                        conflictOpts[opt] = placement_dynamic[optPC_modulo][optTile.ID]
    
    if len(conflictOpts) == 0:
        print("Success!")
        testCasePassCnt += 1
    else:
        print("Error!!! The following [opt:opt] pairs have spatial/temporal placement conflicts, please check the code")
        print(conflictOpts)
    print("----------------------------------------")  

    print("[8/8]: Checking whether the placement-generated bypass operations have spatial/temporal conflicts between II...")
    potential_ConflictBypassOpts = dict() # temperol and spatial conflict
    initialPage = 0
    for IDX_pd in range( len(placement_dynamic_bypass[initialPage]) ):
        for idx_pd in range( len(placement_dynamic_bypass[initialPage][IDX_pd]) ):
            bypassOpt = placement_dynamic_bypass[initialPage][IDX_pd][idx_pd]
            if bypassOpt != 0:
                bypassOptPC = placement_dynamic_dict_Opt2PC[bypassOpt]
                bypassOptTile = placement_dynamic_dict_Opt2Tile[bypassOpt]
                
                while True:
                    bypassOptPC -= DynamicPlacement_II
                    if bypassOptPC < 0:
                        break
                    if placement_dynamic_bypass[initialPage][bypassOptPC][bypassOptTile.ID] != 0:
                        try:
                            potential_ConflictBypassOpts[bypassOpt].append(placement_dynamic_bypass[initialPage][bypassOptPC][bypassOptTile.ID])
                        except:
                            potential_ConflictBypassOpts[bypassOpt] = placement_dynamic_bypass[initialPage][bypassOptPC][bypassOptTile.ID]
                
                for page in range(bypassPages):
                    if page != initialPage and placement_dynamic_bypass[page][IDX_pd][idx_pd] != 0:
                            try:
                                potential_ConflictBypassOpts[bypassOpt].append(placement_dynamic_bypass[page][IDX_pd][idx_pd])
                            except:
                                potential_ConflictBypassOpts[bypassOpt] = placement_dynamic_bypass[page][IDX_pd][idx_pd]
    
    # if port are not conflict, then temperol and spatial conflict are fine
    real_ConflictBypassOpts = dict()
    for item in potential_ConflictBypassOpts:
        bypassOpt1 = item
        bypassOpt1_pred = dependency_predecessor[bypassOpt1][0] # bypassOpt always have one pred and/or one succ
        bypassOpt1_succ = dependency_successor[bypassOpt1][0]
        bypassOpt1_Tile = placement_dynamic_dict_Opt2Tile[bypassOpt1]
        bypassOpt1_predTile = placement_dynamic_dict_Opt2Tile[bypassOpt1_pred]
        bypassOpt1_succTile = placement_dynamic_dict_Opt2Tile[bypassOpt1_succ]
        
        bypassOpt2 = potential_ConflictBypassOpts[item]
        bypassOpt2_pred = dependency_predecessor[bypassOpt2][0]
        bypassOpt2_succ = dependency_successor[bypassOpt2][0]
        bypassOpt2_Tile = placement_dynamic_dict_Opt2Tile[bypassOpt2]
        bypassOpt2_predTile = placement_dynamic_dict_Opt2Tile[bypassOpt2_pred]
        bypassOpt2_succTile = placement_dynamic_dict_Opt2Tile[bypassOpt2_succ]
        
        xDiff_Opt1_Pred = bypassOpt1_Tile.x - bypassOpt1_predTile.x
        yDiff_Opt1_Pred = bypassOpt1_Tile.y - bypassOpt1_predTile.y
        xDiff_Opt2_Pred = bypassOpt2_Tile.x - bypassOpt2_predTile.x
        yDiff_Opt2_Pred = bypassOpt2_Tile.y - bypassOpt2_predTile.y
        Opt1_InDir = Bypass_XbarIn_Direction(xDiff_Opt1_Pred, yDiff_Opt1_Pred)
        Opt2_InDir = Bypass_XbarIn_Direction(xDiff_Opt2_Pred, yDiff_Opt2_Pred)
        
        xDiff_Opt1_Succ = bypassOpt1_succTile.x - bypassOpt1_Tile.x
        yDiff_Opt1_Succ = bypassOpt1_succTile.y - bypassOpt1_Tile.y
        xDiff_Opt2_Succ = bypassOpt2_succTile.x - bypassOpt2_Tile.x
        yDiff_Opt2_Succ = bypassOpt2_succTile.y - bypassOpt2_Tile.y
        Opt1_OutDir = Bypass_XbarIn_Direction(xDiff_Opt1_Succ, yDiff_Opt1_Succ)
        Opt2_OutDir = Bypass_XbarIn_Direction(xDiff_Opt2_Succ, yDiff_Opt2_Succ)
        
        if Opt1_InDir == Opt2_InDir or Opt1_OutDir == Opt2_OutDir:
            potential_ConflictBypassOpts[bypassOpt1] = bypassOpt2  
    
    if len(real_ConflictBypassOpts) == 0:
        print("Success!")
        testCasePassCnt += 1
    else:
        print("Error!!! The following [opt:opt] pairs have spatial/temporal placement conflicts, please check the code")
        print(real_ConflictBypassOpts)
    print("----------------------------------------")                     
    print("########################################")
    
def dynamic_placement():
    global IDX_ps, idx_ps, IDX_pd, idx_pd, curOpt, predecessors, DynamicPlacement_II, curOptPotentialPlacement, threshold
    placedOpts_Counter = 0
    for IDX_ps in range( len(placement_static) ):
        
        for idx_ps in range( len(placement_static[IDX_ps]) ):
            
            # obtain new operation and its processors, obtain the initial IDX_pd
            curOpt = placement_static[IDX_ps][idx_ps] 
            predecessors.clear()
            IDX_pd = -1
            for pred in dependency_predecessor[curOpt]:
                # update pseduo dependency if pred hasn't been placed, and curOpt and pred is not in the same ring
                if not placement_done[pred]: 
                    if not (curOpt in dependency_predecessor[pred]): 
                        dependency_predecessor[pred].append(curOpt) 
                        # dependency_pseudoPredecessor[pred].append(curOpt)
                else:
                    predecessors.append(pred) 
                    if placement_dynamic_dict_Opt2PC[pred] > IDX_pd:
                        IDX_pd = placement_dynamic_dict_Opt2PC[pred]
            
            # generate potential placement Tiles list for curOpt
            # CurOptPotentialPlacement_List_Naive_Gen()
            # CurOptPotentialPlacement_List_LevelInfo_Gen()
            if placedOpts_Counter < threshold:
                CurOptPotentialPlacement_List_LevelInfo_Gen()
            else:
                CurOptPotentialPlacement_List_BypassLess_Gen()
            # print(len(curOptPotentialPlacement))
            
            if RoutingAvailability_CheckPredecessor_and_Placement():
                # print("curOpt is: %s, PC %i, Tile %i" % (curOpt, placement_dynamic_dict_Opt2PC[curOpt], placement_dynamic_dict_Opt2Tile[curOpt].ID))
                pass # continue to place next DFG operation
            else:
                return False
            
            placedOpts_Counter += 1
    
    # All DFG operations have successfully finished placement
    # Dependency_ClearPseudo()
    return True

def dynamic_routing():
    global IDX_pd, curOpt
    ###################################### Dynamic Routing ############################################
    # each thread needs to go through follow steps 
    for IDX_ps in range( len(placement_static) ):
        
        for idx_ps in range( len(placement_static[IDX_ps]) ):
            
            curOpt = placement_static[IDX_ps][idx_ps] 
            curTile = placement_dynamic_dict_Opt2Tile[curOpt]
            
            # step 1: generate opcode according to placement_dynamic
            Opcode_Generation(curTile.ID)
            
            # step 2: generate predecessors' crossbar control signal according to placement_dynamic
            CrossBar_8bitsControlSignal_Predecessors_Generation(curTile.ID) 
            
            # step 3: generate successors' crossbar control signal according to placement_dynamic
            CrossBar_8bitsControlSignal_Successors_Generation(curTile.ID) 
        
            # print("----------------------------------------------")
                
def calculate_OnChipMemory_Consumption_DynamicCompiler():
    totalBytes = 0
    # recommendation
    for level in allocated_tiles_levels_dynamic:
        totalBytes += len(level)
    for item in xy2Tile:
        totalBytes += len(item)
    totalBytes += len(curOptPotentialPlacement)
    
    # placement
    totalBytes += len(placement_dynamic_dict_Opt2PC)
    totalBytes += len(placement_dynamic_dict_Opt2Tile)
    
    # routing
    totalBytes += (len(allocated_tiles) * (IDX_pd + 1)) # 8 local registers occupation status
    totalBytes += (len(allocated_tiles) * (IDX_pd + 1) / 4) # 2 compute registers occupation status
    
    # other variables, assume 20%
    totalBytes *= 1.2
    
    print("Total On-Chip Memory Consumption are %d Bytes" % totalBytes)

def calculate_OffChipMemory_Consumption_DynamicCompiler():
    totalBytes = 0
    # DFG Nodes
    totalBytes += len(placement_static)
    # DFG Predecessors
    for pred in dependency_predecessor_GT:
        totalBytes += len(dependency_predecessor_GT[pred])
    # DFG Successors
    for succ in dependency_successor_GT:
        totalBytes += len(dependency_successor_GT[succ])
    # DFG static hierarchy info
    totalBytes += (2*len(placement_static))
    
    print("Total Off-Chip Memory Consumption are %d Bytes" % totalBytes)
    
def recordMappingResults(kernel, shape):
    filename = "D://Project//ISCA2024_DynMap//DynMap_Cpp//python mapping results//" + kernel + " " + shape + ".txt";
    with open(filename,'a') as f:
        f.seek(0)
        f.truncate()
        for IDX_ps in range( len(placement_static) ): # print mapping reults
            for idx_ps in range( len(placement_static[IDX_ps]) ):
                curOpt = placement_static[IDX_ps][idx_ps]
                f.write("%s, PC=%i, Tile=%i\n" % (curOpt, placement_dynamic_dict_Opt2PC[curOpt], placement_dynamic_dict_Opt2Tile[curOpt].ID))
        f.write("Achieved DynamicPlacement_II is %i\n" % DynamicPlacement_II)
        f.write("threshold is %i" % threshold)

def Reset(kernel, shape):
    global maxPCs, bypassPages, xDiff_Limit, yDiff_Limit, placement_failed_counts
    global xDiff_CurToPred1, yDiff_CurToPred1, xDiff_BypassSrcToTgt, yDiff_BypassSrcToTgt
    global dynamic_level, max_dynamic_level, MSGs, PCs, predecessors, curOptPotentialPlacement
    global IDX_ps, idx_ps, IDX_pd, IDX_pd_modulo, idx_pd, IDX_pd_bypass, IDX_pd_bypass_modulo
    global high4bits, low4bits, bypassOptIdx, bpsSrcTileIdx, bpsTgtTileIdx, srcPC, tgtPC
    global curOpt, srcOpt, tgtOpt, predOpt1, predOpt2, bypassOpt, bypassSrcOpt, bypassTgtOpt
    global dependency_forward, dependency_backward, curTile, curTileStatic, srcTile, tgtTile
    global predTile1, bypassSrcTile, bypassTgtTile, placement_static, placement_static_Opt2Tile
    global placement_dynamic, placement_dynamic_bypass, placement_dynamic_occupy, xy2Tile
    global placement_dynamic_bypass_occupy, placement_dynamic_dict_Opt2Tile, bpsStride
    global placement_dynamic_dict_Opt2PC, placement_done, local_register_status
    global compute_regsiter_status, allocated_tiles, allocated_tiles_idx, dependency_pseudoPredecessor
    global allocated_tiles_levels_static, allocated_tiles_levels_dynamic, dependency_predecessor_GT
    global dependency_successor, dependency_successor_GT, dependency_predecessor, succNums2DynLevels_kernels
    
    ########################################## reset all variables ###########################################    
    maxPCs = 100 # the max PC of dynamic placement for current thread
    bypassPages = 8
    xDiff_Limit = 1 # kingmesh topology
    yDiff_Limit = 1
    placement_failed_counts = 0

    xDiff_CurToPred1 = 0 # coordinate difference between the Tile of current opt and its predecessor opt
    yDiff_CurToPred1 = 0
    xDiff_BypassSrcToTgt = 0 # coordinate difference between the Tile of srcOpt and tgtOpt in bypass mode
    yDiff_BypassSrcToTgt = 0
    
    dynamic_level = 0
    max_dynamic_level = 0

    IDX_ps = 0
    idx_ps = 0
    IDX_pd = 0
    IDX_pd_modulo = 0
    idx_pd = -1    
    IDX_pd_bypass = 0
    IDX_pd_bypass_modulo = 0
    high4bits = 0
    low4bits = 0
    bypassOptIdx = 0
    bpsSrcTileIdx = 0
    bpsTgtTileIdx = 0
    srcPC = 0
    tgtPC = 0

    curOpt = ""
    srcOpt = ""
    tgtOpt = ""
    predOpt1 = ""
    predOpt2 = ""
    bypassOpt = ""
    bypassSrcOpt = ""
    bypassTgtOpt = ""
    dependency_forward = False
    dependency_backward = False

    curTile = Tile(0, 0, 0)
    curTileStatic = Tile(0, 0, 0)
    srcTile = Tile(0, 0, 0)
    tgtTile = Tile(0, 0, 0)
    predTile1 = Tile(0, 0, 0)
    bypassSrcTile = Tile(0, 0, 0)
    bypassTgtTile = Tile(0, 0, 0)

    MSGs = [] # store debug info
    PCs = []
    predecessors = []
    curOptPotentialPlacement = []
    
    placement_static = PlacementStatic_Init(kernel)
    placement_static_Opt2Tile = PlacementStatic_Dict_Opt2Tile_Init(kernel)
    placement_dynamic = PlacementDynamic_Init()
    placement_dynamic_bypass = PlacementDynamic_Bypass_Init()
    placement_dynamic_occupy = PlacementDynamic_Occupation_Init()
    placement_dynamic_bypass_occupy = PlacementDynamic_Bypass_Occupation_Init()
    placement_dynamic_dict_Opt2Tile = PlacementDynamic_Dict_Opt2Tile_Init()
    placement_dynamic_dict_Opt2PC = PlacementDynamic_Dict_Opt2PC_Init()
    xy2Tile = XY2Tile_Init()
    bpsStride = BypassStride_Gen()
    placement_done = PlacementDone_Init(kernel)
    local_register_status = LocalRegisterStatus_Init()
    compute_regsiter_status = ComputeRegisterStatus_Init()
    allocated_tiles = AllocatedTile_Init(shape)
    allocated_tiles_idx = AllocatedTileIdx_Init()
    allocated_tiles_levels_static = AllocatedTile_Level_Static()
    allocated_tiles_levels_dynamic = AllocatedTile_Level_Dynamic(shape)
    dependency_successor = DependencySuccessor_Init(kernel)
    dependency_successor_GT = copy.deepcopy(dependency_successor)
    dependency_predecessor = DependencyPredecessor_Init(kernel)    
    dependency_predecessor_GT = copy.deepcopy(dependency_predecessor)
    dependency_pseudoPredecessor = DependencyPseudoPredecessor_Init(kernel)
    succNums2DynLevels_kernels = DFG_SuccNums2DynLevels_Init(kernel)


########################################## main() ###############################################
kernel = "mvt"
shape = "12-S" # allocated tiles   
totalNodes = DFG_NodesCount_kernels[kernel]
numTiles = CGRA_NumTiles[shape]
RecMII = DFG_Theoretical_RecMII_kernels[kernel]
ResMII = math.ceil(totalNodes / numTiles)
DynamicPlacement_II = max(ResMII, RecMII) # theoretical optimal II
threshold = 1

maxPCs = 100 # the max PC of dynamic placement for current thread
bypassPages = 8
xDiff_Limit = 1 # kingmesh topology
yDiff_Limit = 1
placement_failed_counts = 0

xDiff_CurToPred1 = 0 # coordinate difference between the Tile of current opt and its predecessor opt
yDiff_CurToPred1 = 0
xDiff_BypassSrcToTgt = 0 # coordinate difference between the Tile of srcOpt and tgtOpt in bypass mode
yDiff_BypassSrcToTgt = 0

dynamic_level = 0
max_dynamic_level = 0

IDX_ps = 0
idx_ps = 0
IDX_pd = 0
IDX_pd_modulo = 0
idx_pd = -1    
IDX_pd_bypass = 0
IDX_pd_bypass_modulo = 0
high4bits = 0
low4bits = 0
bypassOptIdx = 0
bpsSrcTileIdx = 0
bpsTgtTileIdx = 0
srcPC = 0
tgtPC = 0

curOpt = ""
srcOpt = ""
tgtOpt = ""
predOpt1 = ""
predOpt2 = ""
bypassOpt = ""
bypassSrcOpt = ""
bypassTgtOpt = ""
dependency_forward = False
dependency_backward = False

curTile = Tile(0, 0, 0)
curTileStatic = Tile(0, 0, 0)
srcTile = Tile(0, 0, 0)
tgtTile = Tile(0, 0, 0)
predTile1 = Tile(0, 0, 0)
bypassSrcTile = Tile(0, 0, 0)
bypassTgtTile = Tile(0, 0, 0)

MSGs = [] # store debug info
PCs = []
predecessors = []
curOptPotentialPlacement = []

placement_static = PlacementStatic_Init(kernel)
placement_static_Opt2Tile = PlacementStatic_Dict_Opt2Tile_Init(kernel)
placement_dynamic = PlacementDynamic_Init()
placement_dynamic_bypass = PlacementDynamic_Bypass_Init()
placement_dynamic_occupy = PlacementDynamic_Occupation_Init()
placement_dynamic_bypass_occupy = PlacementDynamic_Bypass_Occupation_Init()
placement_dynamic_dict_Opt2Tile = PlacementDynamic_Dict_Opt2Tile_Init()
placement_dynamic_dict_Opt2PC = PlacementDynamic_Dict_Opt2PC_Init()
xy2Tile = XY2Tile_Init()
bpsStride = BypassStride_Gen()
placement_done = PlacementDone_Init(kernel)
local_register_status = LocalRegisterStatus_Init()
compute_regsiter_status = ComputeRegisterStatus_Init()
allocated_tiles = AllocatedTile_Init(shape)
allocated_tiles_idx = AllocatedTileIdx_Init()
allocated_tiles_levels_static = AllocatedTile_Level_Static()
allocated_tiles_levels_dynamic = AllocatedTile_Level_Dynamic(shape)
dependency_successor = DependencySuccessor_Init(kernel)
dependency_successor_GT = copy.deepcopy(dependency_successor)
dependency_predecessor = DependencyPredecessor_Init(kernel)    
dependency_predecessor_GT = copy.deepcopy(dependency_predecessor)
dependency_pseudoPredecessor = DependencyPseudoPredecessor_Init(kernel)
succNums2DynLevels_kernels = DFG_SuccNums2DynLevels_Init(kernel)



#################################### Manual Test ####################################
# while True:
#     threshold_to_bypassOptsNum = dict()
#     for threshold in range(1, totalNodes+1):
#     # for threshold in range(1, 2):
#         Reset(kernel, shape)
#         print("Try to finish placement at II=%d, threshold=%d, " % (DynamicPlacement_II, threshold))
#         if dynamic_placement():
#             print("Placement at II=%d, threshold=%d success" % (DynamicPlacement_II, threshold))
#             with HiddenPrints(): 
#                 DynamicPlacement_CorrectnessCheck(kernel)
#             testCasePassCnt = 8
#             if testCasePassCnt == 8: # 8 testcases all passed
#                 threshold_to_bypassOptsNum[threshold] = bypassOptIdx
#             else:
#                 print("dynamic placement finished but testcases not passed...")
#     if len(threshold_to_bypassOptsNum) == 0: # no successful placement under current II and all possible thresholds
#         DynamicPlacement_II += 1
#     else:
#         threshold_to_bypassOptsNum_sorted = sorted(threshold_to_bypassOptsNum.items(), key = lambda kv:(kv[1], kv[0]))
#         first_element = threshold_to_bypassOptsNum_sorted[0]
#         print("Dynamic Placement II is %d, the optimal threshold is %d, and the corresponding bypassOpts minimum number is %d"
#               % (DynamicPlacement_II, first_element[0], first_element[1]))   
#         break

# calculate_OnChipMemory_Consumption_DynamicCompiler()
# calculate_OffChipMemory_Consumption_DynamicCompiler()

# threshold = 1
# Reset(kernel, shape)
# print("Try to finish placement at II=%d, threshold=%d, " % (DynamicPlacement_II, threshold), end="")
# if dynamic_placement():
#     print("Placement success")
# # DynamicPlacement_CorrectnessCheck(kernel)
# dynamic_routing()
# for IDX_ps in range( len(placement_static) ): # print mapping reults
#     for idx_ps in range( len(placement_static[IDX_ps]) ):
#         curOpt = placement_static[IDX_ps][idx_ps]
#         print("%s, PC=%i, Tile=%i" % (curOpt, placement_dynamic_dict_Opt2PC[curOpt], placement_dynamic_dict_Opt2Tile[curOpt].ID))


#################################### Auto Test ####################################
test_kernels = ["mvt", "fft", "dtw", "blowfish", "spmv", "conv"]
test_shapes = dict()
test_shapes["mvt"] = ["12-S","12-IA","12-IB","12-L","8-IA","8-S","8-IB","8-L","4-S","4-IB","4-IA","4-L"]
test_shapes["fft"] = ["12-S","12-IA","12-IB","12-L","8-IA","8-S","8-IB","8-L","4-S","4-IB","4-IA","4-L"]
test_shapes["dtw"] = ["8-IA","8-S","8-IB","8-L","6-S","6-IA","6-IB","6-L","4-S","4-IB","4-IA","4-L"]
test_shapes["blowfish"] = ["8-IA","8-S","8-IB","8-L","6-S","6-IA","6-IB","6-L","4-S","4-IB","4-IA","4-L"]
test_shapes["spmv"] = ["6-S","6-IA","6-IB","6-L","5-S","5-IB","5-IA","5-L","4-S","4-IB","4-IA","4-L"]
test_shapes["conv"] = ["6-S","6-IA","6-IB","6-L","5-S","5-IB","5-IA","5-L","4-S","4-IB","4-IA","4-L"]

test_case = 1
compilation_time = []
for kernel in test_kernels:
    for shape in test_shapes[kernel]:
        start = time.perf_counter_ns()
        for i in range(10):
            totalNodes = DFG_NodesCount_kernels[kernel]
            numTiles = CGRA_NumTiles[shape]
            RecMII = DFG_Theoretical_RecMII_kernels[kernel]
            ResMII = math.ceil(totalNodes / numTiles)
            DynamicPlacement_II = max(ResMII, RecMII) # theoretical optimal II
            while True:
                threshold_to_bypassOptsNum = dict()
                for threshold in range(1, totalNodes+1, 1): # stride=1,best quality. stride=8,best speed
                    Reset(kernel, shape)
                    # print("Try to finish placement at II=%d, threshold=%d, " % (DynamicPlacement_II, threshold), end="")
                    if dynamic_placement():
                        # print("Placement success")
                        threshold_to_bypassOptsNum[threshold] = bypassOptIdx
                        # dynamic_routing()
                        break 
                if len(threshold_to_bypassOptsNum) == 0: # no successful placement under current II and all possible thresholds
                    DynamicPlacement_II += 1
                else:  
                    break
        
        end = time.perf_counter_ns()
        avgTimeCons_ms = (end - start)/ 1000000 / 10
        compilation_time.append(format(avgTimeCons_ms, '.3f'))
        print("TestCase:[%d/72] %s %s compilation done, time consumption is %.3f ms, II=%d" % (test_case, kernel, shape, avgTimeCons_ms, DynamicPlacement_II))
         
        recordMappingResults(kernel, shape)
        test_case += 1

with open("profile.txt",'a') as f:
    f.seek(0)
    f.truncate()
    for item in compilation_time:
        f.write(str(item)+"\n")
        
# start = time.perf_counter_ns()
# print("This is to measure the performance difference between C++ and python, executing 0.1 billion loop...")
# a = 0
# for i in range(1000000000):
#     a += 1
# end = time.perf_counter_ns()
# print("The time consumption for python to run 0.1 billion loop is %d ms" % ((end - start)/ 1000000))