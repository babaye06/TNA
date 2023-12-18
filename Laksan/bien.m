% Chargement des données
[w441, fs] = audioread("44100.wav");
figure;

% ... (Partie du code inchangée pour l'analyse du signal d'origine)

% Paramètres
L1 = 8; L2 = 4; L3 = 5;  % Facteurs de suréchantillonnage
M1 = 7; M2 = 7; M3 = 3;  % Facteurs de sous-échantillonnage
fs_original = fs;

% Filtres Butterworth pour l'interpolation
B80_1 = butter80;
B80_2 = butter80;
B80_3 = butter80;

% Interpolations en cascade
interpolated_signal_1 = filter(B80_1, upsample(w441, L1));
interpolated_signal_2 = filter(B80_2, upsample(interpolated_signal_1, L2));
interpolated_signal_3 = filter(B80_3, upsample(interpolated_signal_2, L3));

% Réponses temporelles des interpolations
figure(1)
subplot(3,1,1);
plot(interpolated_signal_1);
title('Signal Interpolé (L1)');
subplot(3,1,2);
plot(interpolated_signal_2);
title('Signal Interpolé (L2)');
subplot(3,1,3);
plot(interpolated_signal_3);
title('Signal Interpolé (L3)');

% Réponses fréquentielles des interpolations
figure(2)
fft_interpolated_1 = fft(interpolated_signal_1);
f_interpolated_1 = linspace(0, fs * L1, length(fft_interpolated_1));
subplot(3,1,1);
plot(f_interpolated_1, abs(fft_interpolated_1));
title('Réponse en fréquence (L1)');

fft_interpolated_2 = fft(interpolated_signal_2);
f_interpolated_2 = linspace(0, fs * L1 * L2, length(fft_interpolated_2));
subplot(3,1,2);
plot(f_interpolated_2, abs(fft_interpolated_2));
title('Réponse en fréquence (L2)');

fft_interpolated_3 = fft(interpolated_signal_3);
f_interpolated_3 = linspace(0, fs * L1 * L2 * L3, length(fft_interpolated_3));
subplot(3,1,3);
plot(f_interpolated_3, abs(fft_interpolated_3));
title('Réponse en fréquence (L3)');
fup = fs * L1 * L2 * L3
% Décimateurs en cascade
decimated_signal_1 = downsample(filter(B80_1, interpolated_signal_3), M1);
decimated_signal_2 = downsample(filter(B80_2, decimated_signal_1), M2);
decimated_signal_3 = downsample(filter(B80_3, decimated_signal_2), M3);

% Réponses temporelles des décimateurs
figure(3)
subplot(3,1,1);
plot(decimated_signal_1);
title('Signal Décimé (M1)');
subplot(3,1,2);
plot(decimated_signal_2);
title('Signal Décimé (M2)');
subplot(3,1,3);
plot(decimated_signal_3);
title('Signal Décimé (M3)');

% Réponses fréquentielles des décimateurs
figure(4)
fft_decimated_1 = fft(decimated_signal_1);
f_decimated_1 = linspace(0, fup / M1, length(fft_decimated_1));
subplot(3,1,1);
plot(f_decimated_1, abs(fft_decimated_1));
title('Réponse en fréquence (M1)');

fft_decimated_2 = fft(decimated_signal_2);
f_decimated_2 = linspace(0, fup / (M1 * M2), length(fft_decimated_2));
subplot(3,1,2);
plot(f_decimated_2, abs(fft_decimated_2));
title('Réponse en fréquence (M2)');

fft_decimated_3 = fft(decimated_signal_3);
f_decimated_3 = linspace(0, fup / (M1 * M2 * M3), length(fft_decimated_3));
subplot(3,1,3);
plot(f_decimated_3, abs(fft_decimated_3));
title('Réponse en fréquence (M3)');
