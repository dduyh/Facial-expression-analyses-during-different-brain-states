clc
clear
close all

%%
fileName = 'D:\duyh\video\20210524\#63_optogenetics2021-05-24T11_44_20.avi';
obj = VideoReader(fileName);
numFrames = obj.NumFrames;
FrameRate = obj.FrameRate;

%%
% for i = 383501:385625
for i = [133064:133563 ...
        139751:140375 ...
        174063:175437 ...
        210876:211250 ...
        214501:215313 ...
        235001:235375 ...
        240126:240750 ...
        329439:329938 ...
        341876:342187 ...
        346876:347375 ...
        384501:384938]
    fprintf('running recording = %i\n',i)
    
    image_name = strcat('D:\duyh\video\20210524\sleep_rem_short\sleep (', num2str(i), ').jpg');
    frame = read(obj,i);
    imwrite(frame,image_name,'jpg');
   
end