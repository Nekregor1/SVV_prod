clc
clear variables
close all

step_x = 0.01;
x = -1:step_x:1;

y1 = ones(1, length(x))*0.5;
y2 = (1-x.^2).^0.5;
y3 = (1-x.^2).^1;
y4 = (1-x.^2).^2;

k1 = integral(y1, step_x);
k2 = integral(y2, step_x);
k3 = integral(y3, step_x);
k4 = integral(y4, step_x);

y1 = y1/k1;
y2 = y2/k2;
y3 = y3/k3;
y4 = y4/k4;

figure
hold on
grid on
plot(x, y1)
plot(x, y2)
plot(x, y3)
plot(x, y4)
