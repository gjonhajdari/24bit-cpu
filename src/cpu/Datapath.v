`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 1:54 PM
// Design Name: 
// Module Name: CPU
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

//SHIKO FOTO CPU.PDF
module Datapath(
	input Clock, //HYRJE NGA CPU - TELI CPU_IN_1
	input RegDst, Jump, Branch, MemRead, 
	MemWrite, RegWrite, MemToReg, ALUSrc, //HYRJET NGA CU - TELAT CU_OUT_x
	input [1:0] ALUOp, //HYRJE NGA CU - TELAT CU_OUT_x
	output [5:0] opcode //DALJE PER NE CU - TELI D_OUT_1
);

//SHIKO FOTO DATAPATH.PDF
reg[31:0] pc_initial; // Regjistri PC
wire [31:0] pc_next, pc4, pcbeq, pcjump; //TELAT: T1, T2, T3, T4
wire [31:0] instruction; //TELI T5
wire [4:0] mux_regfile; //TELI T6
wire[31:0] readData1, readData2, writeData, //TELAT T7-T9 
mux_ALU, ALU_Out, Zgjerimi, memToMux, //TELAT T10-T13
shifter2beq, shifter2jump, branchAdderToMux, beqAddress, jumpAddress; //TELAT T14-T18 
wire[3:0] ALUCtrl; //TELI T19
wire zerof, overflow, carryout; // TELAT T20-T22
wire andMuxBranch; //TELI T23

initial
begin
    pc_initial = 32'd10; //inicializimi fillesat i PC ne adresen 10
end

always@(posedge Clock)
begin
    pc_initial <= pc_next; //azhurimi i PC ne cdo teh pozitiv me adresen e ardhshme
end

//T2 - PC rritet per 4 (ne sistemet 32 biteshe) per te gjitha instruksionet pervec BEQ, BNE, JUMP
assign pc4 = pc_initial + 4; 

//T14 - pergatitja e adreses per kercim ne BEQ (164 bit si MSB, 16 bit nga pjesa imediate, 2 bit shtyrje majtas (x4) 
assign shifter2beq = {{14{instruction[15]}}, instruction[15:0], 2'b00};
//T15 - pergatitja e adreses per kercim ne Jump, PC[31:28], 26 bit nga pjesa e poshtme e instruction[25:0], 2 bit shtyrje majtas (x4)  
assign shifter2jump = {pc_initial[31:28], instruction[25:0], 2'b00};  

//Instr mem //inicializimi i IM (PC adresa hyrje, teli instruction dajle)
InstructionMemory IM(pc_initial, instruction); 

//T6 - Percaktimi nese RD eshte RD (te R-formati) apo RD = RT (te I-formati) - MUX M1 ne foto
assign mux_regfile = (RegDst == 1'b1) ? instruction[15:11] : instruction[20:16]; 

// T12 - Zgjerimi nga 16 ne 32 bit - 16 bit si MSB dhe pjesa e instruction[15:0] - S1 ne foto
assign Zgjerimi = {{16{instruction[15]}}, instruction[15:0]};  

//REGFILE
//inicializimi i RF(RS, RT, T6 (RD[RD=RD || RD=RT]), T9, CU_OUT_x, CPU_IN_1, T7, T8)
RegisterFile RF(instruction[25:21], instruction[20:16], mux_regfile, writeData, RegWrite, Clock, readData1, readData2 ); 

// T10 - Percaktimi nese hyrja e MUX-it M2 para ALU eshte Regjstri 2 i RF apo vlera imediate e instruksionit 
assign mux_ALU = (ALUSrc == 1'b1) ? Zgjerimi : readData2; 

//inicializimi i ALU Control (CU_OUT_x, Function Code nga R-formati, Opcode, T19) - eshte shtuar ALUOp per I-format qe nuk eshte ne foto po kerkohet ne detyre 
ALUControl AC(ALUOp, instruction[5:0], instruction[31:26], ALUCtrl); 

//inicializimi i ALU (T7, T10, T19[3], T19[2], T19[1:0], T20, T11, T21, T22)
ALU32 ALU(readData1, mux_ALU, ALUCtrl[3], ALUCtrl[2], ALUCtrl[1:0], zerof, ALU_Out, overflow, carryout);

//inicializimi i Data Memory (T11, T8, CU_OUT_x, CU_OUT_x, CPU_IN_1, T13) 
DataMemory DM(ALU_Out, readData2, MemWrite, MemRead, Clock, memToMux);

//T9 - Teli qe i dergon te dhenat nga MUX - M3 ne Regfile
assign writeData = (MemToReg == 1'b1) ? memToMux : ALU_Out;

//T23 - Teli qe del nga porta DHE ne pjesen e eperme te fotos (shikon nese plotesohet kushti per BEQ
assign andMuxBranch = zerof & Branch;

//T17, Teli qe mban adresen ne te cilen do te kercej programi kur kushti BEQ plotesohet
assign beqAddress = pc4 + shifter2beq; 

//T3 - Teli qe del nga Mux M4 ne foto qe kontrollon nese kemi BEQ apo PC+4
assign pcbeq = (andMuxBranch == 1'b1) ? beqAddress : pc4;

//T18, Teli qe mban adresen ne te cilen do te kercej programi kur kemi JUMP
assign jumpAddress = pc4 + shifter2jump;

//T2 - Teli qe update-on PC (3 mundesite PC+4, PCBEQ, PCJUMP)
assign pc_next = (Jump == 1'b1) ? jumpAddress : pcbeq;

//Teli D_OUT_1 qe i dergohet CU
assign opcode = instruction[31:26];

endmodule