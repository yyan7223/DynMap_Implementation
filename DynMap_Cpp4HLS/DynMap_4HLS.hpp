#include <map>
#include <iostream>
#include <cmath>
#include <algorithm>
#include <chrono>
#include <iostream>
#include <fstream>
#include <cstdio>
using namespace std;
using namespace chrono;

// the variable decorated by static will be automatically initialized to 0, 
// which avoids unnecessary initialization operation after converting to RTL by HLS.
// if decorated by const, the variable can be synthesised to ROM by HLS.

/////////// placement recommendation and placement&routing module related variables and functions ///////////
static const char cgra_size = 4;
static const char maxPCs = 100;
static const char maxNodes = 100;
static const char maxPredsNum = 10;
static const char maxSuccsNum = 20;
static const char maxBpsNum1Time = 20;
static const char maxLevelNum = 4;
static const char bypassMaxPages = 8;
static const char kernelNum = 6;
static const char shapeNumPKernel = 12;
static const char shapeTypesNum = 20;
static const char topology = 4; // mesh toplogy, has Links with E S W N four directions
static const char bypassOptStartIdx = 100; // should be larger than the maximum DFG Nodes in the test kernels
static char kernel_idx, shape_idx, curOpt_idx, predOpt_idx;
static char bypassOpt_keyIdx, bypassSrcOpt_keyIdx, bypassTgtOpt_keyIdx;
static char predsNum;
static char predOpt_idx_List[maxPredsNum];
// wrAddr can be used as array write address and the array valid length
static char dependency_predecessor_wrAddr, predecessors_wrAddr, curOptPotentialPlacement_wrAddr, bypassOpt_wrAddr; 
static char intersection_wrAddr;
static char potentialPlacement_wrAddr_List[2];
static char totalNodes, numTiles, RecMII, ResMII;
static char xDiff_Limit = 1; // kingmesh
static char yDiff_Limit = 1;
static char IDX_pd, idx_pd, IDX_pd_modulo, IDX_pd_bypass;
static char xDiff_CurToPred1, yDiff_CurToPred1, xDiff_BypassSrcToTgt, yDiff_BypassSrcToTgt;
static char curOpt, predOpt1;
static char curTile, predTile1;
static char bypassOpt, bypassSrcOpt, bypassTgtOpt;
static char bypassOptIdx;
static char bypassSrcTile, bypassTgtTile;
static bool dependency_forward, dependency_backward;
static char predecessors[maxPredsNum]; // max 2 predecessors
static char dependency_successor_keys[maxNodes]; 
static char dependency_successor_values[maxNodes][maxSuccsNum]; //possible many successors
static char dependency_predecessor_keys[maxNodes]; 
static char dependency_predecessor_values[maxNodes][maxPredsNum]; //possible many predecessors
static char DynamicPlacement_II;
static char curOptPotentialPlacement[cgra_size*cgra_size];
static char threshold;
// static map<char, char> placement_done;
static char placement_done_keys[maxNodes];
static char placement_done_values[maxNodes];
// static map<char, char> placement_dynamic_dict_Opt2PC;
static char placement_dynamic_dict_Opt2PC_keys[maxNodes];
static char placement_dynamic_dict_Opt2PC_values[maxNodes];
static char placement_dynamic_dict_Opt2Tile_keys[maxNodes];
static char placement_dynamic_dict_Opt2Tile_values[maxNodes];
static char placement_static_Opt2Tile_keys[maxNodes];
static char placement_static_Opt2Tile_values[maxNodes];
static char allocated_tiles_levels_dynamic[maxLevelNum][cgra_size*cgra_size];
static char allocated_tiles[cgra_size*cgra_size];
static char placement_static[maxNodes];
static char placement_dynamic[maxPCs][cgra_size*cgra_size]; 
static char placement_dynamic_bypass[bypassMaxPages][maxPCs][cgra_size*cgra_size]; 
static char placement_dynamic_occupy[maxPCs][cgra_size*cgra_size];
static char placement_dynamic_bypass_occupy[maxPCs][cgra_size*cgra_size][topology*topology];
void PlacementDynamic_Record(char);
void Calculate_CurToPred_Distance();
bool CurToPred_Distance_Satisfy_Topology();
void DynamicPlacement_SrcTgtInit_BypassMode(char, char);
void Dependency_Update_BypassMode_SrcTgt();
void Update_BypassSrcInfo();
bool SrcToTgt_Distance_Satisfy_Topology_BypassMode();
char Bypass_XbarIn_Direction(char, char);
char Bypass_XbarOut_Direction(char, char);
bool BypassOptPlacement_Gen_Record();
bool bypassOptGen_and_Placement(char, char);
bool RoutingAvailability_CheckPredecessor_and_Placement();
void CurOptPotentialPlacement_List_LevelInfo_Gen();
void CurOptPotentialPlacement_List_BypassLess_Gen();
bool dynamic_placement_routing();
void Reset();
char calculate_startII();
void record_mappingResults(char, char);
void compare_mappingResults_withPython();
void kernel_shape_idx_generator(char, char);


