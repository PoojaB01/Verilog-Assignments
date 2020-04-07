`timescale 1ns/1ps

module mealy_parity_checker(input clk, input x, output reg parity);
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
      parity = 0;
      nextstate = 0;
    end
    else
    begin
      parity = 1;
      nextstate = 1;
    end
  end
  else 
  begin
    if(state)
    begin
      parity = 1;
      nextstate = 1;
    end
    else
    begin
      parity = 0;
      nextstate = 0;
    end
  end
end
endmodule

