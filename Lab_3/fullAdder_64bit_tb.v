`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:16:34 02/16/2018
// Design Name:   carraySelect_64bit
// Module Name:   /ad/eng/users/a/s/asan/Documents/EC413/preLab_lab3/fullAdder_64bit_tb.v
// Project Name:  preLab_lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: carraySelect_64bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fullAdder_64bit_tb;

	// Inputs
	reg [63:0] a;
	reg [63:0] b;
	reg c_in;
	reg clk = 0;
	integer i;

	// Outputs
	wire c_out;
	wire [63:0] sum;
		wire c_out_verify;
	wire [63:0]sum_verify;

	// Instantiate the Unit Under Test (UUT)
	carraySelect_64bit uut (
		.c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	always #50 clk = ~clk;
	// Assign Error_flag
	assign {c_out_verify, sum_verify} = a+b+c_in;
	assign error_flag = (c_out != c_out_verify || sum != sum_verify);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		c_in = 0;
		for (i = 0; i < 512; i=i+1)
			begin
				a=i;
				#50 b=i;
				
					//		$display("values = a = %d, b = %d, c_in = %d\n", a, b, c_in);

			end

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

