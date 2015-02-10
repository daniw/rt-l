% Gemessene Parameter aus Versuchen
Kp5  = 4.8; % [cm/V] Kp für einen Arbeitspunkt von 5 [V]
tau5 = 70;  % [s] Zeitkonstante für einen Arbeitspunkt von 5 [V]
Kp7  = 5.8; % [cm/V] Kp für einen Arbeitspunkt von 7 [V]
tau7 = 98;  % [s] Zeitkonstante für einen Arbeitspunkt von 7 [V]

% Übertragungsfunktion
s = tf('s');
G5 = Kp5/(tau5*s+1);
G7 = Kp7/(tau7*s+1);

% Schrittantwort simuliert
[valsim5,time5] = step(G5*0.5);
[valsim7,time7] = step(G7*1);

% Import gemessene Schrittantwort 5 -> 5.5 [V]
load('../06/niveau_step_5_55.mat');

% Plot
figure(1);
plot(time5+6,valsim5+2.1, Zeit, NiveauTank2);
xlabel('Zeit [s]');
ylabel('Füllstand [cm]');
legend('Simulation', 'Messung');
title('Parameter Test Arbeitspunkt 5[V]');
print '-dpdf' 'parameter_test_5.pdf';


% Import gemessene Schrittantwort 7 -> 8 [V]
load('../06/niveau_step_7_8.mat');

% Plot
figure(2);
plot(time7+1.5,valsim7+11.8, Zeit, NiveauTank2);
xlabel('Zeit [s]');
ylabel('Füllstand [cm]');
legend('Simulation', 'Messung');
title('Parameter Test Arbeitspunkt 7[V]');
print '-dpdf' 'parameter_test_7.pdf';

