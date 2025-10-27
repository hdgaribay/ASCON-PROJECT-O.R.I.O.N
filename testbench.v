`timescale 1ns / 1ps

module testbench();

  reg  [63:0] iv, k0, k1, n0, n1, pln0, pln1, d0, d1, d2;
  wire [63:0] y0, y1, y2, y3, y4, out0, out1;

  demo LL1 (
    .x0     (iv),     // IV
    .x1     (k0),     // Key part 0
    .x2     (k1),     // Key part 1
    .x3     (n0),     // Nonce part 0
    .x4     (n1),     // Nonce part 1
    .y0     (y0),
    .y1     (y1),
    .y2     (y2),
    .y3     (y3),
    .y4     (y4),
    .d0     (d0),     // Associated data block 0
    .d1     (d1),     // Associated data block 1
    .d2     (d2),     // Associated data block 2
    .plin0  (pln0),   // Plaintext block 0
    .plin1  (pln1),   // Plaintext block 1
    .dec0   (out0),   // Decrypted block 0
    .dec1   (out1)    // Decrypted block 1
  );

  // Simulation controls
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
  end

  // Test vectors
  initial begin
    pln0 = 64'h1234567890ABCDEF;
    pln1 = 64'h1234567890ABCDEF;
    d0   = 64'd7895160;
    d1   = 64'd8882055;
    d2   = 64'd37008;
    n0   = 64'h369C801F3AE8D0EA;
    n1   = 64'h9BF367D58FD211FF;
    k0   = 64'h265F1C12888E151A;
    k1   = 64'hC74F26B30A8C44B2;
    iv   = 64'h80400C0600000000;
    #10;
  end

endmodule
