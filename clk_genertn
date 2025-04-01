`timescale 1ns/1ps

module clk_generation;
bit clk;

realtime t0;
realtime t1;

real frequency_Hz;
real frequency_MHz;

real period;
real T_on;
real T_off;


initial 

forever 
	begin
      //generate 75% duty cycle clock at 250Mhz(period = 4ns)
	clk = 1;#3.0;		
	clk = 0;#1.0;

    end
  end
  
  
initial 
begin
  @(posedge clk) t0 = $realtime;
  @(posedge clk) t1 = $realtime;
  
  frequency_Hz = 1.0e9 / (t1 - t0);
  frequency_MHz = frequency_Hz / 1.0e6;
  
  period = t1 - t0;
  
  T_on = .75 * period;
  T_off = .75 * period ;
  
  
  $display("Frequency = %gHz" ,frequency_Hz);
  $display("Frequency = %gMHz" ,frequency_MHz);
  $display("T_on = %0dns" ,T_on);
  $display("T_off = %0dns" ,T_off);
  
  #100;
$finish;
  
end



initial begin

  $dumpfile("dump.vcd");
  $dumpvars(0,clk_generation)
end

endmodule
