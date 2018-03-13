%-----------test 1-----------------------
%% load data
load('cam1_1.mat');
load('cam2_1.mat');
load('cam3_1.mat');


%% get starting coordinates for all cameras
imshow(vidFrames1_1(:,:,:,1))
[x1, y1] = ginput(1);
coords1_1(1,:) = [x1,y1];

%figure
imshow(vidFrames2_1(:,:,:,1))
[x2, y2] = ginput(1);
coords2_1(1,:) = [x2,y2];

%figure
imshow(vidFrames3_1(:,:,:,1))
[x3, y3] = ginput(1);
coords3_1(1,:) = [x3,y3];

%% initialize coordinates array with first coordinates
coords1_1 = zeros(size(vidFrames1_1,4), 2);
coords1_1(1,:) = [x1,y1];
coords2_1 = zeros(size(vidFrames2_1,4), 2);
coords2_1(1,:) = [x2,y2];
coords3_1 = zeros(size(vidFrames3_1,4), 2);
coords3_1(1,:) = [x3,y3];
%% convert coordinates to integers
coords1_1 = uint16(coords1_1);
coords2_1 = uint16(coords2_1);
coords3_1 = uint16(coords3_1);
%% get coordinates for each frame cam 1
WSIZE = 20; % 1/2 size of the search window for the flashlight location in the next frame

for i=2:size(vidFrames1_1, 4)
    prev = coords1_1(i-1,:);
    bot = prev(2) - WSIZE;
    top = prev(2) + WSIZE;
    left = prev(1) - WSIZE;
    right = prev(1) + WSIZE;
    searchbox = sum(vidFrames1_1(bot:top,left:right,:,i), 3);
%     % /visualize searchbox
%     subplot(1,2,1)
%     imshow(vidFrames1_1(:,:,:,i));
%     hold on
%     axis on
%     plot([left left right right], [bot top top bot]);
%     plot(prev(1), prev(2), 'ro');
%     subplot(1,2,2), imshow(vidFrames1_1(bot:top, left:right, :, i));
%     % \draw searchbox
    [maxrow, ys] = max(searchbox);
    [maxelt, x] = max(maxrow);
    coords1_1(i,:) = [left + x, bot + ys(x)];
end


%% cam 2

WSIZE = 20;
for i=2:size(vidFrames2_1, 4)
    prev = coords2_1(i-1,:);
    bot = prev(2) - WSIZE;
    top = prev(2) + WSIZE;
    left = prev(1) - WSIZE;
    right = prev(1) + WSIZE;
    searchbox = sum(vidFrames2_1(bot:top,left:right,:,i), 3);
    [maxrow, ys] = max(searchbox);
    [maxelt, x] = max(maxrow);
    coords2_1(i,:) = [left + x, bot + ys(x)];
end

%% cam 3

WSIZE = 20;
for i=2:size(vidFrames3_1, 4)
    prev = coords3_1(i-1,:);
    bot = prev(2) - WSIZE;
    top = prev(2) + WSIZE;
    left = prev(1) - WSIZE;
    right = prev(1) + WSIZE;
    searchbox = sum(vidFrames3_1(bot:top,left:right,:,i), 3);
    [maxrow, ys] = max(searchbox);
    [maxelt, x] = max(maxrow);
    coords3_1(i,:) = [left + x, bot + ys(x)];
end

%% play video
figure
for i=1:size(vidFrames2_3, 4)
    imshow(vidFrames2_3(:,:,:,i))
    hold on
    axis on
    plot(coords2_3(i,1), coords2_3(i,2), 'ro')
    pause(0.05)
end

%% plot x,y for and x and y over time
figure
subplot(3,3,1)
plot(coords1_1(:,1), coords1_1(:,2), 'ro');
axis([0 size(vidFrames1_1, 2) 0 size(vidFrames1_1, 1)]);

subplot(3,3,2)
plot(coords1_1(:,1))

subplot(3,3,3)
plot(coords1_1(:,2))

%%plot x,y for cam 2

subplot(3,3,4)
plot(coords2_1(:,1), coords2_1(:,2), 'ro');
axis([0 size(vidFrames2_1, 2) 0 size(vidFrames2_1, 1)]);

subplot(3,3,5)
plot(coords2_1(:,1))

subplot(3,3,6)
plot(coords2_1(:,2))

%%plot x,y for cam 3

subplot(3,3,7)
plot(coords3_1(:,1), coords3_1(:,2), 'ro');
axis([0 size(vidFrames3_1, 2) 0 size(vidFrames3_1, 1)]);

