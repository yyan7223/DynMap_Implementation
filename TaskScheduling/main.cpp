#include"utils.hpp"

void updateActualTime(){
    actualTime += timeQuantum;
}

void updateWeightSum(){
    float sum = 0.0f;
    for(auto task : activeTaskQueue){
        sum += task.w;
    }
    W = sum;
}

void updateVirtualTime(){
    virtualTime += timeQuantum / W;
}

void balanceVirtualTime(float lag){
    virtualTime += lag / W;
}

void updateTaskDestroyStatus(){
    for(vector<Task>::iterator iter = activeTaskQueue.begin(); iter != activeTaskQueue.end(); iter++){      
        if(iter->dt <= actualTime){ 
            lags.push_back(virtualTime - iter->ve); // record the lag of the destroyed task
            activeTaskQueue.erase(iter); // remove the destroyed task from activeTaskQueue
            iter--;
        }
    }
    for(int i = 0; i < lags.size(); i++){ // if there are destroyed tasks
        for(auto& activeTask : activeTaskQueue){ 
            activeTask.balanceVE(lags[i], W); // refresh the ve of each activetask according to the lag of each destroyed task
        }
        balanceVirtualTime(lags[i]);
    }
}

int selectMutilpleTasksToRun(int tasksNum){
    // firstly find eligible tasks
    eligibleTaskQueueIdx.clear();
    for(int i = 0; i < activeTaskQueue.size(); i++){ 
        if(activeTaskQueue[i].eligible) eligibleTaskQueueIdx.push_back(i);
    }

    // select one of the eligible tasks to run
    int minIdx = 0;
    if(eligibleTaskQueueIdx.size() <= 1){ // if only one or less eligible task, default select the first task to run
        activeTaskQueue[eligibleTaskQueueIdx[minIdx]].startRunning(timeQuantum); 
    }
    else{ // if several tasks are eligible
        float minVD = 9999.0f;
        for(int i = 0; i < eligibleTaskQueueIdx.size(); i++){ // choose the one with the minimum vd to run
            if(activeTaskQueue[eligibleTaskQueueIdx[i]].vd < minVD){
                minVD = activeTaskQueue[eligibleTaskQueueIdx[i]].vd;
                minIdx = i;
            }
        }
        if(actualTime == 1) minIdx = 1; // a hardcoded task choice inidcated by paper as eligible and deadline of both tasks are same
        for(int i = 0; i < tasksNum; i++){
            activeTaskQueue[eligibleTaskQueueIdx[minIdx + i]].startRunning(timeQuantum); 
        }
    }
    cout<<"Time: "<<actualTime<<"s, running task ID: "<<activeTaskQueue[eligibleTaskQueueIdx[minIdx]].ID<<endl; 
    return minIdx;
}

