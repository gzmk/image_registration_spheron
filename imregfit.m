%fminsearch to find the best image registration 
% author: @gzmk / Gizem Kucukoglu
% Feb 2, 2016

function error = imregfit(p)
%tform(1): x-translation
%tform(2): y-translation
%tform(3): x-scale
%tform(4): y-scale
%tform(5): add these two if you want rotation or shear
%tform(6):

% read in photo
load('gloss30_ball.mat');
photo = gloss30_ball;

% read in render
load('render20-30.mat');
render_b = render_ball;

% im = multispectralImage;
% render = imcrop(im, [2517 0 379 2707]);
% render_ball = imcrop(render, [0 1192 379 379]);
% render_ball = render_ball.*10;

disp('we are in')

% build affine transformation matrix
% for types of affine transformation matrices look here:
% http://www.mathworks.com/help/images/performing-general-2-d-spatial-transformations.html#f12-33299
if (p(1)>25 || p(2)<-25 || p(3) > 1.2 || p(4)> 1.2)
    error = 10e9;
    return;
end

affineM =[p(3) 0 0;
          0 p(4) 0;
         p(1) p(2) 1 ];

disp(p)
tform_translate = maketform('affine',affineM);

% apply transformation matrix to photo
% Rcb = imref2d(size(photo)); % get spacial ref information
J = imtransform(photo,tform_translate,'XData',[1 size(photo,2)],'YData',[1 size(photo,1)]);

% apply same mask to both images
% create mask:
cx=179;cy=207;ix=379;iy=380;r1=121;r2=121; 
[x,y]=meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
render_mask=(((x.^2.*r1^2)+(y.^2.*r2^2))<=r1^2*r2^2);

masked_render = render_mask.*render_b;
masked_photo = render_mask.*J;

% normalize the render and photo
mean_render = mean(mean(masked_render));
renderNorm = masked_render./(mean_render);

mean_photo = mean(mean(masked_photo));
photoNorm = masked_photo./(mean_photo);

% calculate sum of squared errors
diff = renderNorm-photoNorm;
error = sum(sum(diff.^2));
disp(error)

return;