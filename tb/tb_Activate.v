// Testbench para el módulo Activate
`timescale 1ns / 1ps

module tb_Activate;

    // Parámetros para la prueba
    localparam INPUT_SIZE = 20;
    localparam BW_IN      = 32;
    localparam BW_OUT     = 32;

    // Parámetros de Punto Fijo (guiado por tb_tanh.v)
    // Se asume que tanto la entrada como la salida usan 15 bits fraccionales
    localparam FRAC_BITS = 15;
    localparam real SCALE = 2.0**FRAC_BITS; // Factor de escala (32768.0)

    // Señales de entrada y salida del testbench
    reg  signed [INPUT_SIZE*BW_IN-1:0]   tb_vectorA_bus;
    wire signed [INPUT_SIZE*BW_OUT-1:0]  tb_result_bus;

    // Variables 'real' para la prueba
    real r_in [0:2];
    real r_out [0:2];

    // Wires intermedios para preservar el signo en la conversión
    wire signed [BW_OUT-1:0] result_1, result_2, result_3;

    // Instancia del módulo a probar (DUT - Device Under Test)
    Activate #(
        .INPUT_SIZE(INPUT_SIZE),
        .BW_IN(BW_IN),
        .BW_OUT(BW_OUT)
    ) DUT (
        .vectorA_bus(tb_vectorA_bus),
        .result_bus(tb_result_bus)
    );

    // Asignar las salidas del bus a los wires intermedios
    assign result_1 = tb_result_bus[ (INPUT_SIZE-1)*BW_OUT +: BW_OUT ];
    assign result_2 = tb_result_bus[ (INPUT_SIZE-2)*BW_OUT +: BW_OUT ];
    assign result_3 = tb_result_bus[ (INPUT_SIZE-3)*BW_OUT +: BW_OUT ];

    // Bloque inicial para la generación de estímulos
    initial begin
        $display("Iniciando testbench para Activate con valores reales...");
        $display("Factor de escala (Qx.15): %f", SCALE);

        // 1. Inicializar la entrada a cero
        tb_vectorA_bus = 0;
        #10;

        // 2. Definir entradas como números reales
        r_in[0] = 2.125000;
        r_in[1] = -1.562500;
        r_in[2] = -0.562500;

        // 3. Convertir de 'real' a punto fijo y empaquetar en el bus
        tb_vectorA_bus[ (INPUT_SIZE-1)*BW_IN +: BW_IN ] = $rtoi(r_in[0] * SCALE);
        tb_vectorA_bus[ (INPUT_SIZE-2)*BW_IN +: BW_IN ] = $rtoi(r_in[1] * SCALE);
        tb_vectorA_bus[ (INPUT_SIZE-3)*BW_IN +: BW_IN ] = $rtoi(r_in[2] * SCALE);

        #20; // Esperar a que la lógica se propague

        // 4. Desempaquetar las salidas y convertirlas de vuelta a 'real'
        r_out[0] = $itor(result_1) / SCALE;
        r_out[1] = $itor(result_2) / SCALE;
        r_out[2] = $itor(result_3) / SCALE;

        // 5. Mostrar resultados
        $display("Resultados en formato 'real':");
        $display("Entrada[19]: %f, Salida[19]: %f", r_in[0], r_out[0]);
        $display("Entrada[18]: %f, Salida[18]: %f", r_in[1], r_out[1]);
        $display("Entrada[17]: %f, Salida[17]: %f", r_in[2], r_out[2]);

        #10;
        
        // Finalizar la simulación
        $display("Testbench para Activate finalizado.");
        $stop;
    end

endmodule