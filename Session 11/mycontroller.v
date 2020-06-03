`timescale 1ns/1ps

`include "../Session 10/RAM.v"
`include "../Session 11/register_file.v"

module mycontroller (input clk, input reset, output reg [7:0] data_out, output curState);

