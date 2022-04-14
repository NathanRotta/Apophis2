
//converts a binary value to all the digits of the display
module bin2dis(bin,dis);
input [23:0]bin;
output [41:0]dis;
dis_char ch1(bin[3:0],dis[6:0]);
dis_char ch2(bin[7:4],dis[13:7]);
dis_char ch3(bin[11:8],dis[20:14]);
dis_char ch4(bin[15:12],dis[27:21]);
dis_char ch5(bin[19:16],dis[34:28]);
dis_char ch6(bin[23:20],dis[41:35]);

endmodule



//converts a hex value to a value for the seven segment display
module dis_char(Hex, Display);
input [3:0]Hex;
output reg [6:0]Display;
//case statement for each possible binary value
always @(*)
begin
	case(Hex)
		0 : Display = 7'b1000000;
		1 : Display = 7'b1111001;
		2 : Display = 7'b0100100;
		3 : Display = 7'b0110000;
		4 : Display = 7'b0011001;
		5 : Display = 7'b0010010;
		6 : Display = 7'b0000010;
		7 : Display = 7'b1111000;
		8 : Display = 7'b0000000;
		9 : Display = 7'b0011000;
		10: Display = 7'b0001000;
		11: Display = 7'b0000011;
		12: Display = 7'b1000110;
		13: Display = 7'b0100001;
		14: Display = 7'b0000110;
		15: Display = 7'b0001110;	
	endcase
end


endmodule 