module demo (
  input  [63:0] x0, x1, x2, x3, x4, d0, d1, d2, plin0, plin1,
  output [63:0] y0, y1, y2, y3, y4, dec0, dec1
);

  // Initialization
  wire [63:0] s00, s10, s20, s30, s40;

  initialization u0 (
    .IV   (x0),
    .k0   (x1),
    .k1   (x2),
    .n0   (x3),
    .n1   (x4),
    .y0   (s00),
    .y1   (s10),
    .y2   (s20),
    .y3   (s30),
    .y4   (s40),
    .key0 (x1),
    .key1 (x2)
  );


  // Associated Data Processing
  wire [63:0] s01, s11, s21, s31, s41;

  associated_data u2 (
    .x0 (s00), .x1 (s10), .x2 (s20), .x3 (s30), .x4 (s40),
    .y0 (s01), .y1 (s11), .y2 (s21), .y3 (s31), .y4 (s41),
    .d0 (d0),  .d1 (d1),  .d2 (d2)
  );


  // Encryption
  wire [63:0] s02, s12, s22, s32, s42, cyp0, cyp1;

  encrypt u3 (
    .x0 (s01), .x1 (s11), .x2 (s21), .x3 (s31), .x4 (s41),
    .y0 (s02), .y1 (s12), .y2 (s22), .y3 (s32), .y4 (s42),
    .pln0 (plin0), .pln1 (plin1),
    .cyp0 (cyp0), .cyp1 (cyp1)
  );


  // Finalization (Tag generation)
  wire [63:0] s03, s13, s23, s33, s43;

  final u4 (
    .IV   (s02),
    .k0   (s12),
    .k1   (s22),
    .n0   (s32),
    .n1   (s42),
    .y0   (s03),
    .y1   (s13),
    .y2   (s23),
    .y3   (s33),
    .y4   (s43),
    .key0 (x1),
    .key1 (x2)
  );


  // Decryption Path
  wire [63:0] s04, s14, s24, s34, s44;

  initialization u5 (
    .IV   (x0),
    .k0   (x1),
    .k1   (x2),
    .n0   (x3),
    .n1   (x4),
    .y0   (s04),
    .y1   (s14),
    .y2   (s24),
    .y3   (s34),
    .y4   (s44),
    .key0 (x1),
    .key1 (x2)
  );

  wire [63:0] s05, s15, s25, s35, s45;

  associated_data u6 (
    .x0 (s04), .x1 (s14), .x2 (s24), .x3 (s34), .x4 (s44),
    .y0 (s05), .y1 (s15), .y2 (s25), .y3 (s35), .y4 (s45),
    .d0 (d0),  .d1 (d1),  .d2 (d2)
  );

  wire [63:0] s06, s16, s26, s36, s46;

  decrypt u7 (
    .x0   (s05), .x1 (s15), .x2 (s25), .x3 (s35), .x4 (s45),
    .y0   (s06), .y1 (s16), .y2 (s26), .y3 (s36), .y4 (s46),
    .pln0 (dec0), .pln1 (dec1),
    .cyp0 (cyp0), .cyp1 (cyp1)
  );
endmodule