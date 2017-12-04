`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:23:41 12/03/2017 
// Design Name: 
// Module Name:    SignExtend 
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
module SignExtend(
    input [15:0] immdiate_in,
    output reg[31:0] immdiate_out
    );
	 always @(immdiate_in)
		begin
			immdiate_out <={{16{immdiate_in[15]}},immdiate_in};
		end
endmodule
