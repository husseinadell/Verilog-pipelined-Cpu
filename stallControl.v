module StallControl(
	PC_WriteEn,IFID_WriteEn,Stall_flush,
	EX_MemRead,EX_rt,ID_rs,ID_rt,ID_Op
	);
output PC_WriteEn,IFID_WriteEn,Stall_flush;
wire PC_WriteEn,IFID_WriteEn,Stall_flush;
input EX_MemRead,EX_rt,ID_rs,ID_rt;
input [5:0] ID_Op;
wire [4:0] EX_rt,ID_rs,ID_rt,xorRsRt,xorRtRt;
wire [5:0] xoropcodelw,xoropcodexori;
wire EX_MemRead;

xor xorRsRt4(xorRsRt[4],EX_rt[4],ID_rs[4]);
xor xorRsRt3(xorRsRt[3],EX_rt[3],ID_rs[3]);
xor xorRsRt2(xorRsRt[2],EX_rt[2],ID_rs[2]);
xor xorRsRt1(xorRsRt[1],EX_rt[1],ID_rs[1]);
xor xorRsRt0(xorRsRt[0],EX_rt[0],ID_rs[0]);
or  OrRsRt1(OrRsRt,xorRsRt[4],xorRsRt[3],xorRsRt[2],xorRsRt[1],xorRsRt[0]);
not notgate1(notOrRsRt,OrRsRt);
// check if EX_rt==ID_rs
xor xorRtRt4(xorRtRt[4],EX_rt[4],ID_rt[4]);
xor xorRtRt3(xorRtRt[3],EX_rt[3],ID_rt[3]);
xor xorRtRt2(xorRtRt[2],EX_rt[2],ID_rt[2]);
xor xorRtRt1(xorRtRt[1],EX_rt[1],ID_rt[1]);
xor xorRtRt0(xorRtRt[0],EX_rt[0],ID_rt[0]);
or OrRtRt1(OrRtRt,xorRtRt[4],xorRtRt[3],xorRtRt[2],xorRtRt[1],xorRtRt[0]);
not notgate2(notOrRtRt,OrRtRt);
// check if EX_rt==ID_rt
xor xoropcode5(xoropcodelw[5],ID_Op[5],1'b1);
xor xoropcode4(xoropcodelw[4],ID_Op[4],1'b0);
xor xoropcode3(xoropcodelw[3],ID_Op[3],1'b0);
xor xoropcode2(xoropcodelw[2],ID_Op[2],1'b0);
xor xoropcode1(xoropcodelw[1],ID_Op[1],1'b1);
xor xoropcode0(xoropcodelw[0],ID_Op[0],1'b1);
or oropcode1(ec1,xoropcodelw[5],xoropcodelw[4],xoropcodelw[3],xoropcodelw[2],xoropcodelw[1],xoropcodelw[0]);
// opcode != opcode[lw] xoropcodelw =1
xor xoropcod5(xoropcodexori[5],ID_Op[5],1'b0);
xor xoropcod4(xoropcodexori[4],ID_Op[4],1'b0);
xor xoropcod3(xoropcodexori[3],ID_Op[3],1'b1);
xor xoropcod2(xoropcodexori[2],ID_Op[2],1'b1);
xor xoropcod1(xoropcodexori[1],ID_Op[1],1'b1);
xor xoropcod0(xoropcodexori[0],ID_Op[0],1'b0);
or oropcode2(ec2,xoropcodexori[5],xoropcodexori[4],xoropcodexori[3],xoropcodexori[2],xoropcodexori[1],xoropcodexori[0]);
// opcode != opcode[xori] xoropcodexori =1
and and1(xorop,ec1,ec2);
and and2(xoroprt,xorop,notOrRtRt);
or OrEXIDRsRt(OrOut,notOrRsRt,xoroprt);
and AndCondition(Condition,EX_MemRead,OrOut);
// Condition =1 when stall is satisfied
not NotPC_WriteEn(PC_WriteEn,Condition);
not NotIFID_WriteEn(IFID_WriteEn,Condition);
buf bufStallflush(Stall_flush,Condition);
// outputs 
endmodule 