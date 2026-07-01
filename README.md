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
