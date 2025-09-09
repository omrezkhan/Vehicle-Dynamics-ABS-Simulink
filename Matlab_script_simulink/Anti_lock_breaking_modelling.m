% Anti lock beaking system script
%% Vehicle & Wheel Dynamics - State-Space ABS Model
clc; clear; close all;

%%
% Vehicle parameters
    m = 1500;      % Vehicle mass [kg]
    Iw = 20;       % Wheel rotational inertia [kg*m^2]
    Rw = 0.3;      % Wheel radius [m]
    g = 9.81;      % Gravitational acceleration [m/s^2]
    
    % Environmental / aerodynamic parameters
    rho = 1.225;   % Air density [kg/m^3]
    Cd = 0.32;     % Aerodynamic drag coefficient (dimensionless)
    Af = 2.2;      % Frontal area of the vehicle [m^2]
    Cr = 0.015;    % Rolling resistance coefficient (dimensionless)
    
    % Tire-road interaction
    mu = 0.8;      % Tire-road friction coefficient (dimensionless)
    Fz = m*g/4;    % Normal load per wheel assuming 4 wheels [N]


%% Convert wheel angular speed to linear speed
 %=================== ABS Post-Processing Script ===================

% 1️⃣ Run the Simulink model
simOut = sim('ABS_simulink_bloks');  % Replace with your model name

% 2️⃣ Extract logged signals from SimulationOutput
v_ts = simOut.logsout.get('v');       
omega_ts = simOut.logsout.get('omega');

% Convert to numeric vectors and remove extra dimensions
v_data = squeeze(v_ts.Values.Data);      
omega_data = squeeze(omega_ts.Values.Data); 

% Time vector
time = squeeze(v_ts.Values.Time);       

% 3️⃣ Compute wheel linear speed
Rw = 0.3;  % Wheel radius [m]
wheel_linear_speed = Rw * omega_data;

% 4️⃣ Compute slip ratio
kappa = 1 - wheel_linear_speed ./ max(v_data, 0.1); % Avoid division by zero

% 5️⃣ Plot Vehicle & Wheel Speeds
figure;
plot(time, v_data,'b','LineWidth',1.5); hold on;
plot(time, wheel_linear_speed,'r','LineWidth',1.5);
xlabel('Time [s]');
ylabel('Speed [m/s]');
legend('Vehicle Speed v','Wheel Linear Speed Rw*ω');
grid on;
title('Vehicle & Wheel Speeds');

% 6️⃣ Plot Slip Ratio
figure;
plot(time, kappa,'k','LineWidth',1.5);
xlabel('Time [s]');
ylabel('Slip Ratio \kappa');
grid on;
title('ABS Slip Ratio');







