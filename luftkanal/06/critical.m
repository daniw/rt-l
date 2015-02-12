% load the measurements
data_half = load('p_krit_half');
data_full = load('p_krit_full');

% plot a relevant segment of the 'full' measurement
figure(1)
subplot(2,1,1);
plot( ...
    data_full.Zeit(17800:18000), ...
    data_full.Temperatur(17800:18000));
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
title('Kritische P-Reglereinstellung für Ventilstellung 90°')
subplot(2,1,2)
plot( ...
    data_full.Zeit(17800:18000), ...
    data_full.Heizung(17800:18000));
xlabel('Zeit [s]');
ylabel('Heizung [V]');

print -dpdf p_krit_full;

% plot a relevant segment of the 'half' measurement
figure(1)
subplot(2,1,1);
plot( ...
    data_half.Zeit(17800:18000), ...
    data_half.Temperatur(17800:18000));
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
title('Kritische P-Reglereinstellung für Ventilstellung 45°')
subplot(2,1,2)
plot( ...
    data_half.Zeit(17800:18000), ...
    data_half.Heizung(17800:18000));
xlabel('Zeit [s]');
ylabel('Heizung [V]');

print -dpdf p_krit_half;