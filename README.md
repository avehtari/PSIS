## Pareto smoothed importance sampling (PSIS) and PSIS leave-one-out cross-validation reference code

### Introduction
These files implement Pareto smoothed importance sampling (PSIS) and
PSIS leave-one-out cross-validation for Matlab/Octave and Python
(Python port made by [Tuomas Sivula](https://github.com/tsivula)).

### Corresponding R code in loo package

The corresponding R code can be found in the [`loo` R package](https://github.com/stan-dev/loo), which is also available from [CRAN](https://cran.r-project.org/package=loo).

### Python code in ArviZ

[ArviZ package for exploratory analysis of Bayesian models](https://github.com/arviz-devs/arviz) available in PyPI has corresponding loo and psislw functions (see [ArviZ API reference](https://arviz-devs.github.io/arviz/api.html)).

### Contents

#### Matlab/Octave code in 'm' folder
- 'psislw.m'  - Pareto smoothing of the log importance weights
- 'psisloo.m' - Pareto smoothed importance sampling leave-one-out log predictive densities
- 'gpdfitnew.m' - Estimate the paramaters for the Generalized Pareto Distribution
- 'sumlogs.m' - Sum of vector where numbers are represented by their logarithms

#### Python module in 'py' folder
- 'psis.py'  - Includes the following functions in a Python (Numpy) module
   - psislw  - Pareto smoothing of the log importance weights
   - psisloo - Pareto smoothed importance sampling leave-one-out log predictive densities
   - gpdfitnew - Estimate the paramaters for the Generalized Pareto Distribution
   - gpinv - Inverse Generalised Pareto distribution function.
   - sumlogs - Sum of vector where numbers are represented by their logarithms
                 
### References
- Aki Vehtari, Andrew Gelman and Jonah Gabry (2017). Practical
  Bayesian model evaluation using leave-one-out cross-validation
  and WAIC. Statistics and Computing, 27(5):1413–1432. [doi:10.1007/s11222-016-9696-4](http://dx.doi.org/10.1007/s11222-016-9696-4). [arXiv preprint arXiv:1507.04544](http://arxiv.org/abs/1507.04544)
- Aki Vehtari, Andrew Gelman and Jonah Gabry (2016). Pareto
  smoothed importance sampling. [arXiv preprint arXiv:1507.02646](http://arxiv.org/abs/1507.02646)
- Jin Zhang & Michael A. Stephens (2009) A New and Efficient
  Estimation Method for the Generalized Pareto Distribution,
  Technometrics, 51:3, 316-325, DOI: 10.1198/tech.2009.08017
