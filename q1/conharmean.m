function f = conharmean(g, m, n, q)
% Implement contra harmonic mean filter
g = double(g);
f = imfilter(g.^(q+1),ones(m,n),'replicate');
f = f ./(imfilter(g.^q,ones(m,n),'replicate') + eps);