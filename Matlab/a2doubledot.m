function [a2dd] = a2doubledot(a1,a2,a1d,xdd,a1dd,m2,l1,R2,I2)
%calculates the angle 2 double dot term givin the other variables
    s1 = sin(a1);
    s2 = sin(a2);
    c1 = cos(a1);
    c2 = cos(a2);
    sig2=a1d^2;
    sig3=a1dd;
    g=9.806;
    denom =-(I2+R2^2*m2*c2^2+R2^2*m2*s2^2);
    num = R2*m2*c2*xdd+R2*g*m2*s2+R2*l1*m2*c1*s2*sig2-R2*l1*m2*c2*s1*sig2+R2*l1*m2*c1*c2*sig3+R2*l1*m2*s1*s2*sig3;
    a2dd=num/denom;
end

