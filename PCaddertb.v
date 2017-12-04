`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:21:34 12/03/2017
// Design Name:   PCadder
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/PCaddertb.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PCadder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PCaddertb;

	// Inputs
	reg [31:0] in1;
	reg [31:0] in2;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	PCadder uut (
		.in1(in1), 
		.in2(in2), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		$monitor("%d %d",in1,out);
		in1 = 8;
		in2 = 4;
		// Wait 100 ns for global reset to finish
		#5
		in1 = 12;
		// Add stimulus here
		#5
		in1 = 16;
	end
      
endmodule

