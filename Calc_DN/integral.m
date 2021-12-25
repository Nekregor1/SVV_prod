function [intg] = integral(func, step_x)
%INTEGRAL Summary of this function goes here
%   Detailed explanation goes here
    intg = 0;
    n = length(func);
    for count=2:n
        intg = intg + (func(count) + func(count-1))/2*step_x;
    end
end

