%%% MHR works but does not seem to provide precise timing under 100 ms
% clear
% a = arduino() % can be commented out
PIN = 'D11';
writeDigitalPin(a, PIN, 0);

pulseNum = 1000000;
onDuration = 0.1;
loopTimes = nan(pulseNum,1)  ;
for i = 1:pulseNum
    tic
    writeDigitalPin(a, PIN, 0);
    pause(onDuration);
    writeDigitalPin(a, PIN, 1);
    loopTimes(i) = toc;
    pause(onDuration);
end
writeDigitalPin(a, PIN, 0);
disp(loopTimes)
disp(['min loop time: ' num2str(min(loopTimes)) ' ind: ' num2str(find(loopTimes == min(loopTimes)))])
disp(['max loop time: ' num2str(max(loopTimes)) ' ind: ' num2str(find(loopTimes == max(loopTimes)))])
disp(['|max - min| = ' num2str(abs(min(loopTimes)-max(loopTimes)))])

% clear a