subplot(3,3,8)
plot(coords3_1(:,1))

subplot(3,3,9)
plot(coords3_1(:,2))

%%
%----------------test 2-----------------

%% load data
load('cam1_2.mat');
load('cam2_2.mat');
load('cam3_2.mat');


%% get starting coordinates for all cameras
figure
imshow(vidFrames1_2(:,:,:,1))
[x1, y1] = ginput(1);
coords1_2(1,:) = [x1,y1];

%figure
imshow(vidFrames2_2(:,:,:,1))
[x2, y2] = ginput(1);
coords2_2(1,:) = [x2,y2];

%figure
imshow(vidFrames3_2(:,:,:,1))
[x3, y3] = ginput(1);
coords3_2(1,:) = [x3,y3];

%% initialize coordinates array with first coordinates
coords1_2 = zeros(size(vidFrames1_2,4), 2);
coords1_2(1,:) = [x1,y1];
coords2_2 = zeros(size(vidFrames2_2,4), 2);
coords2_2(1,:) = [x2,y2];
coords3_2 = zeros(size(vidFrames3_2,4), 2);
coords3_2(1,:) = [x3,y3];
%% convert coordinates to integers
coords1_2 = uint16(coords1_2);
coords2_2 = uint16(coords2_2);
coords3_2 = uint16(coords3_2);
%% get coordinates for each frame cam 1
WSIZE = 20; % 1/2 size of the search window for the flashlight location in the next frame

for i=2:size(vidFrames1_2, 4)
    prev = coords1_2(i-1,:);
    bot = prev(2) - WSIZE;
    top = prev(2) + WSIZE;
    left = prev(1) - WSIZE;
    right = prev(1) + WSIZE;
    searchbox = sum(vidFrames1_2(bot:top,left:right,:,i), 3);
%     % /visualize searchbox
%     subplot(1,2,1)
%     imshow(vidFrames1_1(:,:,:,i));
%     hold on
%     axis on
%     plot([left left right right], [bot top top bot]);
%     plot(prev(1), prev(2), 'ro');
%     subplot(1,2,2), imshow(vidFrames1_1(bot:top, left:right, :, i));
%     % \draw searchbox
    [maxrow, ys] = max(searchbox);
    [maxelt, x] = max(maxrow);
    coords1_2(i,:) = [left + x, bot + ys(x)];
end


%% cam 2

WSIZE = 20;
for i=2:size(vidFrames2_2, 4)
    prev = coords2_2(i-1,:);
    bot = prev(2) - WSIZE;
    top = prev(2) + WSIZE;
    left = prev(1) - WSIZE;
    right = prev(1) + WSIZE;
    searchbox = sum(vidFrames2_2(bot:top,left:right,:,i), 3);
    [maxrow, ys] = max(searchbox);
    [maxelt, x] = max(maxrow);
    coords2_2(i,:) = [left + x, bot + ys(x)];
end

%% cam 3

WSIZE = 20;
for i=2:size(vidFrames3_2, 4)
    prev = coords3_2(i-1,:);
    bot = prev(2) - WSIZE;
    top = prev(2) + WSIZE;
    left = prev(1) - WSIZE;
    right = prev(1) + WSIZE;
    searchbox = sum(vidFrames3_2(bot:top,left:right,:,i), 3);
    [maxrow, ys] = max(searchbox);
    [maxelt, x] = max(maxrow);
    coords3_2(i,:) = [left + x, bot + ys(x)];
end

%% plot x,y for and x and y over time
figure
subplot(3,3,1)
plot(coords1_2(:,1), coords1_2(:,2), 'ro');
axis([0 size(vidFrames1_2, 2) 0 size(vidFrames1_2, 1)]);

subplot(3,3,2)
plot(coords1_2(:,1))

subplot(3,3,3)
plot(coords1_2(:,2))

%%plot x,y for cam 2

subplot(3,3,4)
plot(coords2_2(:,1), coords2_2(:,2), 'ro');
axis([0 size(vidFrames2_2, 2) 0 size(vidFrames2_2, 1)]);

subplot(3,3,5)
plot(coords2_2(:,1))

subplot(3,3,6)
plot(coords2_2(:,2))

%%plot x,y for cam 3

subplot(3,3,7)
plot(coords3_2(:,1), coords3_2(:,2), 'ro');
axis([0 size(vidFrames3_2, 2) 0 size(vidFrames3_2, 1)]);

