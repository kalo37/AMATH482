function frames = vid2frames(vid)
nFrames = round(vid.FrameRate * vid.Duration);

height = vid.height;
width = vid.width;

frames = zeros(height, width, nFrames);
for i=1:nFrames
    frame = rgb2gray(readFrame(vid));
    frames(:,:,i) = frame(1:vid.height, 1:vid.width);
end