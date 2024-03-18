
module XOR_gate_tb();
	
	parameter N = 4;
	
	logic [N-1:0] A_num;
	logic [N-1:0] B_num;
	logic [N-1:0] result;
	logic sign;
	
	
	XOR_gate #(N) Xor_tb(.A_num(A_num), .B_num(B_num), .result(result), .sign(sign));
	
	
	initial begin
	
		A_num = 0;
		B_num = 0;
		
		#40
		
		A_num = 0;
		B_num = 1;
		
		#40
		
		A_num = 1;
		B_num = 0;
		
		#40
		
		A_num = 1;
		B_num = 1;
		
		#40
		
		$finish;
	
	end
	
	
	
endmodule