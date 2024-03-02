#include <map>
#include <vector>
#include <iostream>
#include <cmath>
#include <algorithm>
#include <string>
#include <cstring>
#include <chrono>
#include <iostream>
#include <fstream>
using namespace std;
using namespace chrono;

//////////////////////////////////////////// some common classes ////////////////////////////////////////////
class Tile{
    public:
        int ID;   
        int X;  
        int Y; 
        Tile(){};
        Tile(int id, int x, int y){
            ID = id;
            X = x;
            Y = y;
        }
        bool operator ==(const Tile& t)
        {
            return (this->ID == t.ID) && (this->X == t.X) && (this->Y == t.Y);
        }
};

class CGRA{
    public:
        int size;
        vector<Tile> Tiles;
        CGRA(){};
        CGRA(int size){
            size = size;
            int ID = 0;
            for(int i = 0; i < size; i++){
                for(int j = 0; j < size; j++){
                    Tiles.push_back(Tile(ID, j, i));
                    ID++;
                }
            }
        }
};

// the variable decorated by "static" will be automatically initialized to 0, 
// which avoids unnecessary initialization operation after converting to RTL by HLS.
// if decorated by "const", the variable can be synthesised to ROM by HLS.

/////////// placement recommendation and placement&routing module related variables and functions ///////////
static const int cgra_size = 4; // square
static const int maxPCs = 100;
static const int bypassMaxPages = 8;
static string architecture;
static int totalNodes, numTiles, RecMII, ResMII;
static CGRA cgra(cgra_size);
static int xDiff_Limit = 1; // kingmesh
static int yDiff_Limit = 1;
static int IDX_pd, idx_pd, IDX_pd_modulo, IDX_pd_bypass;
static int xDiff_CurToPred1, yDiff_CurToPred1, xDiff_BypassSrcToTgt, yDiff_BypassSrcToTgt;
static string curOpt, predOpt1;
static Tile curTile, predTile1;
static string bypassOpt, bypassSrcOpt, bypassTgtOpt;
static int bypassOptIdx;
static Tile bypassSrcTile, bypassTgtTile;
static bool dependency_forward, dependency_backward;
static vector<string> predecessors;
static map<string, vector<string>> dependency_successor;
static map<string, vector<string>> dependency_predecessor;
static int DynamicPlacement_II;
static vector<Tile> curOptPotentialPlacement;
static int threshold;
static map<string, int> placement_done;
static map<string, int> placement_dynamic_dict_Opt2PC;
static map<string, Tile> placement_dynamic_dict_Opt2Tile;
static map<string, Tile> placement_static_Opt2Tile;
static vector<vector<Tile>> allocated_tiles_levels_dynamic;
static vector<Tile> allocated_tiles;
static vector<string> placement_static;
static string placement_dynamic[maxPCs][cgra_size*cgra_size]; 
static string placement_dynamic_bypass[bypassMaxPages][maxPCs][cgra_size*cgra_size]; 
static int placement_dynamic_occupy[maxPCs][cgra_size*cgra_size];
static int placement_dynamic_bypass_occupy[maxPCs][cgra_size*cgra_size][16];
void PlacementDynamic_Record(Tile);
void Calculate_CurToPred_Distance();
bool CurToPred_Distance_Satisfy_Topology();
void DynamicPlacement_SrcTgtInit_BypassMode(string, string);
void Dependency_Update_BypassMode_SrcTgt();
void Update_BypassSrcInfo();
bool SrcToTgt_Distance_Satisfy_Topology_BypassMode();
int Bypass_XbarIn_Direction(int, int);
int Bypass_XbarOut_Direction(int, int);
bool BypassOptPlacement_Gen_Record();
bool bypassOptGen_and_Placement(string, string);
bool RoutingAvailability_CheckPredecessor_and_Placement();
void CurOptPotentialPlacement_List_PartialInherit_Gen();
void CurOptPotentialPlacement_List_PartialInherit_BypassLess_Gen();
bool dynamic_placement_routing();
void Reset(string, string);
int calculate_startII(string, string);
void record_mappingResults(string, string);
void compare_mappingResults_withPython();
vector<vector<Tile>> generate_allocated_tiles_levels_dynamic(vector<Tile>, map<int, vector<Tile>>, vector<float>);
void analyze_static_levels_distribution(string);

////////////////////// cofiguration generation module related variables and functions ///////////////////////
static const int LocalRegNum = 16;
static const int ComputeRegNum = 2;
static string opcode;
static string srcOpt, tgtOpt;
static Tile srcTile, tgtTile;
static int local_register_status[maxPCs][cgra_size*cgra_size][LocalRegNum];
static int compute_register_status[maxPCs][cgra_size*cgra_size][ComputeRegNum];
void opcode_generation(int);
int CrossbarInIdx_Generation_FromWhichLocalReg(int);
int CrossbarOutIdx_Generation_ToWhichLocalReg(int, int);
int CrossbarInIdx_Generation_FromWhichFuncUnitOutput();
int CrossbarOutIdx_Generation_ToWhichFuncUnitInput(int, int);
int CrossbarInIdx_Generation_FromWhichDirectionTile();
int CrossbarOutIdx_Generation_ToWhichRouteReg();
int CrossBar_Type1_ControlSignal_Generation(int, int);
void CrossBar_Type2_ControlSignal_Generation(int, int);
void CrossBar_Type3_ControlSignal_Generation(int, int);
void CrossBar_Type4_ControlSignal_Generation(int, int, int, int);
void CrossBar_Type5_ControlSignal_Generation(int, int, int, int);
void CrossBar_Type6_ControlSignal_Generation(int, int, int, int);
void CrossBar_Type8_ControlSignal_Generation(int, int);
void CrossBar_Type9_ControlSignal_Generation(int, int);
void crossbar_8bitsControlSignal_predecessors_generation(int);
void crossbar_8bitsControlSignal_successors_generation(int);
void configuration_generation();
 

//////////////////////////////////////////// some huge variables ////////////////////////////////////////////
Tile xy2Tile[4][4] = {{cgra.Tiles[0], cgra.Tiles[4], cgra.Tiles[8], cgra.Tiles[12]},
                        {cgra.Tiles[1], cgra.Tiles[5], cgra.Tiles[9], cgra.Tiles[13]},
                        {cgra.Tiles[2], cgra.Tiles[6], cgra.Tiles[10], cgra.Tiles[14]},
                        {cgra.Tiles[3], cgra.Tiles[7], cgra.Tiles[11], cgra.Tiles[15]}};

static map<string, vector<vector<int>>> bpsStride_architecture = {
    {"OpenCGRA", {{1, 1}, // x move 1, y move 1
                  {1, 0}, // x move 1, y remains unchange
                  {0, 1}}}, // x remains unchange, y move 1 
    {"MorphoSys", {{1, 0},{0, 1}}},
    {"HReA", {{1, 1},{1, 0},{0, 1}}},
    // HyCube does not need bypass operation
};

static vector<string> test_kernels = {"mvt", "fft", "dtw", "blowfish", "spmv", "conv"};

static map<string, vector<string>> test_shapes = {
    {"mvt", {"12-S","12-IA","12-IB","12-L","8-IA","8-S","8-IB","8-L","4-S","4-IB","4-IA","4-L"}},
    {"fft", {"12-S","12-IA","12-IB","12-L","8-IA","8-S","8-IB","8-L","4-S","4-IB","4-IA","4-L"}},
    {"dtw", {"8-IA","8-S","8-IB","8-L","6-S","6-IA","6-IB","6-L","4-S","4-IB","4-IA","4-L"}},
    {"blowfish", {"8-IA","8-S","8-IB","8-L","6-S","6-IA","6-IB","6-L","4-S","4-IB","4-IA","4-L"}},
    {"spmv", {"6-S","6-IA","6-IB","6-L","5-S","5-IB","5-IA","5-L","4-S","4-IB","4-IA","4-L"}},
    {"conv", {"6-S","6-IA","6-IB","6-L","5-S","5-IB","5-IA","5-L","4-S","4-IB","4-IA","4-L"}},
};

