# -*- coding: utf-8 -*-
"""
Created on Thu Oct 12 14:03:02 2023

@author: yufei yang
"""

from benchmark import placement_static_kernels
from benchmark import placement_done_kernels
from benchmark import dependency_predecessors_kernels
from benchmark import dependency_pseudo_predecessors_kernels
from benchmark import dependency_successors_kernels
from benchmark import placement_static_Opt2Tile_kernels
from benchmark import placement_static_Opt2PC_kernels
from benchmark import allocated_tiles_nxn
from benchmark import allocated_tiles_levels_dynamic_nxn
from Utils import CGRA, Tile, CGRA_size
import copy

def PlacementStatic_Init(kernel_name): # static placement result
    res = placement_static_kernels[kernel_name]
    return res

def PlacementStatic_Dict_Opt2Tile_Init(kernel_name):
    res = placement_static_Opt2Tile_kernels[kernel_name]
    return res

def PlacementStatic_Dict_Opt2PC_Init(kernel_name):
    res = placement_static_Opt2PC_kernels[kernel_name]
    return res

def PlacementDone_Init(kernel_name): # record whether a operation has been placed
    res = placement_done_kernels[kernel_name]
    return res   

def DependencyPredecessor_Init(kernel_name): # the predecessor of current operation  
    res = dependency_predecessors_kernels[kernel_name]
    return res

def DependencyPseudoPredecessor_Init(kernel_name): # the pseudo predecessor of current operation  
    res = dependency_pseudo_predecessors_kernels[kernel_name]
    return res

def DependencySuccessor_Init(kernel_name): # the successor of current operation
    res = dependency_successors_kernels[kernel_name]
    return res

def PlacementDynamic_Init(): # overlapped MRRG for all threads
    res = [[0 for col in range(CGRA_size**2)] for row in range(maxPCs)]
    return res

def PlacementDynamic_Bypass_Init(): 
    res = [[[0 for col in range(CGRA_size**2)] for row in range(maxPCs)] for page in range(bypassPages)]
    return res

def PlacementDynamicAuxilary_Init(): 
    global StaticPlacement_II
    # three dimensional list, has static II pages in total
    res = [[[0 for col in range(CGRA_size**2)] for row in range(maxAuxPCs)] for i in range(StaticPlacement_II)]
    return res

def PlacementDynamicAuxilaryUtil_Init():
    global StaticPlacement_II
    # three dimensional list, has static II pages in total
    res = [[0 for row in range(maxAuxPCs)] for i in range(StaticPlacement_II)]
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

def AllocatedTile_Init(nxn): # allocated Tile for current thread
    res = allocated_tiles_nxn[nxn]
    return res

def AllocatedTile_Level_Static(): # allocated Tile for static placement
    cgra = CGRA(CGRA_size)
    res = [
            [cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[9], cgra.Tiles[10]], # level 0
            [cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[4], cgra.Tiles[7], cgra.Tiles[8], cgra.Tiles[11], cgra.Tiles[13], cgra.Tiles[14]], # level 1
            [cgra.Tiles[0], cgra.Tiles[3], cgra.Tiles[12], cgra.Tiles[15]] # level 2
             ]
    return res

def AllocatedTile_Level_Dynamic(nxn): # allocated Tile level information for current thread in run-time
    res = allocated_tiles_levels_dynamic_nxn[nxn]
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
    # res = [[1,1], # x move 1, y move 1
    #         [1,0], # x move 1, y remains unchange
    #         [1,-1], # x move 1, y move -1 
    #         [0,1],
    #         [0,-1],
    #         [-1,1],
    #         [-1,0],
    #         [-1,-1]] 
    res = [[1,1], # x move 1, y move 1
            [1,0], # x move 1, y remains unchange
            [0,1]] # x remains unchange, y move 1 
    return res

def DynamicPlacement_IndexInit_BypassMode():
    global bypassSrcOpt, bpsSrcTileIdx, IDX_pd, IDX_pd_aux, idx_pd, idx_ps
    idx_pd = bpsSrcTileIdx

def DynamicPlacement_IndexUpdate_ResetTile_NextPC():    
    global idx_pd, IDX_pd
    IDX_pd += 1
    idx_pd = -1

def DynamicPlacement_IndexRecord():    
    global idx_pd, IDX_pd, idx_pd_anchor, IDX_pd_anchor
    IDX_pd_anchor = IDX_pd
    idx_pd_anchor = idx_pd

def DynamicPlacement_IndexRecover():    
    global idx_pd, IDX_pd, idx_pd_anchor, IDX_pd_anchor
    IDX_pd = IDX_pd_anchor
    idx_pd = idx_pd_anchor

