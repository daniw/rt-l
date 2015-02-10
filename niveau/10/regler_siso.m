% Gemessene Parameter aus Versuchen
Kp5  = 4.8; % [cm/V] Kp für einen Arbeitspunkt von 5 [V]
tau5 = 70;  % [s] Zeitkonstante für einen Arbeitspunkt von 5 [V]
Kp7  = 5.8; % [cm/V] Kp für einen Arbeitspunkt von 7 [V]
tau7 = 98;  % [s] Zeitkonstante für einen Arbeitspunkt von 7 [V]

% Übertragungsfunktion
s = tf('s');
G5 = Kp5/(tau5*s+1);
G7 = Kp7/(tau7*s+1);

% Regler aus sisotool
C5 = 14.8423*(s+0.02313) / s;
C7 = 19.5962*(s+0.01437) / s;
