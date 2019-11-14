`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:03:18 02/16/2018 
// Design Name: 
// Module Name:    ripple32 
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

module ripple32(
	 input [31:0] a,
    input [31:0] b,
	 input cin,
    output [31:0] s,
	 wire c1, c2, c3, c4, c5, c6, c7,
    output cout);

	ripple_carry(s[3:0], c1, a[3:0],b[3:0], cin);
	ripple_carry(s[7:4], c2, a[7:4],b[7:4], c1);
	ripple_carry(s[11:8], c3, a[11:8],b[11:8], c2);
	ripple_carry(s[15:12], c4, a[15:12],b[15:12], c3);
	ripple_carry(s[19:16], c5, a[19:16],b[19:16], c4);
	ripple_carry(s[23:20], c6, a[23:20],b[23:20], c5);
	ripple_carry(s[27:24], c7, a[27:24],b[27:24], c6);
	ripple_carry(s[31:28], cout, a[31:28],b[31:28], c7);
	
endmodule
