% load the measurement data
g5 = load('niveau_pid_step_G5');
g7 = load('niveau_pid_step_G7');

% plot the data for 'G5'
figure(1);
plot(g5.Zeit, g5.NiveauTank2, g5.Zeit, g5.SollNiveauTank2);
legend('Fuellstand [cm]', 'Sollstand [cm]');
xlabel('Zeit [s]');
ylabel('Fuellstand [cm]');
title('Sprungantwort bei G5');

print -dpdf 'step_g5_plot'

% plot the data for 'G5'
figure(2);
plot(g7.Zeit, g7.NiveauTank2, g7.Zeit, g7.SollNiveauTank2);
legend('Fuellstand [cm]', 'Sollstand [cm]');
xlabel('Zeit [s]');
ylabel('Fuellstand [cm]');
title('Sprungantwort bei G7');

print -dpdf 'step_g7_plot'