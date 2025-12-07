module hidden_output #(
    parameter integer HIDDEN_SIZE = 20,  // Tamaño de la capa oculta
    parameter integer BW_IN       = 32,  // Tamaño de entrada de bits 
    parameter integer BW_OUT      = 40  // Tamaño de salida de bits 
)(
    input  wire signed [BW_IN-1:0]  ha_1, ha_2, ha_3, ha_4, ha_5, ha_6, ha_7, ha_8, ha_9, ha_10, ha_11, ha_12, ha_13, ha_14, ha_15, ha_16, ha_17, ha_18, ha_19, ha_20,

    output wire signed [BW_OUT-1:0]  y_output
);

    // --- Empaquetar puertos en un array para un manejo más limpio ---
    wire signed [BW_IN-1:0] ha [0:HIDDEN_SIZE-1];
    assign ha[0]=ha_1; assign ha[1]=ha_2; assign ha[2]=ha_3; assign ha[3]=ha_4; assign ha[4]=ha_5; assign ha[5]=ha_6; assign ha[6]=ha_7; assign ha[7]=ha_8; assign ha[8]=ha_9; assign ha[9]=ha_10;
    assign ha[10]=ha_11; assign ha[11]=ha_12; assign ha[12]=ha_13; assign ha[13]=ha_14; assign ha[14]=ha_15; assign ha[15]=ha_16; assign ha[16]=ha_17; assign ha[17]=ha_18; assign ha[18]=ha_19; assign ha[19]=ha_20;
    
    // --- 1. Multiplicaciones en Paralelo ---
    wire signed [BW_IN-1:0] partial_products [0:HIDDEN_SIZE-1];

    // Instancias corregidas y explícitas
    W_h2o_r0  mul_0  (.X(ha[0]),  .Y(partial_products[0]));
    W_h2o_r1  mul_1  (.X(ha[1]),  .Y(partial_products[1]));
    W_h2o_r2  mul_2  (.X(ha[2]),  .Y(partial_products[2]));
    W_h2o_r3  mul_3  (.X(ha[3]),  .Y(partial_products[3]));
    W_h2o_r4  mul_4  (.X(ha[4]),  .Y(partial_products[4]));
    W_h2o_r5  mul_5  (.X(ha[5]),  .Y(partial_products[5]));
    W_h2o_r6  mul_6  (.X(ha[6]),  .Y(partial_products[6]));
    W_h2o_r7  mul_7  (.X(ha[7]),  .Y(partial_products[7]));
    W_h2o_r8  mul_8  (.X(ha[8]),  .Y(partial_products[8]));
    W_h2o_r9  mul_9  (.X(ha[9]),  .Y(partial_products[9]));
    W_h2o_r10 mul_10 (.X(ha[10]), .Y(partial_products[10]));
    W_h2o_r11 mul_11 (.X(ha[11]), .Y(partial_products[11]));
    W_h2o_r12 mul_12 (.X(ha[12]), .Y(partial_products[12]));
    W_h2o_r13 mul_13 (.X(ha[13]), .Y(partial_products[13]));
    W_h2o_r14 mul_14 (.X(ha[14]), .Y(partial_products[14]));
    W_h2o_r15 mul_15 (.X(ha[15]), .Y(partial_products[15]));
    W_h2o_r16 mul_16 (.X(ha[16]), .Y(partial_products[16]));
    W_h2o_r17 mul_17 (.X(ha[17]), .Y(partial_products[17]));
    W_h2o_r18 mul_18 (.X(ha[18]), .Y(partial_products[18]));
    W_h2o_r19 mul_19 (.X(ha[19]), .Y(partial_products[19]));

    // --- 2. Suma de Reducción ---
    reg signed [BW_OUT-1:0] sum_accumulator;
    integer k; 
    always @(*) begin
        sum_accumulator = 0; 
        for (k = 0; k < HIDDEN_SIZE; k = k + 1) begin
            sum_accumulator = sum_accumulator + partial_products[k];
        end
    end

    // Asigna el resultado a la salida. El ancho de 40 bits es suficiente.
    assign y_output = sum_accumulator;

endmodule