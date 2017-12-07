img = imread('Q3_3.tif');
img = im2single(img);
[rows, cols] = size(img);

paddedImg = padarray(img, [rows, cols], 'post');
imfft = fft2(paddedImg);
imfftShift = fftshift(imfft);

D0 = 50;
n = 4;
HPFilter = 1 - BHPF(D0, 2 * rows, 2 * cols, n);

fftResultShift = HPFilter .* imfftShift;
fftResult = ifftshift(fftResultShift);
result = ifft2(fftResult);
result = result(1:rows, 1: cols);
realResult = real(result);
figure, imshow(realResult);
% imsave("BHPFresult.bmp");
imwrite(realResult, 'BHPFresult.bmp');
