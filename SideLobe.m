function [count_w] = SideLobe(array,count)
%SIDELOBE Summary of this function goes here
%   Detailed explanation goes here
    while array(count) < array(count+1)
        count = count + 1;
    end
    count_w = count;
end

