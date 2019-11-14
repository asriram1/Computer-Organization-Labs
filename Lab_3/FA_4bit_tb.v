`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:46:44 02/12/2018
// Design Name:   FA_4bit
// Module Name:   /ad/eng/users/a/s/asan/Documents/EC413/preLab_lab3/FA_4bit_tb.v
// Project Name:  preLab_lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FA_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FA_4bit_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg c_in;
	reg [8:0] i;
	reg clk = 1;
	// Outputs
	wire c_out;
	wire [3:0]sum;
	wire c_out_verify;
	wire [3:0]sum_verify;
	wire error_flag;

	// Instantiate the Unit Under Test (UUT)
	FA_4bit uut (
		.c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	// Verification Module 
	verification_4bit Verification(
		.c_out(c_out_verify), 
		.sum(sum_verify), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	// Assign Error_flag
	assign error_flag = (c_out != c_out_verify || sum != sum_verify);
	
	// Verification logic
	always@(posedge clk)
		begin
		if(error_flag)
			// Use $display here instead of $monitor
			// $monitor will display the message whenever there's a change of a, b, c_in
			// $display will only display once when it's been executed
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
		end
	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		c_in = 0;
		//int i;
		for (i = 0; i < 512; i=i+1)
			begin
				#20 {b, a, c_in} = i;
					//		$display("values = a = %d, b = %d, c_in = %d\n", a, b, c_in);

			end

		// Wait 100 ns for global reset to finish
		// #100;
        
		// Add stimulus here

	end
      
endmodule

