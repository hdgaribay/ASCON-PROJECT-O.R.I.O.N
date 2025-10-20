`timescale 1ns / 1ps
module testbench();
reg [63:0] iv, k0, k1, n0, n1;
wire [63:0] s0, s1, s2, s3, s4;
linear u1(iv,k0,k1,n0,n1,s0,s1,s2,s3,s4);
initial begin
$dumpfile("dump.vcd");
$dumpvars(0, testbench);
end
initial begin
n0 = 64'h369C801F3AE8D0EA;
n1 = 64'h9BF367D58FD211FF;
k0 = 64'h265F1C12888E151A;
k1 = 64'hC74F26B30A8C44B2;
iv = 64'h80400C0600000000;
#10;
		  
end
endmodule