def PlacementDynamic_Record(): # record the dynamic placement of curOpt
    global idx_pd, IDX_pd, curOpt, auxilary_page, IDX_pd_aux, IDX_pd_modulo
    tileId = allocated_tiles[idx_pd].ID
    placement_dynamic[IDX_pd][tileId] = curOpt
    placement_dynamic_occupy[IDX_pd_modulo][tileId] = curOpt
    placement_dynamic_dict_Opt2Tile[curOpt] = allocated_tiles[idx_pd]
    placement_dynamic_dict_Opt2PC[curOpt] = IDX_pd
    placement_dynamic_dict_Opt2PC_4BpsGen[curOpt] = IDX_pd
    placement_done[curOpt] = 1

def Bypass_XbarIn_Direction(xDiff, yDiff):  
    # N:1 S:2 E:3 W:4 NE:5 SE:6 NW:7 SW:8
    if xDiff == 0:
        if yDiff == -1: return 2
        elif yDiff == 1: return 1
    elif xDiff == -1:
        if yDiff == -1: return 6
        elif yDiff == 0: return 3
        elif yDiff == 1: return 5
    elif xDiff == 1:
        if yDiff == -1: return 8
        elif yDiff == 0: return 4
        elif yDiff == 1: return 7

def Bypass_XbarOut_Direction(xDiff, yDiff):
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

def Bypass_TileXY_Coords_Diff_Gen(i):
    global bypassSrcTile, bypassTgtTile, bpsStride
    if bypassSrcTile.x < bypassTgtTile.x:
        x = bypassSrcTile.x + bpsStride[i][0]
        xDiff = bpsStride[i][0]
    elif bypassSrcTile.x == bypassTgtTile.x:
        x = bypassSrcTile.x 
        xDiff = 0
    else:
        x = bypassSrcTile.x - bpsStride[i][0]
        xDiff = -bpsStride[i][0]
        
    if bypassSrcTile.y < bypassTgtTile.y:
        y = bypassSrcTile.y + bpsStride[i][1]
        yDiff = bpsStride[i][1]
    elif bypassSrcTile.y == bypassTgtTile.y:
        y = bypassSrcTile.y 
        yDiff = 0
    else:
        y = bypassSrcTile.y - bpsStride[i][1]
        yDiff = -bpsStride[i][1]
    
    # x = bypassSrcTile.x + bpsStride[i][0]
    # if x > CGRA_size - 1: x = CGRA_size - 1
    # elif x < 0: x = 0
    # xDiff = bpsStride[i][0]
    # print("x is", x)
    
    # y = bypassSrcTile.y + bpsStride[i][1]
    # if y > CGRA_size - 1: y = CGRA_size - 1
    # elif y < 0: y = 0
    # yDiff = bpsStride[i][1]
    # print("y is", y)
    return x, y, xDiff, yDiff

def BypassOptPlacement_Gen_Record(): # record the dynamic placement of bypass operation
    global IDX_pd, idx_pd, bypassOpt, bypassSrcOpt, bypassOptIdx, auxilary_page, IDX_pd_aux, IDX_pd_bypass, IDX_pd_bypass_modulo, bypassPage
    global bypassSrcOpt, bypassSrcTile, bypassTgtTile, bpsStride, idx_pd
    
    bypassOpt = "bypass" + str(bypassOptIdx)
    bypassOptIdx += 1

    IDX_pd_bypass = placement_dynamic_dict_Opt2PC_4BpsGen[bypassSrcOpt] + 1
    # get the modulo of IDX_pd_bypass
    IDX_pd_bypass_modulo = IDX_pd_bypass
    # IDX_pd_bypass_modulo_initial = IDX_pd_bypass_modulo
    upperLimit = IDX_pd_bypass_modulo + DynamicPlacement_II
    while True: 
        if IDX_pd_bypass_modulo - DynamicPlacement_II < 0:
            break
        IDX_pd_bypass_modulo -= DynamicPlacement_II  
        
        
    while True:
        for i in range(len(bpsStride)):
            x, y, xDiff, yDiff = Bypass_TileXY_Coords_Diff_Gen(i)
            if xDiff == 0 and yDiff == 0:
                continue
    
            # check whether the bypass tile in allocated_tiles
            if xy2Tile[x][y] in allocated_tiles:
                idx_pd = allocated_tiles.index(xy2Tile[x][y])
                tileId = allocated_tiles[idx_pd].ID
                
                # obtain tile crossbar in out direction
                dirInIdx = Bypass_XbarIn_Direction(xDiff, yDiff)
                dirOutIdx = Bypass_XbarOut_Direction(xDiff, yDiff)
                # print("xDiff is ", xDiff)
                # print("yDiff is ", yDiff)
                # print("dirInIdx is ", dirInIdx)
                # print("dirOutIdx is ", dirOutIdx)
                
                # finish the placement of bypassOpt on this tile if the request crossbarIn&Out ports are not occupied
                if placement_dynamic_bypass_occupy[IDX_pd_bypass_modulo][tileId][dirInIdx-1] == 0:
                    page = 0
                    while True:
                        if placement_dynamic_bypass[page][IDX_pd_bypass][tileId] == 0: 
                            placement_dynamic_bypass[page][IDX_pd_bypass][tileId] = bypassOpt
                            placement_dynamic_bypass_occupy[IDX_pd_bypass_modulo][tileId][dirInIdx-1] = 1
                            placement_dynamic_bypass_occupy[IDX_pd_bypass_modulo-1][bypassSrcTile.ID][dirOutIdx+8-1] = 1
                            placement_dynamic_dict_Opt2Tile[bypassOpt] = allocated_tiles[idx_pd]
                            placement_dynamic_dict_Opt2PC[bypassOpt] = IDX_pd_bypass
                            placement_dynamic_dict_Opt2PC_4BpsGen[bypassOpt] = IDX_pd_bypass
                            placement_done[bypassOpt] = 1
                            return True
                        page += 1

    
        IDX_pd_bypass_modulo += 1
        IDX_pd_bypass += 1
        if IDX_pd_bypass_modulo == upperLimit:
            return False
            
