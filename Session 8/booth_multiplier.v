`timescale 1ns/1ps

module booth_multiplier(input signed [3:0] A, input signed [3:0] B, output reg signed [7:0] Z);

reg q;
integer i;

always @(A , B)
begin
  q = 0;
  Z = 8'b00000000;
  for(i=0; i<4; i=i+1)
  begin
    case({B[i],q})
    2'b10: Z[7:4] = Z[7:4] - A;
    2'b01: Z[7:4] = Z[7:4] + A;
    default : Z = Z;
    endcase
    Z = Z>>1;
    q = B[i];
    Z[7] = Z[6];
  end
  if(A == 4'd8)
  Z = -Z;
end

endmodule
