/*
	This module works the same as the Single Cycle implementation
*/
module Imm_Sign_Extend(

    input       [15:0]  Immediate,

    output      [31:0]  SignImm
);
    assign  SignImm = {{16{Immediate[15]}}, Immediate[15:0]};
endmodule