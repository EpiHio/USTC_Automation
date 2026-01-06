`timescale 10ns/1ns

module row_scan(
    input clk,
    input [3:0] col_signal,//列信号	 
    input [3:0] row_signal,//行信号
	 output [6:0] LED_data,
	 output LED_choose
);
	reg[3:0] position;
	assign LED_choose=1'b1;
	always @(negedge clk)//循环产生序列
	  begin
        case (row_signal)
			  4'b1110: 
				  begin
						position[3:2]<=2'b00; 
						case (col_signal)
							 4'b1110: position[1:0]<=2'b00;
							 4'b1101: position[1:0]<=2'b01;
							 4'b1011: position[1:0]<=2'b10;
							 4'b0111: position[1:0]<=2'b11;
							 4'b1111: position[1:0]<=position[1:0];
							 default: position[1:0]<=2'b00;
						endcase
				  end
			  4'b1101: 
				  begin 
						position[3:2]<=2'b01;
						case (col_signal)
							 4'b1110: position[1:0]<=2'b00;
							 4'b1101: position[1:0]<=2'b01;
							 4'b1011: position[1:0]<=2'b10;
							 4'b0111: position[1:0]<=2'b11;
							 4'b1111: position[1:0]<=position[1:0];
							 default: position[1:0]<=2'b00;
						endcase 
				  end
			  4'b1011: 
				  begin
						position[3:2]<=2'b10;
						case (col_signal)
							 4'b1110: position[1:0]<=2'b00;
							 4'b1101: position[1:0]<=2'b01;
							 4'b1011: position[1:0]<=2'b10;
							 4'b0111: position[1:0]<=2'b11;
							 4'b1111: position[1:0]<=position[1:0];
							 default: position[1:0]<=2'b00;
						endcase
				  end
			  4'b0111: 
				  begin
						position[3:2]<=2'b11;
						case (col_signal)
							 4'b1110: position[1:0]<=2'b00;
							 4'b1101: position[1:0]<=2'b01;
							 4'b1011: position[1:0]<=2'b10;
							 4'b0111: position[1:0]<=2'b11;
							 4'b1111: position[1:0]<=position[1:0];
							 default: position[1:0]<=2'b00;
						endcase
				  end
			  4'b1111: position<=position;
			  
			  default: position<=4'b1101;
        endcase
		end
		
		LED_decoder LED_decoder(
			 .in(position),
			 .out(LED_data)
		);

endmodule