module WB_forward(ReadData1Out,ReadData2Out,ReadData1,ReadData2,rs,rt,WriteRegister,WriteData,RegWrite);
// WB Hazard: Reading data while writing 
// Solve Hazard at the WriteBack Stage
output [31:0] ReadData1Out,ReadData2Out;
input [31:0] ReadData1,ReadData2,WriteData;
input [4:0] rs,rt,WriteRegister;
input RegWrite;
wire ReadSourceRs,ReadSourceRt;
wire compOut1,compOut2;

or orWriteReg(orOut1,WriteRegister[4],WriteRegister[3],WriteRegister[2],WriteRegister[1],WriteRegister[0]);
CompareAddress Compare1(compOut1,WriteRegister,rs);
and andCondition1(ReadSourceRs,RegWrite,orOut1,compOut1);

CompareAddress Compare2(compOut2,WriteRegister,rt);
and andCondition2(ReadSourceRt,RegWrite,orOut1,compOut2);

mux32bits muxReadData1(ReadData1,WriteData,ReadSourceRs,ReadData1Out);
mux32bits muxReadData2(ReadData2,WriteData,ReadSourceRt,ReadData2Out);
endmodule

module mux32bits(
    input [31:0] A,
    input [31:0] B,
	 input sel,
    output reg[31:0] Out
    );
	always @(sel)
	begin
	if(sel==1'b0) Out<=A;
	else if (sel==1'b1) Out<=B;
	end
endmodule
module CompareAddress(equal,Addr1,Addr2); //compare 2 adresses to check if they are the same
	output equal;
	wire equal;
	input [4:0] Addr1,Addr2;
	wire [4:0] Addr1,Addr2,xorAddress;
	xor xorAddress4(xorAddress[4],Addr1[4],Addr2[4]);
	xor xorAddress3(xorAddress[3],Addr1[3],Addr2[3]);
	xor xorAddress2(xorAddress[2],Addr1[2],Addr2[2]);
	xor xorAddress1(xorAddress[1],Addr1[1],Addr2[1]);
	xor xorAddress0(xorAddress[0],Addr1[0],Addr2[0]);
	or Orgate1(OrAddr,xorAddress[4],xorAddress[3],xorAddress[2],xorAddress[1],xorAddress[0]);
	not notgate1(equal,OrAddr);
endmodule