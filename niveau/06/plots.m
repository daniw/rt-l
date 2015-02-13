% load the measurement data for the 'low' and 'high' bias
data_low = load('niveau_step_5_55');
data_high = load('niveau_step_7_8');

% plot the 'low' step
figure(1)
subplot(2,1,1);
plot(data_low.Zeit, data_low.NiveauTank2);
xlabel('Zeit [t]');
ylabel('Füllstand [cm]');
title('Sprungantwort 5[V] -> 5.5[V]')
subplot(2,1,2);
plot(data_low.Zeit, data_low.PumpeRechts);
title('Stellgroesse');
xlabel('Zeit [t]');
ylabel('Pumpenspannung [V]');
ylim([4.5 6]);

print -dpdf 'step_5_55_plot'

% plot the 'high' step
figure(2)
subplot(2,1,1);
plot(data_high.Zeit, data_high.NiveauTank2);
xlabel('Zeit [t]');
ylabel('Füllstand [cm]');
title('Sprungantwort 7[V] -> 8[V]')
subplot(2,1,2);
plot(data_high.Zeit, data_high.PumpeRechts);
title('Stellgroesse');
xlabel('Zeit [t]');
ylabel('Pumpenspannung [V]');
ylim([6 9]);

print -dpdf 'step_7_8_plot'
