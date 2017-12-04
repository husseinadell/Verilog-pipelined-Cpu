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
	input wire [31:0] addr,          // Memory Address
	input wire [31:0] write_data,    // Memory Address Contents
	input wire memwrite, memread,
	input wire clk,                  // All synchronous elements, including memories, should have a clock signal
	output reg [31:0] read_data      // Output of Memory Address Contents
	);
	
	reg [31:0] MEMO[0:1023];  // 256 words of 32-bit memory

	integer i;
	integer file;
	initial 
	begin
	file = $fopen("E:\memoryyy.txt");
	 // read_data <= 0;
	//  for (i = 0; i < 1024; i = i + 1) begin
		// MEMO[i] = 0;
		 //$fmonitor(file,"@%h\n%b",i,MEMO[i]);
//	  end
	end
	
	always @(posedge clk)
	begin
		if (memwrite == 1'b1)
			begin
				MEMO[addr] <= write_data;
			end
		if (memread == 1'b1)
			begin
				read_data <= MEMO[addr];
				$fmonitor(file,"@%h\n%b",addr,MEMO[addr]);
				$display("%b @%h",MEMO[addr],addr);
			end
	end
	endmodule
	/*module data_memory (
	input [31:0] addr,          // Memory Address
	input [31:0] write_data,    // Memory Address Contents
	input memwrite, memread,
	input  clk,                  // All synchronous elements, including memories, should have a clock signal
	output [31:0] read_data      // Output of Memory Address Contents
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
	  if (memwrite)
		 ram[addr] <= write_data;
	end
	assign read_data = (memread == 1'b1) ? ram[addr]:16'd0;
	endmodule*/