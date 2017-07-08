hdr = fread(fid, 1024, 'char*1');
eval(char(hdr'));
info.header = header;

fid = fopen('102_CH1.continuous');
hdr = fread(fid, 1024, 'char*1');
timestamp = fread(fid, 1, 'int64',0,'l');
N = fread(fid, 1, 'uint16',0,'l');
recordingNumber = fread(fid, 1, 'uint16', 0, 'l');
samples = fread(fid, N, 'int16',0,'b');
recordmarker = fread(fid, 10, 'char*1');
fclose(fid);
figure; plot(samples);

fid = fopen('YourOutput.dat', 'w');
fwrite(fid, YourArray);
fclose(fid);

x = randn(100,1);
save test.dat x -ascii
% or
save('c:\folderyouwant\test.dat','x','-ascii');