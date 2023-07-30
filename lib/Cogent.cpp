//===-- Cogent.cpp ------------------------------------------------===//
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
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//===----------------------------------------------------------------------===//
///
/// \file
/// This file is the entry point for the New PM opt plugin. That is, it
/// contains the New PM registration for all the analyses and transformations
/// related to the Cogent plugin.
//===----------------------------------------------------------------------===//
//
#include "Cogent.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

using namespace llvm;

// Takes a FunctionAnalysisManager \p FAM and uses it to register all the
// analyses created, so any pass can request their results.
void registerAnalyses(FunctionAnalysisManager &FAM) {
	FAM.registerPass([] { return cogent::OpcodeListAnalysis(); });
	FAM.registerPass([] { return cogent::PredictionTableLengthAnalysis(); });
}

// Takes the Pass Name of a pass and check if it is the name of
// any of the passes implemented.
// If so, add it to the FunctionPassManager FPM.
// \returns true if Pass Name corresponds to any of the passes implemented;
// otherwise, returns false.
bool registerPipelineCB(StringRef Name, FunctionPassManager &FPM,
                      ArrayRef<PassBuilder::PipelineElement>) {
    if (Name == "cogent") {
        FPM.addPass(cogent::CogentPrinterPass(errs()));
        return true;
    }

    return false;
}

PassPluginLibraryInfo getCogentPluginInfo() {
	return {LLVM_PLUGIN_API_VERSION, "Cogent", LLVM_VERSION_STRING,
		[](PassBuilder &PB) {
		// 1: Register the OpcodeListAnalysis as an analysis pass so that
		// it can be requested by other passes as following:
		// FPM.getResult<OpcodeListAnalysis>(F), where FPM is the
		// FunctionAnalysisManager and F is the Function that shall be
		// analyzed.
		PB.registerAnalysisRegistrationCallback(registerAnalyses);

		// 2: Register the CogentPrinterPass as "cogent" so
		// that it can be used when specifying pass pipelines with
		// "-passes=".
		PB.registerPipelineParsingCallback(registerPipelineCB);
		}};
}

// The public entry point for a pass plugin:
extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getCogentPluginInfo();
}
