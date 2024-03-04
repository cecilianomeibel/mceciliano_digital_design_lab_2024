module fullAdderN_tb;

  // Parámetros
  parameter N = 5; // Tamaño del sumador

  // Definición de señales
  logic [N-1:0] a, b;
  logic Cin;
  logic [N-1:0] sum;
  logic Cout;

  // Instancia del módulo bajo prueba
  fullAdder4 #(N) dut (
      .a(a),
      .b(b),
      .Cin(Cin),
      .sum(sum),
      .Cout(Cout)
  );

  // Inicialización de señales
  initial begin
      // Establecer valores de entrada
      a = 5'b00111;
      b = 5'b01011;
      Cin = 1'b0;
      #10; 

      // Establecer nuevos valores de entrada
      a = 5'b01111;
      b = 5'b11011;
      Cin = 1'b0;
      #10; // Esperar un tiempo para la propagación
  end

endmodule
