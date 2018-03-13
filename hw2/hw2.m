%%
clear all; close all; clc

%%
load("cam1_1.mat")
load("cam2_1.mat")
load("cam3_1.mat")

%% play videos 1
for i=1:min([size(vidFrames1_1, 4), size(vidFrames2_1, 4), size(vidFrames3_1, 4)])
subplot(1,3,1), grid on
imshow(vidFrames1_1(:,200:400,:,i))
hold on
axis on
plot(coords1_1(i,1), coords1_1(i,2), 'ro')
subplot(1,3,2), grid on
imshow(vidFrames2_1(:,200:400,:,i))
hold on
axis on
plot(coords2_1(i,1), coords2_1(i,2), 'ro')
subplot(1,3,3), grid on
imshow(vidFrames3_1(250:300,:,:,i))
hold on
axis on
plot(coords3_1(i,1), coords3_1(i,2), 'ro')
pause(0.05)
end

%% 1_1
coords1_1 = [];
for i=1:size(vidFrames1_1, 4)
    mat = sum(vidFrames1_1(:,200:400,:,i), 3);
    [maxrow, ys] = max(mat);
    [maxelt, xloc] = max(maxrow);
    coords1_1 = [coords1_1; xloc, ys(xloc)];
end
%% 2_1
coords2_1 = [];
for i=1:size(vidFrames2_1, 4)
    mat = sum(vidFrames2_1(:,200:400,:,i), 3);
    [maxrow, ys] = max(mat);
    [maxelt, xloc] = max(maxrow);
    coords2_1 = [coords2_1; xloc, ys(xloc)];
end

%% 3_1
coords3_1 = [];
for i=1:size(vidFrames3_1, 4)
    mat = sum(vidFrames3_1(250:300,:,:,i), 3);
    [maxrow, ys] = max(mat);
    [maxelt, xloc] = max(maxrow);
    coords3_1 = [coords3_1; xloc, ys(xloc)];
end

%%
figure
plot(coords1_1(:,2))
hold on
plot(coords2_1(:,2))
plot(coords3_1(:,1))
%% test 1
t1 = [coords1_1(:, 1), coords1_1(:,2)
    coords2_1(:,1), coords2_1(:,2)
    coords3_1(:,1), coords3_1(:,2)];
[u,s,v] = svd(t1);


%%
coords1_2 = [];
for i=1:size(vidFrames1_2, 4)
    mat = sum(vidFrames1_2(:,200:400,:,i), 3);
    [maxrow, ys] = max(mat);
    [maxelt, xloc] = max(maxrow);
    coords1_2 = [coords1_2; xloc, ys(xloc)];
end
%%
coords2_2 = [];
for i=1:size(vidFrames2_2, 4)
    mat = sum(vidFrames2_2(:,200:400,:,i), 3);
    [maxrow, ys] = max(mat);
    [maxelt, xloc] = max(maxrow);
    coords2_2 = [coords2_2; xloc, ys(xloc)];
end

%%
coords3_2 = [];
for i=1:size(vidFrames3_2, 4)
    mat = sum(vidFrames3_2(200:300,:,:,i), 3);
    [maxrow, ys] = max(mat);
    [maxelt, xloc] = max(maxrow);
    coords3_2 = [coords3_2; xloc, ys(xloc)];
end

%% play videos 2
for i=1:min([size(vidFrames1_2, 4), size(vidFrames2_2, 4), size(vidFrames3_2, 4)])
subplot(1,3,1)
imshow(vidFrames1_2(:,200:400,:,i))
hold on
axis on
plot(coords1_2(i,1), coords1_2(i,2), 'ro')
subplot(1,3,2)
imshow(vidFrames2_2(:,200:400,:,i))
hold on
axis on
plot(coords2_2(i,1), coords2_2(i,2), 'ro')
subplot(1,3,3)
imshow(vidFrames3_2(200:300,:,:,i))
hold on
axis on
plot(coords3_2(i,1), coords3_2(i,2), 'ro')
pause(0.5)
end