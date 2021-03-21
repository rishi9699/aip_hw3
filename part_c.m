angles1 = 179*rand(1, 18);
angles2 = 179*rand(1, 18);

brain_slice1 = imread('slice_50.png');
brain_slice2 = imread('slice_51.png');

padded_img1 = idct2(dct2(brain_slice1, [220 220]));
padded_img2 = idct2(dct2(brain_slice2, [220 220]));

y1 = reshape(radon(padded_img1, angles1), [], 1);
y2 = reshape(radon(padded_img2, angles2), [], 1);

y=[y1;y2];

A = A_CS2(angles1, angles2);
At = At_CS2(angles1, angles2);

m = 5670*2;
n = 48400*2;

lambda = 2; % regularization parameter
rel_tol = 3; % relative target duality gap

[x,status] = l1_ls(A,At,m,n,y,lambda,rel_tol);

imshow(uint8(idct2(reshape(x(1:48400), [220 220]))))
figure
imshow(uint8(idct2(reshape(x(48401:2*48400) + x(1:48400) , [220 220]))))
