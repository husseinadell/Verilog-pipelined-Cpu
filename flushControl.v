//it's role is to solve the control hazards and deisccard 
//instructions in IF and ID stages when a jump instruction performs
module flushBlock(
ID_RegDst,ID_ALUSrc, ID_MemtoReg,ID_RegWrite,ID_MemRead,ID_MemWrite,
ID_Branch,ID_ALUOp,ID_JRControl,flush,RegDst,ALUSrc,MemtoReg,RegWrite,
MemRead,MemWrite,Branch,ALUOp,JRControl);

output ID_RegDst,ID_ALUSrc,ID_MemtoReg,ID_RegWrite,ID_MemRead,ID_MemWrite,ID_Branch,ID_JRControl;
output [1:0] ID_ALUOp;
input flush,RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,JRControl;
input [1:0] ALUOp;

not (notflush,flush);
and and1(ID_RegDst,RegDst,notflush);
and and2(ID_ALUSrc,ALUSrc,notflush);
and and3(ID_MemtoReg,MemtoReg,notflush);
and and4(ID_RegWrite,RegWrite,notflush);
and and5(ID_MemRead,MemRead,notflush);
and and6(ID_MemWrite,MemWrite,notflush);
and and7(ID_Branch,Branch,notflush);
and and8(ID_JRControl,JRControl,notflush);
and and9(ID_ALUOp[1],ALUOp[1],notflush);
and and10(ID_ALUOp[0],ALUOp[0],notflush);
// generating delay by discarding the ID control signals 
endmodule 

module Discard_Instr(ID_flush,IF_flush,jump,bne,jr);
output ID_flush,IF_flush;
input jump,bne,jr;
or OR1(IF_flush,jump,bne,jr);
or OR2(ID_flush,bne,jr);
endmodule