# Cogent
# COGENT (COMPUTER GENERATOR)

A command-line LLVM tool to identify suitable computer architecture for the code.

This tool after going through the LLVM IR(.ll) file of the code,
can list which features should be present on the microprocessor used to run this code.

So this tool generates the possible computer for the code.
Thus the tool name COGENT (COMPUTER GENERATOR)

This tool analyzes the .ll(LLVM IR) file and identifies the features in the code.
It can identify some of the below features suitable for computers:
1. All supported opcodes should be there on the microprocessor.
2. How much depth is needed in the Prediction Table. The prediction Table is a buffer present in
FETCH stage which stores PC for branch instruction.
3. How much out-of-order execution is needed for this code.
4. Tool can also try to identify complex instructions if a pattern appears in the code.
Like the operation to multiply and add with constant (2X + 3)

# IDEA:
Basically COGENT tool will try to extract every feature mentioned in
every computer architecture paper ever written. With the advent of RISCV, every computer
architecture paper ever written has become relevant since the RISCV microprocessor would be
specifically designed for the application. Every application has different requirements and
can benefit from all the older computer architectures paper. This tool will try to analyze
and extract computer architecture features so that users can use that information to
design proper RISCV computers for their application.

## COGENT USER:
This tool can be used by someone trying to figure out what kind of computer architecture is
suitable for their application. This can also be used by someone to identify which computer
architecture is suitable for their algorithm.

## PROBLEM:
The problem is only that COGENT is only useful for applications already existing and
user is trying to switch to new computer architecture.

### PLEASE SUPPORT IMPLEMENTING THIS OPEN-SOURCE TOOL SO THAT THE APPLICATION CAN IDENTIFY ITS
### SUITABLE COMPUTER ARCHITECTURE FOR RUNNING SMOOTHLY, FAST, AND WITH THE LEAST POWER.

## BUILD PROCESS:
Define the path variables of LLVM Project and OPT Tool.

For instance, if you built LLVM from the source the commands above will be like this:

$> LLVM_INSTALL_DIR=/home/amar/AMAR/LLVM/llvm-project/build

$> LLVM_OPT=$LLVM_INSTALL_DIR/bin/opt

Then, run CMake to prepare the build files. We will use the folder build for that ( create one in the Cogent folder ). You can use any build tool that you want, e.g. ninja or make. In this example, we are using "make".

$> cmake -DLLVM_INSTALL_DIR=$LLVM_INSTALL_DIR -G "Unix Makefiles" -B build/ .

Next, move to the build folder and build the project:

$> cd build

$> make

Above "make" command if successful will build Cogent in the Cogent/build/bin folder.

## Running the Cogent tool:
$> build/bin/cogent testing/project.ll

project.ll is OPT file of your complete project. "testing/project.ll" will have instructions
and code for demonstrating every FEATUREs.

## CURRENT STATUS:
FEATURE 1 is implemented and lists all the LLVM opcodes required in the Computer. This feature
currently lists all the opcodes even basic ones.

FEATURE 2: The depth of the Prediction Table is under process.
