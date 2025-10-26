module p12 (
  input  [63:0] x0, x1, x2, x3, x4,
  output [63:0] y0, y1, y2, y3, y4
);
  //  Round 0 
  wire [63:0] x2_0, b0, b1, b2, b3, b4, c0, c1, c2, c3, c4;
  add_constants Z0(.state2(x2), .i(4'd0),  .a(4'd12), .out(x2_0));
  sbox Z1(.x0(x0), .x1(x1), .x2(x2_0), .x3(x3), .x4(x4),
    .y0(b0), .y1(b1), .y2(b2),   .y3(b3), .y4(b4));
  linear Z2(.x0(b0), .x1(b1), .x2(b2), .x3(b3), .x4(b4),
    .y0(c0), .y1(c1), .y2(c2), .y3(c3), .y4(c4));

  //  Round 1 
  wire [63:0] x2_1, d0, d1, d2, d3, d4, e0, e1, e2, e3, e4;
  add_constants Z3(.state2(c2), .i(4'd1),  .a(4'd12), .out(x2_1));
  sbox Z4(.x0(c0), .x1(c1), .x2(x2_1), .x3(c3), .x4(c4),
    .y0(d0), .y1(d1), .y2(d2),   .y3(d3), .y4(d4));
  linear Z5(.x0(d0), .x1(d1), .x2(d2), .x3(d3), .x4(d4),
    .y0(e0), .y1(e1), .y2(e2), .y3(e3), .y4(e4));

  //  Round 2 
  wire [63:0] x2_2, f0, f1, f2, f3, f4, g0, g1, g2, g3, g4;
  add_constants Z6(.state2(e2), .i(4'd2),  .a(4'd12), .out(x2_2));
  sbox Z7(.x0(e0), .x1(e1), .x2(x2_2), .x3(e3), .x4(e4),
    .y0(f0), .y1(f1), .y2(f2),   .y3(f3), .y4(f4));
  linear Z8(.x0(f0), .x1(f1), .x2(f2), .x3(f3), .x4(f4),
    .y0(g0), .y1(g1), .y2(g2), .y3(g3), .y4(g4));

  //  Round 3 
  wire [63:0] x2_3, h0, h1, h2, h3, h4, i0, i1, i2, i3, i4;
  add_constants Z9(.state2(g2), .i(4'd3),  .a(4'd12), .out(x2_3));
  sbox ZA(.x0(g0), .x1(g1), .x2(x2_3), .x3(g3), .x4(g4),
    .y0(h0), .y1(h1), .y2(h2),   .y3(h3), .y4(h4));
  linear ZB(.x0(h0), .x1(h1), .x2(h2), .x3(h3), .x4(h4),
.y0(i0), .y1(i1), .y2(i2), .y3(i3), .y4(i4));

  //  Round 4 
  wire [63:0] x2_4, j0, j1, j2, j3, j4, k0, k1, k2, k3, k4;
  add_constants ZC(.state2(i2), .i(4'd4),  .a(4'd12), .out(x2_4));
  sbox ZD(.x0(i0), .x1(i1), .x2(x2_4), .x3(i3), .x4(i4),
    .y0(j0), .y1(j1), .y2(j2),   .y3(j3), .y4(j4));
  linear ZE(.x0(j0), .x1(j1), .x2(j2), .x3(j3), .x4(j4),
    .y0(k0), .y1(k1), .y2(k2), .y3(k3), .y4(k4));

  //  Round 5 
  wire [63:0] x2_5, l0, l1, l2, l3, l4, m0, m1, m2, m3, m4;
  add_constants ZF(.state2(k2), .i(4'd5),  .a(4'd12), .out(x2_5));
  sbox ZG(.x0(k0), .x1(k1), .x2(x2_5), .x3(k3), .x4(k4),
    .y0(l0), .y1(l1), .y2(l2),   .y3(l3), .y4(l4));
  linear ZH(.x0(l0), .x1(l1), .x2(l2), .x3(l3), .x4(l4),
    .y0(m0), .y1(m1), .y2(m2), .y3(m3), .y4(m4));

  //  Round 6 
  wire [63:0] x2_6, n0, n1, n2, n3, n4, o0, o1, o2, o3, o4;
  add_constants ZI(.state2(m2), .i(4'd6),  .a(4'd12), .out(x2_6));
  sbox ZJ(.x0(m0), .x1(m1), .x2(x2_6), .x3(m3), .x4(m4),
    .y0(n0), .y1(n1), .y2(n2),   .y3(n3), .y4(n4));
  linear ZK(.x0(n0), .x1(n1), .x2(n2), .x3(n3), .x4(n4),
    .y0(o0), .y1(o1), .y2(o2), .y3(o3), .y4(o4));

  //  Round 7 
  wire [63:0] x2_7, p0, p1, p2, p3, p4, q0, q1, q2, q3, q4;
  add_constants ZL(.state2(o2), .i(4'd7),  .a(4'd12), .out(x2_7));
  sbox ZM(.x0(o0), .x1(o1), .x2(x2_7), .x3(o3), .x4(o4),
    .y0(p0), .y1(p1), .y2(p2),   .y3(p3), .y4(p4));
  linear ZN(.x0(p0), .x1(p1), .x2(p2), .x3(p3), .x4(p4),
    .y0(q0), .y1(q1), .y2(q2), .y3(q3), .y4(q4));

  //  Round 8 
  wire [63:0] x2_8, r0, r1, r2, r3, r4, s0, s1, s2, s3, s4;
  add_constants ZO(.state2(q2), .i(4'd8),  .a(4'd12), .out(x2_8));
  sbox ZP(.x0(q0), .x1(q1), .x2(x2_8), .x3(q3), .x4(q4),
    .y0(r0), .y1(r1), .y2(r2),   .y3(r3), .y4(r4));
  linear ZQ(.x0(r0), .x1(r1), .x2(r2), .x3(r3), .x4(r4),
    .y0(s0), .y1(s1), .y2(s2), .y3(s3), .y4(s4));

  //  Round 9 
  wire [63:0] x2_9, t0, t1, t2, t3, t4, u0, u1, u2, u3, u4;
  add_constants ZR(.state2(s2), .i(4'd9),  .a(4'd12), .out(x2_9));
  sbox ZS(.x0(s0), .x1(s1), .x2(x2_9), .x3(s3), .x4(s4),
    .y0(t0), .y1(t1), .y2(t2),   .y3(t3), .y4(t4));
  linear ZT(.x0(t0), .x1(t1), .x2(t2), .x3(t3), .x4(t4),
    .y0(u0), .y1(u1), .y2(u2), .y3(u3), .y4(u4));

  //  Round 10 
  wire [63:0] x2_10, v0, v1, v2, v3, v4, w0, w1, w2, w3, w4;
  add_constants ZU(.state2(u2), .i(4'd10), .a(4'd12), .out(x2_10));
  sbox ZV(.x0(u0), .x1(u1), .x2(x2_10), .x3(u3), .x4(u4),
    .y0(v0), .y1(v1), .y2(v2),    .y3(v3), .y4(v4));
  linear ZW(.x0(v0), .x1(v1), .x2(v2), .x3(v3), .x4(v4),
    .y0(w0), .y1(w1), .y2(w2), .y3(w3), .y4(w4));

  //  Round 11 
  wire [63:0] x2_11, z0, z1, z2, z3, z4;
  add_constants ZX(.state2(w2), .i(4'd11), .a(4'd12), .out(x2_11));
  sbox ZY(.x0(w0), .x1(w1), .x2(x2_11), .x3(w3), .x4(w4),
    .y0(z0), .y1(z1), .y2(z2),    .y3(z3), .y4(z4));
  linear ZZ(.x0(z0), .x1(z1), .x2(z2), .x3(z3), .x4(z4),
    .y0(y0), .y1(y1), .y2(y2), .y3(y3), .y4(y4));
endmodule


