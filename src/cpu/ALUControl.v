`timescale 1ns / 1ps


module ALUControl (
	input [1:0] ALUOp,
	input [3:0] Funct,
	output reg [3:0] Operation
);


always @(ALUOp)
begin

case(ALUOp)
	
	// Mbledhja per LS apo SS
	2'b00: Operation = 4'b0010;

	// Zbritja per BEQ/BNE
	2'b01: Operation = 4'b1010;
	
	// MUL - ne baze te OPCODE
	2'b11: Operation = 4'b0100;

	// Operacionet sipas Funct
	2'b10:
	begin
		case(Funct)
			// AND
			4'b0000: Operation = 4'b0000;
			// OR
			4'b0001: Operation = 4'b0001;
			// ADD
			4'b0010: Operation = 4'b0010;
			// SUB
			4'b0011: Operation = 4'b1010;
			// SLT
			4'b0100: Operation = 4'b0011;
			// XOR
			4'b0110: Operation = 4'b0101;
			// SLL
			4'b0111: Operation = 4'b0110;
		endcase
	end
endcase
end


endmodule