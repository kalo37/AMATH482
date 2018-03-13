clear all; close all; clc
vr = VideoReader('data/bpkid_short.mp4');
frames = vid2frames(vr);
nFrames = round(vr.Duration * vr.FrameRate);
fHeight = vr.Height;
fWidth = vr.Width;

%% example frame
imshow(frames(:,:, 1), [])
title("Example Frame (Conan)", 'fontsize', 15)
%% vectorize images
A = zeros(size(frames, 1) * size(frames, 2), nFrames);
A1 = zeros(size(frames, 1) * size(frames, 2), nFrames - 1);
A2 = zeros(size(frames, 1) * size(frames, 2), nFrames - 1);

for i=1:nFrames
   f = frames(:,:,i); 
   vec = f(:);
   A(:,i) = vec;
   if i < nFrames % frame 1-299
       A1(:,i) = vec;
   end
   if i > 1 % frame 2-300
       A2(:,i - 1) = vec;
   end
end

%% SVD
[u,s,v] = svd(A, 'econ');

    
%% Sigular Value Spectrum
figure(3)
plot(diag(s)/sum(diag(s)), 'ro', 'LineWidth', 2)
title('Singular Value Spectrum for Conan')
xlabel('singular values')
ylabel('% energy')
%% DMD
r=20;
[u,s,v]=svd(A1,'econ');

Ur=u(:,1:r);
Sr=s(1:r,1:r);  
Vr=v(:,1:r);

dt=0.033;
Atilde=Ur'*A2*Vr/Sr;
[W,D]=eig(Atilde);
Phi=A2*Vr/Sr*W; 

lamda=diag(D);
omega=log(lamda)/dt;
figure(4)
plot(real(Phi))
title('DMD Spectra (Kutz)')

a = A(:,100); %% Low rank reconstruction
b=Phi\a;
tdynamics = zeros(r,nFrames);
for i = 1:length(tdynamics)
    tdynamics(:,i) = (b.*exp(omega*i));  
end

A_lowrank = Phi*tdynamics;
A_Sparse = A_lowrank - abs(A(:,100));

%%
subplot(1,2,1)
imshow(frames(:,:,1), [])
title('Original Image')
subplot(1,2,2)
imshow(reshape(A_Sparse(:,1), [fHeight, fWidth]), [])
title('Foreground only')
%% svd reconstruction
% j=1;
%  for i=[1,10,50,100,200,nFrames - 1] 
%     subplot(2,3,j)
%     test = u(:,1:i) * s(1:i, 1:i) * v(:,1:i).';
%     test = uint8(test(:,100));
%     imshow(reshape(test,[fHeight,fWidth]))
%     title("SVD Reconstruction (first " + num2str(i) + " POMs)")
%     set(gca, 'fontsize', 10)
%     j=j+1;
%  end
%  %% dmd reconstruction
%  figure(2) 
%  j=1;
%  for i=[1,10,50,100,200,nFrames]
%     subplot(2,3,j)
%     test = uint8(A_Sparse(:,1));
%     imshow(reshape(test,[fHeight,fWidth]))
%     title("Sparse: " + num2str(i))
%     j=j+1;
%  end
%  
%  figure(4)
%  j=1;
%  for i=[1,10,50,100,200,nFrames]
%     subplot(2,3,j)
%     test = uint8(A_lowrank(:,i));
%     imshow(reshape(test,[fHeight,fWidth]))
%     title("Low-Rank: " + num2str(i))
%     j=j+1;
%  end
 
 %%
 
 sparseFrames = frames;
 for i=1:nFrames
     sparseFrames(:,:,i) = reshape(A_Sparse(:,i), fHeight, fWidth);
 end
 
 %%
 for i = 1:nFrames
     imshow(real(sparseFrames(:,:,i)), [])
 end