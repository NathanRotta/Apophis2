`timescale 1ns/1ps //timunit/timescal

module encoder4sig_tb();

    parameter CLK_PERIOD = 10;  // 10 ns == 100 MHz

    reg clk;
    always #(CLK_PERIOD / 2) clk = ~clk;
	
	reg PhaseA;
	reg PhaseB;
	wire [2:0]enc;
	assign enc = {1'h0,PhaseA,PhaseB};
	reg [50:0]ctime = 0;
	wire [31:0]angpos;
	wire [31:0]period;
	
	encoder4sig encoder1(enc,ctime,angpos,period);
	
	
	always @(posedge clk) ctime = ctime +1;
	
    initial begin
	$monitor("angular position = %d period = %d ",angpos,period );
	PhaseA = 0;
	PhaseB = 0;
	clk = 0;
      //Clockwise rotation  
#30	PhaseA = 1;
#30	PhaseB = 1;
#30	PhaseA = 0;
#30	PhaseB = 0;

#30 PhaseA = 1;
#30 PhaseB = 1;
#30	PhaseA = 0;
#30	PhaseB = 0;

#30 PhaseA = 1;
#30 PhaseB = 1;
#30	PhaseA = 0;
#30	PhaseB = 0;

#30 PhaseA = 1;
#30 PhaseB = 1;
#30	PhaseA = 0;
#30	PhaseB = 0;

#30 PhaseA = 1;
#30 PhaseB = 1;
#30	PhaseA = 0;
#30	PhaseB = 0;

#30 PhaseA = 1;
#30 PhaseB = 1;
#30	PhaseA = 0;
#30	PhaseB = 0;

#30 PhaseA = 1;
#30 PhaseB = 1;
#30	PhaseA = 0;
#30	PhaseB = 0;

#30 PhaseA = 1;
#30 PhaseB = 1;
#30	PhaseA = 0;
#30	PhaseB = 0;

#30 PhaseA = 1;
#30 PhaseB = 1;
#30	PhaseA = 0;
#30	PhaseB = 0;

#30 PhaseA = 1;
#30 PhaseB = 1;
#30	PhaseA = 0;
#30	PhaseB = 0;

#30 PhaseA = 1;
#30 PhaseB = 1;
#30	PhaseA = 0;
#30	PhaseB = 0;

#30 PhaseA = 1;
#30 PhaseB = 1;
#30	PhaseA = 0;
#30	PhaseB = 0;

#30 PhaseA = 1;
#30 PhaseB = 1;



//counter clockwise rotation
#30	PhaseB = 0;
#30	PhaseA = 0;
#30 PhaseB = 1;
#30 PhaseA = 1;

#30	PhaseB = 0;
#30	PhaseA = 0;
#30 PhaseB = 1;
#30 PhaseA = 1;

#30	PhaseB = 0;
#30	PhaseA = 0;
#30 PhaseB = 1;
#30 PhaseA = 1;

#30	PhaseB = 0;
#30	PhaseA = 0;
#30 PhaseB = 1;
#30 PhaseA = 1;

#30	PhaseB = 0;
#30	PhaseA = 0;
#30 PhaseB = 1;
#30 PhaseA = 1;

#30	PhaseB = 0;
#30	PhaseA = 0;
#30 PhaseB = 1;
#30 PhaseA = 1;

#30	PhaseB = 0;
#30	PhaseA = 0;
#30 PhaseB = 1;
#30 PhaseA = 1;

#30	PhaseB = 0;
#30	PhaseA = 0;
#30 PhaseB = 1;
#30 PhaseA = 1;

#30	PhaseB = 0;
#30	PhaseA = 0;
#30 PhaseB = 1;
#30 PhaseA = 1;

#30	PhaseB = 0;
#30	PhaseA = 0;
#30 PhaseB = 1;
#30 PhaseA = 1;

#30	PhaseB = 0;
#30	PhaseA = 0;
#30 PhaseB = 1;
#30 PhaseA = 1;

#30	PhaseB = 0;
#30	PhaseA = 0;
#30 PhaseB = 1;
#30 PhaseA = 1;

#30	PhaseB = 0;
#30	PhaseA = 0;
#30 PhaseB = 1;
#30 PhaseA = 1;

#30	PhaseB = 0;
#30	PhaseA = 0;
#30 PhaseB = 1;
#30 PhaseA = 1;


		
		
		$stop;
    end
endmodule
