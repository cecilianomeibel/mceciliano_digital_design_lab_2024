module orGate_tb;

//Definir parametro 
parameter N = 6;

//Definir señales 

logic [N-1:0] a;
logic [N-1:0] b;
logic [N-1:0] result;

// Instancia del módulo bajo prueba
  orGate #(N) dut (
      .a(a),
      .b(b),
      .result(result)
  );
  

  // Inicialización de señales
  initial begin
      // Establecer valores de entrada
      a = 6'b001110;
      b = 6'b010100;
      #10; 

      // Establecer nuevos valores de entrada
      a = 6'b111111;
      b = 6'b101010;
      #10; // Esperar un tiempo para la propagación
  end

endmodule
