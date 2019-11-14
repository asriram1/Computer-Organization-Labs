`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:08 02/16/2018 
// Design Name: 
// Module Name:    ripplesixteen 
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
module ripplesixteen(
	 input [15:0] a,
    input [15:0] b,
	 input cin,
    output [15:0] s,
	 wire c1, c2, c3,
    output cout);

	ripple_carry(s[3:0], c1, a[3:0],b[3:0], cin);
	ripple_carry(s[7:4], c2, a[7:4],b[7:4], c1);
	ripple_carry(s[11:8], c3, a[11:8],b[11:8], c2);
	ripple_carry(s[15:12], cout, a[15:12],b[15:12], c3);

endmodule
