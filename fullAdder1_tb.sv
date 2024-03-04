module fullAdder1_tb;

    // Parámetros
    parameter CLK_PERIOD = 10ns; // Periodo del reloj en unidades de tiempo

    // Definición de señales
    logic a, b, Cin;
    logic sum1, Cout;

    // Instanciar el DUT (Design Under Test)
    fullAdder1 dut (
        .a(a),
        .b(b),
        .Cin(Cin),
        .sum1(sum1),
        .Cout(Cout)
    );

    // Generador de estímulos
    initial begin
        // Inicialización
        a = 1'b0;
        b = 1'b0;
        Cin = 1'b0;

        // Esperar un ciclo de reloj antes de aplicar los estímulos
        #CLK_PERIOD;

        // Primer conjunto de valores de entrada
        a = 1'b1;
        b = 1'b0;
        Cin = 1'b0;
        #CLK_PERIOD;

        // Segundo conjunto de valores de entrada
        a = 1'b0;
        b = 1'b1;
        Cin = 1'b0;
        #CLK_PERIOD;

        // Tercer conjunto de valores de entrada
        a = 1'b1;
        b = 1'b1;
        Cin = 1'b0;
        #CLK_PERIOD;

        // Cuarto conjunto de valores de entrada
        a = 1'b0;
        b = 1'b0;
        Cin = 1'b1;
        #CLK_PERIOD;

        // Quinto conjunto de valores de entrada
        a = 1'b1;
        b = 1'b0;
        Cin = 1'b1;
        #CLK_PERIOD;

        // Sexto conjunto de valores de entrada
        a = 1'b0;
        b = 1'b1;
        Cin = 1'b1;
        #CLK_PERIOD;

        // Séptimo conjunto de valores de entrada
        a = 1'b1;
        b = 1'b1;
        Cin = 1'b1;
        #CLK_PERIOD;

        // Finalizar simulación
        $finish;
    end

endmodule

