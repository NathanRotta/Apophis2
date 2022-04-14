 p0 = [0.0873    7.4116    3.3309    0.6071];

 f = @(p) p(1) * sin(p(2) * stimes - p(3)) .* exp(-p(4) * stimes);



p  = fminsearch(@(p) norm(f(p) - spoints), p0)



plot(stimes,f(p))

