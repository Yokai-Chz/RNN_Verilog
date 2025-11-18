module hidden2hidden_1x20_20x20 #(
    parameter integer INPUT_SIZE  = 20,  // N: Tamaño del vector de entrada
    parameter integer HIDDEN_SIZE = 20,  // M: Tamaño de la capa oculta
    parameter integer BW_IN       = 32,
    parameter integer BW_OUT      = 32
) (
    input  wire signed [INPUT_SIZE*BW_IN-1:0]   input_vector_bus, 
    // --- CAMBIO: Salida es 'wire' para permitir asignaciones paralelas ---
    output wire signed [HIDDEN_SIZE*BW_OUT-1:0] output_vector_bus
);

    // --- 1. Desempaquetar el bus de entrada (Orden MSB) ---
    wire signed [BW_IN-1:0] input_elements [INPUT_SIZE-1:0];

    genvar i_unpack;
    generate
        for (i_unpack = 0; i_unpack < INPUT_SIZE; i_unpack = i_unpack + 1) begin : unpack_input_bus
            // --- CAMBIO MSB: Invertimos el índice de lectura ---
            localparam integer base_idx = (INPUT_SIZE - 1 - i_unpack) * BW_IN;
            assign input_elements[i_unpack] = input_vector_bus[base_idx +: BW_IN];
        end
    endgenerate

    // --- 2. Calcular productos parciales (h_i * W_row_i) ---
    wire signed [BW_OUT-1:0] partial_products [INPUT_SIZE-1:0][HIDDEN_SIZE-1:0];

    W_h2h_r0 i2h_mul_inst_0 (
        .X(input_elements[0]),
        .Y1(partial_products[0][0]), .Y2(partial_products[0][1]), .Y3(partial_products[0][2]), .Y4(partial_products[0][3]),
        .Y5(partial_products[0][4]), .Y6(partial_products[0][5]), .Y7(partial_products[0][6]), .Y8(partial_products[0][7]),
        .Y9(partial_products[0][8]), .Y10(partial_products[0][9]), .Y11(partial_products[0][10]), .Y12(partial_products[0][11]),
        .Y13(partial_products[0][12]), .Y14(partial_products[0][13]), .Y15(partial_products[0][14]), .Y16(partial_products[0][15]),
        .Y17(partial_products[0][16]), .Y18(partial_products[0][17]), .Y19(partial_products[0][18]), .Y20(partial_products[0][19])
    );

    W_h2h_r1 i2h_mul_inst_1 (
        .X(input_elements[1]),
        .Y1(partial_products[1][0]), .Y2(partial_products[1][1]), .Y3(partial_products[1][2]), .Y4(partial_products[1][3]),
        .Y5(partial_products[1][4]), .Y6(partial_products[1][5]), .Y7(partial_products[1][6]), .Y8(partial_products[1][7]),
        .Y9(partial_products[1][8]), .Y10(partial_products[1][9]), .Y11(partial_products[1][10]), .Y12(partial_products[1][11]),
        .Y13(partial_products[1][12]), .Y14(partial_products[1][13]), .Y15(partial_products[1][14]), .Y16(partial_products[1][15]),
        .Y17(partial_products[1][16]), .Y18(partial_products[1][17]), .Y19(partial_products[1][18]), .Y20(partial_products[1][19])
    );

    W_h2h_r2 i2h_mul_inst_2 (
        .X(input_elements[2]),
        .Y1(partial_products[2][0]), .Y2(partial_products[2][1]), .Y3(partial_products[2][2]), .Y4(partial_products[2][3]),
        .Y5(partial_products[2][4]), .Y6(partial_products[2][5]), .Y7(partial_products[2][6]), .Y8(partial_products[2][7]),
        .Y9(partial_products[2][8]), .Y10(partial_products[2][9]), .Y11(partial_products[2][10]), .Y12(partial_products[2][11]),
        .Y13(partial_products[2][12]), .Y14(partial_products[2][13]), .Y15(partial_products[2][14]), .Y16(partial_products[2][15]),
        .Y17(partial_products[2][16]), .Y18(partial_products[2][17]), .Y19(partial_products[2][18]), .Y20(partial_products[2][19])
    );

    W_h2h_r3 i2h_mul_inst_3 (
        .X(input_elements[3]),
        .Y1(partial_products[3][0]), .Y2(partial_products[3][1]), .Y3(partial_products[3][2]), .Y4(partial_products[3][3]),
        .Y5(partial_products[3][4]), .Y6(partial_products[3][5]), .Y7(partial_products[3][6]), .Y8(partial_products[3][7]),
        .Y9(partial_products[3][8]), .Y10(partial_products[3][9]), .Y11(partial_products[3][10]), .Y12(partial_products[3][11]),
        .Y13(partial_products[3][12]), .Y14(partial_products[3][13]), .Y15(partial_products[3][14]), .Y16(partial_products[3][15]),
        .Y17(partial_products[3][16]), .Y18(partial_products[3][17]), .Y19(partial_products[3][18]), .Y20(partial_products[3][19])
    );

    W_h2h_r4 i2h_mul_inst_4 (
        .X(input_elements[4]),
        .Y1(partial_products[4][0]), .Y2(partial_products[4][1]), .Y3(partial_products[4][2]), .Y4(partial_products[4][3]),
        .Y5(partial_products[4][4]), .Y6(partial_products[4][5]), .Y7(partial_products[4][6]), .Y8(partial_products[4][7]),
        .Y9(partial_products[4][8]), .Y10(partial_products[4][9]), .Y11(partial_products[4][10]), .Y12(partial_products[4][11]),
        .Y13(partial_products[4][12]), .Y14(partial_products[4][13]), .Y15(partial_products[4][14]), .Y16(partial_products[4][15]),
        .Y17(partial_products[4][16]), .Y18(partial_products[4][17]), .Y19(partial_products[4][18]), .Y20(partial_products[4][19])
    );

    W_h2h_r5 i2h_mul_inst_5 (
        .X(input_elements[5]),
        .Y1(partial_products[5][0]), .Y2(partial_products[5][1]), .Y3(partial_products[5][2]), .Y4(partial_products[5][3]),
        .Y5(partial_products[5][4]), .Y6(partial_products[5][5]), .Y7(partial_products[5][6]), .Y8(partial_products[5][7]),
        .Y9(partial_products[5][8]), .Y10(partial_products[5][9]), .Y11(partial_products[5][10]), .Y12(partial_products[5][11]),
        .Y13(partial_products[5][12]), .Y14(partial_products[5][13]), .Y15(partial_products[5][14]), .Y16(partial_products[5][15]),
        .Y17(partial_products[5][16]), .Y18(partial_products[5][17]), .Y19(partial_products[5][18]), .Y20(partial_products[5][19])
    );

    W_h2h_r6 i2h_mul_inst_6 (
        .X(input_elements[6]),
        .Y1(partial_products[6][0]), .Y2(partial_products[6][1]), .Y3(partial_products[6][2]), .Y4(partial_products[6][3]),
        .Y5(partial_products[6][4]), .Y6(partial_products[6][5]), .Y7(partial_products[6][6]), .Y8(partial_products[6][7]),
        .Y9(partial_products[6][8]), .Y10(partial_products[6][9]), .Y11(partial_products[6][10]), .Y12(partial_products[6][11]),
        .Y13(partial_products[6][12]), .Y14(partial_products[6][13]), .Y15(partial_products[6][14]), .Y16(partial_products[6][15]),
        .Y17(partial_products[6][16]), .Y18(partial_products[6][17]), .Y19(partial_products[6][18]), .Y20(partial_products[6][19])
    );

    W_h2h_r7 i2h_mul_inst_7 (
        .X(input_elements[7]),
        .Y1(partial_products[7][0]), .Y2(partial_products[7][1]), .Y3(partial_products[7][2]), .Y4(partial_products[7][3]),
        .Y5(partial_products[7][4]), .Y6(partial_products[7][5]), .Y7(partial_products[7][6]), .Y8(partial_products[7][7]),
        .Y9(partial_products[7][8]), .Y10(partial_products[7][9]), .Y11(partial_products[7][10]), .Y12(partial_products[7][11]),
        .Y13(partial_products[7][12]), .Y14(partial_products[7][13]), .Y15(partial_products[7][14]), .Y16(partial_products[7][15]),
        .Y17(partial_products[7][16]), .Y18(partial_products[7][17]), .Y19(partial_products[7][18]), .Y20(partial_products[7][19])
    );

    W_h2h_r8 i2h_mul_inst_8 (
        .X(input_elements[8]),
        .Y1(partial_products[8][0]), .Y2(partial_products[8][1]), .Y3(partial_products[8][2]), .Y4(partial_products[8][3]),
        .Y5(partial_products[8][4]), .Y6(partial_products[8][5]), .Y7(partial_products[8][6]), .Y8(partial_products[8][7]),
        .Y9(partial_products[8][8]), .Y10(partial_products[8][9]), .Y11(partial_products[8][10]), .Y12(partial_products[8][11]),
        .Y13(partial_products[8][12]), .Y14(partial_products[8][13]), .Y15(partial_products[8][14]), .Y16(partial_products[8][15]),
        .Y17(partial_products[8][16]), .Y18(partial_products[8][17]), .Y19(partial_products[8][18]), .Y20(partial_products[8][19])
    );

    W_h2h_r9 i2h_mul_inst_9 (
        .X(input_elements[9]),
        .Y1(partial_products[9][0]), .Y2(partial_products[9][1]), .Y3(partial_products[9][2]), .Y4(partial_products[9][3]),
        .Y5(partial_products[9][4]), .Y6(partial_products[9][5]), .Y7(partial_products[9][6]), .Y8(partial_products[9][7]),
        .Y9(partial_products[9][8]), .Y10(partial_products[9][9]), .Y11(partial_products[9][10]), .Y12(partial_products[9][11]),
        .Y13(partial_products[9][12]), .Y14(partial_products[9][13]), .Y15(partial_products[9][14]), .Y16(partial_products[9][15]),
        .Y17(partial_products[9][16]), .Y18(partial_products[9][17]), .Y19(partial_products[9][18]), .Y20(partial_products[9][19])
    );

    W_h2h_r10 i2h_mul_inst_10 (
        .X(input_elements[10]),
        .Y1(partial_products[10][0]), .Y2(partial_products[10][1]), .Y3(partial_products[10][2]), .Y4(partial_products[10][3]),
        .Y5(partial_products[10][4]), .Y6(partial_products[10][5]), .Y7(partial_products[10][6]), .Y8(partial_products[10][7]),
        .Y9(partial_products[10][8]), .Y10(partial_products[10][9]), .Y11(partial_products[10][10]), .Y12(partial_products[10][11]),
        .Y13(partial_products[10][12]), .Y14(partial_products[10][13]), .Y15(partial_products[10][14]), .Y16(partial_products[10][15]),
        .Y17(partial_products[10][16]), .Y18(partial_products[10][17]), .Y19(partial_products[10][18]), .Y20(partial_products[10][19])
    );

    W_h2h_r11 i2h_mul_inst_11 (
        .X(input_elements[11]),
        .Y1(partial_products[11][0]), .Y2(partial_products[11][1]), .Y3(partial_products[11][2]), .Y4(partial_products[11][3]),
        .Y5(partial_products[11][4]), .Y6(partial_products[11][5]), .Y7(partial_products[11][6]), .Y8(partial_products[11][7]),
        .Y9(partial_products[11][8]), .Y10(partial_products[11][9]), .Y11(partial_products[11][10]), .Y12(partial_products[11][11]),
        .Y13(partial_products[11][12]), .Y14(partial_products[11][13]), .Y15(partial_products[11][14]), .Y16(partial_products[11][15]),
        .Y17(partial_products[11][16]), .Y18(partial_products[11][17]), .Y19(partial_products[11][18]), .Y20(partial_products[11][19])
    );

    W_h2h_r12 i2h_mul_inst_12 (
        .X(input_elements[12]),
        .Y1(partial_products[12][0]), .Y2(partial_products[12][1]), .Y3(partial_products[12][2]), .Y4(partial_products[12][3]),
        .Y5(partial_products[12][4]), .Y6(partial_products[12][5]), .Y7(partial_products[12][6]), .Y8(partial_products[12][7]),
        .Y9(partial_products[12][8]), .Y10(partial_products[12][9]), .Y11(partial_products[12][10]), .Y12(partial_products[12][11]),
        .Y13(partial_products[12][12]), .Y14(partial_products[12][13]), .Y15(partial_products[12][14]), .Y16(partial_products[12][15]),
        .Y17(partial_products[12][16]), .Y18(partial_products[12][17]), .Y19(partial_products[12][18]), .Y20(partial_products[12][19])
    );

    W_h2h_r13 i2h_mul_inst_13 (
        .X(input_elements[13]),
        .Y1(partial_products[13][0]), .Y2(partial_products[13][1]), .Y3(partial_products[13][2]), .Y4(partial_products[13][3]),
        .Y5(partial_products[13][4]), .Y6(partial_products[13][5]), .Y7(partial_products[13][6]), .Y8(partial_products[13][7]),
        .Y9(partial_products[13][8]), .Y10(partial_products[13][9]), .Y11(partial_products[13][10]), .Y12(partial_products[13][11]),
        .Y13(partial_products[13][12]), .Y14(partial_products[13][13]), .Y15(partial_products[13][14]), .Y16(partial_products[13][15]),
        .Y17(partial_products[13][16]), .Y18(partial_products[13][17]), .Y19(partial_products[13][18]), .Y20(partial_products[13][19])
    );

    W_h2h_r14 i2h_mul_inst_14 (
        .X(input_elements[14]),
        .Y1(partial_products[14][0]), .Y2(partial_products[14][1]), .Y3(partial_products[14][2]), .Y4(partial_products[14][3]),
        .Y5(partial_products[14][4]), .Y6(partial_products[14][5]), .Y7(partial_products[14][6]), .Y8(partial_products[14][7]),
        .Y9(partial_products[14][8]), .Y10(partial_products[14][9]), .Y11(partial_products[14][10]), .Y12(partial_products[14][11]),
        .Y13(partial_products[14][12]), .Y14(partial_products[14][13]), .Y15(partial_products[14][14]), .Y16(partial_products[14][15]),
        .Y17(partial_products[14][16]), .Y18(partial_products[14][17]), .Y19(partial_products[14][18]), .Y20(partial_products[14][19])
    );

    W_h2h_r15 i2h_mul_inst_15 (
        .X(input_elements[15]),
        .Y1(partial_products[15][0]), .Y2(partial_products[15][1]), .Y3(partial_products[15][2]), .Y4(partial_products[15][3]),
        .Y5(partial_products[15][4]), .Y6(partial_products[15][5]), .Y7(partial_products[15][6]), .Y8(partial_products[15][7]),
        .Y9(partial_products[15][8]), .Y10(partial_products[15][9]), .Y11(partial_products[15][10]), .Y12(partial_products[15][11]),
        .Y13(partial_products[15][12]), .Y14(partial_products[15][13]), .Y15(partial_products[15][14]), .Y16(partial_products[15][15]),
        .Y17(partial_products[15][16]), .Y18(partial_products[15][17]), .Y19(partial_products[15][18]), .Y20(partial_products[15][19])
    );

    W_h2h_r16 i2h_mul_inst_16 (
        .X(input_elements[16]),
        .Y1(partial_products[16][0]), .Y2(partial_products[16][1]), .Y3(partial_products[16][2]), .Y4(partial_products[16][3]),
        .Y5(partial_products[16][4]), .Y6(partial_products[16][5]), .Y7(partial_products[16][6]), .Y8(partial_products[16][7]),
        .Y9(partial_products[16][8]), .Y10(partial_products[16][9]), .Y11(partial_products[16][10]), .Y12(partial_products[16][11]),
        .Y13(partial_products[16][12]), .Y14(partial_products[16][13]), .Y15(partial_products[16][14]), .Y16(partial_products[16][15]),
        .Y17(partial_products[16][16]), .Y18(partial_products[16][17]), .Y19(partial_products[16][18]), .Y20(partial_products[16][19])
    );

    W_h2h_r17 i2h_mul_inst_17 (
        .X(input_elements[17]),
        .Y1(partial_products[17][0]), .Y2(partial_products[17][1]), .Y3(partial_products[17][2]), .Y4(partial_products[17][3]),
        .Y5(partial_products[17][4]), .Y6(partial_products[17][5]), .Y7(partial_products[17][6]), .Y8(partial_products[17][7]),
        .Y9(partial_products[17][8]), .Y10(partial_products[17][9]), .Y11(partial_products[17][10]), .Y12(partial_products[17][11]),
        .Y13(partial_products[17][12]), .Y14(partial_products[17][13]), .Y15(partial_products[17][14]), .Y16(partial_products[17][15]),
        .Y17(partial_products[17][16]), .Y18(partial_products[17][17]), .Y19(partial_products[17][18]), .Y20(partial_products[17][19])
    );

    W_h2h_r18 i2h_mul_inst_18 (
        .X(input_elements[18]),
        .Y1(partial_products[18][0]), .Y2(partial_products[18][1]), .Y3(partial_products[18][2]), .Y4(partial_products[18][3]),
        .Y5(partial_products[18][4]), .Y6(partial_products[18][5]), .Y7(partial_products[18][6]), .Y8(partial_products[18][7]),
        .Y9(partial_products[18][8]), .Y10(partial_products[18][9]), .Y11(partial_products[18][10]), .Y12(partial_products[18][11]),
        .Y13(partial_products[18][12]), .Y14(partial_products[18][13]), .Y15(partial_products[18][14]), .Y16(partial_products[18][15]),
        .Y17(partial_products[18][16]), .Y18(partial_products[18][17]), .Y19(partial_products[18][18]), .Y20(partial_products[18][19])
    );

    W_h2h_r19 i2h_mul_inst_19 (
        .X(input_elements[19]),
        .Y1(partial_products[19][0]), .Y2(partial_products[19][1]), .Y3(partial_products[19][2]), .Y4(partial_products[19][3]),
        .Y5(partial_products[19][4]), .Y6(partial_products[19][5]), .Y7(partial_products[19][6]), .Y8(partial_products[19][7]),
        .Y9(partial_products[19][8]), .Y10(partial_products[19][9]), .Y11(partial_products[19][10]), .Y12(partial_products[19][11]),
        .Y13(partial_products[19][12]), .Y14(partial_products[19][13]), .Y15(partial_products[19][14]), .Y16(partial_products[19][15]),
        .Y17(partial_products[19][16]), .Y18(partial_products[19][17]), .Y19(partial_products[19][18]), .Y20(partial_products[19][19])
    );


    // --- 3. Suma de columnas paralela (con generate) ---
    // Array para los 20 resultados de suma (sigue siendo la salida)
    reg signed [BW_OUT-1:0] column_sums [HIDDEN_SIZE-1:0];

    genvar j_sum;
    // 'i_row' ya no se declara aquí

    generate
        // Itera sobre las COLUMNAS (j)
        for (j_sum = 0; j_sum < HIDDEN_SIZE; j_sum = j_sum + 1) begin : parallel_column_sum

            // Instancia 20 bloques 'always' independientes, uno por columna
            always @(*) begin : sum_combinational_block // <-- Nombramos el bloque

                // --- SOLUCIÓN: Declarar variables DENTRO de un bloque nombrado ---
                reg signed [BW_OUT + 5 - 1:0] sum_accumulator; // 37 bits
                integer i_row;                               // 'i_row' se declara aquí
                
                // Inicializa el acumulador ancho
                sum_accumulator = 37'sd0; 
                
                // Bucle interno: Suma verticalmente la columna 'j_sum'
                for (i_row = 0; i_row < INPUT_SIZE; i_row = i_row + 1) 
                begin
                    // Acumula en 37 bits
                    sum_accumulator = sum_accumulator + partial_products[i_row][j_sum];
                end

                // --- CORRECCIÓN: Asignación con saturación para evitar desbordamiento ---
                localparam signed [36:0] MAX_ACC_VAL = {5'b0, 32'h7FFFFFFF};
                localparam signed [36:0] MIN_ACC_VAL = {5'b1, 32'h80000000};

                if (sum_accumulator > MAX_ACC_VAL) begin
                    column_sums[j_sum] = 32'h7FFFFFFF;
                end else if (sum_accumulator < MIN_ACC_VAL) begin
                    column_sums[j_sum] = 32'h80000000;
                end else begin
                    column_sums[j_sum] = sum_accumulator[31:0];
                end
                
            end // fin del bloque: sum_combinational_block
        end
    endgenerate


    // --- 4. Empaquetar el bus de salida (Orden MSB) ---
    genvar j_pack;
    generate
        for (j_pack = 0; j_pack < HIDDEN_SIZE; j_pack = j_pack + 1) begin : pack_output_bus
            // --- CAMBIO MSB: Invertimos el índice de escritura ---
            localparam integer base_idx = (HIDDEN_SIZE - 1 - j_pack) * BW_OUT;
            assign output_vector_bus[base_idx +: BW_OUT] = column_sums[j_pack];
        end
    endgenerate

