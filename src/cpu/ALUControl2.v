`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2023 09:45:22 PM
// Design Name: 
// Module Name: ALUControl
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


module ALUControl(
input [1:0] ALUOp,
input [3:0] Funct,
output reg Bnegate,
output reg [3:0] Operation
 );


always @(ALUOp)
begin

case(ALUOp)

2'b00:   //Mbledhja per lw apo sw
begin
assign Operation = 3'b010; 
assign Bnegate = 1'b0; 
end

2'b01:  //Zbritja per beq/bne
begin
assign Operation = 3'b010;
assign Bnegate = 1'b1;
end

2'b11:  //MUL
begin 
assign Operation = 3'b100;
assign Bnegate = 1'b0;
end

2'b10:  //Funct 
begin
    case(Funct)
    4'b0010: //mbledhja per r-format
    begin 
    assign Operation = 3'b010;
    assign Bnegate = 1'b0;
    end
    4'b1010: //zbritja 
    begin
    assign Operation = 3'b010;
    assign Bnegate = 1'b1;
    end
    4'b0000: //dhe logjike
    begin
    assign Operation = 3'b000;
    assign Bnegate = 1'b0;
    end
    4'b0001: //ose logjike
    begin
    assign Operation = 3'b001;
    assign Bnegate = 1'b0;
    end
    4'b0011: //slt 
    begin
    assign Operation = 3'b011;
    assign Bnegate = 1'b0;
    end
    4'b0110: //sll
    begin
    assign Operation = 3'b110;
    assign Bnegate = 1'b0;
    end
    4'b0101: //xor
    begin
    assign Operation = 3'b101;
    assign Bnegate = 1'b0;
    end
    endcase

end
endcase
end
endmodule
