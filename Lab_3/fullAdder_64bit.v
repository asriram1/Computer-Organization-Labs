`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:58:05 02/16/2018 
// Design Name: 
// Module Name:    fullAdder_64bit 
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
module fullAdder_64bit(c_out, sum, a, b, c_in);
	 input [63:0] a;
	 input [63:0] b;
	 input c_in;
	 output [63:0] sum;
	 output c_out;
	 wire [3:0] wire1;

	 fullAdder_16bit _16bitaddr1	(wire1[0], sum[15:0], a[15:0], b[15:0], c_in);
	 fullAdder_16bit _16bitaddr2	(wire1[1], sum[31:16], a[31:16], b[31:16], wire1[0]);
	 fullAdder_16bit _16bitaddr3	(wire1[2], sum[47:32], a[47:32], b[47:32], wire1[1]);
	 fullAdder_16bit _16bitaddr4	(c_out, sum[63:48], a[63:48], b[63:48], wire1[2]);
	 

endmodule
