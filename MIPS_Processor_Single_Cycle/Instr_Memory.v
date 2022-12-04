/*
	This module is used to read instructions from the memfile
	The instructions are stored for the program to use.
*/
module Instr_Memory(
    input   [31:0]  A,
    output  [31:0]  RD
    
);
	reg [7:0] Instr_Reg [71:0];
	initial begin
		$readmemh("./memfile.dat",Instr_Reg,0,71);
	end
	// This is the important part here, it sets up our instruction like so: [op(6bit) rs(5bit) rd(5bit) imm(16bit)]
    assign RD = {{Instr_Reg[A]},{Instr_Reg[A+32'd1]},{Instr_Reg[A+32'd2]},{Instr_Reg[A+32'd3]}};

endmodule