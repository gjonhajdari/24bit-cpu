`timescale 1ns / 1ps


module RegisterFile (
	input wire[3:0] RS,
	input wire[3:0] RT,
	input wire[3:0] RD,
	input wire [23:0] WriteData,
	input RegWrite,
	input Clock,
	output [23:0] ReadRS,
	output [23:0] ReadRT,
);

reg[23:0] Register[15:0];

// Name all registers
assign zero  = Register[4'b0000];
assign r1	 = Register[4'b0001];
assign r2	 = Register[4'b0010];
assign r3	 = Register[4'b0011];
assign r4	 = Register[4'b0100];
assign r5	 = Register[4'b0101];
assign r6	 = Register[4'b0110];
assign r7	 = Register[4'b0111];
assign r8	 = Register[4'b1000];
assign r9	 = Register[4'b1001];
assign r10	 = Register[4'b1010];
assign r11	 = Register[4'b1011];
assign r12	 = Register[4'b1100];
assign r13	 = Register[4'b1101];
assign r14	 = Register[4'b1110];
assign r15	 = Register[4'b1111];

// Special register for multiply function
reg[47:0] MULREG;


always @ (posedge Clock)
begin
	if(RegWrite)
	begin
		Register[RD] <= WriteData;
	end
end

assign ReadRS = Register[RS]; 
assign ReadRT = Register[RT]; 


endmodule