% Load data from measurements
data_full = load('air_step_1_5_90.mat');  % valve 90°
data_half = load('air_step_1_5_45.mat');  % valve 45°

% plot the step for 'full' valve
figure(1);
subplot(2,1,1);
plot( ...
    data_full.Zeit, ...
    data_full.Temperatur);
title('Sprungantwort 1[V] -> 5[V] @ P = 90°')
subplot(2,1,2);
plot( ...
    data_full.Zeit, ...
    data_full.Heizung);

print -dpdf 'step_full'

% plot the step for 'full' valve
full_start = 500;
full_stop = 1000;
figure(1);
subplot(2,1,1);
plot( ...
    data_full.Zeit(full_start:full_stop), ...
    data_full.Temperatur(full_start:full_stop));
title('Sprungantwort 1[V] -> 5[V] @ P = 90°')
subplot(2,1,2);
plot( ...
    data_full.Zeit(full_start:full_stop), ...
    data_full.Heizung(full_start:full_stop));

print -dpdf 'step_full_scale'

% plot the data for 'half' valve
figure(2);
subplot(2,1,1);
plot( ...
    data_half.Zeit, ...
    data_half.Temperatur);
title('Sprungantwort 1[V] -> 5[V] @ P = 45°')

subplot(2,1,2);
plot( ...
    data_half.Zeit, ...
    data_half.Heizung);

print -dpdf 'step_half'

% plot the data for 'half' valve
half_start = 400;
half_stop = 900;
figure(2);
subplot(2,1,1);
plot( ...
    data_half.Zeit(half_start:half_stop), ...
    data_half.Temperatur(half_start:half_stop));
title('Sprungantwort 1[V] -> 5[V] @ P = 45°')

subplot(2,1,2);
plot( ...
    data_half.Zeit(half_start:half_stop), ...
    data_half.Heizung(half_start:half_stop));

print -dpdf 'step_half_scale'