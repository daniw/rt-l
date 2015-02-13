% Load data from measurements
data_full = load('../03/air_step_1_5_90.mat');  % valve 90�
data_half = load('../03/air_step_1_5_45.mat');  % valve 45�

% plot data
samplemin  = 500;
samplemax  = 1500;
sample   = 100;
thetamax = 35.9;
thetamin = 26.31;
theta63  = thetamin + 0.63*(thetamax - thetamin);
theta86  = thetamin + 0.86*(thetamax - thetamin);

figure(1);
subplot(2,1,1);
plot( ...
    data_full.Zeit,...
    data_full.Temperatur);
axis([5 10 25 40]);
line([samplemin/sample samplemax/sample],[thetamin thetamin], 'color', 'r');
line([samplemin/sample samplemax/sample],[thetamax thetamax], 'color', 'r');
line([samplemin/sample samplemax/sample],[theta63 theta63], 'color', 'g');
line([samplemin/sample samplemax/sample],[theta86 theta86], 'color', 'g');
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
title('Sprungantwort 1[V] -> 5[V] @ P = 90°');
legend('Temperatur', 'Tmin', 'Tmax', '63%', '86%');

subplot(2,1,2);
plot( ...
    data_full.Zeit,...
    data_full.Heizung);
axis([5 10 0 6]);

print '-dpdf' 'step_plot_full_.pdf'

samplemin  = 400;
samplemax  = 1500;
sample   = 100;
thetamax = 36.5;
thetamin = 27.02;
theta63  = thetamin + 0.63*(thetamax - thetamin);
theta86  = thetamin + 0.86*(thetamax - thetamin);

figure(2);
subplot(2,1,1);
plot( ...
    data_half.Zeit,...
    data_half.Temperatur);
axis([4 9 25 40]);
line([samplemin/sample samplemax/sample],[thetamin thetamin], 'color', 'r');
line([samplemin/sample samplemax/sample],[thetamax thetamax], 'color', 'r');
line([samplemin/sample samplemax/sample],[theta63 theta63], 'color', 'g');
line([samplemin/sample samplemax/sample],[theta86 theta86], 'color', 'g');
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
title('Sprungantwort 1[V] -> 5[V] @ P = 45°');
legend('Temperatur', 'Tmin', 'Tmax', '63%', '86%');

subplot(2,1,2);
plot( ...
    data_half.Zeit(samplemin:samplemax),...
    data_half.Heizung(samplemin:samplemax));
axis([4 9 0 6]);

print '-dpdf' 'step_plot_half_.pdf'