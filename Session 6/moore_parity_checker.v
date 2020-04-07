`timescale 1ns/1ps

module moore_parity_checker(input clk, input x, output reg parity);
reg state, nextstate;

initial begin
  state <= 0;
end

always @(posedge clk)
state <= nextstate;

always @(state or x)
begin
  if(x)
  begin
    if(state)
    begin
      nextstate = 0;
    end
    else
    begin
      nextstate = 1;
    end
  end
  else 
  begin
    if(state)
    begin
      nextstate = 1;
    end
    else
    begin
      nextstate = 0;
    end
  end
end

always @(state)
parity <= state;

endmodule

