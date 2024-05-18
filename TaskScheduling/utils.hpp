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
        float leftTime; // the left request time
        bool isRunning; // indicate whether the task is running
        bool isFirstReq; // indicate whether is the first request
        Task(){};
        Task(int id, float weight, float requestLength, float spawnTime){
            ID = id;
            ve = 0.0f;
            vd = 0.0f;
            w = weight;
            r = requestLength;
            u = 0.0f;
            eligible = false;
            st = spawnTime;
            leftTime = 0.0f;
            isRunning = false;
            isFirstReq = true;
        };
    public:
        void updateVE(float virtualTime){
            if(isFirstReq){
                ve = virtualTime;
                isFirstReq = false;
            }
            else{
                ve = ve + u / w;
            }
        }
        void updateVD(){
            vd = ve + r / w;
        }
        void updateEligible(float virtualTime){
            if(virtualTime >= ve) eligible = true;
            else eligible = false;
        }
        void startRunning(){
            isRunning = true;
        }
        void resetReceivedServiceTime(){
            u = 0.0f; // reset u to 0 after updating VE
        }
        void stopRunning(float stride){
            if(isRunning) u += stride; // only update the received service time when the task actually run in this time stride
            isRunning = false;
        }
};

float actualTime = 0.0f;
float virtualTime = 0.0f;
float timeStride = 1.0f; // 1 second
vector<Task> taskQueue;
vector<Task> activeTaskQueue;
vector<int> eligibleTaskID;
float W = 0.0f; // weightSum

