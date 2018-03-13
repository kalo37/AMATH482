clear all; close all; clc
load('cam1_1.mat')
load('cam2_1.mat')
load('cam3_1.mat')

coords1_1 = getcoord(vidFrames1_1, 20);
coords2_1 = getcoord(vidFrames2_1, 20);
coords3_1 = getcoord(vidFrames3_1, 20);

load('cam1_2.mat')
load('cam2_2.mat')
load('cam3_2.mat')

coords1_2 = getcoord(vidFrames1_2, 20);
coords2_2 = getcoord(vidFrames2_2, 20);
coords3_2 = getcoord(vidFrames3_2, 20);

load('cam1_3.mat')
load('cam2_3.mat')
load('cam3_3.mat')

coords1_3 = getcoord(vidFrames1_3, 20);
coords2_3 = getcoord(vidFrames2_3, 20);
coords3_3 = getcoord(vidFrames3_3, 20);

load('cam1_4.mat')
load('cam2_4.mat')
load('cam3_4.mat')

coords1_4 = getcoord(vidFrames1_4, 20);
coords2_4 = getcoord(vidFrames2_4, 20);
coords3_4 = getcoord(vidFrames3_4, 20);