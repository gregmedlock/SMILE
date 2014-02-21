sampFreq = 128;

len = size(data, 2);          % Length of signal
next2 = 2^nextpow2(len);      % Next power of 2 from length of y
f = sampFreq / 2 * linspace(0, 1, next2 / 2 + 1);

for i = 1:size(data, 2)
    channel = data(:, i);
    FFT = fft(channel, next2) / len;
    mag = 2 * abs(FFT(1 : next2 / 2 + 1));
    dB  = 20 * log10(abs(mag)/max(abs(mag)));
    name = h.DataChannelsNames{i};
    TITLE = sprintf('Magnitude (dB) of channel: %s', name);
    figure(), plot(f, dB), title(TITLE), ylabel('Magnitude'), xlabel('Frequency (Hz)')
end

%% 

h = EmotivEEG('ED_F3');
h.Run
happy=h.Record(10);
pause();
sad = h.Record(10);
pause();
stressed = h.Record(10);
pause();
relax = h.Record(10);

h.LoadRecordedData(happy);
data1 = h.data;
h.LoadRecordedData(sad);
data2 = h.data;
h.LoadRecordedData(stressed);
data3=h.data;
h.LoadRecordedData(relax);
data4 = h.data;
figure();
subplot(2,2,1);plot(data1);
subplot(2,2,2);plot(data2);
subplot(2,2,3);plot(data3);
subplot(2,2,4);plot(data4);
legend(h.DataChannelsNames);