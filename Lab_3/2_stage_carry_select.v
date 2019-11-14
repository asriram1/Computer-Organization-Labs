`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:06:51 02/16/2018 
// Design Name: 
// Module Name:    carry_select 
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
module carry_select(a,b,cin,sum,cout);

input [63:0]a;
input [63:0]b;
input cin;
output [63:0]sum;
output cout;
wire [63:0]sum;
wire cout;
wire s1,c1,s2,c2,s3,c3,s4,s11,s44,c4,c11,s22,c22,s33,c33,c44;

ripplesixteen r1(s[15:0], c1, a[15:0],b[15:0], cin);
ripplesixteen r2(s[31:16], c2, a[31:16],b[31:16], c1);
ripple r3(s[63:32], cout, a[63:32],b[63:32], c2);
ripple r4(s[63:32], cout, a[63:32],b[63:32], c2);
mux32to1(r4[63:32], r3[64:32], r4[64:32],c2);


endmodule