//////////////////////////////////////////// some huge variables ////////////////////////////////////////////
static char xy2Tile[cgra_size][cgra_size] = {{0, 4, 8, 12},
                        {1, 5, 9, 13},
                        {2, 6, 10, 14},
                        {3, 7, 11, 15}};
static char Tile2XY[cgra_size*cgra_size][2] = {
    {0,0}, // Tile0 
    {1,0}, // Tile1
    {2,0}, // Tile2 
    {3,0}, // Tile3 
    {0,1}, // Tile4 
    {1,1}, // Tile5
    {2,1}, // Tile6 
    {3,1}, // Tile7 
    {0,2}, // Tile8 
    {1,2}, // Tile9
    {2,2}, // Tile10 
    {3,2}, // Tile11
    {0,3}, // Tile12 
    {1,3}, // Tile13
    {2,3}, // Tile14 
    {3,3}, // Tile15
};

static char bpsStride[3][2] = {{1, 1}, // x move 1, y move 1
                        {1, 0}, // x move 1, y remains unchange
                        {0, 1}}; // x remains unchange, y move 1 

static char test_kernels[kernelNum] = {0, 1, 2, 3, 4, 5}; // 0:mvt, 1:fft, 2:dtw, 3:blowfish, 4:spmv, 5:conv

static char test_shapes_keys[kernelNum] = {0, 1, 2, 3, 4, 5}; // 0:mvt, 1:fft, 2:dtw, 3:blowfish, 4:spmv, 5:conv
static char test_shapes_values[shapeTypesNum] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
12, 13, 14, 15, 16, 17, 18, 19};
// 0:12-S, 1:12-IA, 2:12-IB, 3:12-L
// 4:8-IA, 5:8-S, 6:8-IB, 7:8-L
// 8:6-S, 9:6-IA, 10:6-IB, 11:6-L
// 12:5-S, 13:5-IB, 14:5-IA, 15:5-L
// 16:4-S, 17:4-IB, 18:4-IA, 19:4-L

static char DFG_NodesCount_kernels_keys[kernelNum] = {0, 1, 2, 3, 4, 5};
static char DFG_NodesCount_kernels_values[kernelNum] = {42, 42, 32, 31, 21, 17};

static char DFG_Theoretical_RecMII_kernels_keys[kernelNum] = {0, 1, 2, 3, 4, 5};
static char DFG_Theoretical_RecMII_kernels_values[kernelNum] = {4, 4, 4, 4, 4, 4};

static char CGRA_NumTiles_shapes_keys[shapeTypesNum] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
12, 13, 14, 15, 16, 17, 18, 19};
static char CGRA_NumTiles_shapes_values[shapeTypesNum] = {12, 12, 12, 12, 8, 8, 8, 8, 6, 6, 6, 6, 5, 5, 5, 5, 4, 4, 4, 4};

static char placement_static_Tile2Level_keys[cgra_size*cgra_size] = {5, 6, 9, 10, 1, 2, 4, 7, 8, 11, 13, 14, 0, 3, 12, 15};
static char placement_static_Tile2Level_values[cgra_size*cgra_size] = {0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2,};

