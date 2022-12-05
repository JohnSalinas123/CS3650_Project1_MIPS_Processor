# CS3650_Project1_MIPS_Processor
	Daniel Chittenden John Salinas Tatsiana Uryeva
	Project 1: Certified Pre Owned Processor

Contributions: We all contributed to the project equally. We got together in discord to study, plan, and work simultaneously. This helped us as we walked through the source code and learned how it worked and exactly what it was doing. We all contributed to the readme and commented/explained the source code.

Sources: Hola39e/MIPS_Multi_Implementation: MIPS Single Cycle/Multi Cyle/5-Stage Pipeline Verilog Implementation (github.com)

During the course of this project we learned a lot about how a processor works from a programmatic point of view. This helped us connect some dots that cleared up how it works as a whole.

Instructions
We learned that the first 2 steps in the process are the same for all instructions.
The first step is to prepare the pc by setting it and fetching the instruction from memory. Second we read the register(s). From here on out the process starts to change based on the instruction type.
Memory-reference instructions use ALU for address calc at this point
Arithmetic-logic instructions use ALU for arithmetic operations
Branch instructions use ALU for comparisons

Control Unit
The control unit (which is different then the ALU control unit) is an integral part of the process. It takes in the opcode and outputs the ALUOp as well as several over single bit pieces of information. This information is used to determine the control lines used for this cycle. The 2 ALUOp bits are sent to the ALU control unit.

ALU
We can think of the ALU as two parts, first there is the Control Unit then there is the actual ALU. 
The control unit will take in the ALUOp bits and function codes to set up the control input for the ALU. The 2bit ALUOp is derived from the 6bit opcode of the instruction. The 2 bit ALUOp and the 6 bit funct is then sent to the ALU control which determines the bits sent to the ALU. An important thing to know is that the ALU Control Unit is separate from the main Control Unit of the CPU. They serve different purposes. 



Data Paths
We learned that data paths can change based on the instruction given. For example, the data path for an R-type instruction is much different than one for a load instruction. Data paths are primarily set by the main control unit.

5 Stage Pipeline
In pipelined MIPS processor, a forwarding and stalling units is responsible for solving data hazards. A data hazard is invoked when the source register of the current instruction is the same as the destination register of the previous instruction.When this data hazard is detected the data at the output of the ALU is forwarded to the input of ALU.
A data hazard is also invoked when destination register of the current instruction is the same as the source register of the next instruction. This data hazard is resolved by stalling unit which delays it one cycle before proceeding. The 5 stages are IF, ID, EX, MEM, WB which are Instruction Fetch, Instruction decode and register file read, Execution or address calculation, Data Memory Access and Write Back. 

5 Stage
![alt text](http://url/to/img.png)

Single Cycle
![alt text](https://github.com/JohnSalinas123/CS3650_Project1_MIPS_Processor/blob/main/pipeline_image.PNG)
