`timescale 1ns / 1ps


module ALU_1bit (
	input A,
	input B,
	input AInvert,
	input BInvert,
	input CarryIn,
	input LESS,
	input [2:0] Operation,
	output CarryOut,
	output Result
);

wire notA, notB, A_out, B_out, and_out, or_out, adder_out, xor_out; 
assign notA = ~A;
assign notB = ~B;

MUX_2to1 muxA(A, notA, AInvert, A_out);
MUX_2to1 muxB(B, notB, BInvert, B_out);

assign and_out = A_out & B_out;
assign or_out = A_out | B_out;
assign xor_out = A_out ^ B_out;

  
Adder_1BIT Adder(A_out, B_out, CarryIn, adder_out, CarryOut);

MUX_4to1 muxALU(and_out, or_out, adder_out, LESS, xor_out Operation, Result);

endmodule