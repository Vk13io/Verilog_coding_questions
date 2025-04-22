module vending_machine_tb;

 // Inputs
 reg i;
 reg j;
 reg clk;
 reg rst;

 // Outputs
 wire x;
 wire y;

 // Instantiate the Unit Under Test (UUT)
 vending_machine uut (
  .i(i), 
  .j(j), 
  .clk(clk), 
  .rst(rst), 
  .x(x), 
  .y(y)
 );

 initial
  begin
   clk=1'b0;
   forever #5 clk=~clk;
  end
 initial
  begin
   {i,j}=0; rst=0;
   @(negedge clk) rst=1'b1;
   @(negedge clk) rst=1'b0;
   @(negedge clk) {i,j}=2'b10; //1rs
   @(negedge clk) {i,j}=2'b10;
   @(negedge clk) {i,j}=2'b10;
   @(negedge clk) {i,j}=2'b10;
   @(negedge clk) {i,j}=2'b11;
   @(negedge clk) {i,j}=2'b11;
   @(negedge clk) {i,j}=2'b11;
   $finish;
  end
 initial 
  $monitor("clk=%b, rst=%b, i=%b, j=%b, x=%b, y=%b",clk,rst,i,j,x,y);
endmodule
