% load the measurements
data_half = load('p_krit_half');
data_full = load('p_krit_full');
data_pid_zn_half = load('pid_zn_half');
data_pid_zn_full = load('pid_zn_full');

% plot full critical
figure(1)
subplot(2,1,1);
plot(data_full.Zeit, data_full.Temperatur);
axis([178 180 29 30]);
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
title('Kritische P-Reglereinstellung fuer Ventilstellung 90°')
subplot(2,1,2)
plot(data_full.Zeit, data_full.Heizung);
axis([178 180 0.5 3]);
xlabel('Zeit [s]');
ylabel('Heizung [V]');
title('Stellgroesse');

print -dpdf p_krit_full_plot;

% plot half critical
figure(2)
subplot(2,1,1);
plot(data_half.Zeit, data_half.Temperatur);
axis([178 180 28.5 30.5]);
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
title('Kritische P-Reglereinstellung fuer Ventilstellung 45°')
subplot(2,1,2)
plot(data_half.Zeit, data_half.Heizung);
axis([178 180 -1 5]);
xlabel('Zeit [s]');
ylabel('Heizung [V]');
title('Stellgroesse');

print -dpdf p_krit_half_plot;

% plot PID full
figure(3)
subplot(2,1,1);
plot( ...
    data_pid_zn_full.Zeit, data_pid_zn_full.Temperatur,  ...
    data_pid_zn_full.Zeit, data_pid_zn_full.Solltemperatur);
axis([5 10 28 39]);
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
legend('Sprungantwort', 'Sollgroesse');
title('Sprungantwort mit PID-Regler nach Ziegler-Nichols fuer P = 90°')
subplot(2,1,2)
plot(data_pid_zn_full.Zeit, data_pid_zn_full.Heizung);
axis([5 10 0 11]);
xlabel('Zeit [s]');
ylabel('Heizung [V]');
title('Stellgroesse');

print -dpdf 'pid_zn_full_plot'

% plot PID half
figure(4)
subplot(2,1,1);
plot( ...
    data_pid_zn_half.Zeit, data_pid_zn_half.Temperatur, ...
    data_pid_zn_half.Zeit, data_pid_zn_half.Solltemperatur);
axis([4 9 28 39]);
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
legend('Sprungantwort', 'Sollgroesse');
title('Sprungantwort mit PID-Regler nach Ziegler-Nichols fuer P = 45°')
subplot(2,1,2)
plot(data_pid_zn_half.Zeit, data_pid_zn_half.Heizung);
axis([4 9 0 11]);
xlabel('Zeit [s]');
ylabel('Heizung [V]');
title('Stellgroesse');

print -dpdf 'pid_zn_half_plot'
