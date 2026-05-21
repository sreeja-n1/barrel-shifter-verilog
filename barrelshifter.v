`timescale 1ns/1ps 
module barrel_shifter #( 
parameter N = 8)( 
input clk, 
input rst, 
input signed [N-1:0] data_in, 
input [$clog2(N)-1:0] shift, 
input [1:0] mode, 
input rot_dir, 
output reg [N-1:0] data_out); 
reg [N-1:0] temp; 
always @(*) begin 
 case (mode) 
   2'b00: temp = data_in << shift; 
   2'b01: temp = data_in >> shift; 
   2'b10: temp = data_in >>> shift; 
   2'b11: begin 
     if (shift == 0) begin 
       temp = data_in; 
     end 
     else if (rot_dir == 0) begin 
       temp = (data_in << shift) | (data_in >> (N - shift)); 
     end 
     else begin 
       temp = (data_in >> shift) | (data_in << (N - shift)); 
     end 
     end 
  default: temp = data_in; 
 endcase 
end 
always @(posedge clk or posedge rst) begin 
  if (rst) 
    data_out <= 0; 
  else 
    data_out <= temp; 
  end 
endmodule
