s = tf('s');

% Übertragungsfunktionen
Kg_full = (35.9-26.31) / (5-1);
Kg_half = (36.5-27.02) / (5-1);

t1_full = 0.87;
t1_half = 0.87;

td_full = 0.17;
td_half = 0.17;

G1_full = Kg_full / (t1_full * s + 1) * exp(-td_full * s);
G1_half = Kg_half / (t1_half * s + 1) * exp(-td_half * s);

G_Arr(:,:,1) = G1_full;
G_Arr(:,:,2) = G1_half;

% sisotool
%sisotool(G_Arr);
C = 1.0414 * (s + 1.243) / s;
