`timescale 1ns / 1ps


module ControlUnit (
    input [3:0] OPCODE, // HYRJA NGA D_OUT_1
    output reg RegDst,	// DALJET E ControlUnit, CU_OUT_x
    output reg ALUSrc,
    output reg MemToReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg [1:0] ALUOp,
    output reg Branch
);

    
always @ (OPCODE)
begin

case(OPCODE)
	4'b0110:	// R-FORMAT
	begin
		RegDst 	= 1'b1;
		ALUSrc 	= 1'b0;
		MemToReg	= 1'b0;
		RegWrite = 1'b1;
		MemRead 	= 1'b0;
		MemWrite = 1'b0;
		ALUOp 	= 2'b10;
		Branch 	= 1'b0;
	end

	4'b0001:	// I-FORMAT
	begin
		RegDst 	= 1'b0;
		ALUSrc 	= 1'b1;
		MemToReg = 1'b0;
		RegWrite = 1'b1;
		MemRead	= 1'b0;
		MemWrite = 1'b0;
		ALUOp 	= 2'b00;
		Branch 	= 1'b0;
	end

	4'b0010:	// LOAD SESQUI (LS)
	begin 
		RegDst 	= 1'b0;
		ALUSrc 	= 1'b1;
		MemToReg = 1'b1;
		RegWrite = 1'b1;
		MemRead 	= 1'b1;
		MemWrite	= 1'b0;
		ALUOp 	= 2'b00;
		Branch 	= 1'b0;
	end

	4'b0011:	// STORE SESQUI (SS)
	begin 
		RegDst 	= 1'bX;
		ALUSrc 	= 1'b1;
		MemToReg = 1'b0;
		RegWrite = 1'bX;
		MemRead 	= 1'b0;
		MemWrite = 1'b1;
		ALUOp 	= 2'b00;
		Branch 	= 1'b0;
	end

	4'b0100:	// BEQ
	begin 
		RegDst 	= 1'b0;
		ALUSrc 	= 1'b0;
		MemToReg = 1'b0;
		RegWrite = 1'b0;
		MemRead 	= 1'b0;
		MemWrite = 1'b0;
		ALUOp 	= 2'b01;
		Branch 	= 1'b1;
	end
endcase
	
end
endmodule