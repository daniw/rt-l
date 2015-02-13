% load the measurements
data_half = load('p_krit_half');
data_full = load('p_krit_full');
data_pid_zn_half = load('pid_zn_half');
data_pid_zn_full = load('pid_zn_full');

% plot a relevant segment of the 'full' measurement
figure(1)
subplot(2,1,1);
plot( ...
    data_full.Zeit(17800:18000), ...
    data_full.Temperatur(17800:18000));
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
title('Kritische P-Reglereinstellung fuer Ventilstellung 90°')
subplot(2,1,2)
plot( ...
    data_full.Zeit(17800:18000), ...
    data_full.Heizung(17800:18000));
xlabel('Zeit [s]');
ylabel('Heizung [V]');
title('Stellgroesse');

print -dpdf p_krit_full;

% plot a relevant segment of the 'half' measurement
figure(2)
subplot(2,1,1);
plot( ...
    data_half.Zeit(17800:18000), ...
    data_half.Temperatur(17800:18000));
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
title('Kritische P-Reglereinstellung fuer Ventilstellung 45°')
subplot(2,1,2)
plot( ...
    data_half.Zeit(17800:18000), ...
    data_half.Heizung(17800:18000));
xlabel('Zeit [s]');
ylabel('Heizung [V]');
title('Stellgroesse');

print -dpdf p_krit_half;

% plot a relevant segment of the 'full' measurement with pid_zn
figure(3)
subplot(2,1,1);
plot( ...
    data_pid_zn_full.Zeit(500:1000), ...
    data_pid_zn_full.Temperatur(500:1000));
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
title('Sprungantwort fuer PID nach Ziegler-Nichols fuer Ventilstellung 90°')
subplot(2,1,2)
plot( ...
    data_pid_zn_full.Zeit(500:1000), ...
    data_pid_zn_full.Heizung(500:1000));
xlabel('Zeit [s]');
ylabel('Heizung [V]');
title('Stellgroesse');

print -dpdf pid_zn_full;

% plot a relevant segment of the 'half' measurement with pid_zn
figure(4)
subplot(2,1,1);
plot( ...
    data_pid_zn_half.Zeit(400:1000), ...
    data_pid_zn_half.Temperatur(400:1000));
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
title('Sprungantwort fuer PID nach Ziegler-Nichols fuer Ventilstellung 45°')
subplot(2,1,2)
plot( ...
    data_pid_zn_half.Zeit(400:1000), ...
    data_pid_zn_half.Heizung(400:1000));
xlabel('Zeit [s]');
ylabel('Heizung [V]');
title('Stellgroesse');

print -dpdf pid_zn_half;
