`timescale 1ns / 1ps

module Alu_24bit_test();
   
    reg[23:0] A, B;
    reg CarryIn, Bnegate;
    reg[2:0] Operation;

    wire[23:0] Result;
    wire CarryOut;
    wire Zero;
    
    initial
    $monitor ("A = %b, B = %b, CIN = %b, COUT = %b, Operation, Bnegate = %b, Result=%b,Zero  = %b",
    A, B,CarryIn,CarryOut, Operation[2], Operation[1], Operation[0], Bnegate, Result,Zero);


    initial
    begin
       //AND
       #0 A=1'b0; B=1'b0; CarryIn=1'b0; Bnegate=0; Operation=3'b000;
       #10 A=1'b0; B=1'b1; CarryIn=1'b0;Bnegate=0; Operation=3'b000;
       #10 A=1'b1; B=1'b0; CarryIn=1'b0;Bnegate=0; Operation=3'b000;
       #10 A=1'b1; B=1'b1; CarryIn=1'b0;Bnegate=0; Operation=3'b000;


        //AND
        //#0  A=0; B=0; CarryIn=0; Bnegate=0; Operation[2]=0;Operation[1]=0; Operation[0]=0;
        //#10 A=1; B=0;CarryIn =0; Bnegate=0; Operation[2]=0; Operation[1]=0; Operation[0]=0;
      //  #10 A=1; B=1; CarryIn=0; Bnegate=0; Operation[2]=0; Operation[1]=0; Operation[0]=0;


//OR  
    #10 A=1'b0; B=1'b0; CIN=1'b0; Bnegate=0; Operation=3'b001;
    #10 A=1'b0; B=1'b1; CIN=1'b0; Bnegate=0; Operation=3'b001;
    #10 A=1'b1; B=1'b0; CIN=1'b0; Bnegate=0; Operation=3'b001;
    #10 A=1'b1; B=1'b0; CIN=1'b1; Bnegate=0; Operation=3'b001;

   

    //OR
    // #10 A=0; B=0; CarryIn=0; Bnegate=0; Operation[2]=0; Operation[1]=0; Operation[0]=1;
    // #10 A=1; B=0; CarryIn=0; Bnegate=0; Operation[2]=0; Operation[1]=0; Operation[0]=1;
    // #10 A=1; B=1; CarryIn=0; Bnegate=0; Operation[2]=0; Operation[1]=0; Operation[0]=1;

     


   //ADD
   #10 A=1'b0; B=1'b0; CarryIn=1'b0;Bnegate=0; Operation=3'b011;
   #10 A=1'b0; B=1'b1; CarryIn=1'b0;Bnegate=0; Operation=3'b011;
   #10 A=1'b1; B=1'b0; CarryIn=1'b0;Bnegate=0; Operation=3'b011;
   #10 A=1'b1; B=1'b1; CarryIn=1'b0;Bnegate=0; Operation=3'b011;
   #10 A=1'b1; B=1'b1; CarryIn=1'b1;Bnegate=0; Operation=3'b011;

   //ADD
   // #10 A=24'h000f; B=24'h000e; CarryIn=0; Bnegate=0; Operation=3'b011;
   // #10 A=16'h0000; B=16'h0000;  CarryIn=0; Bnegate=0; Operation=3'b011;

  //SUB
  #10 A=1'b0; B=1'b0; CarryIn=1'b1; Bnegate=1'b1; Operation=3'b011;
  #10 A=1'b0; B=1'b1; CarryIn=1'b1; Bnegate=1'b1; Operation=3'b011;
  #10 A=1'b1; B=1'b0; CarryIn=1'b1; Bnegate=1'b1; Operation=3'b011;
  #10 A=1'b1; B=1'b1; CarryIn=1'b1; Bnegate=1'b1; Operation=3'b011;

    //SUB
    // #10 A=16'h000f; B=16'h000e; CIN=1; Bnegate=1; Operation=2'b011;




  //XOR
  // #10 A=0; B=0; CarryIn=0; Bnegate=0; Operation[2]=0; Operation[1]=1; Operation[0]=0;
  // #10 A=1; B=0; CarryIn=0; Bnegate=0; Operation[2]=0; Operation[1]=1; Operation[0]=0;
  // #10 A=1; B=1; CarryIn=0; Bnegate=0; Operation[2]=0; Operation[1]=1; Operation[0]=0;

//NOR
#10 A=1'b0; B=1'b0; CarryIn=1'b0; Bnegate=0; Operation=3'b101;
#10 A=1'b0; B=1'b1; CarryIn=1'b0; Bnegate=0; Operation=3'b101;
#10 A=1'b1; B=1'b0; CarryIn=1'b0; Bnegate=0; Operation=3'b101;
#10 A=1'b1; B=1'b1; CarryIn=1'b0; Bnegate=0; Operation=3'b101;
10 $stop; 
end

Alu_24bit ALUTest(A,B,CarryIn,Bnegate,Operation,Result,COUT);

endmodule
