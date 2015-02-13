% Load data from measurements
data_full = load('air_step_1_5_90.mat');  % valve 90Â°
data_half = load('air_step_1_5_45.mat');  % valve 45Â°

% plot the step for 'full' valve
figure(1);
subplot(2,1,1);
plot( ...
    data_full.Zeit, ...
    data_full.Temperatur);
title('Sprungantwort 1[V] -> 5[V] @ P = 90°')
xlabel('Zeit [t]');
ylabel('Temperatur [°C]');
subplot(2,1,2);
plot( ...
    data_full.Zeit, ...
    data_full.Heizung);
ylim([0 6]);
xlabel('Zeit [t]');
ylabel('Heizung [V]');
title('Stellgroesse');

print -dpdf 'step_full'

% plot the step for 'full' valve
full_start = 500;
full_stop = 1000;
figure(2);
subplot(2,1,1);
plot( ...
    data_full.Zeit, ...
    data_full.Temperatur);
axis([5 10 25 40]);
title('Sprungantwort 1[V] -> 5[V] @ P = 90°');
xlabel('Zeit [t]');
ylabel('Temperatur [°C]');
subplot(2,1,2);
plot( ...
    data_full.Zeit(full_start:full_stop), ...
    data_full.Heizung(full_start:full_stop));
axis([5 10 0 6]);
xlabel('Zeit [t]');
ylabel('Heizung [V]');
title('Stellgroesse');

print -dpdf 'step_full_scale'

% plot the data for 'half' valve
figure(3);
subplot(2,1,1);
plot( ...
    data_half.Zeit, ...
    data_half.Temperatur);
title('Sprungantwort 1[V] -> 5[V] @ P = 45°')
xlabel('Zeit [t]');
ylabel('Temperatur [°C]');
subplot(2,1,2);
plot( ...
    data_half.Zeit, ...
    data_half.Heizung);
ylim([0 6]);
xlabel('Zeit [t]');
ylabel('Heizung [V]');
title('Stellgroesse');

print -dpdf 'step_half'

% plot the data for 'half' valve
half_start = 400;
half_stop = 900;
figure(4);
subplot(2,1,1);
plot( ...
    data_half.Zeit, ...
    data_half.Temperatur);
axis([4 9 25 40]);
title('Sprungantwort 1[V] -> 5[V] @ P = 45°')
xlabel('Zeit [t]');
ylabel('Temperatur [°C]');
subplot(2,1,2);
plot( ...
    data_half.Zeit, ...
    data_half.Heizung);
axis([4 9 0 6]);
xlabel('Zeit [t]');
ylabel('Heizung [V]');
title('Stellgroesse');


print -dpdf 'step_half_scale'
