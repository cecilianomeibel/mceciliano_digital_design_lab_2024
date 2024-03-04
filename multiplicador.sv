module multiplicador #(parameter N = 4)
								(
								input logic [N-1:0] A,
								input logic [N-1:0] B,
								output logic [(N*2)-1:0] M
								);
								
								wire C [N-2:0];
								logic [N-1:0] ta [N-2:0];
								logic [N-1:0] tb [N-2:0];
								logic [N-1:0] ts [N-2:0];
								
								genvar i;
								genvar j;
								
								generate
									for (i = 0; i < N-1; i++) begin : fa
									
										for (j = 0; j < N; j++) begin : t
											
											if (i == 0) begin
												if (j == N-1) begin
													assign ta[i][j] = 1'b0;
												end else begin
													assign ta[i][j] = A[i] & B[j+1];
												end
											end else begin
												if (j == N-1) begin
													assign ta[i][j] = C[i-1];
												end else begin
													assign ta[i][j] = ts[i-1][j+1];
												end
											end
											
											assign tb[i][j] = A[i+1] & B[j];
											
										end
										
										fullAdderN #(.N(N)) fa(.a(ta[i]), .b(tb[i]),.Cin(1'b0), .sum(ts[i]), .Cout(C[i]));
										
										if (i == 0) begin
											assign M[i] = A[i] & B[i];
										end else begin
											assign M[i] = ts[i-1][0];
										end
										
									end
								endgenerate
								
								assign M[(N*2)-1:(N*2)-5] = {C[N-2], ts[N-2]};
								
endmodule
					