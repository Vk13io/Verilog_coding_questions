
`timescale 1ns/1ps
module tb_integer_divider;

parameter M=5;
parameter N=3;

  reg [M-1:0] dividend;
  reg [N-1:0] divisor;
  wire [M-N:0] quotient;
  
   reg [M-1:0] temp; 
   reg [M-1:0] dividend_copy;
  
integer_divider #(M, N) uut (
    .dividend(dividend),
    .divisor(divisor),
    .quotient(quotient)
  );

  initial begin

    $monitor("Time =%t,Dividend = %d,Divisor =%d,Qoutient =%b",$time,dividend,divisor,quotient);

//Testcase 1
    dividend = 25;
    divisor =4;
	#10;
    
//Testcase 2
    dividend = 23;
    divisor =6;
	#10;
    
//Testcase 3
    dividend = 20;
    divisor =5;
	#10;
    
//Testcase 4
    dividend = 13;
    divisor =7;
	#10;
    
    $display("size of qoutient %d ",$size(quotient));
       
  end
endmodule
