module hidden2hidden_1x20_20x20 #(
    parameter integer HIDDEN_SIZE    = 20, // M: Tamaño de la capa oculta
    parameter integer BW_IN          = 32, // Tamaño de entrada de bits 
    parameter integer BW_OUT         = 40  // Tamaño de entrada de bits 
) (
    input  wire signed [BW_IN-1:0] h_1, h_2, h_3, h_4, h_5, h_6, h_7, h_8, h_9, h_10, h_11, h_12, h_13, h_14, h_15, h_16, h_17, h_18, h_19, h_20,
    output wire signed [BW_OUT-1:0] h2h_1, h2h_2, h2h_3, h2h_4, h2h_5, h2h_6, h2h_7, h2h_8, h2h_9, h2h_10, h2h_11, h2h_12, h2h_13, h2h_14, h2h_15, h2h_16, h2h_17, h2h_18, h2h_19, h2h_20
);

    // --- 2. Calcular productos parciales (h_i * W_row_i) ---
    wire signed [BW_IN-1:0] partial_products [0:HIDDEN_SIZE-1][0:HIDDEN_SIZE-1];

    W_h2h_r0 i2h_mul_inst_0 (
        .X(h_1),
        .Y1(partial_products[0][0]), .Y2(partial_products[0][1]), .Y3(partial_products[0][2]), .Y4(partial_products[0][3]),
        .Y5(partial_products[0][4]), .Y6(partial_products[0][5]), .Y7(partial_products[0][6]), .Y8(partial_products[0][7]),
        .Y9(partial_products[0][8]), .Y10(partial_products[0][9]), .Y11(partial_products[0][10]), .Y12(partial_products[0][11]),
        .Y13(partial_products[0][12]), .Y14(partial_products[0][13]), .Y15(partial_products[0][14]), .Y16(partial_products[0][15]),
        .Y17(partial_products[0][16]), .Y18(partial_products[0][17]), .Y19(partial_products[0][18]), .Y20(partial_products[0][19])
    );

    W_h2h_r1 i2h_mul_inst_1 (
        .X(h_2),
        .Y1(partial_products[1][0]), .Y2(partial_products[1][1]), .Y3(partial_products[1][2]), .Y4(partial_products[1][3]),
        .Y5(partial_products[1][4]), .Y6(partial_products[1][5]), .Y7(partial_products[1][6]), .Y8(partial_products[1][7]),
        .Y9(partial_products[1][8]), .Y10(partial_products[1][9]), .Y11(partial_products[1][10]), .Y12(partial_products[1][11]),
        .Y13(partial_products[1][12]), .Y14(partial_products[1][13]), .Y15(partial_products[1][14]), .Y16(partial_products[1][15]),
        .Y17(partial_products[1][16]), .Y18(partial_products[1][17]), .Y19(partial_products[1][18]), .Y20(partial_products[1][19])
    );

    W_h2h_r2 i2h_mul_inst_2 (
        .X(h_3),
        .Y1(partial_products[2][0]), .Y2(partial_products[2][1]), .Y3(partial_products[2][2]), .Y4(partial_products[2][3]),
        .Y5(partial_products[2][4]), .Y6(partial_products[2][5]), .Y7(partial_products[2][6]), .Y8(partial_products[2][7]),
        .Y9(partial_products[2][8]), .Y10(partial_products[2][9]), .Y11(partial_products[2][10]), .Y12(partial_products[2][11]),
        .Y13(partial_products[2][12]), .Y14(partial_products[2][13]), .Y15(partial_products[2][14]), .Y16(partial_products[2][15]),
        .Y17(partial_products[2][16]), .Y18(partial_products[2][17]), .Y19(partial_products[2][18]), .Y20(partial_products[2][19])
    );

    W_h2h_r3 i2h_mul_inst_3 (
        .X(h_4),
        .Y1(partial_products[3][0]), .Y2(partial_products[3][1]), .Y3(partial_products[3][2]), .Y4(partial_products[3][3]),
        .Y5(partial_products[3][4]), .Y6(partial_products[3][5]), .Y7(partial_products[3][6]), .Y8(partial_products[3][7]),
        .Y9(partial_products[3][8]), .Y10(partial_products[3][9]), .Y11(partial_products[3][10]), .Y12(partial_products[3][11]),
        .Y13(partial_products[3][12]), .Y14(partial_products[3][13]), .Y15(partial_products[3][14]), .Y16(partial_products[3][15]),
        .Y17(partial_products[3][16]), .Y18(partial_products[3][17]), .Y19(partial_products[3][18]), .Y20(partial_products[3][19])
    );

    W_h2h_r4 i2h_mul_inst_4 (
        .X(h_5),
        .Y1(partial_products[4][0]), .Y2(partial_products[4][1]), .Y3(partial_products[4][2]), .Y4(partial_products[4][3]),
        .Y5(partial_products[4][4]), .Y6(partial_products[4][5]), .Y7(partial_products[4][6]), .Y8(partial_products[4][7]),
        .Y9(partial_products[4][8]), .Y10(partial_products[4][9]), .Y11(partial_products[4][10]), .Y12(partial_products[4][11]),
        .Y13(partial_products[4][12]), .Y14(partial_products[4][13]), .Y15(partial_products[4][14]), .Y16(partial_products[4][15]),
        .Y17(partial_products[4][16]), .Y18(partial_products[4][17]), .Y19(partial_products[4][18]), .Y20(partial_products[4][19])
    );

    W_h2h_r5 i2h_mul_inst_5 (
        .X(h_6),
        .Y1(partial_products[5][0]), .Y2(partial_products[5][1]), .Y3(partial_products[5][2]), .Y4(partial_products[5][3]),
        .Y5(partial_products[5][4]), .Y6(partial_products[5][5]), .Y7(partial_products[5][6]), .Y8(partial_products[5][7]),
        .Y9(partial_products[5][8]), .Y10(partial_products[5][9]), .Y11(partial_products[5][10]), .Y12(partial_products[5][11]),
        .Y13(partial_products[5][12]), .Y14(partial_products[5][13]), .Y15(partial_products[5][14]), .Y16(partial_products[5][15]),
        .Y17(partial_products[5][16]), .Y18(partial_products[5][17]), .Y19(partial_products[5][18]), .Y20(partial_products[5][19])
    );

    W_h2h_r6 i2h_mul_inst_6 (
        .X(h_7),
        .Y1(partial_products[6][0]), .Y2(partial_products[6][1]), .Y3(partial_products[6][2]), .Y4(partial_products[6][3]),
        .Y5(partial_products[6][4]), .Y6(partial_products[6][5]), .Y7(partial_products[6][6]), .Y8(partial_products[6][7]),
        .Y9(partial_products[6][8]), .Y10(partial_products[6][9]), .Y11(partial_products[6][10]), .Y12(partial_products[6][11]),
        .Y13(partial_products[6][12]), .Y14(partial_products[6][13]), .Y15(partial_products[6][14]), .Y16(partial_products[6][15]),
        .Y17(partial_products[6][16]), .Y18(partial_products[6][17]), .Y19(partial_products[6][18]), .Y20(partial_products[6][19])
    );

    W_h2h_r7 i2h_mul_inst_7 (
        .X(h_8),
        .Y1(partial_products[7][0]), .Y2(partial_products[7][1]), .Y3(partial_products[7][2]), .Y4(partial_products[7][3]),
        .Y5(partial_products[7][4]), .Y6(partial_products[7][5]), .Y7(partial_products[7][6]), .Y8(partial_products[7][7]),
        .Y9(partial_products[7][8]), .Y10(partial_products[7][9]), .Y11(partial_products[7][10]), .Y12(partial_products[7][11]),
        .Y13(partial_products[7][12]), .Y14(partial_products[7][13]), .Y15(partial_products[7][14]), .Y16(partial_products[7][15]),
        .Y17(partial_products[7][16]), .Y18(partial_products[7][17]), .Y19(partial_products[7][18]), .Y20(partial_products[7][19])
    );

    W_h2h_r8 i2h_mul_inst_8 (
        .X(h_9),
        .Y1(partial_products[8][0]), .Y2(partial_products[8][1]), .Y3(partial_products[8][2]), .Y4(partial_products[8][3]),
        .Y5(partial_products[8][4]), .Y6(partial_products[8][5]), .Y7(partial_products[8][6]), .Y8(partial_products[8][7]),
        .Y9(partial_products[8][8]), .Y10(partial_products[8][9]), .Y11(partial_products[8][10]), .Y12(partial_products[8][11]),
        .Y13(partial_products[8][12]), .Y14(partial_products[8][13]), .Y15(partial_products[8][14]), .Y16(partial_products[8][15]),
        .Y17(partial_products[8][16]), .Y18(partial_products[8][17]), .Y19(partial_products[8][18]), .Y20(partial_products[8][19])
    );

    W_h2h_r9 i2h_mul_inst_9 (
        .X(h_10),
        .Y1(partial_products[9][0]), .Y2(partial_products[9][1]), .Y3(partial_products[9][2]), .Y4(partial_products[9][3]),
        .Y5(partial_products[9][4]), .Y6(partial_products[9][5]), .Y7(partial_products[9][6]), .Y8(partial_products[9][7]),
        .Y9(partial_products[9][8]), .Y10(partial_products[9][9]), .Y11(partial_products[9][10]), .Y12(partial_products[9][11]),
        .Y13(partial_products[9][12]), .Y14(partial_products[9][13]), .Y15(partial_products[9][14]), .Y16(partial_products[9][15]),
        .Y17(partial_products[9][16]), .Y18(partial_products[9][17]), .Y19(partial_products[9][18]), .Y20(partial_products[9][19])
    );

    W_h2h_r10 i2h_mul_inst_10 (
        .X(h_11),
        .Y1(partial_products[10][0]), .Y2(partial_products[10][1]), .Y3(partial_products[10][2]), .Y4(partial_products[10][3]),
        .Y5(partial_products[10][4]), .Y6(partial_products[10][5]), .Y7(partial_products[10][6]), .Y8(partial_products[10][7]),
        .Y9(partial_products[10][8]), .Y10(partial_products[10][9]), .Y11(partial_products[10][10]), .Y12(partial_products[10][11]),
        .Y13(partial_products[10][12]), .Y14(partial_products[10][13]), .Y15(partial_products[10][14]), .Y16(partial_products[10][15]),
        .Y17(partial_products[10][16]), .Y18(partial_products[10][17]), .Y19(partial_products[10][18]), .Y20(partial_products[10][19])
    );

    W_h2h_r11 i2h_mul_inst_11 (
        .X(h_12),
        .Y1(partial_products[11][0]), .Y2(partial_products[11][1]), .Y3(partial_products[11][2]), .Y4(partial_products[11][3]),
        .Y5(partial_products[11][4]), .Y6(partial_products[11][5]), .Y7(partial_products[11][6]), .Y8(partial_products[11][7]),
        .Y9(partial_products[11][8]), .Y10(partial_products[11][9]), .Y11(partial_products[11][10]), .Y12(partial_products[11][11]),
        .Y13(partial_products[11][12]), .Y14(partial_products[11][13]), .Y15(partial_products[11][14]), .Y16(partial_products[11][15]),
        .Y17(partial_products[11][16]), .Y18(partial_products[11][17]), .Y19(partial_products[11][18]), .Y20(partial_products[11][19])
    );

    W_h2h_r12 i2h_mul_inst_12 (
        .X(h_13),
        .Y1(partial_products[12][0]), .Y2(partial_products[12][1]), .Y3(partial_products[12][2]), .Y4(partial_products[12][3]),
        .Y5(partial_products[12][4]), .Y6(partial_products[12][5]), .Y7(partial_products[12][6]), .Y8(partial_products[12][7]),
        .Y9(partial_products[12][8]), .Y10(partial_products[12][9]), .Y11(partial_products[12][10]), .Y12(partial_products[12][11]),
        .Y13(partial_products[12][12]), .Y14(partial_products[12][13]), .Y15(partial_products[12][14]), .Y16(partial_products[12][15]),
        .Y17(partial_products[12][16]), .Y18(partial_products[12][17]), .Y19(partial_products[12][18]), .Y20(partial_products[12][19])
    );

    W_h2h_r13 i2h_mul_inst_13 (
        .X(h_14),
        .Y1(partial_products[13][0]), .Y2(partial_products[13][1]), .Y3(partial_products[13][2]), .Y4(partial_products[13][3]),
        .Y5(partial_products[13][4]), .Y6(partial_products[13][5]), .Y7(partial_products[13][6]), .Y8(partial_products[13][7]),
        .Y9(partial_products[13][8]), .Y10(partial_products[13][9]), .Y11(partial_products[13][10]), .Y12(partial_products[13][11]),
        .Y13(partial_products[13][12]), .Y14(partial_products[13][13]), .Y15(partial_products[13][14]), .Y16(partial_products[13][15]),
        .Y17(partial_products[13][16]), .Y18(partial_products[13][17]), .Y19(partial_products[13][18]), .Y20(partial_products[13][19])
    );

    W_h2h_r14 i2h_mul_inst_14 (
        .X(h_15),
        .Y1(partial_products[14][0]), .Y2(partial_products[14][1]), .Y3(partial_products[14][2]), .Y4(partial_products[14][3]),
        .Y5(partial_products[14][4]), .Y6(partial_products[14][5]), .Y7(partial_products[14][6]), .Y8(partial_products[14][7]),
        .Y9(partial_products[14][8]), .Y10(partial_products[14][9]), .Y11(partial_products[14][10]), .Y12(partial_products[14][11]),
        .Y13(partial_products[14][12]), .Y14(partial_products[14][13]), .Y15(partial_products[14][14]), .Y16(partial_products[14][15]),
        .Y17(partial_products[14][16]), .Y18(partial_products[14][17]), .Y19(partial_products[14][18]), .Y20(partial_products[14][19])
    );

    W_h2h_r15 i2h_mul_inst_15 (
        .X(h_16),
        .Y1(partial_products[15][0]), .Y2(partial_products[15][1]), .Y3(partial_products[15][2]), .Y4(partial_products[15][3]),
        .Y5(partial_products[15][4]), .Y6(partial_products[15][5]), .Y7(partial_products[15][6]), .Y8(partial_products[15][7]),
        .Y9(partial_products[15][8]), .Y10(partial_products[15][9]), .Y11(partial_products[15][10]), .Y12(partial_products[15][11]),
        .Y13(partial_products[15][12]), .Y14(partial_products[15][13]), .Y15(partial_products[15][14]), .Y16(partial_products[15][15]),
        .Y17(partial_products[15][16]), .Y18(partial_products[15][17]), .Y19(partial_products[15][18]), .Y20(partial_products[15][19])
    );

    W_h2h_r16 i2h_mul_inst_16 (
        .X(h_17),
        .Y1(partial_products[16][0]), .Y2(partial_products[16][1]), .Y3(partial_products[16][2]), .Y4(partial_products[16][3]),
        .Y5(partial_products[16][4]), .Y6(partial_products[16][5]), .Y7(partial_products[16][6]), .Y8(partial_products[16][7]),
        .Y9(partial_products[16][8]), .Y10(partial_products[16][9]), .Y11(partial_products[16][10]), .Y12(partial_products[16][11]),
        .Y13(partial_products[16][12]), .Y14(partial_products[16][13]), .Y15(partial_products[16][14]), .Y16(partial_products[16][15]),
        .Y17(partial_products[16][16]), .Y18(partial_products[16][17]), .Y19(partial_products[16][18]), .Y20(partial_products[16][19])
    );

    W_h2h_r17 i2h_mul_inst_17 (
        .X(h_18),
        .Y1(partial_products[17][0]), .Y2(partial_products[17][1]), .Y3(partial_products[17][2]), .Y4(partial_products[17][3]),
        .Y5(partial_products[17][4]), .Y6(partial_products[17][5]), .Y7(partial_products[17][6]), .Y8(partial_products[17][7]),
        .Y9(partial_products[17][8]), .Y10(partial_products[17][9]), .Y11(partial_products[17][10]), .Y12(partial_products[17][11]),
        .Y13(partial_products[17][12]), .Y14(partial_products[17][13]), .Y15(partial_products[17][14]), .Y16(partial_products[17][15]),
        .Y17(partial_products[17][16]), .Y18(partial_products[17][17]), .Y19(partial_products[17][18]), .Y20(partial_products[17][19])
    );

    W_h2h_r18 i2h_mul_inst_18 (
        .X(h_19),
        .Y1(partial_products[18][0]), .Y2(partial_products[18][1]), .Y3(partial_products[18][2]), .Y4(partial_products[18][3]),
        .Y5(partial_products[18][4]), .Y6(partial_products[18][5]), .Y7(partial_products[18][6]), .Y8(partial_products[18][7]),
        .Y9(partial_products[18][8]), .Y10(partial_products[18][9]), .Y11(partial_products[18][10]), .Y12(partial_products[18][11]),
        .Y13(partial_products[18][12]), .Y14(partial_products[18][13]), .Y15(partial_products[18][14]), .Y16(partial_products[18][15]),
        .Y17(partial_products[18][16]), .Y18(partial_products[18][17]), .Y19(partial_products[18][18]), .Y20(partial_products[18][19])
    );

    W_h2h_r19 i2h_mul_inst_19 (
        .X(h_20),
        .Y1(partial_products[19][0]), .Y2(partial_products[19][1]), .Y3(partial_products[19][2]), .Y4(partial_products[19][3]),
        .Y5(partial_products[19][4]), .Y6(partial_products[19][5]), .Y7(partial_products[19][6]), .Y8(partial_products[19][7]),
        .Y9(partial_products[19][8]), .Y10(partial_products[19][9]), .Y11(partial_products[19][10]), .Y12(partial_products[19][11]),
        .Y13(partial_products[19][12]), .Y14(partial_products[19][13]), .Y15(partial_products[19][14]), .Y16(partial_products[19][15]),
        .Y17(partial_products[19][16]), .Y18(partial_products[19][17]), .Y19(partial_products[19][18]), .Y20(partial_products[19][19])
    );


    // --- 3. Suma de columnas paralela (con generate) ---
    reg signed [BW_OUT-1:0] column_sums [0:HIDDEN_SIZE-1];

    genvar j_sum;
    
    generate
        // Itera sobre las COLUMNAS (j)
        for (j_sum = 0; j_sum < HIDDEN_SIZE; j_sum = j_sum + 1) begin : parallel_column_sum

            // Instancia 20 bloques 'always' independientes, uno por columna
            always @(*) begin : sum_combinational_block 

                reg signed [BW_OUT-1:0] sum_accumulator;
                integer i_row;                               
                
                // Inicializa el acumulador
                sum_accumulator = 0; 
                
                // Bucle interno: Suma verticalmente la columna 'j_sum'
                for (i_row = 0; i_row < HIDDEN_SIZE; i_row = i_row + 1) 
                begin
                    // Acumula el producto parcial.
                    sum_accumulator = sum_accumulator + partial_products[i_row][j_sum];
                end

                column_sums[j_sum] = sum_accumulator;
                
            end 
        end
    endgenerate


    assign h2h_1 = column_sums[0];
    assign h2h_2 = column_sums[1];
    assign h2h_3 = column_sums[2];
    assign h2h_4 = column_sums[3];
    assign h2h_5 = column_sums[4];
    assign h2h_6 = column_sums[5];
    assign h2h_7 = column_sums[6];
    assign h2h_8 = column_sums[7];
    assign h2h_9 = column_sums[8];
    assign h2h_10 = column_sums[9];
    assign h2h_11 = column_sums[10];
    assign h2h_12 = column_sums[11];
    assign h2h_13 = column_sums[12];
    assign h2h_14 = column_sums[13];
    assign h2h_15 = column_sums[14];
    assign h2h_16 = column_sums[15];
    assign h2h_17 = column_sums[16];
    assign h2h_18 = column_sums[17];
    assign h2h_19 = column_sums[18];
    assign h2h_20 = column_sums[19];
endmodule