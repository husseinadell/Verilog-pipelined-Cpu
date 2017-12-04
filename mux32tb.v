`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:08:49 12/04/2017
// Design Name:   mux32bits
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/mux32tb.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux32bits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux32tb;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg sel;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	mux32bits uut (
		.A(A), 
		.B(B), 
		.sel(sel), 
		.Out(Out)
	);

	initial begin
		$monitor("%b %b",sel,Out);
		A = 32'b0000_1111_0010_0101_1111_1010_0000_1111;
		B = 32'b1111_0010_0101_1111_1010_0000_1111_0000;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#10
		sel = 1;
        
		// Add stimulus here

	end
      
endmodule

