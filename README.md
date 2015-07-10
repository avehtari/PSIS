## Very Good Importance Sampling (VGIS) and VGIS leave-one-out cross-validation for Matlab


### Introduction
These m-files implement Very Good Importance Sampling (VGIS) and
VGIS leave-one-out cross-validation for Matlab


### Contents
- 'vgislw.m'  - Very good importance sampling smoothing of the log importance weights
   - Aki Vehtari and Andrew Gelman (2015). Very good importance
   sampling. [arXiv preprint arXiv:1507.02646](http://arxiv.org/abs/1507.02646)
- 'vgisloo.m' - Very good importance sampling leave-one-out log predictive densities
   - Aki Vehtari, Andrew Gelman and Jonah Gabry (2015). Efficient
   implementation of leave-one-out cross-validation and WAIC for
   evaluating fitted Bayesian models.
- 'gpdfitnew.m' - Estimate the paramaters for the Generalized Pareto Distribution
   - Jin Zhang & Michael A. Stephens (2009) A New and Efficient
     Estimation Method for the Generalized Pareto Distribution,
     Technometrics, 51:3, 316-325, DOI: 10.1198/tech.2009.08017

                 
### Corresponding R code

Corresponding R code can be found in [R package called `loo'](https://github.com/jgabry/loo)
