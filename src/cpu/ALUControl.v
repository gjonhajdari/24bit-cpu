`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2022 11:13:47 AM
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

//ALU Control (CU_OUT_x, Function Code nga R-formati, Opcode, T19) - eshte shtuar ALUOp per I-format qe nuk eshte ne foto po kerkohet ne detyre
module ALUControl(
input  [3:0] Opcode,
output [1:0] RegDst,
output [1:0] ALUSrc,
output [1:0] MemToReg,
output [1:0] RegWrite,
output [1:0] MemWrite,
output [2:0] AluOp, 
output [1:0] Branch
);

always @(ALUOp)
begin
case(ALUOp) // Pyet per vleren e ALUOp, 00-lw,sw; 01-beq,bne, 10-R-format, 11 - I-format
    2'b00: ALUOp = 4'b0010; //LW+SW (mbledhje)
    2'b01: ALUOp = 4'b0110; //BEQ+BNE (zbritje)
    2'b10: //R-Format
        case(Funct)
            6'b100000: ALUOp = 4'b0010; //ADD
            6'b100010: ALUOp = 4'b0110; //SUB
            6'b100100: ALUOp =4'b0000; //AND
            6'd37 : ALUOp = 4'd1; //OR
            6'd42 : ALUOp = 4'd7; //SLT
        endcase

    2'b11: //I-format
        case(opcode)
            6'b000100: ALUOp = 4'b0010; // per ADDI
            6'b000110: ALUOp = 4'b0000; // per ANDI
        endcase
endcase
end



endmodule