static map<string, map<string, vector<float>>> eachLevelUsedNumTiles_static_kernels_architecture = {
    {"OpenCGRA",{{"mvt", {4.0f, 6.0f, 2.0f, 12.0f}}, // {kernel, {Level0, Level1, Level2，total} used Tiles in static mapping results under 4x4 CGRA}
                 {"fft", {4.0f, 6.0f, 2.0f, 12.0f}},
                 {"dtw", {4.0f, 3.0f, 1.0f, 8.0f}},
                 {"blowfish", {4.0f, 3.0f, 1.0f, 8.0f}},
                 {"spmv", {2.0f, 3.0f, 1.0f, 6.0f}},
                 {"conv", {2.0f, 3.0f, 1.0f, 6.0f}}}},
    // MorphoSys
    // HReA
    // HyCube
};

static map<string, int> DFG_NodesCount_kernels = {
    // mvt
    {"mvt", 42},
    
    // fft
    {"fft", 42},
    
    // dtw
    {"dtw", 32},
    
    // blowfish
    {"blowfish", 31},
    
    // spmv
    {"spmv", 21},
    
    // conv
    {"conv", 17},
    
};

static map<string, int> DFG_Theoretical_RecMII_kernels = {
    // mvt
    {"mvt", 4},
    
    // fft
    {"fft", 4},
    
    // dtw
    {"dtw", 4},
    
    // blowfish
    {"blowfish", 4},
    
    // spmv
    {"spmv", 4},
    
    // conv
    {"conv", 4},
    
};

static map<string, int> CGRA_NumTiles = {
    {"12-S", 12},
    {"12-L", 12},
    {"12-IA", 12},
    {"12-IB", 12},
    {"8-S", 8},
    {"8-L", 8},
    {"8-IA", 8},
    {"8-IB", 8},
    {"6-S", 6},
    {"6-L", 6},
    {"6-IA", 6},
    {"6-IB", 6},
    {"5-S", 5},
    {"5-L", 5},
    {"5-IA", 5},
    {"5-IB", 5},
    {"4-S", 4},
    {"4-L", 4},
    {"4-IA", 4},
    {"4-IB", 4},
};

static map<string, int> static_max_levels_architecture = { // total levels of 4x4 CGRA in given topology
    {"OpenCGRA", 3},
    {"MorphoSys", 1},
    {"HReA", 3},
    {"HyCube", 1},
};

static map<string, map<int, int>> placement_static_Tile2Level_architecture = {
    {"OpenCGRA", {{5, 0}, // Tile 5,6,9,10, level 0
                  {6, 0},
                  {9, 0},
                  {10, 0},
                  {1, 1}, // Tile 1,2,4,7,8,11,13,14, level 1
                  {2, 1},
                  {4, 1},
                  {7, 1},
                  {8, 1}, 
                  {11, 1},
                  {13, 1},
                  {14, 1},
                  {0, 2}, // Tile 0,3,12,15, level 2
                  {3, 2},
                  {12, 2},
                  {15, 2}}},
    {"MorphoSys", {{5, 0}, // All Tiles have 6 Links
                   {6, 0},
                   {9, 0},
                   {10, 0},
                   {1, 0}, 
                   {2, 0},
                   {4, 0},
                   {7, 0},
                   {8, 0}, 
                   {11, 0},
                   {13, 0},
                   {14, 0},
                   {0, 0}, 
                   {3, 0},
                   {12, 0},
                   {15, 0}}},
    {"HReA", {{5, 0}, // Tile 5,6,9,10, level 0
              {6, 0},
              {9, 0},
              {10, 0},
              {1, 1}, // Tile 1,2,4,7,8,11,13,14, level 1
              {2, 1},
              {4, 1},
              {7, 1},
              {8, 1}, 
              {11, 1},
              {13, 1},
              {14, 1},
              {0, 2}, // Tile 0,3,12,15, level 2
              {3, 2},
              {12, 2},
              {15, 2}}},
    {"HyCube", {{5, 0}, // All Tiles can communicate within 1 cycle
                {6, 0},
                {9, 0},
                {10, 0},
                {1, 0}, 
                {2, 0},
                {4, 0},
                {7, 0},
                {8, 0}, 
                {11, 0},
                {13, 0},
                {14, 0},
                {0, 0}, 
                {3, 0},
                {12, 0},
                {15, 0}}},
};

static map<string, map<int, vector<Tile>>> topology_architecture = {
    {"OpenCGRA", {{0, {cgra.Tiles[1], cgra.Tiles[4], cgra.Tiles[5]}}, // {Tile.ID, {List of Tiles connected to this Tile under current topology}}
                  {1, {cgra.Tiles[0], cgra.Tiles[2], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6]}},
                  {2, {cgra.Tiles[1], cgra.Tiles[3], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7]}},
                  {3, {cgra.Tiles[2], cgra.Tiles[6], cgra.Tiles[7]}},
                  {4, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[5], cgra.Tiles[8], cgra.Tiles[9]}},
                  {5, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[4], cgra.Tiles[6], cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10]}},
                  {6, {cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[5], cgra.Tiles[7], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11]}},
                  {7, {cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[6], cgra.Tiles[10], cgra.Tiles[11]}},
                  {8, {cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[9], cgra.Tiles[12], cgra.Tiles[13]}},
                  {9, {cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[8], cgra.Tiles[10], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[14]}},
                  {10, {cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], cgra.Tiles[9], cgra.Tiles[11], cgra.Tiles[13], cgra.Tiles[14], cgra.Tiles[15]}},
                  {11, {cgra.Tiles[6], cgra.Tiles[7], cgra.Tiles[10], cgra.Tiles[14], cgra.Tiles[15]}},
                  {12, {cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[13]}},
                  {13, {cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[12], cgra.Tiles[14]}},
                  {14, {cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[13], cgra.Tiles[15]}},
                  {15, {cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[14]}}}}, 
    {"MorphoSys", {{0, {cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[8], cgra.Tiles[12]}}, // {Tile.ID, {List of Tiles connected to this Tile under current topology}}
                   {1, {cgra.Tiles[0], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[5], cgra.Tiles[9], cgra.Tiles[13]}},
                   {2, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[3], cgra.Tiles[6], cgra.Tiles[10], cgra.Tiles[14]}},
                   {3, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[7], cgra.Tiles[11], cgra.Tiles[15]}},
                   {4, {cgra.Tiles[0], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], cgra.Tiles[8], cgra.Tiles[12]}},
                   {5, {cgra.Tiles[1], cgra.Tiles[4], cgra.Tiles[6], cgra.Tiles[7], cgra.Tiles[9], cgra.Tiles[13]}},
                   {6, {cgra.Tiles[2], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[7], cgra.Tiles[10], cgra.Tiles[14]}},
                   {7, {cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[11], cgra.Tiles[15]}},
                   {8, {cgra.Tiles[0], cgra.Tiles[4], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12]}},
                   {9, {cgra.Tiles[1], cgra.Tiles[5], cgra.Tiles[8], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[13]}},
                   {10, {cgra.Tiles[2], cgra.Tiles[6], cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[11], cgra.Tiles[14]}},
                   {11, {cgra.Tiles[3], cgra.Tiles[7], cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[15]}},
                   {12, {cgra.Tiles[0], cgra.Tiles[4], cgra.Tiles[8], cgra.Tiles[13], cgra.Tiles[14], cgra.Tiles[15]}},
                   {13, {cgra.Tiles[1], cgra.Tiles[5], cgra.Tiles[9], cgra.Tiles[12], cgra.Tiles[14], cgra.Tiles[15]}},
                   {14, {cgra.Tiles[2], cgra.Tiles[6], cgra.Tiles[10], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[15]}},
                   {15, {cgra.Tiles[3], cgra.Tiles[7], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[14]}}}},
    {"HReA", {{0, {cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[8], cgra.Tiles[12]}},
              {1, {cgra.Tiles[0], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[9], cgra.Tiles[13]}},
              {2, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[3], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], cgra.Tiles[10], cgra.Tiles[14]}},
              {3, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[6], cgra.Tiles[7], cgra.Tiles[11], cgra.Tiles[15]}},
              {4, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[12]}},
              {5, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[4], cgra.Tiles[6], cgra.Tiles[7], cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[13]}},
              {6, {cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[7], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[14]}},
              {7, {cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[15]}},
              {8, {cgra.Tiles[0], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13]}},
              {9, {cgra.Tiles[1], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[8], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[14]}},
              {10, {cgra.Tiles[2], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[11], cgra.Tiles[13], cgra.Tiles[14], cgra.Tiles[15]}},
              {11, {cgra.Tiles[3], cgra.Tiles[6], cgra.Tiles[7], cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[14], cgra.Tiles[15]}},
              {12, {cgra.Tiles[0], cgra.Tiles[4], cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[13], cgra.Tiles[14], cgra.Tiles[15]}},
              {13, {cgra.Tiles[1], cgra.Tiles[5], cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[12], cgra.Tiles[14], cgra.Tiles[15]}},
              {14, {cgra.Tiles[2], cgra.Tiles[6], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[15]}},
              {15, {cgra.Tiles[3], cgra.Tiles[7], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[14]}}}},
    {"HyCube", {{0, {cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], 
                    cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[14], cgra.Tiles[15]}},
                {1, {cgra.Tiles[0], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], 
                    cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[14], cgra.Tiles[15]}},
                {2, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], 
                    cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[14], cgra.Tiles[15]}},
                {3, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], 
                    cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[14], cgra.Tiles[15]}},
                {4, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], 
                    cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[14], cgra.Tiles[15]}},
                {5, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[6], cgra.Tiles[7], 
                    cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[14], cgra.Tiles[15]}},
                {6, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[7], 
                    cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[14], cgra.Tiles[15]}},
                {7, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6],
                    cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[14], cgra.Tiles[15]}},
                {8, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], 
                    cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[14], cgra.Tiles[15]}},
                {9, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], 
                    cgra.Tiles[8], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[14], cgra.Tiles[15]}},
                {10, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], 
                    cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[14], cgra.Tiles[15]}},
                {11, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], 
                    cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[14], cgra.Tiles[15]}},
                {12, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], 
                    cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[13], cgra.Tiles[14], cgra.Tiles[15]}},
                {13, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], 
                    cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[14], cgra.Tiles[15]}},
                {14, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], 
                    cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13],  cgra.Tiles[15]}},
                {15, {cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], 
                    cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[13], cgra.Tiles[14]}}}},
};

