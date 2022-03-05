%% Load the data
% First we load the two time series into the matrices d1 and d2.
path ('C:\Users\Honedah3\Documents\TareasM\Plataformas\Tarea 5',path)
seriesname={'MNSST' 'MEI'};
d1=load('mnsst.txt');
d2=load('datos.txt');

%% Change the pdf.
% The time series of Baltic Sea ice extent is highly bi-modal and we
% therefore transform the timeseries into a series of percentiles. The
% transformed series probably reacts 'more linearly' to climate.

d2(:,2)=boxpdf(d2(:,2));


%% Continuous wavelet transform (CWT)
% The CWT expands the time series into time
% frequency space. 

figure('color',[1 1 1])
tlim=[min(d1(1,1),d2(1,1)) max(d1(end,1),d2(end,1))]; 
subplot(2,1,1);
wt(d1);
title(seriesname{1});
set(gca,'xlim',tlim);
subplot(2,1,2)
wt(d2)
title(seriesname{2})
set(gca,'xlim',tlim)


%% Cross wavelet transform (XWT)
% The XWT finds regions in time frequency space where
% the time series show high common power.

figure('color',[1 1 1])
xwt(d1,d2)
title(['XWT: ' seriesname{1} '-' seriesname{2} ] )

%% Wavelet coherence (WTC)
% The WTC finds regions in time frequency space where the two 
% time series co-vary (but does not necessarily have high power).


figure('color',[1 1 1])
wtc(d1,d2)
title(['WTC: ' seriesname{1} '-' seriesname{2} ] )