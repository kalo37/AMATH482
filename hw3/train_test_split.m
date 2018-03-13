% split data into train and test sets
function [xtrain,ytrain,xtest,ytest] = train_test_split(v)
    frommode = 1;
    tomode = 3;
    q1 = randperm(100);
    q2 = randperm(100);
    q3 = randperm(100);

    xice = v(1:100, frommode:tomode);
    xmd = v(101:200, frommode:tomode);
    xcho = v(201:300, frommode:tomode);
    xtrain = [xice(q1(1:80),:); xmd(q2(1:80),:); xcho(q3(1:80),:)];
    xtest = [xice(q1(81:end),:); xmd(q2(81:end),:); xcho(q3(81:end),:)];
    ytrain = zeros(240,1);
    for i=1:240
        if i <= 80
            ytrain(i) = 1;
        elseif i <= 160
                ytrain(i) = 2;
        else
            ytrain(i) = 3;
        end
    end
    ytest = zeros(60,1);
    for i=1:60
        if i<= 20
            ytest(i) = 1;
        elseif i <= 40
            ytest(i) = 2;
        else
            ytest(i) = 3;
        end
    end
end