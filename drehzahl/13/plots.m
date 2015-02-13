% load configuration and simulate system
run('simulation');

sim('saturation_mdl');

figure(1)
subplot(2,1,1);
plot( ...
    o_r.time, o_r.signals.values, ...       % input
    o1_nff.time, o1_nff.signals.values, ... % no feedforward
    o1_ff.time, o1_ff.signals.values);      % feedforward
xlabel('Zeit [s]');
ylabel('Drehzahl [rpm]');
title('Sprungantwort');
legend('Solldrehzahl', 'Drehzahl ohne FF', 'Drehzahl mit FF');
xlim([0 5]);
subplot(2,1,2);
plot( ...
    u1_nff.time, u1_nff.signals.values, ... % no feedforward
    u1_ff.time, u1_ff.signals.values);      % feedforward
xlabel('Zeit [s]');
ylabel('Motorspannung [V]');
title('Stellgroesse');
legend('Motorspannung ohne FF', 'Motorspannung mit FF');
xlim([0 5]);

print '-dpdf' 'step_noload.pdf';

figure(2)
subplot(2,1,1);
plot( ...
    o_r.time, o_r.signals.values, ...       % input
    o2_nff.time, o2_nff.signals.values, ... % no feedforward
    o2_ff.time, o2_ff.signals.values);      % feedforward
xlabel('Zeit [s]');
ylabel('Drehzahl [rpm]');
title('Sprungantwort');
legend('Solldrehzahl', 'Drehzahl ohne FF', 'Drehzahl mit FF');
xlim([0 5]);
subplot(2,1,2);
plot( ...
    u2_nff.time, u2_nff.signals.values, ... % no feedforward
    u2_ff.time, u2_ff.signals.values);      % feedforward
xlabel('Zeit [s]');
ylabel('Motorspannung [V]');
title('Stellgroesse');
legend('Motorspannung ohne FF', 'Motorspannung mit FF');
xlim([0 5]);

print '-dpdf' 'step_load.pdf';