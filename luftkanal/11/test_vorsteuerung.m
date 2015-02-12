% load the measurements
data_full = load('vorsteuerung_step_full.mat');
data_half = load('vorsteuerung_step_half.mat');

% plot a relevant segment of the 'full' measurement
figure(1)
subplot(2,1,1);
plot( ...
    data_full.Zeit, ...
    data_full.Temperatur, ...
    data_full.Zeit, ...
    data_full.Solltemperatur);
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
title('Regler mit Ventilstellung 90°');
legend('Temperatur', 'Solltemperatur');
subplot(2,1,2);
plot( ...
    data_full.Zeit, ...
    data_full.Heizung);
xlabel('Zeit [s]');
ylabel('Heizung [V]');
title('Stellgrösse');
legend('Heizspannung');

print '-dpdf' 'vorsteuerung_full_plot.pdf';

% plot a relevant segment of the 'half' measurement
figure(2)
subplot(2,1,1);
plot( ...
    data_half.Zeit, ...
    data_half.Temperatur, ...
    data_half.Zeit, ...
    data_half.Solltemperatur);
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
title('Regler mit Ventilstellung 45°');
legend('Temperatur', 'Solltemperatur');
subplot(2,1,2);
plot( ...
    data_half.Zeit, ...
    data_half.Heizung);
xlabel('Zeit [s]');
ylabel('Heizung [V]');
title('Stellgrösse');
legend('Heizspannung');

print '-dpdf' 'vorsteuerung_half_plot.pdf';

