`timescale 10ns/1ns
module FPGA_EXP2_hd_tb();
	 reg rst;
    reg clk;
    reg ena;
    reg [3:0] input_data;
    reg [2:0] reg_choose;
    wire [6:0] LED_data;
    wire [7:0] LED_choose;
    wire clkout_debug;
			 
	 initial
		begin
		 rst=1;
		 ena=0;
		 rst=0;
		 #5 rst=1;
		 #5 ena=0;
		 input_data=4'b0001;
		 reg_choose=3'b000;
		 #5 ena=1;
		 #5 ena=0;
		 input_data=4'b0010;
		 reg_choose=3'b001;
		 #5 ena=1;
		 #5 ena=0;
		 input_data=4'b0011;
		 reg_choose=3'b010;
		 #5 ena=1;
		 #5 ena=0;
		 input_data=4'b0100;
		 reg_choose=3'b011;
		 #5 ena=1;
		 #5 ena=0;
		 input_data=4'b0101;
		 reg_choose=3'b100;
		 #5 ena=1;
		 #5 ena=0;
		 input_data=4'b0110;
		 reg_choose=3'b101;
		 #5 ena=1;
		 #5 ena=0;
		 input_data=4'b0111;
		 reg_choose=3'b110;
		 #5 ena=1;
		 #5 ena=0;
		 input_data=4'b1000;
		 reg_choose=3'b111;
		 #5 ena=1;
 
		end


	initial clk = 1'b0;
	always #1 clk = ~clk; 

	
	 FPGA_EXP2_hd fpga(
	 .rst(rst),
	 .clk(clk),
	 .ena(ena),
	 .input_data(input_data),
	 .reg_choose(reg_choose),
	 .LED_data(LED_data),
	 .LED_choose(LED_choose),
	 .clkout_debug(clkout_debug)
	 );
	 
endmodule