module initialization(IV, k0, k1, n0, n1, y0, y1, y2, y3, y4);
	input [63:0] IV, k0, k1, n0, n1; //64 bit IV, 128 bit Key, 128 bit nonce
	output [63:0] y0, y1, y2, y3, y4; //320 bit initial state output
	
	wire [63:0] t0, t1, t2, t3, t4;

	p12 u1(IV, k0, k1, n0, n1, y0, y1, y2, t3, t4); // 12 round initial permutations
	assign y3 = t3^k0; // xor secret key to lSW's
	assign y4 = t4^k1;
endmodule