def Dependency_Update_BypassMode_Src():
    global bypassOpt, bypassSrcOpt, curOpt, dependency_forward, dependency_backward
    
    if dependency_forward:
        # update successor of bypassSrcOpt
        try: 
            dependency_successor[bypassSrcOpt].remove(curOpt)
            dependency_successor[bypassSrcOpt].append(bypassOpt)
        except:
            try:
                dependency_successor[bypassSrcOpt] = [bypassOpt]
            except:
                dependency_successor[bypassSrcOpt].append(bypassOpt)           
                
        # update predecessor of bypassOpt        
        try:
            dependency_predecessor[bypassOpt] = [bypassSrcOpt] 
        except:
            dependency_predecessor[bypassOpt].append(bypassSrcOpt)
        
        # update predecessor of curOpt
        try: 
            dependency_predecessor[curOpt].remove(bypassSrcOpt)
        except:
            pass
        
    if dependency_backward:
        # update predecessor of bypassSrcOpt
        try: 
            dependency_predecessor[bypassSrcOpt].remove(curOpt)
            dependency_predecessor[bypassSrcOpt].append(bypassOpt)
        except:
            try:
                dependency_predecessor[bypassSrcOpt] = [bypassOpt]
            except:
                dependency_predecessor[bypassSrcOpt].append(bypassOpt)
                
        # update successor of bypassOpt
        try:
            dependency_successor[bypassOpt] = [bypassSrcOpt] 
        except:
            dependency_successor[bypassOpt].append(bypassSrcOpt)
            
        # update successor of curOpt    
        try: 
            dependency_successor[curOpt].remove(bypassSrcOpt)
        except:
            pass

def Dependency_Update_BypassMode_SrcTgt():
    global bypassOpt, bypassSrcOpt, bypassTgtOpt, dependency_forward, dependency_backward
    if dependency_forward:
        # update successor of bypassSrcOpt
        try: 
            dependency_successor[bypassSrcOpt].remove(bypassTgtOpt)
            dependency_successor[bypassSrcOpt].append(bypassOpt)
        except:
            try:
                dependency_successor[bypassSrcOpt] = [bypassOpt]
            except:
                dependency_successor[bypassSrcOpt].append(bypassOpt)
                
        # update predecessor and successor of bypassOpt
        try:
            dependency_predecessor[bypassOpt] = [bypassSrcOpt] 
            dependency_successor[bypassOpt] = [bypassTgtOpt]
        except:
            dependency_predecessor[bypassOpt].append(bypassSrcOpt)
            dependency_successor[bypassOpt].append(bypassTgtOpt)
        
        # update predecessor of bypassTgtOpt
        dependency_predecessor[bypassTgtOpt].remove(bypassSrcOpt) 
        dependency_predecessor[bypassTgtOpt].append(bypassOpt)
    
    if dependency_backward:
        # update predecessor of bypassSrcOpt
        try: 
            dependency_predecessor[bypassSrcOpt].remove(bypassTgtOpt)
            dependency_predecessor[bypassSrcOpt].append(bypassOpt)
        except:
            try:
                dependency_predecessor[bypassSrcOpt] = [bypassOpt]
            except:
                dependency_predecessor[bypassSrcOpt].append(bypassOpt)
                
        # update successor and predecessor of bypassOpt
        try:
            dependency_successor[bypassOpt] = [bypassSrcOpt] 
            dependency_predecessor[bypassOpt] = [bypassTgtOpt]
        except:
            dependency_successor[bypassOpt].append(bypassSrcOpt)
            dependency_predecessor[bypassOpt].append(bypassTgtOpt)
        
        # update successor of bypassTgtOpt
        dependency_successor[bypassTgtOpt].remove(bypassSrcOpt) 
        dependency_successor[bypassTgtOpt].append(bypassOpt)
    
