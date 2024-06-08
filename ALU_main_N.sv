module ALU_main_N #(
    parameter N = 4 // Parámetro para el número de bits
) (
    input logic [N-1:0] A_num,           // Primer operando
    input logic [N-1:0] B_num,           // Segundo operando
    input logic [1:0] ALUControl,        // Selector
    output logic [N-1:0] result,         // Resultado final elegido
    output logic V_flag, C_flag, N_flag, Z_flag
);

    // Variables internas
    logic [N-1:0] B_neg;            // Complemento del segundo operando
    logic [N-1:0] B_final;          // Segundo operando final resultante del mux 2:1
    logic [N-1:0] result_and;       // Resultado de la operación AND
    logic [N-1:0] result_or;        // Resultado de la operación OR
    logic [N-1:0] result_sum;       // Resultado del sumador
    logic cout;                     // Acarreo final

    // Obteniendo el complemento de B_num
    always @(*) begin
        B_neg <= ~B_num;
    end

    // Instancia del módulo del MUX 2:1
    mux_2to1_N #(N) mux_2 (
        .d0(B_num),
        .d1(B_neg),
        .sel(ALUControl[0]),
        .y(B_final)
    );

    // Instancia del módulo del Sumador
    sumador_N #(N) sumador_nums(
        .A_num(A_num), 
        .B_num(B_final), 
        .carry_in(ALUControl[0]), 
        .carry_out(cout), 
        .result(result_sum)
    );

    // Instancia del módulo OR
    orGate_N #(N) or_nums (
        .a(A_num),
        .b(B_num),
        .result(result_or)
    );

    // Instancia del módulo AND
    AND_gate_N #(N) and_nums(
        .A_num(A_num), 
        .B_num(B_num), 
        .result(result_and)
    );

    // Instancia del módulo del Mux 4:1
    mux_4to1_N #(N) mux_4 (
        .d0(result_sum),
        .d1(result_sum),
        .d2(result_and),
        .d3(result_or),
        .sel(ALUControl),
        .y(result)
    );

    // Instancia del módulo que determina las banderas
    ALU_flags_N #(N) flags(
        .A_msb(A_num[N-1]),
        .B_msb(B_num[N-1]),
        .ALUControl(ALUControl),
        .result(result),
        .Sum_msb(result_sum[N-1]),
        .result_MSB(result[N-1]),
        .cout(cout),
        .V_flag(V_flag),
        .C_flag(C_flag),
        .N_flag(N_flag),
        .Z_flag(Z_flag)
    );

endmodule
