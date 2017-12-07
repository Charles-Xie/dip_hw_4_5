% threshold the output image of BHPF result
im = imread('BHPFresult.bmp');

figure;
subplot(1,2,1); imshow(im);
title('BHPF result (input)');

approxiRange = 0.5;
thresh = findThresh(im, approxiRange);

% binarize the image according to the thresh
result = im > thresh;
subplot(1,2,2); imshow(result,[]);
title('threshholding result (output)');

% save image
imwrite(result, 'thresholdResult.bmp');