def Dependency_Overwrite_BypassMode():
    global curOpt, bypassSrcOpt, dependency_forward, dependency_backward, idx_pd, IDX_pd, auxilary_page, IDX_pd_aux, IDX_pd_bypass, bypassPage
    tileId = allocated_tiles[idx_pd].ID
    # auxilary_page is already the correct page for the placement of bypassOpt, no need to +1
    placement_dynamic_bypass[IDX_pd_bypass][tileId] = 0 # set the last bypassOpt back to 0
    if dependency_forward:
        # update successor of last bypassOpt
        prevBypassOpt = dependency_predecessor[bypassSrcOpt][0]
        dependency_successor[prevBypassOpt].remove(bypassSrcOpt)
        dependency_successor[prevBypassOpt].append(curOpt)
        # update predcessor of curOpt
        dependency_predecessor[curOpt].append(prevBypassOpt) 
        del dependency_predecessor[bypassSrcOpt] 
    
    if dependency_backward:
        # update predcessor of last bypassOpt
        prevBypassOpt = dependency_successor[bypassSrcOpt][0]
        dependency_predecessor[prevBypassOpt].remove(bypassSrcOpt)
        dependency_predecessor[prevBypassOpt].append(curOpt)
        # update successor of curOpt
        dependency_successor[curOpt].append(prevBypassOpt) 
        del dependency_successor[bypassSrcOpt]    

def Dependency_ClearPseudo():
    global dependency_pseudoPredecessor
    for pred in dependency_pseudoPredecessor.keys():
        for curOpt in dependency_pseudoPredecessor[pred]:
            try:
                dependency_predecessor[pred].remove(curOpt)
            except:
                pass
    
def Update_BypassSrcInfo():
    global bypassSrcOpt, bypassOpt, bypassSrcTile
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
    if (bypassSrcOpt in dependency_predecessor[curOpt]) and (bypassSrcOpt not in dependency_pseudoPredecessor[curOpt]): dependency_forward = True
    else: dependency_forward = False
    if (curOpt in dependency_predecessor[bypassSrcOpt]) and (curOpt not in dependency_pseudoPredecessor[bypassSrcOpt]): dependency_backward = True
    else: dependency_backward = False

def Calculate_PredToPred_Distance(): # calculate x and y difference between two predecessors of current opt
    global predOpt1, predOpt2, predTile1, predTile2, xDiff_PredToPred, yDiff_PredToPred
    predTile1 = placement_dynamic_dict_Opt2Tile[predOpt1]
    predTile2 = placement_dynamic_dict_Opt2Tile[predOpt2]
    xDiff_PredToPred = abs(predTile1.x - predTile2.x)
    yDiff_PredToPred = abs(predTile1.y - predTile2.y)

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

def Calculate_CurToPreds_Distance(): # calculate x and y difference between current opt and its two predecessors
    global idx_pd, curTile, predOpt1, predTile1, xDiff_CurToPred1, yDiff_CurToPred1, predOpt2, predTile2, xDiff_CurToPred2, yDiff_CurToPred2
    curTile = allocated_tiles[idx_pd] 
    predTile1 = placement_dynamic_dict_Opt2Tile[predOpt1]
    predTile2 = placement_dynamic_dict_Opt2Tile[predOpt2]
    xDiff_CurToPred1 = abs(curTile.x - predTile1.x)
    yDiff_CurToPred1 = abs(curTile.y - predTile1.y)
    xDiff_CurToPred2 = abs(curTile.x - predTile2.x)
    yDiff_CurToPred2 = abs(curTile.y - predTile2.y)
    
def PredToPred_Distance_Satisfy_Topology(): # check whether the placement of two predecessors satisfy the topology
    global xDiff_PredToPred, yDiff_PredToPred, xDiff_Limit, yDiff_Limit
    return xDiff_PredToPred <= xDiff_Limit and yDiff_PredToPred <= yDiff_Limit

def SrcToTgt_Distance_Satisfy_Topology_BypassMode(): # check whether the placement of bypassSrcOpt and bypassTgtOpt satisfy the topology
    global xDiff_BypassSrcToTgt, yDiff_BypassSrcToTgt, xDiff_Limit, yDiff_Limit
    return xDiff_BypassSrcToTgt <= xDiff_Limit and yDiff_BypassSrcToTgt <= yDiff_Limit
    
def CurToPred_Distance_Satisfy_Topology(): # check whether the placement of current opt and its predecessor satisfy the topology
    global xDiff_CurToPred1, yDiff_CurToPred1, xDiff_Limit, yDiff_Limit
    return xDiff_CurToPred1 <= xDiff_Limit and yDiff_CurToPred1 <= yDiff_Limit

