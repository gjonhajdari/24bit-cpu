`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 1:55 PM
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory (
	input wire[23:0] PCAddress,
	output wire[23:0] Instruction
);

reg[7:0] instrMem[63:0];

initial
$readmemb("instructionMemory.mem", instrMem);

assign Instruction[23:20] = instrMem[PCAddress];
assign Instruction[19:16] = instrMem[PCAddress+ 24'd0]
assign Instruction[15:12] = instrMem[PCAddress + 24'd1];
assign Instruction[11:8]  = instrMem[PCAddress + 24'd2];
assign Instruction[7:4]	  = instrMem[PCAddress + 24'd3];
assign Instruction[3:0]	  = instrMem[PCAddress+ 24'd4]


endmodule