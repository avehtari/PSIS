function [k,sigma,ks,w] = gpdfitnew(x)
%GPDFITNEW Estimate the paramaters for the Generalized Pareto Distribution
%   
%  Description
%    [K,SIGMA] = GPDFITNEW(X) returns empirical Bayes estimate for the
%    parameters k (ksi) and sigma of the two-parameter generalized Parato
%    distribution (GPD) given the data in X.
%    
%    [K,SIGMA,KS,W] = GPDFITNEW(X) returns also the marginal posterior
%    distribution of k in a format of quadrature points KS and
%    quadrature weights W.
%    
%  References
%    Jin Zhang & Michael A. Stephens (2009) A New and Efficient
%    Estimation Method for the Generalized Pareto Distribution,
%    Technometrics, 51:3, 316-325, DOI: 10.1198/tech.2009.08017
%
%    Aki Vehtari, Andrew Gelman and Jonah Gabry (2017). Pareto
%    smoothed importance sampling. https://arxiv.org/abs/1507.02646v5
%
%  Note
%    This function returns a negative of Zhang and Stephens's k,
%    because it is more common parameterisation
%
% Copyright (c) 2015-2017 Aki Vehtari

% This software is distributed under the GNU General Public
% License (version 3 or later); please refer to the file
% License.txt, included with the software, for details.

% fit generalized Pareto distribution
n=numel(x);
prior=3;
x=sort(x);
m=30+floor(sqrt(n));
bs=1/x(n)+(1-sqrt(m./([1:m]'-.5)))./prior./x(floor(n./4+0.5));
% loop version matching Zhang and Stephens paper
% w=zeros(m,1);
% L=zeros(m,1);
% ks=zeros(m,1);
% for i=1:m
%     k=-mean(log1p(-bs(i).*x));
%     ks(i)=-k;
%     L(i)=n*(log(bs(i)/k)+k-1);
% end
% for i=1:m
%     w(i)=1/sum(exp(L-L(i)));
% end
% faster vectorized version
% we use negative of Zhang and Stephens's k, because it
% is more common parameterisation
ks=mean(log1p(bsxfun(@times,-bs,x')),2);
L=n*(log(bs./-ks)-ks-1);
w=1./sum(exp(bsxfun(@minus,L,L')))';
sigmas=-ks./bs;

% remove negligible weights
dii=w<eps*10;
w(dii)=[];w=w./sum(w);
bs(dii)=[];
ks(dii)=[];

% posterior mean for b
b=sum(bs.*w);
% estimate for k, note that we return a negative of Zhang and
% Stephens's k, because it is more common parameterisation
k=mean(log1p(-b*x));
ks=mean(log1p(-bs*x'),2);
% estimate for sigma
sigma=-k/b*n/(n-0);
% weakly informative prior for k
a=10;
k=k*n/(n+a)+a*0.5/(n+a);
ks=ks*n/(n+a)+a*0.5/(n+a);
