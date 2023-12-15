load playback_44100.mat;

input = w441(1:1000);

figure;
subplot(3,1,1);
plot(input);
title('Signal Original');
xlabel('Echantillons');
ylabel('Amplitude');

signal_upsampled = upsample(input,160);
subplot(3,1,2);
plot(signal_upsampled);
title('Signal Sur-Echantilloné');
xlabel('Echantillons');
ylabel('Amplitude');

Hd = filtre1();
signal_filtre = filter(Hd, signal_upsampled);
subplot(3,1,3);
plot(signal_filtre);
title('Signal Sur-Echantilloné Filtré');
xlabel('Echantillons');
ylabel('Amplitude');

signal_filtre2 = filter(Hd, signal_filtre);
figure;
subplot(2,1,1);
plot(signal_filtre2);
title('Signal Sous-Echantillonné Filtré');
xlabel('Echantillons');
ylabel('Amplitude');

signal_downsampled = downsample(signal_filtre2,147);
subplot(2,1,2);
plot(signal_downsampled);
title('Signal Final');
xlabel('Echantillons');
ylabel('Amplitude');


