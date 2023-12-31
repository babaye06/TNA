function Hd = butter3
%BUTTER3 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 23.2 and Signal Processing Toolbox 23.2.
% Generated on: 18-Dec-2023 17:07:06

% Butterworth Lowpass filter designed using FDESIGN.LOWPASS.

% All frequency values are in Hz.
Fs = 336000;  % Sampling Frequency

Fpass = 20000;       % Passband Frequency
Fstop = 24000;       % Stopband Frequency
Apass = 1;           % Passband Ripple (dB)
Astop = 98;          % Stopband Attenuation (dB)
match = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.lowpass(Fpass, Fstop, Apass, Astop, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);

% [EOF]
