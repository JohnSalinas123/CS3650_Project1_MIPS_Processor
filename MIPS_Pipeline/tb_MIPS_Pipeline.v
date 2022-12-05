

`timescale 1ps/1ps
module tb_MIPS_Pipeline();

reg clk,rst_n;
reg [31:0] cnt;

initial
begin            
    $dumpfile("MIPS_wave.vcd");        //���ɵ�vcd�ļ�����
    $dumpvars(0, tb_MIPS_Pipeline);    //tbģ������
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