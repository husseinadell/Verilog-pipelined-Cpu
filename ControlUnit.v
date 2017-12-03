module controlunit(input [5:0] Opcode,output reg RegDst,output reg ALUSrc,output reg MemtoReg,output reg RegWrite,output reg MemRead,output reg MemWrite,
output reg Branch,output reg Jump,output reg SignZero,
output reg [1:0] ALUOp);
always @ *
casex (Opcode)
 6'b000000 : begin // R - type
     RegDst = 1'b1;
     ALUSrc = 1'b0;
     MemtoReg= 1'b0;
     RegWrite= 1'b1;
     MemRead = 1'b0;
     MemWrite= 1'b0;
     Branch = 1'b0;
     ALUOp = 2'b10;
     Jump = 1'b0;
     SignZero= 1'b0;
    end
 6'b100011 : begin // lw - load word
     RegDst = 1'b0;
     ALUSrc = 1'b1;
     MemtoReg= 1'b1;
     RegWrite= 1'b1;
     MemRead = 1'b1;
     MemWrite= 1'b0;
     Branch = 1'b0;
     ALUOp = 2'b00;
     Jump = 1'b0;
     SignZero= 1'b0; // sign extend
    end
 6'b101011 : begin // sw - store word
     RegDst = 1'bx;
     ALUSrc = 1'b1;
     MemtoReg= 1'bx;
     RegWrite= 1'b0;
     MemRead = 1'b0;
     MemWrite= 1'b1;
     Branch = 1'b0;
     ALUOp = 2'b00;
     Jump = 1'b0;
     SignZero= 1'b0;
    end
 6'b000101 : begin // bne - branch if not equal
     RegDst = 1'b0;
     ALUSrc = 1'b0;
     MemtoReg= 1'b0;
     RegWrite= 1'b0;
     MemRead = 1'b0;
     MemWrite= 1'b0;
     Branch = 1'b1;
     ALUOp = 2'b01;
     Jump = 1'b0;
     SignZero= 1'b0; // sign extend
    end
6'b000100 : begin // beq
     RegDst = 1'b0;
     ALUSrc = 1'b0;
     MemtoReg= 1'b0;
     RegWrite= 1'b0;
     MemRead = 1'b0;
     MemWrite= 1'b0;
     Branch = 1'b1;
     ALUOp = 2'b01;
     Jump = 1'b0;
     SignZero= 1'b0; // sign extend
    end
 6'b001110 : begin // XORI - XOR immidiate
     RegDst = 1'b0;
     ALUSrc = 1'b1;
     MemtoReg= 1'b0;
     RegWrite= 1'b1;
     MemRead = 1'b0;
     MemWrite= 1'b0;
     Branch = 1'b0;
     ALUOp = 2'b11;
     Jump = 1'b0;
     SignZero= 1'b1; // zero extend
    end
 6'b000010 : begin // j - Jump
     RegDst = 1'b0;
     ALUSrc = 1'b0;
     MemtoReg= 1'b0;
     RegWrite= 1'b0;
     MemRead = 1'b0;
     MemWrite= 1'b0;
     Branch = 1'b0;
     ALUOp = 2'b00;
     Jump = 1'b1;
     SignZero= 1'b0;
    end
6'b001000: // addi
begin 
     RegDst = 1'b1;
     ALUSrc = 1'b1;
     MemtoReg= 1'b0;
     RegWrite= 1'b1;
     MemRead = 1'b0;
     MemWrite= 1'b0;
     Branch = 1'b0;
     ALUOp = 2'b10;
     Jump = 1'b0;
     SignZero= 1'b0;
    end
6'b001100: // andi
begin 
     RegDst = 1'b1;
     ALUSrc = 1'b1;
     MemtoReg= 1'b0;
     RegWrite= 1'b1;
     MemRead = 1'b0;
     MemWrite= 1'b0;
     Branch = 1'b0;
     ALUOp = 2'b10;
     Jump = 1'b0;
     SignZero= 1'b0;
    end
6'b001101: //ori
begin 
     RegDst = 1'b1;
     ALUSrc = 1'b1;
     MemtoReg= 1'b0;
     RegWrite= 1'b1;
     MemRead = 1'b0;
     MemWrite= 1'b0;
     Branch = 1'b0;
     ALUOp = 2'b10;
     Jump = 1'b0;
     SignZero= 1'b0;
    end
6'b001010: //slti
 begin 
     RegDst = 1'b1;
     ALUSrc = 1'b1;
     MemtoReg= 1'b0;
     RegWrite= 1'b1;
     MemRead = 1'b0;
     MemWrite= 1'b0;
     Branch = 1'b0;
     ALUOp = 2'b10;
     Jump = 1'b0;
     SignZero= 1'b0;
    end
 default : begin 
     RegDst = 1'b0;
     ALUSrc = 1'b0;
     MemtoReg= 1'b0;
     RegWrite= 1'b0;
     MemRead = 1'b0;
     MemWrite= 1'b0;
     Branch = 1'b0;
     ALUOp = 2'b10;
     Jump = 1'b0;
     SignZero= 1'b0;
    end
endcase

endmodule

module Program_Counter (clk, reset, PC_in, PC_out);
     input clk, reset;
     input [7:0] PC_in;
     output [7:0] PC_out;
     reg [7:0] PC_out;
     always @ (posedge clk or posedge reset)
     begin
          if(reset==1'b1)
               PC_out<=0;
          else
               PC_out<=PC_in;
     end
endmodule 