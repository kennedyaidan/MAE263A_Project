function [t1,t2,t3,t4,t5,t6] = IK(T0e,c)

a2 = c(1);
d4 = c(2);
de = c(3);

T6e = [1 0 0 0;0 1 0 0;0 0 1 de;0 0 0 1];
T06 = T0e/T6e;
R = T06(1:3,1:3);
x = T06(1,4);
y = T06(2,4);
z = T06(3,4);

t1 = atan2(y,x);

c1 = cos(t1);
s3 = (x^2 + y^2 + z^2 - a2^2 - d4^2)/2/a2/d4;
c3 = -sqrt(1 - s3^2);

t3 = atan2(s3,c3);

f1 = (a2 + d4*s3)*c1;
f2 = d4*c1*c3;
h1 = d4*c3;
h2 = - d4*s3 - a2;

t2 = atan2(h1*x - f1*z,f2*z - h2*x);

R01 = [cos(t1) -sin(t1) 0;sin(t1) cos(t1) 0;0 0 1];
R12 = [cos(t2) -sin(t2) 0;0 0 1;-sin(t2) -cos(t2) 0];
R23 = [cos(t3) -sin(t3) 0;sin(t3) cos(t3) 0;0 0 1];
p = (R01*R12*R23)'*R;

t5 = atan2(sqrt(p(1,3)^2 + p(3,3)^2),-p(2,3));

s5 = sin(t5);

t4 = atan2(p(3,3)/s5,p(1,3)/s5);
t6 = atan2(-p(2,2)/s5,p(2,1)/s5);

end