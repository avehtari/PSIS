## Pareto smoothed importance sampling (PSIS) and PSIS leave-one-out cross-validation reference code

### Introduction
These files implement Pareto smoothed importance sampling (PSIS) and
PSIS leave-one-out cross-validation for Matlab/Octave and Python
(Python port made by [Tuomas Sivula](https://github.com/tsivula)).

### Corresponding R code

The corresponding R code can be found in [R package called
`loo'](https://github.com/stan-dev/loo) which is also available in CRAN.

### Contents

#### Matlab/Octave code in 'm' folder
- 'psislw.m'  - Pareto smoothed importance sampling smoothing of the log importance weights
- 'psisloo.m' - Pareto smoothed importance sampling leave-one-out log predictive densities
- 'gpdfitnew.m' - Estimate the paramaters for the Generalized Pareto Distribution
- 'sumlogs.m' - Sum of vector where numbers are represented by their logarithms

#### Python module in 'py' folder
- 'psis.py'  - Includes the following functions in a Python (Numpy) module
   - psislw  - Pareto smoothed importance sampling smoothing of the log importance weights
   - psisloo - Pareto smoothed importance sampling leave-one-out log predictive densities
   - gpdfitnew - Estimate the paramaters for the Generalized Pareto Distribution
   - gpinv - Inverse Generalised Pareto distribution function.
   - sumlogs - Sum of vector where numbers are represented by their logarithms
                 
### References
- Aki Vehtari and Andrew Gelman (2015). Pareto smoothed importance
  sampling. [arXiv preprint arXiv:1507.02646](http://arxiv.org/abs/1507.02646)
- Aki Vehtari, Andrew Gelman and Jonah Gabry (2015). Efficient
  implementation of leave-one-out cross-validation and WAIC for
  evaluating fitted Bayesian models. [arXiv preprint arXiv:1507.04544](http://arxiv.org/abs/1507.04544)
- Jin Zhang & Michael A. Stephens (2009) A New and Efficient
  Estimation Method for the Generalized Pareto Distribution,
  Technometrics, 51:3, 316-325, DOI: 10.1198/tech.2009.08017