subplot(3,3,8)
plot(coords3_2(:,1))

subplot(3,3,9)
plot(coords3_2(:,2))

%%
%----------------test 3-------------
%% load data
load('cam1_3.mat');
load('cam2_3.mat');
load('cam3_3.mat');


%% get starting coordinates for all cameras
figure
imshow(vidFrames1_3(:,:,:,1))
[x1, y1] = ginput(1);
coords1_3(1,:) = [x1,y1];

%figure
imshow(vidFrames2_3(:,:,:,1))
[x2, y2] = ginput(1);
coords2_3(1,:) = [x2,y2];

%figure
imshow(vidFrames3_3(:,:,:,1))
[x3, y3] = ginput(1);
coords3_3(1,:) = [x3,y3];

%% initialize coordinates array with first coordinates
coords1_3 = zeros(size(vidFrames1_3,4), 2);
coords1_3(1,:) = [x1,y1];
coords2_3 = zeros(size(vidFrames2_3,4), 2);
coords2_3(1,:) = [x2,y2];
coords3_3 = zeros(size(vidFrames3_3,4), 2);
coords3_3(1,:) = [x3,y3];
%% convert coordinates to integers
coords1_3 = uint16(coords1_3);
coords2_3 = uint16(coords2_3);
coords3_3 = uint16(coords3_3);
%% get coordinates for each frame cam 1
WSIZE = 20; % 1/2 size of the search window for the flashlight location in the next frame

for i=2:size(vidFrames1_3, 4)
    prev = coords1_3(i-1,:);
    bot = prev(2) - WSIZE;
    top = prev(2) + WSIZE;
    left = prev(1) - WSIZE;
    right = prev(1) + WSIZE;
    searchbox = sum(vidFrames1_3(bot:top,left:right,:,i), 3);
%     % /visualize searchbox
%     subplot(1,2,1)
%     imshow(vidFrames1_1(:,:,:,i));
%     hold on
%     axis on
%     plot([left left right right], [bot top top bot]);
%     plot(prev(1), prev(2), 'ro');
%     subplot(1,2,2), imshow(vidFrames1_1(bot:top, left:right, :, i));
%     % \draw searchbox
    [maxrow, ys] = max(searchbox);
    [maxelt, x] = max(maxrow);
    coords1_3(i,:) = [left + x, bot + ys(x)];
end


%% cam 2

WSIZE = 20;
for i=2:size(vidFrames2_3, 4)
    prev = coords2_3(i-1,:);
    bot = prev(2) - WSIZE;
    top = prev(2) + WSIZE;
    left = prev(1) - WSIZE;
    right = prev(1) + WSIZE;
    searchbox = sum(vidFrames2_3(bot:top,left:right,:,i), 3);
    [maxrow, ys] = max(searchbox);
    [maxelt, x] = max(maxrow);
    coords2_3(i,:) = [left + x, bot + ys(x)];
end

%% cam 3

WSIZE = 20;
for i=2:size(vidFrames3_3, 4)
    prev = coords3_3(i-1,:);
    bot = prev(2) - WSIZE;
    top = prev(2) + WSIZE;
    left = prev(1) - WSIZE;
    right = prev(1) + WSIZE;
    searchbox = sum(vidFrames3_3(bot:top,left:right,:,i), 3);
    [maxrow, ys] = max(searchbox);
    [maxelt, x] = max(maxrow);
    coords3_3(i,:) = [left + x, bot + ys(x)];
end

%% plot x,y for and x and y over time
figure
subplot(3,3,1)
plot(coords1_3(:,1), coords1_3(:,2), 'ro');
axis([0 size(vidFrames1_3, 2) 0 size(vidFrames1_3, 1)]);

subplot(3,3,2)
plot(coords1_3(:,1))

subplot(3,3,3)
plot(coords1_3(:,2))

%%plot x,y for cam 2

subplot(3,3,4)
plot(coords2_3(:,1), coords2_3(:,2), 'ro');
axis([0 size(vidFrames2_3, 2) 0 size(vidFrames2_3, 1)]);

subplot(3,3,5)
plot(coords2_3(:,1))

subplot(3,3,6)
plot(coords2_3(:,2))

%%plot x,y for cam 3

subplot(3,3,7)
plot(coords3_3(:,1), coords3_3(:,2), 'ro');
axis([0 size(vidFrames3_3, 2) 0 size(vidFrames3_3, 1)]);

subplot(3,3,8)
plot(coords3_3(:,1))

