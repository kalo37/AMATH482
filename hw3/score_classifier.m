
function [c,ic,p] = score_classifier(classifier, xtest, ytest)
    pre = predict(classifier, real(xtest));
    c = 0; % # correct
    ic = 0; % # incorrect
    for i=1:size(pre,1)
        if pre(i) == ytest(i)
            c = c + 1;
        else
            ic = ic + 1;
        end
    end
    p = c / (c + ic);
end