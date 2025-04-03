// Code your design here
//Ripple Carry Adder - 4 Bits 

module rca(a,b,cin,cout,sum);
input[3:0] a;
input[3:0] b;
output[3:0]sum;
input cin;
output cout;
  
  wire[2:0]c;  
  full_adder fa1 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c[0]));
  full_adder fa2 (.a(a[1]), .b(b[1]), .cin(c[0]), .sum(sum[1]), .cout(c[1]));
  full_adder fa3 (.a(a[2]), .b(b[2]), .cin(c[1]), .sum(sum[2]), .cout(c[2]));
  full_adder fa4 (.a(a[3]), .b(b[3]), .cin(c[2]), .sum(sum[3]), .cout(cout));

  
endmodule
module full_adder(a,b,cin,cout,sum);
input a,b,cin;
output sum,cout;  
  assign sum = a^b^cin;
  assign cout = (a&b)|(a&cin)|(b&cin);
  
  
  
  
  
endmodule  
