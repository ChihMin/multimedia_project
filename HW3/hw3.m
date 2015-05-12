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

% Save the filtered audio (wavwrite or audiowrite)

%% Q2

clear all;close all;clc;
[y, Fs, nbits] = wavread('AnJing_4bit.wav');

% Plot the spectrum and shape of the input wave file.
subplot(2, 2, 1);
plot_sound(y, Fs);
title('origin sound');




% first-order feedback loop for noise shaping
nbits = 8;
F_in =  floor(y*(2^nbits/2)+(2^nbits/2));
F_out = floor(y*(2^nbits/2)+(2^nbits/2));
c = 0.8;

% Add random noise to sound & plot
[h, ~] = size(y);
s = 1;

noise = F_in/s + -1 + 2 * rand(1);
subplot(2, 2, 2);
plot_sound(noise, Fs);

for j = 1:2,
    for i = 1:h,
        if i == 1,
            Ei = 0;
            F_out(i, j) = floor(noise(i, j) + c * Ei);
        else
            Ei = F_in(i-1, j)/s - F_out(i-1, j);
            F_out(i, j) = floor(noise(i, j) + c * Ei);
   
        end
    end
end

F_out =(F_out - (2^nbits/2))/(2^nbits/2);
subplot(2, 2, 3);
plot_sound(F_out, Fs);
audiowrite('AnJing_4bit_feedback.wav', F_out, Fs);


% low_pass filter
[low_pass(:,1), fltr] = myFilter(F_out(:, 1), Fs, nbits, 'Hanning', 'low-pass', 500);
[low_pass(:,2), fltr] = myFilter(F_out(:, 2), Fs, nbits, 'Hanning', 'low-pass', 500);
low_pass = low_pass * 2;
audiowrite('AnJing_4bit_low_pass.wav', low_pass, Fs);
subplot(2, 2, 4);
plot_sound(low_pass, Fs);

% sound(low_pass, Fs);

