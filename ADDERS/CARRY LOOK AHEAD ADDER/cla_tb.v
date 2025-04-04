`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Author: Vikas
// Design Name: 
// Module Name: cla_tb
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

module cla_tb;

    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    cla uut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        $display("Time      a  b  cin    sum    cout");
        $monitor("%0t       %b  %b  %b  %b  %b", $time, a, b, cin, sum, cout);
        
        a = 4'b0011; b = 4'b0101; cin = 1'b0; #10;
        a = 4'b1111; b = 4'b0001; cin = 1'b1; #10;
        a = 4'b1010; b = 4'b0101; cin = 1'b0; #10;
        a = 4'b0000; b = 4'b0000; cin = 1'b0; #10;

        $finish;
    end
