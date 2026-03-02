`timescale 10ns/1ns

module FPGA_EXP3_hd_tb();

reg clk;
reg ena;
reg choose;
reg seq1;
reg seq2;
reg seq_in;
wire signal;
wire[6:0] LED_data;
wire LED_choose;

initial
	begin
		clk = 1'b0;
	end
always #1 clk = ~clk; //产生时钟信号

seq_generate1 generate1(//产生序列1
	.clk(clk),
	.ena(ena),
	.seq1(seq1)
); 

seq_generate2 generate2(//产生序列1
	.clk(clk),
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
	.clk(clk),
	.ena(ena),
	.seq_in(seq_in),
	.seq_out(signal),
	.LED_data(LED_data),//数码管显示序列状态
	.LED_choose(LED_choose)
); 


 // 测试序列
 initial begin
	  // 初始化信号
	  ena = 0;
	  choose = 0;
	  #5; 

	  // 测试1：使能序列1（111010011）
	  ena = 1;
	  choose = 0; // 选择序列1
	  #15;

	  // 测试2：切换至序列2（110001101）
	  choose = 1; 
	  #15;

	  // 测试3：检测使能/禁用功能
	  ena = 0;   // 禁用系统
	  #15;
	  ena = 1;   // 重新使能

 end

endmodule