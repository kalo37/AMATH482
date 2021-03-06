%% load data

mozart = get_random_sample('data/clean/moz-collection.wav', 34);
chopin = get_random_sample('data/clean/cho-collection.wav', 33);
beetho = get_random_sample('data/clean/bee-collection.wav', 33);
cube = get_random_sample('data/clean/ice-collection.wav', 34);
dre = get_random_sample('data/clean/dre-collection.wav', 33);
dame = get_random_sample('data/clean/dame-collection.wav',33);
davis = get_random_sample('data/clean/md-collection.wav',34);
coltrane = get_random_sample('data/clean/jc-collection.wav',33);
miller = get_random_sample('data/clean/gm-collection.wav',33);
ss = size(mozart, 1) / 5; % samples per second

%% plot time signal
figure
subplot(3,1,1)
plot(mozart(:,1))
title ('Example Classical (Mozart) Time Signal')
xticks([0, ss * 1, ss * 2, ss * 3, ss * 4, ss * 5])
xticklabels({'0', '1', '2', '3', '4', '5'})
xlabel('Time (s)')
ylabel('Signal')
subplot(3,1,2)
plot(cube(:,1))
title('Example Rap (Ice Cube) Time Signal')
xticks([0, ss * 1, ss * 2, ss * 3, ss * 4, ss * 5])
xticklabels({'0', '1', '2', '3', '4', '5'})
xlabel('Time (s)')
ylabel('Signal')
subplot(3,1,3)
plot(davis(:,1))
title('Example Jazz (Miles Davis) Time Signal')
xticks([0, ss * 1, ss * 2, ss * 3, ss * 4, ss * 5])
xticklabels({'0', '1', '2', '3', '4', '5'})
xlabel('Time (s)')
ylabel('Signal')

%% plot example spectrograms
%wlength = ss * 0.5; %% window length for STFT
figure
subplot(3,3,1)
spectrogram(beetho(:,1),'yaxis')
title('Beethovan Sample Clip')
xticks([0, ss * 1, ss * 2, ss * 3, ss * 4, ss * 5])
xticklabels({'0', '1', '2', '3', '4', '5'})
xlabel('Time (s)')
subplot(3,3,2)
spectrogram(chopin(:,2), 'yaxis')
title('Chopin Sample Clip')
xticks([0, ss * 1, ss * 2, ss * 3, ss * 4, ss * 5])
xticklabels({'0', '1', '2', '3', '4', '5'})
xlabel('Time (s)')
subplot(3,3,3)
spectrogram(mozart(:,1), 'yaxis')
title('Mozart Sample Clip')
xticks([0, ss * 1, ss * 2, ss * 3, ss * 4, ss * 5])
xticklabels({'0', '1', '2', '3', '4', '5'})
xlabel('Time (s)')
subplot(3,3,4)
spectrogram(cube(:,1), 'yaxis')
title('Ice Cube Sample Clip')
xticks([0, ss * 1, ss * 2, ss * 3, ss * 4, ss * 5])
xticklabels({'0', '1', '2', '3', '4', '5'})
xlabel('Time (s)')
subplot(3,3,5)
spectrogram(dre(:,1), 'yaxis')
title('Dr. Dre Sample Clip')
xticks([0, ss * 1, ss * 2, ss * 3, ss * 4, ss * 5])
xticklabels({'0', '1', '2', '3', '4', '5'})
xlabel('Time (s)')
subplot(3,3,6)
spectrogram(dame(:,1), 'yaxis')
title('Dame D.O.L.L.A Sample Clip')
xticks([0, ss * 1, ss * 2, ss * 3, ss * 4, ss * 5])
xticklabels({'0', '1', '2', '3', '4', '5'})
xlabel('Time (s)')
subplot(3,3,7)
spectrogram(davis(:,1), 'yaxis')
title('Miles Davis Sample Clip')
xticks([0, ss * 1, ss * 2, ss * 3, ss * 4, ss * 5])
xticklabels({'0', '1', '2', '3', '4', '5'})
xlabel('Time (s)')
subplot(3,3,8)
spectrogram(coltrane(:,1), 'yaxis')
title('John Coltrane Sample Clip')
xticks([0, ss * 1, ss * 2, ss * 3, ss * 4, ss * 5])
xticklabels({'0', '1', '2', '3', '4', '5'})
xlabel('Time (s)')
subplot(3,3,9)
spectrogram(miller(:,1), 'yaxis')
title('Glen Miller Sample Clip')
xticks([0, ss * 1, ss * 2, ss * 3, ss * 4, ss * 5])
xticklabels({'0', '1', '2', '3', '4', '5'})
xlabel('Time (s)')


