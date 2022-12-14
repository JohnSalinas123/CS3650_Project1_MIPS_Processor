/*
    The PC counter module is nearly identical to the Single Cycle Implementation
    The different is we now need to keep track and know when we are jumping or just moving forward in the program
*/
module PC_Counter(
    input        clk,
    input        rst_n,

    input                   PCSrcD,
    input                   StallF,
    input           [31:0]  PCBranchD,
    input                   JumpD,
    input           [25:0]  InstrD_Low25Bit,
    output          [31:0]  PCPlus4F,
    output   reg    [31:0]  PC
);

    wire    [31:0] PC_Next,PC_Next_or_Jump,PC_Jump;
    wire    [31:0] PCPlus4;

    assign  PC_Next = PCSrcD ? PCBranchD : PCPlus4F;
    assign  PC_Jump = {{PCPlus4F[31:28]},{InstrD_Low25Bit},{2'b00}};
    assign  PCPlus4 = PC + 32'd4;
    assign  PCPlus4F = PCPlus4;
    assign  PC_Next_or_Jump = JumpD ? PC_Jump : PC_Next;


    always @(posedge clk) begin
        if(~rst_n)begin
            PC <= 32'b0;
        end
        else if (StallF) begin
            PC <= PC;
        end
        else 
            PC <= PC_Next_or_Jump;
    end

endmodule
