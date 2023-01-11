module RegisterFile_test();

reg [3:0] RS, RT, RD;
reg RegWrite, Clock;
reg [23:0] WriteData;
wire [23:0] ReadRS, ReadRT;

initial
begin
	#0 Clock = 1'b0;
	#5 RD = 4'd8; WriteData = 24'd5; RegWrite = 4'b1;
	#5 Clock = 1'b1;
	#5 Clock = 1'b0; RegWrite = 1'b1;
	#5 RD = 4'd9; WriteData = 24'd7; RegWrite = 4'b1;
	#5 Clock = 1'b1;
	#5 Clock = 1'b0; RegWrite = 1'b0;
	#5 RS = 4'd8; RT = 4'd9;
	#5 $stop;
end