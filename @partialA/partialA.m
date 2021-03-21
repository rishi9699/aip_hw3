function  res = partialA(angles)

res.adjoint = 0;
%res.n = n;
%res.m = m;
res.angles = angles;

% Register this variable as a partialA class
res = class(res,'partialA');
