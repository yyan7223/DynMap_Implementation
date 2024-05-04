#include<iostream>
#include<vector>
#include<cmath>
#include <chrono>
using namespace std;
using namespace chrono;

class Tile{
    public:
        int ID;   
        int X;  
        int Y; 
        bool occupied;
        Tile(){};
        Tile(int id, int x, int y){
            ID = id;
            X = x;
            Y = y;
            occupied = false;
        }
        bool operator ==(const Tile& t)
        {
            return (this->ID == t.ID) && (this->X == t.X) && (this->Y == t.Y) && (this->occupied == t.occupied);
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

// vector<vector<int>> tasksKernelsNodesNum = {
//     {27, 27, 26, 30, 16}, // User1: gcn
//     {66, 20, 64, 95, 46, 67, 18}, // User2: raytrace
//     {7, 87, 31, 33, 65, 20}, // User3: lu 
// };

vector<vector<int>> tasksKernelsNodesNum = {
    {95, 87, 67, 66, 65}, 
    {64, 46, 33, 31, 30, 27, 27}, 
    {26, 20, 20, 18, 16, 7}, 
};

// vector<vector<int>> tasksKernelsNodesNum = {
//     {95, 67, 66, 64, 46, 20, 18}, 
//     {87, 65, 33, 31, 20, 7},
//     {30, 27, 27, 26, 16},
// };


int cgraSize = 8;
CGRA cgra = CGRA(cgraSize);

int *startCoordY = new int[cgraSize]();

int curCoordX = 0;
int curCoordY = 0;

int allocatedTilesNum = 0;
int leftTiles = 0;

int kernelWidthLimit = 0;
int kernelHeightLimit = 0;
