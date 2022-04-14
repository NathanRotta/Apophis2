module bin2ascii_tb();

    parameter CLK_PERIOD = 10;  // 10 ns == 100 MHz

    reg clk;
	reg signed [0:31]binary;
	wire [0:87]ascii;
	wire valid;
	reg start;
	wire busy;
	bin2ascii_seq b2a(binary,start,clk,ascii,valid,busy);

    always #(CLK_PERIOD / 2) clk = ~clk;
    initial begin
        $monitor("\t%d:bin = %d and ascii = %d valid = %d busy = %d reduced= %d digit=%d",
            $time, binary,ascii,valid,busy,b2a.reduced,b2a.digit);
    end

    initial begin
        clk = 1;
		start = 1;
		binary = 0;
#20		start = 0;
#400	binary  = 8;
		start=1;
#20		start=0;
#400	binary  = 10;
		start=1;
#20		start=0;
#400	binary  = 32'd2567469876;
		start=1;
#20		start=0;
#400	binary  = 1+~binary;
		start=1;
#20		start=0;
#400
		
		
		$stop;
    end
endmodule
