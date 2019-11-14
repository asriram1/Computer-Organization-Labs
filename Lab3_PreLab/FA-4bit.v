`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:33:54 02/13/2018 
// Design Name: 
// Module Name:    FA-4bit 
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
module FA-4bit(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output [3:0] sum,
    output c_out,
    wire [3:0] wire1
    );
	 
	 FA_str fullAdder1 (wire1[0], sum[0], a[0], b[0], c_in);
	 FA_str fullAdder1 (wire1[1], sum[1], a[1], b[1], wire1[0]);
	 FA_str fullAdder1 (wire1[2], sum[2], a[2], b[2], wire1[1]);
    FA_str fullAdder1 (cout, sum[3], a[3], b[3], wire1[2]);
endmodule
