module hiddenComplete #(
    parameter integer HIDDEN_SIZE        = 20,  // Tamaño de la capa oculta
    parameter integer BW_IN              = 32,  // Tamaño de entrada de bits 
    parameter integer BW_OUT             = 40   // Tamaño de salida de bits 
)(
    input  wire signed [BW_IN-1:0]   x_input, h_1, h_2, h_3, h_4, h_5, h_6, h_7, h_8, h_9, h_10, h_11, h_12, h_13, h_14, h_15, h_16, h_17, h_18, h_19, h_20,
    output wire signed [BW_OUT-1:0]   hc_1, hc_2, hc_3, hc_4, hc_5, hc_6, hc_7, hc_8, hc_9, hc_10, hc_11, hc_12, hc_13, hc_14, hc_15, hc_16, hc_17, hc_18, hc_19, hc_20
);
    
    // --- 1. Multiplicación 1x1 por 1x20 (W_i2r_w0) ---
    wire signed [BW_IN-1:0] partial_products_input_ARRAY [0:HIDDEN_SIZE-1];

    W_i2h_r0 i2h_input (
        .X(x_input),
        .Y1(partial_products_input_ARRAY[0]), .Y2(partial_products_input_ARRAY[1]), .Y3(partial_products_input_ARRAY[2]), .Y4(partial_products_input_ARRAY[3]),
        .Y5(partial_products_input_ARRAY[4]), .Y6(partial_products_input_ARRAY[5]), .Y7(partial_products_input_ARRAY[6]), .Y8(partial_products_input_ARRAY[7]),
        .Y9(partial_products_input_ARRAY[8]), .Y10(partial_products_input_ARRAY[9]), .Y11(partial_products_input_ARRAY[10]), .Y12(partial_products_input_ARRAY[11]),
        .Y13(partial_products_input_ARRAY[12]), .Y14(partial_products_input_ARRAY[13]), .Y15(partial_products_input_ARRAY[14]), .Y16(partial_products_input_ARRAY[15]),
        .Y17(partial_products_input_ARRAY[16]), .Y18(partial_products_input_ARRAY[17]), .Y19(partial_products_input_ARRAY[18]), .Y20(partial_products_input_ARRAY[19])
    );

    // --- 2. Multiplicación 1x20 por 20x20 (hidden2hidden) ---
    wire signed [BW_OUT-1:0] partial_products_hidden_BUS [0:HIDDEN_SIZE-1]; 

    hidden2hidden_1x20_20x20 h2h_mult(
        .h_1(h_1), .h_2(h_2), .h_3(h_3), .h_4(h_4), .h_5(h_5), .h_6(h_6), .h_7(h_7), .h_8(h_8), .h_9(h_9), .h_10(h_10), .h_11(h_11), .h_12(h_12), .h_13(h_13), .h_14(h_14), .h_15(h_15), .h_16(h_16), .h_17(h_17), .h_18(h_18), .h_19(h_19), .h_20(h_20),
        .h2h_1(partial_products_hidden_BUS[0]), .h2h_2(partial_products_hidden_BUS[1]), .h2h_3(partial_products_hidden_BUS[2]),  .h2h_4(partial_products_hidden_BUS[3]),   .h2h_5(partial_products_hidden_BUS[4]),  .h2h_6(partial_products_hidden_BUS[5]),   .h2h_7(partial_products_hidden_BUS[6]),  .h2h_8(partial_products_hidden_BUS[7]),   .h2h_9(partial_products_hidden_BUS[8]),  .h2h_10(partial_products_hidden_BUS[9]),  .h2h_11(partial_products_hidden_BUS[10]), .h2h_12(partial_products_hidden_BUS[11]), .h2h_13(partial_products_hidden_BUS[12]), .h2h_14(partial_products_hidden_BUS[13]), .h2h_15(partial_products_hidden_BUS[14]), .h2h_16(partial_products_hidden_BUS[15]), .h2h_17(partial_products_hidden_BUS[16]), .h2h_18(partial_products_hidden_BUS[17]), .h2h_19(partial_products_hidden_BUS[18]), .h2h_20(partial_products_hidden_BUS[19])
    );

    assign hc_1 = partial_products_hidden_BUS[0] + partial_products_input_ARRAY[0];
    assign hc_2 = partial_products_hidden_BUS[1] + partial_products_input_ARRAY[1];
    assign hc_3 = partial_products_hidden_BUS[2] + partial_products_input_ARRAY[2];
    assign hc_4 = partial_products_hidden_BUS[3] + partial_products_input_ARRAY[3];
    assign hc_5 = partial_products_hidden_BUS[4] + partial_products_input_ARRAY[4];
    assign hc_6 = partial_products_hidden_BUS[5] + partial_products_input_ARRAY[5];
    assign hc_7 = partial_products_hidden_BUS[6] + partial_products_input_ARRAY[6];
    assign hc_8 = partial_products_hidden_BUS[7] + partial_products_input_ARRAY[7];
    assign hc_9 = partial_products_hidden_BUS[8] + partial_products_input_ARRAY[8];
    assign hc_10 = partial_products_hidden_BUS[9] + partial_products_input_ARRAY[9];
    assign hc_11 = partial_products_hidden_BUS[10] + partial_products_input_ARRAY[10];
    assign hc_12 = partial_products_hidden_BUS[11] + partial_products_input_ARRAY[11];
    assign hc_13 = partial_products_hidden_BUS[12] + partial_products_input_ARRAY[12];
    assign hc_14 = partial_products_hidden_BUS[13] + partial_products_input_ARRAY[13];
    assign hc_15 = partial_products_hidden_BUS[14] + partial_products_input_ARRAY[14];
    assign hc_16 = partial_products_hidden_BUS[15] + partial_products_input_ARRAY[15];
    assign hc_17 = partial_products_hidden_BUS[16] + partial_products_input_ARRAY[16];
    assign hc_18 = partial_products_hidden_BUS[17] + partial_products_input_ARRAY[17];
    assign hc_19 = partial_products_hidden_BUS[18] + partial_products_input_ARRAY[18];
    assign hc_20 = partial_products_hidden_BUS[19] + partial_products_input_ARRAY[19];


endmodule
