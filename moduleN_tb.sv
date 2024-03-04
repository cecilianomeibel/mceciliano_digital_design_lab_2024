module moduleN_tb;

// Se define el tamaño del parametro
parameter N=7;

//Se definen las señales 

logic [N-1:0] dividend;
logic [N-1:0] divider;
logic [N-1:0] remainder;

//Instanciar el modulo a probar 

moduleN #(N) dut(
   .dividend(dividend),
	.divider(divider),
	.remainder(remainder)
);


//Inicializacion de señales 

initial begin 

dividend = 4'b1011; //numero 11
divider = 4'b0101; //numero 5  por 2

//resto deberia ser 1


#10ns;

dividend = 4'b1100;  //numero 12
divider = 4'b0101;   //numero 5 por 2
resto deberia ser 2

#10ns;


dividend = 4'b1111;  //numero 15
divider = 4'b0011;   //numero 3 por 5
//resto deberia ser 0

#10ns;



//---------Prueba con N=7-------------
//dividend = 7'b1100100; //numero 100
//divider =  7'b0110111; //numero 55 por 1

//#10ns;


//resto deberia ser 45


end
endmodule






