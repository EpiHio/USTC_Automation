`timescale 10ns/1ns
module FPGA_EXP1_tb();
	reg a, b, c;
	wire y0, y1, y2, y3, y4, y5, y6, y7;
	
	always begin
		#0 a = 1'b0; #0 b = 1'b0; #0 c = 1'b0; //abc = 000
		#2 c = 1'b1;                           //abc = 001
		#2 b = 1'b1; #0 c = 1'b0;              //abc = 010
		#2 c = 1'b1;                           //abc = 011
		#2 a = 1'b1; #0 b = 1'b0; #0 c = 1'b0; //abc = 100
		#2 c = 1'b1;                           //abc = 101
		#2 b = 1'b1; #0 c = 1'b0;              //abc = 110
		#2 c = 1'b1;                           //abc = 111
		#2 b = 1'bx;                           //abc = 1x1
		#2 b = 1'b1; #0 c = 1'bz;              //abc = 11z
		#2 ;                                 
		end
		
	FPGA_EXP1  U1(a, b, c, y0, y1, y2, y3, y4, y5, y6, y7);
	
endmodule