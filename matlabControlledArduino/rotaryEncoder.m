clear
a = arduino('COM3','Uno','Libraries','RotaryEncoder')
channelA = 'D2';
channelB = 'D3';
encoder = rotaryEncoder(a,channelA,channelB)
resetCount(encoder);
pushbutton = 'D4';
configurePin(a,pushbutton,'Pullup');
posVec = nan(10000,1);
timeInd = 1;
while(~readDigitalPin(a,pushbutton))
    count = readCount(encoder);
    pos = mod(count,48);
    fprintf('Current knob position: %d\n',pos);
    posVec(timeInd) = pos;
    timeInd = timeInd + 1;
    
end