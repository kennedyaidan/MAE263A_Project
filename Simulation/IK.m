%Specific to the robot arm
function [d1,t2,t3,t4] = IK(T0e,c)

d2 = c(6);
L4 = c(11);
de = c(13);


T4e = [1 0 0 0;0 1 0 0;0 0 1 de;0 0 0 1];
T04 = T0e/T4e;
R = T04(1:3,1:3);
r21 = R(2,1);
r22 = R(2,2);
x = T04(1,4);
y = T04(2,4);
z = T04(3,4);


%what are r21 and r22?
t3 = atan2((y+d2)/L4, (sqrt(1-((y+d2)/L4)^2)));
t2 = atan2((sqrt(1-(x^2/(L4^2*cos(t3)^2)))), (x/(L4*cos(t3))));
d1 = z - L4*cos(t3)*sin(t2);
t4 = -t3 + atan2(r21, r22);


end