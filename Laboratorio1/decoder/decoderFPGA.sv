module decoderFPGA(
    input logic [5:0] bcd,
    output logic [6:0] seg
);



always_comb 
   case(bcd)         // gfedcba 0 enciende y 1 apaga
    6'b000000: seg = 7'b1000000; //0 en BCD
    6'b000001: seg = 7'b1111001; //1 en BCD
    6'b000010: seg = 7'b0100100; //2 en BCD
    6'b000011: seg = 7'b0110000; //3 en BCD
    6'b000010: seg = 7'b0011001; //4 en BCD  para probar una entrada de 4 bits que no coincida con las definidas
	 6'b000101: seg = 7'b0010010; //5 en BCD	 
    6'b000110: seg = 7'b0000010; //6 en BCD
    6'b000111: seg = 7'b0111000; //7 en BCD
    6'b001000: seg = 7'b0000000; //8 en BCD
    6'b001001: seg = 7'b0010000; //9 en BCD	
    6'b010000: seg = 7'b0001000; //10 en BCD  A	
	 6'b010001: seg = 7'b0000011; //11 en BCD  b
    6'b010010: seg = 7'b1000110; //12 en BCD  C
    6'b010011: seg = 7'b0100001; //13 en BCD  d
    6'b010100: seg = 7'b0000110; //14 en BCD  E
    6'b010101: seg = 7'b0001110; //15 en BCD  F 

    default: seg = 7'b1111111; //todos se apagan
   endcase
	
endmodule


















