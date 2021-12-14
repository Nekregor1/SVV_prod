clc
clear variables
close all
warning('off','all')

lambda = 16;
L = 150;
% x = 0:0.1:50;
theta = 0:0.0001:pi/2;
u = pi*L*sin(theta)/lambda;

%% Для квадратного раскрыва равномерного распределения
lambda_05 = abs(sin(u)./u);
lambda_05(1) = 1;
lambda_05 = 20*log10(lambda_05);
count_sq_const_3dB = WidthMainLobe(lambda_05, 1, -3);
AngleMain_sq_const_3dB = 2*theta(count_sq_const_3dB)*180/pi;
koef_sq_const_3dB_avrg = 50.8787;
AngleMain_sq_const_3dB_avrg = koef_sq_const_3dB_avrg*lambda/L;

count_sq_const_0 = WidthMainLobe(lambda_05, 1, 0);
AngleMain_sq_const_0 = 2*theta(count_sq_const_0)*180/pi;
koef_sq_const_0_avrg = 114.7916;
AngleMain_sq_const_0_avrg = koef_sq_const_0_avrg*lambda/L;

count_sq_const_SL = SideLobe(lambda_05, count_sq_const_0+1);
AngleSide_sq_const_SL = theta(count_sq_const_SL)*180/pi;
koef_sq_const_SL = 82.30;
AngleSide_sq_const_SL_avrg = koef_sq_const_SL*lambda/L;


%% Для квадратного раскрыва распределения sqrt(1-x2) и круглого раскрыва равномерного распределения

lambda_1 = 2* abs(besselj(1, u))./u;
lambda_1(1) = 1;
lambda_1 = 20*log10(lambda_1);
count_cir_const_3dB = WidthMainLobe(lambda_1, 1, -3);
AngleMain_cir_const_3dB = 2*theta(count_cir_const_3dB)*180/pi;
koef_cir_const_3dB_avrg = 58.4417;
AngleMain_cir_const_3dB_avrg = koef_cir_const_3dB_avrg*lambda/L;

count_cir_const_0 = WidthMainLobe(lambda_1, 1, 0);
AngleMain_cir_const_0 = 2*theta(count_cir_const_0)*180/pi;
koef_cir_const_0_avrg = 1.22;
AngleMain_cir_const_0_avrg = 2*asin(koef_cir_const_0_avrg*lambda/L)*180/pi;

count_cir_const_SL = SideLobe(lambda_1, count_cir_const_0+1);
AngleSide_cir_const_SL = theta(count_cir_const_SL)*180/pi;
koef_cir_const_SL = 93.68;
AngleSide_cir_const_SL_avrg = koef_cir_const_SL*lambda/L;

%% Для квадратного раскрыва распределения (1-x2) и круглого раскрыва распределения sqrt(1-x2)

lambda_15 = abs(3./u./u .*(sin(u)./u - cos(u)));
lambda_15(1) = 1;
lambda_15 = 20*log10(lambda_15);
count_sq_norm_3dB = WidthMainLobe(lambda_15, 1, -3);
AngleMain_sq_norm_3dB = 2*theta(count_sq_norm_3dB)*180/pi;
koef_sq_norm_3dB_avrg = 65.8901;
AngleMain_sq_norm_3dB_avrg = koef_sq_norm_3dB_avrg*lambda/L;

count_sq_norm_0 = WidthMainLobe(lambda_15, 1, 0);
AngleMain_sq_norm_0 = 2*theta(count_sq_norm_0)*180/pi;
koef_sq_norm_0_avrg = 1.43;
AngleMain_sq_norm_0_avrg = 2*asin(koef_sq_norm_0_avrg*lambda/L)*180/pi;

count_sq_norm_SL = SideLobe(lambda_15, count_sq_norm_0+1);
AngleSide_sq_norm_SL = theta(count_sq_norm_SL)*180/pi;
koef_sq_norm_SL = 105.14;
AngleSide_sq_norm_SL_avrg = koef_sq_norm_SL*lambda/L;

%% Для круглого раскрыва распределения (1-x2)

