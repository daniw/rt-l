K = 0.05;
R = 0.5;
J = 0.00025;
a = 0.001;

tau = J*R / (K*K + a*R);
Kg = K / (K*K + a*R);

mmax = 0.00;

Kp = 0.1
sim('regler_mdl.slx');
subplot(2,2,1);
plot(omega.time, omega.signals.values);

Kp = 1
sim('regler_mdl.slx');
subplot(2,2,2);
plot(omega.time, omega.signals.values);

Kp = 10
sim('regler_mdl.slx');
subplot(2,2,3);
plot(omega.time, omega.signals.values);

Kp = 100
sim('regler_mdl.slx');
subplot(2,2,4);
plot(omega.time, omega.signals.values);

print '-dpdf' 'regler_plot.pdf';