def CurToPreds_Distance_Satisfy_Topology(): # check whether the placement of current opt and its two predecessor satisfy the topology
    global xDiff_CurToPred1, yDiff_CurToPred1, xDiff_CurToPred2, yDiff_CurToPred2, xDiff_Limit, yDiff_Limit
    return xDiff_CurToPred1 <= xDiff_Limit and yDiff_CurToPred1 <= yDiff_Limit and xDiff_CurToPred2 <= xDiff_Limit and yDiff_CurToPred2 <= yDiff_Limit

def CurOptPotentialPlacement_List_Gen():
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
    
    curOptPotentialPlacement = []
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

def bypassOptGen_and_Placement(predOpt, curOpt):
    global bypassOpt_usedTiles
    DynamicPlacement_SrcTgtInit_BypassMode(predOpt, curOpt) # predOpt1 generate bypass operation to get closer to predOpt2
    DynamicPlacement_IndexInit_BypassMode()
    while True: 
        if not BypassOptPlacement_Gen_Record(): # record the placement
            print("placement failed ", bypassOpt)
        Dependency_Update_BypassMode_SrcTgt() # update the dependency of the generated bypassOpt
        Update_BypassSrcInfo() # switch bypassSrc to the generated bypassOpt
        Caculate_SrcToTgt_Distance_BypassMode() # calculate distance between bypassSrc and bypassTgt
        if SrcToTgt_Distance_Satisfy_Topology_BypassMode(): # check if satisfy topology
            break    

def RoutingAvailability_CheckNothing_and_Placement():
    PlacementDynamic_Record()
    return True

def RoutingAvailability_CheckPredecessor_and_Placement():  
    global predecessors, IDX_pd, IDX_pd_modulo, idx_pd, predOpt1, predOpt2, curOpt
    global DynamicPlacement_II, xDiff_CurToPred1, yDiff_CurToPred1
    
    # need to enter bypassMode even if only one predecessor not satisfy placement toplogy with curOpt
    bypassMode = False
    distance = 0
    furthestPred = ""
    for pred in predecessors: 
        predOpt1 = pred
        Calculate_CurToPred_Distance()
        if not CurToPred_Distance_Satisfy_Topology():
            bypassMode = True 
        if max(xDiff_CurToPred1, yDiff_CurToPred1) > distance:
            distance = max(xDiff_CurToPred1, yDiff_CurToPred1)
            furthestPred = pred
    
    if not bypassMode: # non-bypass mode
        PlacementDynamic_Record()
        return True
    else: # bypass mode
        # caculated the minimum IDX_pd in bypass mode
        IDX_pd_predOpt = placement_dynamic_dict_Opt2PC[furthestPred]
        IDX_pd = IDX_pd_predOpt + distance
        tile = allocated_tiles[idx_pd] 
        upperLimit = IDX_pd + DynamicPlacement_II
        
        # as tile has been confirmed, place bypassOpt first to see how many IDX_pd are actually required
        # IDX_pd_real = -1
        # for pred in predecessors:
        #     PC = bypassOptGen_and_Placement(pred, curOpt)
        #     if PC > IDX_pd_real:
        #         IDX_pd_real = PC
        # # calculate real IDX_pd
        # IDX_pd = IDX_pd_real
        # upperLimit = IDX_pd + DynamicPlacement_II
        
        while True:
            # get the modulo of IDX_pd
            IDX_pd_modulo = IDX_pd
            while True: 
                if IDX_pd_modulo - DynamicPlacement_II < 0:
                    break
                IDX_pd_modulo -= DynamicPlacement_II  
            
            # if tile under IDX_pd is not occupied, finish the placement of curOpt and intermediate bypassOpt
            if placement_dynamic_occupy[IDX_pd_modulo][tile.ID] == 0: # not occupied
                idx_pd = allocated_tiles.index(tile)
                PlacementDynamic_Record() 
                for pred in predecessors:
                    bypassOptGen_and_Placement(pred, curOpt)
                return True
                
            # move to next IDX_pd
            IDX_pd += 1
            if IDX_pd == upperLimit: 
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
    print(info)

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
    elif xDiff == -1:
        if yDiff == -1: return 6
        elif yDiff == 0: return 3
        elif yDiff == 1: return 5
    elif xDiff == 1:
        if yDiff == -1: return 8
        elif yDiff == 0: return 4
        elif yDiff == 1: return 7

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
            print(info)

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
            
            for i in range(len(MSGs)):
                info = "Successors: PC = " + str(PCs[i]) + ", Tile " + str(TileID) + ", CrossbarCtrlSig = " + str(MSGs[i])
                print(info)
            MSGs.clear()
            PCs.clear()
            
