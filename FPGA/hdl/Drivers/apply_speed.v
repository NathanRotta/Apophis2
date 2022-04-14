//
module apply_speed(
input signed [0:31] speed_400rpm,
input [0:19] ctime,
output [0:2] m_pins,
input signed [0:31]period,
output signed [0:31]duty_cycle
);


parameter SLOPE = 108;
parameter INTERCEPT = 84628;
parameter D_MAX = 300000;
parameter PERIOD_MAX= 32'h7fffffff;
wire signed [0:31]d_duty_cycle = (speed_400rpm>0) ? speed_400rpm*SLOPE+INTERCEPT : (speed_400rpm==0) ? 0 : speed_400rpm*SLOPE-INTERCEPT;

//check for overload
assign duty_cycle = ((period == PERIOD_MAX) && (d_duty_cycle>D_MAX)) ? D_MAX: ((period == PERIOD_MAX) && (d_duty_cycle<-D_MAX)) ? -D_MAX : d_duty_cycle;

//duty cycle
motor_driver md0(duty_cycle,ctime,m_pins);


endmodule