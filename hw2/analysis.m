%% load coordinates
clear all;
load('coordinates.mat');

%% convert data type to double

coords1_1 = double(coords1_1);
coords2_1 = double(coords2_1);
coords3_1 = double(coords3_1);
coords1_2 = double(coords1_2);
coords2_2 = double(coords2_2);
coords3_2 = double(coords3_2);
coords1_3 = double(coords1_3);
coords2_3 = double(coords2_3);
coords3_3 = double(coords3_3);
coords1_4 = double(coords1_4);
coords2_4 = double(coords2_4);
coords3_4 = double(coords3_4);

%% normalize data
normalized1_1 = normalize(coords1_1);
normalized2_1 = normalize(coords2_1);
normalized3_1 = normalize(coords3_1);
normalized1_2 = normalize(coords1_2);
normalized2_2 = normalize(coords2_2);
normalized3_2 = normalize(coords3_2);
normalized1_3 = normalize(coords1_3);
normalized2_3 = normalize(coords2_3);
normalized3_3 = normalize(coords3_3);
normalized1_4 = normalize(coords1_4);
normalized2_4 = normalize(coords2_4);
normalized3_4 = normalize(coords3_4);


%% plot normalized height
minn = 392; % min number of frames among the three cameras
normalized1 = normalize(coords1_4(1:minn,:));
normalized2 = normalize(coords2_4(1:minn,:));
normalized3 = normalize(coords3_4(1:minn,:));
figure
hold on
plot(normalized1(:,2));
plot(normalized2(:,2));
plot(normalized3(:,1));
legend("cam1", "cam2", "cam3")
title("Normalized height of paint can location")
xlabel("frame")
ylabel("normalized height")

%% plot horizontal displacement
%minn = 237;
figure
hold on
plot(normalized1(:,1));
plot(normalized2(:,1));
plot(normalized3(:,2));
legend("cam1", "cam2", "cam3")
title("Normalized horizontal displacement of paint can location")
xlabel("frame")
ylabel("normalized horizontal displacement")

%% stack x y coordinates and perform svd
X = [transpose(normalized1(1:minn,1));  % stack the coordinates from each camera
        transpose(normalized1(1:minn,2));
        transpose(normalized2(1:minn,1));
        transpose(normalized2(1:minn,2));
        transpose(normalized3(1:minn,1));
        transpose(normalized3(1:minn,2))];
    

%%
[m,n]=size(X);
mn = mean(X, 2);
X = X-repmat(mn, 1, n);

[u,s,v] = svd(X/sqrt(n-1));
lambda=diag(s).^2; % variance
Y = u'*X;

%% plot variance
figure
plot(diag(lambda)/sum(diag(lambda)), 'ro');
title('Percent variance captured by each mode');
xlabel('mode')
ylabel('percent variance captured')
%% projection of data
t = linspace(0,1,n); % normalize time [0 1]
figure
plot(t, Y(1,:), t, Y(2,:), t, Y(3,:))%, t, Y(4,:))%, t, Y(5,:), t, Y(6,:));
title("Projection of data onto first 4 modes")
xlabel("normalized time")
ylabel("normalied height")
legend("mode 1", "mode 2", "mode 3")% , "mode 4")%, "mode 5", "mode 6")