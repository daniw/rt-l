% load data
data_l = load('dc_step_20_25_00');
data_n = load('dc_step_20_25_05');

% plot step with no load
figure(1);
subplot(2,1,1);
plot(data_n.Zeit, data_n.Geschwindigkeit);
legend('Geschwindigkeit [rpm]');
xlabel('Zeit [s]');
ylabel('Geschwindigkeit [rpm]');
title('Schrittantwort ohne Bremse');
ylim([1900 2700]);

subplot(2,1,2);
plot(data_n.Zeit, data_n.Motorspannung);
legend('Motorspannung [V]');
xlabel('Zeit [s]');
ylabel('Motorspannung [V]');
ylim([5 30]);

print -dpdf 'step_noload'

% plot step with load
figure(2);
subplot(2,1,1);
plot(data_l.Zeit, data_l.Geschwindigkeit);
legend('Geschwindigkeit [rpm]');
xlabel('Zeit [s]');
ylabel('Geschwindigkeit [rpm]');
title('Schrittantwort mit Bremse');
ylim([1900 2700]);

subplot(2,1,2);
plot(data_l.Zeit, data_l.Motorspannung);
legend('Motorspannung [V]');
xlabel('Zeit [s]');
ylabel('Motorspannung [V]');
ylim([5 30]);

print -dpdf 'step_load'