% Get 70 5-second clips randomly from the given FILE
function A = get_random_sample(FILENAME, numSamples)
    A = [];
    finfo = audioinfo(FILENAME);
    duration = finfo.Duration;
    sr = finfo.SampleRate;
    R = rand(1,numSamples);
    samp_starttime = R * (duration - 5);
    for i=1:size(samp_starttime, 2)
       [y, fs] = audioread(FILENAME, [round(samp_starttime(i) * sr), round((samp_starttime(i) + 5) * sr)]);
       yMono = sum(y,2) / size(y, 2);
       A = [A yMono];
    end
end