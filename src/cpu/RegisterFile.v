`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 1:56 PM
// Design Name: 
// Module Name: RegisterFile
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

module RegisterFile(
input wire[3:0] RS,
input wire[3:0] RT,
input wire[3:0] RD,
input wire [23:0] WriteData,
output [23:0] ReadRS,
output [23:0] ReadRT,
input RegWrite,
input Clock
    );
    reg[23:0] Register[23:0];
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
