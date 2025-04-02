module seq_det(
    input clk, rst,
    output reg [7:0] seq_out
);
    reg [7:0] mem [0:14]; // Memory to store sequence
    reg [3:0] i; // Index for sequence generation

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Initialize first 5 sequence values
            mem[0] <= 0; 
            mem[1] <= 1; 
            mem[2] <= 1; 
            mem[3] <= 2; 
            mem[4] <= 2;
            
            seq_out <= 0;
            i <= 5; // Start from index 5
        end 
        else begin
            if (i < 15) begin
                mem[i] <= mem[i-2] + mem[i-3]; // Compute next sequence value
                
                // Use mem[i] from the previous clock cycle
                seq_out <= mem[i-1]; 
                
                i <= i + 1; // Increment index
            end
        end
    end
endmodule
