//import arm_const::*;
module top
(
	input logic clk, reset, start
//	output clk_out,
//	output hsync_out,
//	output vsync_out,
//	output [7:0] o_red,
//	output [7:0] o_blue,
//	output [7:0] o_green
);
	
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
	logic [31:0] PC, Instr, ReadData;
	wire [31:0] tex [700-1:0];
	
//	VGA display(
//		.clk_fpga(clk),
//		.clk_out(clk_out),
//		.hsync_out(hsync_out),
//		.vsync_out(vsync_out),
//		.o_red(o_red),
//		.o_blue(o_blue),
//		.o_green(o_green),
//		.tex(tex)
//	);
	
	
	arm cpu_(clk, reset, start, PC, Instr, MemWrite, DataAdr,
				WriteData, ReadData);
	
	imem inst_rom_(PC, Instr);
	
	visual_mem data_ram_(clk, MemWrite, DataAdr, WriteData, ReadData, tex);
	
endmodule