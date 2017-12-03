
module ALUControl_Block(
	output reg[2:0] ALUControl,output reg JRControl,
 	input [1:0] ALUOp,input [5:0] Function);

wire [6:0] ALUControlIn;
assign test = {ALUOp,Function};
always @(test)
casex (test)
 8'b11xxxxxx: begin ALUControl=3'b000; JRControl=1'b0; end //addi,lw,sw
 8'b01xxxxxx: begin ALUControl=3'b001; JRControl=1'b0; end //beq
 8'b00000000: begin ALUControl=3'b000; JRControl=1'b0; end //add
 8'b00000001: begin ALUControl=3'b001; JRControl=1'b0; end //sub
 8'b00000010: begin ALUControl=3'b010; JRControl=1'b0; end //and
 8'b00000011: begin ALUControl=3'b011; JRControl=1'b0; end //or
 8'b00000100: begin ALUControl=3'b100; JRControl=1'b0; end //slt
 8'b00000100: begin ALUControl=3'b100; JRControl=1'b0; end //slti
 8'b00001000: begin ALUControl=3'b000; JRControl=1'b1; end //jr
 default: 	  begin ALUControl=3'b000; JRControl=1'b0; end 
 endcase
endmodule


/*
		3'b000: result = in1+in2;
		3'b001: result = in1-in2 ;
		3'b010: result = in1&in2;
		3'b011: result = in1|in2;
		3'b100: result = in1<<shamt;
		3'b101: result = in1>>shamt;
		3'b110: result = in1>>>shamt;
		8'b10001000: begin JRControl=1'b1; ALUControl=2'b00; end
*/