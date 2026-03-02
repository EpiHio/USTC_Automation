`timescale 1ps/1ps

module FPGA_EXP5_IP(
    input clk,//时钟
    input rst,//复位信号
    output [7:0] sign//输出正弦数据
);

reg [9:0] addr;

always @(posedge clk or negedge rst) 
	begin
		 if(!rst) 
			 begin
			  addr<=10'b0;
			 end
		 else 
			begin
			  if(addr<10'b1111111111) 
				  begin
					addr<=addr+10'b1;
				  end
			  else 
				  begin
					addr<=10'b0;
				  end
			end
	end

mystorage rom(
    .clock(clk),
    .address(addr),
    .q(sign)
);

endmodule