static map<string, vector<string>> placement_static_kernels = {
    // mvt
    {"mvt",
        {"fcmp0",
        "and1",
        "and2",
        "and3",
        "store4",
        "store26",
        "fneg39",
        "inttoptr5",
        "inttoptr24",
        "inttoptr27",
        "inttoptr37",
        "catchpad40",
        "alloca6",
        "alloca28",
        "ret41",
        "store7",
        "store8",
        "store9",
        "store10",
        "alloca19",
        "store29",
        "alloca32",
        "alloca11",
        "alloca12",
        "alloca13",
        "alloca14",
        "extractelement20",
        "inttoptr30",
        "extractelement33",
        "extractelement15",
        "insertelement21",
        "alloca31",
        "insertelement34",
        "extractelement16",
        "mul35",
        "extractelement17",
        "add36",
        "extractelement18",
        "load38",
        "mul22",
        "add23",
        "load25"}
    },
    
    // fft
    {"fft",
        {"fcmp0",
        "fneg39",
        "catchpad40",
        "ret41",
        "fneg1",
        "atomicrmw2",
        "store17",
        "store28",
        "fneg3",
        "inttoptr18",
        "inttoptr23",
        "inttoptr26",
        "inttoptr29",
        "inttoptr34",
        "inttoptr37",
        "zext4",
        "alloca19",
        "alloca24",
        "alloca30",
        "alloca35",
        "store5",
        "store9",
        "inttoptr6",
        "inttoptr10",
        "inttoptr21",
        "inttoptr32",
        "alloca7",
        "alloca11",
        "mul8",
        "mul12",
        "mul14",
        "mul15",
        "sub13",
        "add16",
        "sub20",
        "add25",
        "sub31",
        "add36",
        "load22",
        "load27",
        "load33",
        "load38"}
    },
    
    // dtw
    {"dtw",
        {"fcmp0",
        "atomicrmw22",
        "fneg29",
        "catchpad30",
        "ret31",
        "fneg1",
        "fneg13",
        "fneg23",
        "store2",
        "store7",
        "store10",
        "store14",
        "fneg24",
        "inttoptr3",
        "inttoptr8",
        "inttoptr11",
        "inttoptr15",
        "zext25",
        "alloca4",
        "alloca9",
        "alloca12",
        "alloca16",
        "store26",
        "fadd5",
        "catchpad17",
        "inttoptr27",
        "phi6",
        "call18",
        "catchpad19",
        "call20",
        "fneg21",
        "load28"}
    },
    
    // blowfish
    {"blowfish",
        {"fneg28",
        "catchpad29",
        "ret30",
        "fcmp0",
        "store3",
        "alloca4",
        "or5",
        "or27",
        "fcmp1",
        "fcmp2",
        "shl6",
        "shl9",
        "shl15",
        "ashr21",
        "store7",
        "ashr10",
        "ashr16",
        "and22",
        "alloca8",
        "and11",
        "and17",
        "store23",
        "store12",
        "store18",
        "alloca24",
        "alloca13",
        "alloca19",
        "fneg14",
        "or20",
        "fneg25",
        "ashr26"}
    },
    
    // spmv
    {"spmv",
        {"fcmp1",
        "fneg18",
        "catchpad19",
        "ret20",
        "fcmp0",
        "store2",
        "store4",
        "store10",
        "fneg17",
        "alloca3",
        "alloca5",
        "alloca11",
        "zext6",
        "zext12",
        "store7",
        "store13",
        "alloca8",
        "alloca14",
        "fsub9",
        "fneg15",
        "load16"}
    },
    
    // conv
    {"conv",
        {"fneg14",
        "catchpad15",
        "ret16",
        "fcmp0",
        "fmul2",
        "fdiv3",
        "trunc4",
        "trunc5",
        "store6",
        "store9",
        "inttoptr7",
        "inttoptr10",
        "alloca8",
        "alloca11",
        "fsub12",
        "fneg13",
        "fcmp1"}
    },
    
};

