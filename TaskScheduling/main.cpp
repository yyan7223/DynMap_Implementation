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

void updateActiveTaskQueue(){
    for(auto task : taskQueue){
        if(task.st == actualTime){
            activeTaskQueue.push_back(task);
        }
    }
}

void updateTasksAttr(){
    updateWeightSum(); // update sum of weights
    for(auto& activeTask : activeTaskQueue){ // & is for updating the value
        activeTask.updateVE(virtualTime, tasksNum);
        activeTask.updateVD(tasksNum);
    }
    updateTaskDestroyStatus(); // update vt and ve if there are tasks destoryed, 
    for(auto& activeTask : activeTaskQueue){ // & is for updating the value
        activeTask.updateEligible(virtualTime); // update eligible of each activeTask according to latest vt and ve
    }
}

void stopRunningTasks(){
    for(auto& activeTask : activeTaskQueue){ // & is for updating the value 
        activeTask.stopRunning(timeQuantum); // task can only run for one timestride for each request
    }
}

// // examples in the paper
// int selectMutilpleTasksToRun(int tasksNum){
//     // firstly find eligible tasks
//     eligibleTaskQueueIdx.clear();
//     for(int i = 0; i < activeTaskQueue.size(); i++){ 
//         if(activeTaskQueue[i].eligible) eligibleTaskQueueIdx.push_back(i);
//     }

//     // select one of the eligible tasks to run
//     int minIdx = 0;
//     if(eligibleTaskQueueIdx.size() <= 1){ // if only one or less eligible task, default select the first task to run
//         activeTaskQueue[eligibleTaskQueueIdx[minIdx]].startRunning(timeQuantum); 
//     }
//     else{ // if several tasks are eligible
//         float minVD = 9999.0f;
//         for(int i = 0; i < eligibleTaskQueueIdx.size(); i++){ // choose the one with the minimum vd to run
//             if(activeTaskQueue[eligibleTaskQueueIdx[i]].vd < minVD){
//                 minVD = activeTaskQueue[eligibleTaskQueueIdx[i]].vd;
//                 minIdx = i;
//             }
//         }
//         if(actualTime == 1) minIdx = 1; // a hardcoded task choice inidcated by paper as eligible and deadline of both tasks are same
//         for(int i = 0; i < tasksNum; i++){
//             activeTaskQueue[eligibleTaskQueueIdx[minIdx + i]].startRunning(timeQuantum); 
//         }
//     }
//     cout<<"Time: "<<actualTime<<"s, running task ID: "<<activeTaskQueue[eligibleTaskQueueIdx[minIdx]].ID<<endl; 
//     return minIdx;
// }

void generateNewTaskSets(int tasksNum){
    eligibleTaskQueueIdx.clear();
    ineligibleTaskQueueIdx.clear();
    for(int i = 0; i < activeTaskQueue.size(); i++){ // firstly select eligible tasks
        if(activeTaskQueue[i].eligible) eligibleTaskQueueIdx.push_back(i);
        else ineligibleTaskQueueIdx.push_back(i);
    }

    // first sort eligible tasks based on vd (from small to large)
    int queueLen = eligibleTaskQueueIdx.size();
    for (int i = 0; i < queueLen - 1; i++) { // bubble sort, can be optimized to rb-tree   
        for (int j = 0; j < queueLen - 1 - i; j++) { 
            if (activeTaskQueue[eligibleTaskQueueIdx[j]].vd > activeTaskQueue[eligibleTaskQueueIdx[j+1]].vd) {
                swap(eligibleTaskQueueIdx[j], eligibleTaskQueueIdx[j+1]);
            }
        }
    }

    if(eligibleTaskQueueIdx.size() < tasksNum){ // if insufficient eligible tasks, supplement from ineligible tasks
        int queueLen = ineligibleTaskQueueIdx.size();
        for (int i = 0; i < queueLen - 1; i++) { // bubble sort, can be optimized to rb-tree   
            for (int j = 0; j < queueLen - 1 - i; j++) { 
                if (activeTaskQueue[ineligibleTaskQueueIdx[j]].vd > activeTaskQueue[ineligibleTaskQueueIdx[j+1]].vd) {
                    swap(ineligibleTaskQueueIdx[j], ineligibleTaskQueueIdx[j+1]);
            }
        }
        int diff = tasksNum - eligibleTaskQueueIdx.size();
        for(int i = 0; i < diff; i++) eligibleTaskQueueIdx.push_back(ineligibleTaskQueueIdx[i]); // supplement tasks with small vd
    }
    }
    else if(eligibleTaskQueueIdx.size() > tasksNum){ // if too many eligible tasks, remove some of them
        int diff = eligibleTaskQueueIdx.size() - tasksNum;
        for(int i = 0; i < diff; i++) eligibleTaskQueueIdx.pop_back(); // remove tasks with high vd
    }
    else {};
}

void generateResourceAllocationDecisions(){
    // get the nodes of each eligible tasks, and generate resource allocation decisions
    numTilesPerTask.clear(); 
    int totalTiles = cgra_size * cgra_size;
    int sumWeight = 0;
    for (int i = 0; i < eligibleTaskQueueIdx.size(); i++) sumWeight += activeTaskQueue[eligibleTaskQueueIdx[i]].w;
    for (int i = 0; i < eligibleTaskQueueIdx.size(); i++)
    {
        float weight = (float)activeTaskQueue[eligibleTaskQueueIdx[i]].w / (float)sumWeight;
        numTilesPerTask.push_back(floor(totalTiles * weight)); // resource allocation only cares about number of tiles now
    }
}

