`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 1:56 PM
// Design Name: 
// Module Name: Mux4to1
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

module MUX_4to1 (
	input input0, // AND
	input input1, // OR
	input input2, // Adder
	input input3, // LESS
	input [2:0] Selector,
	output OUT
);

// S 000 H0
// S 001 H1
// S 010 H2
// S 011 H3
    
assign OUT = Selector[1] ? (Selector[0] ? input3 : input2) : (Selector[0] ? input1 : input0);
    
endmodule