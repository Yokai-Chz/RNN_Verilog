module Activate #(
    parameter HIDDEN_SIZE  = 20,   // Tamaño de la capa oculta
    parameter BW_IN        = 40,    // Tamaño de entrada de bits 
    parameter BW_OUT       = 32     // Tamaño de salida de bits 
)(
    input  wire signed [BW_IN-1:0]  hc_1, hc_2, hc_3, hc_4, hc_5, hc_6, hc_7, hc_8, hc_9, hc_10, hc_11, hc_12, hc_13, hc_14, hc_15, hc_16, hc_17, hc_18, hc_19, hc_20,

    output wire signed [BW_OUT-1:0]  ha_1, ha_2, ha_3, ha_4, ha_5, ha_6, ha_7, ha_8, ha_9, ha_10, ha_11, ha_12, ha_13, ha_14, ha_15, ha_16, ha_17, ha_18, ha_19, ha_20
);

    // --- Empaquetar puertos en arrays para un manejo más limpio ---
    wire signed [BW_IN-1:0] hc [0:HIDDEN_SIZE-1];
    wire signed [BW_OUT-1:0] ha [0:HIDDEN_SIZE-1];

    // Asignaciones para empaquetar las entradas en un array
    assign hc[0]=hc_1; assign hc[1]=hc_2; assign hc[2]=hc_3; assign hc[3]=hc_4; assign hc[4]=hc_5; assign hc[5]=hc_6; assign hc[6]=hc_7; assign hc[7]=hc_8; assign hc[8]=hc_9; assign hc[9]=hc_10;
    assign hc[10]=hc_11; assign hc[11]=hc_12; assign hc[12]=hc_13; assign hc[13]=hc_14; assign hc[14]=hc_15; assign hc[15]=hc_16; assign hc[16]=hc_17; assign hc[17]=hc_18; assign hc[18]=hc_19; assign hc[19]=hc_20;

    // --- Generar N instancias del módulo Tanh ---
    genvar i;
    generate
        for (i = 0; i < HIDDEN_SIZE; i = i + 1) 
        begin : gen_tanh_instance
            Tanh u_tanh (
                .x(hc[i]),   
                .y(ha[i])    
            );
        end
    endgenerate

    // Asignaciones para des-empaquetar el array de salida a los puertos individuales
    assign ha_1=ha[0]; assign ha_2=ha[1]; assign ha_3=ha[2]; assign ha_4=ha[3]; assign ha_5=ha[4]; assign ha_6=ha[5]; assign ha_7=ha[6]; assign ha_8=ha[7]; assign ha_9=ha[8]; assign ha_10=ha[9];
    assign ha_11=ha[10]; assign ha_12=ha[11]; assign ha_13=ha[12]; assign ha_14=ha[13]; assign ha_15=ha[14]; assign ha_16=ha[15]; assign ha_17=ha[16]; assign ha_18=ha[17]; assign ha_19=ha[18]; assign ha_20=ha[19];

endmodule