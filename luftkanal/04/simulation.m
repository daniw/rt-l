% load measurements
data_g45 = load('../03/air_step_1_5_45');
data_g90 = load('../03/air_step_1_5_90');

% define transfer functions
s = tf('s');

Kg90 = 2.39;
Kg45 = 2.37;
tau  = 0.87;
Td90 = 6.12 - 5.95;
Td45 = 4.98 - 4.81;

G90 = (Kg90 / (tau*s + 1)) * exp(-Td90*s);
G45 = (Kg45 / (tau*s + 1)) * exp(-Td45*s);

% configure simulation
a90      = 25.31;
step_90  = 5.95;
init_90  = 0;
final_90 = 4;

a45      = 26.02;
step_45  = 4.81;
init_45  = 0;
final_45 = 4;

% gererate simulation data
sim('model');

g45.signals.values = g45.signals.values + 1;
g90.signals.values = g90.signals.values + 1;

% plot data
figure(1)
subplot(2,1,1);
plot( ...
    data_g45.Zeit, data_g45.Temperatur, ...
    g45.time, g45.signals.values);
legend('Messung [°C]', 'Simulation [°C]');
xlabel('Zeit [t]');
ylabel('Temperatur [°C]');
title('Sprungantwort');
subplot(2,1,2);
plot(data_g45.Zeit, data_g45.Heizung);
legend('Heizspannung [V]');
xlabel('Zeit [s]');
ylabel('Heizspannung [V]');
title('Stellgroesse');
ylim([0 6]);

print -dpdf 'step_mod_sim_45'

figure(2)
subplot(2,1,1);
plot( ...
    data_g90.Zeit, data_g90.Temperatur, ...
    g90.time, g90.signals.values);
legend('Messung [°C]', 'Simulation [°C]');
xlabel('Zeit [t]');
ylabel('Temperatur [°C]');
title('Sprungantwort');
subplot(2,1,2);
plot(data_g90.Zeit, data_g90.Heizung);
legend('Heizspannung [V]');
xlabel('Zeit [s]');
ylabel('Heizspannung [V]');
title('Stellgroesse');
ylim([0 6]);

print -dpdf 'step_mod_sim_90'

% plot data
figure(3)
subplot(2,1,1);
plot( ...
    data_g45.Zeit, data_g45.Temperatur, ...
    g45.time, g45.signals.values);
legend('Messung [°C]', 'Simulation [°C]');
xlabel('Zeit [t]');
ylabel('Temperatur [°C]');
xlim([4 20]);
title('Sprungantwort');
subplot(2,1,2);
plot(data_g45.Zeit, data_g45.Heizung);
legend('Heizspannung [V]');
xlabel('Zeit [s]');
ylabel('Heizspannung [V]');
title('Stellgroesse');
axis([4 20 0 6]);

print -dpdf 'step_mod_sim_45_scale'

figure(4)
subplot(2,1,1);
plot( ...
    data_g90.Zeit, data_g90.Temperatur, ...
    g90.time, g90.signals.values);
legend('Messung [°C]', 'Simulation [°C]');
xlabel('Zeit [t]');
ylabel('Temperatur [°C]');
xlim([4 20]);
title('Sprungantwort');
subplot(2,1,2);
plot(data_g90.Zeit, data_g90.Heizung);
legend('Heizspannung [V]');
xlabel('Zeit [s]');
ylabel('Heizspannung [V]');
title('Stellgroesse');
axis([4 20 0 6]);

print -dpdf 'step_mod_sim_90_scale'
