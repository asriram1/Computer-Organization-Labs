`timescale 1ns / 1ns


module ALU(
    a,
    b,
	 func,
    out,
    zero_flag
    );


	 parameter size = 32;
	 
    input [size-1:0] a;
    input [size-1:0] b;
	 input [3:0] func;
    output reg [size-1:0] out;
    output reg zero_flag;
	 
	 	
	always @(*) begin
	case (out) 
	0: zero_flag = 1'b1;
	default: zero_flag = 1'b0;
	endcase
	end
	
	always @(*) begin
		if (func == 4'd0) 
		out = a+b;
		else if (func == 4'd1)
		out = a-b;
		else if (func == 4'd2)
		out = a&b;
		else if (func == 4'd3)
		out = a|b;
		else if (func == 4'd4)
		out = ~(a|b);
		else if (func == 4'd5)
		begin
			if($signed(a)<$signed(b))
				out = 1;
			else
				out = 0;
		end
		else if (func == 4'd6)
		out = {b[15:0], 16'b0};
		else
		out = 0;
   end



endmodule