`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 1:55 PM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
input wire[23:0] Address,
input wire[23:0] WriteData,
input wire MemWrite,
input wire MemRead,
input wire Clock,
output wire[23:0] ReadData
);

reg[7:0] dataMem[63:0];

initial
$readmemb("dataMemory.mem", dataMem);

always@(posedge Clock)
begin
    if(MemWrite) 
        begin
            //bigEndian
            dataMem[Address + 24'd0] <= WriteData[23:16];
            dataMem[Address + 24'd1] <= WriteData[15:8];
            dataMem[Address + 24'd2] <= WriteData[7:0];
           end
end

always@(negedge Clock)
begin
$writememb("dataMemory.mem", dataMem);
end

 
 assign ReadData[23:16] = dataMem[Address + 24'd0];
 assign ReadData[15:8] = dataMem[Address + 24'd1];
 assign ReadData[7:0] = dataMem[Address + 24'd2];




endmodule