static map<string, vector<Tile>> allocated_tiles_shapes = {    
    {"12-S", 
    {cgra.Tiles[5], cgra.Tiles[9],
     cgra.Tiles[1], cgra.Tiles[4], cgra.Tiles[6], cgra.Tiles[8], cgra.Tiles[10], cgra.Tiles[13],
     cgra.Tiles[0], cgra.Tiles[2], cgra.Tiles[12], cgra.Tiles[14]}},
    
    {"12-IA", 
    {cgra.Tiles[6], cgra.Tiles[10],
     cgra.Tiles[5], cgra.Tiles[9], cgra.Tiles[7], cgra.Tiles[11],  
     cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[8], cgra.Tiles[14], cgra.Tiles[15]}},
    
    {"12-IB", 
    {cgra.Tiles[9],
     cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[8], cgra.Tiles[10], cgra.Tiles[13], cgra.Tiles[14],  
     cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[11], cgra.Tiles[12], cgra.Tiles[15]}},
    
    {"12-L", 
    {cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6], cgra.Tiles[7], cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[10],  
     cgra.Tiles[0], cgra.Tiles[11]}},
    
    {"8-IA", 
    {cgra.Tiles[9],
     cgra.Tiles[5], cgra.Tiles[8],  
     cgra.Tiles[4], cgra.Tiles[6], cgra.Tiles[10], cgra.Tiles[12], cgra.Tiles[13]}},
    
    {"8-S", 
    {cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[8], cgra.Tiles[9], 
     cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[12], cgra.Tiles[13]}},
    
    {"8-IB", 
    {cgra.Tiles[5], cgra.Tiles[9],
     cgra.Tiles[0], cgra.Tiles[1], cgra.Tiles[4], cgra.Tiles[10], cgra.Tiles[13], cgra.Tiles[14]}},
    
    {"8-L", 
    {cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4], cgra.Tiles[5], cgra.Tiles[6],  
     cgra.Tiles[0], cgra.Tiles[7]}},
    
    {"6-S", 
    {cgra.Tiles[9], cgra.Tiles[13], 
     cgra.Tiles[8], cgra.Tiles[10], cgra.Tiles[12], cgra.Tiles[14]}},
    
    {"6-IA", 
    {cgra.Tiles[8], cgra.Tiles[13], 
     cgra.Tiles[9], cgra.Tiles[12], 
     cgra.Tiles[4], cgra.Tiles[14]}},
    
    {"6-IB", 
    {cgra.Tiles[9], cgra.Tiles[14], 
     cgra.Tiles[10], cgra.Tiles[13], 
     cgra.Tiles[8], cgra.Tiles[15]}},
    
    {"6-L", 
    {cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3], cgra.Tiles[4],  
     cgra.Tiles[0], cgra.Tiles[5]}},
    
    {"5-S", 
    {cgra.Tiles[13], 
     cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[12], 
     cgra.Tiles[14]}},

    {"5-IB", 
    {cgra.Tiles[13], 
     cgra.Tiles[9], 
     cgra.Tiles[5], cgra.Tiles[12], cgra.Tiles[14]}},
    
    {"5-IA", 
    {cgra.Tiles[8], cgra.Tiles[12], cgra.Tiles[13],  
     cgra.Tiles[4], cgra.Tiles[14]}},
    
    {"5-L", 
    {cgra.Tiles[1], cgra.Tiles[2], cgra.Tiles[3],  
     cgra.Tiles[0], cgra.Tiles[4]}},
    
    {"4-S", 
    {cgra.Tiles[8], cgra.Tiles[9], cgra.Tiles[12], cgra.Tiles[13]}},
    
    {"4-IB", 
    {cgra.Tiles[12], cgra.Tiles[13],  
     cgra.Tiles[8], cgra.Tiles[14]}},
    
    {"4-IA", 
    {cgra.Tiles[9], cgra.Tiles[13],  
     cgra.Tiles[8], cgra.Tiles[14]}},
    
    {"4-L", 
    {cgra.Tiles[1], cgra.Tiles[2],  
     cgra.Tiles[0], cgra.Tiles[3]}},
};

