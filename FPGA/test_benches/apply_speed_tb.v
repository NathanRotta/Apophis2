`timescale 1ns/1ns //timunit/timescal

module apply_speed_tb();

    parameter CLK_PERIOD = 10;  // 10 ns == 100 MHz
	parameter MAX_PERIOD = 32'h7fffffff;
	parameter PERIOD_2MPH = 20'h01496;//(0.89408m/s)/(2*pi*0.006) = 23.716   50MHz/(400*23.716)=5270
	parameter PERIOD_10MPH = 20'h0041E;
    reg clk;
    always #(CLK_PERIOD / 2) clk = ~clk;
	
	wire [2:0]motor;
	reg [50:0]ctime = 0;
	reg [31:0]period;
	reg [31:0]speed;
	
	apply_speed af(speed,ctime,motor,period);
	
	
	always @(posedge clk) ctime = ctime +1;
	
    initial begin
	clk = 0;
	period = MAX_PERIOD;
	speed = 0;
#100000000	
	speed = 400;
#100000000
	speed = 800;
#100000000
	speed = 900;
	period = PERIOD_2MPH;
#100000000
/*
	force_n = 10;
#100000000
	force_n = 25;
#100000000
	force_n = 1;
	period = PERIOD_10MPH;
#100000000
	force_n = 10;
#100000000
	force_n = 25;

	*/	
		
		$stop;
    end
endmodule
