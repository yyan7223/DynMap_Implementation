#include"utils.hpp"

void updateActualTime(){
    actualTime += timeStride;
}

void updateWeightSum(){
    float sum = 0.0f;
    for(auto task : activeTaskQueue){
        sum += task.w;
    }
    W = sum;
}

void updateVirtualTime(){
    virtualTime += timeStride / W;
}

bool checkIfNoTaskRunning(){
    for(auto task : activeTaskQueue){
        if(task.isRunning) return false;
    }
    return true;
}

void selectOneTaskToRun(){
    // firstly find eligible tasks
    eligibleTaskID.clear();
    for(int i = 0; i < activeTaskQueue.size(); i++){ 
        if(activeTaskQueue[i].eligible) eligibleTaskID.push_back(i);
    }

    // select one of the eligible tasks to runs
    int minIdx = 0;
    if(eligibleTaskID.size() == 0){ // the first second, default select the first task to run
        activeTaskQueue[eligibleTaskID[minIdx]].startRunning(); 
    }
    else if(eligibleTaskID.size() == 1){ // if only one eligible task, directly run 
        activeTaskQueue[eligibleTaskID[minIdx]].startRunning(); 
    }
    else{ // if several tasks are eligible
        float minVD = 9999.0f;
        for(int i = 0; i < eligibleTaskID.size(); i++){ // choose the one with the minimum vd to run
            if(activeTaskQueue[eligibleTaskID[i]].vd < minVD){
                minVD = activeTaskQueue[eligibleTaskID[i]].vd;
                minIdx = i;
            }
        }
        activeTaskQueue[eligibleTaskID[minIdx]].startRunning(); 
    }
}

void updateAttrOfWaitingTasks(){
    updateWeightSum(); // update sum of weights
    for(auto& activeTask : activeTaskQueue){ // & is for updating the value
        if(activeTask.isRunning == false){ // only update waiting tasks
            activeTask.updateVE(actualTime);
            activeTask.updateVD();
            activeTask.updateEligible(virtualTime);
        }
    }
}

void updateTimeStamp(){
    updateActualTime();
    updateVirtualTime();
    for(auto& activeTask : activeTaskQueue){ // & is for updating the value 
        if(activeTask.isRunning) activeTask.updateLeftTime(timeStride); // update the running time of the running task
    }
}

void updateActiveTaskQueue(){
    for(auto task : taskQueue){
        if(task.st == actualTime){
            activeTaskQueue.push_back(task);
        }
    }
}

int main(){

    // manually creat some tasks, Task(int id, float weight, float requestLength, float spawnTime)
    Task task1(1, 2.0f, 2.0f, 0.0f); taskQueue.push_back(task1);
    Task task2(2, 2.0f, 1.0f, 1.0f); taskQueue.push_back(task2);

    while(true){ // one iteration represents a new second
        // At the beginning of each second
        updateActiveTaskQueue(); // check whether spawn new tasks and add to activeTaskQueue
        updateAttrOfWaitingTasks(); // update vd ve of waiting tasks
        if(checkIfNoTaskRunning()){ // if no task is running
            selectOneTaskToRun(); // choose one task to run
        }
        updateTimeStamp(); // move to next second
    };
    return 0;
}