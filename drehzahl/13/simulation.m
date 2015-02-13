s = tf('s');

% Uebertragungsfunktionen
t1_noload_man   = 0.1727*0.85;
t1_load_man     = 0.1269*0.8;

td_noload_man   = 0.035;    % Keine Totzeit
td_load_man     = 0.045;    % Keine Totzeit

Kg_noload_man   = 245.5;
Kg_load_man     = 150.5;

G11_man = Kg_noload_man / (t1_noload_man * s + 1)^2 * exp(-td_noload_man*s);
G12_man = Kg_load_man / (t1_load_man * s + 1)^2 * exp(-td_load_man*s);

G_Arr(:,:,1) = G11_man;
G_Arr(:,:,2) = G12_man;

% sisotool
%sisotool(G_Arr);
C_PI = 0.0040628 * (s + 5.23) / s;