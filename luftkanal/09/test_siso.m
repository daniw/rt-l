% load the measurements
data_full = load('pi_siso_full.mat');
data_half = load('pi_siso_half.mat');

% plot a relevant segment of the 'full' measurement
figure(1)
subplot(2,1,1);
plot( ...
    data_full.Zeit(600:1400), ...
    data_full.Temperatur(600:1400), ...
    data_full.Zeit(600:1400), ...
    data_full.Solltemperatur(600:1400));
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
title('Regler mit Ventilstellung 90°');
legend('Temperatur', 'Solltemperatur');
subplot(2,1,2);
plot( ...
    data_full.Zeit(600:1400), ...
    data_full.Heizung(600:1400));
xlabel('Zeit [s]');
ylabel('Heizung [V]');
title('Regler mit Ventilstellung 90°');
legend('Heizspannung');

print '-dpdf' 'pi_siso_full_plot.pdf';

% plot a relevant segment of the 'half' measurement
figure(2)
subplot(2,1,1);
plot( ...
    data_half.Zeit(600:1400), ...
    data_half.Temperatur(600:1400), ...
    data_half.Zeit(600:1400), ...
    data_half.Solltemperatur(600:1400));
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
title('Regler mit Ventilstellung 45°');
legend('Temperatur', 'Solltemperatur');
subplot(2,1,2);
plot( ...
    data_half.Zeit(600:1400), ...
    data_half.Heizung(600:1400));
xlabel('Zeit [s]');
ylabel('Heizung [V]');
title('Regler mit Ventilstellung 45°');
legend('Heizspannung');

print '-dpdf' 'pi_siso_half_plot.pdf';

