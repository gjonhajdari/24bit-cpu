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
    input [5:0] OPCODE, //HYRJA NGA D_OUT_1
    output reg RegDst, //DALJET E CU, CU_OUT_x
    output reg Jump,
    output reg Branch,
    output reg MemRead,
    output reg MemToReg,
    output reg[1:0] AluOp,
    output reg MemWrite,
    output reg AluSrc,
    output reg RegWrite
    );
    
    
always @ (OPCODE)
begin
case(OPCODE)
6'b000000: //PER R-FORMAT
    begin
    RegDst = 1;
    Jump = 0;
    AluSrc = 0;
    MemToReg = 0;
    RegWrite = 1;
    MemRead = 0;
    MemWrite = 0;
    Branch = 0;
    AluOp[1] = 1;
    AluOp[0] = 0;
    end

6'b100011: //PER LW
    begin
    RegDst = 0;
    Jump = 0;
    AluSrc = 1;
    MemToReg = 1;
    RegWrite = 1;
    MemRead = 1;
    MemWrite = 0;
    Branch = 0;
    AluOp[1] = 0;
    AluOp[0] = 0;
    end 
    
6'b101011: //PER SW
    begin
    RegDst = 1'bX;
    Jump = 0;
    AluSrc = 1;
    MemToReg = 1'bX;
    RegWrite = 0;
    MemRead = 0;
    MemWrite = 1;
    Branch = 0;
    AluOp[1] = 0;
    AluOp[0] = 0;
    end 
    
6'b000100: //PER BEQ
    begin
    RegDst = 1'bX;
    Jump = 0;
    AluSrc = 0;
    MemToReg = 1'bX;
    RegWrite = 0;
    MemRead = 0;
    MemWrite = 0;
    Branch = 1;
    AluOp[1] = 0;
    AluOp[0] = 1;
    end 
6'b001000: //PER ADDI
    begin
    RegDst = 0;
    Jump = 0;
    AluSrc = 1;
    MemToReg = 0;
    RegWrite = 1;
    MemRead = 0;
    MemWrite = 0;
    Branch = 0;
    AluOp[1] = 1;
    AluOp[0] = 1;
    end 
endcase

end

endmodule
