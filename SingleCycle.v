`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:46:36 12/04/2017 
// Design Name: 
// Module Name:    SingleCycle 
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
module SingleCycle( input clk, input reset , output [31:0] instruction);
wire [31:0] PC_in;
wire [31:0] PC_out;
wire [31:0] PC4;
//wire [31:0] instruction;
wire [4:0] writeRegister;
wire RegDst;
wire [31:0] writeData;
wire RegWrite;
wire [31:0]register1;
wire [31:0] register2;
wire [31:0] result;
wire zero;
wire [3:0] ALUcontrol;
wire [31:0] signextendout;
wire ALUSrc;
wire [31:0] aluin;
wire [31:0] Out32;
wire [31:0] PCbranch;
wire MemtoReg;
wire MemRead;
wire MemWrite;
wire Branch;
wire Jump;
wire SignZero;
wire [1:0] ALUOp;
wire JRControl;
wire [31:0] read_data;
PC mypc(PC_in,PC_out,clk,reset);
PCadder mypcadder1(PC_out,4,PC4);
instructionmemory myinstructionmemory(clk,instruction,PC_out);
mux5bits mux1(instruction[20:16],instruction[15:11],writeRegister,RegDst);
RegisterFile myreg(clk,instruction[25:21],instruction[20:16],writeData,RegWrite,writeRegister,register1,register2 );
SignExtend signextendmu(instruction[15:0],signextendout);
mux32bits mymux(register2,signextendout,ALUSrc,aluin );
ALU alu1(register1,aluin, ALUcontrol, instruction[10:6],zero,result);
Shiftlefttwo shift(Out32,signextendout);
PCadder mypcadder2(PC4,Out32,PCbranch);
and myand(branchsel,Branch,zero);
mux32bits mymux1(PC4,PCbranch,branchsel,PC_in);
ControlUnit mycontrol(instruction[31:26],RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump,SignZero,ALUOp);
ALUControl_Block alucontrol(ALUcontrol,JRControl,instruction[31:26],ALUOp, instruction[5:0]);
data_memory mymemory(result,register2,MemWrite,MemRead,clk,read_data);
mux32bits mymux2(read_data,result,MemtoReg,writeData);
endmodule
