# Alpha-Centauri-CUTE-CubeSat-LASP
(Repository under development)
This repository contains some my basic sections from the analysis for the Alpha Centauri Project
I have hadded some important techniques I learnt during the Analysis for the project such as the Lomb Scargle periodogram

## Analysis Overview

This project analyzes time-series photometric data of Alpha Centauri to study
periodic variability associated with stellar rotation and activity.

### 1. Input Time-Series Data
The analysis uses photometric light-curve data of Alpha Centauri obtained from
public observational sources. The data consist of brightness measurements as a
function of time.

### 2. Data Cleaning and Preprocessing
The raw time series is preprocessed to:
- Remove missing or invalid data points
- Normalize the flux measurements
- Detrend long-term variations not related to rotation

### 3. Period Analysis
To identify periodic signals in the light curve:
- Frequency-domain methods such as Fourier analysis and/or Lomb–Scargle
  periodograms are applied
- Dominant periodicities corresponding to stellar rotation are identified

### 4. Signal Validation
The robustness of the detected periods is assessed by:
- Comparing results across different methods
- Inspecting folded light curves
- Checking consistency with known rotation periods reported in the literature

### 5. Interpretation
The extracted periods are interpreted in the context of stellar rotation and
magnetic activity, with an emphasis on understanding variability in nearby
solar-type stars like Alpha Centauri.

