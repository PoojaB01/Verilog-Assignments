`timescale 1ns/1ps

module register_file(input clk, input reset, input [2:0] read_sel, input [2:0] write_sel, input write_en, input [7:0] data_in, output reg [7:0] data_out);

reg [7:0] rf [7:0];

integer i;
always @(reset)
begin
	for( i = 0; i < 8 ; i = i+1 )
	begin 
		rf[i] <= 0;
	end
end 

always @(posedge clk)
begin
  if(write_en)
	begin
		rf[write_sel] <= data_in;
	end
end

always  @(*)
begin
	data_out <= rf[read_sel];
end

endmodule