clc
clear variables
close all
warning('off','all')

lambda = 16;
L = 150;
theta = 0:0.0001:pi/2;
u = pi*L*sin(theta)/lambda;

%% Для квадратного раскрыва равномерного распределения
SquareConst.DN = abs(sin(u)./u);
SquareConst.DN(1) = 1;
SquareConst.DN = 20*log10(SquareConst.DN);
SquareConst.count_3dB = WidthMainLobe(SquareConst.DN, 1, -3);
SquareConst.MainAngle_3dB = 2*theta(SquareConst.count_3dB)*180/pi;
SquareConst.koef_3dB_avrg = 50.8787;
SquareConst.MainAngle_3dB_avrg = SquareConst.koef_3dB_avrg * lambda /L;

SquareConst.count_0 = WidthMainLobe(SquareConst.DN, 1, 0);
SquareConst.MainAngle_0 = 2*theta(SquareConst.count_0)*180/pi;
SquareConst.koef_0_avrg = 114.7916;
SquareConst.MainAngle_0_avrg = SquareConst.koef_0_avrg*lambda/L;

SquareConst.count_SL = SideLobe(SquareConst.DN, SquareConst.count_0 + 1);
SquareConst.SL = theta(SquareConst.count_SL)*180/pi;
SquareConst.koef_SL = 82.30;
SquareConst.SL_avrg = SquareConst.koef_SL*lambda/L;

%% Для квадратного раскрыва распределения sqrt(1-x2) и круглого раскрыва равномерного распределения

SquareSqrt.DN = 2* abs(besselj(1, u))./u;
SquareSqrt.DN(1) = 1;
SquareSqrt.DN = 20*log10(SquareSqrt.DN);
SquareSqrt.count_3dB = WidthMainLobe(SquareSqrt.DN, 1, -3);
SquareSqrt.MainAngle_3dB = 2*theta(SquareSqrt.count_3dB)*180/pi;
SquareSqrt.koef_3dB_avrg = 58.4417;
SquareSqrt.MainAngle_3dB_avrg = SquareSqrt.koef_3dB_avrg * lambda /L;

SquareSqrt.count_0 = WidthMainLobe(SquareSqrt.DN, 1, 0);
SquareSqrt.MainAngle_0 = 2*theta(SquareSqrt.count_0)*180/pi;
SquareSqrt.koef_0_avrg = 1.22;
SquareSqrt.MainAngle_0_avrg =2*asin(SquareSqrt.koef_0_avrg*lambda/L)*180/pi;

SquareSqrt.count_SL = SideLobe(SquareSqrt.DN, SquareSqrt.count_0 + 1);
SquareSqrt.SL = theta(SquareSqrt.count_SL)*180/pi;
SquareSqrt.koef_SL = 93.68;
SquareSqrt.SL_avrg = SquareSqrt.koef_SL*lambda/L;

CircleConst = SquareSqrt;

%% Для квадратного раскрыва распределения (1-x2) и круглого раскрыва распределения sqrt(1-x2)

SquareNorm.DN = abs(3./u./u .*(sin(u)./u - cos(u)));
SquareNorm.DN(1) = 1;
SquareNorm.DN = 20*log10(SquareNorm.DN);
SquareNorm.count_3dB = WidthMainLobe(SquareNorm.DN, 1, -3);
SquareNorm.MainAngle_3dB = 2*theta(SquareNorm.count_3dB)*180/pi;
SquareNorm.koef_3dB_avrg = 65.8901;
SquareNorm.MainAngle_3dB_avrg = SquareNorm.koef_3dB_avrg * lambda /L;

SquareNorm.count_0 = WidthMainLobe(SquareNorm.DN, 1, 0);
SquareNorm.MainAngle_0 = 2*theta(SquareNorm.count_0)*180/pi;
SquareNorm.koef_0_avrg = 1.43;
SquareNorm.MainAngle_0_avrg =2*asin(SquareNorm.koef_0_avrg*lambda/L)*180/pi;

SquareNorm.count_SL = SideLobe(SquareNorm.DN, SquareNorm.count_0 + 1);
SquareNorm.SL = theta(SquareNorm.count_SL)*180/pi;
SquareNorm.koef_SL = 105.14;
SquareNorm.SL_avrg = SquareNorm.koef_SL*lambda/L;

CircleSqrt = SquareNorm;

%% Для круглого раскрыва распределения (1-x2)

