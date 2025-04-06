// Code your testbench here
// or browse Examples
module tb;
  reg a,b,select,clk,rst;
  reg mux_out;
  
  wire q;
	
  reg qbar;

  mux_dff mdff(.a(a),.b(b), .select(select), .clk(clk), .rst(rst), .q(q),   	.qbar(qbar));
  
  always #5 clk = ~clk;
  
  
  initial begin
    $monitor("a = %0d,b = %0d, select = %0d, q =  %0d, qbar = %0d",a,b,select,q,qbar);
    	clk = 0;a = 0;b = 1;select = 0;
    	rst = 1 ;
    #10;
	rst =0 ;
    #10;
	a = 1; b = 0; select = 0;
	#10;
	a = 1; b = 1; select = 0;
	#10;
	a = 1; b = 0; select = 1;
	#10;
	a = 0; b = 1; select = 0;
  #30;
    $finish;
  
  
  end
  
  
  endmodule
  
  
