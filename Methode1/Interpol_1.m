function Hd = Interpol_1
%INTERPOL_1 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 23.2 and Signal Processing Toolbox 23.2.
% Generated on: 15-Dec-2023 09:26:39

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in kHz.
Fs = 44.1;  % Sampling Frequency

Fpass = 20;                % Passband Frequency
Fstop = 22;                % Stopband Frequency
Dpass = 0.057501127785;    % Passband Ripple
Dstop = 1.5848931925e-05;  % Stopband Attenuation
dens  = 20;                % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
