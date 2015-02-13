s = tf('s');

% Uebertragungsfunktionen
Kg_full = (35.9-26.31) / (5-1);
Kg_half = (36.5-27.02) / (5-1);

t1_full = 0.87;
t1_half = 0.87;

td_full = 0.17;
td_half = 0.17;

G1_full = Kg_full / (t1_full * s + 1) * exp(-td_full * s);
G1_half = Kg_half / (t1_half * s + 1) * exp(-td_half * s);

G_Arr(:,:,1) = G1_full;
G_Arr(:,:,2) = G1_half;

F_full = 1/Kg_full ;%* exp(-td_full * s);
F_half = 1/Kg_half ;%* exp(-td_half * s);

% sisotool
C = 1.2429 * (s + 0.03578) / s;

sim('vorsteuerung_mdl.slx');

figure(1)
subplot(2,1,1);
plot(theta_soll.time,theta_soll.signals.values, ...
    theta_full.time,theta_full.signals.values, ...
    theta_half.time,theta_half.signals.values);
title('Sprungantwort Regler');
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
legend('Solltemperatur', 'Sprungantwort 90°', 'Sprungantwort 45°');
subplot(2,1,2);
plot(u_full.time,u_full.signals.values, ...
    u_half.time,u_half.signals.values);
title('Stellgroesse');
xlabel('Zeit [s]');
ylabel('Heizspannung [V]');
legend('Heizleistung 90°', 'Heizleistung 45°');

print '-dpdf' 'vorsteuerung_plot.pdf'
