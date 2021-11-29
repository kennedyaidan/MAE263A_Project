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
alpha0 = 0;
a0 = 0;
d1 = 0;
%Theta1 to be solved for
alpha1 = -pi/2;
a1 = 0;
d2 = 0; 
%Theta2 variable to solve for
alpha2 = 0;
a2 = 0.2; %Placeholder
d3 = 0.05; %Placeholder
%Theta3 variable to solve for
alpha3 = 0;
a3 = 0.2; %Placeholder
d4= 0.05; %Placeholder
%Theta4 variable to solve for
c = [alpha0, a0, d1, alpha1, a1, d2, alpha2, a2, d3, alpha3, a3, d4];

% Base Height
h = 0.3; %meters


% Specified trajectory and orientation of end effector (draw a circle)
Gamma = 180; Beta = 0; Alpha = 0; %Euler angles
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
    T04 = [R p;0 0 0 1];   %Packing into Homogeneous coordinates
    [theta1(i),theta2(i),theta3(i),theta4(i)] = IK(T04,c);
end

% Time Vector for each joint
t1 = unwrap(theta1);
t2 = unwrap(theta2);
t3 = unwrap(theta3);
t4 = unwrap(theta4);
joint = [t1;t2;t3;t4];

figure(1)
animation(c,h,joint,path,movie,speed)
