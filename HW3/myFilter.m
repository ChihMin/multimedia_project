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
    f_c = f_c / Fs;
    W_c = 2 * pi * f_c;

    N = 501;
    middle = floor(N/2);
    
    for n = (-middle):middle,
        if n == 0
            fltr(middle+1) = 1;
        else
            fltr(n+middle+1) = sin(2 * pi * f_c * double(n)) / (pi * double(n));
        end
    end
    
    fltr(middle+1) = 2 * f_c;
    ans = my_conv(y, fltr);
    
elseif strcmp(type, 'high-pass') == 1,
        f_c = para(1);
    f_c = f_c / Fs;
    W_c = 2 * pi * f_c;

    N = 501;
    middle = floor(N/2);
    
    for n = (-middle):middle,
        if n == 0
            fltr(middle+1) = 1;
        else
            fltr(n+middle+1) = -sin(2 * pi * f_c * double(n)) / (pi * double(n));
        end
    end
    
    fltr(middle+1) = 1 - 2 * f_c;
    ans = my_conv(y, fltr);
    
elseif strcmp(type, 'band-pass') == 1,
    f1 = para(1) / Fs;
    f2 = para(2) / Fs;
    N = 501;
    middle = floor(N/2);
    for n = (-middle):middle,
        if n == 0
            fltr(middle+1) = 1;
        else
            fltr(n+middle+1) = (...
                                    sin(2 * pi * f2 * double(n))...
                                   -sin(2 * pi * f1 * double(n))...
                               )/ (pi * double(n));
                                
        end
    end
    
    fltr(middle+1) = 2 * (f2 - f1);
    ans = my_conv(y, fltr);
end

out = ans;
filter = fltr;

% 3. Create the windowing function
if strcmp(wFun,'Hanning')==1,
    
end


% 4. Get the realistic filter

% 5. Filter the input signal in time domain. Do not use matlab function 'conv'
