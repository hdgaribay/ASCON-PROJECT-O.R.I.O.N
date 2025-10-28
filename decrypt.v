module decrypt
(
input [63:0] x0, x1, x2, x3, x4, ///state in
input [63:0] cyp0, cyp1, ///two ciphertext blocks
output [63:0] pln0, pln1, ///two plaintext blocks (now outputs)
output[63:0] y0,y1,y2,y3,y4 ///state out
);

wire [63:0] x0_a, x0_b;


// block 0
assign x0_a = x0 ^ cyp0; //absorb CT0 into rate
assign pln0 = x0_a; //emit PT0 from rate (now output)
wire [63:0] b0, b1, b2, b3, b4; //state after p6
p6 u_p6_0 (.x0(x0_a), .x1(x1), .x2(x2), .x3(x3), .x4(x4),.y0(b0), 
			.y1(b1), .y2(b2), .y3(b3), .y4(b4));
// block 1
assign x0_b = b0 ^ cyp1; //absorb ciphertext 1 into new rate
assign pln1 = x0_b; //emit plaintext 1 from rate (now output)
p6 u_p6_1 (.x0(x0_b), .x1(b1), .x2(b2), .x3(b3), .x4(b4),.y0(y0), 
			.y1(y1), .y2(y2), .y3(y3), .y4(y4));
endmodule
