`timescale 1ns / 1ps


module InstructionMemory (
	input wire[23:0] PCAddress,
	output wire[23:0] Instruction
);

reg[7:0] instrMem[127:0];

initial
$readmemb("instructionMemory.mem", instrMem);


if (PCAddress < 10)
begin
	PCAddress = PCAddress + 10;
end

assign Instruction[23:16] = instrMem[PCAddress];
assign Instruction[15:8] = instrMem[PCAddress + 24'd1];
assign Instruction[7:0] = instrMem[PCAddress + 24'd2];

endmodule