def DynamicPlacement_CorrectnessCheck(kernel_name):
    print("########################################")
    print("Start checking the correctness of dynamic placement for current kernel...")
    print("----------------------------------------")
    # Step1: check whether all operations in placement_static appears in placement_dynamic
    print("[1/4]: Checking whether all operations in placement_static appears in placement_dynamic...")
    auxOpts = []
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
                auxOpts.append(opt)
                badOpts.append(opt)
    for page in placement_dynamic_auxilary:
        for row in page:
            for opt in auxOpts:
                if opt in row:
                    badOpts.remove(opt)
    if len(badOpts) == 0:
        print("Success!")
    else:
        print("Error!!! The placement of the operations below may be overwritten, please check the code")
        print(badOpts)
    print("----------------------------------------")
    
    # Step2: check whether dependency_predecessor after dynamic placement remains the same as the static dependency (exclude bypassOpt)
    print("[2/4]: Checking whether dependency_predecessor after dynamic placement remains the same as the static dependency (DFG)...")
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
    else:
        print("Error!!! The following [opt:pred] pairs have predecessor dependency issues, please check the code")
        print(badOptPred)
    print("----------------------------------------")
    
    # Step3: check whether dependency_successor after dynamic placement remains the same as the static dependency (exclude bypassOpt)
    print("[3/4]: Checking whether dependency_successor after dynamic placement remains the same as the static dependency (DFG)...")
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
    else:
        print("Error!!! The following [opt:succ] pairs have successor dependency issues, please check the code")
        print(badOptSucc)
    print("----------------------------------------")
                        
    # Step4: check whether each curOpt in placement_dynamic and its predecessor satisfy routing availability
    print("[4/4]: Checking whether each curOpt in placement_dynamic and its predecessor satisfy routing availability...")
    badOptPred_dynamic = dict()
    badOptPred_static = dict()
    for IDX_ps in range( len(placement_static) ):
        for idx_ps in range( len(placement_static[IDX_ps]) ):
            opt = placement_static[IDX_ps][idx_ps]
            if opt != 0:
                predecessors = dependency_predecessor[opt]
                for pred in predecessors:
                    optTile = placement_dynamic_dict_Opt2Tile[opt]
                    predTile = placement_dynamic_dict_Opt2Tile[pred]
                    optPC = placement_dynamic_dict_Opt2PC[opt]
                    predPC = placement_dynamic_dict_Opt2PC[pred]
                    xDiff_OptToPred = abs(optTile.x - predTile.x)
                    yDiff_OptToPred = abs(optTile.y - predTile.y)
                    PC_Diff = optPC - predPC
                    if xDiff_OptToPred <= xDiff_Limit and yDiff_OptToPred <= yDiff_Limit and PC_Diff > 0:
                        pass
                    else:                
                        try:
                            badOptPred_dynamic[opt].append(pred)
                        except:
                            badOptPred_dynamic[opt] = pred
    

    for IDX_ps in range( len(placement_dynamic_bypass) ):
        for idx_ps in range( len(placement_dynamic_bypass[IDX_ps]) ):
            opt = placement_dynamic_bypass[IDX_ps][idx_ps]
            if opt != 0:
                predecessors = dependency_predecessor[opt]
                for pred in predecessors:
                    optTile = placement_dynamic_dict_Opt2Tile[opt]
                    predTile = placement_dynamic_dict_Opt2Tile[pred]
                    optPC = placement_dynamic_dict_Opt2PC[opt]
                    predPC = placement_dynamic_dict_Opt2PC[pred]
                    xDiff_OptToPred = abs(optTile.x - predTile.x)
                    yDiff_OptToPred = abs(optTile.y - predTile.y)
                    PC_Diff = optPC - predPC
                    if xDiff_OptToPred <= xDiff_Limit and yDiff_OptToPred <= yDiff_Limit and PC_Diff > 0:
                        pass
                    else:                
                        try:
                            badOptPred_dynamic[opt].append(pred)
                        except:
                            badOptPred_dynamic[opt] = pred
    
    # Extracting inherent errors in static placement results
    # (1) predOpt's PC is smaller than curOpt's PC
    # (2) PC difference between predOpt and curOpt is smaller than the Tile's max coordinates difference
    for IDX_ps in range( len(placement_static) ):
        for idx_ps in range( len(placement_static[IDX_ps]) ):
            opt = placement_static[IDX_ps][idx_ps] 
            predecessors = dependency_predecessor_GT[opt]
            for pred in predecessors:
                optPC = placement_static_Opt2PC[opt]
                predPC = placement_static_Opt2PC[pred]
                optTile = placement_static_Opt2Tile[opt]
                predTile = placement_static_Opt2Tile[pred]
                PC_Diff = optPC - predPC
                x_Diff = abs(optTile.x - predTile.x)
                y_Diff = abs(optTile.y - predTile.y)
                if PC_Diff < 0 or abs(PC_Diff) < max(x_Diff, y_Diff):
                    try:
                        badOptPred_static[opt].append(pred)
                    except:
                        badOptPred_static[opt] = pred
                    
    
    # remove badOptPred_static from badOptPred_dynamic to locate the real issue
    for opt in badOptPred_static:
        try:
            del badOptPred_dynamic[opt]
        except:
            pass
        
    # update the DynamicPlacement_II according to the mapping result
    # supplement the impact of badOptPred_dynamic to DynamicPlacement_II
    global auxilary_additional_cycles, DynamicPlacement_II
    for badOpt in badOptPred_dynamic:
        optList = []
        opt = dependency_predecessor[badOpt]
        while "bypass" in opt:
            optList.append(opt)
            opt = dependency_predecessor[opt]
        badOptPC = placement_static_Opt2PC[badOpt]
        page = badOptPC % StaticPlacement_II
        if len(optList) > auxilary_additional_cycles[page]:
            DynamicPlacement_II += (len(optList) - auxilary_additional_cycles[page])
    
    if len(badOptPred_dynamic) == 0:
        print("Success!")
    else:
        print("Error!!! The following [opt:pred] pairs have topology issues, the corresponding impact have been supplemented to DynamicPlacement_II")
        print(badOptPred_dynamic)
    print("----------------------------------------")
    print("The II of dynamic placement is ", DynamicPlacement_II)  
    print("########################################")
    
