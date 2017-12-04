`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:08:08 12/03/2017
// Design Name:   RegisterFile
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/RegisterFiletb.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RegisterFiletb;

	// Inputs
	reg CLK;
	reg [4:0] read1;
	reg [4:0] read2;
	reg [31:0] wd;
	reg writeEnable;
	reg [4:0] write;

	// Outputs
	wire [31:0] register1;
	wire [31:0] register2;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.CLK(CLK), 
		.read1(read1), 
		.read2(read2), 
		.writeData(wd), 
		.RegWrite(writeEnable), 
		.write(write), 
		.register1(register1), 
		.register2(register2)
	);
	always
	begin
	#5 CLK=~CLK;
	end
	initial
	begin
	$monitor("%b>>%b,%b>>%b",register1,read1,register2,read2);
		// Initialize Inputs
		CLK = 1;
		wd <=0;
		write<=0;
		writeEnable<=1;
		#10
      wd<=1;
		writeEnable<=1;
		write<=1;
		#10
		wd<=2;
		writeEnable<=1;
		write<=2; //Write input data at reg 2
		#10
		wd<=3;
		writeEnable<=1;
		write<=3; //Write input data at reg 3
		#10
		wd<=4;
		writeEnable<=0;
		write<=4; //Write input data at reg 4
		#10
		read1<=1;
		read2<=2;
		#10
		read1<=0;
		read2<=3;
	end
endmodule
