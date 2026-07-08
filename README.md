# German Tank Problem

A statistical inference project comparing classical estimators for the German Tank Problem through Monte Carlo simulation.

## Overview

The German Tank Problem is a classic estimation problem in statistics that originated from World War II. Given a random sample of serial numbers from an unknown population of tanks, the objective is to estimate the total number of units produced.

This project investigates the performance of three commonly used estimators by comparing their statistical properties across a variety of sampling scenarios. Using repeated Monte Carlo simulations, this project evaluates estimator bias, variability, and overall accuracy.

## Objectives

The main goals of this project are to:

1. Estimate the unknown population size using multiple statistical estimators
2. Compare estimator performance under different sample and population sizes
3. Investigate the bias-variance tradeoff
4. Identify the estimator with the lowest mean squared error

## Estimators

The three estimators evaluated include:

### Maximum Likelihood Estimator (MLE)

The MLE observes the population size as the largest observed serial number.

Characteristics:

- Easy to compute
- Consistent
- Downward biased

### Method of Moments (MoM) Estimator

The MoM estimator uses the sample mean to estimate the unknown population size.

Characteristics:

- Unbiased
- Larger variance
- Higher mean squared error in many settings

### Uniformly Minimum Variance Unbiased Estimator (UMVUE)

The UMVUE corrects the bias of the MLE while maintaining relatively low variability.

Characteristics:

- Unbiased
- Low variance
- Lowest mean squared error across all simulated scenarios

## Simulation Design

Estimator performance was evaluated using Monte Carlo simulation.

For each simulation:

1. A simple random sample was drawn without replacement
2. All three estimators were computed
3. The process was repeated 5,000 times

Four parameter settings were considered:

| Population Size (N) | Sample Size (n) |
|---------------------|-----------------|
| 250                 | 6               |
| 2000                | 6               |
| 250                 | 30              |
| 2000                | 30              |

For every estimator and scenario, the following metrics were computed:

- Mean estimate
- Bias
- Standard deviation
- Mean squared error (MSE)

## Results

The simulation produced several consistent findings.

1. The MLE consistenly underestimated the true population size because of its downward bias.
2. The MoM estimator was approximately unbiased but exhibited substantially greater variability.
3. The UMVUE consistently achieved the lowest MSE by balancing bias and variance.

These differences were most pronounced when only a small number of serial numbers were observed.

## Visualizations

The repository includes:

- Comparison of mean squared error across simulation scenarios
- Boxplots illustrating the sampling distributions of each estimator
- Summary tables reporting empirical bias, variance, and MSE

## Application

The observed serial numbers

43, 86, 171, 36, 177, 222

produce the following estimates:

| Estimator | Estimate |
| --------- | -------- |
| MLE       | 222      |
| MoM       | 244      |
| UMVUE     | 258      |

Based on the simulation study, the UMVUE provides the most reliable estimate as it consistently exhibits the lowest mean squared error.

## Skills Demonstrated

- R Programming
- Statistical inference
- Bias-variance analysis
- Monte Carlo simulation
- Estimation theory
- Data visualization (ggplot2)
- Statistical computing

## Packages Used

`library(tidyverse)`;
`library(ggplot2)`;
`library(knitr)`;
`library(kableExtra)`

## Possible Extensions

Potential future extensions include:

- Bayesian estimation using informative and noninformative priors
- Analytical derivation of estimator variance
- Bootstrap confidence intervals for each estimator
- Comparison with additional unbiased estimators
- Visualization of estimator performance as sample size changes

