module add_constants (
  input  [63:0] state2,   // x2 lane (64 of the 320 bits)
  input  [3:0]  a, i,     // a = total rounds (6 or 12), i = round index
  output [63:0] out       // x2 after XOR with round constant
);
  wire [3:0]  I;          // constant index
  wire [63:0] const;      // selected round constant

  assign I = 12 - a + i;  // p12: I=i; p6: I=6+i

  constants u1(
    .index (I),
    .out   (const)
  );

  assign out = state2 ^ const;
endmodule


