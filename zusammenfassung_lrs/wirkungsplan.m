% Parameter des Modells
Cp  = 1260;     % [J/m^3/°C]
V   = 75;       % [m^3]
S   = 60;       % [m^2]
K   = 10;       % [W/m^2/°C]

% Übertragungsfunktionen des Prozesses
G_Tr_Ph = tf([1],[Cp*V K*S]);

G_Tr_Tu = tf([K*S],[Cp*V K*S]);

% Zeitkonstante
Kr  = 1 / (K * S)       % [s]
tau = Cp * V / (K * S)  % [°C/W]

% Schrittantwort Übertragungsfunktion
%step(G_Tr_Ph);
step(G_Tr_Ph*1000);
title('Modell Raum Sprungantwort');
print '-dpdf' 'sprungantwort_plot.pdf';

% Simulation Wirkungsplan
Ks = 0;
Kv = 0;
sim('wirkungsplan_mdl.slx');
plot(Tr.time, Tr.signals.values);
title('Modell Raum');
print '-dpdf' 'wirkungsplan_plot.pdf';

% Simulation Steuerung
sim('steuerung_raum_mdl.slx');
figure(1)
plot(Tr.time, Tr.signals.values, Tref.time, Tref.signals.values);
xlabel('Time [s]');
ylabel('[°C]');
legend('Regelgrösse', 'Referenzgrösse');
title('Steuerung Raum');
print '-dpdf' 'steuerung_raum_plot.pdf';

figure(2)
plot(Ph.time, Ph.signals.values);
xlabel('Time [s]');
ylabel('[W]');
title('Heizleistung');
print '-dpdf' 'steuerung_raum_heizleistung_plot.pdf';

% Regler
Kp = 1/Kr;
Ti = 0.667*tau;
Td = 0.167*tau;
N  = 10;

P = tf([Kp], [1]);
I = tf([Kp/Ti], [1 0]);
D = tf([Kp*Td 0], [Td/N 1]);
PID_TF = P + I + D;

% Simulation Regelung
sim('regelung_raum_mdl.slx');
figure(3)
plot(Tr.time, Tr.signals.values, Tref.time, Tref.signals.values);
xlabel('Time [s]');
ylabel('[°C]');
legend('Regelgrösse', 'Referenzgrösse');
title('Regelung Raum');
print '-dpdf' 'regelung_raum_plot.pdf';

figure(4)
plot(Ph.time, Ph.signals.values);
xlabel('Time [s]');
ylabel('[W]');
title('Heizleistung');
print '-dpdf' 'regelung_raum_heizleistung_plot.pdf';

% Simulation Regelung Siso Tool
PID_TF = C;
sim('regelung_raum_mdl.slx');
figure(5)
plot(Tr.time, Tr.signals.values, Tref.time, Tref.signals.values);
xlabel('Time [s]');
ylabel('[°C]');
legend('Regelgrösse', 'Referenzgrösse');
title('Regelung Raum');
print '-dpdf' 'regelung_raum_siso_plot.pdf';

figure(6)
plot(Ph.time, Ph.signals.values);
xlabel('Time [s]');
ylabel('[W]');
title('Heizleistung');
print '-dpdf' 'regelung_raum_siso_heizleistung_plot.pdf';

% Simulation Regelung Siso Tool mit Störgrössenaufschaltung
Ks = -1 / Kr;
sim('regelung_raum_mdl.slx');
figure(7)
plot(Tr.time, Tr.signals.values, Tref.time, Tref.signals.values);
xlabel('Time [s]');
ylabel('[°C]');
legend('Regelgrösse', 'Referenzgrösse');
title('Regelung Raum');
print '-dpdf' 'regelung_raum_siso_s_plot.pdf';

figure(8)
plot(Ph.time, Ph.signals.values);
xlabel('Time [s]');
ylabel('[W]');
title('Heizleistung');
print '-dpdf' 'regelung_raum_siso_s_heizleistung_plot.pdf';

% Simulation Regelung Siso Tool mit Störgrössenaufschaltung und Vorsteuerung
Kv = 1/Kr;
sim('regelung_raum_mdl.slx');
figure(9)
plot(Tr.time, Tr.signals.values, Tref.time, Tref.signals.values);
xlabel('Time [s]');
ylabel('[°C]');
legend('Regelgrösse', 'Referenzgrösse');
title('Regelung Raum');
print '-dpdf' 'regelung_raum_siso_sv_plot.pdf';

figure(10)
plot(Ph.time, Ph.signals.values);
xlabel('Time [s]');
ylabel('[W]');
title('Heizleistung');
print '-dpdf' 'regelung_raum_siso_sv_heizleistung_plot.pdf';
