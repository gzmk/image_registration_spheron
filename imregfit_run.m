% fminsearch to find the best image registration 
% author: @gzmk / Gizem Kucukoglu
% Feb 2, 2016

% global photo;
% global render_ball;

%% choose gloss level

disp('hello')
%% call fminsearch

pinit = [10, -10, 1.06, 1.06];
[p_fit, fval]  = fminsearch(@(p) imregfit(p),pinit);

save('p_fit40.mat','p_fit');
save('fval40.mat','fval');