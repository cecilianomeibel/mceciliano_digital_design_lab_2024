module multiplicador_tb;

    parameter WIDTH = 4;
    
    // Instancia el módulo multiplicador
    multiplicador #(WIDTH) dut (
        .a(a),
        .b(b),
        .resultado(resultado)
    );

    // Declaración de las señales
    logic [WIDTH-1:0] a, b;
    logic [2*WIDTH-1:0] resultado;
    
    // Generación de patrones de prueba
    initial begin
        $display("Generando patrones de prueba...");
        #5 a = 4'b0001; b = 4'b0010; // 1 * 2
        #5 a = 4'b0011; b = 4'b0100; // 3 * 4
        #5 a = 4'b1111; b = 4'b0001; // 15 * 1
        // Añadir más patrones de prueba según sea necesario
        #10 $finish;
    end

    // Monitoreo de la salida
    always @(resultado) begin
        $display("Resultado: %d", resultado);
    end
    
endmodule
