% load the measurement data
data_a = load('niveau_pid_messung_G5');
data_b = load('niveau_pid_messung_G7');

% plot the measurements for G5
figure(1);
subplot(2,1,1);
plot( ...
    data_a.Zeit, data_a.NiveauTank2, ...
    data_a.Zeit, data_a.SollNiveauTank2);
legend('Füllstand', 'Sollniveau');
xlim([125 145]);
xlabel('Zeit [t]');
ylabel('Füllstand [cm]');
title('Sprungantwort');
subplot(2,1,2);
plot(data_a.Zeit, data_a.PumpeRechts);
axis([125 145 4 11]);
xlabel('Zeit [t]');
ylabel('Pumpenspannung [V]');

print -dpdf 'step_g5'

% plot the measurements for G5
figure(2);
subplot(2,1,1);
plot( ...
    data_b.Zeit, data_b.NiveauTank2, ...
    data_b.Zeit, data_b.SollNiveauTank2);
legend('Füllstand', 'Sollniveau');
xlim([0 25]);
xlabel('Zeit [t]');
ylabel('Füllstand [cm]');
title('Sprungantwort G7');
subplot(2,1,2);
plot(data_b.Zeit, data_b.PumpeRechts);
axis([0 25 4 11]);
xlabel('Zeit [t]');
ylabel('Pumpenspannung [V]');

print -dpdf 'step_g7'