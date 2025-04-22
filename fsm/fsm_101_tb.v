module fsm_101_tb();

 // Inputs
 reg d;
 reg clk;
 reg rst;

 // Outputs
 wire d_out;

 // Instantiate the Unit Under Test (UUT)
 fsm_101 uut (
  .d(d), 
  .d_out(d_out), 
  .clk(clk), 
  .rst(rst)
 );

 initial
  begin
   clk=1'b0;
   forever #5 clk=~clk;
  end
 task initialize;
  begin
   clk=0;
   rst=0;
   d=0;
  end
 endtask
 task reset;
  begin
   @(negedge clk);
   rst=1'b0;
   @(negedge clk);
   rst=1'b1;
  end
 endtask
 
 task din(input i);
  begin
   @(negedge clk);
   d=i;
   #10;
  end
 endtask
 
 initial 
  begin
   initialize;
   reset;
   din(1);
   
     din(0);
   
     din(1);
   din(0);
     din(1);
     din(0);
   din(1);
   din(0);
   #10;
   din(1);
   #20;
   $finish;
  end
 initial
  $monitor("clk=%b, rst=%b, d=%b, d_out=%b",clk,rst,d,d_out);
endmodule
