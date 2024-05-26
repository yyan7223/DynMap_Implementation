#include<iostream>
#include<vector>
#include<cmath>
#include<chrono>
#include<algorithm>
using namespace std;
using namespace chrono;

class Task{
    public:
        int ID; // task identifier
        float ve; // variable from paper, task virtual eligible time
        float vd; // variable from paper, task virtual deadline time
        float w; // variable from paper, task weight
        float r; // variable from paper, task request length
        float u; // variable from paper, task received service time
        bool eligible; // variable from paper, task is eligible
        float st; // task spawn time
        float dt; // task destroy time
        float leftTime; // the left request time
        bool isRunning; // indicate whether the task is running
        bool isFirstReq; // indicate whether is the first request
        int dfgNodesNum; // task DFG nodes total number
        int inputNum; // number of inputs that task aims to process in each request
        int leftInputs; // the number of inputs that have not been processed
        int loadInputs; // the number of inputs that will be loaded to memory in the next time quantum
        int procInputs; // the number of inputs that will be actually processed in the next time quantum
        bool allInputsDone; // all the inputs of current request have been processed
        int oneIterCycles; // the execution cycles of each iteration
        int II; // initial interval of task executing on the allocated resources
        Task(){};
        Task(int id, float weight, float requestLength, float spawnTime, float destroyTime,
            int DFGNodesNum, int inputsN){
            ID = id;
            ve = 0.0f;
            vd = 0.0f;
            w = weight;
            r = requestLength;
            u = 0.0f;
            eligible = false;
            st = spawnTime;
            dt = destroyTime;
            leftTime = 0.0f;
            isRunning = false;
            isFirstReq = true;
            dfgNodesNum = DFGNodesNum;
            inputNum = inputsN;
            leftInputs = inputNum;
            loadInputs = 0;
            procInputs = 0;
            allInputsDone = false;
        };
    public:
        void updateVE(float vt){
            // VE updating is only allowed when finish executing the request length or processing all inputs
            if(leftTime <= 0.0f || leftInputs <= 0){ 
                if(isFirstReq){
                    ve = vt;
                    isFirstReq = false;
                }
                else{
                    ve = ve + u / w;
                    u = 0.0f; // reset u to 0 after updating VE
                }
            }
        }
        void balanceVE(float lag, float W){
            ve = ve + (1 - w) * lag / W;
        }
        void updateVD(){
            // VD updating is only allowed when finish executing the request length or processing all inputs
            if(leftTime <= 0.0f || leftInputs <= 0){ 
                vd = ve + r / w;
            }
        }
        void updateEligible(float vt){
            if(vt >= ve) eligible = true;
            else eligible = false;
        }
        void startRunning(float quantum, int freq){
            isRunning = true;
            if(leftTime <= 0.0f || leftInputs <= 0){ // simulate a new request is issued
                leftTime = r;
                leftInputs = inputNum;
            }
            leftTime -= quantum;
            // calculate actually processed input before updating leftInputs
            int totalCycles = floor(quantum * freq);
            procInputs = (totalCycles - oneIterCycles) / II + 1;
            leftInputs -= procInputs;
        }
        void stopRunning(float quantum){
            if(isRunning) u += quantum; // only update the received service time when the task actually run in this time quantum
            if(u > r) u = r; // actual received service time can only be smaller or equal to request time
            isRunning = false;
        }
        float generateExecuteTime(int numData, int memoryLimit, int numTiles, int freq){
            // get the actual number of processed inputs 
            if(numData > leftInputs) loadInputs = leftInputs;
            else loadInputs = numData;
            if (loadInputs > memoryLimit) loadInputs = memoryLimit;

            // caculate execution time according to the number processed inputs
            II = ceil((float)dfgNodesNum / (float)numTiles);
            oneIterCycles = numTiles; // simulated value, should be obtained from the mapping results
            int totalCycles = (loadInputs - 1) * II + oneIterCycles;
            return (float)totalCycles / (float)freq;
        }
};

float actualTime = 0.0f;
float virtualTime = 0.0f;
float timeQuantum = 0.0f; 
int tasksNum = 3; 
vector<Task> taskQueue; // all possible tasks luanched by users
vector<Task> activeTaskQueue; // user actually launched tasks
vector<float> lags; // the lag of each deconstructed tasks
vector<int> eligibleTaskQueueIdx; 
vector<int> numTilesPerTask;
vector<int> numDataPerTask;
vector<float> execTimePerTask;
float W = 0.0f; // weightSum
int memBankCap = 1000; // the memory bank of each tile can only store 1000 inputs
int cgra_size = 8;
int cgra_freq = 4000; //400MHz
int dma_speed = 25000; // 250MB/s
