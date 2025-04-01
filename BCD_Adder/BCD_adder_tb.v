module BCD_adder_tb;
  reg [3:0] A, B;
  wire [3:0] S;
  wire cout;

  // Instantiate the BCD adder
  BCD_adder uut (.A(A), .B(B), .S(S), .cout(cout));

  initial begin
    // Initialize inputs
    A = 0;
    B = 0;

    // Set up the monitor to display changes
    $monitor("Time=%0t | A=%d, B=%d => Sum=%d, Cout=%b the output = %d%d", $time, A, B, S, cout,cout,S);

    // Test case 1: 4 + 5 = 9 (no correction)
    #10 A = 4; B = 5;
    #10;

    // Test case 2: 5 + 5 = 10 (correct to 0, cout=1)
    #10 A = 5; B = 5;
    #10;

    // Test case 3: 9 + 9 = 18 (correct to 8, cout=1)
    #10 A = 9; B = 9;
    #10;

    // Test case 4: 8 + 8 = 16 (correct to 6, cout=1)
    #10 A = 8; B = 8;
    #10;

    // Test case 5: 7 + 3 = 10 (correct to 0, cout=1)
    #10 A = 7; B = 3;
    #10;

    // Test case 6: 2 + 3 = 5 (no correction)
    #10 A = 2; B = 3;
    #10;

    // Test case 7: 6 + 5 = 11 (correct to 1, cout=1)
    #10 A = 6; B = 5;
    #10;

    // Test case 8: 9 + 0 = 9 (no correction)
    #10 A = 9; B = 0;
    #10;

    // Test case 9: 0 + 0 = 0 (no correction)
    #10 A = 0; B = 0;
    #10;

    // Test case 10: 4 + 6 = 10 (correct to 0, cout=1)
    #10 A = 4; B = 6;
    #10;

    // Finish simulation
    #10 $finish;
  end
endmodule
