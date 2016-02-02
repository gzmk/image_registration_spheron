% fminsearch to find the best image registration 
% author: @gzmk / Gizem Kucukoglu
% Feb 2, 2016

global photo;
global render_ball;

%% choose gloss level
% read in photo
load('gloss0_ball.mat');
photo = gloss0_ball;

% read in render
load('spheron_sphere6-10.mat');
im = multispectralImage;
render = imcrop(im, [2517 0 379 2707]);
render_ball = imcrop(render, [0 1192 379 379]);
render_ball = render_ball.*10;

%% call fminsearch

pinit = [0, 0, 1, 1];
p_fit = fminsearch(@(p) imregfit(p),pinit);

