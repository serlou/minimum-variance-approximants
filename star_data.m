function [f0, f0_original] = star_data(hatOmega)
% [f0, f0_original] = star_data(hatOmega)
% INPUT:    hatOmega MxM noise covariance matrix
% OUTPUT:   f0 1xM complex matrix, noisy curve points in the complex plane
%           f0_original 1xM complex matrix, clean curve points in the complex plane
%   Copyright (c) 2024 Sergio López-Ureña and Dionisio F. Yáñez

% M is the number of evaluation points, derived from the size of hatOmega
M = size(hatOmega,1);
assert(M == size(hatOmega,2), 'hatOmega must be square');
t0 = (0:M-1)/M*2*pi; % evaluation points
x0 = 4*cos(t0) + cos(4*t0); % x-coordinates of the star-shaped curve
y0 = 4*sin(t0) - sin(4*t0); % y-coordinates of the star-shaped curve
f0_original = x0 + 1i*y0; % star-shaped curve
x0 = x0 + correlated_noise(hatOmega,1)'; % add noise to x-coordinates
y0 = y0 + correlated_noise(hatOmega,1)'; % add noise to y-coordinates
f0 = x0 + 1i*y0; % noisy curve
end