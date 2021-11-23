%% MAE 263A Project Simulation
clear; clc;
clc;


%% Parameters to be changed by user

% Simulation parameters
N = 101;                  %Number of points
t = linspace(0,2*pi,N);   %Time vector
movie = 0;                %Save animation
speed = 1;                %Speed of Animation

% D-H Parameters
alpha1 = 0;
a1 = 0;
%d1 variable to solve for
theta1 = 0;
alpha2 = pi/2;
a2 = 0;
d2 = 1; %PLACEHOLDER
%Theta2 variable to solve for
alpha3 = -pi/2;
a3 = 0;
d3 = 0;
%Theta3 variable to solve for
alpha4 = 0;
a4 = 3; %PLACEHODLER
d4= 0;
%Theta4 variable to solve for
de = 0.1; %PLACEHOLDER
c = [alpha1, a1, theta1, alpha2, a2, d2, alpha3, a3, d3, alpha4, a4, d4, de];


% Specified trajectory and orientation of end effector (draw a circle)
Gamma = 0; Beta = 0; Alpha = 180; %Euler angles
x = 0.025*cos(t) + 0.15;
y = 0.025*sin(t);
z = ones(1,N)*0;
Rx = [1 0           0;
      0 cos(Gamma) -sin(Gamma);
      0 sin(Gamma)  cos(Gamma)];
Ry = [cos(Beta)  0 sin(Beta);
      0          1 0;
      -sin(Beta) 0 cos(Beta)];
  
Rz = [cos(Alpha) -sin(Alpha) 0;
      sin(Alpha)  cos(Alpha) 0;
      0           0          1];
R = Rx*Ry*Rz;
path = [x;y;z]; %The specified trajectory


%% Do not change below code
% Computing joint angles from inverse kinmematics
for i = 1:N
    p = [x(i) y(i) z(i)]'; %End effector position at each time step
    T0e = [R p;0 0 0 1];   %Packing into Homogeneous coordinates
    [dis1(i),theta2(i),theta3(i),theta4(i)] = IK(T0e,c);
end

% Time Vector for each joint
d1 = unwrap(dis1);
t2 = unwrap(theta2);
t3 = unwrap(theta3);
t4 = unwrap(theta4);
joint = [d1;t2;t3;t4];

figure(1)
animation(c,joint,path,movie,speed)