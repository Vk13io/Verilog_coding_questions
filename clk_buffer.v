module clk_buffr(mclk,bclk);
input mclk;
output bclk;
buf b1(bclk,mclk);
endmodule
