`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2022 06:13:25 PM
// Design Name: 
// Module Name: CU
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


module ControlUnit (
    input [3:0] OPCODE, //HYRJA NGA D_OUT_1
    output reg RegDst, //DALJET E ControlUnit, CU_OUT_x
    output reg ALUSrc,
    output reg MemToReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg[1:0] ALUOp,
    output reg Branch
);
    
    
always @ (OPCODE)
begin

case(OPCODE)
	4'b0110:	// R-FORMAT
	begin
		assign RegDst 	= 1'b1;
		assign ALUSrc 	= 1'b0;
		assign MemToReg	= 1'b0;
		assign RegWrite = 1'b1;
		assign MemRead 	= 1'b0;
		assign MemWrite = 1'b0;
		assign ALUOp 	= 2'b10;
		assign Branch 	= 1'b0;
	end

	4'b0001:	// I-FORMAT
	begin
		assign RegDst 	= 1'b0;
		assign ALUSrc 	= 1'b1;
		assign MemToReg = 1'b0;
		assign RegWrite = 1'b1;
		assign MemRead	= 1'b0;
		assign MemWrite = 1'b0;
		assign ALUOp 	= 2'b00;
		assign Branch 	= 1'b0;
	end

	4'b0010:	// LOAD SESQUI (LS)
	begin 
		assign RegDst 	= 1'b0;
		assign ALUSrc 	= 1'b1;
		assign MemToReg = 1'b1;
		assign RegWrite = 1'b1;
		assign MemRead 	= 1'b1;
		assign MemWrite	= 1'b0;
		assign ALUOp 	= 2'b00;
		assign Branch 	= 1'b0;
	end

	4'b0011:	// STORE SESQUI (SS)
	begin 
		assign RegDst 	= 1'bX;
		assign ALUSrc 	= 1'b1;
		assign MemToReg = 1'b0;
		assign RegWrite = 1'bX;
		assign MemRead 	= 1'b0;
		assign MemWrite = 1'b1;
		assign ALUOp 	= 2'b00;
		assign Branch 	= 1'b0;
	end

	4'b0100:	// BEQ
	begin 
		assign RegDst 	= 1'b0;
		assign ALUSrc 	= 1'b0;
		assign MemToReg = 1'b0;
		assign RegWrite = 1'b0;
		assign MemRead 	= 1'b0;
		assign MemWrite = 1'b0;
		assign ALUOp 	= 2'b01;
		assign Branch 	= 1'b1;
	end
endcase
	
end
endmodule