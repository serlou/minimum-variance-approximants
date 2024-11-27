function a = rule(r,Nl,Nr,hatOmega,t)
% RULE computes the optimal rule for the given stencil, evaluation point and covariance matrix
% INPUTS:
% r: polynomial degree
% Nl: left boundary of the stencil Nl, Nl+1, ..., Nr
% Nr: right boundary of the stencil Nl, Nl+1, ..., Nr
% hatOmega: covariance matrix of the noise attach to the stencil
% t: evaluation point, usually in [Nl,Nr]
% OUTPUT:
% a: 1xN coefficients of the optimal rule

N = Nr-Nl+1;
assert(all(size(hatOmega)==[N,N]));
assert(Nl<Nr);
assert(r>=0);
assert(N>=r+1)
x = (Nl:Nr)';
A = [ones(N,1),x.^(1:r)];
OA = hatOmega\A;
B = A'*OA;

c = B\[1;t.^(1:r)'];
a = OA*c;
a = a'/sum(a);