static char placement_static_kernels_keys[kernelNum] = {0, 1, 2, 3, 4, 5};
static char placement_static_kernels_values[kernelNum][maxNodes] = {
    // mvt
    {0,
    1,
    2,
    3,
    4,
    26,
    39,
    5,
    24,
    27,
    37,
    40,
    6,
    28,
    41,
    7,
    8,
    9,
    10,
    19,
    29,
    32,
    11,
    12,
    13,
    14,
    20,
    30,
    33,
    15,
    21,
    31,
    34,
    16,
    35,
    17,
    36,
    18,
    38,
    22,
    23,
    25},

    // fft
    {0,
    39,
    40,
    41,
    1,
    2,
    17,
    28,
    3,
    18,
    23,
    26,
    29,
    34,
    37,
    4,
    19,
    24,
    30,
    35,
    5,
    9,
    6,
    10,
    21,
    32,
    7,
    11,
    8,
    12,
    14,
    15,
    13,
    16,
    20,
    25,
    31,
    36,
    22,
    27,
    33,
    38},

    // dtw
    {0,
    22,
    29,
    30,
    31,
    1,
    13,
    23,
    2,
    7,
    10,
    14,
    24,
    3,
    8,
    11,
    15,
    25,
    4,
    9,
    12,
    16,
    26,
    5,
    17,
    27,
    6,
    18,
    19,
    20,
    21,
    28},

    // blowfish
    {28,
    29,
    30,
    0,
    3,
    4,
    5,
    27,
    1,
    2,
    6,
    9,
    15,
    21,
    7,
    10,
    16,
    22,
    8,
    11,
    17,
    23,
    12,
    18,
    24,
    13,
    19,
    14,
    20,
    25,
    26},

    // smpv
    {1,
    18,
    19,
    20,
    0,
    2,
    4,
    10,
    17,
    3,
    5,
    11,
    6,
    12,
    7,
    13,
    8,
    14,
    9,
    15,
    16},

    // conv
    {14,
    15,
    16,
    0,
    2,
    3,
    4,
    5,
    6,
    9,
    7,
    10,
    8,
    11,
    12,
    13,
    1},
};

static char allocated_tiles_shapes_keys[shapeTypesNum] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
12, 13, 14, 15, 16, 17, 18, 19};
static char allocated_tiles_shapes_values[shapeTypesNum][cgra_size*cgra_size] = {    
    //12-S 
    {5, 9,
     1, 4, 6, 8, 10, 13,
     0, 2, 12, 14},
    
    //12-IA 
    {6, 10,
     5, 9, 7, 11,  
     2, 3, 4, 8, 14, 15},
    
    //12-IB 
    {9,
     4, 5, 8, 10, 13, 14,  
     0, 1, 11, 12, 15},
    
    //12-L 
    {1, 2, 3, 4, 5, 6, 7, 8, 9, 10,  
     0, 11},
    
    //8-IA 
    {9,
     5, 8,  
     4, 6, 10, 12, 13},
    
    //8-S 
    {4, 5, 8, 9, 
     0, 1, 12, 13},
    
    //8-IB 
    {5, 9,
     0, 1, 4, 10, 13, 14},
    
    //8-L 
    {1, 2, 3, 4, 5, 6,  
     0, 7},
    
    //6-S 
    {9, 13, 
     8, 10, 12, 14},
    
    //6-IA 
    {8, 13, 
     9, 12, 
     4, 14},
    
    //6-IB 
    {9, 14, 
     10, 13, 
     8, 15},
    
    //6-L 
    {1, 2, 3, 4,  
     0, 5},
    
    //5-S 
    {13, 
     8, 9, 12, 
     14},

    //5-IB 
    {13, 
     9, 
     5, 12, 14},
    
    //5-IA 
    {8, 12, 13,  
     4, 14},
    
    //5-L 
    {1, 2, 3,  
     0, 4},
    
    //4-S 
    {8, 9, 12, 13},
    
    //4-IB 
    {12, 13,  
     8, 14},
    
    //4-IA 
    {9, 13,  
     8, 14},
    
    //4-L 
    {1, 2,  
     0, 3},
};

