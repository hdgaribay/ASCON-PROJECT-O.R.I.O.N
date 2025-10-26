module linear (
  input  [63:0] x0, x1, x2, x3, x4,
  output [63:0] y0, y1, y2, y3, y4
);
  wire [63:0] a0, a1;  // for x0
  rotate r00(.x(x0), .l(6'd19), .out(a0));
  rotate r01(.x(x0), .l(6'd28), .out(a1));
  assign y0 = x0 ^ a0 ^ a1;

  wire [63:0] b0, b1;  // for x1
  rotate r10(.x(x1), .l(6'd61), .out(b0));
  rotate r11(.x(x1), .l(6'd39), .out(b1));
  assign y1 = x1 ^ b0 ^ b1;

  wire [63:0] c0, c1;  // for x2
  rotate r20(.x(x2), .l(6'd1),  .out(c0));
  rotate r21(.x(x2), .l(6'd6),  .out(c1));
  assign y2 = x2 ^ c0 ^ c1;

  wire [63:0] d0, d1;  // for x3
  rotate r30(.x(x3), .l(6'd10), .out(d0));
  rotate r31(.x(x3), .l(6'd17), .out(d1));
  assign y3 = x3 ^ d0 ^ d1;

  wire [63:0] e0, e1;  // for x4
  rotate r40(.x(x4), .l(6'd7),  .out(e0));
  rotate r41(.x(x4), .l(6'd41), .out(e1));
  assign y4 = x4 ^ e0 ^ e1;
endmodule


