function hatOmega = covariance_nonuniform_uncorrelated(N,eps)
    hatOmega = [eps*ones(1,floor(N/2)),ones(1,N-floor(N/2))];
    hatOmega = diag(hatOmega);
end