`timescale 1ns/1ps 
module tb_barrel_shifter; 
  parameter N = 8; 
  reg clk; 
  reg rst; 
  reg [N-1:0] data_in; 
  reg[$clog2(N)-1:0] shift; 
  reg[1:0] mode; 
  reg rot_dir;                                                                                                                                                                 
  wire [N-1:0] data_out; 
  barrel_shifter #(N) uut(.clk(clk), .rst(rst), .data_in(data_in), .shift(shift), .mode(mode), 
.rot_dir(rot_dir), .data_out(data_out)); 
always #5 clk = ~clk; 
initial begin 
    $display("Time\tMode Rot Shift Input Output"); 
    clk = 0; rst = 1; #10 rst = 0; 
    data_in = 8'b10110011; shift = 2; 
    mode =2'b00; #10; 
    data_in = 8'b10110011; shift = 3; 
    mode = 2'b01; #10; 
    data_in = 8'b10110011; shift = 2; 
    mode = 2'b10; #10; 
    data_in = 8'b10110011; shift = 1; 
    mode = 2'b11; rot_dir = 0; #10; 
    data_in = 8'b10110011; shift = 2; 
    mode = 2'b11; rot_dir = 1; #10; 
    data_in = 8'b11110000; shift = 2; 
    mode = 2'b01; #10; 
    data_in = 8'b00001111; shift = 2; 
    mode = 2'b01; #10; 
    data_in = 8'b10000001; shift = 3; 
mode = 2'b11; rot_dir = 1; #10; 
$finish; end 
endmodule
