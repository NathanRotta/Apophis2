
%% set constants
%aluminum mount
mam = 0.009;
outer_d = 0.025;
inner_d = 0.011465;
innermost_d= 0.00523;
outer_h=0.00419;
inner_h=0.00936;
mid_v =cyl_vol(inner_d,inner_h)-cyl_vol(innermost_d,inner_h);
outer_v = cyl_vol(outer_d,outer_h)-cyl_vol(inner_d,outer_h);
minner = mam*mid_v/(mid_v+outer_v);
mouter = mam*outer_v/(mid_v+outer_v);

m1=0.3;
m2=0.1;
mc=0.3;
l1=0.459;
R1=(0.1*l1/2+l1*0.2)/0.3;
R2=0.459/2;
I1=0.1*(0.1^2+0.0254^2)/12+0.2*l1^2/2+0.2*R1^2;
I2=0.1*(0.1^2+0.0254^2)/12;

stoptime = 10;
totaldata = [];
totaltime = [];
startth1=pi-1;
endth1=pi+1;
startth2=pi-1;
endth2=pi+1;
step = 0.1;
%% run simulation
for idx = startth1:step:endth1
    for jdx = startth2:step:endth2
        frequency = 2;
        samplerate=frequency/2;
        theta1_0 =idx;
        theta2_0=jdx;
        Data = sim('double_pend_simulation.slx');

         t = Data.simout.Time;
        % theta2dd = Data.simout.Data(:,1);
        % theta2d = Data.simout.Data(:,2);
        % theta2 = Data.simout.Data(:,3);
        % theta1 = Data.simout.Data(:,4);
        % theta1d = Data.simout.Data(:,5);
        % theta1dd = Data.simout.Data(:,6);
        % xdd = Data.simout.Data(:,7);
        % xd = Data.simout.Data(:,8);
        % x = Data.simout.Data(:,9);
        % 
         [sData,st] = sampledata(samplerate,Data.simout.Data,t,stoptime);

        %%
        % samplerate=4;
        % [v, idxfirst]=min(abs(t-samplerate));
        % 
        % lengthsampling = floor(length(t)/idxfirst);
        % samplet = zeros(1,lengthsampling);
        % samplethet1 = zeros(1,lengthsampling);
        % samplethet2 = zeros(1,lengthsampling);
        % for idx = 1:lengthsampling
        %     [val,index] = min(abs(t-samplerate*idx));
        %     samplet(idx) = t(index);
        %     samplethet1(idx)=theta1(index);
        %     samplethet2(idx) = theta2(index);
        %     
        % end
%         stheta2dd = sData(:,1);
%         stheta2d =sData(:,2);
%         stheta2 = mod(sData(:,3),2*pi);
%         stheta1 = mod(sData(:,4),2*pi);
%         stheta1d = sData(:,5);
%         stheta1dd = sData(:,6);
%         sxdd = sData(:,7);
%         sxd = Data.simout.Data(:,8);
%         sx = Data.simout.Data(:,9);
% 
%         figtitle = sprintf('theta1_0 %f theta2_0 %f frequency %f',theta1_0,theta2_0,frequency);
%         fig1=plot(stheta1,stheta2,'.');
%         name=sprintf('simdatatheta1_vs_theta2_%f.fig',frequency);
%         ylabel('theta2')
%         xlabel('theta 1')
%         title(figtitle)
%         saveas(fig1,name)
%         fig2=plot(stheta1,stheta1d,'.');
%         name = sprintf('simdatatheta1_vs_theta1d_%f.fig',frequency);
%         ylabel('theta 1')
%         title(figtitle)
%         xlabel('theta 1d')
%         saveas(fig2,name)
%         fig3=plot(stheta2,stheta2d,'.');
%         name = sprintf('simdata_theta2_vs_theta2d_%f.fig',frequency);
%         ylabel('theta 2')
%         title(figtitle)
%         xlabel('theta 2d')
%         saveas(fig3,name)
        totaldata = [totaldata;sData];
        totaltime = [totaltime;st];
    end
    message =  sprintf("simulations are %f percent complete",100*(idx-startth1)/(endth1-startth1));
    disp(message)

end


theta2dd = totaldata(:,1);
theta2d = totaldata(:,2);
theta2 = mod(totaldata(:,3),2*pi);
theta1 = mod(totaldata(:,4),2*pi);
theta1d = totaldata(:,5);
theta1dd = totaldata(:,6);
xdd = totaldata(:,7);
xd = totaldata(:,8);
x = totaldata(:,9);

indexer = 1:(samplerate*stoptime);


%alert that simulation is finished
disp("finished")
finishedwave = [sin(1:.6:400), sin(1:.7:400), sin(1:.4:400)];
Audio = audioplayer(finishedwave, 22050);
play(Audio);





%% helper functions


function [v]= cyl_vol(d,h)
    r=d/2;
    v=h*pi*r^2;
end
function [I] = rod_I(h,w,m)
    I = m*(h^2+w^2)/12;
end
function [I] = ring_I(ri,ro,m)
    I=m*(ri^2+ro^2)/2;
end
function [I] = cyl_I(r,m)
    I = m*r^2/2;
end
























