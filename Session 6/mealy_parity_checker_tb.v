`timescale 1ns/1ps

`include "./mealy_parity_checker.v"

module mealy_parity_checker_tb();


reg x, clk;
wire parity;

mealy_parity_checker UUT(.clk(clk), .x(x), .parity(parity));

initial begin
    $monitor("time = %3d, x = %d, parity = %d\n", $time, x, parity);

    forever #5 clk=~clk;
end

initial begin
  clk=0;
  x=1;
  #20
  x=0;
  #20
  x=1;
  #20
  x=1;
  #20
  $finish;
end
endmodule
