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
%{
y1 = y;
Fs1 = Fs;
L = 2^nextpow2(max(size(y1)));
y1_FFT = fft(y1,L);
xx = Fs1/2*linspace(0,1,L/2+1);
figure, plot(xx,abs(y1_FFT(1:L/2+1)));
%}


% Save the filtered audio (wavwrite or audiowrite)

%% Q2

clear all;close all;clc;
[y, Fs, nbits] = wavread('AnJing_4bit.wav');

% Plot the spectrum and shape of the input wave file.
subplot(2, 2, 1);
plot_sound(y, Fs);
title('origin sound');

% Add random noise to sound & plot
[h, ~] = size(y);
noise = y + rand(h, 2);

subplot(2, 2, 2);
plot_sound(noise, Fs);
audiowrite('AnJing_4bit_noise.wav', noise, Fs);

% first-order feedback loop for noise shaping
noise = noise * (2^nbits/2)+(2^nbits/2);
F_in = y*(2^nbits/2)+(2^nbits/2);
F_out = y*(2^nbits/2)+(2^nbits/2);
c = 0.9;
for j = 1:2,
    for i = 2:h,
        Ei = F_in(i-1, j) - F_out(i-1, j);
        F_out(i, j) = floor(noise(i, j) + c * Ei);
    end
end

F_out = (F_out - (2^nbits/2))/ (2^nbits/2);

subplot(2, 2, 3);
plot_sound(F_out, Fs);
audiowrite('AnJing_4bit_feedback.wav', F_out, Fs);
% sound(F_out, Fs);

% low_pass filter
[low_pass(:,1), fltr] = myFilter(y(:, 1), Fs, nbits, 'Hanning', 'low-pass', 500);
[low_pass(:,2), fltr] = myFilter(y(:, 2), Fs, nbits, 'Hanning', 'low-pass', 500);
low_pass = low_pass * 2;
audiowrite('AnJing_4bit_low_pass.wav', low_pass, Fs);
subplot(2, 2, 4);
plot_sound(low_pass, Fs);
% sound(low_pass, Fs);

