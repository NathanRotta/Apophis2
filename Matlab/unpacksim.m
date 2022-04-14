
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
