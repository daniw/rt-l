% Load data from measurements
data_full = load('../03/air_step_1_5_90.mat');  % valve 90°
data_half = load('../03/air_step_1_5_45.mat');  % valve 45°

% plot data
samplemin  = 500;
samplemax  = 1500;
sample   = 100;
thetamax = 35.9;
thetamin = 26.31;
theta63  = thetamin + 0.63*(thetamax - thetamin);
theta86  = thetamin + 0.86*(thetamax - thetamin);
figure(1);
plot(data_full.Zeit(samplemin:samplemax),...
     data_full.Temperatur(samplemin:samplemax),... 
     data_full.Zeit(samplemin:samplemax),...
     data_full.Heizung(samplemin:samplemax));
line([samplemin/sample samplemax/sample],[thetamin thetamin]);
line([samplemin/sample samplemax/sample],[thetamax thetamax]);
line([samplemin/sample samplemax/sample],[theta63 theta63]);
line([samplemin/sample samplemax/sample],[theta86 theta86]);
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
title('Sprungantwort 1[V] -> 5[V] @ P = 90°');
legend('Temperatur', 'Heizspannung [V]');
print '-dpdf' 'step_plot_full.pdf'

samplemin  = 1;
samplemax  = 2000;
sample   = 100;
thetamax = 36.5;
thetamin = 27.02;
theta63  = thetamin + 0.63*(thetamax - thetamin);
theta86  = thetamin + 0.86*(thetamax - thetamin);
figure(2);
plot(data_half.Zeit(samplemin:samplemax),...
     data_half.Temperatur(samplemin:samplemax),... 
     data_half.Zeit(samplemin:samplemax),...
     data_half.Heizung(samplemin:samplemax));
line([samplemin/sample samplemax/sample],[thetamin thetamin]);
line([samplemin/sample samplemax/sample],[thetamax thetamax]);
line([samplemin/sample samplemax/sample],[theta63 theta63]);
line([samplemin/sample samplemax/sample],[theta86 theta86]);
xlabel('Zeit [s]');
ylabel('Temperatur [°C]');
title('Sprungantwort 1[V] -> 5[V] @ P = 45°');
legend('Temperatur', 'Heizspannung [V]');
print '-dpdf' 'step_plot_half.pdf'

s = tf('s');
Kgfull  = (35.9-26.31) / (5-1);
Kghalf  = (36.5-27.02) / (5-1);
taufull = 0.87;
tauhalf = 0.87;
ttfull  = 0.17;
tthalf  = 0.17;
Gfull = Kgfull / (taufull * s + 1) * exp(-ttfull * s);
Ghalf = Kghalf / (tauhalf * s + 1) * exp(-tthalf * s);
[valfull, timefull] = step(Gfull*4);
[valhalf, timehalf] = step(Ghalf*4);

figure(3)
plot(timefull+5.95,valfull+26.31, data_full.Zeit,data_full.Temperatur);

figure(4)
plot(timehalf+4.81,valhalf+27.02, data_half.Zeit,data_half.Temperatur);
