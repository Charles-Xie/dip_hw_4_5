% image with gaussian noise
im = imread('Q_1_4.tif');
figure;
subplot(221);
imshow(im);
title("Q_1_4");

% arithmetic mean filter
am_size = 6;
amean_h = fspecial('average', am_size);
im_amean = imfilter(im, amean_h, 'replicate');
subplot(222);
imshow(im_amean);
title("atithmetic mean filter, size=" + am_size);

% adaptive median filter
ada_max = 11;
im_res = adaptiveMedian(im, ada_max);
subplot(223);
imshow(im_res, []);
title("adaptive median filter,max size=" + ada_max + "*" + ada_max);
% result turns out to be not so good

% alpha-trimmed mean filter
m = 5; n = m;
d = 10;
im_atm = alphaTrimmedMean(im, m, n, d);
subplot(224);
imshow(im_atm, []);
title("atm filter,size=" + m + "*" + m + ",d=" + d);
