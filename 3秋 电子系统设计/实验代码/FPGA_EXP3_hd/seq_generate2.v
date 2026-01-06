`timescale 10ns/1ns

module seq_generate2(//产生序列2
	input clk,
	input ena,
	output reg seq2
); 
    reg [3:0] num;//用来循环计数输出序列110001101 
    always @(posedge clk)//循环产生序列
        begin
			  if(ena)
					begin
						if(num == 4'd8)
							 begin
								  num <= 4'd0;
							 end
						else if(num>=4'd0 && num<=4'd7)
							 begin
								  num <= num + 4'd1;
							 end
						else
							 begin
								  num <=4'd0;
							 end
							 
						case (num)
							4'd0: begin seq2 <= 1'b1; end
							4'd1: begin seq2 <= 1'b1; end
							4'd2: begin seq2 <= 1'b0; end
							4'd3: begin seq2 <= 1'b0; end 
							4'd4: begin seq2 <= 1'b0; end
							4'd5: begin seq2 <= 1'b1; end
							4'd6: begin seq2 <= 1'b1; end
							4'd7: begin seq2 <= 1'b0; end
							4'd8: begin seq2 <= 1'b1; end	
							default: begin seq2 <= 1'bx; num <= 4'b1000; end
						endcase
					end
			  else if(!ena)
					begin
						seq2 <= 1'bx; 
						num <= 4'b1000;
					end
        end
endmodule