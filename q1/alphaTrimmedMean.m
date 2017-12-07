function f = alphaTrimmedMean(im,m,n,d)
% implements a alpha-trimmed mean filter.
im = double(im);
h = ones(m, n);
f = imfilter(im, h);

if mod(d, 2) == 0
    for k = 1:d/2
        f = imsubtract(f,ordfilt2(im,k,ones(m,n),'symmetric'));
    end
    for k = (m*n - (d/2) + 1):m*n
        f = imsubtract(f,ordfilt2(im,k,ones(m,n),'symmetric'));
    end
else
    for k = 1:(1+d)/2
        f = imsubtract(f,ordfilt2(im,k,ones(m,n),'symmetric'));
    end
    for k = (m*n - (d-1)/2 + 1):m*n
        f = imsubtract(f,ordfilt2(im,k,ones(m,n),'symmetric'));
    end
end
f = f/(m*n - d);
