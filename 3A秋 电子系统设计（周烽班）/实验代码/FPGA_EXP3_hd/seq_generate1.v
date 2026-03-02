`timescale 10ns/1ns

module seq_generate1(//产生序列1
	input clk,
	input ena,
	output reg seq1
); 
    reg [3:0] num;//用来循环计数输出序列111010011 
    always @(posedge clk)//循环产生序列
        begin
			  if(ena)
					begin
						if(num == 4'b1000)
							 begin
								  num <= 4'b0000;
							 end
						else if(num>=4'b0000 && num<=4'b0111)
							 begin
								  num <= num + 4'b0001;
							 end
						else
							 begin
								  num <=4'b0000;
							 end
							 
						case (num)
							4'b0000: begin seq1 <= 1'b1; end
							4'b0001: begin seq1 <= 1'b1; end
							4'b0010: begin seq1 <= 1'b1; end
							4'b0011: begin seq1 <= 1'b0; end 
							4'b0100: begin seq1 <= 1'b1; end
							4'b0101: begin seq1 <= 1'b0; end
							4'b0110: begin seq1 <= 1'b0; end
							4'b0111: begin seq1 <= 1'b1; end
							4'b1000: begin seq1 <= 1'b1; end	
							default: begin seq1 <= 1'bx; num <= 4'b1000; end
						endcase
					end
			  else if(!ena)
					begin
						seq1 <= 1'bx; 
						num <= 4'b1000;
					end
        end
endmodule