`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:44:55 12/03/2017
// Design Name:   ALU
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/Alutb.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Alutb;

	// Inputs
	reg [31:0] in1;
	reg [31:0] in2;
	reg [2:0] op;
	reg [4:0] shamt;
	wire zero;
	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.in1(in1), 
		.in2(in2), 
		.op(op), 
		.shamt(shamt),
			.zero(zero),
		.result(result)
	);
initial
begin
$monitor( $time,,,"%b %b %b %b",in1,in2,result,zero);
in1=32'sb1110_0000_0000_0000_0000_0000_0000_0000;
in2=32'sb0110_0000_0000_0000_0000_0000_0000_0000;
op=3'b000;
shamt =5'b00111;
#10
op=3'b001;
in1=32'b1111_1111_1111_1111_1111_1111_1111_0000;
in2=32'sb0000_0000_0000_0000_0000_0000_0000_0001;
#10
op=3'b010;
#10
op=3'b011;
#10
op=3'b100;
#10
op=3'b101;
#10
op=3'b110;
#10
op=3'b111;
end      
endmodule
