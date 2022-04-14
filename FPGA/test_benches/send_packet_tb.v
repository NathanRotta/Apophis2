`timescale 1ns / 1ps
module send_packet_tb();

    parameter CLK_PERIOD = 20;  // 10 ns == 100 MHz
    reg clk;
    always #(CLK_PERIOD / 2) clk = ~clk;
	
	reg send;
	wire tx;
	wire isbusy;
	
	send_packet sp(
		$time,
		32'h00024543, 
		32'h00001254, 
		32'h00007689, 
		32'h00004245,
		32'h00007764,
		32'h00002413,
		32'h78766536,
		32'h00008038,
		32'h00005632,
		send,
		clk,
		tx,
		isbusy);
	
    initial begin
        $monitor("\t%d: data = %d , isbusy=%d",
            $time,sp.str,isbusy);
    end
	
    initial begin
		clk<=1;
		send=0;
#30		send=1;
#30     send=0;
#300000000
#30		send=1;
#30         send=0;
#300000000
		$stop;
    end
endmodule
