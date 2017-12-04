`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:47:45 12/03/2017
// Design Name:   data_memory
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/DataMemorytb.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data_memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////

module DataMemorytb;

	// Inputs
	reg [31:0] addr;
	reg [31:0] write_data;
	reg memwrite;
	reg memread;
	reg clk;

	// Outputs
	wire [31:0] read_data;

	// Instantiate the Unit Under Test (UUT)
	data_memory uut (
		.addr(addr), 
		.write_data(write_data), 
		.memwrite(memwrite), 
		.memread(memread), 
		.clk(clk), 
		.read_data(read_data)
	);
	always 
	begin
	#5 clk=~clk;
	end
	initial begin
		$monitor("%d",read_data);
		addr = 2;
		write_data = 32'd54;
		memwrite = 1;
		memread = 0;
		clk=1;
		// Wait 100 ns for global reset to finish
		#10
		addr = 9;
		write_data = 16;
		memwrite = 1;
		memread = 0;
       #10
		  addr = 3;
		write_data = 62;
		memwrite = 1;
		memread = 0;
		// Add stimulus here
		#10
		addr = 3;
		write_data = 50;
		memwrite = 0;
		memread = 1;
		#10
		addr = 9;
		write_data = 0;
		memwrite = 0;
		memread = 1;
		#10
		addr = 3;
		memread=1;
		#10
		memread=0;
	end
endmodule

