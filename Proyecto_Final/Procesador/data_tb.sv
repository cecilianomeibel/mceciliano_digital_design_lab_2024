
module data_tb();
	logic clk, we;
	logic [31:0] a, wd;
	logic [31:0] rd;
	logic [31:0] tex_o [700-1:0];

	visual_mem d(clk,we,a,wd,rd,tex_o);

	initial begin
	
		#10; 
		clk = 0; we = 0; #10;

		a = 0;  wd = 1; #10; we = 1;  #10;
		a = 0;  we = 0;

		a = 100;  wd = 66; #10; we = 1;  #10;
		a = 100;  we = 0;


		a = 1;  wd = 77; #10; we = 1;  #10;
		a = 1;  we = 0;

	end

	always begin
		clk = ~clk; #5;
	end

endmodule