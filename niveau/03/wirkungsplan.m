% Konstanten
g = 9.81;       % [m/s^2]   Erdbeschleunigung
AT = 0.0154;    % [m^2]     Querschnittsfläche der Tanks
AV = 5e-5;      % [m^2]     Querschnittsfläche Ventile zwischen Tanks
AL = 5e-5;      % [m^2]     Querschnittsfläche Lecköffnungen

% Schrittspezifikation
Q1_steptime   = 0;      % [s]       Zeitpunkt des Schritts
Q1_stepinit   = 0;      % [mltr/s]  Wert vor Schritt
Q1_stepvalue  = 0;      % [mltr/s]  Wert nach Schritt
Q2_steptime   = 0;      % [s]       Zeitpunkt des Schritts
Q2_stepinit   = 0;      % [mltr/s]  Wert vor Schritt
Q2_stepvalue  = 0;      % [mltr/s]  Wert nach Schritt
a1_steptime   = 0;      % [s]       Zeitpunkt des Schritts
a1_stepinit   = 0;      % [1]       Wert vor Schritt
a1_stepvalue  = 0;      % [1]       Wert nach Schritt
a2_steptime   = 0;      % [s]       Zeitpunkt des Schritts
a2_stepinit   = 0;      % [1]       Wert vor Schritt
a2_stepvalue  = 0;      % [1]       Wert nach Schritt
a3_steptime   = 0;      % [s]       Zeitpunkt des Schritts
a3_stepinit   = 0;      % [1]       Wert vor Schritt
a3_stepvalue  = 0;      % [1]       Wert nach Schritt
a22_steptime  = 0;      % [s]       Zeitpunkt des Schritts
a22_stepinit  = 0;      % [1]       Wert vor Schritt
a22_stepvalue = 0;      % [1]       Wert nach Schritt
a32_steptime  = 0;      % [s]       Zeitpunkt des Schritts
a32_stepinit  = 0;      % [1]       Wert vor Schritt
a32_stepvalue = 0;      % [1]       Wert nach Schritt
a13_steptime  = 0;      % [s]       Zeitpunkt des Schritts
a13_stepinit  = 0;      % [1]       Wert vor Schritt
a13_stepvalue = 0;      % [1]       Wert nach Schritt

% Startwerte
h1_initvalue = 0;       % [m]       Startwert für Füllhöhe h1
h2_initvalue = 0;       % [m]       Startwert für Füllhöhe h2
h3_initvalue = 0;       % [m]       Startwert für Füllhöhe h2

% Simulationen

% Leere Simulation als Dummy
sim('wirkungsplan_mdl.slx');
figure(1);
plot(h1.time,h1.signals.values, h2.time,h2.signals.values, h3.time,h3.signals.values);
xlabel('Time [s]'):
ylabel('Hoehe [s]');
legend('h1', 'h2', 'h3');
title('Simulation Wirkungsplan');
print '-dpdf' 'sim_0.pdf';

