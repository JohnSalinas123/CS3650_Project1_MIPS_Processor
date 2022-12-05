/*
    This module is used to help control branching. Branching is used as a solution to control hazards.
    This works by stalling and waiting for the branch to finish executing before allowing it to move forward
*/
module Branch_Unit(
    input           BranchD,
    input   [31:0]  SignImm,
    input   [31:0]  PCPlus4D,
    input   [31:0]  RD1,
    input   [31:0]  RD2,
    input   [31:0]  ALUOutM,
    input           ForwardAD,
    input           ForwardBD,

    output  [31:0]  PCBranchD,
    output          PCSrcD
);
    wire [31:0] Branch_Check_RD1,Branch_Check_RD2;
    wire        EqualD;

    assign  Branch_Check_RD1 = ForwardAD ? ALUOutM : RD1;
    assign  Branch_Check_RD2 = ForwardBD ? ALUOutM : RD2;

    assign EqualD = (Branch_Check_RD1 == Branch_Check_RD2) ? 1'b1 : 1'b0;

    assign PCSrcD = EqualD && BranchD;

    assign PCBranchD = PCPlus4D + (SignImm << 2);

endmodule