def dynamic_placement_kernel():
    global IDX_ps, idx_ps, IDX_pd, IDX_pd_modulo, idx_pd, curOpt, predecessors, DynamicPlacement_II, curOptPotentialPlacement
    IDX_pd += 1 # initial IDX_pd is the next MRRG cycle of predOpt placed MRRG cycle
    initial_IDX_pd = IDX_pd
    for tile in curOptPotentialPlacement:
        # recover some variables if placement not finished
        IDX_pd = initial_IDX_pd
        upperLimit = IDX_pd + DynamicPlacement_II
        finishPlacement = False
        
        # try to finish placement in current tile
        while True:
            # get the modulo of IDX_pd
            IDX_pd_modulo = IDX_pd
            while True: 
                if IDX_pd_modulo - DynamicPlacement_II < 0:
                    break
                IDX_pd_modulo -= DynamicPlacement_II  
            
            # check whether tile under IDX_pd is occupied
            if placement_dynamic_occupy[IDX_pd_modulo][tile.ID] == 0: # not occupied
                idx_pd = allocated_tiles.index(tile)
                if len(predecessors) > 0: 
                    finishPlacement = RoutingAvailability_CheckPredecessor_and_Placement()
                else: 
                    finishPlacement = RoutingAvailability_CheckNothing_and_Placement()  
                if finishPlacement:
                    return True
                
            # move to next IDX_pd
            IDX_pd += 1
            if IDX_pd == upperLimit: # move to next tile
                break
    
    return False

def dynamic_placement():
    global IDX_ps, idx_ps, IDX_pd, idx_pd, curOpt, predecessors, DynamicPlacement_II, curOptPotentialPlacement
    ###################################### Dynamic Placement ############################################
    # each thread needs to go through follow steps
    # perform dynamic placement for the operations of each PC in placement_static
    for IDX_ps in range( len(placement_static) ):
        
        for idx_ps in range( len(placement_static[IDX_ps]) ):
            
            # step 1: obtain new operation and its processors
            curOpt = placement_static[IDX_ps][idx_ps] 
            predecessors.clear()
            IDX_pd = -1
            for pred in dependency_predecessor[curOpt]:
                # update pseduo dependency if pred hasn't been placed, and curOpt and pred is not in the same ring
                if not placement_done[pred]: 
                    if not (curOpt in dependency_predecessor[pred]): 
                        dependency_predecessor[pred].append(curOpt) 
                        dependency_pseudoPredecessor[pred].append(curOpt)
                else:
                    predecessors.append(pred) 
                    if placement_dynamic_dict_Opt2PC[pred] > IDX_pd:
                        IDX_pd = placement_dynamic_dict_Opt2PC[pred]
            
            # generate potential placement Tiles list for curOpt
            CurOptPotentialPlacement_List_Gen()
            
            if not dynamic_placement_kernel():
                # All Tiles have been retrieved and no appropriate placement 
                print("curent II sucks")
                return False
            
    Dependency_ClearPseudo()
    return True

def dynamic_routing():
    global IDX_pd, curOpt
    ###################################### Dynamic Routing ############################################
    # each thread needs to go through follow steps
    for tileID in range(CGRA_size**2):
        
        for IDX_pd in range(maxPCs):
            
            curOpt = placement_dynamic[IDX_pd][tileID]
            
            if curOpt != 0: # if current Tile has a operation mapped in current PC
            
                # step 1: generate opcode according to placement_dynamic
                Opcode_Generation(tileID)
                
                # step 2: generate predecessors' crossbar control signal according to placement_dynamic
                CrossBar_8bitsControlSignal_Predecessors_Generation(tileID) 
                
                # step 3: generate successors' crossbar control signal according to placement_dynamic
                CrossBar_8bitsControlSignal_Successors_Generation(tileID) 
            
                print("----------------------------------------------")
    


