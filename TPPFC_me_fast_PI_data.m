%% Parameter file: TPPFC_me_fast_PI_data.m
clear;clc;
%% Model Parameters
Ts_Power = 50e-9;     % SPS Model sample time (s)
Ro = 24.24;           % 6.6-kW nominal load (Ohms)
Ron_FET = 60e-3;      % FET resistance (ohms)
Ron_Diode = 50e-3;    % FET resistance (ohms)
Vf = 0.6;             % Diode forward voltage (V)

      

%% PFC Data
Vnom_ac = 240;          % Nominal AC voltage (V)
Vnom_dc = 400;          % Nominal DC Voltage (V)
Fnom = 50;              % System frequency (Hz)
L_PFC = 400e-6;         % PFC Inductance (H)
RL_PFC = 40e-3;         % Inductance resistance (Ohm)
C_PFC = 2240e-6;        % Capacitance (F)

%% PFC Control System Parameters
Ts_Control= 10e-6;  % Control system time (s)
Fsw= 50e3;         % PWM Switching frequency (Hz)
DT_PFC=400e-9;

% Current Regulator (PI):
f_ci = 5e3;                     % Current Loop Cut-off freq (Hz)
K_ip = 2*pi*f_ci*L_PFC/sqrt(2)/Vnom_dc;
T_ii =  1/(2*pi*f_ci);
K_ii = K_ip/T_ii;

% Voltage Regulator (PI): 
f_cv = 10;                     % Voltage Loop Cut-off freq (Hz)

T_vi = 1/(2*pi*f_cv);
K_vp = 2*pi*f_cv*C_PFC*Vnom_dc/Vnom_ac;

K_vi = K_vp/T_vi;
