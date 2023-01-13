module ALU1bit_test();

reg A, B, AInvert, BInvert, CarryIn, LESS;
reg [2:0] Operation;
wire COUT, Result;

initial
$monitor ("A=%b; B=%b; AInvert=%b; BInvert=%b; CarryIn=%b; Operation=%b; Result=%b", A, B, LESS, AInvert, BInvert, Operation, Result, COUT);

initial
begin
	//TEST AND
	#0 A=1'b0;  B=1'b0; AInvert=1'b0; BInvert=1'b0; CarryIn=1'b0; LESS=1'b0; Operation=2'b00;
	#10 A=1'b0; B=1'b1; AInvert=1'b0; BInvert=1'b0; CarryIn=1'b0; LESS=1'b0; Operation=2'b00;
	#10 A=1'b1; B=1'b0; AInvert=1'b0; BInvert=1'b0; CarryIn=1'b0; LESS=1'b0; Operation=2'b00;
	#10 A=1'b1; B=1'b1; AInvert=1'b0; BInvert=1'b0; CarryIn=1'b0; LESS=1'b0; Operation=2'b00;

	//TEST OR
	#0 A=1'b0;  B=1'b0; AInvert=1'b0; BInvert=1'b0; CarryIn=1'b0; LESS=1'b0; Operation=2'b01;
	#10 A=1'b0; B=1'b1; AInvert=1'b0; BInvert=1'b0; CarryIn=1'b0; LESS=1'b0; Operation=2'b01;
	#10 A=1'b1; B=1'b0; AInvert=1'b0; BInvert=1'b0; CarryIn=1'b0; LESS=1'b0; Operation=2'b01;
	#10 A=1'b1; B=1'b1; AInvert=1'b0; BInvert=1'b0; CarryIn=1'b0; LESS=1'b0; Operation=2'b01;

	//TEST ADD
	#0 A=1'b0;  B=1'b0; AInvert=1'b0; BInvert=1'b0; CarryIn=1'b0; LESS=1'b0; Operation=2'b10;
	#10 A=1'b0; B=1'b1; AInvert=1'b0; BInvert=1'b0; CarryIn=1'b0; LESS=1'b0; Operation=2'b10;
	#10 A=1'b1; B=1'b0; AInvert=1'b0; BInvert=1'b0; CarryIn=1'b0; LESS=1'b0; Operation=2'b10;
	#10 A=1'b1; B=1'b1; AInvert=1'b0; BInvert=1'b0; CarryIn=1'b0; LESS=1'b0; Operation=2'b10;
	#10 A=1'b1; B=1'b1; AInvert=1'b0; BInvert=1'b0; CarryIn=1'b1; LESS=1'b0; Operation=2'b10;

	//TEST SUB
	#0 A=1'b0;  B=1'b0; AInvert=1'b0; BInvert=1'b1; CarryIn=1'b1; LESS=1'b0; Operation=2'b10;
	#10 A=1'b0; B=1'b1; AInvert=1'b0; BInvert=1'b1; CarryIn=1'b1; LESS=1'b0; Operation=2'b10;
	#10 A=1'b1; B=1'b0; AInvert=1'b0; BInvert=1'b1; CarryIn=1'b1; LESS=1'b0; Operation=2'b10;
	#10 A=1'b1; B=1'b1; AInvert=1'b0; BInvert=1'b1; CarryIn=1'b1; LESS=1'b0; Operation=2'b10;

	//NOR
	#0 A=1'b0;  B=1'b0; AInvert=1'b1; BInvert=1'b1; CarryIn=1'b0; LESS=1'b0; Operation=2'b00;
	#10 A=1'b0; B=1'b1; AInvert=1'b1; BInvert=1'b1; CarryIn=1'b0; LESS=1'b0; Operation=2'b00;
	#10 A=1'b1; B=1'b0; AInvert=1'b1; BInvert=1'b1; CarryIn=1'b0; LESS=1'b0; Operation=2'b00;
	#10 A=1'b1; B=1'b1; AInvert=1'b1; BInvert=1'b1; CarryIn=1'b0; LESS=1'b0; Operation=2'b00;

	#10 $stop;
end

ALU_1BIT ALUTest(A, B, AInvert, BInvert, CarryIn, LESS, Operation, COUT, Result);


endmodule