static map<string, map<string, map<string, Tile>>> placement_static_Opt2Tile_kernels_architecture = {
    {"OpenCGRA", {
                // mvt
                {"mvt",{{"fcmp0",cgra.Tiles[10]},
                        {"and1",cgra.Tiles[9]},
                        {"and2",cgra.Tiles[5]},
                        {"and3",cgra.Tiles[6]},
                        {"store4",cgra.Tiles[10]},
                        {"store26",cgra.Tiles[14]},
                        {"fneg39",cgra.Tiles[2]},
                        {"inttoptr5",cgra.Tiles[9]},
                        {"inttoptr24",cgra.Tiles[5]},
                        {"inttoptr27",cgra.Tiles[13]},
                        {"inttoptr37",cgra.Tiles[10]},
                        {"catchpad40",cgra.Tiles[1]},
                        {"alloca6",cgra.Tiles[8]},
                        {"alloca28",cgra.Tiles[12]},
                        {"ret41",cgra.Tiles[6]},
                        {"store7",cgra.Tiles[5]},
                        {"store8",cgra.Tiles[4]},
                        {"store9",cgra.Tiles[1]},
                        {"store10",cgra.Tiles[2]},
                        {"alloca19",cgra.Tiles[8]},
                        {"store29",cgra.Tiles[0]},
                        {"alloca32",cgra.Tiles[4]},
                        {"alloca11",cgra.Tiles[14]},
                        {"alloca12",cgra.Tiles[9]},
                        {"alloca13",cgra.Tiles[6]},
                        {"alloca14",cgra.Tiles[1]},
                        {"extractelement20",cgra.Tiles[13]},
                        {"inttoptr30",cgra.Tiles[4]},
                        {"extractelement33",cgra.Tiles[12]},
                        {"extractelement15",cgra.Tiles[10]},
                        {"insertelement21",cgra.Tiles[9]},
                        {"alloca31",cgra.Tiles[5]},
                        {"insertelement34",cgra.Tiles[8]},
                        {"extractelement16",cgra.Tiles[8]},
                        {"mul35",cgra.Tiles[4]},
                        {"extractelement17",cgra.Tiles[12]},
                        {"add36",cgra.Tiles[0]},
                        {"extractelement18",cgra.Tiles[13]},
                        {"load38",cgra.Tiles[2]},
                        {"mul22",cgra.Tiles[14]},
                        {"add23",cgra.Tiles[13]},
                        {"load25",cgra.Tiles[9]}}},
                
                // fft
                {"fft",{{"fcmp0",cgra.Tiles[6]},
                        {"fneg39",cgra.Tiles[10]},
                        {"catchpad40",cgra.Tiles[9]},
                        {"ret41",cgra.Tiles[10]},
                        {"fneg1",cgra.Tiles[9]},
                        {"atomicrmw2",cgra.Tiles[5]},
                        {"store17",cgra.Tiles[6]},
                        {"store28",cgra.Tiles[13]},
                        {"fneg3",cgra.Tiles[1]},
                        {"inttoptr18",cgra.Tiles[5]},
                        {"inttoptr23",cgra.Tiles[4]},
                        {"inttoptr26",cgra.Tiles[2]},
                        {"inttoptr29",cgra.Tiles[12]},
                        {"inttoptr34",cgra.Tiles[8]},
                        {"inttoptr37",cgra.Tiles[14]},
                        {"zext4",cgra.Tiles[1]},
                        {"alloca19",cgra.Tiles[1]},
                        {"alloca24",cgra.Tiles[8]},
                        {"alloca30",cgra.Tiles[13]},
                        {"alloca35",cgra.Tiles[12]},
                        {"store5",cgra.Tiles[2]},
                        {"store9",cgra.Tiles[6]},
                        {"inttoptr6",cgra.Tiles[2]},
                        {"inttoptr10",cgra.Tiles[4]},
                        {"inttoptr21",cgra.Tiles[6]},
                        {"inttoptr32",cgra.Tiles[5]},
                        {"alloca7",cgra.Tiles[14]},
                        {"alloca11",cgra.Tiles[5]},
                        {"mul8",cgra.Tiles[13]},
                        {"mul12",cgra.Tiles[4]},
                        {"mul14",cgra.Tiles[10]},
                        {"mul15",cgra.Tiles[1]},
                        {"sub13",cgra.Tiles[9]},
                        {"add16",cgra.Tiles[10]},
                        {"sub20",cgra.Tiles[12]},
                        {"add25",cgra.Tiles[13]},
                        {"sub31",cgra.Tiles[9]},
                        {"add36",cgra.Tiles[8]},
                        {"load22",cgra.Tiles[0]},
                        {"load27",cgra.Tiles[14]},
                        {"load33",cgra.Tiles[14]},
                        {"load38",cgra.Tiles[12]}}},
                
                // dtw
                {"dtw",{{"fcmp0",cgra.Tiles[9]},
                        {"atomicrmw22",cgra.Tiles[5]},
                        {"fneg29",cgra.Tiles[9]},
                        {"catchpad30",cgra.Tiles[5]},
                        {"ret31",cgra.Tiles[9]},
                        {"fneg1",cgra.Tiles[9]},
                        {"fneg13",cgra.Tiles[8]},
                        {"fneg23",cgra.Tiles[12]},
                        {"store2",cgra.Tiles[8]},
                        {"store7",cgra.Tiles[12]},
                        {"store10",cgra.Tiles[6]},
                        {"store14",cgra.Tiles[4]},
                        {"fneg24",cgra.Tiles[13]},
                        {"inttoptr3",cgra.Tiles[4]},
                        {"inttoptr8",cgra.Tiles[13]},
                        {"inttoptr11",cgra.Tiles[10]},
                        {"inttoptr15",cgra.Tiles[6]},
                        {"zext25",cgra.Tiles[12]},
                        {"alloca4",cgra.Tiles[6]},
                        {"alloca9",cgra.Tiles[10]},
                        {"alloca12",cgra.Tiles[6]},
                        {"alloca16",cgra.Tiles[10]},
                        {"store26",cgra.Tiles[8]},
                        {"fadd5",cgra.Tiles[5]},
                        {"catchpad17",cgra.Tiles[6]},
                        {"inttoptr27",cgra.Tiles[4]},
                        {"phi6",cgra.Tiles[10]},
                        {"call18",cgra.Tiles[9]},
                        {"catchpad19",cgra.Tiles[5]},
                        {"call20",cgra.Tiles[13]},
                        {"fneg21",cgra.Tiles[8]},
                        {"load28",cgra.Tiles[4]}}},
                
                // blowfish
                {"blowfish",{{"fneg28",cgra.Tiles[9]},
                        {"catchpad29",cgra.Tiles[5]},
                        {"ret30",cgra.Tiles[9]},
                        {"fcmp0",cgra.Tiles[10]},
                        {"store3",cgra.Tiles[9]},
                        {"alloca4",cgra.Tiles[5]},
                        {"or5",cgra.Tiles[9]},
                        {"or27",cgra.Tiles[8]},
                        {"fcmp1",cgra.Tiles[9]},
                        {"fcmp2",cgra.Tiles[8]},
                        {"shl6",cgra.Tiles[12]},
                        {"shl9",cgra.Tiles[13]},
                        {"shl15",cgra.Tiles[6]},
                        {"ashr21",cgra.Tiles[4]},
                        {"store7",cgra.Tiles[13]},
                        {"ashr10",cgra.Tiles[9]},
                        {"ashr16",cgra.Tiles[10]},
                        {"and22",cgra.Tiles[12]},
                        {"alloca8",cgra.Tiles[4]},
                        {"and11",cgra.Tiles[6]},
                        {"and17",cgra.Tiles[5]},
                        {"store23",cgra.Tiles[8]},
                        {"store12",cgra.Tiles[10]},
                        {"store18",cgra.Tiles[6]},
                        {"alloca24",cgra.Tiles[12]},
                        {"alloca13",cgra.Tiles[13]},
                        {"alloca19",cgra.Tiles[10]},
                        {"fneg14",cgra.Tiles[12]},
                        {"or20",cgra.Tiles[4]},
                        {"fneg25",cgra.Tiles[8]},
                        {"ashr26",cgra.Tiles[12]}}},
                
                // spmv
                {"spmv",{{"fcmp1",cgra.Tiles[9]},
                        {"fneg18",cgra.Tiles[10]},
                        {"catchpad19",cgra.Tiles[9]},
                        {"ret20",cgra.Tiles[10]},
                        {"fcmp0",cgra.Tiles[14]},
                        {"store2",cgra.Tiles[13]},
                        {"store4",cgra.Tiles[12]},
                        {"store10",cgra.Tiles[8]},
                        {"fneg17",cgra.Tiles[14]},
                        {"alloca3",cgra.Tiles[14]},
                        {"alloca5",cgra.Tiles[13]},
                        {"alloca11",cgra.Tiles[12]},
                        {"zext6",cgra.Tiles[8]},
                        {"zext12",cgra.Tiles[12]},
                        {"store7",cgra.Tiles[8]},
                        {"store13",cgra.Tiles[13]},
                        {"alloca8",cgra.Tiles[9]},
                        {"alloca14",cgra.Tiles[12]},
                        {"fsub9",cgra.Tiles[13]},
                        {"fneg15",cgra.Tiles[10]},
                        {"load16",cgra.Tiles[14]}}},
                
                // conv
                {"conv",{{"fneg14",cgra.Tiles[10]},
                            {"catchpad15",cgra.Tiles[9]},
                            {"ret16",cgra.Tiles[10]},
                            {"fcmp0",cgra.Tiles[14]},
                            {"fmul2",cgra.Tiles[13]},
                            {"fdiv3",cgra.Tiles[12]},
                            {"trunc4",cgra.Tiles[14]},
                            {"trunc5",cgra.Tiles[13]},
                            {"store6",cgra.Tiles[9]},
                            {"store9",cgra.Tiles[8]},
                            {"inttoptr7",cgra.Tiles[8]},
                            {"inttoptr10",cgra.Tiles[12]},
                            {"alloca8",cgra.Tiles[9]},
                            {"alloca11",cgra.Tiles[13]},
                            {"fsub12",cgra.Tiles[9]},
                            {"fneg13",cgra.Tiles[13]},
                            {"fcmp1",cgra.Tiles[14]}}},
    }},
    // MorphoSys
    // HReA
    // HyCube
};

