module associated_data (
  input  [63:0] x0, x1, x2, x3, x4,      // state in
  input  [63:0] ad0, ad1, ad2,           // 3×64-bit associated data blocks
  output [63:0] y0, y1, y2, y3, y4       // state out after AD + domain separation
);
  //  Block 0
  wire [63:0] a0 = x0 ^ ad0;
  wire [63:0] b0, b1, b2, b3, b4;
  p6 u1 (
    .x0(a0), .x1(x1), .x2(x2), .x3(x3), .x4(x4),
    .y0(b0), .y1(b1), .y2(b2), .y3(b3), .y4(b4)
  );

  // Block 1
  wire [63:0] B0 = b0 ^ ad1;
  wire [63:0] c0, c1, c2, c3, c4;
  p6 u2 (
    .x0(B0), .x1(b1), .x2(b2), .x3(b3), .x4(b4),
    .y0(c0), .y1(c1), .y2(c2), .y3(c3), .y4(c4)
  );

  // Block 2
  wire [63:0] C0 = c0 ^ ad2;
  wire [63:0] d0, d1, d2, d3, d4;  // final state before domain separation
  p6 u3 (
    .x0(C0), .x1(c1), .x2(c2), .x3(c3), .x4(c4),
    .y0(d0), .y1(d1), .y2(d2), .y3(d3), .y4(d4)
  );

  // Domain separation after AD: x4 ^= 1
  assign y0 = d0;
  assign y1 = d1;
  assign y2 = d2;
  assign y3 = d3;
  assign y4 = d4 ^ 64'h0000_0000_0000_0001; // flip LSB only
endmodule


