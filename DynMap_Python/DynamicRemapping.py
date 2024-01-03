# -*- coding: utf-8 -*-
"""
Created on Fri Sep  1 08:53:53 2023

@author: yufei yang 123
"""
from benchmark import placement_static_kernels
from benchmark import placement_done_kernels
from benchmark import dependency_predecessors_kernels
from benchmark import dependency_pseudo_predecessors_kernels
from benchmark import dependency_successors_kernels
import copy

class Tile:
    ID = 0 # Tile ID
    x = 0 # x coordinate
    y = 0 # y coordinate
    def __init__(self, ID, x, y):
        self.ID = ID
        self.x = x
        self.y = y

class CGRA:
    size = 0
    Tiles = []
    def __init__(self, size):
        ID = 0
        for y in range(size):
            for x in range(size):
                self.Tiles.append(Tile(ID, x, y))
                ID += 1

# def Operation_Encoding(): # encode for different operations
#     res = dict()
#     res["add1"] = 1
#     res["cmp"] = 2
#     res["br"] = 3
#     res["phi1"] = 4
#     res["ptr1"] = 5
#     res["ptr2"] = 6
#     res["ld1"] = 7
#     res["ld2"] = 8
#     res["mul"] = 9
#     res["add2"] = 10
#     res["phi2"] = 11
#     res["st"] = 12
#     return res

def PlacementStatic_Init(kernel_name): # static placement result
    res = placement_static_kernels[kernel_name]
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

def AllocatedTile_Init(): # allocated Tile for current thread
    cgra = CGRA(CGRA_size)
    res = [cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], 
            cgra.Tiles[7], cgra.Tiles[6], cgra.Tiles[5], cgra.Tiles[4],
            cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11],
            cgra.Tiles[15], cgra.Tiles[14], cgra.Tiles[13], cgra.Tiles[12]]
    return res

def AllocatedTileIdx_Init(): # the idx of the Tile in allocated Tile List[]
    global allocated_tiles
    res = dict()
    for idx in range( len(allocated_tiles) ):
        res[allocated_tiles[idx].ID] = idx
    return res

def DynamicPlacement_IndexUpdate_NextTile():
    global idx_pd, IDX_pd
    while True:
        if idx_pd == len(allocated_tiles) - 1:
            IDX_pd += 1
            idx_pd = 0
        else:
            IDX_pd = IDX_pd
            idx_pd += 1
        
        tileId = allocated_tiles[idx_pd].ID
        if placement_dynamic[IDX_pd][tileId] == 0:
            break
        
def DynamicPlacement_IndexUpdate_NextTile_BypassMode():
    global bpsSrcTileIdx, bpsTgtTileIdx, IDX_pd, idx_pd
    if bpsSrcTileIdx < bpsTgtTileIdx:
        bpsSrcTileIdx += 1
    else:
        bpsSrcTileIdx -= 1
    idx_pd = bpsSrcTileIdx
    
    while True:
        IDX_pd += 1  
        tileId = allocated_tiles[idx_pd].ID
        if placement_dynamic[IDX_pd][tileId] == 0:
            break

def DynamicPlacement_IndexInit_BypassMode():
    global bypassSrcOpt, bpsSrcTileIdx, IDX_pd, idx_pd, idx_ps
    if idx_ps == 0: # the first operation in a new PC of placement_static
        IDX_pd -= 1 # nullify the set of IDX_pd in DynamicPlacement_IndexUpdate_ResetTile_NextPC()
    else:
        IDX_pd = IDX_pd
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
    global idx_pd, IDX_pd, curOpt
    tileId = allocated_tiles[idx_pd].ID
    try: # for curOpt with multiple predecessors, only keep the placement of curOpt with largest PC
        former_IDX_pd = placement_dynamic_dict_Opt2PC[curOpt]
        former_tileId = placement_dynamic_dict_Opt2Tile[curOpt].ID
        if IDX_pd > former_IDX_pd:
            placement_dynamic[former_IDX_pd][former_tileId] = 0
            placement_dynamic[IDX_pd][tileId] = curOpt
            placement_dynamic_dict_Opt2Tile[curOpt] = allocated_tiles[idx_pd]
            placement_dynamic_dict_Opt2PC[curOpt] = IDX_pd
        else:
            placement_dynamic[IDX_pd][tileId] = 0
    except: # normally record the placement of curOpt
        placement_dynamic[IDX_pd][tileId] = curOpt
        placement_dynamic_dict_Opt2Tile[curOpt] = allocated_tiles[idx_pd]
        placement_dynamic_dict_Opt2PC[curOpt] = IDX_pd
        placement_done[curOpt] = 1

