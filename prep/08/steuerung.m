K = 0.05;
R = 0.5;
J = 0.00025;
a = 0.001;

tau = J*R / (K*K + a*R);
Kg = K / (K*K + a*R);

mmax = 0;
Kg_s = Kg;

sim('steuerung_mdl.slx');

subplot(2,2,1);
plot(omega.time, omega.signals.values);

mmax = 0.03;
Kg_s = Kg;

sim('steuerung_mdl.slx');

subplot(2,2,3);
plot(omega.time, omega.signals.values);

mmax = 0;
Kg_s = 0.9*Kg;

sim('steuerung_mdl.slx');

subplot(2,2,4);
plot(omega.time, omega.signals.values);

print '-dpdf' 'steuerung_plot.pdf';
