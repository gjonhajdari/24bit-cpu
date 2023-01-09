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


module CU(
    input [3:0] OPCODE, //HYRJA NGA D_OUT_1
    output reg RegDst, //DALJET E CU, CU_OUT_x
    output reg Jump,
    output reg AluSrc,
    output reg MemToReg,
    output reg RegWrite
    output reg MemRead,
    output reg MemWrite,
    output reg[1:0] AluOp,
    output reg Branch,
);
    
    
always @ (OPCODE)
begin
	case(OPCODE)
		4'b0110: // PER R-FORMAT
		begin
			RegDst 		= 1;
			Jump 		= 0;
			AluSrc 		= 1;
			MemToReg 	= 0;
			RegWrite 	= 1;
			MemRead 	= 0;
			MemWrite 	= 0;
			AluOp[1] 	= 1;
			AluOp[0] 	= 0;
			Branch 		= 0;
		end

		4'b0001: // PER ADDI
		begin
			RegDst 		= 0;
			Jump 		= 0;
			AluSrc 		= 1;
			MemToReg 	= 0;
			RegWrite 	= 1;
			MemRead 	= 0;
			MemWrite 	= 0;
			AluOp[1] 	= 0;
			AluOp[0] 	= 0;
			Branch 		= 0;
		end

		4'b0010: // PER LW
		begin
			RegDst 		= 0;
			Jump 		= 0;
			AluSrc 		= 1;
			MemToReg 	= 1;
			RegWrite 	= 1;
			MemRead 	= 1;
			MemWrite 	= 0;
			AluOp[1] 	= 0;
			AluOp[0] 	= 0;
			Branch 		= 0;
		end 
			
		4'b0011: // PER SW
		begin
			RegDst 		= 1'bX;
			Jump 		= 0;
			AluSrc 		= 1;
			MemToReg 	= 0;
			RegWrite 	= 1'bX;
			MemRead 	= 0;
			MemWrite 	= 1;
			AluOp[1] 	= 0;
			AluOp[0] 	= 0;
			Branch 		= 0;
		end 
			
		4'b0100: // PER BEQ
		begin
			RegDst 		= 0;
			Jump 		= 0;
			AluSrc 		= 1;
			MemToReg 	= 0;
			RegWrite 	= 1;
			MemRead 	= 0;
			MemWrite 	= 0;
			AluOp[1] 	= 0;
			AluOp[0] 	= 1;
			Branch 		= 1;
		end
	endcase
end

endmodule