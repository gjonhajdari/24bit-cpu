`timescale 1ns / 1ps


module CPU_test();
reg Clock;
integer i;

initial
begin
	for(i=0; i < 30; i=i+1) //30x nderro nga Clock 0 - 1, 30 tehe pozitive
	begin
		#10 Clock = 0;
		#10 Clock = 1;
	end
	#10 $stop;
end

CPU cpu24(Clock);
endmodule
