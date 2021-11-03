% MAE 263A Project
% Simulation

clc;
% clf;
clear all;

% Main
% Parameter
a2 = 0.087; % m
d4 = 0.111; % m
de = 0.078; % m
c = [a2 d4 de];

% Trajectory Cartesian Space
N = 101;
t = linspace(0,2*pi,N);
x = 0.025*cos(t) + 0.15;
y = 0.025*sin(t);
z = ones(1,N)*0;
R = [-1 0 0;0 1 0;0 0 -1];

% Joint Space
for i = 1:N
    p = [x(i) y(i) z(i)]';
    T0e = [R p;0 0 0 1];
    [theta1(i),theta2(i),theta3(i),theta4(i),theta5(i),theta6(i)] = IK(T0e,c);
end

t1 = unwrap(theta1);
t2 = unwrap(theta2);
t3 = unwrap(theta3);
t4 = unwrap(theta4);
t5 = unwrap(theta5);
t6 = unwrap(theta6);

joint = [t1;t2;t3;t4;t5;t6];
path = [x;y;z];

movie = 0; % create movie if 1
speed = 1; % 1 to N

figure(1)
for i = 1:1
    animation(c,joint,path,movie,speed)
end