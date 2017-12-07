function thresh = findThresh(im, approxiRange)

% original thresh
thresh = mean2(im);

% whether or not arriving at final thresh
isOver = false;
while isOver == false
    g = im > thresh;
    % find new thresh
    newThresh = 0.5 * (mean(im(g)) + mean(im(~g)));
    isOver = abs(thresh - newThresh) < approxiRange;
    thresh = newThresh;
end
