`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:24:58 02/16/2018 
// Design Name: 
// Module Name:    mux_2x1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux_2x1(out, in0, in1, select);

input select;
input in0;
input in1;
output reg out;


//wire select;
//wire[1:0] in;
always @(select or in0 or in1)
begin
  if (select == 0)
    out = in0;
  else
    out = in1;
end





endmodule
