`timescale 1ns/1ps

module moore_pattern_detector(input clk, input x, output reg op);
integer state=0, nextstate;

always @(posedge clk)
state <= nextstate;

always @(state or x)
begin
  op <= 0;
  case(state)
  0: if(x)
    nextstate = 1;
    else 
    nextstate = 0;
  1: if(x)
    nextstate = 1;
    else 
    nextstate = 2;
  2: if(x)
    nextstate = 3;
    else 
    nextstate = 0;
  3: if(x)
    nextstate = 4;
    else 
    nextstate = 2;
  4: if(x)
    nextstate = 1;
    else 
    nextstate = 2;
  endcase
end

always @(state)
if(state == 4)
op <= 1;
else 
op <= 0;

endmodule

