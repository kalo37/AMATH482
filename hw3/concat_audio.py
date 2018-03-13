from moviepy.editor import AudioFileClip, concatenate_audioclips
import glob

#directories = ['data/jazz/*.wav', 'data/pop/*.wav', 'data/clas/*.wav']

genres = ['jazz', 'pop', 'clas']

for genre in genres:
    clips = []
    for f in glob.glob('data/{}/*.wav'.format(genre)):
        thisclip = AudioFileClip(f)
        clips.append(thisclip)
    concatenated = concatenate_audioclips(clips)
    concatenated.write_audiofile('data/{}/t1_{}_concatenated.wav'.format(genre, genre))
