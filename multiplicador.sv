module multiplicador #(parameter WIDTH = 4) (
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    output [2*WIDTH-1:0] resultado
);

    // Declaración de señales internas
    logic [WIDTH-1:0] intermedios [WIDTH-1:0];
    logic [2*WIDTH-1:0] resultado_temp;

    // Instancias del módulo de 1 bit
    genvar i, j;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin
            for (j = 0; j < WIDTH; j = j + 1) begin
                multiplicador_1bit #(1) u_mult(
                    .a(a[i]),
                    .b(b[j]),
                    .resultado(intermedios[i][j])
                );
            end
        end
    endgenerate

    // Suma de los resultados intermedios
    genvar k;
    generate
        for (k = 0; k < 2*WIDTH; k = k + 1) begin
            assign resultado_temp[k] = (k < WIDTH) ? intermedios[k][k] : resultado_temp[k-1] + {resultado_temp[k-1][WIDTH-1:0], 1'b0};
        end
    endgenerate

    assign resultado = resultado_temp;

endmodule
