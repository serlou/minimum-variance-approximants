function noise = correlated_noise(hatOmega, m)
% noise = correlated_noise(hatOmega,M)
% INPUT:    hatOmega MxM noise covariance matrix
%           m number of realizations
% OUTPUT:   noise Mxm matrix, correlated noise
%   Copyright (c) 2024 Sergio López-Ureña and Dionisio F. Yáñez

Omega = chol(hatOmega,"lower");

noise = randn(size(Omega,1),m);
noise = Omega*noise;