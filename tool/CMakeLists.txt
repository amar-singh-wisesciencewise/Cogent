add_executable(cogent
    Main.cpp
    ../lib/Cogent.cpp
    ../lib/CogentAnalysis.cpp
    )

target_link_libraries(cogent 
    LLVMCore
    LLVMIRReader
    LLVMPasses
    LLVMSupport)
target_include_directories(cogent PRIVATE "../include")
