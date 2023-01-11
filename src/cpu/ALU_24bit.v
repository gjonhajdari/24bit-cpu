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


module ALU_24bit (
	input [23:0] A,
	input [23:0] B,
	input AInvert,
	input BNegate,
	input [2:0] ALUOp,
	output Zero,
	output Overflow,
	output CarryOut,
	output [23:0] Result
);

wire [23:0] COUT;

ALU_1BIT ALU0	(A[0], 	B[0], 	0, BNegate, 0, 			Result[23], ALUOp, COUT[0],  Result[0]);
ALU_1BIT ALU1	(A[1], 	B[1], 	0, BNegate, COUT[0],	0, 			ALUOp, COUT[1],  Result[1]);
ALU_1BIT ALU2	(A[2], 	B[2], 	0, BNegate, COUT[1], 	0, 			ALUOp, COUT[2],  Result[2]);
ALU_1BIT ALU3	(A[3], 	B[3], 	0, BNegate, COUT[2], 	0, 			ALUOp, COUT[3],  Result[3]);
ALU_1BIT ALU4	(A[4], 	B[4], 	0, BNegate, COUT[3], 	0, 			ALUOp, COUT[4],  Result[4]);
ALU_1BIT ALU5	(A[5], 	B[5], 	0, BNegate, COUT[4], 	0, 			ALUOp, COUT[5],  Result[5]);
ALU_1BIT ALU6	(A[6], 	B[6], 	0, BNegate, COUT[5], 	0, 			ALUOp, COUT[6],  Result[6]);
ALU_1BIT ALU7	(A[7], 	B[7], 	0, BNegate, COUT[6], 	0, 			ALUOp, COUT[7],  Result[7]);
ALU_1BIT ALU8	(A[8], 	B[8], 	0, BNegate, COUT[7], 	0, 			ALUOp, COUT[8],  Result[8]);
ALU_1BIT ALU9	(A[9], 	B[9], 	0, BNegate, COUT[8], 	0, 			ALUOp, COUT[9],  Result[9]);
ALU_1BIT ALU10	(A[10],	B[10], 	0, BNegate, COUT[9], 	0, 			ALUOp, COUT[10], Result[10]);
ALU_1BIT ALU11	(A[11],	B[11], 	0, BNegate, COUT[10], 	0, 			ALUOp, COUT[11], Result[11]);
ALU_1BIT ALU12	(A[12],	B[12], 	0, BNegate, COUT[11], 	0, 			ALUOp, COUT[12], Result[12]);
ALU_1BIT ALU13	(A[13],	B[13], 	0, BNegate, COUT[12], 	0, 			ALUOp, COUT[13], Result[13]);
ALU_1BIT ALU14	(A[14],	B[14], 	0, BNegate, COUT[13], 	0, 			ALUOp, COUT[14], Result[14]);
ALU_1BIT ALU15	(A[15],	B[15], 	0, BNegate, COUT[14], 	0, 			ALUOp, COUT[15], Result[15]);
ALU_1BIT ALU16	(A[16],	B[16], 	0, BNegate, COUT[15], 	0, 			ALUOp, COUT[16], Result[16]);
ALU_1BIT ALU17	(A[17],	B[17], 	0, BNegate, COUT[16], 	0, 			ALUOp, COUT[17], Result[17]);
ALU_1BIT ALU18	(A[18],	B[18], 	0, BNegate, COUT[17], 	0, 			ALUOp, COUT[18], Result[18]);
ALU_1BIT ALU19	(A[19],	B[19], 	0, BNegate, COUT[18], 	0, 			ALUOp, COUT[19], Result[19]);
ALU_1BIT ALU20	(A[20],	B[20], 	0, BNegate, COUT[19], 	0, 			ALUOp, COUT[20], Result[20]);
ALU_1BIT ALU21	(A[21],	B[21], 	0, BNegate, COUT[20], 	0, 			ALUOp, COUT[21], Result[21]);
ALU_1BIT ALU22	(A[22],	B[22], 	0, BNegate, COUT[21], 	0, 			ALUOp, COUT[22], Result[22]);
ALU_1BIT ALU23	(A[23],	B[23], 	0, BNegate, COUT[22], 	0, 			ALUOp, COUT[23], Result[23]);

assign Zero = ~(Result[0] | Result[1]
				| Result[2]  | Result[3]
				| Result[4]  | Result[5]
				| Result[6]  | Result[7]
				| Result[8]  | Result[9]
				| Result[10] | Result[11]
				| Result[12] | Result[13]
				| Result[14] | Result[15]
				| Result[16] | Result[17]
				| Result[18] | Result[19]
				| Result[20] | Result[21]
				| Result[22] | Result[23]);

assign Overflow = COUT[22] ^ CarryOut;
 
endmodule