/*
    This module works as the Instruction Fetch and Instruction Decode & Register File Read stage.
*/
module IF_ID_Register(
    input        clk,
    input        rst_n,

    input               StallD,
    input               PCSrcD,
    input               JumpD,
    input       [31:0]  PCPlus4F,
    input       [31:0]  Instr,

    output  reg [31:0]  PCPlus4D,
    output  reg [31:0]  InstrD
);

    always @(posedge clk ) begin
        if (~rst_n) begin
            PCPlus4D <= 32'b0;
            InstrD <= 32'b0;
        end
        else if (PCSrcD || JumpD) begin
            InstrD <= 32'b0;
            PCPlus4D <= 32'b0;
        end
        else if (StallD) begin
            PCPlus4D <= PCPlus4D;
            InstrD   <= InstrD;
        end
        else begin
            // total 64bits
            PCPlus4D <= PCPlus4F;
            InstrD   <= Instr;
        end
    end

endmodule