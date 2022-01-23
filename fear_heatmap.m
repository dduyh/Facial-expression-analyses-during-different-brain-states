
folderPath = 'D:\duyh\video\20210524\sleep_trial14\';
load([folderPath 'cluster_indices_8.mat'])
%%
A=xlsread([folderPath 'sleep_trial14_8.xlsx']);
data = A(2:end,2:end);

%%
figure(1);
ht = suptitle('Facial Expressions during different Sleep States Trial 14 (cropped, pixels per cell = 8)');
set(ht,'Position', [0.5 -0.05 0],'fontname','Times New Roman','fontsize',18)

h1 = subplot(3,1,1);
set(h1, 'Position', [0.298    0.89    0.44    0.0312])

mymap = [255 153 0
34 139 34
255 0 0
160 32 240];
mymap = mymap./255;

imagesc(cluster_indices)
colormap(h1,mymap);
axis off

h2 = subplot(3,1,2);
set(h2, 'Position', [0.298    0.83    0.44    0.0312])
labels = zeros(1,2125);
labels(1:1000) = 1;
labels(1001:1438) = 2;
labels(1439:2125) = 3;

mymap = [1 1 0
    0 1 0
    0 0 1];
imagesc(labels)
colormap(h2,mymap);
axis off

h3 = subplot(3,1,3);
set(h3, 'Position', [0.1300    0.04    0.7750    0.7750])
imagesc(data,[0.4 0.7])
colormap(h3,hot)
hbar = colorbar('east');
set(hbar, 'Position', [0.7675    0.04    0.013    0.77])
axis square

%%
savefig([folderPath 'cluster_index_8.fig']);
f = getframe(gcf);
imwrite(f.cdata,[folderPath 'cluster_index_8.png']);
