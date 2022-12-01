/*
	This module is used for sign extension.
	It will pad 16 bits.
*/
module Imm_Sign_Extend(
    input       [15:0]  Immediate,

    output      [31:0]  SignImm
);
    assign  SignImm = {{16{Immediate[15]}}, Immediate[15:0]};
endmodule