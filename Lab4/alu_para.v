`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:03:36 10/06/2015 
// Design Name: 
// Module Name:    alu_para 
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
module alu_para #(parameter BW = 32)(c_out, out, a, b, opcode, c_in);


input [BW-1:0] a, b;
input [2:0] opcode;
input c_in;
output [BW-1:0] out;
output c_out;
wire [BW:0] carry;

assign c_out = carry[BW];
assign carry[0] = c_in;

genvar i;
generate
	for (i=0; i<BW; i=i+1)
		begin: alu_loop
			alu alu_1bit(out[i], carry[i+1], a[i], b[i], opcode, carry[i]);
		end
endgenerate


endmodule
