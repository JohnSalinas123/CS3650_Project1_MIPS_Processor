/*
    This module sets up the ALU control input. It intakes the 2 bit ALUOp and the 6bit funct (r-type). It will output a 3bit number.
    The 3bit number represents the control input for the ALU. The control input determines which operation the ALU preforms.
*/
module ALU_Control_Unit(
    input       [5:0]   Funct,
    input       [1:0]   ALUOp,
    output  reg [2:0]   ALUControl
);

    always @(*) begin
        case (ALUOp)
            2'b00: ALUControl = 3'b010;
            2'b10: begin
                case (Funct)
                    6'b100000 : ALUControl = 3'b010;
                    6'b100010 : ALUControl = 3'b110;
                    6'b100100 : ALUControl = 3'b000;
                    6'b100101 : ALUControl = 3'b001;
                    6'b101010 : ALUControl = 3'b111;
                endcase
            end
            2'b01: ALUControl = 3'b110;
            default: ;
        endcase
    end


endmodule