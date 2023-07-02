#===============================================================================
# See: https://llvm.org/docs/CMake.html#developing-llvm-passes-out-of-source
#===============================================================================
add_library(Cogent MODULE
    Cogent.cpp
    CogentAnalysis.cpp)

target_include_directories(Cogent PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/../include")
