#include<iostream>
#include<vector>
#include<cmath>
#include <chrono>
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
        Task(){};
        Task(int id, float weight, float requestLength, float spawnTime, float destroyTime){
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
        };
    public:
        void updateVE(float vt){
            if(leftTime <= 0){ // VE updating is only allowed when finish executing the request length
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
            if(leftTime <= 0){ // VE updating is only allowed when finish executing the request length
                vd = ve + r / w;
            }
        }
        void updateEligible(float vt){
            if(vt >= ve) eligible = true;
            else eligible = false;
        }
        void startRunning(float quantum){
            isRunning = true;
            if(leftTime <= 0.0f){
                leftTime = r;
            }
            leftTime -= quantum;
        }
        void stopRunning(float quantum){
            if(isRunning) u += quantum; // only update the received service time when the task actually run in this time quantum
            if(u > r) u = r; // actual received service time can only be smaller or equal to request time
            isRunning = false;
        }
};

float actualTime = 0.0f;
float virtualTime = 0.0f;
float timeQuantum = 1.0f; // 1 second
vector<Task> taskQueue; // all possible tasks luanched by users
vector<Task> activeTaskQueue; // user actually launched tasks
vector<float> lags; // the lag of each deconstructed tasks
vector<int> eligibleTaskQueueIdx; 
float W = 0.0f; // weightSum

