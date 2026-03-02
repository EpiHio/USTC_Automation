`timescale 10ns/1ns

module seq_choose(//序列信号二选一
	input choose,
	input seq1,
	input seq2,
	output reg seq_out
); 
	always @(*) 
		begin
			 case (choose)
				  1'b0:seq_out <= seq1;
				  1'b1:seq_out <= seq2;
				  default:seq_out <= 1'bx;
			 endcase
		end
endmodule