`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:53 02/21/2018 
// Design Name: 
// Module Name:    adder_param 
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
module adder_param #(
  parameter BW = 32      // 32 is the default width, but you should supply
                         // a valiue, see gen_RCA_tb.v for an example
)(
  input [BW-1:0] a,
  input [BW-1:0] b,
  input c_in,
  output [BW-1:0] sum,
  output c_out
);

  // Declare BW+1 wires for carry signals
  wire [BW:0] carry;

  // The first carry signal comes from our own input.
  assign carry[0] = c_in;

  // Generate BW full adders; each processes 1 bit of the inputs and drives
  // 1 bit of the sum output; each takes one of the carry wires as input and
  // drives the next carry wire as output
  genvar i;
  generate
    for (i=0; i<BW; i=i+1) begin : ADDERS   // "ADDERS" is name of loop
      FA_str adder1 (
        .a(a[i]), .b(b[i]), .c_in(carry[i]), .sum(sum[i]), .c_out(carry[i+1])
      );
    end
  endgenerate

  // The final carry wire drives our own output.
  assign c_out = carry[BW];

endmodule