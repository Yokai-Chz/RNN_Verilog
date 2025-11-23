module Activate #(
    parameter INPUT_SIZE      = 20,   // Número de elementos en el vector
    parameter BW_IN           = 37,   // Ancho de bits de entrada (ahora 37)
    parameter BW_OUT          = 32    // Ancho de bits de salida (se mantiene en 32)
)(
    input  wire signed [INPUT_SIZE*BW_IN-1:0]   vectorA_bus,
    output wire signed [INPUT_SIZE*BW_OUT-1:0]  result_bus
);

    // 1. Crear arrays de wires para conectar las N instancias
    
    // Wire para cada entrada de 32 bits desempaquetada
    wire signed [BW_IN-1:0]  tanh_inputs [0:INPUT_SIZE-1]; // Será de 37 bits
    
    // Wire para cada salida de 32 bits de Tanh
    wire signed [BW_OUT-1:0] tanh_outputs [0:INPUT_SIZE-1]; // Será de 32 bits


    // 2. Generar N instancias del módulo Tanh
    genvar i;
    generate
        for (i = 0; i < INPUT_SIZE; i = i + 1) 
        begin : gen_tanh_instance
            
            // 2a. Desempaquetar el bus de entrada (Orden MSB)
            localparam integer base_idx_in = (INPUT_SIZE - 1 - i) * BW_IN;
            assign tanh_inputs[i] = vectorA_bus[base_idx_in +: BW_IN];

            
            // 2b. Instanciar el módulo Tanh
            Tanh u_tanh (
                .x(tanh_inputs[i]),      // Entrada de 37 bits
                .y(tanh_outputs[i])      // Salida de 32 bits
            );
            
            // 2c. Empaquetar el array de outputs en el bus de salida (Orden MSB)
            localparam integer base_idx_out = (INPUT_SIZE - 1 - i) * BW_OUT;
            assign result_bus[base_idx_out +: BW_OUT] = tanh_outputs[i];
            
        end
    endgenerate

endmodule