

// uses only rising edge of b to determine position and velocity
module encoder(pins,count,pos,per);
   input [50:0]count;
	input [2:0]pins;
	output reg [0:31]pos;
	output [0:31]per;
	initial pos <= 0;
	reg [50:0]prev;
	reg [50:0]cur;
	initial prev<=0;
	initial cur<=0;
	assign per=cur-prev;
	
	always @(posedge pins[1]) begin
	   prev<=cur;
		cur<=count;
		if(pins[0]) pos <=pos-1;
		else pos<=pos+1;
	end
	
endmodule


// uses the rising and falling edges of all 4 to determin position and velocity of encoder
module encoder4sig(pins,count,pos,per);
   input [50:0]count;//the current time
	input [2:0]pins;//rotery encoder inputs. 0 is phase A. 1 is phase B. 2 is phase z
	output [0:31]pos;
	output [0:31]per;
	reg dir = 0;//zero if clockwise and 1 if counterclockwise
	parameter MAX_PERIOD = 20000000;//minimum allowable speed
	
	// variebles to hold the position changes from each edge trigger
    reg signed [0:31]pos1;
	initial pos1 = 0;
	reg signed [0:31]pos2=0;
	initial pos2 = 0;
	reg signed [0:31]pos3;
	initial pos3 = 0;
	reg signed [0:31]pos4;
	initial pos4 = 0;
	
	// variebles to hold the time stamp for each edge trigger
	reg [50:0]tAR;//time A rising
	reg [50:0]tAF;//time A falling
	reg [50:0]tBR;//time B rising
	reg [50:0]tBF;//time B falling
	
	/*
	// error correction registers for missied values
	reg [23:0]misAclock;//if missing an A pulse while spinning clockwise
	reg [23:0]misAcounter;
	reg [23:0]misBclock;
	reg [23:0]misBcounter;
	did not work
	*/
	/*
	reg zflag1;
	reg zflag2;
	wire zflag;
	initial zflag1 = 0;
	initial zflag2 = 0;
	assign zflag = zflag1 || zflag2;
	reg signed [31:0]zvalue1;
	initial zvalue1=0;
	reg signed [31:0]zvalue2;
	initial zvalue2 = 0;
	wire [31:0]zvalue;
	assign zvalue = (zflag1) ? zvalue1 : zvalue2; 
	
	reg signed [31:0]error1;
	reg signed [31:0]error2;
	output reg signed [31:0]error;
	always @(error1,error2)
	begin
	error = (tAR>tAF) ? error1 : error2;
	end
	*/
	always @(posedge pins[1]) begin
		if(pins[0]) pos1 <=pos1-1;//clockwise
		else
			begin
				pos1<=pos1+1;//counterclockwise
				// if(tAF<tBR && tBR<tBF) misAcounter<=misAcounter+4;
			end
		tBR <= count;
	end
	always @(negedge pins[1]) begin
		if(pins[0]) pos2 <=pos2+1;
		else
		begin
			pos2<=pos2-1;
			// if(tAF<tBF && tBF<tBR) misAclock<=misAclock-4;
		end
		tBF <= count;
	end
	always @(posedge pins[0]) begin
		tAR <= count;
		
		if(pins[1]) pos3 <=pos3+1;
		else
		begin
			pos3<=pos3-1;
			// if(tBF<tAR && tAR<tAF) misBclock<=misBclock-4;
		end
		if(~pins[2])//test if passes z pin and saves z value if the first time but adjust error if not
		begin
		/*
			if(zflag) error1 <= zvalue-(pos+1);
			else
			begin
			zflag1 <= 1;
			zvalue1<= pos+1;
			end
			*/
		end
	end
	always @(negedge pins[0]) begin
		if(pins[1]) begin
			pos4 <=pos4-1;
			dir <=0;
			end
		else
		begin
			dir <=1;
			pos4<=pos4+1;
			
			// if(tBF<tAF && tAF<tAR) misBcounter<=misBcounter-4;
			/*
		if(~pins[2])//test if passes z pin and saves z value if the first time but adjust error if not
			begin
				if(zflag) error2 <= zvalue-(pos-1);
				else
				begin
				zflag2 <= 1;
				zvalue2<= pos-1;
				end
				
			end
			*/
		end
		tAF <= count;
	end

	// assign error = misAcounter+misBcounter+misBclock+misAclock;
	
	assign pos = pos1+pos2+pos3+pos4;
	
	reg signed [0:31]pos_prev=0;
	wire has_moved = (pos1==pos_prev);
	reg [50:0]tAR_prev;
	
	wire isovertime = (count-tAF>MAX_PERIOD);
	reg signed [31:0]speed;
	assign per = (isovertime) ? (32'h7fffffff) : speed; 
	
	always @(negedge has_moved) begin
			tAR_prev <= tAR;
			pos_prev <= pos1;
			speed <= (dir) ? (tAR_prev-tAR):(tAR-tAR_prev);
	end
	endmodule
	
	
	
	
	
	
	
	
	/*always @*
	begin
	// judge if register tAR, tAF, tBR, tBF is highest
	// subtract the highest 2
	if(tAR>tAF && tAR>tBR && tAR<tBF)//is rising edge of phase A the highest
		begin
		if(tAF>tBR && tAF>tBF)
			speed<=tAR-tAF;
		else if(tBR>tAF && tBR>tBF)
			speed<=tAR-tBR;
		else
			speed<=tAR-tBF;
		end
	else if(tAF>tAR && tAF>tBR && tAF<tBF)//is Falling edge of phase A the highest
		begin
		if(tAR>tBR && tAR>tBF)
			speed<=tAF-tAR;
		else if(tBR>tAR && tBR>tBF)
			speed<=tAF-tBR;
		else
			speed<=tAF-tBF;
		end
	else if(tBR>tAR && tBR>tAF && tBR<tBF)//is rising edge of phase B the highest
		begin
		if(tAR>tAF && tAR>tBF)
			speed<=tBR-tAR;
		else if(tAF>tAR && tAF>tBF)
			speed<=tBR-tAF;
		else
			speed<=tBR-tBF;
		end
	else //then falling edge of B is the highest
		begin
		if(tAR>tAF && tAR>tBR)
			speed<=tBF-tAR;
		else if(tAF>tAR && tAF>tBR)
			speed<=tBF-tAF;
		else
			speed<=tBF-tBR;
		end
	end*/
	