subplot(3,3,9)
plot(coords3_3(:,2))


%%
%----------------test 4-------------
%% load data
load('cam1_4.mat');
load('cam2_4.mat');
load('cam3_4.mat');


%% get starting coordinates for all cameras
figure
imshow(vidFrames1_4(:,:,:,1))
[x1, y1] = ginput(1);
coords1_4(1,:) = [x1,y1];

%figure
imshow(vidFrames2_4(:,:,:,1))
[x2, y2] = ginput(1);
coords2_4(1,:) = [x2,y2];

%figure
imshow(vidFrames3_4(:,:,:,1))
[x3, y3] = ginput(1);
coords3_4(1,:) = [x3,y3];

%% initialize coordinates array with first coordinates
coords1_4 = zeros(size(vidFrames1_4,4), 2);
coords1_4(1,:) = [x1,y1];
coords2_4 = zeros(size(vidFrames2_4,4), 2);
coords2_4(1,:) = [x2,y2];
coords3_4 = zeros(size(vidFrames3_4,4), 2);
coords3_4(1,:) = [x3,y3];
%% convert coordinates to integers
coords1_4 = uint16(coords1_4);
coords2_4 = uint16(coords2_4);
coords3_4 = uint16(coords3_4);
%% get coordinates for each frame cam 1
WSIZE = 20; % 1/2 size of the search window for the flashlight location in the next frame

for i=2:size(vidFrames1_4, 4)
    prev = coords1_4(i-1,:);
    bot = prev(2) - WSIZE;
    top = prev(2) + WSIZE;
    left = prev(1) - WSIZE;
    right = prev(1) + WSIZE;
    searchbox = sum(vidFrames1_4(bot:top,left:right,:,i), 3);
%     % /visualize searchbox
%     subplot(1,2,1)
%     imshow(vidFrames1_1(:,:,:,i));
%     hold on
%     axis on
%     plot([left left right right], [bot top top bot]);
%     plot(prev(1), prev(2), 'ro');
%     subplot(1,2,2), imshow(vidFrames1_1(bot:top, left:right, :, i));
%     % \draw searchbox
    [maxrow, ys] = max(searchbox);
    [maxelt, x] = max(maxrow);
    coords1_4(i,:) = [left + x, bot + ys(x)];
end


%% cam 2

WSIZE = 20;
for i=2:size(vidFrames2_4, 4)
    prev = coords2_4(i-1,:);
    bot = prev(2) - WSIZE;
    top = prev(2) + WSIZE;
    left = prev(1) - WSIZE;
    right = prev(1) + WSIZE;
    searchbox = sum(vidFrames2_4(bot:top,left:right,:,i), 3);
    [maxrow, ys] = max(searchbox);
    [maxelt, x] = max(maxrow);
    coords2_4(i,:) = [left + x, bot + ys(x)];
end

%% cam 3

WSIZE = 20;
for i=2:size(vidFrames3_4, 4)
    prev = coords3_4(i-1,:);
    bot = prev(2) - WSIZE;
    top = prev(2) + WSIZE;
    left = prev(1) - WSIZE;
    right = prev(1) + WSIZE;
    searchbox = sum(vidFrames3_4(bot:top,left:right,:,i), 3);
    [maxrow, ys] = max(searchbox);
    [maxelt, x] = max(maxrow);
    coords3_4(i,:) = [left + x, bot + ys(x)];
end

%% plot x,y for and x and y over time
figure
subplot(3,3,1)
plot(coords1_4(:,1), coords1_4(:,2), 'ro');
axis([0 size(vidFrames1_4, 2) 0 size(vidFrames1_4, 1)]);

subplot(3,3,2)
plot(coords1_4(:,1))

subplot(3,3,3)
plot(coords1_4(:,2))

%%plot x,y for cam 2

subplot(3,3,4)
plot(coords2_4(:,1), coords2_4(:,2), 'ro');
axis([0 size(vidFrames2_4, 2) 0 size(vidFrames2_4, 1)]);

subplot(3,3,5)
plot(coords2_4(:,1))

subplot(3,3,6)
plot(coords2_4(:,2))

%%plot x,y for cam 3

subplot(3,3,7)
plot(coords3_4(:,1), coords3_4(:,2), 'ro');
axis([0 size(vidFrames3_4, 2) 0 size(vidFrames3_4, 1)]);

subplot(3,3,8)
plot(coords3_4(:,1))

subplot(3,3,9)
plot(coords3_4(:,2))