#include"utils.hpp"

int calculateTotalNodesNum(){
    int totalNodes = 0;
    for(auto kernelsNodesNum : tasksKernelsNodesNum){
        for(auto kernelNodesNum : kernelsNodesNum){
            totalNodes += kernelNodesNum;
        }
    }
    return totalNodes;
}

int decideTilesNum(int kernelNodes, int totalNodes, int cgraSize){
    int num = floor(cgraSize * cgraSize * (1.0f * kernelNodes / totalNodes));
    if(num == 0) num = 1;
    return num;
}

void initialize(){
    for(int i = 0; i < cgraSize; i++){
        *(startCoordY + i) = 0;
    }
}

void printCurrentAllocation(){
    for(int i = cgraSize - 1; i >= 0; i--){
        for(int j = 0; j < cgraSize; j++){
            if(cgra.Tiles[i * cgraSize + j].occupied){
                cout<<"1 ";
            }
            else{
                cout<<"0 ";
            }
        }
        cout<<endl;
    }
}

void decideKernelHeightWidthLimit(int allocatedTilesNum){
    float base = sqrt(allocatedTilesNum);
    float base_floor = floor(base);
    float diff = base - base_floor;
    if(diff <= 0.5f && diff > 0){
        kernelWidthLimit = int(ceil(base)) - 1;
        kernelHeightLimit = int(ceil(base));
    }
    else{
        kernelWidthLimit = int(ceil(base));
        kernelHeightLimit = int(ceil(base));
    }
}

void occupyCurrentTile(){
    cgra.Tiles[curCoordY * cgraSize + curCoordX].occupied = true;
}

void setCurCoord(int value){
    if(value >= cgraSize) value = 0;
    curCoordX = value;
    curCoordY = *(startCoordY + curCoordX);
}

void setStartCoordYValue(int value){
    *(startCoordY + curCoordX) = value;
}

void moveUp(){
    int yDiff = curCoordY - (*(startCoordY + curCoordX)); // check the Y distance to the startCoordY
    if((yDiff == kernelHeightLimit - 1) || (leftTiles == 0)){ // if curCoordY has reached the height limit, move to next X
        setStartCoordYValue(curCoordY + 1); // update the maximum Y value of curCoordX to curCoord
        do{ setCurCoord(curCoordX + 1); } while (curCoordY == cgraSize); // skip the column whose tiles have all been allocated
    }
    else{
        curCoordY += 1;
    }
}

int main(){
    int totalNodesNum = calculateTotalNodesNum();
    cout<<"mylove has totalNodes "<<totalNodesNum<<endl;
    initialize();
    // for(auto kernelsNodesNum : tasksKernelsNodesNum){
    // for(auto kernelNodesNum : kernelsNodesNum){
    //     allocatedTilesNum = decideTilesNum(kernelNodesNum, totalNodesNum, cgraSize);
    //     cout<<"kernel allocated tiles number is: "<<allocatedTilesNum<<endl;

    // }}
    typedef high_resolution_clock Clock;
    auto t1 = Clock::now();
    for(auto kernelsNodesNum : tasksKernelsNodesNum){
        for(auto kernelNodesNum : kernelsNodesNum){
            allocatedTilesNum = decideTilesNum(kernelNodesNum, totalNodesNum, cgraSize);
            // cout<<"kernel allocated tiles number is: "<<allocatedTilesNum<<endl;
            decideKernelHeightWidthLimit(allocatedTilesNum);

            if(cgraSize - curCoordX < kernelWidthLimit) setCurCoord(0);

            leftTiles = allocatedTilesNum;
            while (leftTiles > 0)
            {
                occupyCurrentTile();
                leftTiles -= 1;
                moveUp(); // prepare for the next occupy
            };

            // printCurrentAllocation();
            // cout<<"One kernel resource allocation done"<<endl;
        }
    }
    auto t2 = Clock::now();
    float timeMS = duration_cast<nanoseconds>(t2 - t1).count() / 1000000.0; 
    cout<<"Resource allocation done, elapsed time is "<<timeMS<<" ms"<<endl;

    delete []startCoordY;
    return 0;
}