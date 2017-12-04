`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:20:16 12/03/2017 
// Design Name: 
// Module Name:    PCadder 
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
module PCadder(
    input [31:0] in1,
    input [31:0] in2,
    output reg[31:0] out
    );
	always @ (in1 or in2)
		begin
			out<=in1+in2;
		end
endmodule