static char allocated_tiles_levels_dynamic_shapes_keys[shapeTypesNum] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
12, 13, 14, 15, 16, 17, 18, 19};
static char allocated_tiles_Maxlevels_dynamic_shapes_values[shapeTypesNum] = {2, 2, 2, 1, 2, 1, 1, 1, 1, 2, 2, 1, 2, 2, 1, 1, 0, 1, 1, 1}; //from 12-S to 4-L
static char allocated_tiles_levelsValidLen_shapes_values[shapeTypesNum][maxLevelNum] = {
    //12-S 
    {2, 6, 4, 0},

    //12-IA 
    {2, 4, 6, 0},

    //12-IB 
    {1, 6, 5, 0},

    //12-L 
    {10, 2, 0, 0},

    //8-IA 
    {1, 2, 5, 0},

    //8-S 
    {4, 4, 0, 0},

    //8-IB 
    {2, 6, 0, 0},

    //8-L 
    {6, 2, 0, 0},

    //6-S 
    {2, 4, 0, 0},

    //6-IA 
    {2, 2, 2, 0},

    //6-IB 
    {2, 2, 2, 0},

    //6-L
    {4, 2, 0, 0},

    //5-S 
    {1, 3, 1, 0},

    //5-IB 
    {1, 1, 3, 0},

    //5-IA 
    {3, 2, 0, 0},

    //5-L 
    {3, 2, 0, 0},

    //4-S 
    {4, 0, 0, 0},

    //4-IB 
    {2, 2, 0, 0},

    //4-IA 
    {2, 2, 0, 0},

    //4-L
    {2, 2, 0, 0},
};
static char allocated_tiles_levels_dynamic_shapes_values[shapeTypesNum][maxLevelNum][cgra_size*cgra_size] = {    
    //12-S 
    {
     {5, 9},
     {1, 4, 6, 8, 10, 13},
     {0, 2, 12, 14},    
    },
    
    //12-IA 
    {
     {6, 10},
     {5, 9, 7, 11},  
     {2, 3, 4, 8, 14, 15},
    },
    
    //12-IB 
    {
     {9},
     {4, 5, 8, 10, 13, 14},  
     {0, 1, 11, 12, 15},
    },
    
    //12-L 
    {
     {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},  
     {0, 11},
    },
    
    //8-IA 
    {
     {9},
     {5, 8},  
     {4, 6, 10, 12, 13},
    },
    
    //8-S 
    {
     {4, 5, 8, 9}, 
     {0, 1, 12, 13}, 
    },
    
    //8-IB 
    {
     {5, 9},
     {0, 1, 4, 10, 13, 14},  
    },
    
    //8-L 
    {
     {1, 2, 3, 4, 5, 6},  
     {0, 7},
    },
    
    //6-S 
    {
     {9, 13}, 
     {8, 10, 12, 14}, 
    },
    
    //6-IA 
    {
     {8, 13}, 
     {9, 12}, 
     {4, 14}, 
    },
    
    //6-IB 
    {
     {9, 14}, 
     {10, 13}, 
     {8, 15}, 
    },
    
    //6-L 
    {
     {1, 2, 3, 4},  
     {0, 5},
    },
    
    //5-S 
    {
     {13}, 
     {8, 9, 12}, 
     {14}, 
    },
    
    //5-IB 
    {
     {13}, 
     {9}, 
     {5, 12, 14}, 
    },
    
    //5-IA 
    {
     {8, 12, 13},  
     {4, 14},
    },
    
    //5-L 
    {
     {1, 2, 3},  
     {0, 4},
    },
    
    //4-S 
    {
     {8, 9, 12, 13}, 
    },
    
    //4-IB 
    {
     {12, 13},  
     {8, 14},
    },
    
    //4-IA 
    {
     {9, 13},  
     {8, 14},
    },
    
    //4-L 
    {
     {1, 2},  
     {0, 3},
    },
};

