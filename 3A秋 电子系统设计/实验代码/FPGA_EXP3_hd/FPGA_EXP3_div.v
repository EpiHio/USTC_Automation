`timescale 10ns/1ns

module FPGA_EXP3_div(
	input clk,
	output reg clkout
); 
    // 分频（通过计数器实现 50MHz→2Hz）
    reg [23:0] cnt;  // 计数器
    always @(posedge clk) 
		 begin
				if (cnt >= 12499999) 
					  begin  // 50MHz/2/12500000 = 2Hz
							  cnt <= 1'b0;
							  clkout <= ~clkout;  // 翻转输出，生成 2Hz 方波
					  end 
				 else 
					  begin
							  cnt <= cnt + 1'b1;
					  end
		 end
endmodule