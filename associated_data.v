
/*
Assosciated data processing; b round permutation
*/
module associated_data(x0, x1, x2, x3, x4,  y0, y1, y2, y3, y4, d0, d1, d2);
	input [63:0] x0, x1, x2, x3, x4,  d0, d1, d2; // 320 bit state and 192 bit AD
	output [63:0] y0, y1, y2, y3, y4 ; // 320 bit state after AD processing

	wire [63:0] a0, a1, a2, a3, a4, b0, b1, b2, b3, b4; 
	assign a0 = d0^x0; // the rate(first word) is xored with first 64 bits of AD 
	p6 u1(a0, x1, x2, x3, x4, b0, b1, b2, b3, b4); //perform 6 round permutation

	wire [63:0] B0, c0, c1, c2, c3, c4;
	assign B0 = d1^b0;
	p6 u2(B0, b1, b2, b3, b4, c0, c1, c2, c3, c4); 	
	 
	wire [63:0] C0;
	assign C0 = d2^c0;
	p6 u3(C0, c1, c2, c3, c4, y0, y1, y2, y3, y4); 	
	// Domain separation after AD
	assign y4[0] = y4[0]^64'h1;
endmodule

