`timescale 10ns/1ns
module FPGA_EXP2_hd(
    input rst,
    input clk,
    input ena,
    input [3:0] input_data,
    input [2:0] reg_choose,
    output DP,
    output [6:0] LED_data,//reg[6]->a,reg[0]->g
    output reg[7:0] LED_choose,
    output clkout_debug
);

    //1.时钟分频
    wire clk_divided;//分频后的时钟信号
    div50MHZ div1(
        .clk(clk),
        .rst(rst),        
        .clkout(clk_divided)
    );
    assign clkout_debug = clk_divided;
	 
    //2.数据锁存
    reg [3:0] data_S0;//记录输入数据
    reg [3:0] data_S1;
    reg [3:0] data_S2;
    reg [3:0] data_S3;
    reg [3:0] data_S4;
    reg [3:0] data_S5;
    reg [3:0] data_S6;
    reg [3:0] data_S7;
	 assign DP=1'b0;//小数点常亮	 
			
    always @(posedge ena or negedge rst)//赋值
        begin
        if(!rst)//复位信号
            begin
                data_S0<=4'b0001;
                data_S1<=4'b0010;
                data_S2<=4'b0011;
                data_S3<=4'b0100;
                data_S4<=4'b0101;
                data_S5<=4'b0110;
                data_S6<=4'b0111;
                data_S7<=4'b1000;
            end
        else if(ena)
            begin
                case (reg_choose)
                    3'b000: data_S0<=input_data;
                    3'b001: data_S1<=input_data;
                    3'b010: data_S2<=input_data;
                    3'b011: data_S3<=input_data;
                    3'b100: data_S4<=input_data;
                    3'b101: data_S5<=input_data;
                    3'b110: data_S6<=input_data;
                    3'b111: data_S7<=input_data;
                endcase
            end
        end


	 //3.位选控制，循环选中LED灯，频率为1000hz      
	 reg [3:0] output_data;//输出给LED灯的数据
    reg [2:0] num;//用来循环给LED灯赋值	 
    always @(posedge clk_divided)//循环给LED灯赋值
        begin
            if(num == 3'b111)
                begin
                    num <= 3'b000;
                end
            else if(num>=3'b000 && num<=3'b110)
                begin
                    num <= num + 3'b001;
                end
            else
                begin
                    num <=3'b000;
                end
                
            case (num)
					3'b000: begin output_data<=data_S0; LED_choose<=8'b00000001; end
					3'b001: begin output_data<=data_S1; LED_choose<=8'b00000010; end
					3'b010: begin output_data<=data_S2; LED_choose<=8'b00000100; end
					3'b011: begin output_data<=data_S3; LED_choose<=8'b00001000; end 
					3'b100: begin output_data<=data_S4; LED_choose<=8'b00010000; end
					3'b101: begin output_data<=data_S5; LED_choose<=8'b00100000; end
					3'b110: begin output_data<=data_S6; LED_choose<=8'b01000000; end
					3'b111: begin output_data<=data_S7; LED_choose<=8'b10000000; end
            endcase
        end
        
	  //4. 段码译码：4位数据→共阳极8段信号
	  LED_decode decode1(
	  .in(output_data),
	  .out(LED_data)
	  );
  
endmodule


module div50MHZ(//分频模块
    input  clk,       // 输入：wire类型（50MHz）
    input  rst,
    output reg clkout // 输出：reg类型（分频后的时钟，1kHz）
);
    // 分频（通过计数器实现 50MHz→1kHz）
    reg [15:0] cnt;  // 计数器
    always @(posedge clk) 
		 begin
				if (cnt >= 5'b11111) 
					  begin  // 50MHz/2/25000 = 1kHz
							  cnt <= 1'b0;
							  clkout <= ~clkout;  // 翻转输出，生成 1kHz 方波
					  end 
				 else 
					  begin
							  cnt <= cnt + 1'b1;
					  end
		 end
endmodule


module LED_decode(//将值赋给数码管的PIN
    input [3:0] in,
	 output reg [6:0] out
);
    always @(*) 
        begin
           case (in)
                4'b0000: out = 7'b0000001;//0
                4'b0001: out = 7'b1001111;//1
                4'b0010: out = 7'b0010010;//2
                4'b0011: out = 7'b0000110;//3
                4'b0100: out = 7'b1001100;//4
                4'b0101: out = 7'b0100100;//5
                4'b0110: out = 7'b0100000;//6
                4'b0111: out = 7'b0001111;//7
                4'b1000: out = 7'b0000000;//8
                4'b1001: out = 7'b0000100;//9
                4'b1010: out = 7'b0001000;//A
                4'b1011: out = 7'b1100000;//B
                4'b1100: out = 7'b0110001;//C
                4'b1101: out = 7'b1000010;//D
                4'b1110: out = 7'b0110000;//E
                4'b1111: out = 7'b0111000;//F
            endcase
        end
endmodule