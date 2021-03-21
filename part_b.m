angles = 179*rand(1, 18);
brain_slice = imread('slice_50.png');

padded_img = idct2(dct2(brain_slice, [220 220]));

y = reshape(radon(padded_img, angles), [], 1);
A = partialA(angles);
m = 5670;
n = 48400;

lambda = 1; % regularization parameter
rel_tol = 1; % relative target duality gap

[x,status] = l1_ls(A,A',m,n,y,lambda,rel_tol);
recons_slice = uint8(idct2(reshape(x, [220 220])));
figure
imshow(recons_slice)
