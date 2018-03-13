function [toReturn] = normalize(coords)
    toReturn = zeros(size(coords));
    for i=1:2
        toReturn(:,i) = coords(:,i) - min(coords(:,i));
        toReturn(:,i) = toReturn(:,i) / max(toReturn(:,i)); 
    end
end