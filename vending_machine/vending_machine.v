module (i,j,clk,rst,x,y);
input i,j,clk,rst;
output reg x,y;
parameter idle =2'b00,
          onerup=2'b10,
    tworup=2'b11;
reg [1:0] pst,nx;
always@(posedge clk)
begin
  if(rst)
   pst<=idle;
  else
   pst<=nx;
end
always@(*)
begin
  nx=idle;
  case(pst)
   idle : begin 
      if ({i,j}==2'b0x)
        begin
         nx=idle;
         {x,y}=2'b00;
        end
      else if({i,j}==2'b10)
        begin
         nx=onerup;
         {x,y}=2'b00;
        end
      else if({i,j}==2'b11)
       begin
        nx=tworup;
        {x,y}=2'b00;
       end
     end
   onerup : begin
       if({i,j}==2'b0x)
        begin
         nx=idle;
         {x,y}=2'b00;
        end
       else if({i,j}==2'b10)
         begin
          nx=tworup;
          {x,y}=2'b00;
         end
       else if({i,j}==2'b11)
         begin 
          nx=idle;
          {x,y}=2'b10;
         end
      end
   tworup : begin
       if({i,j}==2'b0x)
        begin
         nx=idle;
         {x,y}=2'b00;
        end
       else if({i,j}==2'b10)
         begin
          nx=idle;
          {x,y}=2'b10;
         end
       else if({i,j}==2'b11)
         begin
          nx=idle;
          {x,y}=2'b11;
         end
      end
   default : begin
       nx=idle;
       {x,y}=2'b00;
       end
       
   endcase
end
endmodule
