`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:10:37 02/16/2018 
// Design Name: 
// Module Name:    carraySelect_64bit 
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
module carraySelect_64bit(c_out, sum, a, b, c_in);

    input [63:0] a;
	 input [63:0] b;
	 input c_in;
	 output [63:0] sum;
	 output c_out;
	 wire wire1;
	 wire [1:0]wire2;
	 wire [1:0]wire3;
	 wire [1:0]wire4;
	 wire [31:0] stage2;
	 wire [31:0] stage3;
	 wire [31:0] stage4;
	 
	 wire [3:0]stage_mids;
 	 fullAdder_16bit _16bitaddr1	(wire1, sum[15:0], a[15:0], b[15:0], c_in); //1 stage
	 
 	 fullAdder_16bit _16bitaddr2_1	(wire2[0], stage2[15:0], a[31:16], b[31:16], 1'b0); //2 stage
	 fullAdder_16bit _16bitaddr2_2	(wire2[1], stage2[31:16], a[31:16], b[31:16], 1'b1);
	 mux_2x1 mux1_1 (stage_mids[0],wire2[0],wire2[1],wire1);
	 mux_16bit_2x1 mux1_2 (sum[31:16],stage2[15:0],stage2[31:16],wire1);
	 
 	 fullAdder_16bit _16bitaddr3_1	(wire3[0], stage3[15:0], a[47:32], b[47:32], 1'b0); //3 stage
	 fullAdder_16bit _16bitaddr3_2	(wire3[1], stage3[31:16], a[47:32], b[47:32], 1'b1);
	 mux_2x1 mux2_1 (stage_mids[1],wire3[0],wire3[1],stage_mids[0]);
	 mux_16bit_2x1 mux2_2 (sum[47:32],stage3[15:0],stage3[31:16],stage_mids[0]);
	 
 	 fullAdder_16bit _16bitaddr4_1	(wire4[0], stage4[15:0], a[63:48], b[63:48], 1'b0); //4 stage
	 fullAdder_16bit _16bitaddr4_2	(wire4[1], stage4[31:16], a[63:48], b[63:48], 1'b1);
	 mux_2x1 mux3_1 (c_out,wire4[0],wire4[1],stage_mids[1]);
 	 mux_16bit_2x1 mux3_2 (sum[63:48],stage4[15:0],stage4[31:16],stage_mids[1]);






endmodule
