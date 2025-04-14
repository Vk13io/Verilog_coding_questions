
module divby4(
    input  wire clk,
    input  wire rstn,
    output wire out
    );
    
    reg q1,q0;
    
    always@(posedge clk or negedge rstn) begin
        if(!rstn) begin
            q1 <= 1'b0;
            q0 <= 1'b0;
        end else begin
            q1 <= q1 ^ q0;
            q0 <= ~q0;
        end
    end
    
    assign out = q1;
endmodule
