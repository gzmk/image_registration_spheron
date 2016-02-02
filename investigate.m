% play with images
load('gloss100_ball.mat');
subplot(1,2,1);imshow(gloss100_ball)
subplot(1,2,2);imhist(gloss100_ball)

% load spheron_sphere4-001.mat
im1 = multispectralImage;
render1 = imcrop(im1, [2517 0 379 2707]);
render_ball1 = imcrop(render1, [0 1192 380 379]);

%%
subplot(1,2,1);imshow(render_ball1.*10)
subplot(1,2,2);imhist(render_ball1.*10)

%%
subplot(1,2,1);imshow(render_ball2.*10)
subplot(1,2,2);imhist(render_ball2.*10)
%%
subplot(1,2,1);imshow(render_ball3.*10)
subplot(1,2,2);imhist(render_ball3.*10)

%% mean/median etc
mean_photo = mean(gloss100_ball(:))
median_photo = median(gloss100_ball(:))

mean_render1 = mean(render_ball1(:))
median_render1 = median(render_ball1(:))


% scaled render
render_scaled1 = render_ball1.*10;