`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 1:55 PM
// Design Name: 
// Module Name: ALU_1BIT
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


module ALU_1bit(
input A,
input B,
input AInvert,
input BInvert,
input CarryIn,
input LESS,
input [1:0] Operation,
output COUT,
output Result
);

wire joA, joB, mA, mB, Dhe, Ose, Mbledhesi; 
assign joA = ~A ;
assign joB = ~B;

mux2ne1 muxA(A, joA, AInvert, mA);
mux2ne1 muxB(B, joB, BInvert, mB);

assign Dhe = mA & mB;
assign Ose = mA | mB;
  
Mbledhesi_1bit Adder(mA, mB, CarryIn, SUM, Mbledhesi, COUT);
mux4ne1 muxALU(Dhe, Ose, Mbledhesi, LESS, Operation, Result);

endmodule
