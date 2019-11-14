`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:12:39 02/12/2018 
// Design Name: 
// Module Name:    FA_4bit 
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
module FA_4bit(c_out, sum, a, b, c_in);
    input [3:0] a;
	 input [3:0] b;
	 input c_in;
	 output [3:0] sum;
	 output c_out;
	 wire [3:0] wire1;
	 
	 FA_str	fullAdder1	(wire1[0], sum[0], a[0], b[0], c_in);
	 FA_str	fullAdder2	(wire1[1], sum[1], a[1], b[1], wire1[0]);
	 FA_str	fullAdder3	(wire1[2], sum[2], a[2], b[2], wire1[1]);
	 FA_str	fullAdder4	(c_out, sum[3], a[3], b[3], wire1[2]);
	 
//AND_T and1 ( wire1, wire2 , wire3);
//AND_T adn2 (.out(wire1), .in1(wire2), )
	 
	 

endmodule
