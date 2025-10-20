`timescale 1ns / 1ps
module testbench();
reg [63:0] x;
reg [5:0] loop;
wire [63:0] out;
rotate u1(x, out, loop);
initial begin
$dumpfile("dump.vcd");
$dumpvars(0, testbench);
end
initial begin
x = 64'h80400c0600000000;
loop = 6'd19;
#10;
end
endmodule
