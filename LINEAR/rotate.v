module rotate(x, out, l);
	input [63:0]x;
	input [5:0]l;
	output wire [63:0]out;
	assign out = (x >>l)|(x<<(64-l)); // or operation in instance that both bits are one
endmodule