def PlacementDynamic_Record_BypassMode(): # record the dynamic placement of bypass operation
    global bpsSrcTileIdx, IDX_pd, bypassOpt, bypassOptIdx
    tileId = allocated_tiles[bpsSrcTileIdx].ID
    bypassOpt = "bypass" + str(bypassOptIdx)
    bypassOptIdx += 1
    placement_dynamic[IDX_pd][tileId] = bypassOpt
    placement_dynamic_dict_Opt2Tile[bypassOpt] = allocated_tiles[bpsSrcTileIdx]
    placement_dynamic_dict_Opt2PC[bypassOpt] = IDX_pd
    placement_done[bypassOpt] = 1
            
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
    global curOpt, bypassSrcOpt, dependency_forward, dependency_backward
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

def RoutingAvailability_CheckNothing_and_Placement():
    DynamicPlacement_IndexUpdate_NextTile() 
    PlacementDynamic_Record() # Placement with no constraint

def RoutingAvailability_CheckSinglePredecessor_and_Placement():
    global predOpt1, predecessors
    predOpt1 = predecessors[0]
    while True: # find a Tile for current operation to satisfy topology with its predecessor
        DynamicPlacement_IndexUpdate_NextTile() 
        Calculate_CurToPred_Distance()
        if CurToPred_Distance_Satisfy_Topology():
            PlacementDynamic_Record()
            break
        
def RoutingAvailability_CheckDualPredecessor_and_Placement():  
    global predOpt1, predOpt2, predecessors
    DynamicPlacement_IndexRecord()
    predOpt1 = predecessors[0]
    predOpt2 = predecessors[1]
    Calculate_PredToPred_Distance()
    if PredToPred_Distance_Satisfy_Topology(): # topology satisfied, enter non-bypass mode
        while True: # find a Tile for current operation to simultaneously satisfy topology with both two predecessors                 
            DynamicPlacement_IndexUpdate_NextTile() 
            Calculate_CurToPreds_Distance()
            if CurToPreds_Distance_Satisfy_Topology():
                PlacementDynamic_Record()
                break
        
    else: # topology not satisfied, enter bypass mode
        DynamicPlacement_SrcTgtInit_BypassMode(predOpt1, predOpt2) # predOpt1 generate bypass operation to get closer to predOpt2
        DynamicPlacement_IndexInit_BypassMode()
        while True: 
            DynamicPlacement_IndexUpdate_NextTile_BypassMode() # generate the placement for new bypassOpt
            PlacementDynamic_Record_BypassMode() # record the placement
            Dependency_Update_BypassMode_Src() # update the dependency of the generated bypassOpt
            Update_BypassSrcInfo() # switch bypassSrc to the generated bypassOpt
            Caculate_SrcToTgt_Distance_BypassMode() # calculate distance between bypassSrc and bypassTgt
            if SrcToTgt_Distance_Satisfy_Topology_BypassMode(): # check if satisfy topology
                PlacementDynamic_Record() # if toplogy satisfied, overwrite the latest bypassOpt placement with curOpt
                Dependency_Overwrite_BypassMode() # overwrite the latest bypassOpt dependency with curOpt
                DynamicPlacement_IndexRecover()
                break       
        
        
