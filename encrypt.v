module encrypt (
  input  [63:0] x0, x1, x2, x3, x4,   // state in
  input  [63:0] pln0, pln1,           // two plaintext blocks
  output [63:0] y0, y1, y2, y3, y4,   // state out after both blocks
  output [63:0] cyp0, cyp1            // two ciphertext blocks
);
  // Block 0
  wire [63:0] x0_a = x0 ^ pln0;       // absorb PT0 into rate
  assign cyp0 = x0_a;                 // emit CT0 from rate
  wire [63:0] b0, b1, b2, b3, b4;     // state after p6 #1
  p6 u_p6_0 
  (
    .x0(x0_a), .x1(x1), .x2(x2), .x3(x3), .x4(x4),
    .y0(b0),   .y1(b1), .y2(b2), .y3(b3), .y4(b4)
  );

  // Block 1 
  wire [63:0] x0_b = b0 ^ pln1;       // absorb PT1 into new rate
  assign cyp1 = x0_b;                 // emit CT1 from rate
  p6 u_p6_1
(
    .x0(x0_b), .x1(b1), .x2(b2), .x3(b3), .x4(b4),
    .y0(y0),   .y1(y1), .y2(y2), .y3(y3), .y4(y4)
);

endmodule