static char placement_static_Opt2Tile_kernels_keys[kernelNum] = {0, 1, 2, 3, 4, 5};
static char placement_static_Opt2Tile_kernels_values0[kernelNum][maxNodes] = {
    // mvt
    {0,                                     
    1,                                      
    2,                                      
    3,                                      
    4,                                    
    26,                                   
    39,                                    
    5,                                 
    24,                                
    27,                                
    37,                                
    40,                                
    6,                                   
    28,                                  
    41,                                     
    7,                                    
    8,                                    
    9,                                    
    10,                                   
    19,                                  
    29,                                   
    32,                                  
    11,                                  
    12,                                  
    13,                                  
    14,                                  
    20,                          
    30,                                
    33,                          
    15,                          
    21,                           
    31,                                  
    34,                           
    16,                          
    35,                                     
    17,                          
    36,                                     
    18,                          
    38,                                    
    22,                                     
    23,                                     
    25},                                    

    // fft
    {0,                                     
    39,                                    
    40,                                
    41,                                     
    1,                                     
    2,                                
    17,                                   
    28,                                   
    3,                                     
    18,                                
    23,                                
    26,                                
    29,                                
    34,                                
    37,                                
    4,                                     
    19,                                  
    24,                                  
    30,                                  
    35,                                  
    5,                                    
    9,                                    
    6,                                 
    10,                                
    21,                                
    32,                                
    7,                                   
    11,                                  
    8,                                      
    12,                                     
    14,                                     
    15,                                     
    13,                                     
    16,                                     
    20,                                     
    25,                                     
    31,                                     
    36,                                     
    22,                                    
    27,                                    
    33,                                    
    38},                                    

    // dtw
    {0,                                     
    22,                              
    29,                                      
    30,                                  
    31,                                       
    1,                                       
    13,                                      
    23,                                      
    2,                                      
    7,                                      
    10,                                     
    14,                                     
    24,                                      
    3,                                   
    8,                                   
    11,                                  
    15,                                  
    25,                                      
    4,                                     
    9,                                     
    12,                                    
    16,                                    
    26,                                     
    5,                                       
    17,                                  
    27,                                  
    6,                                       
    18,                                     
    19,                                  
    20,                                     
    21,                                     
    28},                                     

    // blowfish
    {28,                                
    29,                                   
    30,                                         
    0,                                         
    3,                                        
    4,                                       
    5,                                           
    27,                                          
    1,                                         
    2,                                         
    6,                                          
    9,                                          
    15,                                         
    21,                                        
    7,                                        
    10,                                        
    16,                                        
    22,                                         
    8,                                       
    11,                                         
    17,                                         
    23,                                       
    12,                                       
    18,                                       
    24,                                      
    13,                                      
    19,                                      
    14,                                        
    20,                                          
    25,                                        
    26},                                        
    
    // spmv
    {1,                                        
    18,                                        
    19,                                    
    20,                                         
    0,                                         
    2,                                        
    4,                                        
    10,                                       
    17,                                        
    3,                                       
    5,                                       
    11,                                      
    6,                                         
    12,                                        
    7,                                        
    13,                                       
    8,                                       
    14,                                      
    9,                                         
    15,                                        
    16},                                        
    
    // conv
    {14,                                       
    15,                                    
    16,                                         
    0,                                         
    2,                                         
    3,                                         
    4,                                        
    5,                                        
    6,                                        
    9,                                        
    7,                                     
    10,                                    
    8,                                       
    11,                                      
    12,                                        
    13,                                        
    1},                                         
};
static char placement_static_Opt2Tile_kernels_values1[kernelNum][maxNodes] = {
    // mvt
    {10,
    9,
    5,
    6,
    10,
    14,
    2,
    9,
    5,
    13,
    10,
    1,
    8,
    12,
    6,
    5,
    4,
    1,
    2,
    8,
    0,
    4,
    14,
    9,
    6,
    1,
    13,
    4,
    12,
    10,
    9,
    5,
    8,
    8,
    4,
    12,
    0,
    13,
    2,
    14,
    13,
    9},

    // fft
    {6,
    10,
    9,
    10,
    9,
    5,
    6,
    13,
    1,
    5,
    4,
    2,
    12,
    8,
    14,
    1,
    1,
    8,
    13,
    12,
    2,
    6,
    2,
    4,
    6,
    5,
    14,
    5,
    13,
    4,
    10,
    1,
    9,
    10,
    12,
    13,
    9,
    8,
    0,
    14,
    14,
    12},

    // dtw
    {9,
    5,
    9,
    5,
    9,
    9,
    8,
    12,
    8,
    12,
    6,
    4,
    13,
    4,
    13,
    10,
    6,
    12,
    6,
    10,
    6,
    10,
    8,
    5,
    6,
    4,
    10,
    9,
    5,
    13,
    8,
    4},

    // blowfish
    {9,
    5,
    9,
    10,
    9,
    5,
    9,
    8,
    9,
    8,
    12,
    13,
    6,
    4,
    13,
    9,
    10,
    12,
    4,
    6,
    5,
    8,
    10,
    6,
    12,
    13,
    10,
    12,
    4,
    8,
    12},

    // spmv
    {9,
    10,
    9,
    10,
    14,
    13,
    12,
    8,
    14,
    14,
    13,
    12,
    8,
    12,
    8,
    13,
    9,
    12,
    13,
    10,
    14},

    // conv
    {10,
    9,
    10,
    14,
    13,
    12,
    14,
    13,
    9,
    8,
    8,
    12,
    9,
    13,
    9,
    13,
    14},
};

static char placement_done_kernels_keys[kernelNum] = {0, 1, 2, 3, 4, 5};

