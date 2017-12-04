`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:24:26 12/03/2017
// Design Name:   ALUControl_Block
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/AluControltb.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUControl_Block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module AluControltb;

	// Inputs
	reg [1:0] ALUOp;
	reg [5:0] Function;
	reg [5:0]Opcode;
	// Outputs
	wire [3:0] ALUControl;
	wire JRControl;
	// Instantiate the Unit Under Test (UUT)
	ALUControl_Block uut (
		.ALUControl(ALUControl), 
		.JRControl(JRControl), 
		.Opcode(Opcode),
		.ALUOp(ALUOp), 
		.Function(Function)
	);

	initial begin
		// Initialize Inputs
		$monitor("%b %d %d %d %d",ALUOp,Function,Opcode,ALUControl,JRControl);
		ALUOp = 0;
		Function = 32;
		Opcode=0;
		#5
		ALUOp = 0;
		Function = 36;
		Opcode=7;
		#5
		ALUOp = 3;
		Function = 8;
		Opcode=8;
		#5
		ALUOp = 0;
		Function = 39;
		#5
		ALUOp = 0;
		Function = 37;
		#5
		ALUOp = 0;
		Function = 0;
		#5
		ALUOp = 0;
		Function = 42;
		#5
		ALUOp = 3;
		Function = 2;
		Opcode = 12;
		#5
		ALUOp = 0;
		Function = 34;
		#5
		ALUOp = 0;
		Function = 0;
		#5
		ALUOp = 0;
		Function = 0;
	end
      
endmodule

