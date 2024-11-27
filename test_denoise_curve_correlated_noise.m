% In this script, we compare the noise reduction performance of the proposed
% rules with the one of a classical rule.

% matrix to be used as block in the block diagonal covariance matrix
hatOmega_block = 0.5*covariance_correlated(16,1e-10);

% random seed
rng(1);

test_denoise_curve_aux(hatOmega_block);
axis([-6,-2,1.2,5.2]);