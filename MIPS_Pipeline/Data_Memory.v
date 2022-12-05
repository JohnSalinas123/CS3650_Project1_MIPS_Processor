/*
    This module is used for writing data to the MEM_DATA.txt file
*/
module Data_Memory(
    input        clk,
    input        rst_n,

    input           [31:0]  A,
    input           [31:0]  WD,
    input                   WE,

    output   reg    [31:0]  RD
);
    integer fd;
    reg [31:0]  DATA_MEM[84:0];

    initial begin
        fd = $fopen("./MEM_Data.txt", "w");  
        #500
        $fclose(fd);
    end

    always @(*) begin
        RD = DATA_MEM[A];
    end

    always @(posedge clk) begin
        if (WE) begin
            DATA_MEM[A] <= WD; 
            $fdisplay(fd,"The Write Address A is %h", A);
            $fdisplay(fd,"DATA_MEM[A] is %h", WD);
        end
    end

endmodule