`timescale 1ns/1ps

module sequential_multiplier(input [7:0] A, input [7:0] B, output reg [15:0] Z);

reg c;
integer i;
reg [7:0] a, b;

always @(A , B)
begin
  Z = 16'b0000000000000000;
  c = 1'b0;
  a = A;
  b = 8'b00000000;
  for(i = 0; i < 8; i = i + 1)
  begin
    if(a[0])
    {c,b} = b + B;
    {c,b,a}={1'b0,c,b,a[7:1]};
  end
  Z = {b,a};
end

endmodule
