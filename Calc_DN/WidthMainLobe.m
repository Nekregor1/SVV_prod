function [count_w] = WidthMainLobe(array,count, level)
%WIDTHMAINLOBE Summary of this function goes here
%   Detailed explanation goes here
if level == -3
    while array(count) > level
        count = count + 1;
    end
    count_w = count;
else
    while array(count) > array(count+1)
        count = count + 1;
    end
    count_w = count;
end   
end

