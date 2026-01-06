`timescale 10ns/1ns

module seq_detector(
	input clk,
	input ena,
	input seq_in,
	output reg seq_out,
	output reg [6:0] LED_data,//数码管显示序列状态
	output reg LED_choose
); 
	reg [3:0] st;
	parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7,s8=8,s9=9;
	always @(posedge clk) begin
		 if(!ena) 
			 begin
			     seq_out <= 0;
				  st<=s0;
				  LED_choose <= 1'b1;
				  LED_data <= 7'b0001000;//A
			 end
		 else if(ena)
			 begin
				  case (st)
						s0: begin
								  seq_out <= 0;
								  LED_data <= 7'b0000001;//0
								  LED_choose <= 1'b1;
								  if (seq_in==1'b0) 
										st<=s0;
								  else if(seq_in==1'b1)
										st<=s1;
								  else
										st<=s0;
							 end
						s1: begin
								  seq_out <= 0;
								  LED_choose <= 1'b1;
								  LED_data <= 7'b1001111;//1
								  if (seq_in==1'b0) 
										st<=s0;
								  else if(seq_in==1'b1)
										st<=s2;
								  else
										st<=s0;
							 end 
						s2: begin
								  seq_out <= 0;
								  LED_choose <= 1'b1;
								  LED_data <= 7'b0010010;//2
								  if (seq_in==1'b0) 
										st<=s0;
								  else if(seq_in==1'b1)
										st<=s3;
								  else
										st<=s0;
							 end 
						s3: begin
								  seq_out <= 0;
								  LED_choose <= 1'b1;
								  LED_data <= 7'b0000110;//3
								  if (seq_in==1'b0) 
										st<=s4;
								  else if(seq_in==1'b1)
										st<=s3;
								  else
										st<=s0;
							 end             
						s4: begin
								  seq_out <= 0;
								  LED_choose <= 1'b1;
								  LED_data <= 7'b1001100;//4
								  if (seq_in==1'b0) 
										st<=s0;
								  else if(seq_in==1'b1)
										st<=s5;
								  else
										st<=s0;
							 end             
						s5: begin
								  seq_out <= 0;
								  LED_choose <= 1'b1;
								  LED_data <= 7'b0100100;//5
								  if (seq_in==1'b0) 
										st<=s6;
								  else if(seq_in==1'b1)
										st<=s2;
								  else
										st<=s0;
							 end             
						s6: begin
								  seq_out <= 0;
								  LED_choose <= 1'b1;
								  LED_data <= 7'b0100000;//6
								  if (seq_in==1'b0) 
										st<=s7;
								  else if(seq_in==1'b1)
										st<=s1;
								  else
										st<=s0;
								  end             
						s7: begin
								  seq_out <= 0;
								  LED_choose <= 1'b1;
								  LED_data <= 7'b0001111;//7
								  if (seq_in==1'b0) 
										st<=s0;
								  else if(seq_in==1'b1)
										st<=s8;
								  else
										st<=s0;
							 end             
						s8: begin
								  seq_out <= 0;
								  LED_choose <= 1'b1;
								  LED_data <= 7'b0000000;//8
								  if (seq_in==1'b0) 
										st<=s0;
								  else if(seq_in==1'b1)
										st<=s9;
								  else
										st<=s0;
							 end
						s9: begin
								  seq_out <= 1;
								  LED_choose <= 1'b1;
								  LED_data <= 7'b0000100;//9
								  if (seq_in==1'b0) 
										st<=s0;
								  else if(seq_in==1'b1)
										st<=s1;
								  else
										st<=s0;
							 end 
						default:begin
								  seq_out <= 1'bx;
								  LED_choose <= 1'b1;
								  LED_data <= 7'b0111000;//F
								  st<=s0;
								  end
				  endcase
			 end
	end

endmodule