% image has salt noise
im = imread('Q_1_2.tif');
figure;
subplot(231);
imshow(im);
title("Q_1_2");

% % Gaussian filter
% r = 6
% sigma = 1.5
% gau_h = fspecial('gaussian', r * [1 1], sigma);
% im_gau = imfilter(im, gau_h, 'replicate');
% subplot(222);
% imshow(im_gau);
% title("gaussian filter,size=" + r + "*" + r + ",sigma=" + sigma);

% min filter
m = 3;
im_min = ordfilt2(im, 1, ones(m, m));
subplot(232);
imshow(im_min, []);
title("min filter, size=" + m + "*" + m);

% geometric mean filter
m = 3;
im_gmean = gmean(im, m, m);
subplot(233);
imshow(im_gmean, []);
title("gmean,size=" + m + "*" + m);


% Harmonic mean filter
m = 3;
n = m;
im_har = harmean(im, m, n);
subplot(234);
imshow(im_har, []);
title("harmonic mean filter,size="+m+"*"+n);

% Contraharmonic mean filter, Q < 0
Q = - 1.5;
m = 3; n = m;
im_ch = conharmean(im, m, n, Q);
subplot(235);
imshow(im_ch, []);
title("contraharmonic mean filter,size="+m+"*"+n+",Q="+Q);