endmodule

module hiddenComplete #(
    parameter integer INPUT_SIZE         = 1 ,   // X: Tamaño del vector de entrada
    parameter integer INPUT_HIDDEN_SIZE  = 20,  // X: Tamaño del vector de entrada
    parameter integer HIDDEN_SIZE        = 20,  // M: Tamaño de la capa oculta
    parameter integer BW_IN              = 32,
    parameter integer BW_OUT             = 32
)(
    input  wire signed [INPUT_HIDDEN_SIZE*BW_IN-1:0]   hidden_vector_bus, 
    input  wire signed [INPUT_SIZE*BW_IN-1:0]          input_vector_bus,
    output wire signed [HIDDEN_SIZE*BW_OUT-1:0] output_vector_bus
);
    
    // --- 1. Multiplicación 1x1 por 1x20 (W_i2r_w0) ---
    wire signed [BW_OUT-1:0] partial_products_input_ARRAY [HIDDEN_SIZE-1:0];

    W_i2h_r0 i2h_input (
        .X(input_vector_bus),
        .Y1(partial_products_input_ARRAY[0]), .Y2(partial_products_input_ARRAY[1]), .Y3(partial_products_input_ARRAY[2]), .Y4(partial_products_input_ARRAY[3]),
        .Y5(partial_products_input_ARRAY[4]), .Y6(partial_products_input_ARRAY[5]), .Y7(partial_products_input_ARRAY[6]), .Y8(partial_products_input_ARRAY[7]),
        .Y9(partial_products_input_ARRAY[8]), .Y10(partial_products_input_ARRAY[9]), .Y11(partial_products_input_ARRAY[10]), .Y12(partial_products_input_ARRAY[11]),
        .Y13(partial_products_input_ARRAY[12]), .Y14(partial_products_input_ARRAY[13]), .Y15(partial_products_input_ARRAY[14]), .Y16(partial_products_input_ARRAY[15]),
        .Y17(partial_products_input_ARRAY[16]), .Y18(partial_products_input_ARRAY[17]), .Y19(partial_products_input_ARRAY[18]), .Y20(partial_products_input_ARRAY[19])
    );

    // --- 2. Multiplicación 1x20 por 20x20 (hidden2hidden) ---
    wire signed [HIDDEN_SIZE*BW_OUT-1:0] partial_products_hidden_BUS; // [639:0]

    hidden2hidden_1x20_20x20 h2h_mult(
        .input_vector_bus(hidden_vector_bus),
        .output_vector_bus(partial_products_hidden_BUS) 
    );


    wire signed [HIDDEN_SIZE*BW_OUT-1:0] partial_products_input_BUS; // [639:0]

    genvar j_pack;
    generate
        for (j_pack = 0; j_pack < HIDDEN_SIZE; j_pack = j_pack + 1) begin : pack_input_result_bus
            // Orden MSB
            localparam integer base_idx = (HIDDEN_SIZE - 1 - j_pack) * BW_OUT;
            assign partial_products_input_BUS[base_idx +: BW_OUT] = partial_products_input_ARRAY[j_pack];
        end
    endgenerate


    // --- 4. Suma final (Corregida) ---
    genvar i_add;
    generate
        for (i_add = 0; i_add < HIDDEN_SIZE; i_add = i_add + 1) begin : neuronal_addition
            localparam integer base_idx = (HIDDEN_SIZE - 1 - i_add) * BW_OUT;
            
            // --- DEFINICIÓN DE LÍMITES ---
            localparam signed [BW_OUT-1:0] MAX_VAL = 32'h7FFFFFFF; 
            localparam signed [BW_OUT-1:0] MIN_VAL = 32'h80000000;

            // --- WIRES PARA LA SUMA ---
            wire signed [BW_OUT-1:0] hidden;
            wire signed [BW_OUT-1:0] inputPart;
            wire signed [BW_OUT:0]   sumResult_wide; // Cable de 33 bits para prevenir desbordamiento
            wire signed [BW_OUT-1:0] sumFinal;

            // --- CORRECCIÓN 1: Leer 'inputPart' del array, no del bus mal indexado ---
            assign hidden    = partial_products_hidden_BUS[base_idx +: BW_OUT];
            assign inputPart = partial_products_input_ARRAY[i_add];

            // --- CORRECCIÓN 2: Sumar en un cable ancho (33 bits) y LUEGO saturar ---
            assign sumResult_wide = {hidden[BW_OUT-1], hidden} + {inputPart[BW_OUT-1], inputPart};

            assign sumFinal = (sumResult_wide > {1'b0, MAX_VAL}) ? MAX_VAL :
                              (sumResult_wide < {1'b1, MIN_VAL}) ? MIN_VAL :
                              sumResult_wide[BW_OUT-1:0];

            assign output_vector_bus[base_idx +: BW_OUT] = sumFinal;
        end
    endgenerate

endmodule

module hidden_output #(
    parameter integer INPUT_SIZE = 20,  // Longitud del vector
    parameter integer BW_IN      = 32,  // Ancho de bits de cada elemento de entrada
    parameter integer BW_OUT     = 32   // Ancho de bits de la salida
)(
    // Vector de entrada 1x20
    input  wire signed [INPUT_SIZE*BW_IN-1:0]   input_vector_bus,
    
    // Resultado escalar 1x1 
    output wire signed [BW_OUT-1:0]             output_scalar
);

    // --- 1. Desempaquetar Bus de Entrada ---
    wire signed [BW_IN-1:0] input_elements [0:INPUT_SIZE-1];
    
    genvar i_unpack;
    generate
        for (i_unpack = 0; i_unpack < INPUT_SIZE; i_unpack = i_unpack + 1) begin : unpack_input_bus
            // orden MSB
            localparam integer base_idx = (INPUT_SIZE - 1 - i_unpack) * BW_IN;
            assign input_elements[i_unpack] = input_vector_bus[base_idx +: BW_IN];
        end
    endgenerate

    
    // --- 2. Multiplicaciones en Paralelo ---
    wire signed [BW_OUT-1:0] partial_products [0:INPUT_SIZE-1];

    W_h2o_r0  mul_0  (.X(input_elements[0]),  .Y(partial_products[0]));
    W_h2o_r1  mul_1  (.X(input_elements[1]),  .Y(partial_products[1]));
    W_h2o_r2  mul_2  (.X(input_elements[2]),  .Y(partial_products[2]));
    W_h2o_r3  mul_3  (.X(input_elements[3]),  .Y(partial_products[3]));
    W_h2o_r4  mul_4  (.X(input_elements[4]),  .Y(partial_products[4]));
    W_h2o_r5  mul_5  (.X(input_elements[5]),  .Y(partial_products[5]));
    W_h2o_r6  mul_6  (.X(input_elements[6]),  .Y(partial_products[6]));
    W_h2o_r7  mul_7  (.X(input_elements[7]),  .Y(partial_products[7]));
    W_h2o_r8  mul_8  (.X(input_elements[8]),  .Y(partial_products[8]));
    W_h2o_r9  mul_9  (.X(input_elements[9]),  .Y(partial_products[9]));
    W_h2o_r10 mul_10 (.X(input_elements[10]), .Y(partial_products[10]));
    W_h2o_r11 mul_11 (.X(input_elements[11]), .Y(partial_products[11]));
    W_h2o_r12 mul_12 (.X(input_elements[12]), .Y(partial_products[12]));
    W_h2o_r13 mul_13 (.X(input_elements[13]), .Y(partial_products[13]));
    W_h2o_r14 mul_14 (.X(input_elements[14]), .Y(partial_products[14]));
    W_h2o_r15 mul_15 (.X(input_elements[15]), .Y(partial_products[15]));
    W_h2o_r16 mul_16 (.X(input_elements[16]), .Y(partial_products[16]));
    W_h2o_r17 mul_17 (.X(input_elements[17]), .Y(partial_products[17]));
    W_h2o_r18 mul_18 (.X(input_elements[18]), .Y(partial_products[18]));
    W_h2o_r19 mul_19 (.X(input_elements[19]), .Y(partial_products[19]));


    // --- 3. Suma de Reducción ---
    
    reg signed [BW_OUT-1:0] output_scalar_reg;
    
    localparam integer ACC_WIDTH = BW_OUT + 5;
    
    integer k;
    reg signed [ACC_WIDTH-1:0] sum_accumulator; 

    always @(*) begin
        sum_accumulator = {ACC_WIDTH{1'b0}}; 
        
        for (k = 0; k < INPUT_SIZE; k = k + 1) begin
            sum_accumulator = sum_accumulator + partial_products[k];
        end
        
        // --- CORRECCIÓN: Asignación con saturación ---
        localparam signed [ACC_WIDTH-1:0] MAX_ACC_VAL = {5'b0, 32'h7FFFFFFF};
        localparam signed [ACC_WIDTH-1:0] MIN_ACC_VAL = {5'b1, 32'h80000000};
        
        if (sum_accumulator > MAX_ACC_VAL) begin
            output_scalar_reg = 32'h7FFFFFFF;
        end else if (sum_accumulator < MIN_ACC_VAL) begin
            output_scalar_reg = 32'h80000000;
        end else begin
            output_scalar_reg = sum_accumulator[31:0];
        end
    end

    assign output_scalar = output_scalar_reg;

endmodule