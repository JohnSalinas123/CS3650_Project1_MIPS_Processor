/*
    CS3650 Project 1 MIPS Single Cycle Processor
    This is our test bench. It will read machine code in the memfile.dat file.
    The lw, sw, add, addi, sub, or, and, slt, jump, beq instructions are tested
    Results are written to MEM_Data.txt

    To build/run/view waveforms for this program you can follow these steps:
    $ iverilog -o MIPS_wave -y ./ tb_MIPS_Single_Cycle.v
    $ vvp -n MIPS_wave --lxt2
    $ gtkwave MIPS_wave.vcd
*/
`timescale 1ps/1ps
module tb_MIPS_Single_Cycle();

//Set up registers
reg clk,rst_n;
reg [31:0] cnt;

initial

begin            
    $dumpfile("MIPS_wave.vcd");
    $dumpvars(0, tb_MIPS_Single_Cycle);
end
//main program
initial begin
    clk <= 1'b0;
    rst_n <= 1'b0;
    cnt <= 32'b0;

    #10
    clk <= 1'b1;

    #10
    clk <= 1'b0;
    rst_n <= 1'b1;

    forever begin
        #10 clk <= ~clk;
    end

end
//registers are treated as wires in always blocks
always @(negedge clk) begin
    cnt <= cnt + 1'b1;
    if (cnt >= 17) begin
        $stop;
    end
end

//This references our "entry point" for the program. 
//It is the main file that will utilize all other needed files for the program to run
MIPS_Single_Cycle u_MIPS_Single_Cycle(
    .clk(clk),
    .rst_n(rst_n)
);

endmodule