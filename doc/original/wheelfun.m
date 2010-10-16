% wheelfun.m
% AUTHOR: Michael Abraham
% Last update: 01/29/07

% Dynamic model for a chaotic waterwheel with n cups.  This function is
% integrated using MATLAB's ode45 integrator.  Simulations are set up with
% the wheel_parameters.m file and simulations are executed using the
% gowheel.m file.  The code is commented well and should be
% self-explanatory.  A discussion of the derivation of the dynamic
% equations is omitted.

function xdot = wheelfun(t,x)

% Load Parameters
wheel_parameters;

% The first state is the position of cup 0
theta0 = x(1);

% The second state is the velocity of cup 0
theta0dot = x(2);

% Therefore, xdot(1) = x(2) = theta0dot
xdot(1,1) = theta0dot;

% The other states are the water (by mass) in each cup
w = x(3:end);

% The total moment of inertia: sum of contributions from each cup plus I0
I = sum(w)*r^2 + I0;

% The position of cup i is theta(i)
theta = theta0 + 2*pi/n*(0:1:n-1);

% Initialize the Torque vector
T = zeros(1,n);

% Here, we compute the Torque contribution from each cup
for i = 1:n
    T(i) = r*g*w(i)*sin(theta(i));
end

% Total torque is the sum of the cup torques plus viscous friction
T_total = sum(T) - K*theta0dot;

% xdot = theta0dotdot = T_total/I
xdot(2,1) = T_total/I;

% Initialize w vector
wdot = zeros(1,n);

% Here, we drain water from each cup at a rate of eta and add water
% according to the function specified by inflow.m
for i = 1:n
    wdot(i) = -eta*w(i) + inflow(theta(i));
    % These time derivatives go into our state derivative
    xdot(2+i,1) = wdot(i);
end
