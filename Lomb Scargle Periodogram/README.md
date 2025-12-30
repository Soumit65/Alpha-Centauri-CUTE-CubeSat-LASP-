# Lomb–Scargle Period Analysis

This repository contains a Python notebook that performs Lomb–Scargle
periodogram analysis on unevenly sampled time-series data, commonly used
in astronomy for detecting periodic signals.

## Methodology
1. Convert observation times into numerical days
2. Define physically meaningful frequency limits
3. Compute Lomb–Scargle periodogram using Astropy
4. Identify dominant period
5. Fit and visualize the best sinusoidal model

## Requirements
- numpy
- matplotlib
- astropy

## Usage
Open `Lomb_Scargle.ipynb` and run all cells sequentially.
