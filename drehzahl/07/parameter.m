% Load data from measurements
data_noload = load('../06/dc_step_5_15_00.mat');
data_load   = load('../06/dc_step_5_15_05.mat');

% plot data
figure(1);
plot(data_noload.Zeit(300:440),data_noload.Geschwindigkeit(300:440), data_noload.Zeit(300:440),data_noload.Motorspannung(300:440)*100);
xlabel('Zeit [s]');
ylabel('Drehzahl [rpm]');
title('Sprungantwort 5[V] -> 15[V] ohne Last');
legend('Geschwindigkeit', 'Motorspannung (100:1)');
line([3 4.4],[1065 1065]);
line([3 4.4],[3520 3520]);
line([3.33 3.722],[1065 3520]);
print '-dpdf' 'step_plot_noload.pdf'

figure(2);
plot(data_load.Zeit(360:420),data_load.Geschwindigkeit(360:420), data_load.Zeit(360:420),data_load.Motorspannung(360:420)*100);
xlabel('Zeit [s]');
ylabel('Drehzahl [rpm]');
title('Sprungantwort 5[V] -> 15[V] Wirkbelstrombremse auf 0.5');
legend('Geschwindigkeit', 'Motorspannung (100:1)');
line([3.6 4.2],[640 640]);
line([3.6 4.2],[2145 2145]);
line([3.83 4.118],[640 2145]);
print '-dpdf' 'step_plot_load.pdf'

t0_noload   = 3.25;
ttu_noload  = 3.33;
ttg_noload  = 3.722;
t0_load     = 3.76;
ttu_load    = 3.83;
ttg_load    = 4.118;

tu_noload   = ttu_noload - t0_noload;
tg_noload   = ttg_noload - ttu_noload;
tu_load     = ttu_load - t0_load;
tg_load     = ttg_load - ttu_load;

t1_noload   = tg_noload / 2.27;
t1_load     = tg_load / 2.27;

td_noload   = tu_noload - tg_noload / 9.65;
td_load     = tu_load - tg_load / 9.65;

Kp_noload   = 245.5;
Kp_load     = 150.5;

s = tf('s');
G11 = Kp_noload / (t1_noload * s + 1)^2 * exp(-td_noload*s);
G12 = Kp_load / (t1_load * s + 1)^2 * exp(-td_load*s);

[valsim_noload,time_noload] = step(G11*10);
[valsim_load,time_load] = step(G12*10);

figure(3);
plot(time_noload+3.25,valsim_noload+1065, data_noload.Zeit,data_noload.Geschwindigkeit);
xlabel('Zeit [s]');
ylabel('Geschwindigkeit [rpm]');
legend('Simulation', 'Messung');
title('Parameter Test ohne Last');
print '-dpdf' 'parameter_test_noload.pdf';

figure(4);
plot(time_load+3.76,valsim_load+640, data_load.Zeit,data_load.Geschwindigkeit);
xlabel('Zeit [s]');
ylabel('Geschwindigkeit [rpm]');
legend('Simulation', 'Messung');
title('Parameter Test bei Wirkbelstrombremse auf 0.5');
print '-dpdf' 'parameter_test_load.pdf';

