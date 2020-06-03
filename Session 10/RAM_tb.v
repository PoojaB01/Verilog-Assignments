`timescale 1ns/1ps

`include "./RAM.v"

module RAM_tb();

reg clk;
reg [15:0] data_in;
reg wr_en;
reg rd_en;
reg [3:0] address;
wire [15:0] data_out;

RAM uut(
	.clk(clk), 
	.data_in(data_in),
	.wr_en(wr_en),
	.rd_en(rd_en),
	.address(address),
	.data_out(data_out)
);

initial 
begin
	clk = 0;
	forever #50 clk = ~clk;
end

initial begin
  $monitor("time = %3d  data_in = %d  data_out = %d  address = %d\n", $time, data_in, data_out, address);
end

initial 
begin
  #20;
	#100 wr_en = 1; address = 2; data_in = 5;
	#10 wr_en = 0; rd_en = 1;
	#10 wr_en = 1; rd_en = 0;
	#100 wr_en = 0; rd_en = 1; address = 2;
	#100 address = 5;
	#100 rd_en = 0; wr_en = 1; data_in = 2;
	#100 wr_en = 0; rd_en = 1; address = 0;
	#100 address = 2;
	#100 address = 5;
	#100 $finish;
end

endmodule