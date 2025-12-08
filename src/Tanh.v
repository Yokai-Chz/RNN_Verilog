`timescale 1ns/1ps

module Tanh(
    input      signed [39:0] x,
    output reg signed [31:0] y
);
    
    // --- Límites de entrada  ---
    // (Valor decimal * 2^15)
    localparam signed [39:0] LIM_2_375 = 32'sd77824;  // 2.375
    localparam signed [39:0] LIM_1_5   = 32'sd49152;  // 1.5
    localparam signed [39:0] LIM_1_0   = 32'sd32768;  // 1.0
    localparam signed [39:0] LIM_0_5   = 32'sd16384;  // 0.5

    // --- Constantes de offset ---
    // (Valor decimal * 2^15)
    localparam signed [39:0] OFFSET_RAMP1 = 32'sd25088;  // 0.765625
    localparam signed [39:0] OFFSET_RAMP2 = 32'sd15872;  // 0.484375
    localparam signed [39:0] OFFSET_RAMP3 = 32'sd5632;   // 0.171875

    // --- Constantes de saturación ---
    localparam signed [39:0] Y_ONE_POS =  32'sd32768;  // 1.0
    localparam signed [39:0] Y_ONE_NEG = -32'sd32768;  // -1.0

    // --- Valor absoluto ---
    wire signed [39:0] x_abs = (x < 0) ? -x : x;
    
    // --- Lógica de Rampas (shift-and-add) ---
    // Los desplazamientos (>>>) son aritméticos y funcionan igual, pero sobre un bus de 37 bits.
    // El resultado de la pendiente se trunca a 32 bits antes de sumar el offset.
    
    // Rampa 1: y = 0.09375x + 0.765625  (m = 1/16 + 1/32)
    wire signed [39:0] y_ramp1_slope = (x_abs >>> 4) + (x_abs >>> 5);
    wire signed [39:0] y_ramp1       = y_ramp1_slope + OFFSET_RAMP1;
    
    // Rampa 2: y = 0.28125x + 0.484375  (m = 1/4 + 1/32)
    wire signed [39:0] y_ramp2_slope = (x_abs >>> 2) + (x_abs >>> 5);
    wire signed [39:0] y_ramp2       = y_ramp2_slope + OFFSET_RAMP2;
    
    // Rampa 3: y = 0.59375x + 0.171875  (m = 1/2 + 1/16 + 1/32)
    wire signed [39:0] y_ramp3_slope = (x_abs >>> 1) + (x_abs >>> 4) + (x_abs >>> 5);
    wire signed [39:0] y_ramp3       = y_ramp3_slope + OFFSET_RAMP3;
    
    // Rampa 4: y = 0.9375x             (m = 1 - 1/16)
    wire signed [39:0] y_ramp4_slope = x_abs - (x_abs >>> 4);
    wire signed [39:0] y_ramp4       = y_ramp4_slope; 
    
    // --- Lógica del Multiplexor y Simetría ---
    
    // Variable temporal para el resultado positivo (para x_abs)
    reg signed [39:0] y_abs_result; 
    
    always @(*) begin
        // 1. Selecciona la rampa basándose en el valor absoluto (x_abs)
        if (x_abs >= LIM_2_375) begin
            y_abs_result = Y_ONE_POS; // Saturación
        end
        else if (x_abs >= LIM_1_5) begin
            y_abs_result = y_ramp1;
        end
        else if (x_abs >= LIM_1_0) begin
            y_abs_result = y_ramp2;
        end
        else if (x_abs >= LIM_0_5) begin
            y_abs_result = y_ramp3;
        end
        else begin // (x_abs < LIM_0_5)
            y_abs_result = y_ramp4;
        end
                
        // Aplicacion de simetria de Tanh 
        
        assign y = (x < 0) ? -y_abs_result[31:0] : y_abs_result[31:0];
    end

endmodule