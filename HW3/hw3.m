%% Q1

% hw3.m - 請完整寫出把三首歌都分出來的過程
clear all;close all;clc;

% Read in input audio file (wavread or audioread)
[y, Fs, nbits] = wavread('hw3_mix.wav');
[Ans, fltr] = myFilter(y, Fs, nbits, 'Hanning', 'low-pass', 441);
audiowrite('low_pass.wav', Ans, Fs);
sound(Ans, Fs);
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