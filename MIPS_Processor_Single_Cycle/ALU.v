/*
    This module is arithmatic logic unit, it preforms the mathematical operations that need preformed.
*/
module ALU(
    input       [31:0]  SrcA,
    input       [31:0]  SrcB,
    input       [2:0]   ALUControl,
    output  reg [31:0]  ALUResult,
    output              Zero
);

    //The operation preform is based on the ALUControl module. This will return a result of the arithmetic
    always @(*) begin
        case (ALUControl)
            3'b010 : begin
                ALUResult = SrcA + SrcB;
            end 
            3'b110 : begin
                ALUResult = SrcA - SrcB;
            end
            3'b000 : ALUResult = SrcA & SrcB;
            3'b001 : ALUResult = SrcA | SrcB;
            3'b111 : ALUResult = (SrcA < SrcB) ? 32'b1 : 32'b0;
            default: ;
        endcase
    end

    assign Zero = (ALUResult) ? 1'b0 : 1'b1;

endmodule