'timescale 1ns / 1ps

module Mul_1BIT (
    input A,
    input B,
    input CarryIn,
    input Clock,
    output reg Multiply
);


always @(posedge Clock)
	if (A<B) 
	begin
	for (int i =1 ;i<=B ;i++ ) 
	
	begin
	assign 	Multiply=Multiply+A+CarryIn;
	end	
	
	end
	else 
	begin
	for(int i=1; i<=A;i++)
	begin
	assign Multiply=Multiply+B+CarryIn;
	end
	end
	//logjika e kodit duhet te  jete keshtu diqka
	
end