`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Author:Vikas
// Design Name: 
// Module Name: cla
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cla(a,b,cin,cout,sum);
input [3:0]a,b;
input cin;
output [3:0]sum;
output cout;

wire [3:0]g,p;
wire [3:0]c;

genvar i;
generate
    for(i=0;i<4;i=i+1)
        begin:GP_GEN
            assign g[i] = a[i]&b[i];
            assign p[i] = a[i]|b[i]; 
        end
endgenerate

//Carry Logic(not in generate block because of dependency of carry)

assign c[0] = cin;
assign c[1] = g[0]|(p[0]&c[0]);
assign c[2] = g[1]|(p[1]&c[1]);
assign c[3] = g[2]|(p[2]&c[2]);
assign cout = g[3]|(p[3]&c[3]);



generate
    for(i=0;i<4;i=i+1)
        begin:SUM_GEN
            assign sum[i] = a[i] ^ b[i] ^c[i]; 
        end
endgenerate


endmodule
