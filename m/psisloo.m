function [loo,loos,pk] = psisloo(log_lik,varargin)
%PSISLOO Pareto smoothed importance sampling leave-one-out log predictive densities
%   
%  Description
%    [LOO,LOOS,KS] = PSISLOO(LOG_LIK) computes Pareto smoothed importance
%    sampling leave-one-out log predictive densities given posterior
%    samples of the log likelihood terms p(y_i|\theta^s) in LOG_LIK.
%    Returns a sum of the leave-one-out log predictive densities LOO,
%    individual leave-one-out log predictive density terms LOOS and an
%    estimate of Pareto tail indeces KS. The estimates are unreliable if 
%    tail index k>0.7 (see more in the references).
%
%    [LOO,LOOS,KS] = PSISLOO(LOG_LIK,Reff) passes optional
%    arguments for Pareto smoothed importance sampling.
%      Reff - relative MCMC efficiency N_eff/N
%
%  References
%    Aki Vehtari, Andrew Gelman and Jonah Gabry (2017). Practical
%    Bayesian model evaluation using leave-one-out cross-validation
%    and WAIC. Statistics and Computing, 27(5):1413–1432. 
%    doi:10.1007/s11222-016-9696-4. https://arxiv.org/abs/1507.04544
%
%    Aki Vehtari, Andrew Gelman and Jonah Gabry (2017). Pareto
%    smoothed importance sampling. https://arxiv.org/abs/arXiv:1507.02646v5
%
%  Copyright (c) 2015 Aki Vehtari

% This software is distributed under the GNU General Public
% License (version 3 or later); please refer to the file
% License.txt, included with the software, for details.

% log raw weights from log_lik
lw=-log_lik;
% compute Pareto smoothed log weights given raw log weights
[lw,pk]=psislw(lw,varargin{:});
% compute
loos=sumlogs(log_lik+lw);
loo=sum(loos);
