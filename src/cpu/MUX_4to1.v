`timescale 1ns / 1ps

module MUX_4to1 (
	input input0, // AND
	input input1, // OR
	input input2, // Adder
	input input3, // LESS
	// input input4, // MUL
	input input5, // XOR
	input [2:0] Selector,
	output reg OUT,
);

always @(Selector)
begin
	case (Selector)
		3'b000: OUT = input0;
		3'b001: OUT = input1;
		3'b010: OUT = input2;
		3'b011: OUT = input3;
		3'b100: OUT = input4;
		3'b101: OUT = input5;
	endcase
end

// Selector 000 input0
// Selector 001 input1
// Selector 010 input2
// Selector 011 input3
// Selector 100	input4
// Selector 101	input5
    
// assign OUT = Selector[1] ? (Selector[0] ? input3 : input2) : (Selector[0] ? input1 : input0);
    
endmodule