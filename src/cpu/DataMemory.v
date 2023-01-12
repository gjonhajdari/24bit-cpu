`timescale 1ns / 1ps


module DataMemory (
	input wire [23:0] Address,
	input wire [23:0] WriteData,
	input wire MemWrite,
	input wire MemRead,
	input wire Clock,
	output wire [23:0] ReadData
);

reg[7:0] dataMem[127:0];

initial
$readmemb("dataMemory.mem", dataMem);

always@(posedge Clock)
begin
    if(MemWrite) 
	begin
		if (Address < 10)
		begin
			Address = Address + 10;
		end

		//bigEndian
		dataMem[Address] <= WriteData[23:16];
		dataMem[Address + 24'd1] <= WriteData[15:8];
		dataMem[Address + 24'd2] <= WriteData[7:0];
	end
end


always@(negedge Clock)
begin
	$writememb("dataMemory.mem", dataMem);
end
 
assign ReadData[23:16] = dataMem[Address];
assign ReadData[15:8] = dataMem[Address + 24'd1];
assign ReadData[7:0] = dataMem[Address + 24'd2];


endmodule