%% Q1

% hw3.m - 請完整寫出把三首歌都分出來的過程
clear all;close all;clc;

% Read in input audio file (wavread or audioread)
[y, Fs, nbits] = wavread('hw3_mix.wav');
[low_pass, fltr] = myFilter(y, Fs, nbits, 'Hanning', 'low-pass', 441);
[high_pass, fltr] = myFilter(y, Fs, nbits, 'Hanning', 'high-pass', 800);
[band_pass, fltr] = myFilter(y, Fs, nbits, 'Hanning', 'band-pass', [441, 800]);

audiowrite('low_pass.wav', low_pass, Fs);
audiowrite('high_pass.wav', high_pass, Fs);
audiowrite('band_pass.wav', band_pass, Fs);
sound(band_pass, Fs);
fvtool(fltr);

% Filtering

% Frequency analysis - you can use the following code to plot spectrum
% y1: signal, Fs1: sampling rate
y1 = y;
Fs1 = Fs;
L = 2^nextpow2(max(size(y1)));
y1_FFT = fft(y1,L);
xx = Fs1/2*linspace(0,1,L/2+1);
figure, plot(xx,abs(y1_FFT(1:L/2+1)));



% Save the filtered audio (wavwrite or audiowrite)

%%