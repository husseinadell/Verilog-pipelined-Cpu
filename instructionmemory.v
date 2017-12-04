`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:26:45 12/03/2017 
// Design Name: 
// Module Name:    instructionmemory 
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
module instructionmemory(
    input CLK,
    output reg[31:0] instruction,
    input [31:0] instructionAddress
    );
	 reg [31:0]instrmem[0:1023];
	 always @(posedge CLK)
		begin
			instruction<=instrmem[instructionAddress/4];
		end
	 initial
		begin
		$readmemb("E:\Learning/College/instructionmemory.txt", instrmem);
		end
endmodule
