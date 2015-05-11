function [out filter] = myFilter(y, Fs, nbits, wFun, type, para)

% in: input signal
% fs: sampling frequency
% N : size of FIR filter, assumed to be odd
% wFun: 'Hanning', 'Hamming', 'Blackman'
% type: 'low-pass', 'high-pass', 'bandpass', 'bandstop' 
% para: cut-off frequency or band frequencies corresponding to the filter type
%       if type is 'low-pass' or 'high-pass', para has only one element         
%       if type is 'bandpass' or 'bandstop', para is a vector of 2 elements

% 1. Normalization


% 2. Create the filter according the ideal equations in Table5.2
ans = [];
fltr = [];
if strcmp(type,'low-pass')==1, 
    f_c = para(1);
    time = [1:length(y)] / Fs;
    f_c = 0.01;
    W_c = 2 * pi * f_c;

    N = 501;
    middle = floor(N/2);
    
    for n = (-middle):1:middle,
        if n == 0
            fltr(middle+1) = 1;
        else
            fltr(n+middle+1) = sin(2 * pi * f_c * double(n)) / (pi * double(n));
        end
    end
    
   
    fltr(middle+1) = 2 * f_c;
    
    subplot(1, 3, 1);
    plot([1:length(fltr)], fltr); 
    
   %fvtool(fltr);
   %{
    for n = 1:N,
        fltr(n) = fltr(n) * (0.5 + 0.5*cos((2*pi*double(n-1))/(N)));    
    end
   %} 
    
    subplot(1, 3, 2);
    plot([1:length(fltr)], fltr); 
   
    % fltr = fir1(N, f_c);
    
    subplot(1, 3, 3);
    plot([1:length(fltr)], fltr);
    
    ans = conv(y, fltr);
    
    time = [1:length(fltr)] / Fs;
    a = max(ans);
    b = abs(min(ans));
    
    average = sum(ans) / length(ans);
    scale = 1;
    ans = ans * scale;
end

out = ans;
filter = fltr;

% 3. Create the windowing function
if strcmp(wFun,'Hanning')==1,
end


% 4. Get the realistic filter

% 5. Filter the input signal in time domain. Do not use matlab function 'conv'
