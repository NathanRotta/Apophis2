

/*
This module takes a string of characters and prints them onto the uart terminal with the uart module
*/
/*
module print_str #(
parameter STR_LEN = 13,//Maximum length of the string
parameter BEGIN = 0)
	(input clk, // The master clock for this module
	input [0:(STR_LEN*8-1)]string,//string to transmit. null terminated
	input dotransmit,//move from low to high in order to transmit. does nothing if already transmitting
   output tx, // Outgoing serial line
	output status//indicates weather or not the module is currently transmitting
	
);

//parameter LINE_ENDING = "\n";//send at the end of each string decided to add this on when creating the string
reg [0:7]index=STR_LEN-1;//keep track of current charecter that is being transmitted
wire transmit;//signal to the uart to transmit
assign transmit=status;
reg [0:(STR_LEN*8-1)]transtr;//register that holds the data to transmit
wire [0:7]tx_byte;//byte to transmit
//wire rx,received;
//wire [0:7]rx_byte;
wire is_transmitting;
uart uart0(clk, , , tx, transmit, tx_byte, , , , is_transmitting, );//put the char on uart
assign tx_byte=transtr>>(8*index);
//assign tx_byte=index+48; //test run to see what the index is
reg status0=0;
reg status1=0;


assign status=status0^status1;
always @(posedge dotransmit) begin
	if(~status) status0<=~status0;
	transtr<=string;
end


always @(negedge is_transmitting) begin
	if(status) begin
		if((index==0 || index>STR_LEN)) begin
			index<=STR_LEN-1;
			status1<=~status1;
		end
		else begin
			index<=index-1;
		end
	end
end
endmodule
*/
/*
assign transmit=status&&(index!=cntindex);
reg [0:7]cntindex=STR_LEN+1;
reg [0:7]cnt=0;
always @(posedge clk) begin if(status==1) begin
	if(cntindex>index) begin
		cnt<=cnt+1;
		if(cnt==255) cntindex<=cntindex-1;
	end
	if(cntindex<index) cntindex<=STR_LEN+1;
end end
*/ 






/*
This module takes a message of characters and prints them onto the uart terminal with the uart module
*/

//most significant byte last version
module print_str #(
parameter STR_LEN = 13,//Maximum length of the message
parameter BEGIN = 0)
	(input clk, // The master clock for this module
	input [0:(STR_LEN*8-1)]message,//message to transmit. null terminated
	input dotransmit,//move from low to high in order to transmit. does nothing if already transmitting
   output tx, // Outgoing serial line
	output status//indicates weather or not the module is currently transmitting
	
);

//parameter LINE_ENDING = "\n";//send at the end of each message decided to add this on when creating the message
reg [0:7]index=0;//keep track of current charecter that is being transmitted
wire transmit;//signal to the uart to transmit
assign transmit=status;
reg [0:(STR_LEN*8-1)]transtr;//register that holds the data to transmit
wire [0:7]tx_byte;//byte to transmit
//wire rx,received;
//wire [0:7]rx_byte;
wire is_transmitting;
uart uart0(clk, , , tx, transmit, tx_byte, , , , is_transmitting, );//put the char on uart
defparam uart0.CLOCK_DIVIDE =  108;//115200 baud rate
assign tx_byte=transtr>>(8*index);
//assign tx_byte=index+48; //test run to see what the index is
reg status0=0;
reg status1=0;


assign status=status0^status1;
always @(posedge dotransmit) begin
	if(~status) status0<=~status0;
	transtr<=message;
end


always @(negedge is_transmitting) begin
	if(status) begin
		if((index>=STR_LEN)) begin
			index<=0;
			status1<=~status1;
		end
		else begin
			index<=index+1;
		end
	end
end
endmodule

/*
assign transmit=status&&(index!=cntindex);
reg [0:7]cntindex=STR_LEN+1;
reg [0:7]cnt=0;
always @(posedge clk) begin if(status==1) begin
	if(cntindex>index) begin
		cnt<=cnt+1;
		if(cnt==255) cntindex<=cntindex-1;
	end
	if(cntindex<index) cntindex<=STR_LEN+1;
end end
*/ 