static map<string, map<string, int>> placement_done_kernels = {
    // mvt
    {"mvt",{{"fcmp0", 0}, 
            {"and1", 0}, 
            {"and2", 0}, 
            {"and3", 0}, 
            {"store4", 0}, 
            {"store26", 0}, 
            {"fneg39", 0}, 
            {"inttoptr5", 0}, 
            {"inttoptr24", 0}, 
            {"inttoptr27", 0}, 
            {"inttoptr37", 0}, 
            {"catchpad40", 0}, 
            {"alloca6", 0}, 
            {"load25", 0}, 
            {"alloca28", 0}, 
            {"load38", 0}, 
            {"ret41", 0}, 
            {"store7", 0}, 
            {"store8", 0}, 
            {"store9", 0}, 
            {"store10", 0}, 
            {"alloca19", 0}, 
            {"store29", 0}, 
            {"alloca32", 0}, 
            {"alloca11", 0}, 
            {"alloca12", 0}, 
            {"alloca13", 0}, 
            {"alloca14", 0}, 
            {"extractelement20", 0}, 
            {"inttoptr30", 0}, 
            {"extractelement33", 0}, 
            {"extractelement15", 0}, 
            {"insertelement21", 0}, 
            {"alloca31", 0}, 
            {"insertelement34", 0}, 
            {"extractelement16", 0}, 
            {"mul35", 0}, 
            {"extractelement17", 0}, 
            {"add36", 0}, 
            {"extractelement18", 0}, 
            {"mul22", 0}, 
            {"add23", 0}}},
    
    // fft
    {"fft",{{"fcmp0", 0}, 
            {"fneg39", 0}, 
            {"catchpad40", 0}, 
            {"ret41", 0}, 
            {"fneg1", 0}, 
            {"atomicrmw2", 0}, 
            {"store17", 0}, 
            {"store28", 0}, 
            {"fneg3", 0}, 
            {"inttoptr18", 0}, 
            {"inttoptr23", 0}, 
            {"inttoptr26", 0}, 
            {"inttoptr29", 0}, 
            {"inttoptr34", 0}, 
            {"inttoptr37", 0}, 
            {"zext4", 0}, 
            {"alloca19", 0}, 
            {"alloca24", 0}, 
            {"load27", 0}, 
            {"alloca30", 0}, 
            {"alloca35", 0}, 
            {"load38", 0}, 
            {"store5", 0}, 
            {"store9", 0}, 
            {"inttoptr6", 0}, 
            {"inttoptr10", 0}, 
            {"inttoptr21", 0}, 
            {"inttoptr32", 0}, 
            {"alloca7", 0}, 
            {"alloca11", 0}, 
            {"load22", 0}, 
            {"load33", 0}, 
            {"mul8", 0}, 
            {"mul12", 0}, 
            {"mul14", 0}, 
            {"mul15", 0}, 
            {"sub13", 0}, 
            {"add16", 0}, 
            {"sub20", 0}, 
            {"add25", 0}, 
            {"sub31", 0}, 
            {"add36", 0}}},
    
    // dtw
    {"dtw",{{"fcmp0", 0}, 
            {"atomicrmw22", 0}, 
            {"fneg29", 0}, 
            {"catchpad30", 0}, 
            {"ret31", 0}, 
            {"fneg1", 0}, 
            {"fneg13", 0}, 
            {"fneg23", 0}, 
            {"store2", 0}, 
            {"store7", 0}, 
            {"store10", 0}, 
            {"store14", 0}, 
            {"fneg24", 0}, 
            {"inttoptr3", 0}, 
            {"inttoptr8", 0}, 
            {"inttoptr11", 0}, 
            {"inttoptr15", 0}, 
            {"zext25", 0}, 
            {"alloca4", 0}, 
            {"alloca9", 0}, 
            {"alloca12", 0}, 
            {"alloca16", 0}, 
            {"store26", 0}, 
            {"fadd5", 0}, 
            {"catchpad17", 0}, 
            {"inttoptr27", 0}, 
            {"phi6", 0}, 
            {"call18", 0}, 
            {"load28", 0}, 
            {"catchpad19", 0}, 
            {"call20", 0}, 
            {"fneg21", 0}}},
    
    // blowfish
    {"blowfish", {
            {"fneg28", 0},
            {"catchpad29", 0},
            {"ret30", 0},
            {"fcmp0", 0},
            {"store3", 0},
            {"alloca4", 0},
            {"or5", 0},
            {"or27", 0},
            {"fcmp1", 0},
            {"fcmp2", 0},
            {"shl6", 0},
            {"shl9", 0},
            {"shl15", 0},
            {"ashr21", 0},
            {"store7", 0},
            {"ashr10", 0},
            {"ashr16", 0},
            {"and22", 0},
            {"alloca8", 0},
            {"and11", 0},
            {"and17", 0},
            {"store23", 0},
            {"store12", 0},
            {"store18", 0},
            {"alloca24", 0},
            {"alloca13", 0},
            {"alloca19", 0},
            {"fneg14", 0},
            {"or20", 0},
            {"fneg25", 0},
            {"ashr26", 0},
        }},
    
    // spmv
    {"spmv",{{"fcmp1",  0}, 
            {"fneg18",  0}, 
            {"catchpad19",  0}, 
            {"ret20",  0}, 
            {"fcmp0",  0}, 
            {"store2",  0}, 
            {"store4",  0}, 
            {"store10",  0}, 
            {"fneg17",  0}, 
            {"alloca3",  0}, 
            {"alloca5",  0}, 
            {"alloca11",  0}, 
            {"zext6",  0}, 
            {"zext12",  0}, 
            {"store7",  0}, 
            {"store13",  0}, 
            {"alloca8",  0}, 
            {"alloca14",  0}, 
            {"load16",  0}, 
            {"fsub9",  0}, 
            {"fneg15",  0}, 
        }},
    
    // conv
    {"conv",{{"fneg14", 0}, 
             {"catchpad15", 0}, 
             {"ret16", 0}, 
             {"fcmp0", 0}, 
             {"fmul2", 0}, 
             {"fdiv3", 0}, 
             {"trunc4", 0}, 
             {"trunc5", 0}, 
             {"store6", 0}, 
             {"store9", 0}, 
             {"inttoptr7", 0}, 
             {"inttoptr10", 0}, 
             {"alloca8", 0}, 
             {"alloca11", 0}, 
             {"fsub12", 0}, 
             {"fneg13", 0}, 
             {"fcmp1", 0}}},   
};