lambda_2 = 8*abs(besselj(2,u)./u./u);
lambda_2(1) = 1;
lambda_2 = 20*log10(lambda_2);
count_cir_norm_3dB = WidthMainLobe(lambda_2, 1, -3);
AngleMain_cir_norm_3dB = 2*theta(count_cir_norm_3dB)*180/pi;
koef_cir_norm_3dB_avrg = 72.1927;
AngleMain_cir_norm_3dB_avrg = koef_cir_norm_3dB_avrg*lambda/L;

count_cir_norm_0 = WidthMainLobe(lambda_2, 1, 0);
AngleMain_cir_norm_0 = 2*theta(count_cir_norm_0)*180/pi;
koef_cir_norm_0_avrg = 1.63;
AngleMain_cir_norm_0_avrg = 2*asin(koef_cir_norm_0_avrg*lambda/L)*180/pi;

count_cir_norm_SL = SideLobe(lambda_2, count_cir_norm_0+1);
AngleSide_cir_norm_SL = theta(count_cir_norm_SL)*180/pi;
koef_cir_norm_SL = 117.29;
AngleSide_cir_norm_SL_avrg = koef_cir_norm_SL*lambda/L;

%% Для квадратного раскрыва распределения (1-x2)2

lambda_25 = 15./u./u./u .*(3*sin(u)./u./u - 3*cos(u)./u - sin(u));
lambda_25(1) = 1;
lambda_25 = 20*log10(lambda_25/lambda_25(1));
count_sq_sq_3dB = WidthMainLobe(lambda_25, 1, -3);
AngleMain_sq_sq_3dB = 2*theta(count_sq_sq_3dB)*180/pi;
koef_sq_sq_3dB_avrg = 78.1927;
AngleMain_sq_sq_3dB_avrg = koef_sq_sq_3dB_avrg*lambda/L;

count_sq_sq_0 = WidthMainLobe(lambda_25, 10, 0);
AngleMain_sq_sq_0 = 2*theta(count_sq_sq_0)*180/pi;
koef_sq_sq_0_avrg = 1.84;
AngleMain_sq_sq_0_avrg = 2*asin(koef_sq_sq_0_avrg*lambda/L)*180/pi;

count_sq_sq_SL = SideLobe(lambda_25, count_sq_sq_0+1);
AngleSide_sq_sq_SL = theta(count_sq_sq_SL)*180/pi;
koef_sq_sq_SL = 125.14;
AngleSide_sq_sq_SL_avrg = koef_sq_sq_SL*lambda/L;

%% Для круглого раскрыва распределения (1-x2)2

lambda_3 = 48*abs(besselj(3,u)./u./u./u);
lambda_3(1) = 1;
lambda_3 = 20*log10(lambda_3);
count_cir_sq_3dB = WidthMainLobe(lambda_3, 1, -3);
AngleMain_cir_sq_3dB = 2*theta(count_cir_sq_3dB)*180/pi;
koef_cir_sq_3dB_avrg = 84.7054;
AngleMain_cir_sq_3dB_avrg = koef_cir_sq_3dB_avrg*lambda/L;

count_cir_sq_0 = WidthMainLobe(lambda_3, 1, 0);
AngleMain_cir_sq_0 = 2*theta(count_cir_sq_0)*180/pi;
koef_cir_sq_0_avrg = 2.03;
AngleMain_cir_sq_0_avrg = 2*asin(koef_cir_sq_0_avrg*lambda/L)*180/pi;

count_cir_sq_SL = SideLobe(lambda_3, count_cir_sq_0+1);
AngleSide_cir_sq_SL = theta(count_cir_sq_SL)*180/pi;
koef_cir_sq_SL = 140.0;
AngleSide_cir_sq_SL_avrg = koef_cir_sq_SL*lambda/L;

%%
level3dB = -3*ones(length(theta),1);


figure
hold on
grid on
ylim([-80 0])
plot(theta*180/pi, level3dB, 'c');
plot(theta*180/pi, lambda_05, 'b');
plot(theta*180/pi, lambda_1, 'r');
plot(theta*180/pi, lambda_15, 'g');
plot(theta*180/pi, lambda_25, 'y');
plot(theta*180/pi, lambda_2, 'k');
plot(theta*180/pi, lambda_3, 'm');

