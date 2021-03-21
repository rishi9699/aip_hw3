angles = 179*rand(1, 18);
brain_slice = imread('slice_50.png');

R = radon(brain_slice, angles);
recons_brain_slice = iradon(R, angles);
figure
imshow(uint8(recons_brain_slice))
