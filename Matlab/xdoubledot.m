function [xdd] = xdoubledot(F,a1,a2,a1d,a2d,a1dd,a2dd,m1,m2,mc,l1,R1,R2)
%calculates the x double dot term givin the other variables
m=m1+m2+mc;
sig2 = a1d^2;
s1 = sin(a1);
s2 = sin(a2);
c1 = cos(a1);
c2 = cos(a2);

num=(-F)-R1*m1*s1*sig2-R2*m2*s2*a2d^2+R1*m1*c1*a1dd+R2*m2*c2*a2dd-l1*m2*s1*sig2+l1*m2*c1*a1dd;
xdd=-num/m;

end

