module final(IV, k0, k1, n0, n1, y0, y1, y2, y3, y4, key0, key1);
	input [63:0] IV, k0, k1, n0, n1, key0, key1;
	output [63:0] y0, y1, y2, y3, y4;
	wire [63:0] t0, t1, t2, t3, t4;
	assign t1 = k0^key0;
	assign t2 = k1^key1;
//12 round finalization
  p12 u1 (
    .x0 (IV),
    .x1 (t1),
    .x2 (t2),
    .x3 (n0),
    .x4 (n1),
    .y0 (y0),
    .y1 (y1),
    .y2 (y2),
    .y3 (t3),
    .y4 (t4)
  );
	assign y3 = t3^key0;
	assign y4 = t4^key1;
endmodule

