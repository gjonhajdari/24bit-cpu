`timescale 1ns / 1ps


module DataMemory (
	input  [23:0] Address,
	input  [23:0] WriteData,
	input  Clock,
	input  MemWrite,
	input  MemRead,
	output [23:0] ReadData);

reg[7:0] dataMem[127:0];

initial
$readmemb("DataMemory.mem", dataMem);


always@(posedge Clock)
begin
    if(MemWrite) 
	begin
		//bigEndian
		dataMem[Address] <= WriteData[23:16];
		dataMem[Address + 24'd1] <= WriteData[15:8];
		dataMem[Address + 24'd2] <= WriteData[7:0];
	end
end

always@(negedge Clock)
begin
	$writememb("DataMemory.mem", dataMem);
end
 
assign ReadData[23:16] = dataMem[Address];
assign ReadData[15:8] = dataMem[Address + 24'd1];
assign ReadData[7:0] = dataMem[Address + 24'd2];


endmodule
