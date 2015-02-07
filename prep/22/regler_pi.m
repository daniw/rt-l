K = 0.05;
R = 0.5;
J = 0.00025;
a = 0.001;

tau = J*R / (K*K + a*R);
Kg = K / (K*K + a*R);

mmax = 0.00;

Kp = 10
Ti = tau

sim('regler_pi_mdl.slx');
plot(omega.time, omega.signals.values);
title('');

print '-dpdf' 'regler_pi_plot.pdf';
