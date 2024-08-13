% Parameter file: values_calculator.m
% Help you design L and C

clear;clc;
%% Design
P_o_max = 6600;     % Watt
U_i_min = 220;      % V rms
U_i_max = 265;      % V rms
U_o = 400;          % V rms
eta = 0.98;         % Efficiency
f_s = 50e3;         % Hz, switch freq
f_g = 50;           % Hz, grid
U_ripple = 15;      % V, Output Voltage ripple

%% 
Ts = 1/f_s;
I_L_max = P_o_max/eta/U_i_min;              % A rms
Delta_I_L_max = 0.1*sqrt(2)*I_L_max;        % A rms, max current ripple
D = (U_o-sqrt(2)*U_i_min)/U_o;              % duty@U_i_min

L = sqrt(2)*U_i_min*D*Ts/Delta_I_L_max;     % Minimum Inductance
C = P_o_max/U_o/(4*pi)/f_g/U_ripple;        % Minimum Capacitance