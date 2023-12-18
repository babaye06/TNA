% Chargement des données
[w441,fs]=audioread("44100.wav");
figure;
subplot(2,3,1)
plot(w441);
title('Réponse en temporelle wav');
xlabel('Echantillons');
ylabel('Amplitude');
W441=fft(w441);
fW = linspace(0, fs, length(W441));
subplot(2,3,4)
plot(fW,abs(W441));
title('Réponse en fréquence wav');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
% Paramètres
audioinfo("44100.wav")
L = 160;  % Facteur de suréchantillonnage
M = 147;  % Facteur de sous-échantillonnage
fs_original = fs;
fs_interpolated = fs_original * L;

% Filtre Butterworth pour l'interpolation
B80 = butter80;

% Interpolation
interpolated_signal = filter(B80, upsample(w441, L));
% Réponse temporelle de l'interpolation
subplot(2,3,2)
plot(interpolated_signal);
title('Signal Interpolé dans le domaine temporel');

% Réponse fréquentielle de l'interpolation
subplot(2,3,5)
fft_interpolated = fft(interpolated_signal);
f_interpolated = linspace(0, fs_interpolated, length(fft_interpolated));
plot(f_interpolated, abs(fft_interpolated));
title('Réponse en fréquence du Signal Interpolé');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');

% Filtre Butterworth pour la décimation
%[b_dec, a_dec] = butter(6, 1/M);
 
% Décimation
%decimated_signal = downsample(filter(b_dec, a_dec, interpolated_signal), M);
decimated_signal = downsample(filter(B80, interpolated_signal), M);
% Réponse temporelle de la décimation
subplot(2,3,3)
plot(decimated_signal);
title('Signal Décimé dans le domaine temporel');

% Réponse fréquentielle de la décimation
subplot(2,3,6)
fft_decimated = fft(decimated_signal);
f_decimated = linspace(0, fs_original, length(fft_decimated));
plot(f_decimated, abs(fft_decimated));
title('Réponse en fréquence du Signal Décimé');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');

