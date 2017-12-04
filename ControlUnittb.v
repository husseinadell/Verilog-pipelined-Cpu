`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:34:12 12/03/2017
// Design Name:   ControlUnit
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/ControlUnittb.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ControlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ControlUnittb;

	// Inputs
	reg [5:0] Opcode;

	// Outputs
	wire RegDst;
	wire ALUSrc;
	wire MemtoReg;
	wire RegWrite;
	wire MemRead;
	wire MemWrite;
	wire Branch;
	wire Jump;
	wire SignZero;
	wire [1:0] ALUOp;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.Opcode(Opcode), 
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc), 
		.MemtoReg(MemtoReg), 
		.RegWrite(RegWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.Jump(Jump), 
		.SignZero(SignZero), 
		.ALUOp(ALUOp)
	);

	initial begin
		$monitor("Op=%b AluOp=%b RegDst=%b AluSrc=%b MemtoReg=%b Regwrite=%b Memread=%b MemWrite=%b branch=%b jump=%b",Opcode,ALUOp,RegDst,ALUSrc,
		MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump);
		Opcode = 0;
		#5
		Opcode =  8 ;
		#5
		Opcode =   12;
		#5
		Opcode =   4;
		#5
		Opcode =   5;
		#5
		Opcode =   2;
		#5
		Opcode =   35;
		#5
		Opcode =   13;
		#5
		Opcode =   10;
		#5
		Opcode =   43;
		// Add stimulus here

	end
      
endmodule

