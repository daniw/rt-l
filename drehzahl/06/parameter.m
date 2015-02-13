% Load data from measurements
data_noload = load('dc_step_5_15_00.mat');
data_load   = load('dc_step_5_15_05.mat');

% plot data
figure(1);
subplot(2,1,1);
plot(data_noload.Zeit, data_noload.Geschwindigkeit);
xlabel('Zeit [s]');
ylabel('Drehzahl [rpm]');
title('Sprungantwort 5[V] -> 15[V] ohne Last');
legend('Geschwindigkeit');

subplot(2,1,2);
plot(data_noload.Zeit,data_noload.Motorspannung*100);
xlabel('Zeit [s]');
ylabel('Motorspannung [100 V]');
legend('Motorspannung (100:1)');
ylim([400 1600]);

print '-dpdf' 'step_plot_noload.pdf'

figure(2);
subplot(2,1,1);
plot(data_load.Zeit,data_load.Geschwindigkeit);
xlabel('Zeit [s]');
ylabel('Drehzahl [rpm]');
title('Sprungantwort 5[V] -> 15[V] Wirkbelstrombremse auf 0.5');
legend('Geschwindigkeit');

subplot(2,1,2);
plot(data_load.Zeit,data_load.Motorspannung*100);
legend('Motorspannung (100:1)');
xlabel('Zeit [s]');
ylabel('Motorspannung [100 V]');
ylim([400 1600]);

print '-dpdf' 'step_plot_load.pdf'
