	`timescale 1ns / 1ps
	//////////////////////////////////////////////////////////////////////////////////
	// Company: 
	// Engineer: 
	// 
	// Create Date:    13:56:17 12/03/2017 
	// Design Name: 
	// Module Name:    memory 
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
	module data_memory (
	input wire [31:0] ramAddress,          // Memory Address
	input wire [31:0] writeData,    // Memory Address Contents
	input wire memWrite, memRead,
	input wire clk,                  // All synchronous elements, including memories, should have a clock signal
	output [31:0] readData      // Output of Memory Address Contents
	);
	
	reg [31:0] ram [0:1023];  // 256 words of 32-bit memory

	//integer i;
	//integer file;
	//initial begin
	//file = $fopen("E:\memoryyy.txt");
	 // read_data <= 0;
	//  for (i = 0; i < 1024; i = i + 1) begin
		// MEMO[i] = 0;
		 //$fmonitor(file,"@%h\n%b",i,MEMO[i]);
	//	  end
	//end
	always @(posedge clk) 
	begin
	  if (memWrite)
		 ram[ramAddress] <= writeData;
	end
	assign readData = (memRead == 1'b1) ? ram[ramAddress]:16'd0;
	endmodule