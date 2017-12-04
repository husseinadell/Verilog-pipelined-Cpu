`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:07:48 12/03/2017
// Design Name:   PC
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/PCtb.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PCtb;

	// Inputs
	reg [31:0] PC_in;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] PC_out;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.PC_in(PC_in), 
		.PC_out(PC_out), 
		.clk(clk), 
		.reset(reset)
	);
	always
	#5 clk = ~clk;
	initial
		begin
		// Initialize Inputs
		$monitor($time,,,"%d",PC_out);
		PC_in = 0;
		clk = 0;
		reset = 1;
		#2
		reset=0;
		#10
		PC_in = 4;
		// Wait 100 ns for global reset to finish
		// Add stimulus here
		#10
		PC_in=8;
		#10
		PC_in=12;

	end
      
endmodule

