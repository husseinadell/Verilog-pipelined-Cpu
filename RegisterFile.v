`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:30 12/03/2017 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(
    input CLK,
    input [4:0] read1,
    input [4:0] read2,
    input [31:0] writeData,
    input RegWrite,
	 input [4:0] write,
    output reg[31:0] register1,
    output reg[31:0] register2
    );
			reg [31:0] registers[1023:0];
			always @*
					begin
						register1 <= registers[read1];
						register2 <= registers[read2];
					end
			always @(posedge CLK)
					begin
						if(RegWrite)
							begin
								registers[write] <= writeData ;
							end	
					end
endmodule
