// Code your testbench here
// or browse Examples
module dff_test;
reg D, CLK,reset;
wire Q, QBAR;

//2. Instantiate the module we want to test. We have instantiated the dff_behavior

dff_behavior dut(.q(Q), .qbar(QBAR), .clear(reset), .d(D), .clk(CLK)); // instantiation by port name.

//3. Monitor TB ports
$monitor("simtime = %g, CLK = %b, D = %b,reset = %b, Q = %b, QBAR = %b", $time, CLK, D, reset, Q, QBAR);

//4. apply test vectors
initial begin
  clk=0;
     forever #10 clk = ~clk;  
end 
initial begin 
 reset=1; D <= 0;
 #100; reset=0; D <= 1;
 #100; D <= 0;
 #100; D <= 1;
end 
endmodule
