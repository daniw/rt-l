K = 0.05;
R = 0.5;
J = 0.00025;
a = 0.001;

tau = J*R / (K*K + a*R);
Kg = K / (K*K + a*R);

mmax = 0.00;

Kp = 0.1;
Ti = tau;
sim('regler_sat_mdl.slx');
subplot(2,2,1);
plot(omega.time, omega.signals.values);
title('Kp = 0.1');

Kp = 0.2;
Ti = tau;
sim('regler_sat_mdl.slx');
subplot(2,2,2);
plot(omega.time, omega.signals.values);
title('Kp = 1');

Kp = 0.5;
Ti = tau;
sim('regler_sat_mdl.slx');
subplot(2,2,3);
plot(omega.time, omega.signals.values);
title('Kp = 10');

Kp = 1;
Ti = tau;
sim('regler_sat_mdl.slx');
subplot(2,2,4);
plot(omega.time, omega.signals.values);
title('Kp = 100');

print '-dpdf' 'regler_sat_plot.pdf';