void generatePrefetchingDataAmount(){
    // calculate the amount of data of each task that should be loaded under the time quantum of former set of tasks
    numDataPerTask.clear();
    if(actualTime != 0){
        float timeForNewConfig = (float)2 / (float)dma_speed; // assume configuration data has 2Bytes
        float timeForNewdata = timeQuantum - timeForNewConfig;
        int sumWeight = 0;
        for (int i = 0; i < eligibleTaskQueueIdx.size(); i++) sumWeight += activeTaskQueue[eligibleTaskQueueIdx[i]].w;
        for (int i = 0; i < eligibleTaskQueueIdx.size(); i++)
        {
            float weight = (float)activeTaskQueue[eligibleTaskQueueIdx[i]].w / (float)sumWeight;
            float dmaTime = timeForNewdata * weight;
            numDataPerTask.push_back(dma_speed * dmaTime); 
        }
    }
    else{ // the first DMA transfering has no time quantum limit, therefore filling up the memory
        for (int i = 0; i < eligibleTaskQueueIdx.size(); i++)
        {
            numDataPerTask.push_back(memBankCap); 
        }        
    }
}

void generateNewTimeQuantum(){
    execTimePerTask.clear();
    for (int i = 0; i < eligibleTaskQueueIdx.size(); i++)
    {
        execTimePerTask.push_back(activeTaskQueue[eligibleTaskQueueIdx[i]].generateExecuteTime(numDataPerTask[i], memBankCap, numTilesPerTask[i], cgra_freq));
    }
    auto timeQt = min_element(execTimePerTask.begin(), execTimePerTask.end()); // find the smallest as the time quantum
    timeQuantum =  *timeQt;
}

void startRunningNewTaskSets(){
    /////////////////////////////// run the selected tasks for the new time quantum ///////////////////////////////////
    cout<<"Time: "<<actualTime<<"s, running task ID:";
    for(int i = 0; i < eligibleTaskQueueIdx.size(); i++){
        activeTaskQueue[eligibleTaskQueueIdx[i]].startRunning(timeQuantum, cgra_freq); 
        cout<<" "<<activeTaskQueue[eligibleTaskQueueIdx[i]].ID<<","; 
    }
    cout<<endl;
}

void selectMutilpleTasksToRunRunRun(int tasksNum){
    generateNewTaskSets(tasksNum); // generate new task sets during former task sets are executing

    generateResourceAllocationDecisions(); // generate corresponding resource allocation decisions

    // Todo: dynamic mapping / querying statically mapped results

    generatePrefetchingDataAmount(); // generate amount of data of new task sets than can be transferred by DMA during former tasks sets are executing 

    // Todo: issue DMA transfering

    // Todo: stuck here if former tasks sets have not finish exeuction

    generateNewTimeQuantum(); // generate time quantum of new task sets according to prefetched data amount

    startRunningNewTaskSets(); // new task sets should start to run in reality, and becomes former task sets when entering selectMutilpleTasksToRunRunRun() again
}

void updateTimeStamp(){
    updateActualTime();
    updateVirtualTime();
    stopRunningTasks();
}

int main(){

    // manually creat some tasks, Task(int id, float weight, float requestLength, float spawnTime, float destroyTime, int DFGNodesNum, int inputNum)
    // Task task1(1, 2.0f, 2.0f, 0.0f, 999.0f); taskQueue.push_back(task1);
    // Task task2(2, 2.0f, 1.0f, 1.0f, 999.0f); taskQueue.push_back(task2);

    Task task1(0, 2.0f, 2.56f, 0.0f, 999.0f, 26, 1300); taskQueue.push_back(task1);
    Task task2(1, 2.0f, 1.38f, 0.0f, 999.0f, 37, 1500); taskQueue.push_back(task2);
    Task task3(2, 2.0f, 3.66f, 0.0f, 999.0f, 18, 1100); taskQueue.push_back(task3);
    Task task4(3, 2.0f, 4.87f, 0.0f, 999.0f, 33, 2500); taskQueue.push_back(task4);
    Task task5(4, 2.0f, 5.23f, 0.0f, 999.0f, 46, 1000); taskQueue.push_back(task5);
    Task task6(5, 2.0f, 3.39f, 0.0f, 999.0f, 27, 1100); taskQueue.push_back(task6);
    Task task7(6, 2.0f, 0.88f, 0.0f, 999.0f, 31, 2200); taskQueue.push_back(task7);
    Task task8(7, 2.0f, 9.23f, 0.0f, 999.0f, 35, 1700); taskQueue.push_back(task8);

    int count = 500;
    while(count > 0){ // one iteration represents a new second
        // At the beginning of each second
        updateActiveTaskQueue(); // check whether spawn new tasks and add to activeTaskQueue
        updateTasksAttr(); // update vd ve of waiting tasks

        // during each second
        selectMutilpleTasksToRunRunRun(tasksNum); // choose new set of tasks to run

        // at the end of each second
        updateTimeStamp(); // move to next second

        cout<<"eligible status: ";
        for(int i = 0; i < activeTaskQueue.size(); i++){ // firstly select eligible tasks
            cout<<activeTaskQueue[i].eligible<<"";
        }
        cout<<endl;
        count--;
    };
    return 0;
}