static map<string, map<string, vector<string>>> dependency_predecessors_kernels = {
    // mvt
    {"mvt", {
        {"fcmp0", {"fneg39", "ret41"}}, 
        {"and1", {"fcmp0"}}, 
        {"and2", {"fcmp0"}}, 
        {"and3", {"fcmp0"}}, 
        {"store4", {"fcmp0"}}, 
        {"store26", {"fcmp0"}}, 
        {"fneg39", {"fcmp0"}}, 
        {"inttoptr5", {"store4"}}, 
        {"inttoptr24", {"store4"}}, 
        {"inttoptr27", {"store26"}}, 
        {"inttoptr37", {"store26"}}, 
        {"catchpad40", {"fneg39"}}, 
        {"alloca6", {"inttoptr5"}}, 
        {"load25", {"inttoptr24"}}, 
        {"alloca28", {"inttoptr27"}}, 
        {"load38", {"inttoptr37"}}, 
        {"ret41", {"catchpad40"}}, 
        {"store7", {"fcmp0", "ret41"}}, 
        {"store8", {"and1", "ret41"}}, 
        {"store9", {"and2", "ret41"}}, 
        {"store10", {"and3", "ret41"}}, 
        {"alloca19", {"ret41"}}, 
        {"store29", {"fcmp0", "ret41"}}, 
        {"alloca32", {"ret41"}}, 
        {"alloca11", {"store7"}}, 
        {"alloca12", {"store8"}}, 
        {"alloca13", {"store9"}}, 
        {"alloca14", {"store10"}}, 
        {"extractelement20", {"alloca19"}}, 
        {"inttoptr30", {"store29"}}, 
        {"extractelement33", {"alloca32"}}, 
        {"extractelement15", {"alloca11"}}, 
        {"insertelement21", {"extractelement20"}}, 
        {"alloca31", {"inttoptr30"}}, 
        {"insertelement34", {"extractelement33"}}, 
        {"extractelement16", {"extractelement15", "alloca12"}}, 
        {"mul35", {"alloca31", "insertelement34"}}, 
        {"extractelement17", {"extractelement16", "alloca13"}}, 
        {"add36", {"alloca28", "mul35"}}, 
        {"extractelement18", {"extractelement17", "alloca14"}}, 
        {"mul22", {"extractelement18", "insertelement21"}}, 
        {"add23", {"alloca6", "mul22"}}}},
     
    // fft
    {"fft", {
        {"fcmp0" , {"fneg39", "ret41"}},
        {"fneg39" , {"fcmp0"}},
        {"catchpad40" , {"fneg39", "ret41"}},
        {"ret41" , {"catchpad40"}},
        {"fneg1" , {"fcmp0", "ret41"}},
        {"atomicrmw2" , {"fneg1"}},
        {"store17" , {"fneg1"}},
        {"store28" , {"fneg1"}},
        {"fneg3" , {"atomicrmw2", "ret41"}},
        {"inttoptr18" , {"store17"}},
        {"inttoptr23" , {"store17"}},
        {"inttoptr26" , {"store17"}},
        {"inttoptr29" , {"store28"}},
        {"inttoptr34" , {"store28"}},
        {"inttoptr37" , {"store28"}},
        {"zext4" , {"fneg3"}},
        {"alloca19" , {"inttoptr18"}},
        {"alloca24" , {"inttoptr23"}},
        {"load27" , {"inttoptr26"}},
        {"alloca30" , {"inttoptr29"}},
        {"alloca35" , {"inttoptr34"}},
        {"load38" , {"inttoptr37"}},
        {"store5" , {"zext4"}},
        {"store9" , {"zext4"}},
        {"inttoptr6" , {"store5"}},
        {"inttoptr10" , {"store9"}},
        {"inttoptr21" , {"store5"}},
        {"inttoptr32" , {"store9"}},
        {"alloca7" , {"inttoptr6"}},
        {"alloca11" , {"inttoptr10"}},
        {"load22" , {"inttoptr21"}},
        {"load33" , {"inttoptr32"}},
        {"mul8" , {"alloca7", "ret41"}},
        {"mul12" , {"alloca11", "ret41"}},
        {"mul14" , {"alloca7", "ret41"}},
        {"mul15" , {"alloca11", "ret41"}},
        {"sub13" , {"mul8", "mul12"}},
        {"add16" , {"mul14", "mul15"}},
        {"sub20" , {"alloca19", "sub13"}},
        {"add25" , {"sub13", "alloca24"}},
        {"sub31" , {"alloca30", "add16"}},
        {"add36" , {"add16", "alloca35"}}}},
            
    // dtw
    {"dtw", {
        {"fcmp0", {"fneg29", "ret31"}}, 
        {"atomicrmw22", {"fcmp0"}}, 
        {"fneg29", {"fcmp0"}}, 
        {"catchpad30", {"fneg29"}}, 
        {"ret31", {"catchpad30"}}, 
        {"fneg1", {"fcmp0", "ret31"}}, 
        {"fneg13", {"fcmp0", "ret31"}}, 
        {"fneg23", {"atomicrmw22", "ret31"}}, 
        {"store2", {"fneg1"}}, 
        {"store7", {"fneg1", "ret31"}}, 
        {"store10", {"fneg1", "ret31"}}, 
        {"store14", {"fneg13", "ret31"}}, 
        {"fneg24", {"fneg23"}}, 
        {"inttoptr3", {"store2"}}, 
        {"inttoptr8", {"store7"}}, 
        {"inttoptr11", {"store10"}}, 
        {"inttoptr15", {"store14"}}, 
        {"zext25", {"fneg24"}}, 
        {"alloca4", {"inttoptr3"}}, 
        {"alloca9", {"inttoptr8"}}, 
        {"alloca12", {"inttoptr11"}}, 
        {"alloca16", {"inttoptr15"}}, 
        {"store26", {"zext25", "ret31"}}, 
        {"fadd5", {"alloca4", "ret31"}}, 
        {"catchpad17", {"alloca9", "alloca12"}}, 
        {"inttoptr27", {"store26"}}, 
        {"phi6", {"fadd5"}}, 
        {"call18", {"catchpad17", "alloca9", "alloca12"}}, 
        {"load28", {"inttoptr27"}}, 
        {"catchpad19", {"call18", "alloca16"}}, 
        {"call20", {"catchpad19", "alloca16", "call18"}}, 
        {"fneg21", {"call20", "phi6"}}}},
    
    // blowfish
    {"blowfish", {
        {"fneg28", {"fcmp0"}},
        { "catchpad29", {"fneg28"}},
        { "ret30", {"catchpad29"}},
        { "fcmp0", {"fneg28", "ret30"}},
        { "store3", {"fcmp0"}},
        { "alloca4", {"store3"}},
        { "or5", {"alloca4", "fcmp2"}},
        { "or27", {"or5", "ashr26"}},
        { "fcmp1", {"or27", "ret30"}},
        { "fcmp2", {"fcmp1", "ret30"}},
        { "shl6", {"fcmp1"}},
        { "shl9", {"fcmp1"}},
        { "shl15", {"fcmp1"}},
        { "ashr21", {"fcmp1"}},
        { "store7", {"shl6"}},
        { "ashr10", {"shl9"}},
        { "ashr16", {"shl15"}},
        { "and22", {"ashr21"}},
        { "alloca8", {"store7"}},
        { "and11", {"ashr10"}},
        { "and17", {"ashr16"}},
        { "store23", {"and22"}},
        { "store12", {"and11"}},
        { "store18", {"and17"}},
        { "alloca24", {"store23"}},
        { "alloca13", {"store12"}},
        { "alloca19", {"store18"}},
        { "fneg14", {"alloca13", "alloca8"}},
        { "or20", {"fneg14", "alloca19"}},
        { "fneg25", {"or20", "alloca24"}},
        { "ashr26", {"fneg25"}}}},
    
    // spmv
    {"spmv", {
        {"fcmp1" , {"fneg18", "ret20"}},
        {"fneg18" , {"fcmp1"}},
        {"catchpad19" , {"fneg18"}},
        {"ret20" , {"catchpad19"}},
        {"fcmp0" , {"fneg17", "ret20"}},
        {"store2" , {"fcmp0"}},
        {"store4" , {"fcmp0"}},
        {"store10" , {"fcmp0"}},
        {"fneg17" , {"fcmp0"}},
        {"alloca3" , {"store2"}},
        {"alloca5" , {"store4"}},
        {"alloca11" , {"store10"}},
        {"zext6" , {"alloca5"}},
        {"zext12" , {"alloca11"}},
        {"store7" , {"zext6"}},
        {"store13" , {"zext12"}},
        {"alloca8" , {"store7"}},
        {"alloca14" , {"store13"}},
        {"load16" , {"store13"}},
        {"fsub9" , {"alloca8", "alloca3"}},
        {"fneg15" , {"alloca14", "fsub9"}}}},
    
    // conv
    {"conv", {
        {"fneg14", {"fcmp0"}}, 
        {"catchpad15", {"fneg14"}}, 
        {"ret16", {"catchpad15"}}, 
        {"fcmp0", {"fneg14", "ret16"}}, 
        {"fmul2", {"fcmp0"}}, 
        {"fdiv3", {"fcmp0"}}, 
        {"trunc4", {"fmul2"}}, 
        {"trunc5", {"fdiv3"}}, 
        {"store6", {"trunc4", "trunc5"}}, 
        {"store9", {"trunc4", "trunc5"}}, 
        {"inttoptr7", {"store6"}}, 
        {"inttoptr10", {"store9"}}, 
        {"alloca8", {"inttoptr7"}}, 
        {"alloca11", {"inttoptr10"}}, 
        {"fsub12", {"alloca11", "alloca8"}}, 
        {"fneg13", {"fsub12", "fcmp1"}}, 
        {"fcmp1", {"fneg13", "ret16"}}}},  
};

