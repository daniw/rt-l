s = tf('s');

% Übertragungsfunktionen
t1_noload_man   = 0.1727*0.85;
t1_load_man     = 0.1269*0.8;

td_noload_man   = 0.035;    % Keine Totzeit
td_load_man     = 0.045;    % Keine Totzeit

Kg_noload_man   = 245.5;
Kg_load_man     = 150.5;

G11_man = Kg_noload_man / (t1_noload_man * s + 1)^2 * exp(-td_noload_man*s);
G12_man = Kg_load_man / (t1_load_man * s + 1)^2 * exp(-td_load_man*s);

G_Arr(:,:,1) = G11_man;
G_Arr(:,:,2) = G12_man;

% sisotool
%sisotool(G_Arr);
C_PI = 0.0040628 * (s + 5.23) / s;

sim('saturation_mdl.slx');

figure(1)
subplot(2,1,1);
plot(omega_r.time, omega_r.signals.values, omega1.time, omega1.signals.values, omega2.time, omega2.signals.values);
xlabel('Zeit [s]');
ylabel('Drehzahl [rpm]');
title('Sprungantwort');
legend('Solldrehzahl', 'Drehzahl mit G1', 'Drehzahl mit G2');
subplot(2,1,2);
plot(u1.time, u1.signals.values, u2.time, u2.signals.values);
xlabel('Zeit [s]');
ylabel('Motorspannung [V]');
title('Stellgroesse');
legend('Motorspannung mit G1', 'Motorspannung mit G2');

print '-dpdf' 'saturation_plot.pdf';
