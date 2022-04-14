module apply_force(
input signed [0:31] f_newtons,
input [0:19] ctime,
output [0:2] m_pins,
input signed [0:31]period,
output signed [0:31]duty_cycle
);

//
parameter FORCE_LIMIT = 27;
parameter FRICTION_SLOPE = 362361;//negative inverse of friction slope
parameter FRICTION_INTERCEPT = 8;
parameter STATIC_FRICTION = 4;
parameter PERIOD_MAX = 32'h7fffffff;
wire signed [0:1]cdir = (period==PERIOD_MAX) ? 0: (period<0) ? -1 : 1;//determine the current direction
//wire signed [0:1]fdir = (f_newtons==0) ? 0: (f_newtons<0) ? -1 : 1;//determine the direction of the desired force


wire signed [0:31]static_friction = ( f_newtons==0) ? 0 : (f_newtons<0) ? 4 : -4;
wire signed [0:31]friction = (cdir==0) ? static_friction : (cdir < 0) ? (FRICTION_INTERCEPT-FRICTION_SLOPE/period): (-FRICTION_INTERCEPT+FRICTION_SLOPE/period);


parameter PPR = 400;
parameter MAX_DUTY= 64'h000000000007ffff;

wire signed [0:31]f_required = (f_newtons==0) ? ( 0 ) : (f_newtons-friction);
//if the pendulum is moving in the same direction as F add friction to f_required if oposit subtract
//assign f_required = ((period<0)==(f_newtons<0)) ? (f_newtons+FRICTION) :(f_newtons-FRICTION);

//if force greater than the max, set to max
wire [0:63]f_using;
assign f_using = (f_required>FORCE_LIMIT) ? (FORCE_LIMIT): (f_required<-FORCE_LIMIT) ? (-FORCE_LIMIT):(f_required);

//absolute value of the period
//wire abs_period = (period>0)? period : (1+~period);

//force if full duty cycle was used 15000/51-((50MHz)/(period*(PPR)))/51
wire signed [0:31]fullf = 29-(50000000*60)/(period*PPR*51);

//duty cycle nescisary
assign duty_cycle = (60*(f_using*MAX_DUTY))/(98*fullf);

//duty cycle
motor_driver md0(duty_cycle,ctime,m_pins);






endmodule