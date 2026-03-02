`timescale 10ns/1ns

module FPGA_EXP4_hd (
    input clk,
    input [3:0] row_signal,//行信号
    output [3:0] col_signal,//列信号
    output [6:0] LED_data,//数码管显示
	 output LED_choose
);
	//分频
	wire clk_divided;
	FPGA_EXP4_div div(
		.clk(clk),
		.clkout(clk_divided)
	);

	//循环产生列控制信号
	col_generate col_generate(
		.clk(clk_divided),
		.col_signal(col_signal)
	);
	
	//读取行信号判断哪个按键被按下,并显示在数码管上
	row_scan row_scan(
		.clk(clk_divided),
		.col_signal(col_signal),
		.row_signal(row_signal),
		.LED_data(LED_data),
		.LED_choose(LED_choose)
	);


endmodule