%Specific to the robot arm
function [t1,t2,t3,t4] = IK(T04,c)


a2 = c(8);
a3 = c(11);
d3 = c(9);
d4 = c(12);

%T4e = [1 0 0 ae;0 1 0 0;0 0 1 0;0 0 0 1];
%T04 = T0e/T4e;
R = T04(1:3,1:3);
r12 = R(1,2);
r32 = R(3,2);
r22 = R(2,2);
x = T04(1,4);
y = T04(2,4);
z = T04(3,4);


%Theta 1
rho = sqrt(x^2+y^2);
t1 = atan2(y,x) - atan2((d3+d4)/rho, sqrt(1-((d3+d4)/rho)^2));

%Theta 3
H = ((x*cos(t1) + y*sin(t1))^2 + z^2 -a2^2 -a3^2)/(2*a2*a3);
t3 = atan2(sqrt(1-H^2),H);

%Theta 2
F = -a2*z*cos(t3) - a3*z + a2*x*cos(t1)*sin(t3) + a2*y*sin(t1)*sin(t3);
G = a3*x*cos(t1) + a3*y*sin(t1) + a2*z*sin(t3) + a2*x*cos(t1)*cos(t3) + a2*y*cos(t3)*sin(t1);
t2 = atan2(F,G) - t3;

%Theta 4
K = r12*cos(t2+t3)*cos(t1) - r32*sin(t2+t3) + r22*cos(t2+t3)*sin(t1);
t4 = atan2(-K,sqrt(1-K^2));


end