test_kernel_names = ["mvt"]
nxn = "4x2" # allocated tiles
for kernel_name in test_kernel_names:

    maxPCs = 50 # the max PC of dynamic placement for current thread
    maxAuxPCs = 8 # the max PC of dynamic placement auxilary for current thread
    bypassPages = 8
    xDiff_Limit = 1 # kingmesh topology
    yDiff_Limit = 1

    xDiff_CurToPred1 = 0 # coordinate difference between the Tile of current opt and its predecessor opt
    yDiff_CurToPred1 = 0
    xDiff_CurToPred2 = 0 # coordinate difference between the Tile of current opt and its predecessor opt
    yDiff_CurToPred2 = 0
    xDiff_PredToPred = 0 # coordinate difference between the Tile of two predecessor opts of current opt
    yDiff_PredToPred = 0
    xDiff_BypassToPred = 0 # coordinate difference between the Tile of bypass opt and the 2nd predecessor of current opt
    yDiff_BypassToPred = 0
    xDiff_BypassSrcToTgt = 0 # coordinate difference between the Tile of srcOpt and tgtOpt in bypass mode
    yDiff_BypassSrcToTgt = 0
    
    dynamic_level = 0
    max_dynamic_level = 0

    IDX_ps = 0
    idx_ps = 0
    IDX_pd = 0
    IDX_pd_modulo = 0
    idx_pd = -1    
    IDX_pd_anchor = 0
    idx_pd_anchor = 0
    IDX_pd_aux = 0
    IDX_pd_bypass = 0
    IDX_pd_bypass_modulo = 0
    high4bits = 0
    low4bits = 0
    bypassOptIdx = 0
    bpsSrcTileIdx = 0
    bpsTgtTileIdx = 0
    srcPC = 0
    tgtPC = 0
    StaticPlacement_II = 7
    DynamicPlacement_II = StaticPlacement_II # initial interval after dynamic placement
    auxilary_page = 0

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
    bypassOpt_usedTiles = []

    curTile = Tile(0, 0, 0)
    curTileStatic = Tile(0, 0, 0)
    srcTile = Tile(0, 0, 0)
    tgtTile = Tile(0, 0, 0)
    predTile1 = Tile(0, 0, 0)
    predTile2 = Tile(0, 0, 0)
    bypassSrcTile = Tile(0, 0, 0)
    bypassTgtTile = Tile(0, 0, 0)

    MSGs = [] # store debug info
    PCs = []
    predecessors = []
    curOptPotentialPlacement = []
    
    placement_static = PlacementStatic_Init(kernel_name)
    placement_static_Opt2Tile = PlacementStatic_Dict_Opt2Tile_Init(kernel_name)
    placement_static_Opt2PC = PlacementStatic_Dict_Opt2PC_Init(kernel_name)
    placement_dynamic = PlacementDynamic_Init()
    placement_dynamic_bypass = PlacementDynamic_Bypass_Init()
    placement_dynamic_auxilary = PlacementDynamicAuxilary_Init() # has static II pages in total
    placement_dynamic_auxilary_util = PlacementDynamicAuxilaryUtil_Init()
    placement_dynamic_occupy = PlacementDynamic_Occupation_Init()
    placement_dynamic_bypass_occupy = PlacementDynamic_Bypass_Occupation_Init()
    auxilary_additional_cycles = []
    placement_dynamic_dict_Opt2Tile = PlacementDynamic_Dict_Opt2Tile_Init()
    placement_dynamic_dict_Opt2PC = PlacementDynamic_Dict_Opt2PC_Init()
    placement_dynamic_dict_Opt2PC_4BpsGen = PlacementDynamic_Dict_Opt2PC_Init()
    xy2Tile = XY2Tile_Init()
    bpsStride = BypassStride_Gen()
    placement_done = PlacementDone_Init(kernel_name)
    local_register_status = LocalRegisterStatus_Init()
    compute_regsiter_status = ComputeRegisterStatus_Init()
    allocated_tiles = AllocatedTile_Init(nxn)
    allocated_tiles_idx = AllocatedTileIdx_Init()
    allocated_tiles_levels_static = AllocatedTile_Level_Static()
    allocated_tiles_levels_dynamic = AllocatedTile_Level_Dynamic(nxn)
    dependency_successor = DependencySuccessor_Init(kernel_name)
    dependency_successor_GT = copy.deepcopy(dependency_successor)
    dependency_predecessor = DependencyPredecessor_Init(kernel_name)    
    dependency_predecessor_GT = copy.deepcopy(dependency_predecessor)
    dependency_pseudoPredecessor = DependencyPseudoPredecessor_Init(kernel_name)
    
    while True:
        if dynamic_placement():
            # dynamic_routing()
            print("Mapping success, II is ", DynamicPlacement_II)
            break
        else:
            DynamicPlacement_II += 1
            
    DynamicPlacement_CorrectnessCheck(kernel_name)
    # dynamic_routing()