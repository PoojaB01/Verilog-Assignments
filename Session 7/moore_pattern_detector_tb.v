`timescale 1ns/1ps

`include "./moore_pattern_detector.v"

module moore_pattern_detector_tb();


reg x, clk;
wire op;

moore_pattern_detector UUT(.clk(clk), .x(x), .op(op));

initial begin
    $monitor("time = %3d, x = %d, result = %d\n", $time, x, op);

    forever #5 clk=~clk;
end

initial begin
  clk=0;
  x=0;
  #10
  x = 1;
  #10
  x = 0;
  #10
  x = 1;
  #10
  x = 1;
  #10
  x = 0;
  #10
  x = 1;
  #10
  x = 1;
  #10
  x = 0;
  $finish;
end
endmodule
