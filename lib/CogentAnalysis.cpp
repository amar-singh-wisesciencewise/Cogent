//===-- CogentAnalysis.cpp ----------------------------------------------===//
// Copyright (C) 2023 AMAR SINGH
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
///
/// \file
/// This file contains the implementation of the OpcodeListAnalysis pass as well
/// as the CogentPrinterPass.
//===----------------------------------------------------------------------===//

#include "Cogent.h"
#include "llvm/IR/Constants.h"
#include "llvm/Support/Casting.h"

using namespace llvm;

namespace cogent {

// Initialize the analysis key.
AnalysisKey OpcodeListAnalysis::Key;

bool isOpcodePresent(SmallVector<Instruction *, 0> AllInsts, unsigned Opcode)
{
    for (auto &All : AllInsts)
	    if(All->getOpcode() == Opcode)
		    return (1);
    return (0);
}

OpcodeListAnalysis::Result OpcodeListAnalysis::run(Function &F,
                                               FunctionAnalysisManager &FAM) {
    SmallVector<Instruction *, 0> AllInsts;
    for (BasicBlock &BB : F) {
        for (Instruction &I : BB) {
		// Push the instruction if not present
		if (!isOpcodePresent(AllInsts, I.getOpcode()))
		    AllInsts.push_back(&I);
        }
    }
    return AllInsts;
}

PreservedAnalyses CogentPrinterPass::run(Function &F,
                                           FunctionAnalysisManager &FAM) {
    auto &AllInsts = FAM.getResult<OpcodeListAnalysis>(F);
    OS << "=============================================\n";
    OS << "FEATURE1: List of all the Opcodes getting used in the project \n";
    OS << "=============================================\n";
    for (auto &All : AllInsts)
	    OS << All->getOpcodeName() << "\n";
    OS << "=============================================\n";
    return PreservedAnalyses::all();
}
} // namespace cogent
