
module adder_4bit(A,B,S,cout);
  input [3:0]A,B;
  output reg [3:0]S;
  output reg cout;
  always @(*)
	begin
      {cout,S} = A+B;
    end
  
endmodule
module BCD_adder(A,B,S,cout);
  
  input [3:0]A,B;  
  input [3:0]S;
  output     cout;
  wire  [3:0]w;
  wire c1,o1,o2,o3;
  wire c2;
  
  adder_4bit a1(A,B,w,c1);
  and and1(o1,w[3],w[2]);
  and and2(o2,w[3],w[1]);
  or or1(o3,o1,o2,c1);
  adder_4bit A2(w,{1'b0,o3,o3,1'b0},S,c2);
  assign cout = o3;
  
endmodule
  
  
  
