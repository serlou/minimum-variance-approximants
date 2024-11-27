function fig = test_denoise_ratio_aux(hatOmega_fun)
%   Copyright (c) 2024 Sergio López-Ureña and Dionisio F. Yáñez

N = 16;
delta = 10.^linspace(-10,-1,200);
t = [0,0.25,0.5];
linestyle = {'-','--',':'};
r = 0:3;
colours = {'b','r','g','k'};
ratios = zeros(size(delta,2),size(t,2));
fig = figure;
hold on
for k=1:length(r)
    for j=1:length(t)
        for i=1:length(delta)
            ratios(i,j) = ratio(r(k),t(j),hatOmega_fun(N,delta(i)));
        end
        plot(delta,ratios(:,j),'LineWidth',2,'LineStyle',linestyle{j},'Color',colours{k});
    end
end
% big font
fig.Children(1).FontSize = 16;
% log-log scale
fig.Children(1).XScale = 'log';
fig.Children(1).YScale = 'log';
% figure size
fig.Position = [100,100,800,600];
end

function out = ratio(r,t,hatOmega)
    N = size(hatOmega,1);
    Nl = 1-N/2;
    Nr = N/2;
    
    a1 = rule(r,Nl,Nr,hatOmega,t); % optimal rule
    a2 = rule(r,Nl,Nr,eye(N),t); % classical rule
    
    out = a1*hatOmega*a1'/(a2*hatOmega*a2');
end