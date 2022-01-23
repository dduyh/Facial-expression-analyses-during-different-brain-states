clc
clear
close all

%%
folderPath = 'D:\duyh\video\2021-06-18\fear_trial1\';

neutral = imread([folderPath 'fear (1000).jpg']);
neutral_gray = rgb2gray(neutral);

fear = imread([folderPath 'fear (2000).jpg']);
fear_gray = rgb2gray(fear);

diffimg = imshowpair(neutral_gray,fear_gray,'diff');
colormap(mymap2)
diffimg = diffimg.CData;
imwrite(diffimg,mymap2,[folderPath 'difference_fear (2000).png']);

image = imgaussfilt(diffimg,50);
imagesc(image,[0 60])
colormap(mymap)
hbar = colorbar('east');
set(hbar, 'Position', [0.8591    0.1113    0.0196    0.2852])

hold on;
[fgimage, ~, alpha]  = imread([folderPath 'line_drawing_fear (2000).png']);
hfg = imshow(fgimage);
hfg.AlphaData = alpha;    %set transparency

%%
savefig([folderPath 'line_drawing_heatmap_fear (2000).fig']);
f = getframe(gcf);
imwrite(f.cdata,[folderPath 'line_drawing_heatmap_fear (2000).png']);
