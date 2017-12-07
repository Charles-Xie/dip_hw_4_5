% image Q_1_1 has pepper noise
im = imread('Q_1_1.tif');
figure;
subplot(131);
imshow(im);
title("Q_1_1");

% % Gaussian filter
% r = 6
% sigma = 1.5
% gau_h = fspecial('gaussian', r * [1 1], sigma);
% im_gau = imfilter(im, gau_h, 'replicate');
% subplot(132);
% imshow(im_gau);
% title("gaussian filter,size=" + r + "*" + r + ",sigma=" + sigma);

% max filter
m = 3;
im_max = ordfilt2(im, m*m, ones(m, m));
subplot(132);
imshow(im_max, []);
title("max filter, size=" + m + "*" + m);

% Contraharmonic mean filter, Q > 0
Q = 1.5;
m = 3; n = m;
im_ch = conharmean(im, 3, 3, 1.5);
% figure, imshow(im_ch, []);
subplot(133);
imshow(im_ch, []);
title("contraharmonic mean filter,size="+m+"*"+n+",Q="+Q);