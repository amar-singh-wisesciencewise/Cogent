//===-- Cogent.h ----------------------------------------------*- C++ -*-===//
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
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//===----------------------------------------------------------------------===//
// This file contains the header for Cogent project
// Will have declaration of passes used in Cogent project
//===----------------------------------------------------------------------===//

#ifndef COGENT_H
#define COGENT_H

#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/PassManager.h"

namespace cogent {

// An analysis that traverses a function and collects all the opcodes
// instructions
struct OpcodeListAnalysis : public llvm::AnalysisInfoMixin<OpcodeListAnalysis> {
	// Result of the analysis: a list of instructions
	using Result = llvm::SmallVector<llvm::Instruction *, 0>;
	// Traverses the functions, collect all the instructions.
	Result run(llvm::Function &F, llvm::FunctionAnalysisManager &FAM);
	// A special type used by analysis passes to provide an address that
	// identifies that particular analysis pass type.
	static llvm::AnalysisKey Key;
};

// An analysis that traverses a function and collects the depth of nested loops.
// Basically number of nested loops and internal branches in the innermost loop
// will give idea about maximum entires are needed in Predication Table used
// in FETCH stage of CPU.
struct PredictionTableLengthAnalysis : public llvm::AnalysisInfoMixin<PredictionTableLengthAnalysis> {
	// Result of the analysis: Depth of Prediction Table
	struct Result{
		int LoopDepth;
	};
	// Traverses the functions, collect all the instructions.
	Result run(llvm::Function &F, llvm::FunctionAnalysisManager &FAM);
	// A special type used by analysis passes to provide an address that
	// identifies that particular analysis pass type.
	static llvm::AnalysisKey Key;
};

/* ADD ALL THE ANALYSIS PASSES ABOVE */

// A Pass to Traverse the Analysis Pass output and interpret and display that output
struct CogentPrinterPass : public llvm::PassInfoMixin<CogentPrinterPass> {
	// Takes a ostream \p OS and constructs an instance of the CogentPrinterPass
	explicit CogentPrinterPass(llvm::raw_ostream &OS) : OS(OS) {}
	// \returns llvm::PreservedAnalyses::all(), since nothing changed.
	llvm::PreservedAnalyses run(llvm::Function &F,
			llvm::FunctionAnalysisManager &FAM);
	private:
	llvm::raw_ostream &OS;
};
} // namespace cogent
#endif
