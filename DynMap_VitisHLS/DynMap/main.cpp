#include "DynMap_4HLS.hpp"

// run specific test case
int main(){
    char DynamicPlacement_II_Results_Golden[testCasesNum] = {4,4,4,4,6,6,6,6,11,11,11,11,
															4,4,5,4,6,6,6,6,11,11,11,11,
															4,4,5,4,6,6,6,6,8,8,8,8,
															4,5,4,5,6,6,6,6,8,8,8,8,
															4,4,4,4,5,5,5,5,6,6,6,6,
															4,4,4,4,5,5,5,5,5,5,5,5}; // ground truth for 72 testcases
    char testCaseIdx = 0; // manually chose test case

    // Call the function and compare the results file with the golden results
    int retval = (runOne(testCaseIdx) == DynamicPlacement_II_Results_Golden[testCaseIdx]) ? 0 : 1;
    if (retval == 1) {
        cout << "Test failed  !!!" << endl;
    } else {
        cout << "Test passed !" << endl;
    }

    // Return 0 if the test passed
    return retval;
}

//// run all test cases
//int main(){
//    // Save the results to a file
//    int retval = 0;
//    char DynamicPlacement_II_Results[testCasesNum];
//	ofstream FILE;
//
//	// Call the function
//    runAll(DynamicPlacement_II_Results);
//
//    // Save the results to a file
//	FILE.open("result.dat");
//    for(char i = 0; i < testCasesNum; i++) {
//        FILE << int(DynamicPlacement_II_Results[i]) << endl;
//    }
//    FILE.close();
//
//    // Compare the results file with the golden results
//    retval = system("diff --brief -w result.dat result.golden.dat");
//    if (retval != 0) {
//        cout << "Test failed  !!!" << endl;
//        retval = 1;
//    } else {
//        cout << "Test passed !" << endl;
//    }
//
//    // Return 0 if the test passed
//    return retval;
//}
