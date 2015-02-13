% run the system and simulation configuration
run('regler_siso');

% simulate
sim('model');

% plot overview for 'L5'
figure(1);
subplot(2,1,1);
plot( ...
    h5.time, h5.signals.values, ... % Fuellstand
    r5.time, r5.signals.values);    % Sollstand
legend('Fuellstand [cm]', 'Sollstand [cm]');
xlabel('Zeit [t]');
ylabel('Fuellstand [cm]');
title('Sprungantwort - uebersicht');
axis([495 515 2.75 3.75]);

subplot(2,1,2);
plot( ...
    u5.time, u5.signals.values);    % Pumpe
legend('Pumpenspannung [V]');
xlabel('Zeit [t]');
ylabel('Pumpenspannung [V]');
axis([495 515 0 10]);

print -dpdf 'L5_step_overview_plot'

% plot overshoot for 'L5'
figure(2);
subplot(2,1,1);
plot( ...
    h5.time, h5.signals.values, ... % Fuellstand
    r5.time, r5.signals.values);    % Sollstand
legend('Fuellstand [cm]', 'Sollstand [cm]');
xlabel('Zeit [t]');
ylabel('Fuellstand [cm]');
title('Sprungantwort - ueberschwingen');
axis([490 690 3.495 3.505]);

subplot(2,1,2);
plot( ...
    u5.time, u5.signals.values);    % Pumpe
legend('Pumpenspannung [V]');
xlabel('Zeit [t]');
ylabel('Pumpenspannung [V]');
axis([490 690 0 10]);

print -dpdf 'L5_step_overshoot_plot'

% plot overview for 'L7'
figure(3);
subplot(2,1,1);
plot( ...
    h7.time, h7.signals.values, ... % Fuellstand
    r7.time, r7.signals.values);    % Sollstand
legend('Fuellstand [cm]', 'Sollstand [cm]');
xlabel('Zeit [t]');
ylabel('Fuellstand [cm]');
title('Sprungantwort - uebersicht');
axis([495 515 11.75 12.75]);

subplot(2,1,2);
plot( ...
    u7.time, u7.signals.values);    % Pumpe
legend('Pumpenspannung [V]');
xlabel('Zeit [t]');
ylabel('Pumpenspannung [V]');
axis([495 515 -1 11]);

print -dpdf 'L7_step_overview_plot'

% plot overshoot for 'L5'
figure(4);
subplot(2,1,1);
plot( ...
    h7.time, h7.signals.values, ... % Fuellstand
    r7.time, r7.signals.values);    % Sollstand
legend('Fuellstand [cm]', 'Sollstand [cm]');
xlabel('Zeit [t]');
ylabel('Fuellstand [cm]');
title('Sprungantwort - ueberschwingen');
axis([490 690 12.45 12.55]);

subplot(2,1,2);
plot( ...
    u7.time, u7.signals.values);    % Pumpe
legend('Pumpenspannung [V]');
xlabel('Zeit [t]');
ylabel('Pumpenspannung [V]');
axis([490 690 -1 11]);

print -dpdf 'L7_step_overshoot_plot'