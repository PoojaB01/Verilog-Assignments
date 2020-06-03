`timescale 1ns/1ps

`include "./register_file.v"

module register_file_tb();

reg clk;
reg reset;
reg [2:0]read_sel;
reg [2:0]write_sel;
reg write_en;
reg [7:0] data_in;
wire [7:0] data_out;

register_file uut(
	.clk(clk), 
	.reset(reset),
	.read_sel(read_sel),
	.write_sel(write_sel),
	.write_en(write_en),
    .data_in(data_in),
	.data_out(data_out)
);

initial 
begin
	clk = 0;
	forever #50 clk = ~clk;
end

initial begin
  $monitor("time = %3d  data_in = %d  data_out = %d  read_sel = %d write_sel = %d\n", $time, data_in, data_out, read_sel, write_sel);
end

initial 
begin
#20
#100 reset = 1;
#100 read_sel = 4;
#100 write_en = 1; write_sel = 5; data_in = 9;
#100 read_sel = 5;
#100 reset = 0;
#100 write_sel = 1; data_in = 2;
#100 read_sel = 2; write_sel = 2; data_in = 6;
#100 read_sel = 2;
#100 write_sel = 5; data_in = 10;
#100 write_en = 0;
#100 read_sel = 5;
#100 $finish;
end

endmodule