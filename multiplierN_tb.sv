module multiplierN_tb();

       parameter N= 6;

			logic [N-1:0] a, b;
			logic [(N*2)-1:0] result;
			
			multiplierN #(N) dut(
					.a(a),
					.b(b),
					.result(result)
			);
			
			initial begin
			     
					a = 6'b111011;
					b = 6'b110110;
					#10;
			end
endmodule
			