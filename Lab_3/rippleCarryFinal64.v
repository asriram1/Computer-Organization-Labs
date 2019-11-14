`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:23:00 02/16/2018 
// Design Name: 
// Module Name:    rippleCarryFinal 
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
module rippleCarryFinal(    
	 input [63:0] a,
    input [63:0] b,
	 input cin,
    output [63:0] s,
	 wire c1, c2, c3, c4, c5, c6, c7, c8, c9 c10, c11, c12, c13, c14, c15,
    output cout );

	ripple_carry(s[3:0], c1, a[3:0],b[3:0], cin);
	ripple_carry(s[7:4], c2, a[7:4],b[7:4], c1);
	ripple_carry(s[11:8], c3, a[11:8],b[11:8], c2);
	ripple_carry(s[15:12], c4, a[15:12],b[15:12], c3);
	ripple_carry(s[19:16], c5, a[19:16],b[19:16], c4);
	ripple_carry(s[23:20], c6, a[23:20],b[23:20], c5);
	ripple_carry(s[27:24], c7, a[27:24],b[27:24], c6);
	ripple_carry(s[31:28], c8, a[31:28],b[31:28], c7);
	ripple_carry(s[35:32], c9, a[35:32],b[35:32], c8);
	ripple_carry(s[39:36], c10, a[39:36],b[39:36], c9);
	ripple_carry(s[43:40], c11, a[43:40],b[43:40], c10);
	ripple_carry(s[47:44], c12, a[47:44],b[47:44], c11);
	ripple_carry(s[51:48], c13, a[51:48],b[51:48], c12);
	ripple_carry(s[55:52], c14, a[55:52],b[55:52], c13);
	ripple_carry(s[59:56], c15, a[59:56],b[59:56], c14);
	ripple_carry(s[63:60], cout, a[63:60],b[63:60], c15);
endmodule
