load playback_44100.mat;

input = w441(1:1000);

figure;
subplot(4,1,1);
plot(input);
title('Signal Original');
xlabel('Echantillons');
ylabel('Amplitude');

%%1ere etape
%1ere Interpolation 
signal_upsampled1 = upsample(input,4);
Hd = f_itr_1();
signal_filtre1 = filter(Hd, signal_upsampled1);

%1ere Decimation
signal_dowsampled1=downsample(signal_filtre1,3);

%%2eme etape
%2eme interpolation
signal_upsampled2 = upsample(signal_dowsampled1,8);
Hd = f_itr_2();
signal_filtre2 = filter(Hd, signal_upsampled2);

%2eme Decimation
signal_dowsampled2=downsample(signal_filtre2,7);

%%3eme etape
%3eme Interpolation 
signal_upsampled3 = upsample(signal_dowsampled2,5);
Hd = f_itr_3();
signal_filtre3 = filter(Hd, signal_upsampled3);
%3eme Decimation
signal_dowsampled3=downsample(signal_filtre3,7);



% Afficher les deux signaux sur la même figure
figure;
plot(signal_filtre1, 'b', 'LineWidth', 2);  % 'b' pour bleu
hold on;  % Permet de superposer les graphiques sur la même figure
plot(signal_dowsampled3, 'r', 'LineWidth', 2);  % 'r' pour rouge
hold off; % Arrête de superposer les graphiques
title('Signaux entrée (Bleu) et Sortie (Sortie)');
xlabel('Echantillon');
ylabel('Amplitude');
legend('Signal entrée SRC', 'Signal sortie SRC');
grid on;  % Ajoute une grille pour une meilleure lisibilité
