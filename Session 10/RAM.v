`timescale 1ns/1ps

module RAM(input clk, input [15:0] data_in, input wr_en, input rd_en, input [3:0] address, output reg [15:0] data_out);

reg [15:0] memory [15:0];

integer i;
initial
begin
	for( i = 0; i < 16 ; i = i+1 )
	begin 
		memory[i] = i;
	end
end 

always @(posedge clk)
begin
  if(wr_en)
	begin
		memory[address] <= data_in;
	end
end

always  @(*)
begin
	if(rd_en)
	begin
		data_out <= memory[address];
	end
end

endmodule