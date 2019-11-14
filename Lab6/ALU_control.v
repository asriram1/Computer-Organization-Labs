`timescale 1ns / 1ns

module ALU_control(
	 input [5:0] instruction,
	 input [1:0] ALUOp,
	 output reg [3:0] func
    );

 always @(*) begin
	if (ALUOp == 2'b00) begin  
		if (instruction == 6'h20) 
		func = 4'd0;
		else if (instruction == 6'h22)
		func = 4'd1;
		else if (instruction == 6'h24)
		func = 4'd2;
		else if (instruction == 6'h25)
		func = 4'd3;
		else if (instruction == 6'h27)
		func = 4'd4;
		else if (instruction == 6'h2A)
		func = 4'd5;
		else if (instruction == 6'h0F)
		func = 4'd6;		
		else
		func = 4'd7;
	end else if (ALUOp == 2'b01) begin
		func = 4'd1;
	end else if (ALUOp == 2'b10) begin
		func = 4'd6;
	end else if (ALUOp == 2'b11) begin
		func = 4'd7;
	end else begin
		func = 4'd7;
	end
   end


endmodule
