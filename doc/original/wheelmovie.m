% wheelmovie.m
% AUTHOR: Michael Abraham
% Last update: 01/29/07

% Shows a movie of the wheel data stored in file.mat
% dt is the time between displayed frames
% The circles represent the amount of water in each cup
%
% EXAMPLE:  if the data you want to see is in data.mat, use:
% >> wheelmovie('data',1/40)

function out = wheelmovie(file,dt)

eval(['load ' file])

n = size(w,2);

R = 1; %Radius of displayed wheel
s = 1; %Scale factor used to size the display of water in each bucket

% Later, we use this data to plot circles
psi = linspace(0,2*pi,30);
xs = cos(psi);
ys = sin(psi);

% Final Time
tf = max(t);

% The time used to display the movie:
newt = 0:dt:tf;

% Interp the data to the new time:
theta = interp1(t,theta,newt);
w = interp1(t,w,newt);

% Shift the angles so "up" is up
theta = theta+pi/2;

% Time Loop
for i = 1:numel(newt)

    clf
    hold on

    % x is a vector of bucket positions
    x = theta(i) + 2*pi/n*(0:1:n-1);

    % Bucket Loop
    for j = 1:numel(x)
        % Line to each bucket:
        line([0 R*cos(x(j))],[0 R*sin(x(j))])
        % Circle representing the water in each bucket:
        fill(R*cos(x(j))+s*xs*w(i,j), R*sin(x(j))+s*ys*w(i,j),'b')
    end

    % The title is the time in seconds
    title(['time = ' num2str(newt(i))])

    % Set the axes
    axis([-1.5 1.5 -1.5 1.5]*R)

    drawnow

end
