/*
    CS3650 Project 1 MIPS Single Cycle Processor
    This is our test bench. It will read machine code in the memfile.dat file.
    This is the 5 Stage Pipeline implementation

    To build/run/view waveforms for this program you can follow these steps:
    $ iverilog -o MIPS_wave -y ./ tb_MIPS_Pipeline.v
    $ vvp -n MIPS_wave --lxt2
    $ gtkwave MIPS_wave.vcd
*/
`timescale 1ps/1ps
module tb_MIPS_Pipeline();

reg clk,rst_n;
reg [31:0] cnt;

initial
begin            
    $dumpfile("MIPS_wave.vcd");
    $dumpvars(0, tb_MIPS_Pipeline);
end

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

always @(negedge clk) begin
    cnt <= cnt + 1'b1;
    if (cnt >= 25) begin
        $stop;
    end
end


MIPS_Pipeline u_MIPS_Pipeline(
    .clk(clk),
    .rst_n(rst_n)
);

endmodule