def RoutingAvailability_CheckMultiplePredecessor_and_Placement():  
    global predOpt1, predOpt2, predecessors
    DynamicPlacement_IndexRecord()
    for pred in predecessors[0:-1]: 
        predOpt1 = pred
        predOpt2 = predecessors[-1] 
        Calculate_PredToPred_Distance()
        if PredToPred_Distance_Satisfy_Topology(): # topology satisfied, enter non-bypass mode
            if not placement_done[curOpt]:
                while True: # find a Tile for current operation to simultaneously satisfy topology with both two predecessors                 
                    DynamicPlacement_IndexUpdate_NextTile() 
                    Calculate_CurToPreds_Distance()
                    if CurToPreds_Distance_Satisfy_Topology():
                        PlacementDynamic_Record()
                        break
            else:
                pass
            
        else: # topology not satisfied, enter bypass mode
            DynamicPlacement_SrcTgtInit_BypassMode(predOpt1, predOpt2) # predOpt1 generate bypass operation to get closer to predOpt2
            DynamicPlacement_IndexInit_BypassMode()
            while True: 
                DynamicPlacement_IndexUpdate_NextTile_BypassMode() # generate the placement for new bypassOpt
                PlacementDynamic_Record_BypassMode() # record the placement
                Dependency_Update_BypassMode_Src() # update the dependency of the generated bypassOpt
                Update_BypassSrcInfo() # switch bypassSrc to the generated bypassOpt
                Caculate_SrcToTgt_Distance_BypassMode() # calculate distance between bypassSrc and bypassTgt
                if SrcToTgt_Distance_Satisfy_Topology_BypassMode(): # check if satisfy topology
                    PlacementDynamic_Record() # if toplogy satisfied, overwrite the latest bypassOpt placement with curOpt
                    Dependency_Overwrite_BypassMode() # overwrite the latest bypassOpt dependency with curOpt
                    DynamicPlacement_IndexRecover()
                    break      
    
def bubbleSortPredecessors():
    global predecessors
    for i in range(len(predecessors)-1):    
        for j in range(len(predecessors)-i-1):  
            if placement_dynamic_dict_Opt2Tile[predecessors[j]].ID > placement_dynamic_dict_Opt2Tile[predecessors[j+1]].ID:
                predecessors[j], predecessors[j+1] = predecessors[j+1], predecessors[j]

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
    else:
        print("Error!!! The placement of the operations below may be overwritten, please check the code")
        print(badOpts)
    print("----------------------------------------")
    
    # Step2: check whether dependency_predecessor after dynamic placement remains the same as the static dependency (exclude bypassOpt)
    print("[2/4]: Checking whether dependency_predecessor after dynamic placement remains the same as the static dependency (DFG)...")
    badOptPred = dict()
    for PC in range(maxPCs):
        for opt in placement_dynamic[PC]:
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
    for PC in range(maxPCs):
        for opt in placement_dynamic[PC]:
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
                        
    # Step4: check whether each curOpt in placement_dynamic and its predecessor satisfy topology
    print("[4/4]: Checking whether each curOpt in placement_dynamic and its predecessor satisfy topology...")
    badTopology = dict()
    for PC in range(maxPCs):
        for opt in placement_dynamic[PC]:
            if opt != 0:
                predecessors = dependency_predecessor[opt]
                for pred in predecessors:
                    optTile = placement_dynamic_dict_Opt2Tile[opt]
                    predTile = placement_dynamic_dict_Opt2Tile[pred]
                    xDiff_OptToPred = abs(optTile.x - predTile.x)
                    yDiff_OptToPred = abs(optTile.y - predTile.y)
                    if xDiff_OptToPred <= xDiff_Limit and yDiff_OptToPred <= yDiff_Limit:
                        pass
                    else:                
                        try:
                            badTopology[opt].append(pred)
                        except:
                            badTopology[opt] = pred

    if len(badTopology) == 0:
        print("Success!")
    else:
        print("Error!!! The following [opt:pred] pairs have topology issues, please check the code")
        print(badTopology)
    print("########################################")

