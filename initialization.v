module initialization(
	input [63:0] IV, k0, k1, n0, n1, //64 bit IV, 128 bit Key, 128 bit nonce
	output [63:0] y0, y1, y2, y3, y4 //320 bit initial state output
);
	wire [63:0] t0, t1, t2, t3, t4;
	
// Initial 12 round
p12 u1 (
  .x0 (IV),   
  .x1 (k0),   
  .x2 (k1),   
  .x3 (n0),   
  .x4 (n1),   
  .y0 (y0),   
  .y1 (y1),   
  .y2 (y2),   
  .y3 (t3),   
  .y4 (t4)    
);

	assign y3 = t3^k0; // xor secret key to LSWs (Least Significant Words)
	assign y4 = t4^k1;
endmodule

