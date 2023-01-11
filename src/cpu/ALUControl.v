`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2023 09:45:22 PM
// Design Name: 
// Module Name: ALUControl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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