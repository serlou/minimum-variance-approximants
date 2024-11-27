function hatOmega = covariance_correlated(N,eps)
    if mod(N, 4) ~= 0
        error('N must be divisible by 4');
    end
    hatOmega = [1 -1+eps 0 0; -1+eps 1 -eps 0; 0 -eps 1 -eps; 0 0 -eps 1];
    hatOmega = kron(eye(N/4),hatOmega);
end
