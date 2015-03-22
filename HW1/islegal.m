function [ output_args ] = islegal(i, j, h, w)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

    output_args = (i >= 1) && ( i <= h ) && ( j >= 1 ) && ( j <= w ); 
end

