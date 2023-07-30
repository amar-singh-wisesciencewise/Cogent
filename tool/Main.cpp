//===-- Main.cpp ----------------------------------------------------------===//
// Copyright (C) 2023  AMAR SINGH
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.
//===----------------------------------------------------------------------===//
//
// \file
// COGENT (COMPUTER GENERATOR)
// A command-line LLVM tool to identify suitable computer architecture for the code.
//
// This tool after going through the LLVM IR(.ll) file of the code,
// can list which all features should be present on microprocessor used to run this code.
//
// So this tool generates the possible computer for the code.
// Thus the tool name COGENT (COMPUTER GENERATOR)
//
// This tool analyze the .ll(LLVM IR) file and identify the features in the code.
// It can identify some of the below features suitable for computer:
// 1. Which all supported opcodes should be there on the microprocessor.
// 2. How much depth is needed in Prediction Table. Prediction Table is buffer present in
// FETCH stage which stores PC for branch instruction.
// 3. How much out-of-order execution needed for this code.
// 4. Tool can also try to identify complex instructions if pattern appears in the code.
// Like operation to multiply and add with constant (2X + 3)
//
// IDEA: Basically COGENT tool will try to extract every feature mentioned in
// every computer architecture paper ever written. With the advent of RISCV, every computer
// architecture paper ever written has become relevant since, RISCV microprocessor would be
// specifically designed for the application. Every application has different requirement and
// can benefit from all the older computer architectures paper. This tool will try to analyze
// and extract computer architecture features so that user can use that information to
// design proper RISCV computer for their application.
//
// USER:
// This tool can be used by someone trying to figure out what kind of computer architecture is
// suitable for their application. This can also be used by someone to identify which computer
// architecture is suitable for their algorithm.
//
// PROBLEM: Problem is only that COGENT is only useful for applicationis already existing and
// user is trying to switch to new computer architecture.
//
// PLEASE SUPPORT TO IMPLEMENT THIS OPSOURCE TOOL SO THAT APPLICATION CAN IDENTIFY ITS
// SUITABLE COMPUTER ARCHITECTURE AND RUN SMOOTHLY, FAST AND WITH LEAST POWER.
//===----------------------------------------------------------------------===//

#include "Cogent.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;

// A category for the options specified for this tool.
static cl::OptionCategory CogentCategory("cogent pass options");

// A required argument that specifies the module that will be Analyzed.
static cl::opt<std::string> InputModule(cl::Positional,
                                        cl::desc("<Input module>"),
                                        cl::value_desc("bitcode filename"),
                                        cl::init(""), cl::Required,
                                        cl::cat(CogentCategory));

int main(int Argc, char **Argv) {
    // Hide all options apart from the ones specific to this tool.
    cl::HideUnrelatedOptions(CogentCategory);

    // Parse the command-line options that should be passed to the invariant pass.
    cl::ParseCommandLineOptions(
        Argc, Argv, "Generate the Computer for input opt(.ll) module file.\n");

    // Makes sure llvm_shutdown() is called (which cleans up LLVM objects)
    // http://llvm.org/docs/ProgrammersManual.html#ending-execution-with-llvm-shutdown
    llvm_shutdown_obj SDO;

    // Parse the IR file passed on the command line.
    SMDiagnostic Err;
    LLVMContext Ctx;
    std::unique_ptr<Module> M = parseIRFile(InputModule.getValue(), Err, Ctx);

    if (!M) {
        errs() << "Error reading bitcode file: " << InputModule << "\n";
        Err.print(Argv[0], errs());
        return -1;
    }

    // Create a FunctionPassManager and add the CogentPrinterPass to it;
    FunctionPassManager FPM;
    FPM.addPass(cogent::CogentPrinterPass(errs()));

    // Create a FunctionAnalysisManager and add the OpcodeListAnalysis to it:
    FunctionAnalysisManager FAM;
    FAM.registerPass([&] { return cogent::OpcodeListAnalysis(); });
    FAM.registerPass([&] { return cogent::PredictionTableLengthAnalysis(); });

    // Register the module analyses:
    PassBuilder PB;
    PB.registerFunctionAnalyses(FAM);

    // Finally, run the passes registered with FPM.
    for (Function &F : *M) FPM.run(F, FAM);

    return 0;
}
