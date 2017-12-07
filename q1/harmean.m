function f = harmean(g, m, n)
% Implements a harmonic mean filter
g = double(g);
f = m * n ./ imfilter(1./(g + eps), ones(m, n), 'replicate');
