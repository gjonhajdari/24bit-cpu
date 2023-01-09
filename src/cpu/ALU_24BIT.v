`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 1:55 PM
// Design Name: 
// Module Name: ALU_24BIT
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


module ALU_24bit(
input [23:0] A,
input [23:0] B,
input ALUOp,
input AInvert,
input BNegate,
output Zero,
output Overflow,
output CarryOut,
output [23:0] Result
 );

wire [23:0] COUT ;
ALU_1bit ALU0(A[0], B[0], Result[23], BNegate, AInvert, BNegate, ALUOp, Result[0], COUT[0]);
ALU_1bit ALU1(A[1], B[1], 0, COUT[0], AInvert, BNegate, ALUOp, Result[1], COUT[1]);
ALU_1bit ALU2(A[2], B[2], 0, COUT[1], BNegate, AInvert, BNegate, ALUOp, Result[2], COUT[2]);
ALU_1bit ALU3(A[3], B[3], 0, COUT[2], BNegate, AInvert, BNegate, ALUOp, Result[3], COUT[3]);
ALU_1bit ALU4(A[4], B[4], 0, COUT[3], BNegate, AInvert, BNegate, ALUOp, Result[4], COUT[4]);
ALU_1bit ALU5(A[5], B[5], 0, COUT[4], BNegate, AInvert, BNegate, ALUOp, Result[5], COUT[5]);
ALU_1bit ALU6(A[6], B[6], 0, COUT[5], BNegate, AInvert, BNegate, ALUOp, Result[6], COUT[6]);
ALU_1bit ALU7(A[7], B[7], 0, COUT[6], BNegate, AInvert, BNegate, ALUOp, Result[7], COUT[7]);
ALU_1bit ALU8(A[8], B[8], 0, COUT[7], BNegate, AInvert, BNegate, ALUOp, Result[8], COUT[8]);
ALU_1bit ALU9(A[9], B[9], 0, COUT[8], BNegate, AInvert, BNegate, ALUOp, Result[9], COUT[9]);
ALU_1bit ALU10(A[10], B[10], 0,COUT[9], BNegate, AInvert, BNegate, ALUOp, Result[10], COUT[10]);
ALU_1bit ALU11(A[11], B[11], 0,COUT[10], BNegate, AInvert, BNegate, ALUOp, Result[11], COUT[11]);
ALU_1bit ALU12(A[12], B[12], 0,COUT[11], BNegate, AInvert, BNegate, ALUOp, Result[12], COUT[12]);
ALU_1bit ALU13(A[13], B[13], 0,COUT[12], BNegate, AInvert, BNegate, ALUOp, Result[13], COUT[13]);
ALU_1bit ALU14(A[14], B[14], 0,COUT[13], BNegate, AInvert, BNegate, ALUOp, Result[14], COUT[14]);
ALU_1bit ALU15(A[15], B[15], 0,COUT[14], BNegate, AInvert, BNegate, ALUOp, Result[15], COUT[15]);
ALU_1bit ALU16(A[16], B[16], 0,COUT[15], BNegate, AInvert, BNegate, ALUOp, Result[16], COUT[16]);
ALU_1bit ALU17(A[17], B[17], 0,COUT[16], BNegate, AInvert, BNegate, ALUOp, Result[17], COUT[17]);
ALU_1bit ALU18(A[18], B[18], 0,COUT[17], BNegate, AInvert, BNegate, ALUOp, Result[18], COUT[18]);
ALU_1bit ALU19(A[19], B[19], 0,COUT[18], BNegate, AInvert, BNegate, ALUOp, Result[19], COUT[19]);
ALU_1bit ALU20(A[20], B[20], 0,COUT[19], BNegate, AInvert, BNegate, ALUOp, Result[20], COUT[20]);
ALU_1bit ALU21(A[21], B[21], 0,COUT[20], BNegate, AInvert, BNegate, ALUOp, Result[21], COUT[21]);
ALU_1bit ALU22(A[22], B[22], 0,COUT[21], BNegate, AInvert, BNegate, ALUOp, Result[22], COUT[22]);
ALU_1bit ALU23(A[23], B[23], 0,COUT[22], BNegate, AInvert, BNegate, ALUOp, Result[23], COUT[23]);

assign Zero = ~(Result[0] | Result[1] | Result[2] | Result[3]| Result[4]| Result[5]| Result[6]| Result[7]| Result[8]| Result[9]| Result[10]| Result[11]| Result[12]| Result[13]| Result[14]| Result[15]| Result[16]| Result[17]| Result[18]| Result[19]| Result[20]| Result[21]| Result[22]| Result[23]);

assign Overflow = COUT[22] ^ CarryOut;
 
endmodule
