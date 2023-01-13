`timescale 1ns / 1ps


module Adder_1BIT (
	input A,
	input B,
	input CarryIn,
	output SUM,
	output CarryOut;
);

assign SUM = CarryIn ^ A ^ B;
assign CarryOut = CarryIn & A | CarryIn & B | A & B ;    
    
endmodule