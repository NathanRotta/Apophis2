`include "../Math/macros.vh"

module bin2ascii_seq #(parameter BITS=32, parameter DIGITS=10)(
	input signed [0:BITS-1]binaryin, //binary bits that need to be turned into ascii
	input start, //indicate when to start go set high then reset to low to start
	input clk, //clock for asynchronus logic
	output reg [0:DIGITS*8+7]ascii, //one more digit for the sign
	output reg valid,  //is result valid
	output reg busy
	);
	reg [0:BITS-1]divisor;
	reg [0:$clog2(DIGITS*8)] shift;
	wire [0:BITS-1]pbin;//absolute value of bin
	reg signed [0:BITS-1]bin;//saved binary value
	absolute #(BITS) ab0(bin,pbin);
	wire [0:BITS-1]reduced =pbin/divisor;//number rudeced so that the next digit is in the ones place
	wire [0:7]digit; //the current digit
	assign digit=trunc((reduced%10)+48);//converts the 
	reg nonzero;//turns to one when when repeated division reaches the first nonzero value
	always @(posedge clk) begin
        if (start) begin
            valid <= 0;
            shift <= 8;
			busy<=1;
			divisor <= `POW10(DIGITS-1);
			bin <=binaryin;
			ascii <= (binaryin<0)? (45):(32);
			nonzero<=0;
        end else if (busy) begin
			if(reduced!=0 ||nonzero || divisor==1) begin//don't write a bunch of needless zeros
				ascii <= {ascii,digit};
				nonzero=1;
			end
			divisor <=divisor/10;
			shift <= shift+8;
			if(divisor<=1) begin
				busy<=0;
				valid <= 1;
				
			end
        end
    end
	
	function [0:8]trunc(input [BITS-1:0]num);
		trunc = num[7:0];
	endfunction
	
	
endmodule