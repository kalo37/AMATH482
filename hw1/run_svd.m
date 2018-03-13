close all; clear all; clc
%% load cropped data
folders = dir('./CroppedYale/*');

A = [];
for i = 4:size(folders) % ignore '.', '..', '.DS_Store'
    foldername = folders(i).name;
    imgs = dir(['./CroppedYale/' foldername '/*']); %./CroppedYale/ + yableB01 + /*
    for j = 3:size(imgs) % ignore '.', '..'
        img_mat = imresize(double(imread([imgs(j).folder '/' imgs(j).name])), [120 80]);
        vectorized = img_mat(:);
        A = [A vectorized];
    end
end
%% save A
save('A.mat', 'A')

%% run SVD on A
[u, s, v] = svd(A);
%% plot singular value spectrum
figure(1)
subplot(2,2,1), plot(diag(s), 'ro', 'Linewidth', 2);
title('a. Singular Value Spectrum of Cropped Images');
xlabel('Singular Values');
ylabel('Energy Camptured');
subplot(2,2,2), semilogy(diag(s), 'ro', 'Linewidth', 2);
title('b. Log of Singular Value Spectrum of Cropped Images');
xlabel('Singular Values');
ylabel('(Log) Energy Camptured');
subplot(2,2,3), plot(diag(s)*100/sum(diag(s)), 'ro', 'Linewidth', 2);
title('c. Singular Value Spectrum (Percentage) of Cropped Images');
xlabel('Singular Values');
ylabel('% Energy Camptured');
%% plot running sum
run_sum = 0;
sums = [];
vals = diag(s)/sum(diag(s));
for i=1:size(diag(s))
    run_sum = run_sum + vals(i);
    sums = [sums run_sum];
end
figure
plot(sums, 'Linewidth', 2), grid on;
title('Running Sum of Percentage of Total Energy');
xlabel('Singular Values');
ylabel('% Total Energy');
%% Get Percentages for Singular Values
percentS = diag(s)/sum(diag(s));
%% reconstruction first image
figure
ff10=u(:,1:10) * s(1:10, 1:10) * v(:,1:10).';
ff100=u(:,1:100) * s(1:100, 1:100) * v(:,1:100).';
ff250=u(:,1:250) * s(1:250, 1:250) * v(:,1:250).';
ff500=u(:,1:500) * s(1:500, 1:500) * v(:,1:500).';
ff900=u(:,1:900) * s(1:900, 1:900) * v(:,1:900).';
subplot(2,3,1), pcolor(flipud(reshape(A(:, 1), 120, 80))), shading interp; % original
title('original')
subplot(2,3,2), pcolor(flipud(reshape(ff10(:,1), 120, 80))), shading interp;
title('10-rank (26.89%)')
subplot(2,3,3), pcolor(flipud(reshape(ff100(:,1), 120, 80))), shading interp;
title('100-rank (53.70%)')
subplot(2,3,4), pcolor(flipud(reshape(ff250(:,1), 120, 80))), shading interp;
title('250-rank (68.87%)')
subplot(2,3,5), pcolor(flipud(reshape(ff500(:,1), 120, 80))), shading interp;
title('500-rank (80.25%)')
subplot(2,3,6), pcolor(flipud(reshape(ff900(:,1), 120, 80))), shading interp;
title('900-rank (89.25%)')
%% plot first 4 in u
figure
grid off
subplot(2,2,1)
pcolor(flipud(reshape(u(:, 1), 120, 80))), shading interp, axis off
title('Mode 1: 11.8%')
subplot(2,2,2)
pcolor(flipud(reshape(u(:, 2), 120, 80))), shading interp, axis off
title('Mode 2: 5.36%')
subplot(2,2,3)
pcolor(flipud(reshape(u(:, 3), 120, 80))), shading interp, axis off
title('Mode 3: 2.23%')
subplot(2,2,4)
pcolor(flipud(reshape(u(:, 4), 120, 80))), shading interp, axis off
title('Mode 4: 1.92%')
%% load uncropped data
imgs = dir('./yalefaces_uncropped/yalefaces/*');
Auncropped = [];
for i=3:size(imgs)
    img_mat = imresize(double(imread([imgs(i).folder '/' imgs(i).name])), [120 80]);
    vectorized = img_mat(:);
    Auncropped = [Auncropped vectorized];
end
%% SVD on uncropped images
[uun, sun, vun] = svd(Auncropped);
%% Calculate Running Sum of Singular Values Percentage (uncropped)
run_sum = 0;
sums = [];
vals = diag(sun)/sum(diag(sun));
for i=1:size(diag(sun))
    run_sum = run_sum + vals(i);
    sums = [sums run_sum];
end
%% uncropped low-rank reconstruction
ff2=uun(:,1:2) * sun(1:2, 1:2) * vun(:,1:2).';
ff50=uun(:,1:50) * sun(1:50, 1:50) * vun(:,1:50).';
ff100=uun(:,1:100) * sun(1:100, 1:100) * vun(:,1:100).';
%% plots
figure
subplot(1,2,1), plot(diag(sun)/sum(diag(sun)), 'ro', 'Linewidth', 2);
title('(a) Singular Value Spectrum (Percentage) of Uncropped Images');
xlabel('Singular Values');
ylabel('% Energy Camptured');
subplot(1,2,2), plot(sums, 'Linewidth', 2), grid on;
title('(b) Running Sum of Percentage of Total Energy (Uncropped)');
xlabel('Singular Values');
ylabel('% Total Energy');
figure
subplot(1,2,1), pcolor(flipud(reshape(uun(:, 1), 120, 80))), shading interp, axis off;
title('Mode 1: 30.69%');
subplot(1,2,2), pcolor(flipud(reshape(uun(:, 2), 120, 80))), shading interp, axis off;
title('Mode 2: 5.87%');
figure
subplot(2,2,1), pcolor(flipud(reshape(Auncropped(:, 1), 120, 80))), shading interp; %original image
axis off;
title('Original');
subplot(2,2,2), pcolor(flipud(reshape(ff2(:,1), 120, 80))), shading interp;
axis off;
title('2-rank (36.56%)')
subplot(2,2,3), pcolor(flipud(reshape(ff50(:,1), 120, 80))), shading interp;
axis off;
title('50-rank (79.52%)')
subplot(2,2,4), pcolor(flipud(reshape(ff100(:,1), 120, 80))), shading interp;
axis off;
title('100-rank (92.76%)')