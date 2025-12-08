
module RNN #(
    parameter integer HIDDEN_SIZE  = 20,
    parameter integer BW_IN        = 32,
    parameter integer BW_OUT       = 40
)(
    input  wire clk,
    input  wire rst_n,
    input  wire signed [BW_IN-1:0]   x_input,
    output wire signed [BW_OUT-1:0]   y_output
);

    // Registro para el estado oculto recurrente (X_hidden)
    reg signed [BW_IN-1:0] hidden_state_reg [0:HIDDEN_SIZE-1];

    // Wires para las conexiones intermedias
    wire signed [BW_OUT-1:0] hidden_complete_out_bus [0:HIDDEN_SIZE-1];
    wire signed [BW_IN-1:0] activated_hidden_bus [0:HIDDEN_SIZE-1];

    // 1. Instancia del módulo hiddenComplete
    // Calcula: (X * W_i2h) + (X_hidden * W_h2h)
    hiddenComplete #(
        .HIDDEN_SIZE(HIDDEN_SIZE),
        .BW_IN(BW_IN),
        .BW_OUT(BW_OUT),
        .BW_SUM_OUT(BW_SUM) // <-- CAMBIO: Se pasa el nuevo ancho de bits
    ) inst_hidden_complete (
        .x_input(x_input),
        .h_1(hidden_state_reg[0]), .h_2(hidden_state_reg[1]), .h_3(hidden_state_reg[2]), .h_4(hidden_state_reg[3]),
        .h_5(hidden_state_reg[4]), .h_6(hidden_state_reg[5]), .h_7(hidden_state_reg[6]), .h_8(hidden_state_reg[7]),
        .h_9(hidden_state_reg[8]), .h_10(hidden_state_reg[9]), .h_11(hidden_state_reg[10]), .h_12(hidden_state_reg[11]),
        .h_13(hidden_state_reg[12]), .h_14(hidden_state_reg[13]), .h_15(hidden_state_reg[14]), .h_16(hidden_state_reg[15]),
        .h_17(hidden_state_reg[16]), .h_18(hidden_state_reg[17]), .h_19(hidden_state_reg[18]), .h_20(hidden_state_reg[19]),
        .hc_1(hidden_complete_out_bus[0]), .hc_2(hidden_complete_out_bus[1]), .hc_3(hidden_complete_out_bus[2]), .hc_4(hidden_complete_out_bus[3]),
        .hc_5(hidden_complete_out_bus[4]), .hc_6(hidden_complete_out_bus[5]), .hc_7(hidden_complete_out_bus[6]), .hc_8(hidden_complete_out_bus[7]),
        .hc_9(hidden_complete_out_bus[8]), .hc_10(hidden_complete_out_bus[9]), .hc_11(hidden_complete_out_bus[10]), .hc_12(hidden_complete_out_bus[11]),
        .hc_13(hidden_complete_out_bus[12]), .hc_14(hidden_complete_out_bus[13]), .hc_15(hidden_complete_out_bus[14]), .hc_16(hidden_complete_out_bus[15]),
        .hc_17(hidden_complete_out_bus[16]), .hc_18(hidden_complete_out_bus[17]), .hc_19(hidden_complete_out_bus[18]), .hc_20(hidden_complete_out_bus[19])
    );

    // 2. Instancia del módulo Activate
    Activate #(
        .HIDDEN_SIZE(HIDDEN_SIZE),
        .BW_IN(BW_OUT),
        .BW_OUT(BW_IN)
    ) inst_activate (
        .hc_1(hidden_complete_out_bus[0]), .hc_2(hidden_complete_out_bus[1]), .hc_3(hidden_complete_out_bus[2]), .hc_4(hidden_complete_out_bus[3]),
        .hc_5(hidden_complete_out_bus[4]), .hc_6(hidden_complete_out_bus[5]), .hc_7(hidden_complete_out_bus[6]), .hc_8(hidden_complete_out_bus[7]),
        .hc_9(hidden_complete_out_bus[8]), .hc_10(hidden_complete_out_bus[9]), .hc_11(hidden_complete_out_bus[10]), .hc_12(hidden_complete_out_bus[11]),
        .hc_13(hidden_complete_out_bus[12]), .hc_14(hidden_complete_out_bus[13]), .hc_15(hidden_complete_out_bus[14]), .hc_16(hidden_complete_out_bus[15]),
        .hc_17(hidden_complete_out_bus[16]), .hc_18(hidden_complete_out_bus[17]), .hc_19(hidden_complete_out_bus[18]), .hc_20(hidden_complete_out_bus[19]),
        .ha_1(activated_hidden_bus[0]), .ha_2(activated_hidden_bus[1]), .ha_3(activated_hidden_bus[2]), .ha_4(activated_hidden_bus[3]),
        .ha_5(activated_hidden_bus[4]), .ha_6(activated_hidden_bus[5]), .ha_7(activated_hidden_bus[6]), .ha_8(activated_hidden_bus[7]),
        .ha_9(activated_hidden_bus[8]), .ha_10(activated_hidden_bus[9]), .ha_11(activated_hidden_bus[10]), .ha_12(activated_hidden_bus[11]),
        .ha_13(activated_hidden_bus[12]), .ha_14(activated_hidden_bus[13]), .ha_15(activated_hidden_bus[14]), .ha_16(activated_hidden_bus[15]),
        .ha_17(activated_hidden_bus[16]), .ha_18(activated_hidden_bus[17]), .ha_19(activated_hidden_bus[18]), .ha_20(activated_hidden_bus[19])
        
    );

    // 3. Lógica del registro para el estado oculto
    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin            
            hidden_state_reg[0] <= 0;
            hidden_state_reg[1] <= 0;
            hidden_state_reg[2] <= 0;
            hidden_state_reg[3] <= 0;
            hidden_state_reg[4] <= 0;
            hidden_state_reg[5] <= 0;
            hidden_state_reg[6] <= 0;
            hidden_state_reg[7] <= 0;
            hidden_state_reg[8] <= 0;
            hidden_state_reg[9] <= 0;
            hidden_state_reg[10] <= 0;
            hidden_state_reg[11] <= 0;
            hidden_state_reg[12] <= 0;
            hidden_state_reg[13] <= 0;
            hidden_state_reg[14] <= 0;
            hidden_state_reg[15] <= 0;
            hidden_state_reg[16] <= 0;
            hidden_state_reg[17] <= 0;
            hidden_state_reg[18] <= 0;
            hidden_state_reg[19] <= 0;
        end else begin
            
            hidden_state_reg[0] <= activated_hidden_bus[0];
            hidden_state_reg[1] <= activated_hidden_bus[1];
            hidden_state_reg[2] <= activated_hidden_bus[2];
            hidden_state_reg[3] <= activated_hidden_bus[3];
            hidden_state_reg[4] <= activated_hidden_bus[4];
            hidden_state_reg[5] <= activated_hidden_bus[5];
            hidden_state_reg[6] <= activated_hidden_bus[6];
            hidden_state_reg[7] <= activated_hidden_bus[7];
            hidden_state_reg[8] <= activated_hidden_bus[8];
            hidden_state_reg[9] <= activated_hidden_bus[9];
            hidden_state_reg[10] <= activated_hidden_bus[10];
            hidden_state_reg[11] <= activated_hidden_bus[11];
            hidden_state_reg[12] <= activated_hidden_bus[12];
            hidden_state_reg[13] <= activated_hidden_bus[13];
            hidden_state_reg[14] <= activated_hidden_bus[14];
            hidden_state_reg[15] <= activated_hidden_bus[15];
            hidden_state_reg[16] <= activated_hidden_bus[16];
            hidden_state_reg[17] <= activated_hidden_bus[17];
            hidden_state_reg[18] <= activated_hidden_bus[18];
            hidden_state_reg[19] <= activated_hidden_bus[19];
        end
    end

    // 4. Instancia del módulo hidden_output
    hidden_output #(
        .HIDDEN_SIZE(HIDDEN_SIZE),
        .BW_IN(BW_IN),
        .BW_OUT(BW_OUT)
    ) inst_hidden_output (
        .ha_1(activated_hidden_bus[0]), .ha_2(activated_hidden_bus[1]), .ha_3(activated_hidden_bus[2]), .ha_4(activated_hidden_bus[3]),
        .ha_5(activated_hidden_bus[4]), .ha_6(activated_hidden_bus[5]), .ha_7(activated_hidden_bus[6]), .ha_8(activated_hidden_bus[7]),
        .ha_9(activated_hidden_bus[8]), .ha_10(activated_hidden_bus[9]), .ha_11(activated_hidden_bus[10]), .ha_12(activated_hidden_bus[11]),
        .ha_13(activated_hidden_bus[12]), .ha_14(activated_hidden_bus[13]), .ha_15(activated_hidden_bus[14]), .ha_16(activated_hidden_bus[15]),
        .ha_17(activated_hidden_bus[16]), .ha_18(activated_hidden_bus[17]), .ha_19(activated_hidden_bus[18]), .ha_20(activated_hidden_bus[19]),
        .y_output(y_output)
    );

endmodule
