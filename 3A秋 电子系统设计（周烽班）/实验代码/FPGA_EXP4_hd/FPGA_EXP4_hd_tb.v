`timescale 10ns/1ns

module FPGA_EXP4_hd_tb ();
	reg clk;
	reg [3:0] row_signal;
	wire[3:0] col_signal;
	wire[6:0] LED_data;
	wire LED_choose;
	
	initial clk=0;
	always #1 clk = ~clk; //产生时钟信号	
	
	initial begin
		 #20 row_signal<=4'b1110; 
		 #20 row_signal<=4'b1101;
		 #20 row_signal<=4'b1011; 
		 #20 row_signal<=4'b0111;
		 #20 row_signal<=4'b1101;
	end

	col_generate col_generate(
		clk,
		col_signal
	);
	
	row_scan row_scan(
		.clk(clk),
		.col_signal(col_signal),
		.row_signal(row_signal),
		.LED_data(LED_data),
		.LED_choose(LED_choose)
	);

endmodule