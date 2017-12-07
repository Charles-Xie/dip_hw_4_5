% implements a geometric mean filter
function f = gmean(g, m, n)
g = double(g);
f = imfilter(log(g), ones(m, n), 'replicate');
f = exp(f).^(1/m/n);