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


module ALU_1BIT(
    input A,
    input B,
    input CIN,
    input AInvert,
    input BInvert,
    input Less,
    input [1:0] Op,
    output Result,
    output CarryOut
    );
    
   wire JoA, JoB, mA, mB, dhe_teli, ose_teli, mb_teli; 
   
   assign JoA = ~A;
   assign JoB = ~B;
   
   mux2ne1 muxA(A, JoA, AInvert, mA);
   mux2ne1 muxB(B, JoB, BInvert, mB);
   
   assign dhe_teli = mA & mB;
   assign ose_teli = mA | mB;
   
   Mbledhesi m1(mA, mB, CIN, mb_teli, CarryOut);
   
   mux4ne1 MuxiKryesor(dhe_teli, ose_teli, mb_teli, Less, Op, Result);
    
    
endmodule