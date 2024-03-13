## Pareto smoothed importance sampling (PSIS) and PSIS leave-one-out cross-validation reference code

### Introduction

These files implement Pareto smoothed importance sampling (PSIS) and
PSIS leave-one-out cross-validation for Matlab/Octave and Python
(Python port made by [Tuomas Sivula](https://github.com/tsivula)).

These code are not maintained and are here for historical
reference. Instead of these, use well maintained implementations
available for R, Python, and Julia as listed below.

### R

- PSIS and PSIS-LOO are implemented in the [`loo` R package](https://github.com/stan-dev/loo), which is also available from [CRAN](https://cran.r-project.org/package=loo).
- PSIS and all Pareto $\hat{k}$ diagnostics are implemented in the [`posterior` R package](https://github.com/stan-dev/posterior), which is also available from [CRAN](https://cran.r-project.org/package=posterior).

### Python

- PSIS, PSIS-LOO, and Pareto $\hat{k}$ diagnostics are implemented in the [`ArviZ.py` package](https://python.arviz.org/en/stable/).

- In this repo 
    - 'psis.py'  - Includes the following functions in a Python (Numpy) module
     - psislw  - Pareto smoothing of the log importance weights
     - psisloo - Pareto smoothed importance sampling leave-one-out log predictive densities
     - gpdfitnew - Estimate the paramaters for the Generalized Pareto Distribution
     - gpinv - Inverse Generalised Pareto distribution function.
     - sumlogs - Sum of vector where numbers are represented by their logarithms

### Julia

- PSIS, PSIS-LOO, and Pareto $\hat{k}$ diagnostics are implemented in the [`ArviZ.jl` package](https://julia.arviz.org/ArviZ/stable/).

### Matlab/Octave

- In this repo 
    - 'psislw.m'  - Pareto smoothing of the log importance weights
    - 'psisloo.m' - Pareto smoothed importance sampling leave-one-out log predictive densities
    - 'gpdfitnew.m' - Estimate the paramaters for the Generalized Pareto Distribution
    - 'sumlogs.m' - Sum of vector where numbers are represented by their logarithms

### References

- Aki Vehtari, Andrew Gelman and Jonah Gabry (2017). Practical
  Bayesian model evaluation using leave-one-out cross-validation
  and WAIC. *Statistics and Computing*, 27(5):1413–1432. [doi:10.1007/s11222-016-9696-4](http://dx.doi.org/10.1007/s11222-016-9696-4). [arXiv preprint arXiv:1507.04544](http://arxiv.org/abs/1507.04544)
- Aki Vehtari, Daniel Simpson, Andrew Gelman, Yuling Yao, and Jonah Gabry (2024). Pareto smoothed importance sampling. *Journal of Machine Learning Research*, accepted for publication. [arXiv preprint arXiv:1507.02646](https://arxiv.org/abs/arXiv:1507.02646)
- Jin Zhang & Michael A. Stephens (2009) A New and Efficient
  Estimation Method for the Generalized Pareto Distribution,
  Technometrics, 51:3, 316-325, DOI: 10.1198/tech.2009.08017
