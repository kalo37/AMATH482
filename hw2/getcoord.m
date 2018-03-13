function coords = getcoord(frames, wsize)
    coords = zeros(size(frames, 4), 2); % initialize coords array
    imshow(frames(:,:,:,1));
    coords(1,:) = ginput(1); % user input initial coordinate
    coords = uint16(coords);
    for i=2:size(frames, 4)
        prev = coords(i-1,:);
        bot = prev(2) - wsize;
        top = prev(2) + wsize;
        left = prev(1) - wsize;
        right = prev(1) + wsize;
        searchbox = sum(frames(bot:top,left:right,:,i), 3);
        [maxrow, ys] = max(searchbox);
        [~, x] = max(maxrow);
        coords(i,:) = [left + x, bot + ys(x)];
    end
end