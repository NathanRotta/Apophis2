
module motor_driver(speed,clock,pins);
	input signed [19:0]speed; //number from
	input [18:0]clock;
	output [2:0]pins;//

	wire [19:0]absspeed;
	assign absspeed = (speed>0) ? speed : (~speed)+1;
	
	assign pins[2] = (absspeed>=clock);
	assign pins[0] = !speed[19] && (speed!=0);
	assign pins[1] = speed[19] && (speed!=0);

endmodule


