`timescale 10ns/1ns

module col_generate (
    input clk,
    output reg[3:0] col_signal//列信号
);
    reg [1:0] num;//用来循环计数产生列控制信号
    always @(posedge clk)//循环产生序列
        begin
				if(num == 2'b11)
					 begin
						  num <= 2'b00;
					 end
				else if(num>=2'b00 && num<=2'b10)
					 begin
						  num <= num + 2'b01;
					 end
				else
					 begin
						  num <=2'b00;
					 end
					 
				case (num)
					2'b00: begin col_signal <= 4'b1110; end
					2'b01: begin col_signal <= 4'b1101; end
					2'b10: begin col_signal <= 4'b1011; end
					2'b11: begin col_signal <= 4'b0111; end 
					default: begin num <= 2'b11; end
				endcase
        end
endmodule