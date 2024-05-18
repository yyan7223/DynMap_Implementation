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
        bool eligible; // variable from paper, task is eligible
        float st; // task spawn time
        float leftTime; // the left request time
        bool isRunning; // indicate whether the task is running
        Task(){};
        Task(int id, float weight, float requestLength, float spawnTime){
            ID = id;
            ve = 0.0f;
            vd = 0.0f;
            w = weight;
            r = requestLength;
            eligible = false;
            st = spawnTime;
            leftTime = 0.0f;
            isRunning = false;
        };
    public:
        void updateVE(int u){
            ve = ve + u / w;
        };
        void updateVD(){
            vd = ve + r / w;
        }
        void updateEligible(float virtualTime){
            if(virtualTime >= ve) eligible = true;
            else eligible = false;
        }
        void startRunning(){
            leftTime = r;
            isRunning = true;
        }
        void updateLeftTime(int stride){
            leftTime -= stride;
            if(leftTime == 0) isRunning = false;
        }
};

float actualTime = 0.0f;
float virtualTime = 0.0f;
float timeStride = 1.0f; // 1 second
vector<Task> taskQueue;
vector<Task> activeTaskQueue;
vector<int> eligibleTaskID;
Task runningTask;
float W = 0.0f; // weightSum
int runningTaskID = 0;

