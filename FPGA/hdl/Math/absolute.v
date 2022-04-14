//module to take the absolute value
module absolute#(parameter LEN=32) (input signed [LEN-1:0]signednum,output [0:(LEN-1)]abs);
          assign abs = (signednum<0)? (~signednum+1) : signednum;
endmodule
