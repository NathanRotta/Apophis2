function [a1dd] = a1doubledot(a1,a2,a2d,xdd,a2dd,m1,m2,l1,R1,R2,I1)
%calculates the angle 1 double dot term givin the other variables
    s1 = sin(a1);
    s2 = sin(a2);
    c1 = cos(a1);
    c2 = cos(a2);
    sig2=a2d^2;
    sig3=s1^2;
    sig4=c1^2;
    sig5 = xdd;
    sig6 = a2dd;
    g=9.806;
    denom = -(I1+R1^2*m1*sig4+R1^2*m1*sig3+l1^2*m2*sig4+l1^2*m2*sig3);
    num = R1*m1*c1*sig5+ l1*m2*c1*sig5 + R1*g*m1*s1 + g*l1*m2*s1 - R2*l1*m2*c1*s2*sig2 + R2*l1*m2*c2*s1*sig2 + R2*l1*m2*c1*c2*sig6 + R2*l1*m2*s1*s2*sig6;
    a1dd=num/denom;
end