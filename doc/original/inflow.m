% inflow.m
% AUTHOR: Michael Abraham
% Last update: 01/29/07

% This function governs the inflow of water into a cup at position theta.
% In the current example, the inflow varies as a cosine of the cup center's
% distance from the spout.  This way, the inflow is slowly phased out of
% one cup and into the next... this removes any sharp discontinuities in
% the dynamics

function F = inflow(theta)

wheel_parameters;

if cos(theta)>abs(cos(2*pi/n))
    theta = atan2(tan(theta),1);
    F = f/2*(cos(n*theta/2)+1);
else
    F = 0;
end


