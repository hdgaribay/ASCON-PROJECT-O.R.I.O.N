module rotate(x, out, l);
	input [63:0]x;
	input [5:0]l;
	output wire [63:0]out;
	assign out = (x >> l) | (x << (64 - l)); // or instead of xor in case of 1's in overlapping positions

endmodule

