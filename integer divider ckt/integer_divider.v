module integer_divider #(parameter M = 5, N = 3)
  (input [M-1:0] dividend, 
   input [N-1:0] divisor, 
   output reg [M-N:0] quotient);

  reg [M-1:0] temp;  // Ensure temp is large enough
  reg [M-1:0] dividend_copy;  // Copy of dividend to modify inside always block
  
  always @(*) begin
    dividend_copy = dividend;  // Copy dividend to avoid modifying input
  //  quotient = 0;  // Initialize quotient
    
    for (integer i = M-N; i >= 0; i = i - 1) begin
      temp = divisor << i;  // Shift divisor(multiplying divisr*2^i)
      
      if (temp <= dividend_copy) begin
        quotient[i] = 1'b1;  					// Set the quotient bit
        dividend_copy = dividend_copy - temp;  // Subtract from dividend
      end
		else 
          quotient[i] = 1'b0; 
    end
  end

endmodule
