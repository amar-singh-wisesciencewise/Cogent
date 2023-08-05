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
#include "llvm/Analysis/LoopInfo.h"
#include <deque>

using namespace llvm;

namespace cogent {

// Initialize the analysis key.
AnalysisKey OpcodeListAnalysis::Key;
AnalysisKey PredictionTableLengthAnalysis::Key;

//TODO: Current Analysis is per function change it to handle Module or all functions
// in the moodule.

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

PredictionTableLengthAnalysis::Result PredictionTableLengthAnalysis::run(Function &F,
		FunctionAnalysisManager &AM) {
	//Get the results of LoopAnalysis i.e. LoopInfo
	auto &LI = AM.getResult<LoopAnalysis>(F);
	// Structure to return the result of Analysis 
	PredictionTableLengthAnalysis::Result res;
	res.LoopDepth = 0;

	// There are no loops in the function. Return before computing other expensive
	// analyses.
	if (LI.empty())
		return (res);

	// Get the Loop Depth of the function.
	std::deque<const Loop *> Worklist;
	llvm::append_range(Worklist, LI);
	while (!Worklist.empty()) {
	  const auto *L = Worklist.front();
	  res.LoopDepth =
	      std::max(res.LoopDepth, static_cast<int32_t>(L->getLoopDepth()));
	  Worklist.pop_front();
	  llvm::append_range(Worklist, L->getSubLoops());
	}
#if 0
	for (auto &L : LI)
		res.LoopDepth =
			std::max(res.LoopDepth,static_cast<int32_t>(L->getLoopDepth()));
#endif
	return (res);
}

PreservedAnalyses CogentPrinterPass::run(Function &F,
                                           FunctionAnalysisManager &FAM) {
    auto &AllInsts = FAM.getResult<OpcodeListAnalysis>(F);
    auto DepthLoop = FAM.getResult<PredictionTableLengthAnalysis>(F);
    OS << "=============================================\n";
    OS << "FEATURE1: List of all the Opcodes getting used in the project \n";
    OS << "=============================================\n";
    for (auto &All : AllInsts)
	    OS << All->getOpcodeName() << "\n";
    OS << "=============================================\n";
    OS << "=============================================\n";
    OS << "FEATURE2: Depth of loops in the Project \n";
    OS << "=============================================\n";
    OS << "Max Loop Depth is: " << DepthLoop.LoopDepth << "\n";
    OS << "=============================================\n";
    return PreservedAnalyses::all();
}
} // namespace cogent
