`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:59 12/03/2017 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(
		input signed [31:0] in1,
		input signed [31:0] in2, 
		input [3:0] op, 
		input [4:0] shamt,
		output zero,
		output reg signed [31:0] result);
assign zero =((in1-in2)==1)?1:0;
	always @ (in1 or in2 or op)
		case(op)
		4'b0000: result = in1+in2;
		4'b0001: result = in1-in2;
		4'b0010: result = in1&in2;
		4'b0011: result = in1|in2;
		4'b0100: result = in1<<shamt;
		4'b0101: result = in1>>shamt;
		4'b0110: result = in1>>>shamt;
		4'b0111: result = ~(in1|in2);
		4'b1000: result = (in2>in1)?1:0;
		endcase
endmodule 
