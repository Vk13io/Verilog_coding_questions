
`timescale 1ns/1ps

module tb_sequence_generator;

    reg clk, rst;
    wire [7:0] seq_out;
    
    // Instantiate the sequence generator
    seq_det uut (.clk(clk), .rst(rst), .seq_out(seq_out));
    
    // Generate clock signal
    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0t | Sequence Output = %d", $time, seq_out);

        clk = 0;
        rst = 1;  #10;
        rst = 0;

        #150; // Run for 15 clock cycles
        $finish;
    end
endmodule
