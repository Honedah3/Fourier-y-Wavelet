%% configuración inicial
clc;
close all;
clear all; 
%%carga de datos
carga1= load ('mnsst.txt');
carga2= load ('datos.txt');
mnsst = carga1(:,2);
mei = carga2 (:,2);
L = 408;     %Muestras
Fs = 13;     %frecuencia de muestreo
T = 1/Fs;    %Periodo de Muestreo
t=(0:L-1)*T; %vector de tiempo
%% Fourier
Y = fft(mnsst);
I = imag(Y);
R = abs (Y);
P2 = abs(Y/L);
P1 = P2 (1: L/2+1);
P1 (2 : end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

X = fft(mei);
P4 = abs(X/L);
P3 = P4 (1: L/2+1);
P3 (2 : end-1) = 2*P3(2:end-1);

figure (1);
plot(f,P1);
grid on;
title('Fourier MNSST)')
xlabel('f (Años)')
ylabel('|P1(Amplitud)|')

figure(2);
plot(f,P3);
title('Fourier MEI)')
%% espectros
Y = fft(mnsst);
figure(3);
plot (fftshift(abs(Y)));
grid on;
title('Espectro de Amplitud')
figure (4);
plot (fftshift(imag(Y)));
title('Espectro de Fase')

X = fft(mei);
figure(5);
plot (fftshift(abs(X)));
grid on;
title('Espectro de Amplitud')
figure (6);
plot (fftshift(imag(X)));
title('Espectro de Fase')
%% Wavelet

%% coherence Wavelete
figure(7);
wcoherence(mnsst,mei);
grid on;
title(['Coherence Wavelet'] );
%% cross wavelet
figure(8);
grid on;
xwt(mnsst,mei);
title(['Cross Wavelet'] );
%%

 