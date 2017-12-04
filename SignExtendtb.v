`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:28:26 12/03/2017
// Design Name:   SignExtend
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/SignExtendtb.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SignExtend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SignExtendtb;

	// Inputs
	reg [15:0] immdiate_in;

	// Outputs
	wire [31:0] immdiate_out;

	// Instantiate the Unit Under Test (UUT)
	SignExtend uut (
		.immdiate_in(immdiate_in), 
		.immdiate_out(immdiate_out)
	);

	initial begin
		// Initialize Inputs
		$monitor("%b %b",immdiate_in,immdiate_out);
		immdiate_in = 16'b0000_1111_1010_1111;
		
		// Wait 100 ns for global reset to finish
		#15
		immdiate_in = 16'b1111_1111_1010_1111;
		// Add stimulus here

	end
      
endmodule

