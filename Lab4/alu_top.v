`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:19:58 03/01/2018 
// Design Name: 
// Module Name:    alu_top 
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
module alu_top #(parameter BW = 32)(
	input clk,
	input [BW-1:0] a,
	input [BW-1:0] b,
	input c_in,
	input [2:0] opcode,
	output [BW-1:0] out,
	output c_out
    );
	
	wire [BW-1:0] sum_to_reg;
	wire c_out_to_reg;
	
	dff	#(.BW(BW))	Register_out 	(.q(out),.d(sum_to_reg),.clk(clk));	
	
	dff	#(.BW(1))	Register_c_out	(.q(c_out),.d(c_out_to_reg),.clk(clk));	
	
	alu_para	#(.BW(BW))	alu_1bit	(.c_out(c_out_to_reg),.out(sum_to_reg),.opcode(opcode),.a(a),.b(b),.c_in(c_in));
endmodule
