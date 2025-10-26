module p6 (
  input  [63:0] x0, x1, x2, x3, x4,
  output [63:0] y0, y1, y2, y3, y4
);

  //  Round 0 
  wire [63:0] x2_0, b0, b1, b2, b3, b4, c0, c1, c2, c3, c4;
  
  add_constants R0_const (
    .state2 (x2),
    .i      (4'd0),
    .a      (4'd6),
    .out    (x2_0)
  );

  sbox R0_sbox (
    .x0 (x0), .x1 (x1), .x2 (x2_0), .x3 (x3), .x4 (x4),
    .y0 (b0), .y1 (b1), .y2 (b2),   .y3 (b3), .y4 (b4)
  );

  linear R0_lin (
    .x0 (b0), .x1 (b1), .x2 (b2), .x3 (b3), .x4 (b4),
    .y0 (c0), .y1 (c1), .y2 (c2), .y3 (c3), .y4 (c4)
  );

  //  Round 1
  wire [63:0] x2_1, d0, d1, d2, d3, d4, e0, e1, e2, e3, e4;

  add_constants R1_const (
    .state2 (c2),
    .i      (4'd1),
    .a      (4'd6),
    .out    (x2_1)
  );

  sbox R1_sbox (
    .x0 (c0), .x1 (c1), .x2 (x2_1), .x3 (c3), .x4 (c4),
    .y0 (d0), .y1 (d1), .y2 (d2),   .y3 (d3), .y4 (d4)
  );

  linear R1_lin (
    .x0 (d0), .x1 (d1), .x2 (d2), .x3 (d3), .x4 (d4),
    .y0 (e0), .y1 (e1), .y2 (e2), .y3 (e3), .y4 (e4)
  );

  //  Round 2
  wire [63:0] x2_2, f0, f1, f2, f3, f4, g0, g1, g2, g3, g4;

  add_constants R2_const (
    .state2 (e2),
    .i      (4'd2),
    .a      (4'd6),
    .out    (x2_2)
  );

  sbox R2_sbox (
    .x0 (e0), .x1 (e1), .x2 (x2_2), .x3 (e3), .x4 (e4),
    .y0 (f0), .y1 (f1), .y2 (f2),   .y3 (f3), .y4 (f4)
  );

  linear R2_lin (
    .x0 (f0), .x1 (f1), .x2 (f2), .x3 (f3), .x4 (f4),
    .y0 (g0), .y1 (g1), .y2 (g2), .y3 (g3), .y4 (g4)
  );

  //  Round 3
  wire [63:0] x2_3, h0, h1, h2, h3, h4, i0, i1, i2, i3, i4;

  add_constants R3_const (
    .state2 (g2),
    .i      (4'd3),
    .a      (4'd6),
    .out    (x2_3)
  );

  sbox R3_sbox (
    .x0 (g0), .x1 (g1), .x2 (x2_3), .x3 (g3), .x4 (g4),
    .y0 (h0), .y1 (h1), .y2 (h2),   .y3 (h3), .y4 (h4)
  );

  linear R3_lin (
    .x0 (h0), .x1 (h1), .x2 (h2), .x3 (h3), .x4 (h4),
    .y0 (i0), .y1 (i1), .y2 (i2), .y3 (i3), .y4 (i4)
  );

  //  Round 4
  wire [63:0] x2_4, j0, j1, j2, j3, j4, k0, k1, k2, k3, k4;

  add_constants R4_const (
    .state2 (i2),
    .i      (4'd4),
    .a      (4'd6),
    .out    (x2_4)
  );

  sbox R4_sbox (
    .x0 (i0), .x1 (i1), .x2 (x2_4), .x3 (i3), .x4 (i4),
    .y0 (j0), .y1 (j1), .y2 (j2),   .y3 (j3), .y4 (j4)
  );

  linear R4_lin (
    .x0 (j0), .x1 (j1), .x2 (j2), .x3 (j3), .x4 (j4),
    .y0 (k0), .y1 (k1), .y2 (k2), .y3 (k3), .y4 (k4)
  );

  //  Round 5
  wire [63:0] x2_5, l0, l1, l2, l3, l4;

  add_constants R5_const (
    .state2 (k2),
    .i      (4'd5),
    .a      (4'd6),
    .out    (x2_5)
  );

  sbox R5_sbox (
    .x0 (k0), .x1 (k1), .x2 (x2_5), .x3 (k3), .x4 (k4),
    .y0 (l0), .y1 (l1), .y2 (l2),   .y3 (l3), .y4 (l4)
  );

  linear R5_lin (
    .x0 (l0), .x1 (l1), .x2 (l2), .x3 (l3), .x4 (l4),
    .y0 (y0), .y1 (y1), .y2 (y2), .y3 (y3), .y4 (y4)
  );

endmodule



