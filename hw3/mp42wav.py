from moviepy.editor import AudioFileClip
import glob

songs = glob.glob('data/*.mp4')
print(songs)
for song in songs:
    print(song)
    aclip = AudioFileClip(song)
    aclip.write_audiofile(song[:-3] + 'wav')