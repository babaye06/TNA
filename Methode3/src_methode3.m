load playback_44100.mat;

input = w441(88200:132300);

figure;
subplot(4,1,1);
plot(input);
title('Signal Original');
xlabel('Echantillons');
ylabel('Amplitude');


%%1ere etape
%1ere Interpolation 
signal_upsampled1 = upsample(input,4);
Hd = butter1();
signal_filtre1 = filter(Hd, signal_upsampled1);

%1ere Decimation
signal_dowsampled1=downsample(signal_filtre1,3);

subplot(4,1,2);
plot(signal_dowsampled1);
title('Signal apres Etape1');
xlabel('Echantillons');
ylabel('Amplitude');

%%2eme etape
%2eme interpolation
signal_upsampled2 = upsample(signal_dowsampled1,8);
Hd = butter2();
signal_filtre2 = filter(Hd, signal_upsampled2);

%2eme Decimation
signal_dowsampled2=downsample(signal_filtre2,7);

subplot(4,1,3);
plot(signal_dowsampled2);
title('Signal apres Etape2');
xlabel('Echantillons');
ylabel('Amplitude');

%%3eme etape
%3eme Interpolation 
signal_upsampled3 = upsample(signal_dowsampled2,5);
Hd = butter3();
signal_filtre3 = filter(Hd, signal_upsampled3);

%3eme Decimation
signal_dowsampled3=downsample(signal_filtre3,7);

subplot(4,1,4);
plot(signal_dowsampled3);
title('Signal de sortie');
xlabel('Echantillons');
ylabel('Amplitude');

%%Calcul fft
fft_input=fft(input);
fW = linspace(0, 44100, length(fft_input));
figure;
subplot(2,1,1)
plot(fW,abs(fft_input));
title('Réponse en fréquence signal d"entré');
xlabel('Fréquence (Hz)');
ylabel('Magnitude');

fft_sortie=fft(signal_dowsampled3);
fW3 = linspace(0, 48000, length(fft_sortie));
subplot(2,1,2)
plot(fW3,abs(fft_sortie));
title('Réponse en fréquence signal de sortie');
xlabel('Fréquence (Hz)');
ylabel('Magnitude');

input_n = normalize(input);
sortie_n = normalize(signal_dowsampled3);
% Afficher les deux signaux sur la même figure
figure;
plot(input_n, 'b', 'LineWidth', 2);  % 'b' pour bleu
hold on;  % Permet de superposer les graphiques sur la même figure
plot(sortie_n, 'r', 'LineWidth', 2);  % 'r' pour rouge
hold off; % Arrête de superposer les graphiques
title('Signaux entrée (Bleu) et Sortie (Rouge)');
xlabel('Echantillon');
ylabel('Amplitude');
legend('Signal entrée SRC', 'Signal sortie SRC');
grid on;  % Ajoute une grille pour une meilleure lisibilité

