function fig = test_denoise_curve_aux(hatOmega_block)
%   Copyright (c) 2024 Sergio López-Ureña and Dionisio F. Yáñez

N = 16; % size of the stencil
Nl = 1-N/2; % left boundary
Nr = N/2; % right boundary
r = 1; % polynomial degree
t = 0; % evaluation point in [Nl,Nr]

m = 20; % number of blocks
M = N*m; % total number of evaluations points

hatOmega = kron(eye(m),hatOmega_block); % M x M covariance matrix

[f0,f0_original] = star_data(hatOmega); % generate star-shaped data

f0_denoised_opt = zeros(size(f0)); % denoised signal using the optimal rules
f0_denoised_classical = zeros(size(f0)); % denoised signal using the classical rule
% Loop through each evaluation point to apply denoising rules
for i=1:M
    stencil = i+Nl:i+Nr; % moving stencil
    stencil = mod(stencil-1,M)+1; % periodic conditions
    a_opt = rule(r,Nl,Nr,hatOmega(stencil,stencil),t); % optimal rule
    f0_denoised_opt(i) = sum(a_opt.*f0(stencil)); % denoised signal using the optimal rule
    f0_denoised_classical(i) = mean(f0(stencil)); % denoised signal using the classical rule
end

fig = figure;
hold on;
plot(f0_original,'k-','LineWidth',2); % clean curve
plot(f0,'bo','MarkerSize',6,'LineWidth',2); % noisy curve
plot(f0_denoised_opt,'r.','MarkerSize',15); % denoised curve using the optimal rules
plot(f0_denoised_classical,'g.','MarkerSize',15); % denoised curve using the classical rule

% big font
fig.Children(1).FontSize = 16;
% figure size
fig.Position = [100,100,800,600];