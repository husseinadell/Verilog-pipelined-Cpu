`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:18:43 12/03/2017 
// Design Name: 
// Module Name:    Alucontrol 
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
module ALUControl_Block(
	output reg[3:0] ALUControl,output reg JRControl,input [5:0]Opcode,
 	input [1:0] ALUOp, input[5:0] Function);
always @ (Function or ALUOp or Opcode)
begin
if(ALUOp==2'b00)
begin
casex (Function)
 6'b100000: begin ALUControl=4'b0000; JRControl=1'b0; end //add
 6'b100010: begin ALUControl=4'b0001; JRControl=1'b0; end //sub
 6'b100100: begin ALUControl=4'b0010; JRControl=1'b0; end //and
 6'b100101: begin ALUControl=4'b0011; JRControl=1'b0; end //or
 6'b000000: begin ALUControl=4'b0100; JRControl=1'b0; end //sll
 6'b000010: begin ALUControl=4'b0101; JRControl=1'b0; end //srl
 6'b000011: begin ALUControl=4'b0110; JRControl=1'b0; end //sra
 6'b100111: begin ALUControl=4'b0111; JRControl=1'b0; end //nor
 6'b101010: begin ALUControl=4'b1000; JRControl=1'b0; end //slt
 6'b001000: begin ALUControl=4'bxxxx; JRControl=1'b1; end //jr
 endcase
 end
 if(ALUOp==2'b11)
	begin
		 casex (Opcode)
		6'b001000: begin ALUControl=4'b0000; JRControl=1'b0; end //addi
		6'b001100: begin ALUControl=4'b0010; JRControl=1'b0; end //andi
		6'b000100: begin ALUControl=4'b0001; JRControl=1'b0; end //beq
		6'b000101: begin ALUControl=4'b0001; JRControl=1'b0; end //bne
		6'b100011: begin ALUControl=4'b0000; JRControl=1'b0; end //lw
		6'b001101: begin ALUControl=4'b0011; JRControl=1'b0; end //ori
		6'b001010: begin ALUControl=4'b1000; JRControl=1'b0; end //slti
		6'b101011: begin ALUControl=4'b0000; JRControl=1'b0; end //sw
		endcase
	end
 end
endmodule
