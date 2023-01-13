`timescale 1ns / 1ps


module MUX_2to1 (
	input input0,
	input input1,
	input Selector,
	output OUT,
);
    
assign OUT = Selector ? input0 : input1; 
    
endmodule