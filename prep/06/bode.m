K = 0.05;
R = 0.5;
J = 0.00025;
a = 0.001;

tau = J*R / (K*K + a*R);
Kg = K / (K*K + a*R);

s = tf('s');

P1 = Kg / (tau * s + 1);
P2 = -(R/K) * Kg / (tau * s + 1);

asymp(P1);

print '-dpdf' 'asymp_plot.pdf';
