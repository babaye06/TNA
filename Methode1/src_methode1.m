load playback_44100.mat;

input = w441(88200:100000);
%{
figure;
subplot(3,1,1);
plot(input);
title('Signal Original');
xlabel('Echantillons');
ylabel('Amplitude');
%}
%%Interpolation
%Suréchantillonnage
signal_upsampled = upsample(input,160);

%Filtrage
Hd = filtre1();
signal_filtre = filter(Hd,signal_upsampled);
%{
subplot(3,1,2);
plot(signal_filtre);
title('Signal Interpolé');
xlabel('Echantillons');
ylabel('Amplitude');
%}
%%Decimation
%Sous échantillonnage
signal_downsampled = downsample(signal_filtre,147);
%{
subplot(3,1,3);
plot(signal_downsampled);
title('Signal de sortie apres décimation');
xlabel('Echantillons');
ylabel('Amplitude');
%}

input_n = normalize(input);
sortie_n = normalize(signal_downsampled);
%{
% Afficher les deux signaux sur la même figure
figure;
plot(input_n, 'b', 'LineWidth', 2);  % 'b' pour bleu
hold on;  % Permet de superposer les graphiques sur la même figure
plot(sortie_n, 'r', 'LineWidth', 2);  % 'r' pour rouge
title('Signaux entrée (Bleu) et Sortie (Rouge)');
xlabel('Echantillon');
ylabel('Amplitude');
legend('Signal entrée SRC', 'Signal sortie SRC');
hold off;   % Ajoute une grille pour une meilleure lisibilité
%}

fft_input=fft(input);
fW = linspace(0, 44100, length(fft_input));
figure;
subplot(3,1,1)
plot(fW,abs(fft_input));
title('Réponse en fréquence signal d"entré');
xlabel('Fréquence (Hz)');
ylabel('Magnitude');


fft_iterpolation=fft(signal_filtre);
fW2 = linspace(0, 7056000, length(fft_iterpolation));
subplot(3,1,2)
plot(fW2,abs(fft_iterpolation));
title('Réponse en fréquence signal Interpolé');
xlabel('Fréquence (Hz)');
ylabel('Magnitude');

fft_sortie=fft(signal_downsampled);
fW3 = linspace(0, 480000, length(fft_sortie));
subplot(3,1,3)
plot(fW3,abs(fft_sortie));
title('Réponse en fréquence signal de sortie');
xlabel('Fréquence (Hz)');
ylabel('Magnitude');