void selectMutilpleTasksToRun_sort(int tasksNum){
    eligibleTaskQueueIdx.clear();
    vector<int> ineligibleTaskQueueIdx; 
    for(int i = 0; i < activeTaskQueue.size(); i++){ // firstly select eligible tasks
        if(activeTaskQueue[i].eligible) eligibleTaskQueueIdx.push_back(i);
        else ineligibleTaskQueueIdx.push_back(i);
    }

    if(eligibleTaskQueueIdx.size() < tasksNum){ // if insufficient as indicated by taskNum, supplement tasks with minimum vd
        int queueLen = ineligibleTaskQueueIdx.size();
        for (int i = 0; i < queueLen - 1; i++) { // bubble sort vd from small to large, can be optimized to rb-tree   
            for (int j = 0; j < queueLen - 1 - i; j++) { 
                if (activeTaskQueue[ineligibleTaskQueueIdx[j]].vd > activeTaskQueue[ineligibleTaskQueueIdx[j+1]].vd) {
                    swap(ineligibleTaskQueueIdx[j], ineligibleTaskQueueIdx[j+1]);
            }
        }
        int diff = tasksNum - eligibleTaskQueueIdx.size();
        for(int i = 0; i < diff; i++) eligibleTaskQueueIdx.push_back(ineligibleTaskQueueIdx[i]); // supplement insufficient tasks
    }
    }
    else if(eligibleTaskQueueIdx.size() > tasksNum){ // if more than indicated by taskNum, remove tasks with maximum vd
        int queueLen = eligibleTaskQueueIdx.size();
        for (int i = 0; i < queueLen - 1; i++) { // bubble sort vd from small to large, can be optimized to rb-tree   
            for (int j = 0; j < queueLen - 1 - i; j++) { 
                if (activeTaskQueue[eligibleTaskQueueIdx[j]].vd > activeTaskQueue[eligibleTaskQueueIdx[j+1]].vd) {
                    swap(eligibleTaskQueueIdx[j], eligibleTaskQueueIdx[j+1]);
                }
            }
        }
        int diff = eligibleTaskQueueIdx.size() - tasksNum;
        for(int i = 0; i < diff; i++) eligibleTaskQueueIdx.pop_back(); // remove redundant tasks
    }
    else {};

    // run the selected tasks
    for(int i = 0; i < tasksNum; i++){
        activeTaskQueue[eligibleTaskQueueIdx[i]].startRunning(timeQuantum); 
    }
    cout<<"Time: "<<actualTime<<"s, running task ID:";
    for (int i = 0; i < eligibleTaskQueueIdx.size(); i++)
    {
        cout<<" "<<activeTaskQueue[eligibleTaskQueueIdx[i]].ID<<","; 
    }
    cout<<endl;
}

void updateTasksAttr(){
    updateWeightSum(); // update sum of weights
    for(auto& activeTask : activeTaskQueue){ // & is for updating the value
        activeTask.updateVE(virtualTime);
        activeTask.updateVD();
    }
    updateTaskDestroyStatus(); // update vt and ve if there are tasks destoryed, 
    for(auto& activeTask : activeTaskQueue){ // & is for updating the value
        activeTask.updateEligible(virtualTime); // update eligible of each activeTask according to latest vt and ve
    }
}

void updateTimeStamp(){
    updateActualTime();
    updateVirtualTime();
    for(auto& activeTask : activeTaskQueue){ // & is for updating the value 
        activeTask.stopRunning(timeQuantum); // task can only run for one timestride for each request
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

    // manually creat some tasks, Task(int id, float weight, float requestLength, float spawnTime, float destroyTime)
    // Task task1(1, 2.0f, 2.0f, 0.0f, 999.0f); taskQueue.push_back(task1);
    // Task task2(2, 2.0f, 1.0f, 1.0f, 999.0f); taskQueue.push_back(task2);

    Task task1(1, 2.0f, 2.56f, 0.0f, 999.0f); taskQueue.push_back(task1);
    Task task2(2, 2.0f, 1.38f, 0.0f, 999.0f); taskQueue.push_back(task2);
    Task task3(3, 2.0f, 3.66f, 0.0f, 999.0f); taskQueue.push_back(task3);
    Task task4(4, 2.0f, 4.87f, 0.0f, 999.0f); taskQueue.push_back(task4);
    Task task5(5, 2.0f, 5.23f, 0.0f, 999.0f); taskQueue.push_back(task5);
    Task task6(6, 2.0f, 3.39f, 0.0f, 999.0f); taskQueue.push_back(task6);
    Task task7(7, 2.0f, 0.88f, 0.0f, 999.0f); taskQueue.push_back(task7);
    Task task8(8, 2.0f, 9.23f, 0.0f, 999.0f); taskQueue.push_back(task8);

    while(true){ // one iteration represents a new second
        // At the beginning of each second
        updateActiveTaskQueue(); // check whether spawn new tasks and add to activeTaskQueue
        updateTasksAttr(); // update vd ve of waiting tasks

        // during each second
        // Todo: check pingpong operations complete, and decides number of tasks to run
        int tasksNum = 3; 
        bool pingpongDone = true;
        selectMutilpleTasksToRun_sort(tasksNum); // choose tasks to run

        // at the end of each second
        updateTimeStamp(); // move to next second
    };
    return 0;
}