static map<string, map<string, vector<string>>> dependency_successors_kernels = {
    // mvt
    {"mvt", {
        {"fcmp0", {"and1", "and2", "and3", "store4", "store7", "store26", "store29", "fneg39"}}, 
        {"and1", {"store8"}}, 
        {"and2", {"store9"}}, 
        {"and3", {"store10"}}, 
        {"store4", {"inttoptr5", "inttoptr24"}}, 
        {"store26", {"inttoptr27", "inttoptr37"}}, 
        {"fneg39", {"fcmp0", "catchpad40"}}, 
        {"inttoptr5", {"alloca6"}}, 
        {"inttoptr24", {"load25"}}, 
        {"inttoptr27", {"alloca28"}}, 
        {"inttoptr37", {"load38"}}, 
        {"catchpad40", {"ret41"}}, 
        {"alloca6", {"add23"}}, 
        {"load25", {"N/A"}}, 
        {"alloca28", {"add36"}}, 
        {"load38", {"N/A"}}, 
        {"ret41", {"fcmp0", "store7", "store8", "store9", "store10", "alloca19", "store29", "alloca32"}}, 
        {"store7", {"alloca11"}}, 
        {"store8", {"alloca12"}}, 
        {"store9", {"alloca13"}}, 
        {"store10", {"alloca14"}}, 
        {"alloca19", {"extractelement20"}}, 
        {"store29", {"inttoptr30"}}, 
        {"alloca32", {"extractelement33"}}, 
        {"alloca11", {"extractelement15"}}, 
        {"alloca12", {"extractelement16"}}, 
        {"alloca13", {"extractelement17"}}, 
        {"alloca14", {"extractelement18"}}, 
        {"extractelement20", {"insertelement21"}}, 
        {"inttoptr30", {"alloca31"}}, 
        {"extractelement33", {"insertelement34"}}, 
        {"extractelement15", {"extractelement16"}}, 
        {"insertelement21", {"mul22"}}, 
        {"alloca31", {"mul35"}}, 
        {"insertelement34", {"mul35"}}, 
        {"extractelement16", {"extractelement17"}}, 
        {"mul35", {"add36"}}, 
        {"extractelement17", {"extractelement18"}}, 
        {"add36", {"N/A"}}, 
        {"extractelement18", {"mul22"}}, 
        {"mul22", {"add23"}}, 
        {"add23", {"N/A"}}}},

    // fft
    {"fft", {
        {"fcmp0" , {"fneg1", "fneg39"}},
        {"fneg39" , {"fcmp0", "catchpad40"}},
        {"catchpad40" , {"ret41"}},
        {"ret41" , {"fcmp0", "fneg1", "fneg3", "mul8", "mul12", "mul14", "mul15", "catchpad40"}},
        {"fneg1" , {"atomicrmw2", "store17", "store28"}},
        {"atomicrmw2" , {"fneg3"}},
        {"store17" , {"inttoptr18", "inttoptr23", "inttoptr26"}},
        {"store28" , {"inttoptr29", "inttoptr34", "inttoptr37"}},
        {"fneg3" , {"zext4"}},
        {"inttoptr18" , {"alloca19"}},
        {"inttoptr23" , {"alloca24"}},
        {"inttoptr26" , {"load27"}},
        {"inttoptr29" , {"alloca30"}},
        {"inttoptr34" , {"alloca35"}},
        {"inttoptr37" , {"load38"}},
        {"zext4" , {"store5", "store9"}},
        {"alloca19" , {"sub20"}},
        {"alloca24" , {"add25"}},
        {"load27" , {"N/A"}},
        {"alloca30" , {"sub31"}},
        {"alloca35" , {"add36"}},
        {"load38" , {"N/A"}},
        {"store5" , {"inttoptr6", "inttoptr21"}},
        {"store9" , {"inttoptr10", "inttoptr32"}},
        {"inttoptr6" , {"alloca7"}},
        {"inttoptr10" , {"alloca11"}},
        {"inttoptr21" , {"load22"}},
        {"inttoptr32" , {"load33"}},
        {"alloca7" , {"mul8", "mul14"}},
        {"alloca11" , {"mul12", "mul15"}},
        {"load22" , {"N/A"}},
        {"load33" , {"N/A"}},
        {"mul8" , {"sub13"}},
        {"mul12" , {"sub13"}},
        {"mul14" , {"add16"}},
        {"mul15" , {"add16"}},
        {"sub13" , {"sub20", "add25"}},
        {"add16" , {"sub31", "add36"}},
        {"sub20" , {"N/A"}},
        {"add25" , {"N/A"}},
        {"sub31" , {"N/A"}},
        {"add36" , {"N/A"}}}},
    
    // dtw
    {"dtw", {
        {"fcmp0", {"fneg1", "fneg13", "atomicrmw22", "fneg29"}}, 
        {"atomicrmw22", {"fneg23"}}, 
        {"fneg29", {"fcmp0", "catchpad30"}}, 
        {"catchpad30", {"ret31"}}, 
        {"ret31", {"fcmp0", "fneg1", "fadd5", "store7", "store10", "fneg13", "store14", "fneg23", "store26"}}, 
        {"fneg1", {"store2", "store7", "store10"}}, 
        {"fneg13", {"store14"}}, 
        {"fneg23", {"fneg24"}}, 
        {"store2", {"inttoptr3"}}, 
        {"store7", {"inttoptr8"}}, 
        {"store10", {"inttoptr11"}}, 
        {"store14", {"inttoptr15"}}, 
        {"fneg24", {"zext25"}}, 
        {"inttoptr3", {"alloca4"}}, 
        {"inttoptr8", {"alloca9"}}, 
        {"inttoptr11", {"alloca12"}}, 
        {"inttoptr15", {"alloca16"}}, 
        {"zext25", {"store26"}}, 
        {"alloca4", {"fadd5"}}, 
        {"alloca9", {"catchpad17", "call18"}}, 
        {"alloca12", {"catchpad17", "call18"}}, 
        {"alloca16", {"catchpad19", "call20"}}, 
        {"store26", {"inttoptr27"}}, 
        {"fadd5", {"phi6"}}, 
        {"catchpad17", {"call18"}}, 
        {"inttoptr27", {"load28"}}, 
        {"phi6", {"fneg21"}}, 
        {"call18", {"catchpad19", "call20"}}, 
        {"load28", {"N/A"}}, 
        {"catchpad19", {"call20"}}, 
        {"call20", {"fneg21"}}, 
        {"fneg21", {"N/A"}}}},
    
    // blowfish
    {"blowfish", {
        {"fneg28", {"fcmp0", "catchpad29"}},
        {"catchpad29", {"ret30"}},
        {"ret30", {"fcmp0", "fcmp1", "fcmp2"}},
        {"fcmp0", {"store3", "fneg28"}},
        {"store3", {"alloca4"}},
        {"alloca4", {"or5"}},
        {"or5", {"or27"}},
        {"or27", {"fcmp1"}},
        {"fcmp1", {"fcmp2", "shl6", "shl9", "shl15", "ashr21"}},
        {"fcmp2", {"or5"}},
        {"shl6", {"store7"}},
        {"shl9", {"ashr10"}},
        {"shl15", {"ashr16"}},
        {"ashr21", {"and22"}},
        {"store7", {"alloca8"}},
        {"ashr10", {"and11"}},
        {"ashr16", {"and17"}},
        {"and22", {"store23"}},
        {"alloca8", {"fneg14"}},
        {"and11", {"store12"}},
        {"and17", {"store18"}},
        {"store23", {"alloca24"}},
        {"store12", {"alloca13"}},
        {"store18", {"alloca19"}},
        {"alloca24", {"fneg25"}},
        {"alloca13", {"fneg14"}},
        {"alloca19", {"or20"}},
        {"fneg14", {"or20"}},
        {"or20", {"fneg25"}},
        {"fneg25", {"ashr26"}},
        {"ashr26", {"or27"}}}},
    
    // spmv
    {"spmv", {
        {"fcmp1" , {"fneg18"}},
        {"fneg18" , {"fcmp1", "catchpad19"}},
        {"catchpad19" , {"ret20"}},
        {"ret20" , {"fcmp0", "fcmp1"}},
        {"fcmp0" , {"store2", "store4", "store10", "fneg17"}},
        {"store2" , {"alloca3"}},
        {"store4" , {"alloca5"}},
        {"store10" , {"alloca11"}},
        {"fneg17" , {"fcmp0"}},
        {"alloca3" , {"fsub9"}},
        {"alloca5" , {"zext6"}},
        {"alloca11" , {"zext12"}},
        {"zext6" , {"store7"}},
        {"zext12" , {"store13"}},
        {"store7" , {"alloca8"}},
        {"store13" , {"alloca14", "load16"}},
        {"alloca8" , {"fsub9"}},
        {"alloca14" , {"fneg15"}},
        {"load16" , {"N/A"}},
        {"fsub9" , {"fneg15"}},
        {"fneg15" , {"N/A"}}}},
    
    // conv
    {"conv", {
        {"fneg14", {"fcmp0", "catchpad15"}}, 
        {"catchpad15", {"ret16"}}, 
        {"ret16", {"fcmp0", "fcmp1"}}, 
        {"fcmp0", {"fmul2", "fdiv3", "fneg14"}}, 
        {"fmul2", {"trunc4"}}, 
        {"fdiv3", {"trunc5"}}, 
        {"trunc4", {"store6", "store9"}}, 
        {"trunc5", {"store6", "store9"}}, 
        {"store6", {"inttoptr7"}}, 
        {"store9", {"inttoptr10"}}, 
        {"inttoptr7", {"alloca8"}}, 
        {"inttoptr10", {"alloca11"}}, 
        {"alloca8", {"fsub12"}}, 
        {"alloca11", {"fsub12"}}, 
        {"fsub12", {"fneg13"}}, 
        {"fneg13", {"fcmp1"}}, 
        {"fcmp1", {"fneg13"}}}},
};