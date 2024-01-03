Different implementation for ISCA2024 submission "DynMap: A High-Speed High-Quality Hardware Dynamic Mapper for Emerging Multi-Task CGRA", including:
1. DynMap_Cpp: C++ implementation of DynMap, C++11 standard
2. DynMap_Cpp4HLS: C++ implementation of DynMap, no Standard Template Library (STL) usage, for example, std::vector, std::map
3. DynMap_Python: Python implementation of DynMap, relatively slower (10x) compared with DynMap_Cpp
4. DynMap_VitisHLS: Vitis HLS project for efficient RTL generation, the C++ source files inside are slightly modified based on DynMap_Cpp4HLS to make it appropriate for Vitis HLS 2021.2
