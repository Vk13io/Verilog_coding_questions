`timescale 1ns/1ps

module rca_tb;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;
    
    // Instantiate the Ripple Carry Adder
    rca uut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
    
    initial begin
        // Apply test cases
        $monitor("Time=%0t | a=%b, b=%b, cin=%b | sum=%b, cout=%b", $time, a, b, cin, sum, cout);
        
        // Test Case 1: 0000 + 0000
        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        
        // Test Case 2: 0001 + 0001
        a = 4'b0001; b = 4'b0001; cin = 0; #10;
        
        // Test Case 3: 1010 + 0101
        a = 4'b1010; b = 4'b0101; cin = 0; #10;
        
        // Test Case 4: 1111 + 0001
        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        
        // Test Case 5: 1111 + 1111 (Max input)
        a = 4'b1111; b = 4'b1111; cin = 0; #10;
        
        // Test Case 6: 1001 + 0110 with carry-in
        a = 4'b1001; b = 4'b0110; cin = 1; #10;
        
        $finish;
    end
endmodule
