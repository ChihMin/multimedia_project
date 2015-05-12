%% Q1

% hw3.m - 請完整寫出把三首歌都分出來的過程
clear all;close all;clc;

% Read in input audio file (wavread or audioread)
[y, Fs, nbits] = wavread('hw3_mix.wav');
[low_pass, fltr_low] = myFilter(y, Fs, nbits, 'Rectangular', 'low-pass', 441);
[high_pass, fltr_high] = myFilter(y, Fs, nbits, 'Rectangular', 'high-pass', 800);
[band_pass, fltr_band] = myFilter(y, Fs, nbits, 'Rectangular', 'band-pass', [441, 800]);

audiowrite('low_pass.wav', low_pass, Fs);
audiowrite('high_pass.wav', high_pass, Fs);
audiowrite('band_pass.wav', band_pass, Fs);
% sound(band_pass, Fs);

fvtool(fltr_low);
fvtool(fltr_high);
fvtool(fltr_band);

subplot(1, 3, 1);
plot_sound(low_pass, Fs);

subplot(1, 3, 2);
plot_sound(high_pass, Fs);

subplot(1, 3, 3);
plot_sound(band_pass, Fs);


figure;
subplot(1, 3, 1);
plot([1:length(fltr_low)], fltr_low);

subplot(1, 3, 2);
plot([1:length(fltr_high)], fltr_high);

subplot(1, 3, 3);
plot([1:length(fltr_band)], fltr_band);

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

for j = 1:2,    
    for i = 1:length(F_in),
        noise(i, j) = F_in(i, j) + -64 + 128 * rand(1);
    end
end

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

