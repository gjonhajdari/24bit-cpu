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

reg mOUT;

// S 00 H0
// S 01 H1
// S 10 H2
// S 11 H3

always @(Selector or input0 or input1 or input2 or input3)
begin
	case(Selector)
	// Add other inputs later if needed
		3'b000: mOUT = input0;
		3'b001: mOUT = input1;
		3'b010: mOUT = input2;
		3'b011: mOUT = input3;
	endcase

	OUT = mOUT;
end
    
// assign Dalja = S[1] ? (S[0] ? Hyrja3 : Hyrja2) : (S[0] ? Hyrja1 : Hyrja0);
    
endmodule