function plot_sound(y, Fs)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    y1 = y;
    Fs1 = Fs;
    L = 2^nextpow2(max(size(y1)));
    y1_FFT = fft(y1,L);
    xx = Fs1/2*linspace(0,1,L/2+1);
    plot(xx,abs(y1_FFT(1:L/2+1)));

end

