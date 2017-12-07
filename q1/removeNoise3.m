% image has salt & pepper noise
im = imread('Q_1_3.tif');
figure;
subplot(231);
imshow(im);
title("Q_1_3");

% adaptive median filter
ada_max = 11;
im_ada = adaptiveMedian(im, 11);
subplot(232);
imshow(im_ada, []);
title("adaptive median filter,max size=" + ada_max + "*" + ada_max);

% alpha-trimmed mean filter


% median filter for once, twice or third times
n = 3;
im_md = im;
for i = 1:3
    im_md = ordfilt2(im_md, (n*n + 1)/2, ones(n, n));
    subplot(2, 3, i+3);
    imshow(im_md);
    title("median filter,size=" + n + "*" + n + " (" + i + ")");
end


% alpha-trimmed mean filter
m = 4; n = m;
d = 10;
im_atm = alphaTrimmedMean(im, m, n, d);
subplot(233);
imshow(im_atm, []);
title("atm filter,size=" + m + "*" + m + ",d=" + d);
