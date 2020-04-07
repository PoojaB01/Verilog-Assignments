`timescale 1ns/1ps

`include "./sequential_multiplier.v"

module booth_multiplier_tb();

reg [7:0] A;
reg [7:0] B;
wire [15:0] result;

sequential_multiplier uut(.A(A), .B(B), .Z(result));

initial begin
  $monitor("time = %3d  A = %d  B = %d  M = %d\n", $time, A, B, result);
end

initial begin
  A = 7;
  B = 3;
  #20
  B = 7;
  #20
  A = 2;
  B = 3;
  #20
  A = 5;
  #20
  B = 5;
  #20
  A = 8;
  B = 6;
  #20 
  A = 5;
  B = 8;
  #20
  A = 8;
  B = 8;
  $finish;
end

endmodule