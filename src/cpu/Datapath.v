`timescale 1ns / 1ps

// SHIKO FOTO CPU.PDF
module Datapath (
	input Clock, // HYRJE NGA CPU - TELI CPU_IN_1
	input RegDst, Branch, MemRead, 
	MemWrite, RegWrite, MemToReg, ALUSrc, // HYRJET NGA CU - TELAT CU_OUT_x
	input [1:0] ALUOp, //HYRJE NGA CU - TELAT CU_OUT_x
	output [3:0] opcode //DALJE PER NE CU - TELI D_OUT_1
);

//SHIKO FOTO DATAPATH.PDF
reg [23:0] pc_initial; // Regjistri PC
wire [23:0] pc_next, pc4, pcbeq; //TELAT: T1, T2, T3, T4
wire [23:0] instruction; // TELI T5
wire [3:0] mux_regfile; // TELI T6
wire [23:0] readData1, readData2, writeData, // TELAT T7-T9 
mux_ALU, ALU_Out, Zgjerimi, memToMux, // TELAT T10-T13
shifter2beq, branchAdderToMux, beqAddress; // TELAT T14-T18 
wire [3:0] ALUCtrl; // TELI T19
wire zerof, overflow, carryout; // TELAT T20-T22
wire andMuxBranch; // TELI T23

initial
begin
    pc_initial = 23'd10; // inicializimi fillesat i PC ne adresen 10
end

always@(posedge Clock)
begin
    pc_initial <= pc_next; // azhurimi i PC ne cdo teh pozitiv me adresen e ardhshme
end

// T2 - PC rritet per 3 (ne sistemet 32 biteshe) per te gjitha instruksionet pervec BEQ, BNE, JUMP
assign pc3 = pc_initial + 23'd3; 

// T14 - pergatitja e adreses per kercim ne BEQ (164 bit si MSB, 16 bit nga pjesa imediate, 2 bit shtyrje majtas (x4) 
assign shifter2beq = {{10{instruction[11]}}, instruction[11:0], 2'b00};

// Instr mem //inicializimi i IM (PC adresa hyrje, teli instruction dajle)
InstructionMemory IM(pc_initial, instruction); 

// T6 - Percaktimi nese RD eshte RD (te R-formati) apo RD = RT (te I-formati) - MUX M1 ne foto
assign mux_regfile = (RegDst == 1'b1) ? instruction[11:8] : instruction[15:12]; 

// T12 - Zgjerimi nga 12 ne 24 bit - 12 bit si MSB dhe pjesa e instruction[11:0] - S1 ne foto
assign Zgjerimi = {{12{instruction[11]}}, instruction[11:0]};
 
// REGFILE
// inicializimi i RF(RS, RT, T6 (RD[RD=RD || RD=RT]), T9, CU_OUT_x, CPU_IN_1, T7, T8)
RegisterFile RF(instruction[19:16], instruction[15:12], mux_regfile, writeData, RegWrite, Clock, readData1, readData2); 

// T10 - Percaktimi nese hyrja e MUX-it M2 para ALU eshte Regjstri 2 i RF apo vlera imediate e instruksionit 
assign mux_ALU = (ALUSrc == 1'b1) ? Zgjerimi : readData2; 

// inicializimi i ALU Control (CU_OUT_x, Function Code nga R-formati, Opcode, T19) - eshte shtuar ALUOp per I-format qe nuk eshte ne foto po kerkohet ne detyre 
ALUControl AC(ALUOp, instruction[3:0], ALUCtrl); 

// inicializimi i ALU (T7, T10, T19[3], T19[2], T19[1:0], T20, T11, T21, T22)
ALU32 ALU(readData1, mux_ALU, 0, ALUCtrl[3], ALUCtrl[2:0], zerof, overflow, carryout, ALU_Out);

// inicializimi i Data Memory (T11, T8, CU_OUT_x, CU_OUT_x, CPU_IN_1, T13) 
DataMemory DM(ALU_Out, readData2, MemWrite, MemRead, Clock, memToMux);

// T9 - Teli qe i dergon te dhenat nga MUX - M3 ne Regfile
assign writeData = (MemToReg == 1'b1) ? memToMux : ALU_Out;

// T23 - Teli qe del nga porta DHE ne pjesen e eperme te fotos (shikon nese plotesohet kushti per BEQ)
assign andMuxBranch = zerof & Branch;

// T17, Teli qe mban adresen ne te cilen do te kercej programi kur kushti BEQ plotesohet
assign beqAddress = pc3 + shifter2beq; 

// T3 - Teli qe del nga Mux M4 ne foto qe kontrollon nese kemi BEQ apo PC+3
assign pcbeq = (andMuxBranch == 1'b1) ? beqAddress : pc3;

// T18, Teli qe mban adresen ne te cilen do te kercej programi kur kemi JUMP
// assign jumpAddress = pc3 + shifter2jump;

// T2 - Teli qe update-on PC (3 mundesite PC+3, PCBEQ, PCJUMP)
// assign pc_next = (Jump == 1'b1) ? jumpAddress : pcbeq;
assign pc_next = pcbeq; // Pasi qe nuk kemi Jump

// Teli D_OUT_1 qe i dergohet CU
assign opcode = instruction[23:20];

endmodule