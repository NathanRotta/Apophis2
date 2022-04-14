
// create module
module apophis(clk,enc1,enc2,rxd, LED, DIS,motor,tx,encx,SW);
input [0:9]SW;
input rxd; //rx pin for uart
input clk;     // input clock 50MHz
input [2:0]enc1;  //rotery encoder inputs. 0 is phase A. 1 is phase B. 2 is phase z
input [2:0]enc2;
input [1:0]encx;
output [2:0]motor; //output to drive the three motor pins ena, in2 in1 and
output LED;
output tx;//output for uart
output signed [41:0] DIS;//output to the digital display


// create a binary counter
reg [50:0] ctime; //51 bit counter
initial ctime <= 0; // start count at zero 
always @(posedge clk) ctime <= ctime+1; // count up
//assign LED to nth bit of the counter
//assign LED; = ctime[28]; // Use the 25th bit of the counter to blink the LED at a few Hz

wire [31:0]angpos1;
wire [31:0]period1;
encoder4sig encoder1(enc1,ctime,angpos1,period1);

wire [31:0]angpos2;
wire [31:0]period2;
encoder4sig encoder2(enc2,ctime,angpos2,period2);

wire [31:0]angposx;
wire [31:0]periodx;
encoder4sig encoderx({1'B0,encx},ctime,angposx,periodx);
//defparam encoderx.MAX_PERIOD=5000000;

 //motor test stuff

wire signed [19:0]mspeed;
wire [19:0]abs_speed = 209715;
assign mspeed =(SW[0]) ? abs_speed :0;
//motor_driver md(abs_speed,ctime,motor);
wire [0:31]duty_cycle;
apply_speed af(1000,ctime,motor,periodx,duty_cycle);
//apply_force af(3,ctime,motor,periodx,duty_cycle);
//assign motor =  {1'b1,1'b0,1'b1}; //spin motor full speed forward

//Uart
reg transmit=0;
always @(posedge clk) begin
	if(LED==0)
		transmit <= 1;
		else
		transmit<=0;
end
reg [7:0] tx_byte;
wire [7:0] rx_byte;
wire recv_error;

//wire [0:31]message = 5262;
//print_str printfun(clk,5262,transmit,tx,LED);
send_packet pack(
		ctime[31:0],   //send current time
		angposx,   //send x position
		periodx,    //send x velocity
		duty_cycle,    //send intigral of x
		angpos1,    //send theta position
		period1,    //send theta velocity
		32'h00000000,     //send intigral of theta
		angpos2,      //send theta 2 position
		period2,     //send theta 2 velocity
		32'h00000000,     //send intigral of theta 2
		transmit,  //tell it to transmit
		clk,
		tx,        //transmit line
		LED);      //identifier to tell it to transmit
//wire reset = 0;




	bin2dis b2d(duty_cycle,DIS);
	
	//IO test
	//bin2dis b2d(enc1,DIS);
	


endmodule 