%% stack all three data matrices and get spectrogram for each clip
Dall = [mozart chopin beetho cube dame dre davis miller coltrane];
% classical: 1-100, rap: 101-200, jazz: 201-300
Sall = [];
for i=1:size(Dall,2)
    %sp = spectrogram(Dall(:, i), round(wlength));
    sp = spectrogram(Dall(:, i));
    Sall = [Sall, sp(:)];
end


%% svd
[u,s,v] = svd(Sall, 'econ');

%% plot singular value spectrum
figure
plot(diag(s)/sum(diag(s)), 'ro', 'Linewidth', 2)
title('Singular Value Spectrum')
ylabel('% Energy Captured')
xlabel('Singular Values')

%%
figure
scatter3(v(1:100,1), v(1:100,2), v(1:100,3), 'ko', 'Linewidth', 2)
hold on 
%scatter3(v(101:200,1), v(101:200,2), v(101:200,3), 'ro', 'Linewidth', 2)
scatter3(v(201:300,1), v(201:300,2), v(201:300,3), 'bo', 'Linewidth', 2)
legend('classical', 'jazz') %'rap', 'jazz')
%%
% frommode = 1;
% tomode = 100;
% q1 = randperm(100);
% q2 = randperm(100);
% q3 = randperm(100);
% 
% xice = v(1:100, frommode:tomode);
% xmd = v(101:200, frommode:tomode);
% xcho = v(201:300, frommode:tomode);
% xtrain = [xice(q1(1:80),:); xmd(q2(1:80),:); xcho(q3(1:80),:)];
% xtest = [xice(q1(81:end),:); xmd(q2(81:end),:); xcho(q3(81:end),:)];
% ytrain = zeros(240,1);
% for i=1:240
%     if i <= 80
%         ytrain(i) = 1;
%     elseif i <= 160
%             ytrain(i) = 2;
%     else
%         ytrain(i) = 3;
%     end
% end

[xtrain, ytrain, xtest, ytest] = train_test_split(v);
classifier = fitcnb(real(xtrain), ytrain);
predicted = predict(classifier, real(xtest));
figure
subplot(3,3,1)
bar(predicted(1:20))
axis([1 20 0 3])
title('predicting Classical (1 is correct)')
ylabel('test 1 predictions')
subplot(3,3,2)
bar(predicted(21:40))
axis([1 20 0 3])
title('predicting Rap (2 is correct)')
subplot(3,3,3)
bar(predicted(41:60))
axis([1 20 0 3])
title('predicting Jazz (3 is correct)')

[xtrain, ytrain, xtest, ytest] = train_test_split(v);
classifier = fitcknn(real(xtrain), ytrain);
predicted = predict(classifier, real(xtest));
subplot(3,3,4)
bar(predicted(1:20))
ylabel('test 2 predictions')
axis([1 20 0 3])
subplot(3,3,5)
bar(predicted(21:40))
axis([1 20 0 3])
subplot(3,3,6)
bar(predicted(41:60))
axis([1 20 0 3])

[xtrain, ytrain, xtest, ytest] = train_test_split(v);
%classifier = fitcknn(real(xtrain), ytrain, 'NumNeighbors', 5);
classifier = fitcnb(real(xtrain), ytrain);
predicted = predict(classifier, real(xtest));
subplot(3,3,7)
bar(predicted(1:20))
axis([1 20 0 3])
ylabel('test 3 predictions')
subplot(3,3,8)
bar(predicted(21:40))
axis([1 20 0 3])
subplot(3,3,9)
bar(predicted(41:60))
axis([1 20 0 3])


