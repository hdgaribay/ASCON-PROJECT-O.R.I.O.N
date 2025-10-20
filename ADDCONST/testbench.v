`timescale 1ns / 1ps
module testbench();
reg [63:0] in;
reg [3:0] a, i;
wire [63:0] out;
add_constants u1(in, i, a, out);
initial begin
$dumpfile("dump.vcd");
$dumpvars(0, testbench);
end
initial begin
in = 64'h123456789abcdef;
i = 5; a = 4;
#100;
end
endmodule