static char dependency_predecessors_kernels_keys[kernelNum] = {0, 1, 2, 3, 4, 5};
static char dependency_predecessors_kernels_values0[kernelNum][maxNodes] = {
    // mvt
    {0,                                             
    1,                                              
    2,                                              
    3,                                              
    4,                                            
    26,                                           
    39,                                            
    5,                                         
    24,                                        
    27,                                        
    37,                                        
    40,                                        
    6,                                           
    28,                                         
    41,                                             
    7,                                            
    8,                                            
    9,                                            
    10,                                           
    19,                                          
    29,                                           
    32,                                          
    11,                                          
    12,                                          
    13,                                          
    14,                                          
    20,                                  
    30,                                        
    33,                                  
    15,                                  
    21,                                   
    31,                                          
    34,                                   
    16,                                  
    35,                                             
    17,                                  
    36,                                             
    18,                                            
    38,                                   
    22,                                             
    23,                                           
    25, },                                             
     
    // fft
    {0 ,                                            
    39 ,                                           
    40 ,                                       
    41 ,                                            
    1 ,                                            
    2 ,                                       
    17 ,                                          
    28 ,                                          
    3 ,                                            
    18 ,                                       
    23 ,                                       
    26 ,                                       
    29 ,                                       
    34 ,                                       
    37 ,                                       
    4 ,                                            
    19 ,                                         
    24 ,                                         
    30 ,                                         
    35 ,                                        
    5 ,                                           
    9 ,                                           
    6 ,                                        
    10 ,                                       
    21 ,                                       
    32 ,                                       
    7 ,                                          
    11 ,                                         
    8 ,                                             
    12 ,                                            
    14 ,                                            
    15 ,                                            
    13 ,                                            
    16 ,                                            
    20 ,                                            
    25 ,                                            
    31 ,                                            
    36,                                         
    22 ,                                         
    27 ,                                          
    33 ,                                         
    38 ,        },                                           
            
    // dtw                                               
    {0,                                             
    22,                                       
    29,                                            
    30,                                        
    31,                                             
    1,                                             
    13,                                            
    23,                                            
    2,                                            
    7,                                            
    10,                                           
    14,                                           
    24,                                            
    3,                                         
    8,                                         
    11,                                        
    15,                                        
    25,                                            
    4,                                           
    9,                                           
    12,                                          
    16,                                          
    26,                                           
    5,                                             
    17,                                        
    27,                                        
    6,                                              
    18,                                           
    19,                                        
    20,                                            
    21,                                         
    28,    },                                            
    
    // blowfish                                            
    {28,                                            
    29,                                       
    30,                                            
    0,                                            
    3,                                           
    4,                                          
    5,                                              
    27,                                             
    1,                                            
    2,                                            
    6,                                             
    9,                                             
    15,                                            
    21,                                           
    7,                                           
    10,                                           
    16,                                           
    22,                                            
    8,                                          
    11,                                            
    17,                                            
    23,                                          
    12,                                          
    18,                                          
    24,                                         
    13,                                         
    19,                                         
    14,                                           
    20,                                             
    25,                                           
    26},                                           
    
    // spmv                                                
    {1 ,                                            
    18 ,                                           
    19 ,                                       
    20 ,                                            
    0 ,                                            
    2 ,                                           
    4 ,                                           
    10 ,                                          
    17 ,                                           
    3 ,                                          
    5 ,                                          
    11 ,                                         
    6 ,                                            
    12 ,                                           
    7 ,                                           
    13 ,                                          
    8 ,                                          
    14 ,                                         
    9 ,                                            
    15 ,                                         
    16 ,  },                                           
    
    // conv                                                 
    {14,                                            
    15,                                        
    16,                                             
    0,                                             
    2,                                             
    3,                                             
    4,                                            
    5,                                            
    6,                                            
    9,                                            
    7,                                         
    10,                                        
    8,                                           
    11,                                          
    12,                                            
    13,                                            
    1},                                             
};
static char dependency_predecessors_kernels_values1[kernelNum][maxNodes][maxPredsNum] = {
    // mvt
    {{39, 41}, 
    {0}, 
    {0}, 
    {0}, 
    {0}, 
    {0}, 
    {0}, 
    {4}, 
    {4}, 
    {26}, 
    {26}, 
    {39}, 
    {5}, 
    {27},  
    {40}, 
    {0, 41}, 
    {1, 41}, 
    {2, 41}, 
    {3, 41}, 
    {41}, 
    {0, 41}, 
    {41}, 
    {7}, 
    {8}, 
    {9}, 
    {10}, 
    {19}, 
    {29}, 
    {32}, 
    {11}, 
    {20}, 
    {30}, 
    {33}, 
    {15, 12}, 
    {31, 34}, 
    {16, 13}, 
    {28, 35}, 
    {17, 14},
    {37}, 
    {18, 21}, 
    {6, 22},
    {24}, },

    // fft
    {{39, 41},
    {0},
    {39, 41},
    {40},
    {0, 41},
    {1},
    {1},
    {1},
    {2, 41},
    {17},
    {17},
    {17},
    {28},
    {28},
    {28},
    {3},
    {18},
    {23},
    {29},
    {34},
    {4},
    {4},
    {5},
    {9},
    {5},
    {9},
    {6},
    {10},
    {7, 41},
    {11, 41},
    {7, 41},
    {11, 41},
    {8, 12},
    {14, 15},
    {19, 13},
    {13, 24},
    {30, 16},
    {16, 35},
    {21},
    {26},
    {32},
    {37},},

    // dtw
    {{29, 31}, 
    {0}, 
    {0}, 
    {29}, 
    {30}, 
    {0, 31}, 
    {0, 31}, 
    {22, 31}, 
    {1}, 
    {1, 31}, 
    {1, 31}, 
    {13, 31}, 
    {23}, 
    {2}, 
    {7}, 
    {10}, 
    {14}, 
    {24}, 
    {3}, 
    {8}, 
    {11}, 
    {15}, 
    {25, 31}, 
    {4, 31}, 
    {9, 12}, 
    {26}, 
    {5}, 
    {17, 9, 12}, 
    {18, 16}, 
    {19, 16, 18}, 
    {20, 6},
    {27}, },

    // blowfish
    {{0},
    {28},
    {29},
    {28, 30},
    {0},
    {3},
    {4, 2},
    {5, 26},
    {27, 30},
    {1, 30},
    {1},
    {1},
    {1},
    {1},
    {6},
    {9},
    {15},
    {21},
    {7},
    {10},
    {16},
    {22},
    {11},
    {17},
    {23},
    {12},
    {18},
    {13, 8},
    {14, 19},
    {20, 24},
    {25}},

    // spmv
    {{18, 20},
    {1},
    {18},
    {19},
    {17, 20},
    {0},
    {0},
    {0},
    {0},
    {2},
    {4},
    {10},
    {5},
    {11},
    {6},
    {12},
    {7},
    {13},
    {8, 3},
    {14, 9},
    {13},},

    // conv
    {{0}, 
    {14}, 
    {15}, 
    {14, 16}, 
    {0}, 
    {0}, 
    {2}, 
    {3}, 
    {4, 5}, 
    {4, 5}, 
    {6}, 
    {9}, 
    {7}, 
    {10}, 
    {11, 8}, 
    {12, 1}, 
    {13, 16}},  
};

