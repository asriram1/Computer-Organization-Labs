`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:12:56 02/15/2018 
// Design Name: 
// Module Name:    ripple_carry 
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
module ripple_carry(
    input [3:0] a,
    input [3:0] b,
	 input cin,
    output [3:0] s,
	 wire c1, c2, c3, 
    output c_out
    );

	 fulladder fa0(s[0], c1, a[0], b[0], cin);
	 fulladder fa1(s[1], c2, a[1], b[1], c1);
	 fulladder fa2(s[2], c3, a[2], b[2], c2);
	 fulladder fa3(s[3], cout, a[3], b[3], c3);
	 

endmodule
