
// Div by 5 duty cycle = 50%

module clkdivby5(
    input  wire clk,
    input  wire rstn,
    output wire clk_out
    );
    
    reg [2:0]q;
    always@(posedge clk or negedge rstn) begin
        if(!rstn) begin
            q    <= 3'b000; 
        end else begin
            q[2] <= q[1] & q[0];
            q[1] <= q[1] ^ q[0];
            q[0] <= (~q[2] & ~q[0]); 
        end
    end
    
    reg q1;
    
    always@(negedge clk or negedge rstn) begin
        if(!rstn) begin
            q1 <= 1'b0;
        end else begin
            q1 <= q[1];
        end
    end
    
    assign clk_out = q1 | q[1];
    
    
endmodule
