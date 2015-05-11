function y = my_conv(x, h);
%{
for ( i = 0; i < sampleCount; i++ )
{
    y[i] = 0;                       // set to zero before sum
    for ( j = 0; j < kernelCount; j++ )
    {
        y[i] += x[i - j] * h[j];    // convolve: multiply and accumulate
    }
}
%}

sampleCount = length(x);
kernelCount = length(h);
y = x;
for i = 1:1:sampleCount,
    y(i) = 0;
    for j = 1:1:min(i-1, kernelCount),
        y(i) = y(i) + x(i - j ) * h(j);
    end
end