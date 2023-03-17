clc, clear variables
%% example

% % measurements
% dist_cm = [4:2:20, 25:5:80].' - 1.5;
% dist_mV = [1770 2350 2345 2310 2120 1840 1610 1430 1290 1040 870 760 680 610 575 545 520 506 480 470 500].';

% measurements
dist_cm = [ 2.5:1.25:10, ...
           12.5:2.50:35, ...
           40.0:5.00:80].';
dist_mV = [2720, 2790, 3090, 3080, 2840, 2500, 2270, 1870, 1700, 1460, ...
           1260, 1120, 1050,  950,  900,  850,  770,  710,  660,  520, ...
            490,  460,  520,  550,  490,  570].';

% use only relevant data for the fit
idx_fit = dist_cm > 8 & dist_cm < 60;

% define a symbolic Ansatz
ft = fittype('a / (x + b)')
f1 = fit(dist_mV(idx_fit), dist_cm(idx_fit), ft)

figure(1)
subplot(131)
plot(dist_cm, dist_mV, 'x-'), grid on
axis([0 max(dist_cm) 0 max(dist_mV)])
xlabel('Distance (cm)'), ylabel('Voltage (mV)')
subplot(132)
plot(dist_mV, dist_cm, 'x-'), grid on, hold on
plot(dist_mV, f1(dist_mV), 'x-'), hold off
ylabel('Distance (cm)'), xlabel('Voltage (mV)')
legend('Measured', 'Fitted Fcn.')
axis([0 max(dist_mV) 0 max(dist_cm)])
subplot(133)
plot(dist_cm, dist_cm, 'bx-'), grid on, hold on
plot(dist_cm, f1(dist_mV), 'rx-'), grid on, hold off
axis([0  max(dist_cm) 0 max(dist_cm)])
xlabel('Distanz (cm)'), ylabel('Fit (cm)')
