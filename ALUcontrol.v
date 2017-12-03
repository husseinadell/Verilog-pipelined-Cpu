
module ALUControl_Block(output reg[1:0] ALUControl,output reg JRControl, input [1:0] ALUOp,input [5:0] Function);

wire [7:0] ALUControlIn;
assign test = {ALUOp,Function};
always @(test)
casex (test)
 8'b11xxxxxx: begin ALUControl=2'b01; JRControl=1'b0; end
 8'b00xxxxxx: begin ALUControl=2'b00; JRControl=1'b0; end
 8'b01xxxxxx: begin ALUControl=2'b10; JRControl=1'b0;end 
 8'b10100000: begin ALUControl=2'b00; JRControl=1'b0; end
 8'b10100010: begin ALUControl=2'b10; JRControl=1'b0; end
 8'b10101010: begin ALUControl=2'b11; JRControl=1'b0; end
 8'b10001000: begin JRControl=1'b1; ALUControl=2'b00; end
 default: begin ALUControl=2'b00;JRControl=1'b0; end
 endcase
endmodule
