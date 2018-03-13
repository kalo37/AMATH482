from pytube import YouTube
from moviepy.editor import AudioFileClip
import pandas as pd


def download(url, fname):

    yt = YouTube(url)
    #print(yt.streams.filter(only_video=True, subtype='mp4', res='360p').all())
    print('Downloading: ' + fname, str(yt.streams.filter(only_video=True, subtype='mp4', res='360p').all()[0]))
    yt.streams.filter(only_video=True, subtype='mp4', res='360p').first().download('data/', fname)

def main():
    #urls = ["https://www.youtube.com/watch?v=OQZSaTNb9AA", 
    #"https://www.youtube.com/watch?v=i_h2EUuFWIY",
    #"https://www.youtube.com/watch?v=EokL7E6o1AE"]
    urls = ["https://www.youtube.com/watch?v=2THACbNBsFo"]
    #fnames = ['conan', 'seth', 'kutz']
    fnames = ['bpkid']
    for i in range(0, 1):
        download(urls[i], fnames[i])

main()
