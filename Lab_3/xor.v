`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:01:53 02/16/2018 
// Design Name: 
// Module Name:    xor 
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
module xor1(out, a, b);

input a, b;
output out;
wire c, d, e;

nand(c, a, b);
nand(d, a, c);
nand(e, b, c);
nand(out, d,e);

endmodule
