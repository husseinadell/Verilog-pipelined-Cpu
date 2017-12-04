`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:39:08 12/03/2017
// Design Name:   instructionmemory
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/instructionmemorytb.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instructionmemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module instructionmemorytb;

	// Inputs
	reg CLK;
	reg [31:0] addr;

	// Outputs
	wire [31:0] instr;

	// Instantiate the Unit Under Test (UUT)
	instructionmemory uut (
		.CLK(CLK), 
		.instruction(instr), 
		.instructionAddress(addr)
	);
	always
	begin
	#5 CLK=~CLK;
	end
	initial begin
		// Initialize Inputs
		$monitor("Mem Address=%h instruction=%b",addr,instr);
addr=32'd0;
CLK=1;
#10 addr=32'd4;
#10 addr=32'd8;
#10 addr=32'd12;
#10 addr=32'd16;
#10 addr=32'd20;
#10 addr=32'd24;
#10 addr=32'd28;
	end
      
endmodule

