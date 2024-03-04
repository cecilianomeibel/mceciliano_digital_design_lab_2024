module multiplierN_tb();

       parameter N= 4;

			logic [N-1:0] A, B;
			logic [(N*2)-1:0] M;
			
			multiplierN #(N) dut(
					.A(A),
					.B(B),
					.M(M)
			);
			
			initial begin
			     
					A = 4'b1011;
					B = 4'b1101;
					#10;
			end
endmodule