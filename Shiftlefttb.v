`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:55:19 12/03/2017
// Design Name:   Shiftlefttwo
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/Shiftlefttb.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Shiftlefttwo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Shiftlefttb;

	// Inputs
	reg [31:0] In32;

	// Outputs
	wire [31:0] Out32;

	// Instantiate the Unit Under Test (UUT)
	Shiftlefttwo uut (
		.Out32(Out32), 
		.In32(In32)
	);

	initial begin
		// Initialize Inputs
		$monitor("%b %b",In32,Out32);
		In32 = 32'b0011_0000_0000_0000_0000_0000_0000_0000;
		
		// Wait 100 ns for global reset to finish
		#1
		In32 = 32'b0001_0000_0000_0000_0000_0000_0000_0000;
        
		// Add stimulus here

	end
      
endmodule

