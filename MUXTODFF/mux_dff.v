module mux_dff(a,b,select,clk,rst,q,qbar);
  input a,b;
  input select;
  input clk;
  input rst;
  output reg q;
  output  qbar;

wire mux_out;

assign mux_out = select?a:b;
  
  
  always @(posedge clk or posedge rst)
begin

  if(rst)
    q<=0;
  else
    q<=mux_out;

end
assign qbar = ~q;
endmodule
