% gowheel.m
% AUTHOR: Michael Abraham
% Last update: 01/29/07

% This function runs a simulation and returns the results.
% theta0 is the wheel's initial position (radians)
% thetadot0 is the wheel's intial velocity (rad/sec)
% tf is the final time (simulation starts at t=0)
% The number of buckets can be specified in the wheel_parameters.m file
% w is a tn x n vector containing the time history of the water in each cup

function [t,theta,thetadot,w] = gowheel(theta0,thetadot0,tf)

wheel_parameters;

x0 = [theta0; thetadot0; zeros(n,1)];

[t,x] = ode45(@wheelfun,[0 tf],x0);

theta = x(:,1);
thetadot = x(:,2);
w = x(:,3:end);

save last
