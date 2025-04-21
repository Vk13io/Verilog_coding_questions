module deco_3_8_task(
input [2:0] inputs,
output reg [7:0] encoded_output) ;
always @(*)
begin
case (inputs)
3'b000: encoded_output =8'b10000000;
3'b001: encoded_output =8'b01000000;
3'b010: encoded_output =8'b00100000;
3'b011: encoded_output =8'b00010000;
3'b100: encoded_output =8'b00001000;
3'b101: encoded_output =8'b00000100;
3'b110: encoded_output =8'b00000010;
3'b111: encoded_output =8'b00000001;
default: encoded_output = 8'b00000000;     

endcase
end
endmodule
