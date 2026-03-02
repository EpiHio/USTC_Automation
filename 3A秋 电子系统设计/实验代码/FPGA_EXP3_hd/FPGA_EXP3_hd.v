`timescale 10ns/1ns

module FPGA_EXP3_hd (
    input clk,
    input ena,
    input choose,
    output signal,//选择一个LED灯进行显示
    output [6:0] LED_data,//选择一个数码管显示状态
	 output LED_choose
);
wire seq1;
wire seq2;
wire seq_in;
wire clk_divided;

FPGA_EXP3_div div(//分频时钟信号为2Hz
    .clk(clk),
    .clkout(clk_divided)
);

seq_generate1 generate1(//产生序列1
	.clk(clk_divided),
	.ena(ena),
	.seq1(seq1)
); 

seq_generate2 generate2(//产生序列1
	.clk(clk_divided),
	.ena(ena),
	.seq2(seq2)
); 

seq_choose choose2_1(//序列信号二选一
	.choose(choose),
	.seq1(seq1),
	.seq2(seq2),
	.seq_out(seq_in)
); 

seq_detector detect(
	.clk(clk_divided),
	.ena(ena),
	.seq_in(seq_in),
	.seq_out(signal),
	.LED_data(LED_data),//数码管显示序列状态
	.LED_choose(LED_choose)
); 
endmodule