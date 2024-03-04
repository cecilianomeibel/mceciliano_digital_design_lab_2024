module dividerN_tb;

//Definir parametro parametrizable
parameter N = 6;

//Se definen las señales 

logic [N-1:0] dividend;
logic [N-1:0] divider;
logic [N-1:0] quotient;

//Instanciar el modulo a probar 

dividerN #(N) dut(
 .dividend(dividend),
 .divider(divider),
 .quotient(quotient)
 );
 
 
 //Inicializacion de señales 
 initial begin 
 
 //Prueba 1 
 
 dividend = 4'b1111;  //numero 15
 divider =  4'b0101;  //numero 5
 #10ns; 
 
 //Prueba 2

 dividend = 4'b1110;  //numero 14 
 divider =  4'b0111;  //numero 7
 #10ns; 

 //dividend = 6'b101000;  //numero 40
 //divider =  6'b101000; //numero 40
 //#10ns; 
 end 
 
 endmodule
 
 
 
 
 