% Konstanten
R  = 7.19;          % [Ohm]
L  = 1.04e-3;       % [H]
Kw = 1/250;         % [rpm/V]
J  = 44e-7 + 1e-5;  % [kgm^2]
a  = 0.001;         % [Nms]
Ml = 0;             % [Nm]

sim('wirkungsplan_mdl.slx');

figure(1)
subplot(2,1,1);
plot(omega.time, omega.signals.values);
xlabel('Zeit [s]');
ylabel('Drehzahl [rpm]');
title('Sprungantwort');
subplot(2,1,2);
plot(u.time, u.signals.values);
xlabel('Zeit [s]');
ylabel('Drehzahl [rpm]');
title('Motorspannung [V]');

print '-dpdf' 'wirkungsplan_plot.pdf';
