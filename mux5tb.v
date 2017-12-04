`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:11:44 12/04/2017
// Design Name:   mux5bits
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/mux5tb.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux5bits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux5tb;

	// Inputs
	reg [4:0] A;
	reg [4:0] B;
	reg Select;

	// Outputs
	wire [4:0] Out;

	// Instantiate the Unit Under Test (UUT)
	mux5bits uut (
		.A(A), 
		.B(B), 
		.Out(Out), 
		.Select(Select)
	);

	initial begin
		// Initialize Inputs
		$monitor("%b %b",Select,Out);
		A = 5'b01010;
		B = 5'b11110;
		Select = 0;

		// Wait 100 ns for global reset to finish
		#10
		Select =1;
        
		// Add stimulus here

	end
      
endmodule

