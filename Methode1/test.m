load playback_44100.mat;

input = w441(1:220500);

sound(input, 44100);  % Assurez-vous que fs est le taux d'échantillonnage correct

figure;
subplot(2,1,1);
plot(input);
title('Signal Original');
xlabel('Echantillons');
ylabel('Amplitude');

signal_normalise = normalize(input);

subplot(2,1,2);
plot(input);
title('Signal normalisé');
xlabel('Echantillons');
ylabel('Amplitude');

sound(signal_normalise, 44100);  % Assurez-vous que fs est le taux d'échantillonnage correct

figure;
plot(input, 'b', 'LineWidth', 2);  % 'b' pour bleu
hold on;  % Permet de superposer les graphiques sur la même figure
plot(signal_normalise, 'r', 'LineWidth', 2);  % 'r' pour rouge
title('Signaux entrée (Bleu) et Sortie (Sortie)');
xlabel('Echantillon');
ylabel('Amplitude');
legend('Signal entrée SRC', 'Signal sortie SRC');
hold off; % Arrête de superposer les graphiques


%audiowrite('signal_audio.wav', partie_audio, 44100);

%[w441,fs]=audioread("signal_audio.wav");