static char dependency_successors_kernels_keys[kernelNum] = {0, 1, 2, 3, 4, 5};
static char dependency_successors_kernels_values0[kernelNum][maxNodes] = {
    // mvt
    {0,                                             
    1,                                              
    2,                                              
    3,                                              
    4,                                            
    26,                                           
    39,                                            
    5,                                         
    24,                                        
    27,                                        
    37,                                        
    40,                                        
    6,                                           
    28,                                            
    41,                                             
    7,                                            
    8,                                            
    9,                                            
    10,                                           
    19,                                          
    29,                                           
    32,                                          
    11,                                          
    12,                                          
    13,                                          
    14,                                          
    20,                                  
    30,                                        
    33,                                  
    15,                                  
    21,                                   
    31,                                          
    34,                                   
    16,                                  
    35,                                             
    17,                                  
    36,                                             
    18,                                           
    38,                                 
    22,                                             
    23,                                          
    25,},                                             
     
    // fft
    {0 ,                                            
    39 ,                                           
    40 ,                                       
    41 ,                                            
    1 ,                                            
    2 ,                                       
    17 ,                                          
    28 ,                                          
    3 ,                                            
    18 ,                                       
    23 ,                                       
    26 ,                                       
    29 ,                                       
    34 ,                                       
    37 ,                                       
    4 ,                                            
    19 ,                                         
    24 ,                                           
    30 ,                                         
    35 ,                                          
    5 ,                                           
    9 ,                                           
    6 ,                                        
    10 ,                                       
    21 ,                                       
    32 ,                                       
    7 ,                                          
    11 ,                                         
    8 ,                                             
    12 ,                                            
    14 ,                                            
    15 ,                                            
    13 ,                                            
    16 ,                                            
    20 ,                                            
    25 ,                                            
    31 ,                                            
    36,                                         
    22 ,                                         
    27 ,                                           
    33 ,                                           
    38 , },                                           
            
    // dtw                                               
    {0,                                             
    22,                                       
    29,                                            
    30,                                        
    31,                                             
    1,                                             
    13,                                            
    23,                                            
    2,                                            
    7,                                            
    10,                                           
    14,                                           
    24,                                            
    3,                                         
    8,                                         
    11,                                        
    15,                                        
    25,                                            
    4,                                           
    9,                                           
    12,                                          
    16,                                          
    26,                                           
    5,                                             
    17,                                        
    27,                                        
    6,                                              
    18,                                            
    19,                                        
    20,                                            
    21,                                           
    28, },                                            
    
    // blowfish                                            
    {28,                                            
    29,                                       
    30,                                            
    0,                                            
    3,                                           
    4,                                          
    5,                                              
    27,                                             
    1,                                            
    2,                                            
    6,                                             
    9,                                             
    15,                                            
    21,                                           
    7,                                           
    10,                                           
    16,                                           
    22,                                            
    8,                                          
    11,                                            
    17,                                            
    23,                                          
    12,                                          
    18,                                          
    24,                                         
    13,                                         
    19,                                         
    14,                                           
    20,                                             
    25,                                           
    26},                                           
    
    // spmv                                                
    {1 ,                                            
    18 ,                                           
    19 ,                                       
    20 ,                                            
    0 ,                                            
    2 ,                                           
    4 ,                                           
    10 ,                                          
    17 ,                                           
    3 ,                                          
    5 ,                                          
    11 ,                                         
    6 ,                                            
    12 ,                                           
    7 ,                                           
    13 ,                                          
    8 ,                                          
    14 ,                                           
    9 ,                                            
    15,                                         
    16 , },                                           
    
    // conv                                                 
    {14,                                            
    15,                                        
    16,                                             
    0,                                             
    2,                                             
    3,                                             
    4,                                            
    5,                                            
    6,                                            
    9,                                            
    7,                                         
    10,                                        
    8,                                           
    11,                                          
    12,                                            
    13,                                            
    1},                                             
};
static char dependency_successors_kernels_values1[kernelNum][maxNodes][maxSuccsNum] = {
    // mvt
    {{1, 2, 3, 4, 7, 26, 29, 39}, 
    {8}, 
    {9}, 
    {10}, 
    {5, 24}, 
    {27, 37}, 
    {0, 40}, 
    {6}, 
    {25}, 
    {28}, 
    {38}, 
    {41}, 
    {23}, 
    {36}, 
    {0, 7, 8, 9, 10, 19, 29, 32}, 
    {11}, 
    {12}, 
    {13}, 
    {14}, 
    {20}, 
    {30}, 
    {33}, 
    {15}, 
    {16}, 
    {17}, 
    {18}, 
    {21}, 
    {31}, 
    {34}, 
    {16}, 
    {22}, 
    {35}, 
    {35}, 
    {17}, 
    {36}, 
    {18}, 
    {-1}, //-1 represents N/A
    {22},  
    {-1}, //-1 represents N/A
    {23}, 
    {-1},//-1 represents N/A
    {-1},}, //-1 represents N/A

    // fft
    {{1, 39},
    {0, 40},
    {41},
    {0, 1, 3, 8, 12, 14, 15, 40},
    {2, 17, 28},
    {3},
    {18, 23, 26},
    {29, 34, 37},
    {4},
    {19},
    {24},
    {27},
    {30},
    {35},
    {38},
    {5, 9},
    {20},
    {25},
    {31},
    {36},
    {6, 21},
    {10, 32},
    {7},
    {11},
    {22},
    {33},
    {8, 14},
    {12, 15},
    {13},
    {13},
    {16},
    {16},
    {20, 25},
    {31, 36},
    {-1},
    {-1},
    {-1},
    {-1},
    {-1},
    {-1},
    {-1},
    {-1},},

    // dtw
    {{1, 13, 22, 29}, 
    {23}, 
    {0, 30}, 
    {31}, 
    {0, 1, 5, 7, 10, 13, 14, 23, 26}, 
    {2, 7, 10}, 
    {14}, 
    {24}, 
    {3}, 
    {8}, 
    {11}, 
    {15}, 
    {25}, 
    {4}, 
    {9}, 
    {12}, 
    {16}, 
    {26}, 
    {5}, 
    {17, 18}, 
    {17, 18}, 
    {19, 20}, 
    {27}, 
    {6}, 
    {18}, 
    {28}, 
    {21}, 
    {19, 20}, 
    {20}, 
    {21}, 
    {-1},
    {-1}, },

    //blowfish
    {{0, 29},
    {30},
    {0, 1, 2},
    {3, 28},
    {4},
    {5},
    {27},
    {1},
    {2, 6, 9, 15, 21},
    {5},
    {7},
    {10},
    {16},
    {22},
    {8},
    {11},
    {17},
    {23},
    {14},
    {12},
    {18},
    {24},
    {13},
    {19},
    {25},
    {14},
    {20},
    {20},
    {25},
    {26},
    {27}},

    // spmv
    {{18},
    {1, 19},
    {20},
    {0, 1},
    {2, 4, 10, 17},
    {3},
    {5},
    {11},
    {0},
    {9},
    {6},
    {12},
    {7},
    {13},
    {8},
    {14, 16},
    {9},
    {15},
    {15},
    {-1},
    {-1},},

    // conv
    {{0, 15}, 
    {16}, 
    {0, 1}, 
    {2, 3, 14}, 
    {4}, 
    {5}, 
    {6, 9}, 
    {6, 9}, 
    {7}, 
    {10}, 
    {8}, 
    {11}, 
    {12}, 
    {12}, 
    {13}, 
    {1}, 
    {13}},
};