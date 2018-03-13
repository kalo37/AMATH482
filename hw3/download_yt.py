from pytube import YouTube
from moviepy.editor import AudioFileClip
import pandas as pd


def download(url, fname):

    yt = YouTube(url)
    print('Downloading: ' + fname, str(yt.streams.filter(only_audio=True, subtype='mp4').all()[0]))
    yt.streams.filter(only_audio=True).first().download('data/', fname)

def main():
    song_list = pd.read_csv('song_list.csv')
    for idx, row in song_list.iterrows():
        if row['case'] != 5:
            continue
        download(row['url'], row['name'])


main()