def dynamic_placement():
    global IDX_ps, idx_ps, curOpt, predecessors, DynamicPlacement_II
    ###################################### Dynamic Placement ############################################
    # each thread needs to go through follow steps
    # perform dynamic placement for the operations of each PC in placement_static
    for IDX_ps in range( len(placement_static) ):
        
        for idx_ps in range( len(placement_static[IDX_ps]) ):
            
            # step 1: obtain new operation and its processors
            curOpt = placement_static[IDX_ps][idx_ps] 
            predecessors.clear()
            for pred in dependency_predecessor[curOpt]:
                # update pseduo dependency if pred hasn't been placed, and curOpt and pred is not in the same ring
                if not placement_done[pred]: 
                    if not (curOpt in dependency_predecessor[pred]): 
                        dependency_predecessor[pred].append(curOpt) 
                        dependency_pseudoPredecessor[pred].append(curOpt)
                else:
                    predecessors.append(pred) 
            bubbleSortPredecessors() # sort predecessors according to the ID of their placed Tiles (small->large)
            
            # step 2: check routing availability and conduct placement
            if len(predecessors) >= 3: # has three or more predecessors that have finished placement
                RoutingAvailability_CheckMultiplePredecessor_and_Placement()
            elif len(predecessors) == 2: # has two predecessors that have finished placement
                RoutingAvailability_CheckDualPredecessor_and_Placement()
            elif len(predecessors) == 1: # has only one predecessor that have finished placement
                RoutingAvailability_CheckSinglePredecessor_and_Placement()
            else: # has no predecessor that has finished placement
                RoutingAvailability_CheckNothing_and_Placement()  
            
            # step 3: update IDX_pd that are used for accessing placement_dynamic
            if idx_ps == len(placement_static[IDX_ps]) - 1:
                # operations in current IDX_ps has been retrieved, move to next IDX_ps
                # every new IDX_ps must also be corresponding to a new IDX_pd
                DynamicPlacement_IndexUpdate_ResetTile_NextPC() 
    
    # step 4: clear the pseudo dependency after placement
    Dependency_ClearPseudo()
    DynamicPlacement_II = max(placement_dynamic_dict_Opt2PC.values()) + 1

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
for kernel_name in test_kernel_names:
    
    CGRA_size = 4
    maxPCs = 50 # the max PC of dynamic placement result for current thread
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

    IDX_ps = 0
    idx_ps = 0
    IDX_pd = 0
    idx_pd = -1    
    IDX_pd_anchor = 0
    idx_pd_anchor = 0
    high4bits = 0
    low4bits = 0
    bypassOptIdx = 0
    bpsSrcTileIdx = 0
    bpsTgtTileIdx = 0
    srcPC = 0
    tgtPC = 0
    DynamicPlacement_II = 0 # initial interval after dynamic placement

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
    srcTile = Tile(0, 0, 0)
    tgtTile = Tile(0, 0, 0)
    predTile1 = Tile(0, 0, 0)
    predTile2 = Tile(0, 0, 0)
    bypassSrcTile = Tile(0, 0, 0)
    bypassTgtTile = Tile(0, 0, 0)

    MSGs = [] # store debug info
    PCs = []
    predecessors = []
    
    placement_static = PlacementStatic_Init(kernel_name)
    placement_dynamic = PlacementDynamic_Init()
    placement_dynamic_dict_Opt2Tile = PlacementDynamic_Dict_Opt2Tile_Init()
    placement_dynamic_dict_Opt2PC = PlacementDynamic_Dict_Opt2PC_Init()
    placement_done = PlacementDone_Init(kernel_name)
    local_register_status = LocalRegisterStatus_Init()
    compute_regsiter_status = ComputeRegisterStatus_Init()
    allocated_tiles = AllocatedTile_Init()
    allocated_tiles_idx = AllocatedTileIdx_Init()
    dependency_successor = DependencySuccessor_Init(kernel_name)
    dependency_successor_GT = copy.deepcopy(dependency_successor)
    dependency_predecessor = DependencyPredecessor_Init(kernel_name)    
    dependency_predecessor_GT = copy.deepcopy(dependency_predecessor)
    dependency_pseudoPredecessor = DependencyPseudoPredecessor_Init(kernel_name)
    
    dynamic_placement()
    DynamicPlacement_CorrectnessCheck(kernel_name)
    # dynamic_routing()







