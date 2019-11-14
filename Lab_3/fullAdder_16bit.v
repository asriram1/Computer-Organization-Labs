`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:17:38 02/16/2018 
// Design Name: 
// Module Name:    fullAdder_16bit 
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
module fullAdder_16bit(c_out, sum, a, b, c_in);
	
	 input [15:0] a;
	 input [15:0] b;
	 input c_in;
	 output [15:0] sum;
	 output c_out;
	 wire [2:0] wire1;
	 
	 
	 FA_4bit fourbitaddr1 (wire1[0], sum[3:0], a[3:0], b[3:0], c_in);
	 FA_4bit fourbitaddr2  (wire1[1], sum[7:4], a[7:4], b[7:4],wire1[0]);
	 FA_4bit fourbitaddr3  (wire1[2], sum[11:8], a[11:8], b[11:8],wire1[1]);
	 FA_4bit fourbitaddr4  (c_out, sum[15:12], a[15:12], b[15:12],wire1[2]);



endmodule
