
module RNN #(
    parameter integer INPUT_SIZE         = 1,
    parameter integer INPUT_HIDDEN_SIZE  = 20,
    parameter integer HIDDEN_SIZE        = 20,
    parameter integer OUTPUT_SIZE        = 1,
    parameter integer BW_IN              = 32,
    parameter integer BW_OUT             = 32
)(
    input  wire clk,
    input  wire rst_n,
    input  wire signed [INPUT_SIZE*BW_IN-1:0]   input_vector_bus,
    output wire signed [OUTPUT_SIZE*BW_OUT-1:0] output_scalar
);

    // Registro para el estado oculto recurrente (X_hidden)
    reg signed [INPUT_HIDDEN_SIZE*BW_IN-1:0] hidden_state_reg;

    // Wires para las conexiones intermedias
    wire signed [HIDDEN_SIZE*BW_OUT-1:0] hidden_complete_out_bus;
    wire signed [HIDDEN_SIZE*BW_OUT-1:0] activated_hidden_bus;

    // 1. Instancia del módulo hiddenComplete
    // Calcula: (X * W_i2h) + (X_hidden * W_h2h)
    hiddenComplete #(
        .INPUT_SIZE(INPUT_SIZE),
        .INPUT_HIDDEN_SIZE(INPUT_HIDDEN_SIZE),
        .HIDDEN_SIZE(HIDDEN_SIZE),
        .BW_IN(BW_IN),
        .BW_OUT(BW_OUT)
    ) inst_hidden_complete (
        .hidden_vector_bus(hidden_state_reg),
        .input_vector_bus(input_vector_bus),
        .output_vector_bus(hidden_complete_out_bus)
    );

    // 2. Instancia del módulo Activate
    // Aplica la función Tanh al resultado
    Activate #(
        .INPUT_SIZE(HIDDEN_SIZE),
        .BW_IN(BW_IN),
        .BW_OUT(BW_OUT)
    ) inst_activate (
        .vectorA_bus(hidden_complete_out_bus),
        .result_bus(activated_hidden_bus)
    );

    // 3. Lógica del registro para el estado oculto
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            hidden_state_reg <= 0;
        end else begin
            hidden_state_reg <= activated_hidden_bus;
        end
    end

    // 4. Instancia del módulo hidden_output
    // Calcula la salida final: activated_hidden * W_h2o
    hidden_output #(
        .INPUT_SIZE(HIDDEN_SIZE),
        .BW_IN(BW_IN),
        .BW_OUT(BW_OUT)
    ) inst_hidden_output (
        .input_vector_bus(activated_hidden_bus),
        .output_scalar(output_scalar)
    );

endmodule
