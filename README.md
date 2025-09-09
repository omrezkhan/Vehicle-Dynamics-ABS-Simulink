# Vehicle-Dynamics-ABS-Simulink
This repository contains a Simulink and MATLAB project for modeling and analyzing a basic Anti-lock Braking System (ABS). The project demonstrates vehicle longitudinal dynamics, wheel slip, and post-processing visualization using MATLAB scripts.

ABS_modelling/
│
├─ Matlab_script_simulink/    # MATLAB scripts and Simulink model
│   ├─ ABS_simulink_bloks.slx
│   └─ Anti_lock_breaking_modelling.m
│
├─ reports/                   # Saved plots and figures (optional)
├─ README.md                  # Project documentation

Getting Started

Open ABS_simulink_bloks.slx in MATLAB/Simulink.

Run the simulation to generate logged signals:

v → Vehicle longitudinal speed

omega → Wheel angular speed

Run the MATLAB script Anti_lock_breaking_modelling.m to:

Compute wheel linear speed

Compute slip ratio (\kappa)

Plot vehicle speed, wheel speed, and slip ratio

⚠️ Make sure signal logging is enabled in Simulink for v and omega.

