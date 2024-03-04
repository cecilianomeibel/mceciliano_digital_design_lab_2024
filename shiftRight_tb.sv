module shiftRight_tb;

    // Parámetro del diseño
    parameter N = 5;

    // Señales de la DUT (Design Under Test)
    logic [N-1:0] a;
    logic [N-1:0] aDesplace;
    logic [N-1:0] result;
	 logic sign;

    // Instancia del DUT
    shiftRight #(N) dut (
        .a(a),
        .aDesplace(aDesplace),
        .result(result),
		  .sign(sign)
    );

    // Generación de estímulos
    initial begin
        // Prueba con a = 5 (01011), aDesplace = 1 (00001)
        a = 5'b01011;
        aDesplace = 5'b00001;

        // Esperar un poco para permitir que el resultado se estabilice
        #10;

    end

endmodule

