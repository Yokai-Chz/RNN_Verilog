`timescale 1ns/1ps

/*
============================================================================
 NOTA DE SIMULACIÓN:
 Este testbench (`tb_RNN.v`) requiere que los siguientes archivos fuente 
 sean compilados o incluidos por el simulador para que pueda encontrar 
 las definiciones de los módulos:
 
 Módulos Principales:
 - src/Matrix.v
 - src/Activate.v
 - src/Tanh.v
 - src/RNN.v
 
Módulos de Pesos:
 - src/Spiral_15B/i2h/W_i2h_r0.v
 - src/Spiral_15B/h2h/W_h2h_r*.v (todos los archivos del 0 al 19)
 - src/Spiral_15B/h2o/W_h2o_r0.v (que contiene del r0 al r19)
 
Ejemplo de comando de compilación (para Icarus Verilog):
 iverilog -o tb_rnn_sim -c file_list.txt
 
Donde `file_list.txt` contiene las rutas a todos los archivos .v necesarios.
============================================================================
*/

module tb_RNN;

    // ============================================================ 
    // Parámetros del Testbench
    // ============================================================ 
    localparam integer CLK_PERIOD      = 10; // Periodo del reloj en ns

    // --- Parámetros de Punto Fijo ---
    localparam integer BW_IN             = 32;
    localparam integer FRAC_BITS         = 15;
    localparam real    SCALE_FACTOR_REAL = 1.0 * (2**FRAC_BITS);

    // ============================================================ 
    // Señales del Testbench
    // ============================================================ 
    reg                            clk;
    reg                            rst_n;
    reg  signed [BW_IN-1:0]        tb_input_vector_bus;
    wire signed [BW_IN-1:0]        tb_output_scalar;

    // --- Variables para el procesamiento de archivos ---
    reg signed [BW_IN-1:0]         fixed_point_input;
    reg signed [BW_IN-1:0]         prev_fixed_point_input;
    integer                        input_file;
    integer                        output_file;
    integer                        read_status;
    real                           real_input;

    // ============================================================ 
    // Instancia del Módulo Bajo Prueba (DUT)
    // ============================================================ 
    RNN #(
        .INPUT_SIZE(1),
        .INPUT_HIDDEN_SIZE(20),
        .HIDDEN_SIZE(20),
        .OUTPUT_SIZE(1),
        .BW_IN(BW_IN),
        .BW_OUT(BW_IN)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .input_vector_bus(tb_input_vector_bus),
        .output_scalar(tb_output_scalar)
    );

    // ============================================================ 
    // Generador de Reloj
    // ============================================================ 
    always begin
        clk = 1'b0; #(CLK_PERIOD/2);
        clk = 1'b1; #(CLK_PERIOD/2);
    end

    // ============================================================ 
    // Procedimiento Principal de Prueba (Desde Archivo)
    // ============================================================ 
        initial begin
    
            $display("==================================================");
            $display("Inicio de la simulacion del testbench para RNN (desde archivo)");
            $display("Formato de datos: Punto fijo Q%0d.%0d", BW_IN - 1 - FRAC_BITS, FRAC_BITS);
            $display("==================================================");
    
            // --- 0. Abrir archivos ---
            input_file = $fopen("c:/Users/Yokai/Documents/TT/RNN/data/synthetic_data_normalized.txt", "r");
            output_file = $fopen("c:/Users/Yokai/Documents/TT/RNN/rnn_output.txt", "w");
    
            if (input_file == 0) begin
                $display("Error: No se pudo abrir el archivo de entrada.");
                $stop;
            end
            if (output_file == 0) begin
                $display("Error: No se pudo crear el archivo de salida.");
                $stop;
            end
    
            // --- 1. Inicialización y Reset ---
            rst_n = 1'b0;
            tb_input_vector_bus = 0;
            prev_fixed_point_input = 0;
            clk = 1'b0;
            #CLK_PERIOD;
            #CLK_PERIOD;
            rst_n = 1'b1;
            $display("[%0t ns] Reset liberado. El sistema esta operativo.", $time);
            
            @(posedge clk);
    
            // --- 2. Bucle de procesamiento de datos ---
            $display("[%0t ns] Comenzando a leer y procesar el archivo de datos...", $time);
            
            $fdisplay(output_file, "Input,Output"); // Escribir cabecera
    
            // Aplicar un 0 inicial para el primer ciclo de salida
            tb_input_vector_bus = 0;
            prev_fixed_point_input = 0;
    
            while (!$feof(input_file)) begin
                // La salida actual (`tb_output_scalar`) corresponde a la entrada del ciclo anterior (`prev_fixed_point_input`)
                @(posedge clk);
                
                // Escribir la entrada anterior y el resultado correspondiente
                $fdisplay(output_file, "%f,%f", $signed(prev_fixed_point_input) / SCALE_FACTOR_REAL, $signed(tb_output_scalar) / SCALE_FACTOR_REAL);
    
                // Leer el siguiente valor de entrada del archivo
                read_status = $fscanf(input_file, "%f\n", real_input);
    
                // Aplicar el nuevo valor de entrada (si la lectura fue exitosa)
                if (read_status == 1) begin
                    fixed_point_input = real_input * SCALE_FACTOR_REAL;
                    tb_input_vector_bus = fixed_point_input;
                    prev_fixed_point_input = fixed_point_input; // Guardar la entrada para el siguiente ciclo
                end
            end
            
            // --- 3. Capturar la última salida ---
            // Se necesita un ciclo de reloj adicional para procesar la última entrada leída
            @(posedge clk);
            $fdisplay(output_file, "%f,%f", $signed(prev_fixed_point_input) / SCALE_FACTOR_REAL, $signed(tb_output_scalar) / SCALE_FACTOR_REAL);
            tb_input_vector_bus = 0; // Poner la entrada a 0 al final
    
            // --- 4. Finalizar simulación ---
            $fclose(input_file);
            $fclose(output_file);
            
            #100;
            $display("\nSimulacion completada. Resultados guardados en 'rnn_output.txt'.");
            $stop;
        end

endmodule