`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 1:54 PM
// Design Name: 
// Module Name: Adder
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


module Adder_1BIT (
	input A,
	input B,
	input CarryIn,
	output SUM,
	output CarryOut
);

assign SUM = CarryIn ^ A ^ B;
assign CarryOut = CarryIn & A | CarryIn & B | A & B ;    
    
endmodule