% fminsearch to find the best image registration 
% author: @gzmk / Gizem Kucukoglu
% Feb 2, 2016

global photo;
global render_ball;

%% choose gloss level


%% call fminsearch

pinit = [0, 0, 1, 1];
p_fit = fminsearch(@(p) imregfit(p),pinit);

save('p_fit0.mat','p_fit');