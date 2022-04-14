
`define D2IN(x) x*8+7
`define VARLEN  32
`define START 16'hF0F0  //the start bytes
//this module sends the measurement data over uart
module send_packet (//measurements
input [0:`VARLEN-1]ctime,
input [0:`VARLEN-1]x_pos,
input [0:`VARLEN-1]x_vel,
input [0:`VARLEN-1]x_int,
input [0:`VARLEN-1]theta1_pos,
input [0:`VARLEN-1]theta1_vel,
input [0:`VARLEN-1]theta1_int,
input [0:`VARLEN-1]theta2_pos,
input [0:`VARLEN-1]theta2_vel,
input [0:`VARLEN-1]theta2_int,
input sendpack,//when new packet is available turn on then off
input clk,
output tx,
output isbusy
);
	reg [0:`VARLEN-1]packet_num=0;
	
	parameter TOTAL_LENGTH = `VARLEN*11+16;
	wire [0:TOTAL_LENGTH-1]str = 
	{
	packet_num,
	ctime,
	x_pos,
	x_vel,
	x_int,
	theta1_pos,
	theta1_vel,
	theta1_int,
	theta2_pos,
	theta2_vel,
	theta2_int,
	`START
	};
	always @(posedge sendpack) begin
		packet_num=packet_num+1;
	end
	
	print_str str_writer(clk , str , sendpack, tx,isbusy);
	defparam str_writer.STR_LEN = TOTAL_LENGTH/8;
	
	
	
	/*
	reg has_converted; //convertion has finished
	wire busy;//is the binary to ascii converter busy
	wire valid;//is the binary to ascii converter finished
	reg start_conv;
	reg [0:1]count=0;
	wire slowclk=count[0]==0;
	reg  [0:15]packet_num;
	initial packet_num=0;
	
	//all the numbers that we are going to send
	wire [0:47]d0;
	wire [0:`D2IN(DIGITIME)]d1;
	wire [0:`D2IN(DIGIX)]d2;
	wire [0:`D2IN(DIGI_VEL)]d3;
	wire [0:`D2IN(DIGIINT)]d4;
	wire [0:`D2IN(DIGI_POS)]d5;
	wire [0:`D2IN(DIGI_VEL)]d6;
	wire [0:`D2IN(DIGIINT)]d7;
	wire [0:`D2IN(DIGI_POS)]d8;
	wire [0:`D2IN(DIGI_VEL)]d9;
	wire [0:`D2IN(DIGIINT)]d10;
	
	bin2ascii_seq #(16,5)       asd0(packet_num,start_conv,slowclk,d0, , );//logic to convert binary to ascii
	bin2ascii_seq #(BINTIME,DIGITIME) asd1(ctime,start_conv,slowclk,d1,valid,busy);
	bin2ascii_seq #(POSX,DIGIX) asd2(x_pos,start_conv,slowclk,d2, , );
	bin2ascii_seq #(VEL_BIN,DIGI_VEL) asd3(x_vel,start_conv,slowclk,d3, , );
	bin2ascii_seq #(BININT,DIGIINT) asd4(x_int,start_conv,slowclk,d4, , );
	bin2ascii_seq #(POS_BIN,DIGI_POS) asd5(theta1_pos,start_conv,slowclk,d5, , );
	bin2ascii_seq #(VEL_BIN,DIGI_VEL) asd6(theta1_vel,start_conv,slowclk,d6, , );
	bin2ascii_seq #(BININT,DIGIINT) asd7(theta1_int,start_conv,slowclk,d7, , );
	bin2ascii_seq #(POS_BIN,DIGI_POS) asd8(theta2_pos,start_conv,slowclk,d8, , );
	bin2ascii_seq #(VEL_BIN,DIGI_VEL) asd9(theta2_vel,start_conv,slowclk,d9, , );
	bin2ascii_seq #(BININT,DIGIINT) asd10(theta2_int,start_conv,slowclk,d10, , );
	
	
	parameter P_LEN = (5+DIGITIME+DIGIX+DIGI_VEL+DIGIINT+DIGI_POS+DIGI_VEL+DIGIINT+DIGI_POS+DIGI_VEL+DIGIINT+11+11); //packet length in bytes
	
	wire [0:P_LEN*8-1]datastring = {d0,8'h2C,
												 d1,8'h2C,
												 d2,8'h2C,
												 d3,8'h2C,
												 d4,8'h2C,
												 d5,8'h2C,
												 d6,8'h2C,
												 d7,8'h2C,
												 d8,8'h2C,
												 d9,8'h2C,
												 d10,8'h0A};//concatinate all the data together seperated by commas and ending with newline
	wire istrans;//is it currently transmitting?
	print_str pr0(clk,datastring,do_transmit,tx,istrans);//this module sends the data
	defparam pr0.STR_LEN=P_LEN;
	reg has_started_transmition;//has transmition started
	wire do_transmit=(~has_started_transmition) && has_converted;
	always @(posedge clk) begin
		count<=count+1;///count for my slowclock
		if(sendpack) begin
			isbusy <= 1;
			start_conv<=1;
			has_converted<=0;
			has_started_transmition<=0;
		end else if(busy) begin
			start_conv<=0;
			if(istrans) has_started_transmition<=1;
			if(valid && has_converted==0) has_converted <= 1;	
			else if(has_converted && istrans==0 && has_started_transmition) begin
				has_converted<=0;
				isbusy<=0;
				packet_num<=packet_num+1;
			end
		end
	end
	

	function [0:7]trunc_32_8(input [31:0]num);
		trunc_32_8 = num[7:0];
	endfunction
	*/
endmodule 




/*
module bin2ascii
#(parameter DIGITS=10,
 parameter BITS=32) ( input signed [0:(BITS-1)]bin,
output reg [0:(DIGITS*8+7)]bcd);
	reg [0:BITS]divisor = 10;
	integer i;
	wire [0:(BITS-1)] absbin;
	always @* begin
		if(bin<0) begin
			bcd[(DIGITS*8):(DIGITS*8+7)]="-";//if negative put sign in front
		end
		else bcd[(DIGITS*8):(DIGITS*8+7)]=" ";//if positive put space in front
		for(i=0;i<DIGITS;i=i+1) begin
			bcd=bcd+(((absbin/divisor)%10)<<(i*8));
			divisor = divisor*10;
		end
	end
	
	
endmodule */


