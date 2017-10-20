%DEMO_STAN_ARSENIC
%
%  Description
%    Demonstration of computing PSIS-LOO and k-fold-CV for Stan model
%    using MatlabStan
%
%  References
%    Aki Vehtari, Andrew Gelman and Jonah Gabry (2017). Practical
%    Bayesian model evaluation using leave-one-out cross-validation
%    and WAIC. Statistics and Computing, 27(5):1413–1432. 
%    doi:10.1007/s11222-016-9696-4. https://arxiv.org/abs/1507.04544
%
%    Aki Vehtari, Andrew Gelman and Jonah Gabry (2017). Pareto
%    smoothed importance sampling. https://arxiv.org/abs/1507.02646v5
%
%  Copyright (c) 2015 Aki Vehtari

% This software is distributed under the GNU General Public
% License (version 3 or later); please refer to the file
% License.txt, included with the software, for details.

use MatlabProcessManager
use MatlabStan

%% Fit a model, using arsenic and distance as predictors

% Read in data
load arsenic_data
y=data.xSwitch;
x=[data.arsenic data.dist];
[n,m]=size(x);

% Model
model='arsenic_logistic.stan';

% Fit the model in Stan
dat=struct('p',m,'N',n,'y',y,'x',x);
fit = stan('file',model,'data',dat,'sample_file','arsenic','file_overwrite',true,'verbose',false);
fit.block()

% Compute LOO and standard error
s = fit.extract('permuted',true);
[loo,loos,pk]=psisloo(s.log_lik);
fprintf('elpd_loo = %.1f, SE(elpd_loo) = %.1f\n',sum(loos),std(loos)*sqrt(n))

% Check the shape parameter k of the generalized Pareto distribution
if all(pk<0.5)
    fprintf('All Pareto k estimates OK (k < 0.5)\n')
else
  pkn1=sum(pk>=0.5&pk<1);
  pkn2=sum(pk>=1);
  fprintf('%d (%.0f%%) PSIS Pareto k estimates between 0.5 and 1\nand %d (%.0f%%) PSIS Pareto k estimates greater than 1\n',pkn1,pkn1/n*100,pkn2,pkn2/n*100)
end

%% Fit a second model, using log(arsenic) instead of arsenic
x2=[log(data.arsenic) data.dist];

% Fit the model in Stan
dat2=struct('p',m,'N',n,'y',y,'x',x2);
fit2 = stan('file',model,'data',dat2,'sample_file','arsenic','file_overwrite',true,'verbose',false);
fit2.block()

% Compute LOO and standard error
s2 = fit2.extract('permuted',true);
[loo2,loos2,pk2]=psisloo(s2.log_lik);
fprintf('elpd_loo = %.1f, SE(elpd_loo) = %.1f\n',sum(loos2),std(loos2)*sqrt(n))

% Check the shape parameter k of the generalized Pareto distribution
if all(pk2<0.5)
    fprintf('All Pareto k estimates OK (k < 0.5)\n')
else
  pkn1=sum(pk2>=0.5&pk2<1);
  pkn2=sum(pk2>=1);
  fprintf('%d (%.0f%%) PSIS Pareto k estimates between 0.5 and 1\nand %d (%.0f%%) PSIS Pareto k estimates greater than 1\n',pkn1,pkn1/n*100,pkn2,pkn2/n*100)
end

%% Compare the models
loodiff=loos-loos2;
fprintf('elpd_diff = %.1f, SE(elpd_diff) = %.1f\n',sum(loodiff),std(loodiff)*sqrt(n))

%% k-fold-CV
% k-fold-CV should be used if several khats>0.5
% in this case it is not needed, but provided as an example
modelt='arsenic_logistic_t.stan';
[cvitr,cvitst]=cvit(n,10,1);
for cvi=1:10
    fprintf('%d\n',cvi)
    datcv=struct('p',m,'N',numel(cvitr{cvi}),'Nt',numel(cvitst{cvi}),'x',x(cvitr{cvi},:),'y',y(cvitr{cvi}),'xt',x(cvitst{cvi},:),'yt',y(cvitst{cvi}));
    fitcv = stan('file',modelt,'data',datcv,'sample_file','arsenic','file_overwrite',true,'verbose',false);
    fitcv.block()
    scv = fitcv.extract('permuted',true);
    kfcvs(1,cvitst{cvi})=sumlogs(scv.log_likt)-log(size(scv.log_likt,1));
end
% compare PSIS-LOO and k-fold-CV
plot(loos,kfcvs,'.')
line([-3.5 0],[-3.5 0],'color','r')
xlabel('PSIS-LOO')
ylabel('10-fold-CV')
