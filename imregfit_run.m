% fminsearch to find the best image registration 
% author: @gzmk / Gizem Kucukoglu
% Feb 2, 2016

% global photo;
% global render_ball;

%% choose gloss level

disp('hello')
%% call fminsearch

pinit = [0, -20, 1.06, 1.06];
[p_fit, fval]  = fminsearch(@(p) imregfit(p),pinit);

save('p_fit100.mat','p_fit');
save('fval100.mat','fval');