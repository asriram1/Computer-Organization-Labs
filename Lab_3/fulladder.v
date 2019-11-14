`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:20:03 02/15/2018 
// Design Name: 
// Module Name:    fulladder 
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
module fulladder(sum, cout, a, b, cin); /* 1 Bit Full adder module */
input a, b, cin; /* declaring inputs */
output cout, sum;  /* declaring ouputs */
wire s1, c1, c2;

xor1 x1(s1, a, b);
and(c1, a, b);
xor1 x2(sum, s1, cin);
and(c2, s1, cin);
or(cout, c2, c1);

endmodule
