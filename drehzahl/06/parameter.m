% Load data from measurements
data_noload = load('dc_step_5_15_00.mat');
data_load   = load('dc_step_5_15_05.mat');

% plot data
figure(1);
plot(data_noload.Zeit,data_noload.Geschwindigkeit, data_noload.Zeit,data_noload.Motorspannung*100);
xlabel('Zeit [s]');
ylabel('Drehzahl [rpm]');
title('Sprungantwort 5[V] -> 15[V] ohne Last');
legend('Geschwindigkeit', 'Motorspannung (100:1)');
print '-dpdf' 'step_plot_noload.pdf'

figure(2);
plot(data_load.Zeit,data_load.Geschwindigkeit, data_load.Zeit,data_load.Motorspannung*100);
xlabel('Zeit [s]');
ylabel('Drehzahl [rpm]');
title('Sprungantwort 5[V] -> 15[V] Wirkbelstrombremse auf 0.5');
legend('Geschwindigkeit', 'Motorspannung (100:1)');
print '-dpdf' 'step_plot_load.pdf'
