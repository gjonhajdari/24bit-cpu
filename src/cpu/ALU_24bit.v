`timescale 1ns / 1ps


module ALU_24bit (
	input [23:0] A,
	input [23:0] B,
	input AInvert,
	input BNegate,
	input [2:0] ALUOp,
	output Zero,
	output Overflow,
	output CarryOut,
	output [23:0] Result;
);

wire [23:0] COUT;

ALU_1BIT ALU_0	(A[0], 	B[0], 	AInvert, BNegate, 0, 			Result[23], ALUOp, COUT[0],  Result[0]);
ALU_1BIT ALU_1	(A[1], 	B[1], 	AInvert, BNegate, COUT[0],		0, 			ALUOp, COUT[1],  Result[1]);
ALU_1BIT ALU_2	(A[2], 	B[2], 	AInvert, BNegate, COUT[1], 		0, 			ALUOp, COUT[2],  Result[2]);
ALU_1BIT ALU_3	(A[3], 	B[3], 	AInvert, BNegate, COUT[2], 		0, 			ALUOp, COUT[3],  Result[3]);
ALU_1BIT ALU_4	(A[4], 	B[4], 	AInvert, BNegate, COUT[3], 		0, 			ALUOp, COUT[4],  Result[4]);
ALU_1BIT ALU_5	(A[5], 	B[5], 	AInvert, BNegate, COUT[4], 		0, 			ALUOp, COUT[5],  Result[5]);
ALU_1BIT ALU_6	(A[6], 	B[6], 	AInvert, BNegate, COUT[5], 		0, 			ALUOp, COUT[6],  Result[6]);
ALU_1BIT ALU_7	(A[7], 	B[7], 	AInvert, BNegate, COUT[6], 		0, 			ALUOp, COUT[7],  Result[7]);
ALU_1BIT ALU_8	(A[8], 	B[8], 	AInvert, BNegate, COUT[7], 		0, 			ALUOp, COUT[8],  Result[8]);
ALU_1BIT ALU_9	(A[9], 	B[9], 	AInvert, BNegate, COUT[8], 		0, 			ALUOp, COUT[9],  Result[9]);
ALU_1BIT ALU_10	(A[10],	B[10], 	AInvert, BNegate, COUT[9], 		0, 			ALUOp, COUT[10], Result[10]);
ALU_1BIT ALU_11	(A[11],	B[11], 	AInvert, BNegate, COUT[10], 	0, 			ALUOp, COUT[11], Result[11]);
ALU_1BIT ALU_12	(A[12],	B[12], 	AInvert, BNegate, COUT[11], 	0, 			ALUOp, COUT[12], Result[12]);
ALU_1BIT ALU_13	(A[13],	B[13], 	AInvert, BNegate, COUT[12], 	0, 			ALUOp, COUT[13], Result[13]);
ALU_1BIT ALU_14	(A[14],	B[14], 	AInvert, BNegate, COUT[13], 	0, 			ALUOp, COUT[14], Result[14]);
ALU_1BIT ALU_15	(A[15],	B[15], 	AInvert, BNegate, COUT[14], 	0, 			ALUOp, COUT[15], Result[15]);
ALU_1BIT ALU_16	(A[16],	B[16], 	AInvert, BNegate, COUT[15], 	0, 			ALUOp, COUT[16], Result[16]);
ALU_1BIT ALU_17	(A[17],	B[17], 	AInvert, BNegate, COUT[16], 	0, 			ALUOp, COUT[17], Result[17]);
ALU_1BIT ALU_18	(A[18],	B[18], 	AInvert, BNegate, COUT[17], 	0, 			ALUOp, COUT[18], Result[18]);
ALU_1BIT ALU_19	(A[19],	B[19], 	AInvert, BNegate, COUT[18], 	0, 			ALUOp, COUT[19], Result[19]);
ALU_1BIT ALU_20	(A[20],	B[20], 	AInvert, BNegate, COUT[19], 	0, 			ALUOp, COUT[20], Result[20]);
ALU_1BIT ALU_21	(A[21],	B[21], 	AInvert, BNegate, COUT[20], 	0, 			ALUOp, COUT[21], Result[21]);
ALU_1BIT ALU_22	(A[22],	B[22], 	AInvert, BNegate, COUT[21], 	0, 			ALUOp, COUT[22], Result[22]);
ALU_1BIT ALU_23	(A[23],	B[23], 	AInvert, BNegate, COUT[22], 	0, 			ALUOp, COUT[23], Result[23]);

assign Zero = 	~(Result[0]	 | Result[1]
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