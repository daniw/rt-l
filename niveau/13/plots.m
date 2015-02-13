% run the system and simulation configuration
run('regler_siso');

% simulate the 'no-feedforward' model
sim('model_nff');

nff_r5 = r5;    % Sollgroesse
nff_u5 = u5;    % Stellgroesse
nff_h5 = h5;    % Fuellstand

nff_r7 = r7;    % Sollgroesse
nff_u7 = u7;    % Stellgroesse
nff_h7 = h7;    % Fuellstand

% simulate the 'no-feedforward' model
sim('model_ff');

ff_r5 = r5;    % Sollgroesse
ff_u5 = u5;    % Stellgroesse
ff_h5 = h5;    % Fuellstand

ff_r7 = r7;    % Sollgroesse
ff_u7 = u7;    % Stellgroesse
ff_h7 = h7;    % Fuellstand

% plot overview for 'L5'
figure(1);
subplot(2,1,1);
plot( ...
    nff_h5.time, nff_h5.signals.values, ... % Fuellstand nff
    ff_h5.time, ff_h5.signals.values, ...   % Fuellstand ff
    nff_r5.time, nff_r5.signals.values);    % Sollstand
legend( ...
    'Fuellstand ohne FF[cm]', ...
    'Fuellstand mit FF [cm]', ...
    'Sollstand [cm]');
xlabel('Zeit [t]');
ylabel('Fuellstand [cm]');
title('Sprungantwort - uebersicht');
axis([495 515 2.75 3.75]);

subplot(2,1,2);
plot( ...
    nff_u5.time, nff_u5.signals.values, ... % Pumpe nff
    ff_u5.time, ff_u5.signals.values);      % Pumpe ff
legend('Pumpenspannung ohne FF [V]', 'Pumpenspannung mit FF [V]');
xlabel('Zeit [t]');
ylabel('Pumpenspannung [V]');
axis([495 515 0 10]);

print -dpdf 'L5_step_overview_plot'

% plot overshoot for 'L5'
figure(2);
subplot(2,1,1);
plot( ...
    nff_h5.time, nff_h5.signals.values, ... % Fuellstand nff
    ff_h5.time, ff_h5.signals.values, ...   % Fuellstand ff
    r5.time, r5.signals.values);    % Sollstand
legend( ...
    'Fuellstand ohne FF [cm]', ...
    'Fuellstand mit FF [cm]', ...
    'Sollstand [cm]');
xlabel('Zeit [t]');
ylabel('Fuellstand [cm]');
title('Sprungantwort - ueberschwingen');
axis([490 690 3.495 3.51]);

subplot(2,1,2);
plot( ...
    nff_u5.time, nff_u5.signals.values, ... % Pumpe nff
    u5.time, u5.signals.values);            % Pumpe ff
legend('Pumpenspannung ohne FF [V]', 'Pumpenspannung mit FF [V]');
xlabel('Zeit [t]');
ylabel('Pumpenspannung [V]');
axis([490 690 0 10]);

print -dpdf 'L5_step_overshoot_plot'

% plot overview for 'L7'
figure(3);
subplot(2,1,1);
plot( ...
    nff_h7.time, nff_h7.signals.values, ... % Fuellstand nff
    ff_h7.time, ff_h7.signals.values, ...   % Fuellstand ff
    r7.time, r7.signals.values);    % Sollstand
legend( ...
    'Fuellstand ohne FF [cm]', ...
    'Fuellstand mit FF [cm]', ...
    'Sollstand [cm]');
xlabel('Zeit [t]');
ylabel('Fuellstand [cm]');
title('Sprungantwort - uebersicht');
axis([495 515 11.75 12.75]);

subplot(2,1,2);
plot( ...
    nff_u7.time, nff_u7.signals.values, ... % Pumpe nff
    u7.time, u7.signals.values);            % Pumpe ff
legend('Pumpenspannung ohne FF [V]', 'Pumpenspannung mit FF [V]');
xlabel('Zeit [t]');
ylabel('Pumpenspannung [V]');
axis([495 515 -1 11]);

print -dpdf 'L7_step_overview_plot'

% plot overshoot for 'L5'
figure(4);
subplot(2,1,1);
plot( ...
    nff_h7.time, nff_h7.signals.values, ... % Fuellstand nff
    ff_h7.time, ff_h7.signals.values, ...   % Fuellstand ff
    r7.time, r7.signals.values);    % Sollstand
legend( ...
    'Fuellstand ohne FF [cm]', ... 
    'Fuellstand mit FF [cm]', ... 
    'Sollstand [cm]');
xlabel('Zeit [t]');
ylabel('Fuellstand [cm]');
title('Sprungantwort - ueberschwingen');
axis([490 690 12.45 12.55]);

subplot(2,1,2);
plot( ...
    u7.time, u7.signals.values, ...     % Pumpe nff
    ff_u7.time, ff_u7.signals.values);  % Pumpe ff
legend('Pumpenspannung ohne FF [V]', 'Pumpenspannung mit FF [V]');
xlabel('Zeit [t]');
ylabel('Pumpenspannung [V]');
axis([490 690 -1 11]);

print -dpdf 'L7_step_overshoot_plot'