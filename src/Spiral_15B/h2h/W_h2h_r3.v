
module W_h2h_r3 (
    X,
    Y1,
    Y2,
    Y3,
    Y4,
    Y5,
    Y6,
    Y7,
    Y8,
    Y9,
    Y10,
    Y11,
    Y12,
    Y13,
    Y14,
    Y15,
    Y16,
    Y17,
    Y18,
    Y19,
    Y20
);

  // Port mode declarations:
  input  signed  [31:0] X;
  output signed  [31:0]
    Y1,
    Y2,
    Y3,
    Y4,
    Y5,
    Y6,
    Y7,
    Y8,
    Y9,
    Y10,
    Y11,
    Y12,
    Y13,
    Y14,
    Y15,
    Y16,
    Y17,
    Y18,
    Y19,
    Y20;

  wire [31:0] Y [0:19];

  assign Y1 = Y[0];
  assign Y2 = Y[1];
  assign Y3 = Y[2];
  assign Y4 = Y[3];
  assign Y5 = Y[4];
  assign Y6 = Y[5];
  assign Y7 = Y[6];
  assign Y8 = Y[7];
  assign Y9 = Y[8];
  assign Y10 = Y[9];
  assign Y11 = Y[10];
  assign Y12 = Y[11];
  assign Y13 = Y[12];
  assign Y14 = Y[13];
  assign Y15 = Y[14];
  assign Y16 = Y[15];
  assign Y17 = Y[16];
  assign Y18 = Y[17];
  assign Y19 = Y[18];
  assign Y20 = Y[19];

/*Pesos:
3072 -4608 1920 -2560 -1536 -6144 3072 2560 3072 -2560 5120 5120 6144 10240 2560 -6144 7168 -9216 -384 8
*/

  localparam signed [31:0] W1 = 3072;
  localparam signed [31:0] W2 = -4608;
  localparam signed [31:0] W3 = 1920;
  localparam signed [31:0] W4 = -2560;
  localparam signed [31:0] W5 = -1536;
  localparam signed [31:0] W6 = -6144;
  localparam signed [31:0] W7 = 3072;
  localparam signed [31:0] W8 = 2560;
  localparam signed [31:0] W9 = 3072;
  localparam signed [31:0] W10 = -2560;
  localparam signed [31:0] W11 = 5120;
  localparam signed [31:0] W12 = 5120;
  localparam signed [31:0] W13 = 6144;
  localparam signed [31:0] W14 = 10240;
  localparam signed [31:0] W15 = 2560;
  localparam signed [31:0] W16 = -6144;
  localparam signed [31:0] W17 = 7168;
  localparam signed [31:0] W18 = -9216;
  localparam signed [31:0] W19 = -384;
  localparam signed [31:0] W20 = 8;

  wire signed [63:0] p_0, p_1, p_2, p_3, p_4, p_5, p_6, p_7, p_8, p_9, 
                     p_10, p_11, p_12, p_13, p_14, p_15, p_16, p_17, p_18, p_19;


  assign p_0  = X * W1;
  assign p_1  = X * W2;
  assign p_2  = X * W3;
  assign p_3  = X * W4;
  assign p_4  = X * W5;
  assign p_5  = X * W6;
  assign p_6  = X * W7;
  assign p_7  = X * W8;
  assign p_8  = X * W9;
  assign p_9  = X * W10;
  assign p_10 = X * W11;
  assign p_11 = X * W12;
  assign p_12 = X * W13;
  assign p_13 = X * W14;
  assign p_14 = X * W15;
  assign p_15 = X * W16;
  assign p_16 = X * W17;
  assign p_17 = X * W18; 
  assign p_18 = X * W19;
  assign p_19 = X * W20;

  assign Y[0]  = p_0[46:15];
  assign Y[1]  = p_1[46:15];
  assign Y[2]  = p_2[46:15];
  assign Y[3]  = p_3[46:15];
  assign Y[4]  = p_4[46:15];
  assign Y[5]  = p_5[46:15];
  assign Y[6]  = p_6[46:15];
  assign Y[7]  = p_7[46:15];
  assign Y[8]  = p_8[46:15];
  assign Y[9]  = p_9[46:15];
  assign Y[10] = p_10[46:15];
  assign Y[11] = p_11[46:15];
  assign Y[12] = p_12[46:15];
  assign Y[13] = p_13[46:15];
  assign Y[14] = p_14[46:15];
  assign Y[15] = p_15[46:15];
  assign Y[16] = p_16[46:15];
  assign Y[17] = p_17[46:15];
  assign Y[18] = p_18[46:15];
  assign Y[19] = p_19[46:15];


endmodule //multiplier_block
