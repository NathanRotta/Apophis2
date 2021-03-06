`timescale 1ns/1ps //timunit/timescal

module motor_driver_tb();

    parameter CLK_PERIOD = 10;  // 10 ns == 100 MHz

    reg clk;
    always #(CLK_PERIOD / 2) clk = ~clk;
	
	wire [2:0]pins;
	reg [50:0]ctime = 0;
	reg [0:19]speed;
	
	motor_driver md1(speed,ctime,pins);
	
	
	always @(posedge clk) ctime = ctime +1;
	
    initial begin
	clk = 0;
	speed = 20'hfffff;
#30000000
	speed = 20'h7ffff;
#30000000
	speed = 20'h00fff;
#30000000
	speed = 1+~speed;
#30000000
		
		
		$stop;
    end
endmodule