CircleNorm.DN = 8*abs(besselj(2,u)./u./u);
CircleNorm.DN(1) = 1;
CircleNorm.DN = 20*log10(CircleNorm.DN);
CircleNorm.count_3dB = WidthMainLobe(CircleNorm.DN, 1, -3);
CircleNorm.MainAngle_3dB = 2*theta(CircleNorm.count_3dB)*180/pi;
CircleNorm.koef_3dB_avrg = 72.1927;
CircleNorm.MainAngle_3dB_avrg = CircleNorm.koef_3dB_avrg * lambda /L;

CircleNorm.count_0 = WidthMainLobe(CircleNorm.DN, 1, 0);
CircleNorm.MainAngle_0 = 2*theta(CircleNorm.count_0)*180/pi;
CircleNorm.koef_0_avrg = 1.63;
CircleNorm.MainAngle_0_avrg =2*asin(CircleNorm.koef_0_avrg*lambda/L)*180/pi;

CircleNorm.count_SL = SideLobe(CircleNorm.DN, CircleNorm.count_0 + 1);
CircleNorm.SL = theta(CircleNorm.count_SL)*180/pi;
CircleNorm.koef_SL = 117.29;
CircleNorm.SL_avrg = CircleNorm.koef_SL*lambda/L;

%% Для квадратного раскрыва распределения (1-x2)2

SquareSquare.DN = 15./u./u./u .*(3*sin(u)./u./u - 3*cos(u)./u - sin(u));
SquareSquare.DN(1) = 1;
SquareSquare.DN = 20*log10(SquareSquare.DN);
SquareSquare.count_3dB = WidthMainLobe(SquareSquare.DN, 1, -3);
SquareSquare.MainAngle_3dB = 2*theta(SquareSquare.count_3dB)*180/pi;
SquareSquare.koef_3dB_avrg = 78.1927;
SquareSquare.MainAngle_3dB_avrg = SquareSquare.koef_3dB_avrg * lambda /L;

SquareSquare.count_0 = WidthMainLobe(SquareSquare.DN, 10, 0);
SquareSquare.MainAngle_0 = 2*theta(SquareSquare.count_0)*180/pi;
SquareSquare.koef_0_avrg = 1.84;
SquareSquare.MainAngle_0_avrg =2*asin(SquareSquare.koef_0_avrg*lambda/L)*180/pi;

SquareSquare.count_SL = SideLobe(SquareSquare.DN, SquareSquare.count_0 + 1);
SquareSquare.SL = theta(SquareSquare.count_SL)*180/pi;
SquareSquare.koef_SL = 125.14;
SquareSquare.SL_avrg = SquareSquare.koef_SL*lambda/L;

%% Для круглого раскрыва распределения (1-x2)2

CircleSquare.DN = 48*abs(besselj(3,u)./u./u./u);
CircleSquare.DN(1) = 1;
CircleSquare.DN = 20*log10(CircleSquare.DN);
CircleSquare.count_3dB = WidthMainLobe(CircleSquare.DN, 1, -3);
CircleSquare.MainAngle_3dB = 2*theta(CircleSquare.count_3dB)*180/pi;
CircleSquare.koef_3dB_avrg = 84.7054;
CircleSquare.MainAngle_3dB_avrg = CircleSquare.koef_3dB_avrg * lambda /L;

CircleSquare.count_0 = WidthMainLobe(CircleSquare.DN, 1, 0);
CircleSquare.MainAngle_0 = 2*theta(CircleSquare.count_0)*180/pi;
CircleSquare.koef_0_avrg = 2.03;
CircleSquare.MainAngle_0_avrg =2*asin(CircleSquare.koef_0_avrg*lambda/L)*180/pi;

CircleSquare.count_SL = SideLobe(CircleSquare.DN, CircleSquare.count_0 + 1);
CircleSquare.SL = theta(CircleSquare.count_SL)*180/pi;
CircleSquare.koef_SL = 140.0;
CircleSquare.SL_avrg = CircleSquare.koef_SL*lambda/L;

%%
level3dB = -3*ones(length(theta),1);


figure
hold on
grid on
ylim([-80 0])
plot(theta*180/pi, level3dB, 'c');
plot(theta*180/pi, SquareConst.DN, 'b');
plot(theta*180/pi, SquareSqrt.DN, 'r');
plot(theta*180/pi, SquareNorm.DN, 'g');
plot(theta*180/pi, SquareSquare.DN, 'y');
plot(theta*180/pi, CircleNorm.DN, 'k');
plot(theta*180/pi, CircleSquare.DN, 'm');

