K = 0.05;
R = 0.5;
J = 0.00025;
a = 0.001;

tau = J*R / (K*K + a*R);
Kg = K / (K*K + a*R);

sim('transfer_mdl.slx');

plot(omega.time, omega.signals.values);

print '-dpdf' 'transfer_plot.pdf';
