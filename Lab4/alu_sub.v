`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:23:11 10/06/2015 
// Design Name: 
// Module Name:    alu_sub 
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
module alu_sub(
   output c_out,
	output sum,
	input a,
	input b,
	input c_in
    );

	wire b_not;
	not notter (b_not, b);
	FA_str suber (c_out, sum, a, b_not, c_in);

endmodule
