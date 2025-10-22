module add_constants(state2, i, a, out);
	input [63:0]state2; // 64 bit state x2 of 320 bit inital state
	output [63:0]out; // state after xoring of constant to low bits of x2 (second word of 320 bit state)
	input [3:0]a, i; // declare 4 bit round a(0-16) and current rnd index i(0-12)
	wire [3:0] I; // index to be used to get constant from constants module
	wire [63:0] const; // 64 bit constant for each round
	assign I = 12-a+i; // calculate index I = 12 - a + i for use by rounds a and b
	constants u1(I, const); //instantiate constants module with index and constant to be used
	assign out = state2^const; // xor constant with state2 to get output
endmodule

