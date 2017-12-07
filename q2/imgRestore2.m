im = imread('Q_2_2.tif');
im = im2double(im);
% figure, imshow(im);
[rows, cols] = size(im);
paddedIm = padarray(im, [rows, cols], 'post');
% figure, imshow(paddedIm, []);

imfft = fft2(paddedIm);
imfftshift = fftshift(imfft);
% figure, imshow(imfftshift, []);
% figure, imshow(log(abs(imfftshift) + 1), []);

len = 98;
theta = 135;
psf = fspecial('motion', len, theta);

signal_var = var(im(:));
noise_var = 0.0003;
nsf = noise_var / signal_var;
wnrResult = deconvwnr(im, psf, nsf);

% for the convenience of adjusting parameters
% figure, imshow(wnrResult);
imshow(wnrResult);