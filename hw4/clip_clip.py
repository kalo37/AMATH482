from moviepy.editor import VideoFileClip
import glob
"""
conan = VideoFileClip('data/conan.mp4')
conan_clipped = conan.subclip(40, 50)
conan_clipped.write_videofile('data/conan_short.mp4')

seth = VideoFileClip('data/seth.mp4')
seth_clipped = seth.subclip(3, 13)
seth_clipped.write_videofile('data/seth_short.mp4')

kutz = VideoFileClip('data/kutz.mp4')
kutz_clipped = kutz.subclip(350, 360)
kutz_clipped.write_videofile('data/kutz_short.mp4')"""

bpkid = VideoFileClip('data/bpkid.mp4')
bpkid_clipped = bpkid.subclip(10, 20)
bpkid_clipped.write_videofile('data/bpkid_short.mp4')