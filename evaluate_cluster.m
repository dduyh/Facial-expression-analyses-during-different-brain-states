folderPath = 'D:\duyh\video\20210513_#76\sleep_trial1\';
A=xlsread([folderPath 'sleep_trial1_8.xlsx']);
data = A(2:end,2:end);
meas = data;

load([folderPath 'linkage.mat'])

for i=1:10
clust(:,i) = cluster(col_linkage,'maxclust',i);
end

eva_1 = evalclusters(meas,clust,'CalinskiHarabasz')
figure(1);
plot(eva_1);

eva_2 = evalclusters(meas,clust,'DaviesBouldin')
figure(2);
plot(eva_2);

eva_3 = evalclusters(meas,clust,'silhouette')
figure(3);
plot(eva_3);