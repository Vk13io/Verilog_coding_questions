module fsm_101(d,d_out,clk,rst);
input d,clk,rst;
output d_out;
parameter s0=2'b00,
    s1=2'b01,
    s2=2'b10,
    s3=2'b11;
reg [1:0] state,nxt_state;
always@(posedge clk or negedge rst)
 begin
  if(!rst)
   state<=s0;
  else
   state<=nxt_state;
 end
always@(state or d)
 begin
  nxt_state=s0;
  
  case(state)
   s0 : if(d) nxt_state=s1;
     else nxt_state=s0;
   s1 : if(!d) nxt_state=s2;
      else   nxt_state=s1;
   s2 : if(d)  nxt_state=s3;
      else   nxt_state=s0;
     s3 : nxt_state=s0;
      
  endcase
 end
assign d_out=(state==s3);
endmodule
