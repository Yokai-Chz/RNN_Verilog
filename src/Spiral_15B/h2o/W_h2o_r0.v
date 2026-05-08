/*Pesos:
3840 5120 -9216 9216 6144 5120 -3072 -6144 5120 -2560 7680 10240 -5120 8704 -2304 3072 3072 -2560 -4608 5120
*/

// --- 0 ---
module W_h2o_r0 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = 3840 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 1 ---
module W_h2o_r1 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = 5120 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 2 ---
module W_h2o_r2 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = -9216 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 3 ---
module W_h2o_r3 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = 9216 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 4 ---
module W_h2o_r4 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = 6144 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 5 ---
module W_h2o_r5 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = 5120 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 6 ---
module W_h2o_r6 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = -3072 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 7 ---
module W_h2o_r7 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = -6144 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 8 ---
module W_h2o_r8 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = 5120 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 9 ---
module W_h2o_r9 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = -2560 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 10 ---
module W_h2o_r10 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = 7680 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 11 ---
module W_h2o_r11 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = 10240 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 12 ---
module W_h2o_r12 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = -5120 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 13 ---
module W_h2o_r13 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = 8704 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 14 ---
module W_h2o_r14 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = -2304 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 15 ---
module W_h2o_r15 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = 3072 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 16 ---
module W_h2o_r16 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = 3072 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 17 ---
module W_h2o_r17 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = -2560 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 18 ---
module W_h2o_r18 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = -4608 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule

// --- 19 ---
module W_h2o_r19 (X, Y);
  input  signed [31:0] X;
  output signed [31:0] Y;
  
  localparam signed w = 5120 ;

  wire signed [63:0] p_0;

  assign p_0 = X * w;

  assign Y = p_0[46:15];
endmodule